--补偿修复玩家镇派技能等级异常问题
--转生设置角色等级小于85级 导致镇派秘籍不能起作用 导致角色镇派技能等级异常
--我方目前暂定的修改方案为：
--1.修复秘籍不起作用的情况下 镇派技能等级异常的问题
--2.增加一个Npc功能 通过npc对话 自动将已经异常的角色镇派技能等级设置为10级（要求玩家脱下镇派秘籍）
--自动设置的判断条件为：a.玩家已经是4转或4转以上
--b.玩家镇派技能不满10级
--该NPC功能时限设置为7天 7天之后该功能无效



Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
t_zhenpai_skill = --镇派技能
{
	[2] = 32, --少林俗家
	[3] = 57,--少林禅宗
	[4] = 44,--少林武宗
	[6] = 74,--唐门
	[8] = 89,--峨嵋佛家
	[9] = 102,--峨嵋俗家
	[11] = 113,--丐帮净衣
	[12] = 124,--丐帮污衣
	[14] = 146,--武当道家
	[15] = 159,--武当俗家
	[17] = 732,--杨门枪骑
	[18] = 745,--杨门弓骑
	[20] = 775,--五毒邪侠
	[21] = 774,--五毒蛊师
}

function OnNpcTalkRepairGreatSkill()
	local nDate = tonumber(date("%Y%m%d"))
	if not (nDate >= 20130418 and nDate <= 20130511) then -- 不在补偿期
		Talk(1, "", "很抱歉，您不在特定的补偿期限内")
		return
	end
	
	local szTitle = "您可以选择重置功法：重置成四转离间，不消耗属性点"
	local tbSay = {}
	tinsert(tbSay, format("%s/_On_Repair", "进行重置功法补偿"))
	tinsert(tbSay, "暂时不需要")
	Say(szTitle, getn(tbSay), tbSay)
end

function _On_Repair()
	local nSkillId = t_zhenpai_skill[GetPlayerRoute()]
	if not nSkillId then -- 流派异常
		Talk(1, "", "很抱歉，您的流派异常，无法进行修复！")
		return
	end
	if GetTranslifeCount() < 4 and GetPlayerRebornParam(0) < 1 then
		Talk(1, "", "很抱歉，您的转生次数不足四转，无法进行修复！！")
		return
	end
	if GetPlayerEquipIndex(9) ~= 0 then -- 副秘籍位置有装备
		Talk(1, "", "很抱歉，您的副秘籍位置已经有装备，无法进行修复！！！")
		return
	end
	
	if GetSkillLevel(nSkillId) >= 10 then -- 技能正常
		Talk(1, "", "很抱歉，您的功法已经修复完毕！！！！")
		return
	end
	
	local nOldSkillLv = GetSkillLevel(nSkillId) or 0
	
	-- 执行修复操作
	if nOldSkillLv <= 0 then
		LearnSkill(nSkillId)
	end
	local nSkillNewLv = GetSkillLevel(nSkillId) or 0
	while nSkillNewLv < 10 do
		local nSkillLvBfUp = GetSkillLevel(nSkillId) or 0
		if LevelUpSkill(nSkillId) ~= 1 then
			Talk(1, "", "很抱歉，修复功法失败")
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail", 1, "Fix fail")
			break
		end
		nSkillNewLv = GetSkillLevel(nSkillId) or 0
		if nSkillNewLv <= nSkillLvBfUp then
			Talk(1, "", "很抱歉，修复功法失败")
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail2", 1, "Fix fail2")
			break
		end
	end
	
	Talk(1, "", "修复功法成功！")
	local szLog = format("角色[%s] 流派[%d] 修复大招[%d] 从[%d]-->[%d] ", GetName(), GetPlayerRoute(), nSkillId, nOldSkillLv, nSkillNewLv)
	gf_WriteLogEx("repair great skill", szLog, "", "", "")
	gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update 修复成功", 1, "Fix 修复成功")
end

function no()
end

