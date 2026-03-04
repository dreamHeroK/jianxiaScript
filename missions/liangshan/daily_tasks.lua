--脚本名称：梁山关卡日常任务
--脚本功能：初演挑战：每日第一次完成梁山群雄会1-4关的挑战（在黑风寨击败梁山好汉），可获得 ……
--脚本功能：忠勇挑战：每日第一次完成梁山群雄会1-5关的挑战（在聚义堂击败梁山好汉），可获得 ……
--脚本功能：夺军挑战：每日击败“xx”（例：霹雳火秦明），可获得……只会随机到D，E级boss。
--功能策划：谢徐春
--功能开发：朱力
--开发时间：2010-01-18
--代码修改记录
--===村长2011-2-18开始移植
--主要修改：奖励概率、对话转移、物品格式
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--奖励真气的接口
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\meridian\\vet_jihuo_wuzun.lua")



--LiangShan_DailyTaskState 梁山日常任务状态
LS_DTS_TASK_NONE 	= 0;	-- 还没接任务
LS_DTS_TASK_DOING	= 1;	-- 正在任务 已接受任务
LS_DTS_TASK_DONE 	= 2;	-- 已完成任务
LS_DTS_AWARD_DONE	= 3;	-- 已领取奖励

__t_free_award_no_stage ={
	n_other_group_rate = 100000,--随机到杂物组的概率
	n_equip_group_rate = 0,--随机到装备组的概率
	n_daibi_group_rate = 0,--随机到代币组的概率
	t_daibi_group ={},
	t_equip_group = {},
}
__t_free_award_stage ={
	[1] = {
		t_other_group ={
			{ {"师门圣物", {2,95,205,1}, nil,nil,{1, 100} }, 4000},
		},
	},
	[2] = {
		t_other_group ={
			{{MA_GiveMoney, {50000}}, 4000},
			{{MA_GiveMoney, {100000}}, 800},
			{{MA_GiveMoney, {400000}}, 100},
        		{{MA_GiveLingShi, {3, 1}}, 1000},
			{ {"辉星碎片", {2,95,769,5, 4}, nil,nil,{1, 100} }, 800},
			{ {"皓月碎片", {2,95,740,10}, nil,nil,{1, 100} }, 300},
			{ {"陨铁", {2,2,8,10, 4}, nil,nil,{1, 100} }, 700},
			{ {"小般若树种", {2,0,504,1, 4}, nil,nil,{1, 100} }, 1000},
			{ {"师门圣物", {2,95,205,1}, nil,nil,{1, 100} }, 300},
		},
	},
	[3] = {
		t_other_group ={
			{{MA_GivePopur, {1000}}, 2500},
			{{MA_GivePopur, {2000}}, 2500},
			{{MA_GivePopur, {4000}}, 5000},
        		{{MA_GiveLingShi, {3, 1}}, 2000},
			{ {"辉星碎片", {2,95,769,2, 4}, nil,nil,{1, 100} }, 800},
			{ {"皓月碎片", {2,95,740,10}, nil,nil,{1, 100} }, 300},	
			{ {"师门圣物", {2,95,205,1}, nil,nil,{1, 100} }, 300},
			{ {"般若树种", {2,0,398,1, 4}, nil,nil,{1, 100} }, 1500},
			{ {"辉星碎片", {2,95,769,15, 4}, nil,nil,{1, 100} }, 1000},
		},
	},
}

t_ls_daily_task_award = {
	t_free_award = 
	{
		sz_award_title = "完成了梁山每天的任务",
		--几次没有得到装备时必出装备
		t_equip_round = {},
		n_max_daibi_perday = 0,--一天最多获得多少代币
		t_stage =
		{
			[1] = inherit(__t_free_award_no_stage, __t_free_award_stage[1]),
			[2] = inherit(__t_free_award_no_stage, __t_free_award_stage[2]),
			[3] = inherit(__t_free_award_no_stage, __t_free_award_stage[3]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "梁山每日任务固定奖励",
		t_stage = {
        	[1] ={
				{MA_GiveExp, {1496375}},
				{MA_GiveYinQuan, {25}},
				{MA_GivePop, {11, 25}},
        		},
        	[2] ={
				{MA_GiveExp, {1496375}},
				{MA_GiveYinQuan, {35}},
				{MA_GivePop, {11, 35}},
        		},
        	[3] ={
				{MA_GiveExp, {1496375}},
				{MA_GiveYinQuan, {45}},
				{MA_GivePop, {11, 45}},
        		},
        },
	},
};
__t_free_award_no_stage=nil
__t_free_award_stage =nil

g_tDailyTasksInfo = {
	[1] = {
		szTitle	= LSTaskInfo[1][1],
		szInfo  = LSTaskInfo[1][2],
		nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1,
		tAward  = {
			{100,	LSTaskBag1[4], {LSTaskBag1[1],LSTaskBag1[2],LSTaskBag1[3],1}},
		},
	},
	[2] = {
		szTitle	= LSTaskInfo[2][1],
		szInfo  = LSTaskInfo[2][2],
		nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2,
		tAward  = {
			{100,	LSTaskBag2[4], {LSTaskBag2[1],LSTaskBag2[2],LSTaskBag2[3],1}},
		},
	},
	[3] = {
		szTitle	= LSTaskInfo[3][1],
		szInfo  = LSTaskInfo[3][2],
		szInfo2 = LSTaskInfo[3][3],
		nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3,
		tAward  = {
			{100,	LSTaskBag3[4], {LSTaskBag3[1],LSTaskBag3[2],LSTaskBag3[3],1}},
		},
		tBossInfo = {
			tLevel  = {4, 5},
			nTaskID = VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3_BOSS,
		},
	},
};
--五行玄石ID整理
g_tDailyTaskBoxsInfo = {
	[1] = {
		szTitle = LSTaskBag1[4],
		tItemID = {LSTaskBag1[1],LSTaskBag1[2],LSTaskBag1[3]},
		tAward  = {
			nExp = 300000,
			tRand = {
				tItem  = {100},
				n      = 1,
			},
			tItem = {
				{60,	"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 3}	},
				{30,	"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 6}	},
				{5,		"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 9}	},
				{4,		"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 20}	},
				{1,		"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 66},	"%s 打开梁山初演包获得66个五行玄石！"},
			},
			tGold = {
			},
			tPopur = {
			},
		},
	},
	[2] = {
		szTitle = LSTaskBag2[4],
		tItemID = {LSTaskBag2[1],LSTaskBag2[2],LSTaskBag2[3]},
		tAward  = {
			nExp = 600000,
			tRand = {
				tItem  = {50},
				tGold  = {50},
				n      = 2,
			},
			tItem = {
				{98,	"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 6}},
				{2,		"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 77},"%s 打开梁山忠勇包获得77个五行玄石！"},
			},
			tGold = {
				{92,	10*100*100},
				{6,		20*100*100},
				{2,		200*100*100,"%s 打开梁山忠勇包获得200金！"},
			},
		},
	},
	[3] = {
		szTitle = LSTaskBag3[4],
		tItemID = {LSTaskBag3[1],LSTaskBag3[2],LSTaskBag3[3]},
		tAward  = {
			nExp = 1000000,
			tRand = {
				tItem  = {50},
				tPopur = {50},
				n      = 2,
			},
			tItem = {
				{98,	"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 8}},
				{2,		"五行玄石",	{LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3], 99},"%s 打开梁山夺军包获得99个五行玄石！"},
			},
			tGold = {
			},
			tPopur = {
				{40,	1000,},
				{50,	2000,},
				{10,	4000,},
			},
		},
	},
};

function DailyTasksMenu()
	local tSay = {
		msg = "<color=green>"..NpcName[1][2].."<color>"..NpcSayInfo[14][1],
		sel = {
			{NpcSayInfo[14][2], T, },
			{NpcSayInfo[14][3], "nothing", },
		},
	};

	for nIdx, tTaskInfo in g_tDailyTasksInfo do
		local szBuff1 = format("◆ %s", tTaskInfo.szTitle);
		local szBuff2 = format("#DailyTasksSubMenu(%d)", nIdx);
		tinsert(tSay.sel, 1, {szBuff1, szBuff2});
	end

	temp_Talk(tSay);

end

function DailyTasksSubMenu(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];
	local nState, nTime = GetTaskState(nIdx);

	local tSay = {
		msg = "<color=green>"..NpcName[1][2].."<color>："..tTaskInfo.szInfo,
		sel = {
			{NpcSayInfo[14][2], "DailyTasksMenu", },
			{NpcSayInfo[14][3], "nothing", },
		},
	};

	if nTime ~= tonumber(date("%Y%m%d")) and (nState ~= LS_DTS_TASK_DOING and nState ~= LS_DTS_TASK_DONE) then
		nState = LS_DTS_TASK_NONE;
	end

	if nState == LS_DTS_TASK_DOING then
		tSay.msg = tSay.msg.."\n                                        <color=green>"..NpcSayInfo[14][4].."<color>"
		tinsert(tSay.sel, 1, {NpcSayInfo[14][5], format("#QueryTask(%d)", nIdx)});
	elseif nState == LS_DTS_TASK_DONE then
		tSay.msg = tSay.msg.."\n                                        <color=green>"..NpcSayInfo[14][6].."<color>"
		tinsert(tSay.sel, 1, {NpcSayInfo[14][7], format("#TaskAward(%d)", nIdx)});
	elseif nState == LS_DTS_AWARD_DONE then
		tSay.msg = tSay.msg.."\n                                        <color=green>"..NpcSayInfo[14][8].."<color>"
	else
		tinsert(tSay.sel, 1, {NpcSayInfo[14][9], format("#GivenTask(%d)", nIdx)});
	end

	temp_Talk(tSay);

end

function TaskAward(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	if 1 ~= gf_Judge_Room_Weight(2+2, 0, format("<color=green>[%s]<color>:", tTaskInfo.szTitle)) then --+2预留给活动奖励
		return 0;
	end

	local nCSD_LS = floor(GetTask(TSK_CSD_COUNT_A) / 10000000)
	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),10000000)
	if mod(nCSD_LS, 100) < 30 and GetTask(TSK_CSD) == 1 then
		nCSD_LS = (nCSD_LS + 1) * 10000000 + nNumBK
		SetTask(TSK_CSD_COUNT_A, nCSD_LS)
	end

	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2) < 60 then
		gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2) == 60 then
			TaskTip("已完成60次梁山日常任务")
		end
	end

	local nCS6_LS =  floor(GetTask(TSK_CS6_COUNTC)/10000)
	local nCS6_LS_Num = mod(GetTask(TSK_CS6_COUNTC),10000)
	if mod(nCS6_LS,100) < 15 and GetTask(TSK_CS6_TULINH) == 3 then
		nCS6_LS = (nCS6_LS + 1) * 10000 + nCS6_LS_Num
		SetTask(TSK_CS6_COUNTC, nCS6_LS)
	end
	-------------------------------
	
--	BoxAward_Item(tTaskInfo.tAward);
--	AwardZhenQi_LiangShan(nIdx)--真气奖励
	MissionAward_RandAward(nIdx, -1, t_ls_daily_task_award);
	MissionAward_FixAward(nIdx,t_ls_daily_task_award);
	
	runtime_stat_event(RUNTIME_STAT_SYS_LIANGSHAN, RUNTIME_STAT_EVENT_FINISH_TASK, nIdx, 1)--统计事件

	SetTaskState(nIdx, LS_DTS_AWARD_DONE);

	if CFG_NhiemVuLamGiau == 1 then
		if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 4) == 0 and mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1), 10) == 3 and mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2), 10) == 3 and mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3), 10) == 3  then
			gf_SetTaskBit(TSK_LAMGIAU, 4, 1, 0)
			TaskTip("完成日常任务：完成03梁山任务。")
		end
	end
	
	-- Event
--	EventAddMaterial(2)

	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 19));
	------------------------------
	--梁山每日任务的活动调用
	vaf_liangshan_daily_task()
	_vjw_SetLs();
--	Observer:onEvent(SYSEVENT_LIANGSHAN_TASK_AWARD, nIdx)
end

function GivenTask(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	if tTaskInfo.tBossInfo then
		local nBossID = RandomSelectedBoss(tTaskInfo.tBossInfo);
		SetTask(tTaskInfo.tBossInfo.nTaskID, nBossID);
	end
	SetTaskState(nIdx, LS_DTS_TASK_DOING);

	QueryTask(nIdx);
end

function QueryTask(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	local szMsg = tTaskInfo.szInfo;

	if tTaskInfo.tBossInfo then
		szMsg = format(tTaskInfo.szInfo2, tMission:getBossName(GetTask(tTaskInfo.tBossInfo.nTaskID)));		
	end

	Talk(1, "", format(LSSysTalk[14][1].."<color=green>%s<color>? \n\n%s", tTaskInfo.szTitle, szMsg));
end

function RandomSelectedBoss(tBossInfo)
	local nMax = 0;

	for _, nLv in tBossInfo.tLevel do
		if tMission.tBoss[nLv] then
			nMax = nMax + getn(tMission.tBoss[nLv]);
		end
	end

	local nRand = random(1, nMax);

	for _, nLv in tBossInfo.tLevel do
		if tMission.tBoss[nLv] then
			if nRand - getn(tMission.tBoss[nLv]) <= 0 then
				return tMission.tBoss[nLv][nRand];
			else
				nRand = nRand - getn(tMission.tBoss[nLv]);
			end
		end
	end

	assert();
end

function SetTaskDone(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	local nState, nTime = GetTaskState(nIdx);
	if nState ~= LS_DTS_TASK_DOING then
		return 0;
	end

	SetTaskState(nIdx, LS_DTS_TASK_DONE);

	Msg2Player(format(LSMsgToPlayer[14],tTaskInfo.szTitle,NpcName[1][2]))
	Talk(1, "", format("<color=green>"..NpcName[1][2].."<color>："..LSSysTalk[14][2], tTaskInfo.szTitle));
end

function LM_SetTaskDone(nIdx, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funSetTaskDone = function(tbArg)
		SetTaskDone(%nIdx);
		
		-- Event
--		EventAddMaterial(2)
	end;
	gf_OperatePlayers(tbPlayer,funSetTaskDone,{});
end;

function OnUse(nIdx)
	local nItemIndex = tonumber(nIdx);
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex);
	local nBoxIdx = 0;

	for i, tBoxInfo in g_tDailyTaskBoxsInfo do
		if tBoxInfo.tItemID[1] == nGenre and tBoxInfo.tItemID[2] == nDetail and tBoxInfo.tItemID[3] == nParticular then
			nBoxIdx = i;
			break
		end
	end

	BoxAward(nBoxIdx);
end

function BoxAward(nIdx)
	if not g_tDailyTaskBoxsInfo[nIdx] then
		return 0;
	end

	local tBoxInfo = g_tDailyTaskBoxsInfo[nIdx];

	if 1 ~= gf_Judge_Room_Weight(2, 0, format("<color=green>[%s]<color>:", tBoxInfo.szTitle)) then
		return 0;
	end

	if 1 ~= DelItem(tBoxInfo.tItemID[1], tBoxInfo.tItemID[2], tBoxInfo.tItemID[3], 1) then
		return 0;
	end
	--先给经验
	if tBoxInfo.tAward.nExp ~= nil then
		ModifyExp(tBoxInfo.tAward.nExp)
		Msg2Player(format(LSMsgToPlayer[16],tBoxInfo.tAward.nExp))
	end
	--再处理其他
	local szKey = RandomSelected(tBoxInfo.tAward.tRand);
	if not g_tfunBoxAward[szKey] then
		return 0;
	end

	g_tfunBoxAward[szKey](tBoxInfo.tAward[szKey]);
end

function RandomSelected(tData)
	if not tData or 0 == getn(tData) then
		return 0;
	end

	local nMax = 0;
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nMax = nMax + tInfo[1];
		end
	end

	local nRand = random(1, nMax);
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nRand = nRand - tInfo[1];
			if nRand <= 0 then
				return idx;
			end
		end
	end

	assert();
end

function BoxAward_Item(tItem)
	local nSel = RandomSelected(tItem);

	if not tItem[nSel] then
		return 0;
	end

	gf_AddItemEx(tItem[nSel][3], tItem[nSel][2]);
	--越南版增加世界消息
	if tItem[nSel][4] ~= nil then
		Msg2Global(format(tItem[nSel][4],GetName()))
	end
end

function BoxAward_Gold(tGold)
	local nSel = RandomSelected(tGold);

	if not tGold[nSel] then
		return 0;
	end

	Earn(tGold[nSel][2]);
	--越南版增加世界消息
	if tGold[nSel][3] ~= nil then
		Msg2Global(format(tGold[nSel][3],GetName()))
	end
end

function BoxAward_Popur(tPopur)
	local nSel = RandomSelected(tPopur);

	if not tPopur[nSel] then
		return 0;
	end
	ModifyPopur(tPopur[nSel][2], 0);
	Msg2Player(format(LSMsgToPlayer[15], tPopur[nSel][2]));
end

function GetTaskState(nIdx)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	local temp = GetTask(tTaskInfo.nTaskID);
	local nTime  = floor(temp / 10);
	local nState = mod(temp, 10);

	return nState, nTime;
end

function SetTaskState(nIdx, nState)
	if not g_tDailyTasksInfo[nIdx] then
		return 0;
	end

	local tTaskInfo = g_tDailyTasksInfo[nIdx];

	if nState and nState >= 10 or nState < 0 then
		return 0;
	end

	local temp = tonumber(date("%Y%m%d")) * 10 + nState;
	SetTask(tTaskInfo.nTaskID, temp);
end

g_tfunBoxAward = {
	tItem  = BoxAward_Item,
	tGold  = BoxAward_Gold,
	tPopur = BoxAward_Popur,
};
