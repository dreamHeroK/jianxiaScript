
Include("\\script\\lib\\globalfunctions.lua");

nMaxHuoYueDu = 125	
TSK_TotalHuoYueDu = 1401 			--记录玩家每天在所有活动里获得总活跃度
TSK_SumHuoYueDu = 1402 				--记录玩家累计活跃度
TSK_HuoYueDuAward = 1512 					--记录活跃度领奖

OPENED = 1							-- 活跃度开启状态
CLOSED = 2  							-- 活跃度关闭状态
STATE = OPENED 						-- 活跃度是否开始，1为开启，其他均为关闭

--tbAwardKind = {5, 30, 60, 90, 125}
tbAwardKind = {5, 30, 60, 90, 125}
tbActivityTable = {
	[1] = {"登录有礼，每日首次登录可获得10点活跃度", 104, 1, {150}, 0, "            ", {0, }}, 
	[2] = {"VIP有礼，激活贵宾/至尊虎纹卡可获得5点活跃度", 105, 1, {5}, 0, "       ", {0, }}, 
	[3] = {"通关一次太虚幻境，可获得5点活跃度", 106, 2, {5, 5}, 0, "                 ", {1, 70}}, 
	[4] = {"完成一次战场，可获得10点活跃度", 107, 2, {10, 10}, 0, "                    ", {0, }}, 
	[5] = {"比武大会胜利一场，可获得5点活跃度", 108, 2, {5, 5}, 0, "                 ", {0, }}, 
	[6] = {"进入杀手堂1次，可获得10点活跃度", 109, 1, {10}, 0, "              ", {0, }}, 
	[7] = {"完成天门阵1次，可获得10点活跃度", 110, 2, {10, 10}, 0, "               ", {1, 70}}, 
	[8] = {"完成押镖1次，可获得2点活跃度", 111, 5, {2, 2, 2, 2, 2}, 0, "               ", {1, 70}}, 
	[9] = {"开启一次BOSS包裹，可获得2点活跃度", 112, 5, {2, 2, 2, 2, 2}, 0, "                 ", {1, 70}}, 
	[10] = {"通关一次英雄梵天林，可获得8点活跃度", 113, 2, {8, 8}, 0, "               ", {1, 70}}, 
	[11] = {"通关一次英雄太一塔，可获得8点活跃度", 114, 2, {8, 8}, 0, "               ", {1, 70}}, 
	[12] = {"通关一次大破地玄宫3关，可获得4点活跃度", 115, 3, {4, 4, 4}, 0, "            ", {1, 70}}, 
	[13] = {"通关一次梁山英雄会4关，可获得4点活跃度", 116, 3, {4, 4, 4}, 0, "            ", {1, 70}}, 
	[14] = {"通关一次梁山英雄会8关，可获得6点活跃度", 117, 3, {6, 6, 6}, 0, "            ", {1, 70}}, 
	[15] = {"通关一次藏剑山庄，可获得5点活跃度", 118, 5, {5, 5, 5, 5, 5}, 0, "                 ", {1, 70}}, 
	[16] = {"天门阵争夺中取胜一场，可获得8点活跃度", 119, 1, {8}, 0, "             ", {0, }}, 
	[17] = {"本周参与过10场比武大会，可获得6点活跃度", 120, 1, {6}, 1, "           ", {0, }}, 
	[18] = {"完成一次日常声望任务，可获得2点活跃度", 121, 9, {2, 2, 2, 2, 2, 2, 2, 2, 2}, 0, "             ", {0, }}, 
	[19] = {"完成梁山英雄会每日任务，可获得5点活跃度务", 122, 2, {5, 5}, 0, "           ", {0, }}, 
	[20] = {"完成大破地玄宫每日任务，可获得5点活跃度", 123, 1, {5}, 0, "           ", {0, }}, 
	[21] = {"完成一次藏宝图任务，可获得4点活跃度", 124, 1, {4}, 0, "               ", {0, }}, 
	[22] = {"成功收获小般若树种，可获得5点活跃度", 125, 1, {5}, 0, "               ", {0, }}, 
	[23] = {"成功收获般若树种，可获得5点活跃度", 148, 2, {5,5}, 0, "                 ", {0, }}, 
	[24] = {"通过科举考试院试，可获得2点活跃度", 149, 1, {2}, 0, "                 ", {0, }}, 
	[25] = {"通过科举考试乡试，可获得3点活跃度", 150, 1, {3}, 0, "                 ", {0, }}, 
}

function get_main_table(nActivityId)
	local gCell = tbActivityTable[nActivityId]
	local szDesc = gCell[1]
	local nTaskId = gCell[2]
	local nCount = gCell[3]
	local tbValue  = gCell[4]
	local szFillin  = gCell[6]
	local tbEasy  = gCell[7]
	return nTaskId, nCount, tbValue, szDesc, szFillin, tbEasy;
end

function AddHuoYueDu(nActivityId)
	if not nActivityId then
		return 
	end
	local nTaskId, nCount, tbValue, szDesc = get_main_table(nActivityId);

	local nResult = CheckTimes(nActivityId, nTaskId, nCount)
	if nResult ~= 1 then
		return
	end

	AddTaskDaily(nActivityId, nTaskId)

	local nTime = GetTaskDailyCount(nActivityId, nTaskId)
	local nAddedValue = tbValue[nTime]
	
	if nAddedValue == nil or type(nAddedValue) ~= "number" or nAddedValue <= 0 then
		return
	end
	
	PlayerFunLib:AddTask(TSK_SumHuoYueDu, nAddedValue) -- 跳过每日最大值，直接增加累计活跃度

	local nTaskValue = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	if nAddedValue > (nMaxHuoYueDu - nTaskValue) then
		nAddedValue = nMaxHuoYueDu - nTaskValue
	end
	if nAddedValue > 0 then
		Msg2Player(format("恭喜你获得%d点活跃度！",nAddedValue))
		PlayerFunLib:AddTaskDaily(TSK_TotalHuoYueDu, nAddedValue)
	end
end

function AddTaskDaily(nActivityId, nTaskId)
	PlayerFunLib:AddTaskDaily(nTaskId, 1)
end

function GetTaskDailyCount(nActivityId, nTaskId)
	local nResult = PlayerFunLib:GetTaskDailyCount(nTaskId)
	return nResult
end

function AddHuoYueDuAll(tbPlayer, szActivity)
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		AddHuoYueDu(szActivity);
	end;
	PlayerIndex = nOldPIdx;
end

function CheckTimes(nActivityId, nTaskId, nCount)
	if STATE ~= OPENED then
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(TSK_TotalHuoYueDu, nMaxHuoYueDu, "", ">=") == 1 then
		Msg2Player("你的活跃点今天已经满了，本次活跃点不计入内")
		return 
	end
	if PlayerFunLib:CheckTaskDaily(nTaskId, nCount, "", ">=") == 1 then
		return 
	end
	return 1
end

function ClearAll()
	SetTask(TSK_HuoYueDuAward, 0)
	SetTask(TSK_TotalHuoYueDu, 0)
end

