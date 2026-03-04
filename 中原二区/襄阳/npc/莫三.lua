-- =========================================
-- File : 中原二区，襄阳，莫三.lua  奇门兵器锻造
-- Name : 莫三
-- =========================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
--定义常量及预处理
nGen 					= 1			-- 生活主技能参数
nSkillId 					= 4			-- 生活主技能ID
LEV_LEARNRECIPE			= 143		-- 配方学习任务变量
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
	local szTitle = ""

	local szTitle = format("%s我是干将莫邪的第七十三代传人－莫三，擅长锻造各种神兵利器，琴、笔、暗器等奇门兵器，有什么我能帮忙你的？", strTitle)

	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		tinsert(selTab,"进阶大师级锻造技能/update_max_skill_level");
		tinsert(selTab,"学习锻造配方或配方任务/luaLearnRecipe");
		tinsert(selTab, format("稀有生活技能道具商店/#show_equip_shop(%d)", 138));
		tinsert(selTab,"我要了解采集的相关事情/Info");
		tinsert(selTab,"遗忘锻造技能/forget_life_skill");
	else
		tinsert(selTab,"学习锻造技能/luaLearnLifeSkill");
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
		Talk(1,"", strTitle.."你还没有学习<color=yellow>锻造<color>技能！")
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
				Msg2Player("你锻造技能已经遗忘了！")	
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
		Talk(1,"", strTitle.."你已经学习了其他生产技能，暂时不能学习[锻造]技能。你可以遗忘技能或者使用新的<color=yellow>生活手札<color>取下你已经学习过的生产技能！")
		return
	end
   
	Say(strTitle.."<color=yellow>锻造<color>将会成为你新的一个生活技能，你确定学习吗？",
    	2,
    	"是的，我要学/LearnYes",
    	"让我再考虑考虑/LearnNo")
end

--学习技能
function LearnYes()
	if LearnLifeSkill(nGen, nSkillId, 1, 79, 1) then
		Talk(1,"", strTitle.."已经学会了[锻造]技能。")
	end	    
	AddRecipe(108)
	Msg2Player("你学会了新配方：侠少暗器")
	AddRecipe(109)
	Msg2Player("你学会了新配方：五光石")
	AddRecipe(110)
	Msg2Player("你学会了新配方：柳叶刀")
	AddRecipe(111)
    Msg2Player("你学会了新配方：断肠镖")
	AddRecipe(112)
    Msg2Player("你学会了新配方：破灭神针")
	AddRecipe(113)
    Msg2Player("你学会了新配方：子母离魂箭")
	AddRecipe(114)
    Msg2Player("你学会了新配方：黑血神针")	
	AddRecipe(121)
    Msg2Player("你学会了新配方：玉韵琴")	
	AddRecipe(122)
    Msg2Player("你学会了新配方：惊涛琴")	
	AddRecipe(123)
    Msg2Player("你学会了新配方：奔雷琴")	
	AddRecipe(124)
    Msg2Player("你学会了新配方：飞瀑连珠")	
	AddRecipe(125)
    Msg2Player("你学会了新配方：雷动万物")		
	AddRecipe(132)
    Msg2Player("你学会了新配方：判官笔")	
	AddRecipe(133)
    Msg2Player("你学会了新配方：折冲笔")
	AddRecipe(134)
    Msg2Player("你学会了新配方：春风笔")	
	AddRecipe(135)
    Msg2Player("你学会了新配方：惊雷笔")
	AddRecipe(136)
    Msg2Player("你学会了新配方：无回笔")	
	AddRecipe(229)
    Msg2Player("你学会了新配方：军用箭囊")
	AddRecipe(760)
    Msg2Player("你学会了新配方：竹木弓")	
	AddRecipe(761)
    Msg2Player("你学会了新配方：青藤弓")
	AddRecipe(762)
    Msg2Player("你学会了新配方：精铁弓")
	AddRecipe(763)
    Msg2Player("你学会了新配方：落雁弓")	
	AddRecipe(764)
    Msg2Player("你学会了新配方：穿心弓")		
	AddRecipe(771)
    Msg2Player("你学会了新配方：黑铁爪")	
	AddRecipe(772)
    Msg2Player("你学会了新配方：精钢爪")
	AddRecipe(773)
    Msg2Player("你学会了新配方：机关爪")
	AddRecipe(774)
    Msg2Player("你学会了新配方：飞璜爪")	
	AddRecipe(775)
    Msg2Player("你学会了新配方：暗刺")			
	
	
	
	
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
	AddRecipe(108)
	Msg2Player("你学会了新配方：侠少暗器")
	AddRecipe(109)
	Msg2Player("你学会了新配方：五光石")
	AddRecipe(110)
	Msg2Player("你学会了新配方：柳叶刀")
	AddRecipe(111)
    Msg2Player("你学会了新配方：断肠镖")
	AddRecipe(112)
    Msg2Player("你学会了新配方：破灭神针")
	AddRecipe(113)
    Msg2Player("你学会了新配方：子母离魂箭")
	AddRecipe(114)
    Msg2Player("你学会了新配方：黑血神针")	
	AddRecipe(121)
    Msg2Player("你学会了新配方：玉韵琴")	
	AddRecipe(122)
    Msg2Player("你学会了新配方：惊涛琴")	
	AddRecipe(123)
    Msg2Player("你学会了新配方：奔雷琴")	
	AddRecipe(124)
    Msg2Player("你学会了新配方：飞瀑连珠")	
	AddRecipe(125)
    Msg2Player("你学会了新配方：雷动万物")		
	AddRecipe(132)
    Msg2Player("你学会了新配方：判官笔")	
	AddRecipe(133)
    Msg2Player("你学会了新配方：折冲笔")
	AddRecipe(134)
    Msg2Player("你学会了新配方：春风笔")	
	AddRecipe(135)
    Msg2Player("你学会了新配方：惊雷笔")
	AddRecipe(136)
    Msg2Player("你学会了新配方：无回笔")	
	AddRecipe(229)
    Msg2Player("你学会了新配方：军用箭囊")
	AddRecipe(760)
    Msg2Player("你学会了新配方：竹木弓")	
	AddRecipe(761)
    Msg2Player("你学会了新配方：青藤弓")
	AddRecipe(762)
    Msg2Player("你学会了新配方：精铁弓")
	AddRecipe(763)
    Msg2Player("你学会了新配方：落雁弓")	
	AddRecipe(764)
    Msg2Player("你学会了新配方：穿心弓")		
	AddRecipe(771)
    Msg2Player("你学会了新配方：黑铁爪")	
	AddRecipe(772)
    Msg2Player("你学会了新配方：精钢爪")
	AddRecipe(773)
    Msg2Player("你学会了新配方：机关爪")
	AddRecipe(774)
    Msg2Player("你学会了新配方：飞璜爪")	
	AddRecipe(775)
    Msg2Player("你学会了新配方：暗刺")	
			SetTask(LEV_LEARNRECIPE, 10)								-- 初级
			Msg2Player("你学会了锻造技能所有初级配方")
			return
		elseif (nLevel >= 0 and  nLevel < 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			Say(format("%s你已经学会了初级配方了，继续提高生活技能等级进阶中级锻造技能了。", strTitle), 0)
			return 
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(115)
			Msg2Player("你学会了新配方：玉蜂针")		
			AddRecipe(116)
			Msg2Player("你学会了新配方：袖里乾坤")			
			AddRecipe(117)
			Msg2Player("你学会了新配方：含沙射影")		
			AddRecipe(118)
			Msg2Player("你学会了新配方：七星透骨针")	
			AddRecipe(126)
			Msg2Player("你学会了新配方：悬崖飞瀑")		
			AddRecipe(127)
			Msg2Player("你学会了新配方：海月清辉")		
		    AddRecipe(128)
			Msg2Player("你学会了新配方：九霄环佩")	
			AddRecipe(129)
			Msg2Player("你学会了新配方：号钟")		
			AddRecipe(137)
			Msg2Player("你学会了新配方：追月笔")	
		    AddRecipe(138)
			Msg2Player("你学会了新配方：嗜魂笔")	
			AddRecipe(139)
			Msg2Player("你学会了新配方：龙舌")		
			AddRecipe(140)
			Msg2Player("你学会了新配方：狼牙")					
			AddRecipe(765)
			Msg2Player("你学会了新配方：逐月弓")	
		    AddRecipe(766)
			Msg2Player("你学会了新配方：灭焰弓")	
			AddRecipe(767)
			Msg2Player("你学会了新配方：紫金")		
			AddRecipe(768)
			Msg2Player("你学会了新配方：神力")							
			AddRecipe(776)
			Msg2Player("你学会了新配方：狼牙")	
		    AddRecipe(777)
			Msg2Player("你学会了新配方：怒焰")	
			AddRecipe(778)
			Msg2Player("你学会了新配方：万劫")		
			AddRecipe(779)
			Msg2Player("你学会了新配方：阳筠")	
			SetTask(LEV_LEARNRECIPE, 50)								-- 中级
			Msg2Player("你学会了锻造技能所有中级配方")
			return
		elseif (nLevel >= 30 and  nLevel < 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			Say(format("%s你已经学会了中级配方了，继续提高生活技能等级进阶高级锻造技能了。", strTitle), 0)
			return
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(119)
			Msg2Player("你学会了新配方：七煞天罗")
			AddRecipe(120)
			Msg2Player("你学会了新配方：天外飞仙")
			AddRecipe(130)
			Msg2Player("你学会了新配方：绿绮")
			AddRecipe(131)
			Msg2Player("你学会了新配方：焦尾")		
			AddRecipe(141)
			Msg2Player("你学会了新配方：破军")			
			AddRecipe(142)
			Msg2Player("你学会了新配方：天机")			
			AddRecipe(769)
			Msg2Player("你学会了新配方：蚩牙")			
			AddRecipe(770)
			Msg2Player("你学会了新配方：龙口")						
			AddRecipe(780)
			Msg2Player("你学会了新配方：凝霜")			
			AddRecipe(781)
			Msg2Player("你学会了新配方：五尊")			
			AddRecipe(1006)
			Msg2Player("你学会了新配方：漫天花雨")			
			AddRecipe(1008)
			Msg2Player("你学会了新配方：希仁之拥")						
			AddRecipe(1009)
			Msg2Player("你学会了新配方：神行")			
			AddRecipe(1012)
			Msg2Player("你学会了新配方：枉矢")			
			AddRecipe(1013)
			Msg2Player("你学会了新配方：猛虎")		
			AddRecipe(1099)
			Msg2Player("你学会了新配方：翠玉")			
			AddRecipe(1100)
			Msg2Player("你学会了新配方：银丝")			
			AddRecipe(1101)
			Msg2Player("你学会了新配方：冥冰")
			AddRecipe(1111)
			Msg2Player("你学会了新配方：雪魂")			
			AddRecipe(1112)
			Msg2Player("你学会了新配方：叠翠")			
			AddRecipe(1113)
			Msg2Player("你学会了新配方：玉盈")	
			SetTask(LEV_LEARNRECIPE, 80)								-- 高级
			Msg2Player("你学会了锻造技能所有高级配方")
			return
		elseif (nLevel >= 50 and  nLevel <= 79 and GetTask(LEV_LEARNRECIPE) == 80) then
			Say(format("%s你已经学会了高级配方了，继续提高生活技能进阶大师级锻造技能了。", strTitle), 0)
			return
		else
			Say(format("%s年轻人，不要心急嘛，你目前资质尚浅，等你生活技能等级提高了再来找我学习新配方吧。", strTitle), 0)
			return
		end
	elseif (nLevel >= 99) then
		Talk(1,"", strTitle.."您已进阶大师级锻造技能水平，不用再找我了！")
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
		Talk(1,"", strTitle.."您已进阶大师级锻造技能水平，不用再找我了！")
		return
	end
	local selTab = {};
	local szTitle = format("%s进阶大师级锻造技能要求锻造技能达到79级并消耗%d金，你确定要进阶吗？", strTitle, 1000)
	tinsert(selTab,"同意/update_max_skill_level_ensure");
	tinsert(selTab,"我再看看/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("%s目前锻造技能小于%d级，先去历练一番，再来领会。！", strTitle, 79))
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Talk(1,"", format("%s你的银两不足%d金", strTitle, 1000))
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	
	AddRecipe(1022)
	Msg2Player("你学会了新配方：没羽")	
	AddRecipe(1025)
	Msg2Player("你学会了新配方：大圣遗音")	
	AddRecipe(1026)
	Msg2Player("你学会了新配方：枯木龙吟")	
	AddRecipe(1027)
	Msg2Player("你学会了新配方：酸与")	
	AddRecipe(1028)
	Msg2Player("你学会了新配方：太虚")	
	AddRecipe(1033)
	Msg2Player("你学会了新配方：猿啼")		
	AddRecipe(1034)
	Msg2Player("你学会了新配方：不射之射")		
	AddRecipe(1035)
	Msg2Player("你学会了新配方：无痕")		
	AddRecipe(1036)
	Msg2Player("你学会了新配方：青龙")		
--	AddRecipe(158)
--	Msg2Player("你学会了新配方：百炼")
--	AddRecipe(157)
--	Msg2Player("你学会了新配方：千锤")
--	for i = 159, 228 do
--		AddRecipe(i)
--	end
--	Msg2Player("你学会了新配方：师门六套戒指")
--	Msg2Player("你学会了新配方：师门六套武器")
	Msg2Player("恭喜您进阶大师级技能水平！");
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