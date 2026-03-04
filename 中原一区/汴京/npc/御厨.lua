-- =========================================
-- File : 中原一区，汴京，御厨.lua
-- Name : 御厨
-- ID   : 1, 7
-- =========================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
--定义常量及预处理	
nGen 				= 1			-- 生活主技能参数
nSkillId 				= 7			-- 生活主技能ID
LEV_LEARNRECIPE			= 147		-- 配方学习任务变量
FORGETMAIN_NUM		= 1940		-- 遗忘主技能次数
nPay					= {10,20,30,50}		-- 遗忘主技能消耗金

strName = "";
strTitle = "";

function main()
	if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","你已经玩了5个小时了，请休息一下以保持健康！")
	 	return
	end
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

	local szTitle = format("%s我就是天下闻名的御厨，你要学习烹饪找我没错。烹饪需要的食材一部分可以通过收耕技能采集到，还有一部分需要去酒楼老板处购实。", strTitle)

	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		tinsert(selTab,"进阶大师级烹饪技能/update_max_skill_level");
		tinsert(selTab,"学习烹饪配方或配方任务/luaLearnRecipe");
		tinsert(selTab, format("稀有生活技能道具商店/#show_equip_shop(%d)", 138));
		tinsert(selTab,"我要了解采集的相关事情/Info");
		tinsert(selTab,"遗忘烹饪技能/forget_life_skill");
	else
		tinsert(selTab,"学习烹饪技能/luaLearnLifeSkill");
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
		Talk(1,"", strTitle.."你还没有学习<color=yellow>烹饪<color>技能！")
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
   
	Say(strTitle.."<color=yellow>烹饪<color>将会成为你新的一个生活技能，你确定学习吗？",
    	2,
    	"是的，我要学/LearnYes",
    	"让我再考虑考虑/LearnNo")
end

--学习技能
function LearnYes()
	if LearnLifeSkill(nGen, nSkillId, 1, 79, 1) then
		Talk(1,"", strTitle.."已经学会了[烹饪]技能。")
	end   
	AddRecipe(18)
	Msg2Player("你学会了新配方：饭团")
	AddRecipe(19)
	Msg2Player("你学会了新配方：馒头")
	AddRecipe(22)
	Msg2Player("你学会了新配方：家常四季豆")
	AddRecipe(25)
    Msg2Player("你学会了新配方：烧刀子")
	AddRecipe(26)
    Msg2Player("你学会了新配方：女儿红")
	AddRecipe(215)
    Msg2Player("你学会了新配方：素炒竹肉")
	SetTask(LEV_LEARNRECIPE, 10)
	Msg2Player("你学会了级烹饪技能所有初级配方")
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
	AddRecipe(18)
	Msg2Player("你学会了新配方：饭团")
	AddRecipe(19)
	Msg2Player("你学会了新配方：馒头")
	AddRecipe(22)
	Msg2Player("你学会了新配方：家常四季豆")
	AddRecipe(25)
    Msg2Player("你学会了新配方：烧刀子")
	AddRecipe(26)
    Msg2Player("你学会了新配方：女儿红")
	AddRecipe(215)
    Msg2Player("你学会了新配方：素炒竹肉")
			SetTask(LEV_LEARNRECIPE, 10)								-- 初级
			Msg2Player("你学会了级烹饪技能所有初级配方")
			return
		elseif (nLevel >= 0 and  nLevel < 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			Say(format("%s你已经学会了初级配方了，继续提高生活技能等级进阶中级烹饪技能了。", strTitle), 0)
			return 
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(20)
			Msg2Player("你学会了新配方：花卷")
			AddRecipe(27)
			Msg2Player("你学会了新配方：稻花香")
			AddRecipe(23)
			Msg2Player("你学会了新配方：炒豌豆角")
			AddRecipe(21)
			Msg2Player("你学会了新配方：肉包")
			AddRecipe(28)
			Msg2Player("你学会了新配方：醉生梦死")
			AddRecipe(24)
			Msg2Player("你学会了新配方：蒜茸生菜")
			SetTask(LEV_LEARNRECIPE, 50)								-- 中级
			Msg2Player("你学会了级烹饪技能所有中级配方")
			return
		elseif (nLevel >= 30 and  nLevel < 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			Say(format("%s你已经学会了中级配方了，继续提高生活技能等级进阶高级烹饪技能了。", strTitle), 0)
			return
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(218)
			Msg2Player("你学会了新配方：蛋炒饭")
			AddRecipe(219)
			Msg2Player("你学会了新配方：黄金糕")
			AddRecipe(216)
			Msg2Player("你学会了新配方：玉笛谁家听落梅")
			AddRecipe(217)
			Msg2Player("你学会了新配方：二十四桥明月夜")
			SetTask(LEV_LEARNRECIPE, 80)								-- 高级
			Msg2Player("你学会了烹饪技能所有高级配方")
			return
		elseif (nLevel >= 50 and  nLevel <= 79 and GetTask(LEV_LEARNRECIPE) == 80) then
			Say(format("%s你已经学会了高级配方了，继续提高生活技能进阶大师级烹饪技能了。", strTitle), 0)
			return
		else
			Say(format("%s年轻人，不要心急嘛，你目前资质尚浅，等你生活技能等级提高了再来找我学习新配方吧。", strTitle), 0)
			return
		end
	elseif (nLevel >= 99) then
		Talk(1,"", strTitle.."%s您已进阶大师级烹饪技能水平，不用再找我了！")
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
		Talk(1,"", strTitle.."%s您已进阶大师级烹饪技能水平，不用再找我了！")
		return
	end	
	local selTab = {};
	local szTitle = format("%s进阶大师级烹饪技能要求烹饪技能达到79级并消耗%d金，你确定要进阶吗？", strTitle, 1000)
	tinsert(selTab,"同意/update_max_skill_level_ensure");
	tinsert(selTab,"我再看看/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("%s目前烹饪技能小于%d级，先去历练一番，再来领会。！", strTitle, 79))
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Talk(1,"", format("%s你的银两不足%d金", strTitle, 1000))
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
--	for i = 28, 42 do
--		AddRecipe(i)
--	end
--	for i = 888, 902 do
--		AddRecipe(i)
--	end
--	Msg2Player("你学会了新配方：大师级烹饪配方")
	Msg2Player("恭喜您进阶大师级烹饪技能水平！");
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
	Say(strTitle.."学习对应的采集和制造技能，通过雇佣采集和制造积累经验，采集和制作更高级的生活物品。共有初级、中级、高级和大师级四个阶段，每个技能皆可学习，但采集和制造分别只能选择其中一种升至大师级。目前开放的采集类生活技能有：采药、伐木、采矿、桑耕、狩猎、钓鱼，制造类生活技能有：制药、烹饪、锻造、烹饪、天工、刺绣。", 0);
end;


--空函数
function exit_dialog()	
end