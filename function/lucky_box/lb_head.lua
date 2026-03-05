Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\function\\lucky_box\\lb_define.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\class\\ktabfile.lua")
Include("\\script\\lib\\talktmp.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

--奖励配置表-----------------------------------------------
g_LuckyBoxAwardTab = ff_GetTabFileTable(LB_AWARD_CONFIG, 3);
if not g_LuckyBoxAwardTab then
	print("ERROR:can not read \\script\\function\\lucky_box\\lucky_box.txt!!!");
end

g_LuckyBoxFreeAward = {};
for i = 1, getn(g_LuckyBoxAwardTab) do
	g_LuckyBoxFreeAward[i] = {i, g_LuckyBoxAwardTab[i][6]};
end

g_LuckyBoxIBAward = {};
for i = 1, getn(g_LuckyBoxAwardTab) do
	g_LuckyBoxIBAward[i] = {i, g_LuckyBoxAwardTab[i][10]};
end
------------------------------------------------------------
--随机奖励，返回1-28
--失败返回0
--"Free"免费概率
--"IB"收费概率
function lb_RandomOneAward(nType)
	if not g_LuckyBoxAwardTab then
		DebugOutput("g_LuckyBoxAwardTab is nil")
		return 0;
	end
	if "string" ~= type(nType) then
		DebugOutput("'string' ~= type(nType)")
		return 0;
	end
	if "Free" == nType then
		return gf_GetRandItemByTable(g_LuckyBoxFreeAward, gf_SumRandBase(g_LuckyBoxFreeAward), 0);
	elseif "IB" == nType then
		return gf_GetRandItemByTable(g_LuckyBoxIBAward, gf_SumRandBase(g_LuckyBoxIBAward), 0);
	end
	return 0;
end

--给奖励
function _lb_DoAward(nLotteryType)
	if not g_LuckyBoxAwardTab then
		g_LuckyBoxAwardTab = ff_GetTabFileTable(LB_AWARD_CONFIG, 3);
	end
	if not g_LuckyBoxAwardTab or getn(g_LuckyBoxAwardTab) ~= 28 then
		WriteLog(format("[luckybox][Error][Name:%s] _lb_DoAward(%d) can not read lucky_box.txt TaskValue = %d", GetName(), nLotteryType, GetTask(TASKID_LUCKYBOX_LOTTERY)));
		gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
		return 0;
	end
	local nIndex = gf_GetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13);
	local nIBOrFreeType = gf_GetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16);
	local tCell = g_LuckyBoxAwardTab[nIndex]
	if not tCell or getn(tCell) < 13 then
		WriteLog(format("[luckybox][Error][Name:%s] _lb_DoAward(%d) not tCell or getn(tCell) ~= 13 TaskValue = %d", GetName(), nLotteryType, GetTask(TASKID_LUCKYBOX_LOTTERY)));
		gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
		return 0;
	end
	--重置抽奖结果
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	if nIBOrFreeType == 0 then
		DebugOutput(tCell[1],tCell[2],tCell[3],tCell[4],tCell[5],tCell[6],tCell[7],tCell[8],tCell[9],tCell[10],tCell[11],tCell[12],tCell[13])
		if GetFreeItemRoom() > 0 then
			gf_AddItemEx2({tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]), tonumber(tCell[5]), tonumber(tCell[8])},
				 tCell[1], "幸运百宝箱", "FREE", tonumber(tCell[7]) * 24 *3600, 1);
			if tonumber(tCell[9]) == 1 then
				Msg2Global(format("恭喜[%s]在幸运百宝箱抽奖获得[%s]×%d，真的好运气！", GetName(), tCell[1], tonumber(tCell[5])));
			end
		else
			Msg2Player("您的背包空间不足，请整理一下再来。");
			gf_WriteLogEx("luckybox", "lack of free room");
		end
	elseif nIBOrFreeType == 1 then
		DebugOutput(tCell[1],tCell[2],tCell[3],tCell[4],tCell[5],tCell[6],tCell[7],tCell[8],tCell[9],tCell[10],tCell[11],tCell[12],tCell[13])
		if GetFreeItemRoom() > 0 then
			gf_AddItemEx2({tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]), tonumber(tCell[5]), tonumber(tCell[12])},
				 tCell[1], "幸运百宝箱", "IB", tonumber(tCell[11]) * 24 *3600, 1);
			if tonumber(tCell[13]) == 1 then
				Msg2Global(format("恭喜[%s]在幸运百宝箱抽奖获得[%s]×%d，真的好运气！", GetName(), tCell[1], tonumber(tCell[5])));
			end
			local szItemName = GetItemName(tonumber(tCell[2]), tonumber(tCell[3]), tonumber(tCell[4]));
			DebugOutput("szItemName =", szItemName);
--			--统计产出
--			if "天罡令" == szItemName then
--				AddRuntimeStat(17, 10, 0, 1);
--			elseif "天门金令" == szItemName then
--				AddRuntimeStat(17, 11, 0, 1);
--			elseif "雷虎精魄" == szItemName then
--				AddRuntimeStat(17, 12, 0, 1);
--			end
		else
			Msg2Player("您的背包空间不足，请整理一下再来。");
			gf_WriteLogEx("luckybox", "lack of free room");
		end
		--继续下一轮
		local nLotteryCount = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3);
		if nLotteryCount - 1 > 0 then --是否为10次连开
			lb_CostMoreIBItem(nLotteryType, nLotteryCount - 1);
		end
	end
end

--活动是够开启
function lb_IsOpen()
	-- return 1;
	--不做为活动放了-----
	--if 1 then
	--	return 0
	--end
	---------------------
	local nCurrTime = GetTime();
	local nStartTime = MkTime(LB_START_TIME[1],LB_START_TIME[2],LB_START_TIME[3],LB_START_TIME[4],LB_START_TIME[5],LB_START_TIME[6]);
	local nEndTime = MkTime(LB_STOP_TIME[1],LB_STOP_TIME[2],LB_STOP_TIME[3],LB_STOP_TIME[4],LB_STOP_TIME[5],LB_STOP_TIME[6]);
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		return 1;
	end
	return 0;
end

--检查活动参与条件
function lb_CheckCondition()
	if GetLevel() < 10 then
		Talk(1,"",format("角色等级需要<color=red>%d<color>级才可以参加幸运抽奖。", 10));
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	return 1;
end

--每日清理
function lb_DailyClear()
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1, LB_FREE_USE_MAX, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, LB_IB_ITEM_USE_MAX, TASK_ACCESS_CODE_LUCKY_BOX);
end

--打开关闭界面时清理
function _lb_UIChange_Clean()
	DebugOutput("_lb_UIChange_Clean()")
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, 0, TASK_ACCESS_CODE_LUCKY_BOX);
end

--进行一次免费抽奖
function lb_CostOneLuckyCoin(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetItemCount(LB_FREE_COST_ITEM[1], LB_FREE_COST_ITEM[2], LB_FREE_COST_ITEM[3]) < LB_FREE_COST_ITEM[4] then
		Talk(1,"",format("您的<color=red>%s<color>不足<color=red>%d<color>个，不能抽奖！", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
		return 0;
	end
	local nRet = lb_RandomOneAward("Free");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostOneLuckyCoin(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		return 0;
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","休息一下，然后再试一次！");
		return 0;
	end
	if DelItem(gf_UnPack(LB_FREE_COST_ITEM)) ~= 1 then
		Talk(1,"",format("使用<color=yellow>%s×%d<color>抽奖出现错误，稍后再试一次。", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
		return 0;
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_FREE_COST_ITEM)
	Msg2Player(format("您消耗了[%s]×%d", LB_FREE_COST_ITEM[5], LB_FREE_COST_ITEM[4]));
	local nCount = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1);
	--统计免费开启人数
	if LB_FREE_USE_MAX == nCount then
		AddRuntimeStat(17, 14, 0, 1);
	end
	AddRuntimeStat(17, 13, 0, 1);
	--免费次数自减 
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1, nCount - 1, TASK_ACCESS_CODE_LUCKY_BOX);
	--记录抽奖结果
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--记录连续抽奖剩余次数
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, 0, TASK_ACCESS_CODE_LUCKY_BOX);
	
	StartLuckyBox(nLotteryType, nLotteryCount);
end

--进行一次IB抽奖
function lb_CostOneIBItem(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	local nIBTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4);
	if nIBTimes <= 0 then
		Talk(1,"",format("您今天可以参与%s%d次，还剩余%d次", "幸运抽奖", LB_IB_ITEM_USE_MAX, nIBTimes));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetItemCount(LB_IB_COST_ITEM[1], LB_IB_COST_ITEM[2], LB_IB_COST_ITEM[3]) < LB_IB_COST_ITEM[4] then
		Talk(1,"",format("您的<color=red>%s<color>不足 <color=red>%d<color>个，不能抽奖。", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		return 0;
	end
	local nRet = lb_RandomOneAward("IB");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostOneIBItem(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		return 0;
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","休息一下，然后再试一次！");
		return 0;
	end
	if DelItem(gf_UnPack(LB_IB_COST_ITEM)) ~= 1 then
		Talk(1,"",format("使用<color=yellow>%s×%d<color>抽奖出现错误，稍后再试一次。", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		return 0;
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_IB_COST_ITEM)
	Msg2Player(format("您消耗了[%s]×%d", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		
	--记录抽奖结果
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 1, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--记录连续抽奖剩余次数
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, nLotteryCount, TASK_ACCESS_CODE_LUCKY_BOX);
	--使用一次幸运摇奖
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, nIBTimes - 1, TASK_ACCESS_CODE_LUCKY_BOX);
		
	StartLuckyBox(nLotteryType, nLotteryCount);
	
	--总人数
	if LB_IB_ITEM_USE_MAX == nIBTimes then
		AddRuntimeStat(17, 16, 0, 1);
	end
	--总次数
	AddRuntimeStat(17, 15, 0, 1);
end

--进行多次IB抽奖
function lb_CostMoreIBItem(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if 10 == nLotteryCount then
		--开始连抽前判断是否够10个格子
		if gf_Judge_Room_Weight(10, 100, " ") ~= 1 then
			return 0;
		end
	end
	if gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 2) ~= 0 then
		Talk(1,"","休息一下，然后再试一次！");
		StartLuckyBox(0, 0);
		return 0;
	end
	local nRet = lb_RandomOneAward("IB");
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[luckybox][Error][Name:%s] lb_CostMoreIBItem(%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet));
		StartLuckyBox(0, 0);
		return 0;
	end
	--扣除代币
	local nIBTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4);
	if nIBTimes <= 0 then
		Talk(1,"",format("您今天可以参与%s%d次，还剩余%d次", "幸运抽奖", LB_IB_ITEM_USE_MAX, nIBTimes));
		StartLuckyBox(0, 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		StartLuckyBox(0, 0);
		return 0;
	end
	if GetItemCount(LB_IB_COST_ITEM[1], LB_IB_COST_ITEM[2], LB_IB_COST_ITEM[3]) < LB_IB_COST_ITEM[4] then
		Talk(1,"",format("您的<color=red>%s<color>不足 <color=red>%d<color>个，不能抽奖。", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		StartLuckyBox(0, 0);
		return 0;
	end
	if DelItem(gf_UnPack(LB_IB_COST_ITEM)) ~= 1 then
		Talk(1,"",format("使用<color=yellow>%s×%d<color>抽奖出现错误，稍后再试一次。", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
		StartLuckyBox(0, 0);
		return 0;
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, LB_IB_COST_ITEM)
	Msg2Player(format("您消耗了[%s]×%d", LB_IB_COST_ITEM[5], LB_IB_COST_ITEM[4]));
	
	--使用1次天骄令
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 4, nIBTimes - 1, TASK_ACCESS_CODE_LUCKY_BOX);
	--记录抽奖结果
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 14, 16, 1, TASK_ACCESS_CODE_LUCKY_BOX);
	gf_SetMyTaskBit(TASKID_LUCKYBOX_LOTTERY, 9, 13, nRet, TASK_ACCESS_CODE_LUCKY_BOX);
	--记录连续抽奖剩余次数
	gf_SetTaskByte(TASKID_LUCKYBOX_LOTTERY, 3, nLotteryCount, TASK_ACCESS_CODE_LUCKY_BOX);
	
	StartLuckyBox(nLotteryType, nLotteryCount);
	
	--总人数
	if LB_IB_ITEM_USE_MAX == nIBTimes then
		AddRuntimeStat(17, 16, 0, 1);
	end
	--总次数
	AddRuntimeStat(17, 15, 0, 1);
end
			
--gs调用接口LuckyBox.cpp----------------------
function _lb_OnLottery(nLotteryType, nLotteryCount)
	DebugOutput("nLotteryType, nLotteryCount =", nLotteryType, nLotteryCount)
	if lb_CheckCondition() ~= 1 then
		return 0;
	end
	--抽一次
	if 1 == nLotteryType then
		local nFreeTimes = gf_GetTaskByte(TASKID_LUCKYBOX_LOTTERY, 1);
		if nFreeTimes > 0 then
			lb_CostOneLuckyCoin(nLotteryType, nLotteryCount); --免费一次
			return 1;
		else	
			--今日没有免费次数
			lb_CostOneIBItem(nLotteryType, nLotteryCount); --IB一次
			return 1;
		end
	--抽10次
	elseif 2 == nLotteryType then
		Say(format("<color=green>幸运百宝箱<color>：%s确认要参与10次幸运抽奖吗？", gf_GetPlayerSexName()), 2,
					format("\n确定/#lb_CostMoreIBItem(%d, %d)", nLotteryType, nLotteryCount),  --IB 一次
					"我再想一想/nothing");
		return 1;
	end
	return 0;
end

--活动NPC部分------------------------------------
LB_NPC_TITLE = "新春佳节来临之际，活动大使为大侠准备了幸运百宝箱，赶快参与并获得丰厚的奖励！"

LB_NPC_DIALOG = {
	"参加幸运百宝箱活动/lb_JoinActivity",
--	"关于幸运百宝箱/lb_ActivityInfo",
--	"购买幸运金币/lb_ItemDorp",
}

function lb_JoinActivity()
	if lb_IsOpen() ~= 1 then
		Talk(1,"","活动尚未开启");
		return 0;
	end		
	SendScript2Client("Open[[luckybox]]");	
end

function lb_ActivityInfo()
	local strTitle = "幸运转转转\n02月09日至02月19日期间，玩家通过在线系统和活跃系统，可以领取到幸运银币和幸运金币，使用幸运硬币进行抽奖。每次抽奖消耗1个幸运硬币。\n若需要更多幸运金币，可以在游戏活动大使处进行购买，最多可购买200个幸运金币。";
	local tbSay = {};
	tbSay.msg = strTitle;
	tbSay.sel = {
		{"\n结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function lb_ItemDorp()
	local tbSay = {};
	tbSay.msg = "<color=green>游戏活动大使<color>：活动期间，各位侠士可以购买幸运金币！";
	tbSay.sel = {
		{"购买幸运金币（02月09日至02月20日）","do_lb_ItemDorp"},
		{"结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function do_lb_ItemDorp()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20210207 and nDate <= 20210219 then
		if GetCash() < 1000000 then
			Talk(1,"","<color=green>游戏活动大使<color>：您身上不足100金。");
			return
		end
		if GetTask(1480) >= 200 then
			Talk(1,"","<color=green>游戏活动大使<color>：你已经购买200个幸运金币，不可再购买了。");
			return
		end
		PrePay(1000000)
		local nRet, nItemIdx = gf_AddItemEx({2, 95, 197, 1, 1},"幸运金币");
		gf_SetItemExpireTime(nItemIdx, gf_UnPack(LB_STOP_TIME));
		PlayerFunLib:AddTask(1480, 1) -- 标记购买数量
	else
		Talk(1,"", "<color=green>游戏活动大使<color>：不在活动期间，活动时间为2021年02月09日至2021年02月19日。")
	end
end;

--幸运币掉落部分-------------------------------------
--系统公告调用
function main()
	-- if lb_IsOpen() ~= 1 then
	-- 	return 0;
	-- end
	-- local nHour = tonumber(date("%H"))
	-- local msg = ""
	-- if nHour >= 11 and nHour <= 12 then
	-- 	msg = "11:00-13:00 幸运转转转活动开启，前往沙漠迷宫和药王谷击杀怪物，幸运硬币双倍掉落！"
	-- 	Msg2Global(msg);
	-- 	AddGlobalNews(msg, 1);
	-- elseif nHour >= 20 and nHour <= 21 then
	-- 	msg = "20:00-22:00 幸运转转转活动开启，前往沙漠迷宫和药王谷击杀怪物，幸运硬币双倍掉落！"
	-- 	Msg2Global(msg);
	-- 	AddGlobalNews(msg, 1);
	-- end
end

--幸运币掉落
function lb_OnKiller(szNpcName)
	-- if lb_IsOpen() ~= 1 then
	-- 	return 0;
	-- end
	-- if szNpcName ~= "沙漠行者" and szNpcName ~= "寻宝人" and szNpcName ~= "西夏武士" and szNpcName ~= "西夏勇士" then
	-- 	return 0;
	-- end
	-- local nRand = 3;
	-- local nHour = tonumber(date("%H"))
	-- if (nHour >= 11 and nHour <= 12) or (nHour >= 20 and nHour <= 21) then
	-- 	nRand = 8
	-- end
	-- if random(100) > nRand then
	-- 	return 0;
	-- end
	-- local nMapID, nX, nY = GetWorldPos()
	-- gf_TeamOperateEX(function ()
	-- 	if nMapID ~= GetWorldPos() then
	-- 		return
	-- 	end
	-- 	GiveWishAward()
	-- end)
end


function GiveWishAward()
	local tAward = {
		{1, 2500, "幸运金币", {2, 95, 197, 1, 4}},
		{1, 7500, "幸运银币", {2, 95, 198, 1, 4}},
	}
	local nIndex = gf_GetRandItemByTable(tAward,10000,2)
	local nRet, nItemIdx = gf_AddItemEx({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tAward[nIndex][4][4], tAward[nIndex][4][5]}, tAward[nIndex][3]);
	gf_SetItemExpireTime(nItemIdx, gf_UnPack(LB_STOP_TIME));
end