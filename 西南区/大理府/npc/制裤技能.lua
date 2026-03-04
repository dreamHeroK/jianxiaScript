-- =========================================
-- File : 西南区，大理，制裤技能.lua
-- Name : 紫鹃姑娘
-- ID   : 1, 9
-- =========================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
--定义常量及预处理
nGen 				= 1			-- 生活主技能参数
nSkillId 				= 9			-- 生活主技能ID
LEV_LEARNRECIPE			= 144		-- 配方学习任务变量
FORGETMAIN_NUM		= 1940		-- 遗忘主技能次数
nPay					= {10,20,30,50}		-- 遗忘主技能消耗金

strName = "";
strTitle = "";

function main()
--	 if GetAntiEnthrallmentStatus() > 1 then
--	 	Talk(1,"","你已经玩了5个小时了，请休息一下以保持健康！")
--	 	return
--	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>："
	if IsGatherSystemOpen() ~= 1 then
		Talk(1,"",strTitle.."本人已失业……");
		return 0;
	end	
	local selTab = {};
	local szTitle = ""--

	local szTitle = format("%s我平生致力于下装织造的研究，你需要什么帮助？", strTitle)

	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		tinsert(selTab,"进阶大师级缝纫技能/update_max_skill_level");
		tinsert(selTab,"学习缝纫配方或配方任务/luaLearnRecipe");
		tinsert(selTab, format("稀有生活技能道具商店/#show_equip_shop(%d)", 138));
		tinsert(selTab,"我要了解采集的相关事情/Info");
		tinsert(selTab,"遗忘缝纫技能/forget_life_skill");
	else
		tinsert(selTab,"学习缝纫技能/luaLearnLifeSkill");
		tinsert(selTab,"我要了解采集的相关事情/Info");
	end

	tinsert(selTab,"了解生活技能/lifeskill_Info");
	tinsert(selTab,"离开/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

-- 遗忘生活技能
function forget_life_skill()
	local nGene, nSkill = GetMainLifeSkill()
	if (nGene == nGen and nSkill == nSkillId) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
		local nShouldPay = nPay[4]
		if (nForgetTimes == 0) then
			nShouldPay =  nPay[1]
		elseif (nForgetTimes == 1) then
			nShouldPay = nPay[2]
		elseif (nForgetTimes == 2) then
			nShouldPay = nPay[3]
		end
	
		Say(strTitle.."尽忘所学此技能，遗忘所有配方，并花费"..nShouldPay.."金，您确定要遗忘此技能？",
			2,
			"是，我心意已决。/forget_now",
			"不，我还要再想想。/exit_dialog")
	else
		Talk(1,"", strTitle.."你还没有学习<color=yellow>缝纫<color>技能！")
	end
end;

function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
	local nShouldPay = nPay[4]
	if (nForgetTimes == 0) then
		nShouldPay = nPay[1]
	elseif (nForgetTimes == 1) then
		nShouldPay = nPay[2]
	elseif (nForgetTimes == 2) then
		nShouldPay = nPay[3]
	end
	local nShouldPayMoney = nShouldPay * 10000
	
	local nGene, nSkill = GetMainLifeSkill()
	if (nGene == nGen and nSkill == nSkillId) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(nGen, nSkillId)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				Msg2Player("你缝纫技能已经遗忘了！")	
			end
		else
			Talk(1,"", strTitle.."你身上的钱不足！")
		end
	end
end;

--技能学习选择
function luaLearnLifeSkill()
	if (GetLevel() < 20) then
		Talk(1,"", strTitle.."请大侠20级之后再来吧！")
		return
	end

	local nMax = 2
	if  (GetLifeSkillLevel(1, 7) > 0) then
		nMax = 3
	end

	if (GetLifeSkillsNum(1) >= nMax) then
		Talk(1,"", strTitle.."你已经学习了其他生产技能，暂时不能学习[缝纫]技能。你可以遗忘技能或者使用新的<color=yellow>生活手札<color>取下你已经学习过的生产技能！")
		return
	end
   
	Say(strTitle.."<color=yellow>缝纫<color>将会成为你新的一个生活技能，你确定学习吗？",
    	2,
    	"是的，我要学/LearnYes",
    	"让我再考虑考虑/LearnNo")
end

--学习技能
function LearnYes()
	if LearnLifeSkill(nGen, nSkillId, 1, 79, 1) then
		Talk(1,"", strTitle.."已经学会了[缝纫]技能。")
	end	    
	AddRecipe(321)
	Msg2Player("你学会了新配方：侠少布装")
	AddRecipe(322)
	Msg2Player("你学会了新配方：远足装")
	AddRecipe(323)
	Msg2Player("你学会了新配方：狼皮装")
	AddRecipe(324)
    Msg2Player("你学会了新配方：如意装")
	AddRecipe(325)
    Msg2Player("你学会了新配方：虎皮装")
	AddRecipe(326)
    Msg2Player("你学会了新配方：轻甲装")
	AddRecipe(339)
    Msg2Player("你学会了新配方：侠少装")
	AddRecipe(340)
    Msg2Player("你学会了新配方：回风装")
	AddRecipe(341)
    Msg2Player("你学会了新配方：莽牛装")
	AddRecipe(342)
    Msg2Player("你学会了新配方：金丝装")
	AddRecipe(343)
    Msg2Player("你学会了新配方：豪勇装")
	AddRecipe(344)
    Msg2Player("你学会了新配方：金缕装")
	AddRecipe(357)
    Msg2Player("你学会了新配方：彩绣装")
	AddRecipe(358)
    Msg2Player("你学会了新配方：胡姬绣装")
	AddRecipe(359)
    Msg2Player("你学会了新配方：黑绒绣装")
	AddRecipe(360)
    Msg2Player("你学会了新配方：碧云绣装")
	AddRecipe(361)
    Msg2Player("你学会了新配方：武炼绣装")
	AddRecipe(362)
    Msg2Player("你学会了新配方：火浣绣装")
	AddRecipe(375)
    Msg2Player("你学会了新配方：浅草绣装")
	AddRecipe(376)
    Msg2Player("你学会了新配方：紫霞绣装")
	AddRecipe(377)
    Msg2Player("你学会了新配方：风尘绣装")
	AddRecipe(378)
    Msg2Player("你学会了新配方：灵运绣装")
	AddRecipe(379)
    Msg2Player("你学会了新配方：飞红绣装")
	AddRecipe(380)
    Msg2Player("你学会了新配方：风雨绣装")		
	AddRecipe(327)
    Msg2Player("你学会了新配方：夜行装")
	AddRecipe(328)
    Msg2Player("你学会了新配方：火翔装")
	AddRecipe(345)
    Msg2Player("你学会了新配方：游侠装")
	AddRecipe(346)
    Msg2Player("你学会了新配方：虎皮劲装")
	AddRecipe(363)
    Msg2Player("你学会了新配方：炼甲绣装")
	AddRecipe(364)
    Msg2Player("你学会了新配方：狮蛮绣装")
	AddRecipe(381)
    Msg2Player("你学会了新配方：陷阵绣装")
	AddRecipe(382)
    Msg2Player("你学会了新配方：碧湖绣装")
	AddRecipe(329)
    Msg2Player("你学会了新配方：赤鳞装")
	AddRecipe(330)
    Msg2Player("你学会了新配方：如意装")
	AddRecipe(347)
    Msg2Player("你学会了新配方：锦澜装")			
	AddRecipe(348)
    Msg2Player("你学会了新配方：青霜装")
	AddRecipe(365)
    Msg2Player("你学会了新配方：锦樱绣装")
	AddRecipe(366)
    Msg2Player("你学会了新配方：云霞绣装")
	AddRecipe(383)
    Msg2Player("你学会了新配方：天蚕绣装")
	AddRecipe(384)
    Msg2Player("你学会了新配方：绮罗绣装")		
	SetTask(LEV_LEARNRECIPE, 10)
end

--取消学习技能
function LearnNo()
	Say (strTitle.."想清楚再来吧，我就不送了。", 0)
end



--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(nGen, nSkillId)
	if (nLevel >= 1 and nLevel < 99) then 		
		if (nLevel >= 0 and GetTask(LEV_LEARNRECIPE) == 0) then	    
	Msg2Player("你学会了新配方：侠少布装")
	AddRecipe(322)
	Msg2Player("你学会了新配方：远足装")
	AddRecipe(323)
	Msg2Player("你学会了新配方：狼皮装")
	AddRecipe(324)
    Msg2Player("你学会了新配方：如意装")
	AddRecipe(325)
    Msg2Player("你学会了新配方：虎皮装")
	AddRecipe(326)
    Msg2Player("你学会了新配方：轻甲装")
	AddRecipe(339)
    Msg2Player("你学会了新配方：侠少装")
	AddRecipe(340)
    Msg2Player("你学会了新配方：回风装")
	AddRecipe(341)
    Msg2Player("你学会了新配方：莽牛装")
	AddRecipe(342)
    Msg2Player("你学会了新配方：金丝装")
	AddRecipe(343)
    Msg2Player("你学会了新配方：豪勇装")
	AddRecipe(344)
    Msg2Player("你学会了新配方：金缕装")
	AddRecipe(357)
    Msg2Player("你学会了新配方：彩绣装")
	AddRecipe(358)
    Msg2Player("你学会了新配方：胡姬绣装")
	AddRecipe(359)
    Msg2Player("你学会了新配方：黑绒绣装")
	AddRecipe(360)
    Msg2Player("你学会了新配方：碧云绣装")
	AddRecipe(361)
    Msg2Player("你学会了新配方：武炼绣装")
	AddRecipe(362)
    Msg2Player("你学会了新配方：火浣绣装")
	AddRecipe(375)
    Msg2Player("你学会了新配方：浅草绣装")
	AddRecipe(376)
    Msg2Player("你学会了新配方：紫霞绣装")
	AddRecipe(377)
    Msg2Player("你学会了新配方：风尘绣装")
	AddRecipe(378)
    Msg2Player("你学会了新配方：灵运绣装")
	AddRecipe(379)
    Msg2Player("你学会了新配方：飞红绣装")
	AddRecipe(380)
    Msg2Player("你学会了新配方：风雨绣装")		
	AddRecipe(327)
    Msg2Player("你学会了新配方：夜行装")
	AddRecipe(328)
    Msg2Player("你学会了新配方：火翔装")
	AddRecipe(345)
    Msg2Player("你学会了新配方：游侠装")
	AddRecipe(346)
    Msg2Player("你学会了新配方：虎皮劲装")
	AddRecipe(363)
    Msg2Player("你学会了新配方：炼甲绣装")
	AddRecipe(364)
    Msg2Player("你学会了新配方：狮蛮绣装")
	AddRecipe(381)
    Msg2Player("你学会了新配方：陷阵绣装")
	AddRecipe(382)
    Msg2Player("你学会了新配方：碧湖绣装")
	AddRecipe(329)
    Msg2Player("你学会了新配方：赤鳞装")
	AddRecipe(330)
    Msg2Player("你学会了新配方：如意装")
	AddRecipe(347)
    Msg2Player("你学会了新配方：锦澜装")			
	AddRecipe(348)
    Msg2Player("你学会了新配方：青霜装")
	AddRecipe(365)
    Msg2Player("你学会了新配方：锦樱绣装")
	AddRecipe(366)
    Msg2Player("你学会了新配方：云霞绣装")
	AddRecipe(383)
    Msg2Player("你学会了新配方：天蚕绣装")
	AddRecipe(384)
    Msg2Player("你学会了新配方：绮罗绣装")
			SetTask(LEV_LEARNRECIPE, 10)								-- 初级
			Msg2Player("你学会了缝纫技能所有初级配方")
			return
		elseif (nLevel >= 0 and  nLevel < 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			Say(format("%s你已经学会了初级配方了，继续提高生活技能等级进阶中级缝纫技能了。", strTitle), 0)
			return 
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(331)
			Msg2Player("你学会了新配方：龙皮装")
			AddRecipe(332)
			Msg2Player("你学会了新配方：幻影装")
			AddRecipe(349)
			Msg2Player("你学会了新配方：天风装")
			AddRecipe(350)
			Msg2Player("你学会了新配方：秘隐装")			
			AddRecipe(367)
			Msg2Player("你学会了新配方：璇金甲装")
			AddRecipe(368)
			Msg2Player("你学会了新配方：红云绣装")
			AddRecipe(385)
			Msg2Player("你学会了新配方：武神绣装")
			AddRecipe(386)
			Msg2Player("你学会了新配方：玲珑绣装")						
			AddRecipe(333)
			Msg2Player("你学会了新配方：天狼装")
			AddRecipe(334)
			Msg2Player("你学会了新配方：飞鱼装")			
			AddRecipe(351)
			Msg2Player("你学会了新配方：神策装")
			AddRecipe(352)
			Msg2Player("你学会了新配方：天雷装")
			AddRecipe(369)
			Msg2Player("你学会了新配方：雷神")
			AddRecipe(370)
			Msg2Player("你学会了新配方：天马")				
			AddRecipe(387)
			Msg2Player("你学会了新配方：百战")
			AddRecipe(388)
			Msg2Player("你学会了新配方：神女")			
			SetTask(LEV_LEARNRECIPE, 50)								-- 中级
			Msg2Player("你学会了缝纫技能所有中级配方")
			return
		elseif (nLevel >= 30 and  nLevel < 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			Say(format("%s你已经学会了中级配方了，继续提高生活技能等级进阶高级缝纫技能了。", strTitle), 0)
			return
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(335)
			Msg2Player("你学会了新配方：青云装")
			AddRecipe(336)
			Msg2Player("你学会了新配方：碧鳞装")
			AddRecipe(337)
			Msg2Player("你学会了新配方：杀劫装")
			AddRecipe(353)
			Msg2Player("你学会了新配方：柔钢装")
			AddRecipe(354)
			Msg2Player("你学会了新配方：狂炎装")
			AddRecipe(355)
			Msg2Player("你学会了新配方：血河装")
			AddRecipe(371)
			Msg2Player("你学会了新配方：破阵")
			AddRecipe(372)
			Msg2Player("你学会了新配方：拂云")
			AddRecipe(373)
			Msg2Player("你学会了新配方：虎啸")
			AddRecipe(389)
			Msg2Player("你学会了新配方：雨铃")
			AddRecipe(390)
			Msg2Player("你学会了新配方：散花")	
			AddRecipe(391)
			Msg2Player("你学会了新配方：红玉")
			AddRecipe(338)
			Msg2Player("你学会了新配方：乌蚕装")
			AddRecipe(356)
			Msg2Player("你学会了新配方：天罡装")
			AddRecipe(374)
			Msg2Player("你学会了新配方：太清")
			AddRecipe(392)
			Msg2Player("你学会了新配方：出云")	
			SetTask(LEV_LEARNRECIPE, 80)								-- 高级
			Msg2Player("你学会了缝纫技能所有高配方")
			return
		elseif (nLevel >= 50 and  nLevel <= 79 and GetTask(LEV_LEARNRECIPE) == 80) then
			Say(format("%s你已经学会了高级配方了，继续提高生活技能进阶大师级缝纫技能了。", strTitle), 0)
			return
		else
			Say(format("%s年轻人，不要心急嘛，你目前资质尚浅，等你生活技能等级提高了再来找我学习新配方吧。", strTitle), 0)
			return
		end
	elseif (nLevel >= 99) then
		Talk(1,"", strTitle.."您已进阶大师级缝纫技能水平，不用再找我了！")
		return
	else 
		Talk(1,"", strTitle.."年轻人，不要心急嘛，你目前资质尚浅，等你生活技能等级提高了再来找我学习新配方吧。")
	end
end;



function update_max_skill_level()
	if (GetLevel() < 90) then
		Talk(1,"", strTitle.."角色等级不足，先去江湖历练一番，再来领会。")
		return
	end
	if GetLifeSkillMaxLevel(nGen, nSkillId) > 79 and GetTask(LEV_LEARNRECIPE) == 99  then
		Talk(1,"", strTitle.."您已进阶大师级缝纫技能水平，不用再找我了！")
		return
	end
	local selTab = {};
	local szTitle = format("%s进阶大师级缝纫技能要求缝纫技能达到79级并消耗%d金，你确定要进阶吗？", strTitle, 1000)
	tinsert(selTab,"同意/update_max_skill_level_ensure");
	tinsert(selTab,"我再看看/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("%s目前缝纫技能小于%d级，先去历练一番，再来领会。！", strTitle, 79))
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Talk(1,"", format("%s你的银两不足%d金", strTitle, 1000))
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	AddRecipe(1061)
	Msg2Player("你学会了新配方：楚歌(外)")
	AddRecipe(1062)
	Msg2Player("你学会了新配方：擎苍(外)")
	AddRecipe(1063)
	Msg2Player("你学会了新配方：寒渡(外)")
	AddRecipe(1064)
	Msg2Player("你学会了新配方：扶翠(外)")
	AddRecipe(1085)
	Msg2Player("你学会了新配方：定墨(内))")
	AddRecipe(1086)
	Msg2Player("你学会了新配方：腾玉(内)")
	AddRecipe(1087)
	Msg2Player("你学会了新配方：星岚(内)")
	AddRecipe(1088)
	Msg2Player("你学会了新配方：雨幕(内)")
	AddRecipe(1073)
	Msg2Player("你学会了新配方：逝云")
	AddRecipe(1074)
	Msg2Player("你学会了新配方：悬霄")
	AddRecipe(1075)
	Msg2Player("你学会了新配方：夜歌")
	AddRecipe(1076)
	Msg2Player("你学会了新配方：溪云")	
--	AddRecipe(260)
--	Msg2Player("你学会了新配方：翡翠锦囊")
--	for i = 261, 470 do
--		AddRecipe(i)
--	end
--	Msg2Player("你学会了新配方：师门六套头冠")
--	Msg2Player("你学会了新配方：师门六套上衣")
--	Msg2Player("你学会了新配方：师门六套下衣")
	Msg2Player("恭喜您进阶大师级缝纫技能水平！");
	SetTask(LEV_LEARNRECIPE, 99)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

-- 介绍相关信息
function Info()
	Say(strTitle.."世道艰辛，如今只能雇佣专人乘集。需要使士先学会采集技能，才能雇佣采集。只要技能等级提升，便可往腹地不断深，禁得更丰富的产物。\n    不同等级因远近不同，需要采集的时间也不一样，使士只需要在时间到后前来收取即可。", 0);
end;

-- 介绍生活技能
function lifeskill_Info()
	Say(strTitle.."学习对应的采集和制造技能，通过雇佣采集和制造积累经验，采集和制作更高级的生活物品。共有初级、中级、高级和大师级四个阶段，每个技能皆可学习，但采集和制造分别只能选择其中一种升至大师级。目前开放的采集类生活技能有：采药、伐木、采矿、桑耕、狩猎、钓鱼，制造类生活技能有：制药、烹饪、锻造、缝纫、天工、刺绣。", 0);
end;


--空函数
function exit_dialog()	
end