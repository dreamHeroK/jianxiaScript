Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\itemfunctions.lua")

TCT_NPC = "<color=green>游戏活动大使<color>：";
TCT_TITLE = "《江湖如故怀旧降龙版》已满月，感谢群侠共聚江湖，为各位大侠准备了共聚江湖礼箱，让我们一起迎接幸福牛年！";

TCT_ACTIVITY_ID = 141
TSK_TctAward = 1313
TSK_UpCount = 1875

--活动时间
CH_START = {2021, 01, 16, 0, 0, 0};
CH_END  = {2021, 01, 22, 23, 59, 0};

function tct_IsOpen()
	return gf_CheckDuration(CH_START, CH_END);
end

function sp_ReturnMain()
	SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");
end

TCT_NPC_TALK = {
	"活动详细介绍/tct_intro",
	"领取共聚江湖礼盒/tct_give_item_chenghao",
}

function tct_intro()
	local tSay = {
		"装扮发财树/tct_intro_facaishu",
		"领称号获奖励/tct_intro_online",
		"返回/sp_ReturnMain",
		"结束对话/nothing",
	};
	Say(TCT_NPC.."腊八来临，年味渐浓。立春将至，万物起始。让我们喝起腊八粥，迎接春神，一同迎接新春的到来吧！", getn(tSay), tSay);
end

function tct_intro_facaishu()
	local tSay = {
		"返回/tct_intro",
		"结束对话/nothing",
	};
	Say(TCT_NPC.."2021年01月16日至2021年01月22日期间，每日上午9点三大主城随机一个城市刷新一个1级发财树，每个阶段发财树生存时间4个小时。玩家可上交藏宝箱钥匙至各主城中刷新的发财树，可以累积发财树的成长值并可以获得奖励，当发财树的成长值达到一定的数量，发财树即可成长1级。每个阶段成长的发财树全服玩家都可以领取一次丰厚的奖励。", getn(tSay), tSay);
end

function tct_intro_online()
	local tSay = {
		"返回/tct_intro",
		"结束对话/nothing",
	};
	Say(FT_NPC.."活动期间，每位侠士都可领取一个“共聚江湖礼盒”，开启礼盒获得“共聚江湖”称号（亮出称号每分钟都可获得经验奖励）并可获得其他珍贵的礼物。", getn(tSay), tSay);
end

function tct_give_item_chenghao()
	if gf_CheckBaseCondition(70) ~= 1 then
		return 0;
	end
	local n_daily_time = GetBit(GetTask(1314), 16);
	if n_daily_time == 1 then
	 	Talk(1,"", TCT_NPC.."您已经领取了共聚江湖礼盒，不能再领取哦。")
		return
	end
	gf_AddItemEx2({2, 95, 1954, 1, 4}, "共聚江湖礼盒", "共聚江湖", "共聚江湖礼盒", 7 * 24 * 3600, 1);
	SetTask(1314, SetBit(GetTask(1314), 16, 1));
end


--给经验
function gl_aw_addExp(nArg)
	local nLv = GetLevel();
	local nExp = floor(nLv*nLv*nArg);
	gf_Modify("Exp",nExp);
end

--给金钱
function gl_aw_addMoney(nArg)
	local nMoney = floor(nArg*10000);
	gf_Modify("Money",nMoney);
end

tAllAward = {
	[1] = { --上交藏宝箱钥匙奖励（ok）
		maxRand = 10000,
		subclauses = {
			{{"金钱";giveClause =function() gl_aw_addMoney(3) end}, 800},
			{{"万物归元丹", {1,0,11,3}, }, 800},
			{{"黑玉断续膏", {1,0,6,3}, }, 800},
			{{"生生造化散", {1,0,16,3}, }, 800},
			{{"经验宝瓶", {2,95,5434,1}, }, 500},
			{{"九转回魂丹", {1,0,32,1}, }, 500},
			{{"陨铁碎片", {2,2,7,1,1}, }, 600},
			{{"陨铁", {2,2,8,3,1}, }, 400},
			{{"陨铁精石", {2,1,1009,1,1}, }, 200},
			{{"灵石宝箱", {2,95,5435,1}, }, 3000},
			{{"修真要诀", {2,0,554,1}, }, 500},
			{{"千变梵星券", {2,95,246,1}, }, 500},
			{{"降龙令", {2, 95, 5433,1}, }, 600},
		},
		giveClause = ClauseRandom.giveClause,
	},
};

function tct_CheckCondition()
	return 1;
end

TCT_CHRISMAS_TREE = "招财树"

TCT_TREE_TEMPLATE = {
	{"小树1", "目前尚未成熟"},
	{"小树2", "目前尚未成熟"},
	{"小树3", "目前尚未成熟"},
	{"小树4", "目前尚未成熟"},
	{"小树5", "目前已成熟"},
}

TCT_NPC_NAME = "%s的%s";

function main()
	if tct_IsOpen() ~= 1 then
		return 0;
	end
	local tPos = {
		{200,1348,2862,"汴京"},
		{300,1756,3554,"成都"},
		{100,1410,2956,"泉州"},
	}
	local m = random(1, getn(tPos));
	if SubWorldID2Idx(tPos[m][1]) >= 0 then
		local npcIndex = CreateNpc(TCT_TREE_TEMPLATE[1][1], format(TCT_NPC_NAME, tPos[m][4], TCT_CHRISMAS_TREE), tPos[m][1], tPos[m][2], tPos[m][3]);
		SetNpcScript(npcIndex, "\\script\\online_activites\\202012\\newyears_tree.lua");
		SetNpcLifeTime(npcIndex, 4 * 3600);
		SetNpcTempData(npcIndex, 1, 1);
		SetNpcTempData(npcIndex, 2, 0);
		SetNpcTempData(npcIndex, 3, 0);
	end
	AddLocalCountNews("群侠共聚江湖，"..tPos[m][4].."的发财树刷新在("..floor(tPos[m][2]/8).."/"..floor(tPos[m][3]/16)..")，让我们一同迎接新春的到来吧！", 1);
	Msg2SubWorld("群侠共聚江湖，"..tPos[m][4].."的发财树刷新在("..floor(tPos[m][2]/8).."/"..floor(tPos[m][3]/16)..")，让我们一同迎接新春的到来吧！");
end
