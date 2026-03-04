-- =========================================
-- File : 中原二区，成都，游方医生.lua
-- Name : 游方医生
-- ID   : 1, 2
-- =========================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
--定义常量及预处理
nGen 				= 1			-- 生活主技能参数
nSkillId 				= 6			-- 生活主技能ID
LEV_LEARNRECIPE			= 142		-- 配方学习任务变量
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

	local szTitle = format("%s我就是天下闻名的游方医生，精通医道，能妙手回春，你需要什么帮助？", strTitle)

	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		tinsert(selTab,"进阶大师级制药技能/update_max_skill_level");
		tinsert(selTab,"学习制药配方或配方任务/luaLearnRecipe");
		tinsert(selTab, format("稀有生活技能道具商店/#show_equip_shop(%d)", 138));
		tinsert(selTab,"我要了解采集的相关事情/Info");
		tinsert(selTab,"遗忘制药技能/forget_life_skill");
	else
		tinsert(selTab,"学习制药技能/luaLearnLifeSkill");
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
		Talk(1,"", strTitle.."你还没有学习<color=yellow>制药<color>技能！")
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
				Msg2Player("你制药技能已经遗忘了！")	
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
		Talk(1,"", strTitle.."你已经学习了其他生产技能，暂时不能学习[制药]技能。你可以遗忘技能或者使用新的<color=yellow>生活手札<color>取下你已经学习过的生产技能！")
		return
	end
   
	Say(strTitle.."<color=yellow>制药<color>将会成为你新的一个生活技能，你确定学习吗？",
    	2,
    	"是的，我要学/LearnYes",
    	"让我再考虑考虑/LearnNo")
end

--学习技能
function LearnYes()
	if LearnLifeSkill(nGen, nSkillId, 1, 79, 1) then
		Talk(1,"", strTitle.."已经学会了[制药]技能。")
	end
	AddRecipe(805)
	Msg2Player("你学会了新配方：黑钨精石")
	AddRecipe(3)
    	Msg2Player("你学会了新配方：金创散")
	AddRecipe(4)
    	Msg2Player("你学会了新配方：止血散")
	AddRecipe(8)
    	Msg2Player("你学会了新配方：小还丹")
	AddRecipe(9)
    	Msg2Player("你学会了新配方：还阳丹")
	AddRecipe(13)
    	Msg2Player("你学会了新配方：清心散")
	AddRecipe(14)
    	Msg2Player("你学会了新配方：益气散")
	AddRecipe(234)
    	Msg2Player("你学会了新配方：白日丹")
	AddRecipe(235)
    	Msg2Player("你学会了新配方：全生丹")
	AddRecipe(239)
    	Msg2Player("你学会了新配方：益阳散")
	AddRecipe(244)
    	Msg2Player("你学会了新配方：解毒丹")
	AddRecipe(240)
    	Msg2Player("你学会了新配方：千金散")
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
	AddRecipe(805)
	Msg2Player("你学会了新配方：黑钨精石")
	AddRecipe(3)
    	Msg2Player("你学会了新配方：金创散")
	AddRecipe(4)
    	Msg2Player("你学会了新配方：止血散")
	AddRecipe(8)
    	Msg2Player("你学会了新配方：小还丹")
	AddRecipe(9)
    	Msg2Player("你学会了新配方：还阳丹")
	AddRecipe(13)
    	Msg2Player("你学会了新配方：清心散")
	AddRecipe(14)
    	Msg2Player("你学会了新配方：益气散")
	AddRecipe(234)
    	Msg2Player("你学会了新配方：白日丹")
	AddRecipe(235)
    	Msg2Player("你学会了新配方：全生丹")
	AddRecipe(239)
    	Msg2Player("你学会了新配方：益阳散")
	AddRecipe(244)
    	Msg2Player("你学会了新配方：解毒丹")
	AddRecipe(240)
    	Msg2Player("你学会了新配方：千金散")

			SetTask(LEV_LEARNRECIPE, 10)								-- 初级
			Msg2Player("你学会了制药技能所有初级配方")
			return
		elseif (nLevel >= 0 and  nLevel < 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			Say(format("%s你已经学会了初级配方了，继续提高生活技能等级进阶中级制药技能了。", strTitle), 0)
			return 
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(5)
			Msg2Player("你学会了新配方：白云散")
			AddRecipe(10)
			Msg2Player("你学会了新配方：大还丹")
			AddRecipe(15)
			Msg2Player("你学会了新配方：玉灵散")
			AddRecipe(236)
			Msg2Player("你学会了新配方：召魂丹")
			AddRecipe(241)
			Msg2Player("你学会了新配方：补天散")
			SetTask(LEV_LEARNRECIPE, 50)								-- 中级
			Msg2Player("你学会了制药技能所有中级配方")
			return
		elseif (nLevel >= 30 and  nLevel < 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			Say(format("%s你已经学会了中级配方了，继续提高生活技能等级进阶高级制药技能了。", strTitle), 0)
			return
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(6)
			Msg2Player("你学会了新配方：天香云锦续")
			AddRecipe(11)
			Msg2Player("你学会了新配方：一元复始丹")
			AddRecipe(16)
			Msg2Player("你学会了新配方：五花玉露丸")
			AddRecipe(237)
			Msg2Player("你学会了新配方：渔神役使丹")
			AddRecipe(242)
			Msg2Player("你学会了新配方：七虫七花散")
			SetTask(LEV_LEARNRECIPE, 80)								-- 高级
			Msg2Player("你学会了制药技能所有高级配方")
			return
		elseif (nLevel >= 50 and  nLevel <= 79 and GetTask(LEV_LEARNRECIPE) == 80) then
			Say(format("%s你已经学会了高级配方了，继续提高生活技能进阶大师级缝纫技能了。", strTitle), 0)
			return
		else
			Say(format("%s年轻人，不要心急嘛，你目前资质尚浅，等你生活技能等级提高了再来找我学习新配方吧。", strTitle), 0)
			return
		end
	elseif (nLevel >= 99) then
		Talk(1,"", strTitle.."您已进阶大师级制药技能水平，不用再找我了！")
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
	local szTitle = format("%s进阶大师级制药技能要求制药技能达到79级并消耗%d金，你确定要进阶吗？", strTitle, 1000)
	tinsert(selTab,"同意/update_max_skill_level_ensure");
	tinsert(selTab,"我再看看/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("%s目前制药技能小于%d级，先去历练一番，再来领会。！", strTitle, 79))
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Talk(1,"", format("%s你的银两不足%d金", strTitle, 1000))
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
			AddRecipe(7)
			Msg2Player("你学会了新配方：黑玉断续膏")
			AddRecipe(12)
			Msg2Player("你学会了新配方：万物归元丹")
			AddRecipe(17)
			Msg2Player("你学会了新配方：生生造化散")
			AddRecipe(238)
			Msg2Player("你学会了新配方：奔星却月丹")
			AddRecipe(243)
			Msg2Player("你学会了新配方：大日炎阳散")			

--	for i = 101, 131 do
--		AddRecipe(i)
--	end
--	Msg2Player("你学会了新配方：大师级制药配方")
	Msg2Player("恭喜您进阶大师级制药技能水平！");
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