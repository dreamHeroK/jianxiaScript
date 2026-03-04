Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua");
Include("\\script\\online_activites\\task_values.lua");

HB_TASK_VALUE_KEY_USED_COUNT = VET_201011_HB_TASK_USED_COUNT;
HB_USED_MAX = 20;

HB_ITEM_TYPE_MAIN = 2;
HB_ITEM_TYPE_SUB1 = 1;
HB_ITEM_TYPE_SUB2 = 30241;
HB_ITEM_THRESHOLD_TIMES = 10;
HB_TEMP_TASK_VALUE_KEY_ITEM = VET_201011_HB_TASK_TEMP_ITEM_INDEX;
HB_ADDITIONAL_REWARD_EXP = 1500000;
HB_MINOR_REWARD_EXP = 100000;

HB_TREE_SEED_REWARD_TIME = 12;
HB_SMALL_WISDOM_TREE_REWARD_TIME = 8;
HB_BIG_WISDOM_TREE_REWARD_TIME1 = 4;
HB_BIG_WISDOM_TREE_REWARD_TIME2 = 8;

HBRewardSourceTable = {
	2,	--big battlefield
	1,	--small battlefield
	1,	--killer hall
	1,	--planting tree seeds
	2,	--small wisdom tree
	1	--big wisdom tree
};

function HBResetCounter()
	SetTask(HB_TASK_VALUE_KEY_USED_COUNT, 0);
end

function HBClearItem()
	local itemCount = BigGetItemCount(HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2);
	if 0 < itemCount then
		BigDelItem(HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2, itemCount);
	end
end

function HBDayBegin()
	HBResetCounter();
	HBClearItem();
end

function HBRewardSource(tableIndex)
	do return end
	local itemID = {HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2, HBRewardSourceTable[tableIndex]};
	local itemName = "幸运袋";
	gf_AddItemEx2(itemID, itemName, "happiness bag", "reward");
end

function HBRewardInBigBattleField()
	HBRewardSource(1);
end

function HBRewardInSmallBattleField()
	HBRewardSource(2);
end

function HBRewardInKillerHall()
	HBRewardSource(3);
end

function HBRewardInPlantingTreeSeeds()
	if HB_TREE_SEED_REWARD_TIME == GetTask(TASK_PLANT_TREE_COUNT) then
		HBRewardSource(4);
	end
end

function HBRewardInBigWisdomTree()
	if HB_BIG_WISDOM_TREE_REWARD_TIME1 == GetTask(TASK_PLAN_BIGTREE_COUNT) then
		HBRewardSource(5);
	elseif HB_BIG_WISDOM_TREE_REWARD_TIME2 == GetTask(TASK_PLAN_BIGTREE_COUNT) then
		HBRewardSource(5);
	end	
end

function HBRewardInSmallWisdomTree()
	if HB_SMALL_WISDOM_TREE_REWARD_TIME == GetTask(TASK_PLAN_SMALLTREE_COUNT) then
		HBRewardSource(6);
	end
end

function HBBroadcast(rewardInfo)
	return AddGlobalCountNews("恭喜"..GetName().."打开幸运袋获得了"..rewardInfo.."。", 1);
end

HBStrings = 
{
	"恭喜",
	"多么幸运！",
	"你获得了100点修为",
	"你获得了200点修为",
	"你获得了400点修为",
	"你获得了800点修为"
}

-- base 10000
HBMajoyRewardList = {
	{2, 1600, 100000},
	{2, 1200, 200000},
	{2, 800, 400000},
	{2, 350, 800000},
	{31, 50, "ModifyExp(10000000);HBBroadcast(\'".."10000000经验"..","..HBStrings[1].."\')"},
	{31, 500, "ModifyPopur(100);Msg2Player(\'"..HBStrings[3].."\')"},
	{31, 400, "ModifyPopur(200);Msg2Player(\'"..HBStrings[4].."\')"},
	{31, 300, "ModifyPopur(400);Msg2Player(\'"..HBStrings[5].."\')"},
	{31, 250, "ModifyPopur(800);Msg2Player(\'"..HBStrings[6].."\')"},
	{31, 50, "ModifyPopur(2000);HBBroadcast(\'".."2000点修为,"..", "..HBStrings[1].."\')"},
	{4, 1000, 1},
	{4, 400, 2},
	{4, 300, 4},
	{4, 200, 8},
	{4, 100, 50},
	{5, 1000, 10},
	{5, 400, 20},
	{5, 300, 40},
	{5, 250, 80},
	{5, 50, 1000},
	{3, 200, 50000},
	{3, 100, 100000},
	{3, 100, 200000},
	{3, 95, 400000},
	{31, 5, "Earn(10000000);HBBroadcast(\'".."1000金,"..", "..HBStrings[1].."\')"},
};

-- base 10000
HBAdditionalRewardList = {
	{6, 1300, 60, 1},
	{7, 100, 60, 1},
	{8, 100, 60, 1},
	{13, 1300, 60, 1},
	{10, 1300, 60, 1},
	{1, 1500, "紫霞秘籍", {0, 107, 65, 1}},
	{1, 1500, "天霞秘籍", {0, 107, 64, 1}},
	{1, 1500, "沾衣谱", {0, 107, 66, 1}},
	{1, 270, "斗魂", {2, 1, 1157, 1}, 7*24*3600},
	{1, 100, "军功章", {2, 1, 9999, 1, 4}, 7*24*3600},
	{1, 5, "辉煌军功章", {2, 1, 9977, 1, 4}, 1*24*3600},
	{1, 25, "投诚表", {2, 1, 9978, 1, 4}, 1*24*3600},
	{1, 200, "紫光金蝉丝", {2, 0, 737, 1}},
	{1, 200, "紫光麒麟羽", {2, 0, 736, 1}},
	{1, 200, "紫光烈焰锦", {2, 0, 735 ,1}},
	{1, 200, "上古麒麟血", {2, 0, 739 ,1}},
	{1, 200, "截衡兽碎片", {2, 0, 738 ,1}},
};

function OnUse(itemIndex)
	do return end
	SetTaskTemp(HB_TEMP_TASK_VALUE_KEY_ITEM, itemIndex);
	HBOpenUI();
	return 1;    
end

function HBOpenUI()
	local openedTimes = GetTask(HB_TASK_VALUE_KEY_USED_COUNT);
	local title = "幸运袋：充满幸运的魔术袋。";
	title = title.."<enter>  ".."今天您已经打开了"..openedTimes.."个幸运袋，下次再来吧。";
	if HB_ITEM_THRESHOLD_TIMES > openedTimes then
		title = title..(HB_ITEM_THRESHOLD_TIMES-openedTimes);
	else
		title = title.."0"
	end;
	title = title.." 幸运袋可以得到幸运的奖励。";
	title = title.."<enter><color=Red>".."提示：每天最多只能打开"..HB_ITEM_THRESHOLD_TIMES.."个幸运袋，如果你继续开启，只能获得"..HB_MINOR_REWARD_EXP.."经验".."<color>";
	local menu = {};
	tinsert(menu, "打开幸运袋".."/HBDoOpen");
	tinsert(menu, "查看幸运袋的来源".."/HBDoHelp");
	tinsert(menu, "取消".."/HBDoNothing");
	Say(title, getn(menu), menu);
end

function HBDoOpen()
	local openedTimes = GetTask(HB_TASK_VALUE_KEY_USED_COUNT);
	--WriteLog("opened times: "..openedTimes);
	if 0 <= openedTimes and openedTimes < HB_USED_MAX then
		if 1 == DelItemByIndex(itemIndex, -1) then
			if openedTimes+1 < HB_ITEM_THRESHOLD_TIMES then
				HBDoOpenPreThreshold();
			elseif openedTimes+1 == HB_ITEM_THRESHOLD_TIMES then
				HBDoOpenThreshold();
			else
				HBDoOpenPstThreshold();
			end
			SetTask(HB_TASK_VALUE_KEY_USED_COUNT, openedTimes+1);
			local itemIndex = GetTaskTemp(HB_TEMP_TASK_VALUE_KEY_ITEM);
			--WriteLog("delete item by index: "..itemIndex);
		end
	elseif openedTimes >= HB_USED_MAX then
	  -- TODO: refine it by SunZhuoshi
		Msg2Player("抱歉，已经达到每日的开启的最大限制。"); 
	end
end

function HBMajorReward()
	do return end
	gf_EventGiveRandAward(HBMajoyRewardList, 10000, 1, "happiness bag", "major reward");
end

function HBAdditionalReward()
	if gf_Judge_Room_Weight(1,0,"") ~= 1 then
  	return
  end
  gf_EventGiveRandAward(HBAdditionalRewardList, 10000, 1, "happiness bag", "additional reward");
  gf_EventGiveCustomAward(1, ADDITIONAL_REWARD_EXP, 1, "happiness bag", "additional reward");
end

function HBMinorReward()
	gf_EventGiveCustomAward(1, HB_MINOR_REWARD_EXP, 1, "happiness bag", "minor reward");
end

function HBDoOpenPreThreshold()
	HBMajorReward();
end

function HBDoOpenThreshold()
	HBMajorReward();
	HBAdditionalReward();
end

function HBDoOpenPstThreshold()
	HBMinorReward();
end

function HBDoHelp()
	local title = "通过参与游戏内活动，您将有机会获得幸运袋，这些活动可能会出现：";
	title = title.."<enter>".."生生造化散, 杀手堂面具, 杀手堂任务卷轴 (个人和团队), 般若树种, 小般若树种";
	local menu = {};
	tinsert(menu, "取消/HBDoNothing");
	tinsert(menu, "返回/HBOpenUI");
	Say(title, getn(menu), menu);
end

function HBDoNothing()
end