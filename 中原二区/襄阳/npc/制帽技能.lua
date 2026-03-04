-- =========================================
-- File : 中原二区，襄阳，制帽技能.lua
-- Name : 明师傅
-- ID   : 1, 4
-- =========================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
--定义常量及预处理
nGen 				= 1			-- 生活主技能参数
nSkillId 				= 10			-- 生活主技能ID
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

	local szTitle = format("%s我平生致力于头冠制造的研究，你需要什么帮助？", strTitle)

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
	AddRecipe(249)
	Msg2Player("你学会了新配方：侠少头巾")
	AddRecipe(250)
	Msg2Player("你学会了新配方：风雨巾")
	AddRecipe(251)
	Msg2Player("你学会了新配方：英雄巾")
	AddRecipe(252)
    Msg2Player("你学会了新配方：锦布发带")
	AddRecipe(253)
    Msg2Player("你学会了新配方：满月笠")
	AddRecipe(254)
    Msg2Player("你学会了新配方：金风冠")
	AddRecipe(267)
    Msg2Player("你学会了新配方：侠少头带")
	AddRecipe(268)
    Msg2Player("你学会了新配方：黑锦头带")
	AddRecipe(269)
    Msg2Player("你学会了新配方：牛皮头巾")
	AddRecipe(270)
    Msg2Player("你学会了新配方：金绦发带")
	AddRecipe(271)
    Msg2Player("你学会了新配方：武胜纱帽")
	AddRecipe(272)
    Msg2Player("你学会了新配方：黄绸束带")
	AddRecipe(285)
    Msg2Player("你学会了新配方：桃木发簪")
	AddRecipe(286)
    Msg2Player("你学会了新配方：彩木发簪")
	AddRecipe(287)
    Msg2Player("你学会了新配方：防风笠")
	AddRecipe(288)
    Msg2Player("你学会了新配方：辟水笠")
	AddRecipe(289)
    Msg2Player("你学会了新配方：青铜发结")
	AddRecipe(290)
    Msg2Player("你学会了新配方：珊瑚簪")
	AddRecipe(303)
    Msg2Player("你学会了新配方：桃木簪")
	AddRecipe(304)
    Msg2Player("你学会了新配方：彩纹木簪")
	AddRecipe(305)
    Msg2Player("你学会了新配方：木齿束发")
	AddRecipe(306)
    Msg2Player("你学会了新配方：银铃簪")
	AddRecipe(307)
    Msg2Player("你学会了新配方：鬼面束发")
	AddRecipe(308)
    Msg2Player("你学会了新配方：青蓝发带")		
	AddRecipe(255)
    Msg2Player("你学会了新配方：蒙面巾")
	AddRecipe(256)
    Msg2Player("你学会了新配方：华阳巾")
	AddRecipe(273)
    Msg2Player("你学会了新配方：神木发带")
	AddRecipe(274)
    Msg2Player("你学会了新配方：弱水笠")
	AddRecipe(291)
    Msg2Player("你学会了新配方：磐石发结")
	AddRecipe(292)
    Msg2Player("你学会了新配方：孔雀簪")
	AddRecipe(309)
    Msg2Player("你学会了新配方：蓝蝶束发")
	AddRecipe(310)
    Msg2Player("你学会了新配方：白虹簪")
	AddRecipe(257)
    Msg2Player("你学会了新配方：铁线笠")
	AddRecipe(258)
    Msg2Player("你学会了新配方：逸隐冠")
	AddRecipe(275)
    Msg2Player("你学会了新配方：朱雀束带")			
	AddRecipe(276)
    Msg2Player("你学会了新配方：海神发结")
	AddRecipe(293)
    Msg2Player("你学会了新配方：朱雀发结")
	AddRecipe(294)
    Msg2Player("你学会了新配方：腾蛇发簪")
	AddRecipe(311)
    Msg2Player("你学会了新配方：千机束额")
	AddRecipe(312)
    Msg2Player("你学会了新配方：天罗钗")		
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
	AddRecipe(249)
	Msg2Player("你学会了新配方：侠少头巾")
	AddRecipe(250)
	Msg2Player("你学会了新配方：风雨巾")
	AddRecipe(251)
	Msg2Player("你学会了新配方：英雄巾")
	AddRecipe(252)
    Msg2Player("你学会了新配方：锦布发带")
	AddRecipe(253)
    Msg2Player("你学会了新配方：满月笠")
	AddRecipe(254)
    Msg2Player("你学会了新配方：金风冠")
	AddRecipe(267)
    Msg2Player("你学会了新配方：侠少头带")
	AddRecipe(268)
    Msg2Player("你学会了新配方：黑锦头带")
	AddRecipe(269)
    Msg2Player("你学会了新配方：牛皮头巾")
	AddRecipe(270)
    Msg2Player("你学会了新配方：金绦发带")
	AddRecipe(271)
    Msg2Player("你学会了新配方：武胜纱帽")
	AddRecipe(272)
    Msg2Player("你学会了新配方：黄绸束带")
	AddRecipe(285)
    Msg2Player("你学会了新配方：桃木发簪")
	AddRecipe(286)
    Msg2Player("你学会了新配方：彩木发簪")
	AddRecipe(287)
    Msg2Player("你学会了新配方：防风笠")
	AddRecipe(288)
    Msg2Player("你学会了新配方：辟水笠")
	AddRecipe(289)
    Msg2Player("你学会了新配方：青铜发结")
	AddRecipe(290)
    Msg2Player("你学会了新配方：珊瑚簪")
	AddRecipe(303)
    Msg2Player("你学会了新配方：桃木簪")
	AddRecipe(304)
    Msg2Player("你学会了新配方：彩纹木簪")
	AddRecipe(305)
    Msg2Player("你学会了新配方：木齿束发")
	AddRecipe(306)
    Msg2Player("你学会了新配方：银铃簪")
	AddRecipe(307)
    Msg2Player("你学会了新配方：鬼面束发")
	AddRecipe(308)
    Msg2Player("你学会了新配方：青蓝发带")		
	AddRecipe(255)
    Msg2Player("你学会了新配方：蒙面巾")
	AddRecipe(256)
    Msg2Player("你学会了新配方：华阳巾")
	AddRecipe(273)
    Msg2Player("你学会了新配方：神木发带")
	AddRecipe(274)
    Msg2Player("你学会了新配方：弱水笠")
	AddRecipe(291)
    Msg2Player("你学会了新配方：磐石发结")
	AddRecipe(292)
    Msg2Player("你学会了新配方：孔雀簪")
	AddRecipe(309)
    Msg2Player("你学会了新配方：蓝蝶束发")
	AddRecipe(310)
    Msg2Player("你学会了新配方：白虹簪")
	AddRecipe(257)
    Msg2Player("你学会了新配方：铁线笠")
	AddRecipe(258)
    Msg2Player("你学会了新配方：逸隐冠")
	AddRecipe(275)
    Msg2Player("你学会了新配方：朱雀束带")			
	AddRecipe(276)
    Msg2Player("你学会了新配方：海神发结")
	AddRecipe(293)
    Msg2Player("你学会了新配方：朱雀发结")
	AddRecipe(294)
    Msg2Player("你学会了新配方：腾蛇发簪")
	AddRecipe(311)
    Msg2Player("你学会了新配方：千机束额")
	AddRecipe(312)
    Msg2Player("你学会了新配方：天罗钗")	
			SetTask(LEV_LEARNRECIPE, 10)								-- 初级
			Msg2Player("你学会了缝纫技能所有初级配方")
			return
		elseif (nLevel >= 0 and  nLevel < 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			Say(format("%s你已经学会了初级配方了，继续提高生活技能等级进阶中级缝纫技能了。", strTitle), 0)
			return 
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(259)
			Msg2Player("你学会了新配方：红绫面巾")
			AddRecipe(260)
			Msg2Player("你学会了新配方：行云束带")
			AddRecipe(277)
			Msg2Player("你学会了新配方：定国紫染带")
			AddRecipe(278)
			Msg2Player("你学会了新配方：秘忍面罩")			
			AddRecipe(295)
			Msg2Player("你学会了新配方：冥蝶发结")
			AddRecipe(296)
			Msg2Player("你学会了新配方：金凤簪")
			AddRecipe(313)
			Msg2Player("你学会了新配方：天风束额")
			AddRecipe(314)
			Msg2Player("你学会了新配方：云梦钗")						
			AddRecipe(261)
			Msg2Player("你学会了新配方：青纱眼罩")
			AddRecipe(262)
			Msg2Player("你学会了新配方：赤蜻眼罩")			
			AddRecipe(279)
			Msg2Player("你学会了新配方：神策金盔")
			AddRecipe(280)
			Msg2Player("你学会了新配方：五鬼头巾")
			AddRecipe(297)
			Msg2Player("你学会了新配方：地杰")
			AddRecipe(298)
			Msg2Player("你学会了新配方：夺魂")				
			AddRecipe(315)
			Msg2Player("你学会了新配方：飞鸟")
			AddRecipe(316)
			Msg2Player("你学会了新配方：夺魂")			
			SetTask(LEV_LEARNRECIPE, 50)								-- 中级
			Msg2Player("你学会了缝纫技能所有中级配方")
			return
		elseif (nLevel >= 30 and  nLevel < 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			Say(format("%s你已经学会了中级配方了，继续提高生活技能等级进阶高级缝纫技能了。", strTitle), 0)
			return
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(263)
			Msg2Player("你学会了新配方：飞云笠")
			AddRecipe(264)
			Msg2Player("你学会了新配方：绝玉冠")
			AddRecipe(265)
			Msg2Player("你学会了新配方：山鬼面具")
			AddRecipe(281)
			Msg2Player("你学会了新配方：精钢战盔")
			AddRecipe(282)
			Msg2Player("你学会了新配方：雷池面具")
			AddRecipe(283)
			Msg2Player("你学会了新配方：钟馗面具")
			AddRecipe(299)
			Msg2Player("你学会了新配方：日冕")
			AddRecipe(300)
			Msg2Player("你学会了新配方：神乌")
			AddRecipe(301)
			Msg2Player("你学会了新配方：修罗")
			AddRecipe(317)
			Msg2Player("你学会了新配方：宝象")
			AddRecipe(318)
			Msg2Player("你学会了新配方：风雷")	
			AddRecipe(319)
			Msg2Player("你学会了新配方：巫咸")
			AddRecipe(266)
			Msg2Player("你学会了新配方：秘神冠")
			AddRecipe(284)
			Msg2Player("你学会了新配方：异神头巾")
			AddRecipe(302)
			Msg2Player("你学会了新配方：朱雀")
			AddRecipe(320)
			Msg2Player("你学会了新配方：长生")	
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
	AddRecipe(1053)
	Msg2Player("你学会了新配方：百战(外)")
	AddRecipe(1054)
	Msg2Player("你学会了新配方：乌磐(外)")
	AddRecipe(1055)
	Msg2Player("你学会了新配方：翩雪(外)")
	AddRecipe(1056)
	Msg2Player("你学会了新配方：画熏(外)")
	AddRecipe(1077)
	Msg2Player("你学会了新配方：玄羽(内)")
	AddRecipe(1078)
	Msg2Player("你学会了新配方：九婴(内)")
	AddRecipe(1079)
	Msg2Player("你学会了新配方：烟萝(内)")
	AddRecipe(1080)
	Msg2Player("你学会了新配方：嫣花(内)")
	AddRecipe(1065)
	Msg2Player("你学会了新配方：陆离")
	AddRecipe(1066)
	Msg2Player("你学会了新配方：蜀鬼")
	AddRecipe(1067)
	Msg2Player("你学会了新配方：黯月")
	AddRecipe(1068)
	Msg2Player("你学会了新配方：赋雨")	
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