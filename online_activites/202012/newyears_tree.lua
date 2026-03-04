
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\202012\\head.lua");

function main()
	if tct_IsOpen() ~= 1 then
		return 0;
	end
	if tct_CheckCondition() ~= 1 then
		return 0;
	end
	local nDailyUp = GetTask(TSK_UpCount)
	local npcIndex = GetTargetNpc();
	local nTreeExp = GetNpcTempData(npcIndex, 3);
	local nLevel = GetNpcTempData(npcIndex, 1) 
	local selTab = {};
	local szTitle = format("<color=green>%s<color>：腊八来临，年味渐浓。立春将至，万物起始。让我们喝起腊八粥，迎接春神，一同迎接新春的到来吧！各位大侠可以上交藏宝箱钥匙提升发财树的成长值。每上交一个藏宝箱钥匙就能获得奖励，发财树每成长1级，全服所有侠士都可领取一份成长大礼哦！当发财树成熟（5级）后，根据侠士上交数量会额外瓜分至尊大礼！目前您个人的上交为<color=yellow>%d个<color>，当前成长值<color=yellow>%d<color>，等级<color=yellow>%d<color>。<color=yellow>%s<color>。", GetNpcName(npcIndex), nDailyUp, nTreeExp, nLevel, TCT_TREE_TEMPLATE[nLevel][2])

	if nLevel < 5 then
		tinsert(selTab, format("上交藏宝箱钥匙/tct_decorate_tree"));
	end
	tinsert(selTab, format("领取成长奖励/tct_level_award"));
	tinsert(selTab,"我来看看/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function tct_decorate_tree()
	local nDailyUp = GetTask(TSK_UpCount)
	if nDailyUp >= 3000 then
		Talk(1,"", "大侠今日已经上交3000个藏宝箱钥匙");
		return
	end;
	local nTreePoint = 1000 - GetNpcTempData(GetTargetNpc(), 2);
	local nMax = min(GetItemCount(2, 95, 52), nTreePoint);
	local nMinMax = min(nMax, 50);
	AskClientForNumber("tct_decorate_tree_cb", 0, nMinMax, "输入数量:");
end

function tct_decorate_tree_cb(nNum)
	local nMapID = GetWorldPos();
	if not nNum or nNum <= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	if DelItem(2, 95, 52,nNum) ~= 1 then
		return 0;
	end
	local nExp = 0;
	local npcIndex = GetTargetNpc();
	local nTreePoint = GetNpcTempData(npcIndex, 2);
	local nTreeExp = GetNpcTempData(npcIndex, 3);
	local nPoint = nTreePoint + nNum - 1000;
	local nLevel = GetNpcTempData(npcIndex, 1) + 1
	local nExp = nTreeExp + nNum;
	if nPoint >= 0 and nLevel <= getn(TCT_TREE_TEMPLATE) then
		local nMap, nX, nY = GetNpcWorldPos(npcIndex);
		SetNpcLifeTime(npcIndex, 0);
		local npcIdx = CreateNpc(TCT_TREE_TEMPLATE[nLevel][1], GetNpcName(npcIndex), nMap, nX, nY);
		SetNpcScript(npcIdx, "\\script\\online_activites\\202012\\newyears_tree.lua");
		SetNpcLifeTime(npcIdx, 4 * 3600);
		SetNpcTempData(npcIdx, 1, nLevel);
		SetNpcTempData(npcIdx, 2, nPoint);
		SetNpcTempData(npcIdx, 3, nExp);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		Msg2Global(format("%s已成长到%d级，大家快来领取奖励吧。", GetNpcName(npcIndex), nLevel));
	else
		SetNpcTempData(npcIndex, 2, nTreePoint + nNum);
		SetNpcTempData(npcIndex, 3, nTreeExp + nNum);
	end
	Msg2Player(format("%s成功上交了%d个藏宝箱钥匙", gf_GetPlayerSexName(), nNum));
	for i =1, nNum do
		gl_ny_giveAward_1()
	end
end

-- 上交藏宝箱钥匙奖励
function gl_ny_giveAward_1()
	if gf_Judge_Room_Weight(1,30,"") ~= 1 then
		return 0;
	end
	PlayerFunLib:AddTask(TSK_UpCount, 1)
	tAllAward[1]:giveClause();
	return 1
end

function tct_level_award()
	local tSay = {}
	local npcIndex = GetTargetNpc();
	local nLevel = GetNpcTempData(npcIndex, 1);
	local tStatus = {
		[0] = "未领取", 
		[1] = "已领取",
	}
	for i = 1, nLevel do
		local msg = tStatus[gf_GetTaskBit(TSK_TctAward, i)] or tStatus[1];
		tinsert(tSay, format("获得%d级发财树奖励(%s)/#tct_level_award_deal(%d)", i, msg, i));
	end
	tinsert(tSay, "结束对话/nothing");
	Say(format("<color=green>%s<color>：祝%s财源滚滚，幸福安康！", GetNpcName(npcIndex), gf_GetPlayerSexName()), getn(tSay), tSay);
end

function tct_level_award_deal(nLevel)
	if GetBit(GetTask(TSK_TctAward), nLevel) == 1 then
		Talk(1,"",format("%s已经领取了%d级发财树奖励", gf_GetPlayerSexName(), nLevel));
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	local tTemp = {
		[1] = {
			"gf_Modify('Exp',50000)", 
		},
		[2] = {
			"gf_Modify('Exp',800000)", 
			"gf_Modify('Money',30000)", 
		},
		[3] = {
			"gf_Modify('Exp',1000000)", 
			"gf_Modify('Money',50000)", 
			"gf_Modify('Popur',100)", 
		},
		[4] = {
			"gf_Modify('Exp',1500000)", 
			"gf_Modify('Money',80000)", 
			"gf_Modify('Popur',100)", 
			"gf_AddItemEx({2,95,55,1,4},'神器')",
		},	
		[5] = {
			"gf_Modify('Exp',5000000)", 
			"gf_Modify('Money',200000)", 
			"gf_Modify('Popur',100)", 
			"gf_AddItemEx({2,95,55,2,4},'神器')",
			"gf_AddItemEx({2,94,11,1,4},'盛世银宝箱')",
			"tct_level_extra_award_deal()",
		},	
	}
	for i = 1,getn(tTemp[nLevel]) do
		dostring(tTemp[nLevel][i]);
	end
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), nLevel, 1));
end;

function tct_level_extra_award_deal()
	local nNum = GetTask(TSK_UpCount)
	if gf_Judge_Room_Weight(5,30,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {3000,2000,1000,500,100,10};
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tTemp = {
		[1] = {
			"gf_Modify('Exp',10000000)", 
			"gf_Modify('Money',1000000)", 
			"gf_Modify('Popur',800)", 
			"gf_AddItemEx({2,95,55,100,4},'神器')",
			"gf_AddItemEx({2,95,5435,100,4},'灵石宝箱')",
			"gf_AddItemEx({2,95,559,10,4},'7级灵石原石')",
			"gf_AddItemEx({2,101,15,1,4},'强化精石（14级）')",
			"gf_AddItemEx({2,94,12,2,4},'盛世金宝箱')",
		},
		[2] = {
			"gf_Modify('Exp',10000000)", 
			"gf_Modify('Money',500000)", 
			"gf_Modify('Popur',500)", 
			"gf_AddItemEx({2,95,55,40,4},'神器')",
			"gf_AddItemEx({2,95,5435,40,4},'灵石宝箱')",
			"gf_AddItemEx({2,95,559,5,4},'7级灵石原石')",
			"gf_AddItemEx({2,101,14,1,4},'强化精石（13级）')",
			"gf_AddItemEx({2,94,12,1,4},'盛世金宝箱')",
		},
		[3] = {
			"gf_Modify('Exp',5000000)", 
			"gf_Modify('Money',200000)", 
			"gf_Modify('Popur',200)", 
			"gf_AddItemEx({2,95,55,20,4},'神器')",
			"gf_AddItemEx({2,95,5435,20,4},'灵石宝箱')",
			"gf_AddItemEx({2,95,559,2,4},'7级灵石原石')",
			"gf_AddItemEx({2,101,13,1,4},'强化精石（12级）')",
			"gf_AddItemEx({2,94,11,1,4},'盛世银宝箱')",
		},
		[4] = {
			"gf_Modify('Exp',3000000)", 
			"gf_Modify('Money',100000)", 
			"gf_Modify('Popur',100)", 
			"gf_AddItemEx({2,95,55,10,4},'神器')",
			"gf_AddItemEx({2,95,5435,10,4},'灵石宝箱')",
			"gf_AddItemEx({2,101,12,1,4},'强化精石（11级）')",
		},	
		[5] = {
			"gf_Modify('Exp',1000000)", 
			"gf_AddItemEx({2,95,55,5,4},'神器')",
			"gf_AddItemEx({2,95,5435,2,4},'灵石宝箱')",
		},	
		[6] = {
			"gf_Modify('Exp',100000)", 
			"gf_AddItemEx({2,95,55,1,4},'神器')",
		},	
	}
	for i = 1,getn(tTemp[nType]) do
		dostring(tTemp[nType][i]);
	end
end;

function tct_daily_reset()
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), 1, 0));
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), 2, 0));
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), 3, 0));
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), 4, 0));
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), 5, 0));
	SetTask(TSK_TctAward, SetBit(GetTask(TSK_TctAward), 6, 0));
	SetTask(TSK_UpCount, 0);
end

function delnpc()
	local npcIndex = GetTargetNpc()
	SetNpcLifeTime(npcIndex, 0)
end
