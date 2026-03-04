-- =========================================
-- File : 中原二区，成都，锦娘.lua 护甲织造	
-- Name : 锦娘
-- ID   : 1, 5
-- =========================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
--定义常量及预处理
nGen 				= 1			-- 生活主技能参数
nSkillId 				= 5			-- 生活主技能ID
LEV_LEARNRECIPE			= 146		-- 配方学习任务变量
FORGETMAIN_NUM		= 1940		-- 遗忘主技能次数
nPay					= {10,20,30,50}		-- 遗忘主技能消耗金

strName = "";
strTitle = "";

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
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
	local szTitle = ""

	local szTitle = format("%s我就是天下闻名的锦娘，精通刺绣，你需要什么帮助？", strTitle)

	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		tinsert(selTab,"进阶大师级刺绣技能/update_max_skill_level");
		tinsert(selTab,"学习刺绣配方或配方任务/luaLearnRecipe");
		tinsert(selTab, format("稀有生活技能道具商店/#show_equip_shop(%d)", 138));
		tinsert(selTab,"我要了解采集的相关事情/Info");
		tinsert(selTab,"遗忘刺绣技能/forget_life_skill");
	else
		tinsert(selTab,"学习刺绣技能/luaLearnLifeSkill");
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
		Talk(1,"", strTitle.."你还没有学习<color=yellow>刺绣<color>技能！")
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
				Msg2Player("你刺绣技能已经遗忘了！")	
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
		Talk(1,"", strTitle.."你已经学习了其他生产技能，暂时不能学习[刺绣]技能。你可以遗忘技能或者使用新的<color=yellow>生活手札<color>取下你已经学习过的生产技能！")
		return
	end
   
	Say(strTitle.."<color=yellow>刺绣<color>将会成为你新的一个生活技能，你确定学习吗？",
    	2,
    	"是的，我要学/LearnYes",
    	"让我再考虑考虑/LearnNo")
end

--学习技能
function LearnYes()
	if LearnLifeSkill(nGen, nSkillId, 1, 79, 1) then
		Talk(1,"", strTitle.."已经学会了[刺绣]技能。")
	end
	    
	AddRecipe(143)
	Msg2Player("你学会了新配方：侠少布衣")
	AddRecipe(144)
	Msg2Player("你学会了新配方：黑皂布衣")
	AddRecipe(145)
	Msg2Player("你学会了新配方：紫衿布衣")
	AddRecipe(146)
    Msg2Player("你学会了新配方：蟠龙绣")
	AddRecipe(147)
    Msg2Player("你学会了新配方：伤狼衣")
	AddRecipe(148)
    Msg2Player("你学会了新配方：掩心甲")
	AddRecipe(149)
    Msg2Player("你学会了新配方：神行服")	
	AddRecipe(150)
    Msg2Player("你学会了新配方：青霜袍")	
	AddRecipe(151)
    Msg2Player("你学会了新配方：贪狼衣")	
	AddRecipe(152)
    Msg2Player("你学会了新配方：赤铜胄")	
	AddRecipe(161)
    Msg2Player("你学会了新配方：侠少衣")	
	AddRecipe(162)
    Msg2Player("你学会了新配方：铁护肩")		
	AddRecipe(163)
    Msg2Player("你学会了新配方：兽头护肩")	
	AddRecipe(164)
    Msg2Player("你学会了新配方：锦丝缠带")
	AddRecipe(165)
    Msg2Player("你学会了新配方：豪侠衣")	
	AddRecipe(166)
    Msg2Player("你学会了新配方：金玉绸衫")
	AddRecipe(167)
    Msg2Player("你学会了新配方：绿林装")	
	AddRecipe(168)
    Msg2Player("你学会了新配方：黄虎皮衣")
	AddRecipe(169)
    Msg2Player("你学会了新配方：神牛护甲")	
	AddRecipe(170)
    Msg2Player("你学会了新配方：紫青霜华衫")
	AddRecipe(179)
    Msg2Player("你学会了新配方：彩裳")
	AddRecipe(180)
    Msg2Player("你学会了新配方：紫菱裳")	
	AddRecipe(181)
    Msg2Player("你学会了新配方：紫绒裳")		
	AddRecipe(182)
    Msg2Player("你学会了新配方：心印裳")	
	AddRecipe(183)
    Msg2Player("你学会了新配方：武炼裳")
	AddRecipe(184)
    Msg2Player("你学会了新配方：天魔裳")
	AddRecipe(185)
    Msg2Player("你学会了新配方：炼甲裳")	
	AddRecipe(186)
    Msg2Player("你学会了新配方：浣花裳")		
	AddRecipe(187)
    Msg2Player("你学会了新配方：锦缨裳")	
	AddRecipe(188)
    Msg2Player("你学会了新配方：女杰裳")	
	AddRecipe(197)
    Msg2Player("你学会了新配方：羽裳")	
	AddRecipe(198)
    Msg2Player("你学会了新配方：红云裳")	
	AddRecipe(199)
    Msg2Player("你学会了新配方：紫劲衫")	
	AddRecipe(200)
    Msg2Player("你学会了新配方：灵运裳")	
	AddRecipe(201)
    Msg2Player("你学会了新配方：巾帼衫")	
	AddRecipe(202)
    Msg2Player("你学会了新配方：风雨裳")	
	AddRecipe(203)
    Msg2Player("你学会了新配方：密云衫")	
	AddRecipe(204)
    Msg2Player("你学会了新配方：武斗裳")	
	AddRecipe(205)
    Msg2Player("你学会了新配方：天蚕甲衣")
	AddRecipe(206)
    Msg2Player("你学会了新配方：绮罗裳")		
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
	AddRecipe(143)
	Msg2Player("你学会了新配方：侠少布衣")
	AddRecipe(144)
	Msg2Player("你学会了新配方：黑皂布衣")
	AddRecipe(145)
	Msg2Player("你学会了新配方：紫衿布衣")
	AddRecipe(146)
    Msg2Player("你学会了新配方：蟠龙绣")
	AddRecipe(147)
    Msg2Player("你学会了新配方：伤狼衣")
	AddRecipe(148)
    Msg2Player("你学会了新配方：掩心甲")
	AddRecipe(149)
    Msg2Player("你学会了新配方：神行服")	
	AddRecipe(150)
    Msg2Player("你学会了新配方：青霜袍")	
	AddRecipe(151)
    Msg2Player("你学会了新配方：贪狼衣")	
	AddRecipe(152)
    Msg2Player("你学会了新配方：赤铜胄")	
	AddRecipe(161)
    Msg2Player("你学会了新配方：侠少衣")	
	AddRecipe(162)
    Msg2Player("你学会了新配方：铁护肩")		
	AddRecipe(163)
    Msg2Player("你学会了新配方：兽头护肩")	
	AddRecipe(164)
    Msg2Player("你学会了新配方：锦丝缠带")
	AddRecipe(165)
    Msg2Player("你学会了新配方：豪侠衣")	
	AddRecipe(166)
    Msg2Player("你学会了新配方：金玉绸衫")
	AddRecipe(167)
    Msg2Player("你学会了新配方：绿林装")	
	AddRecipe(168)
    Msg2Player("你学会了新配方：黄虎皮衣")
	AddRecipe(169)
    Msg2Player("你学会了新配方：神牛护甲")	
	AddRecipe(170)
    Msg2Player("你学会了新配方：紫青霜华衫")
	AddRecipe(179)
    Msg2Player("你学会了新配方：彩裳")
	AddRecipe(180)
    Msg2Player("你学会了新配方：紫菱裳")	
	AddRecipe(181)
    Msg2Player("你学会了新配方：紫绒裳")		
	AddRecipe(182)
    Msg2Player("你学会了新配方：心印裳")	
	AddRecipe(183)
    Msg2Player("你学会了新配方：武炼裳")
	AddRecipe(184)
    Msg2Player("你学会了新配方：天魔裳")
	AddRecipe(185)
    Msg2Player("你学会了新配方：炼甲裳")	
	AddRecipe(186)
    Msg2Player("你学会了新配方：浣花裳")		
	AddRecipe(187)
    Msg2Player("你学会了新配方：锦缨裳")	
	AddRecipe(188)
    Msg2Player("你学会了新配方：女杰裳")	
	AddRecipe(197)
    Msg2Player("你学会了新配方：羽裳")	
	AddRecipe(198)
    Msg2Player("你学会了新配方：红云裳")	
	AddRecipe(199)
    Msg2Player("你学会了新配方：紫劲衫")	
	AddRecipe(200)
    Msg2Player("你学会了新配方：灵运裳")	
	AddRecipe(201)
    Msg2Player("你学会了新配方：巾帼衫")	
	AddRecipe(202)
    Msg2Player("你学会了新配方：风雨裳")	
	AddRecipe(203)
    Msg2Player("你学会了新配方：密云衫")	
	AddRecipe(204)
    Msg2Player("你学会了新配方：武斗裳")	
	AddRecipe(205)
    Msg2Player("你学会了新配方：天蚕甲衣")
	AddRecipe(206)
    Msg2Player("你学会了新配方：绮罗裳")
			SetTask(LEV_LEARNRECIPE, 10)								-- 初级
			Msg2Player("你学会了刺绣技能所有初级配方")
			return
		elseif (nLevel >= 0 and  nLevel < 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			Say(format("%s你已经学会了初级配方了，继续提高生活技能等级进阶中级刺绣技能了。", strTitle), 0)
			return 
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(153)
			Msg2Player("你学会了新配方：软金衣")		
			AddRecipe(154)
			Msg2Player("你学会了新配方：沧澜衣")			
			AddRecipe(155)
			Msg2Player("你学会了新配方：蓝鲸皮甲")		
			AddRecipe(156)
			Msg2Player("你学会了新配方：赤龙袍")	
			AddRecipe(171)
			Msg2Player("你学会了新配方：虬髯客衣")		
			AddRecipe(172)
			Msg2Player("你学会了新配方：千忍秘装")		
		    AddRecipe(173)
			Msg2Player("你学会了新配方：神策金甲")	
			AddRecipe(174)
			Msg2Player("你学会了新配方：五雷亮银甲")		
			AddRecipe(189)
			Msg2Player("你学会了新配方：青灵裳")	
		    AddRecipe(190)
			Msg2Player("你学会了新配方：红霓裳")	
			AddRecipe(191)
			Msg2Player("你学会了新配方：鳞光甲衣")		
			AddRecipe(192)
			Msg2Player("你学会了新配方：胡姬舞衣")					
			AddRecipe(207)
			Msg2Player("你学会了新配方：天工斗衣")	
		    AddRecipe(208)
			Msg2Player("你学会了新配方：玲珑裳")	
			AddRecipe(209)
			Msg2Player("你学会了新配方：兽王斗衣")		
			AddRecipe(210)
			Msg2Player("你学会了新配方：彩华裳")							

			SetTask(LEV_LEARNRECIPE, 50)								-- 中级
			Msg2Player("你学会了刺绣技能所有中级配方")
			return
		elseif (nLevel >= 30 and  nLevel < 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			Say(format("%s你已经学会了中级配方了，继续提高生活技能等级进阶高级刺绣技能了。", strTitle), 0)
			return
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(157)
			Msg2Player("你学会了新配方：天狼衣")
			AddRecipe(158)
			Msg2Player("你学会了新配方：冰蚕绸衫")
			AddRecipe(159)
			Msg2Player("你学会了新配方：山鬼血衣")
			AddRecipe(160)
			Msg2Player("你学会了新配方：天绛袍")		
			AddRecipe(175)
			Msg2Player("你学会了新配方：精钢炫金甲")			
			AddRecipe(176)
			Msg2Player("你学会了新配方：火蛛圣衫")			
			AddRecipe(177)
			Msg2Player("你学会了新配方：血河鬼王铠")			
			AddRecipe(178)
			Msg2Player("你学会了新配方：龙霸乌金衣")						
			AddRecipe(193)
			Msg2Player("你学会了新配方：明光甲衣")			
			AddRecipe(194)
			Msg2Player("你学会了新配方：霓裳羽衣")			
			AddRecipe(195)
			Msg2Player("你学会了新配方：天衣")			
			AddRecipe(196)
			Msg2Player("你学会了新配方：飞天彩裳")						
			AddRecipe(211)
			Msg2Player("你学会了新配方：逆云斗衣")			
			AddRecipe(212)
			Msg2Player("你学会了新配方：锦云裳")			
			AddRecipe(213)
			Msg2Player("你学会了新配方：无双斗衣")		
			AddRecipe(214)
			Msg2Player("你学会了新配方：五彩霓裳")	
        	AddRecipe(807)
        	Msg2Player("你学会了新配方：山狮精皮")				
			SetTask(LEV_LEARNRECIPE, 80)								-- 高级
			Msg2Player("你学会了刺绣技能所有高级配方")
			return
		elseif (nLevel >= 50 and  nLevel <= 79 and GetTask(LEV_LEARNRECIPE) == 80) then
			Say(format("%s你已经学会了高级配方了，继续提高生活技能进阶大师级刺绣技能了。", strTitle), 0)
			return
		else
			Say(format("%s年轻人，不要心急嘛，你目前资质尚浅，等你生活技能等级提高了再来找我学习新配方吧。", strTitle), 0)
			return
		end
	elseif (nLevel >= 99) then
		Talk(1,"", strTitle.."您已进阶大师级刺绣技能水平，不用再找我了！")
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
		Talk(1,"", strTitle.."您已进阶大师级刺绣技能水平，不用再找我了！")
		return
	end
	local selTab = {};
	local szTitle = format("%s进阶大师级刺绣技能要求刺绣技能达到79级并消耗%d金，你确定要进阶吗？", strTitle, 1000)
	tinsert(selTab,"同意/update_max_skill_level_ensure");
	tinsert(selTab,"我再看看/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("%s目前刺绣技能小于%d级，先去历练一番，再来领会。！", strTitle, 79))
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Talk(1,"", format("%s你的银两不足%d金", strTitle, 1000))
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	

	AddRecipe(1057)
	Msg2Player("你学会了新配方：七神衣(外)")	
	AddRecipe(1058)
	Msg2Player("你学会了新配方：龙鳞乌金甲(外)")	
	AddRecipe(1059)
	Msg2Player("你学会了新配方：盈舞羽裳(外)")	
	AddRecipe(1060)
	Msg2Player("你学会了新配方：绿萦羽衣(外)")	
	AddRecipe(1069)
	Msg2Player("你学会了新配方：素银袍")		
	AddRecipe(1070)
	Msg2Player("你学会了新配方：赤炼甲衣")		
	AddRecipe(1071)
	Msg2Player("你学会了新配方：黛烟霓裳")		
	AddRecipe(1072)
	Msg2Player("你学会了新配方：玉梭羽衣")			
	AddRecipe(1081)
	Msg2Player("你学会了新配方：绛紫袍(内)")		
	AddRecipe(1082)
	Msg2Player("你学会了新配方：瑬金甲衣(内)")		
	AddRecipe(1083)
	Msg2Player("你学会了新配方：凤羽霓纱(内)")		
	AddRecipe(1084)
	Msg2Player("你学会了新配方：双黛羽裳(内)")		
	
	
--	AddRecipe(158)
--	Msg2Player("你学会了新配方：百炼")
--	AddRecipe(157)
--	Msg2Player("你学会了新配方：千锤")
--	for i = 159, 228 do
--		AddRecipe(i)
--	end
--	Msg2Player("你学会了新配方：大师级刺绣配方")
	Msg2Player("恭喜您进阶大师级刺绣技能水平！");
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