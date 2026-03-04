-- =====================================================
-- File : 药品npc对话脚本的头文件
-- Desc : 一些通用的函数
-- Creator : Tony(Jizheng)
-- =====================================================

-- 传入3个参数，生活技能的大类，ID，还有生活技能的等级
-- 返回一个参数，1表示玩家有学这个生活技能，而且等级达到要求，0表示不达要求。
function check_dig_condition(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)

	strTab = {"伐木", "狩猎", "桑耕", "采药", "挖矿", "钓鱼", "集灵"}
	
	local nRet = 0
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	
	if (nCurLifeSkillLevel == 0) then
		Say("等你学习了"..strTab[nLifeSkillID].."再回来！", 0)
	elseif (nCurLifeSkillLevel < nLifeSkillLevel) then
		Say("你的"..strTab[nLifeSkillID].."（技能）还不够"..nLifeSkillLevel.."，让我们先升级技能吧！", 0)
	else
		nRet = 1
	end
	
	return nRet
end;

-- 传入3个参数，生活技能的大类，ID，还有采集物品的最高等级
-- 返回一个参数，表示玩家采集了这个物品，能得到的经验倍数
function get_dig_multi_count(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)
	local nRet = 1
	
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	if (nCurLifeSkillLevel <= nLifeSkillLevel) then
		nRet = 8
	elseif (nCurLifeSkillLevel - nLifeSkillLevel <= 10) then
		nRet = 4
	end
	
	return nRet
end;

