Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\system_switch_config.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\online_activites\\task_values.lua"); -- KS Task Control
g_szNpcName = "<color=green>先锋杨宗保<color>：";

function main()
local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 
 end
	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
		return 0;
	end
	local szName;
	local strTab = {
--		format("我要参加普通难度的梵天林(消耗 %s)/Talk_1_1", "精力*"..TYT_JOIN_COST_JINGLI[1][1]),
		format("我要参加普通难度的梵天林(队长消耗%s)/Talk_1_1_IB", TYT_JOIN_COST_ITEM[1][1][2].."*"..TYT_JOIN_COST_ITEM[1][1][1][4]),
--		format("我要参加普通难度的太一塔(消耗%s)/Talk_1_2", "精力*"..TYT_JOIN_COST_JINGLI[2][1]),
--		format("我要参加普通难度的太一塔(队长消耗%s)/Talk_1_2_IB", TYT_JOIN_COST_ITEM[2][1][2].."*"..TYT_JOIN_COST_ITEM[2][1][1][4]),
--		"关卡首通奖励领取/Talk_1_6",
	--	"游侠值/qrs_talk_2",
	--	"游侠值商店/nothing",
		"◆ 皓月装备商店/#show_equip_shop(3101)",
		"◆ 耀阳装备商店/#show_equip_shop(3102)",
		"◆ 龙隐装备商店/#show_equip_shop(3110)",
		"◆ 苍梧龙隐商店/#show_equip_shop(3111)",		
		"我只是来看看/nothing",
	};
	
	if GetSex() == 1 then
		szName = "少侠";
	elseif GetSex() == 2 then
		szName = "女侠";
	end
	Say(format(g_szNpcName.."金沙滩一役金刀杨令公遭奸臣潘美出卖被辽军所俘，身故后葬于辽境。探听得知，杨业被辽国安葬在一处名叫太一塔的地方，我和桂英奉命进入太一塔寻回老令公骨灰和其佩刀“荒火鎏金”。这太一塔内必然机关重重，凶险万分，少俠可做好准备？", szName), getn(strTab), strTab);
end

function Talk_1_1()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林非常拥挤，请待会再来！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey活动
	gf_TeamOperateEX(function () 
--		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end
----------------------------------------------新增检测机制-----------------------
tState = {}
function Task_Teamcheck()
	tState.count = 0;
	tState.diffMap = {};
    tState.Times = {};
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(checkTeamtimes,nMapID);
	local msg = "";
	local nResult = 1;
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员不在本地图：<color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	if getn(tState.Times) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员进入次数大于4次<color>";
		for i = 1, getn(tState.Times) do
			msg = msg .. tState.Times[i] .. " ";
		end
	end
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end
function checkTeamtimes(nMapID)
local nTalkValue = GetTask(3478) --太一 
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if m ~= nMapID then
		tinsert(tState.diffMap, GetName());
	end
	if nTalkValue >=  4 then 
		tinsert(tState.Times, GetName());
	end	
end
-------------------------------------------------------------------------------------------------
function Talk_1_1_IB()--此处添加
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
    if  Task_Teamcheck() ~= 1 then--增加了每日判断
	return 0;
	end
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林非常拥挤，请待会再来！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey活动
	gf_TeamOperateEX(function () 
--		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
	gf_TeamOperateEX(tyt_daily);--进入次数
end

----------------------------------------新增每日次数机制------------------------------------------
function tyt_daily()
local ntimes = GetTask(3478) --太一 
local ntimes2 = ntimes+1
SetTask(3478, ntimes+1);---进入次数	
Msg2Player("当前进入次数:"..ntimes2.."")
end

----------------------------------------新增每日次数机制------------------------------------------









function Talk_1_2()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林非常拥挤，请待会再来！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_2_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林非常拥挤，请待会再来！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_6()
	local strTab = {
		"获取奖励/Talk_1_6_1",
		"不获取/nothing",
	};
	local msg = "你如果是首次通过了太一塔，那么恭喜你,你可以领取奖励，但是你的等级必须达到80级且只能领取一次！";
	msg = msg..""
	Say(g_szNpcName..msg, getn(strTab), strTab);
end

function Talk_1_6_1()
	local nDate = tonumber(date("%Y%m%d"));
	local szGroupName = GetRelayGroup();
	if 1 == _JX2WZ then
		szGroupName = "wz"..szGroupName;
	elseif 1 == _JX2PAY then
		szGroupName = "pay"..szGroupName;
	elseif 1 == _JX2IB then
		szGroupName = "free"..szGroupName;
	end
	
--	if nDate < 20120331 or nDate > 20120405 then
--		Talk(1, "", g_szNpcName.."首通纪念奖励领取时间为2012年3月31日-2012年4月05日。");
--		return 0;
--	end

	if GetLevel() < 80 then
		Talk(1, "", "只有80级以上的玩家才能领取！");
		return 0;
	end
	
	local tSpecGroup = {
		["wz1-1"] = 1,
		["wz3-1"] = 1,
		["free100-8"] = 1,
		["pay1-3"] = 1,
	};
	if 0 == GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
		if tSpecGroup[szGroupName] then
			if 1 ~= gf_Judge_Room_Weight(13, 100, g_szNpcName) then
				return 0;
			end
		else
			if 1 ~= gf_Judge_Room_Weight(7, 100, g_szNpcName) then
				return 0;
			end
		end
	end
	
	if 0 ~= GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
		Talk(1, "", g_szNpcName.."此奖励你已领取。");
		return 0;
	end
	SetTask(TASKID_TAIYI_SHOUTUI_PRIZE, nDate);
	
	WriteLog(format("[太一塔首推奖励] [%s 领取奖励, Account:%s]", GetName(), GetAccount()));
	if tSpecGroup[szGroupName] then
		gf_Modify("Exp", (10000000 + 1000000*(GetLevel()-80)) * 2);
		gf_AddItemEx({2, 95, 1506, 10, 4}, "洪荒碎片");
		gf_AddItemEx({2, 0, 553, 2, 4}, "大人参果");
		gf_AddItemEx({2, 1, 270, 10, 4}, "白驹丸");
	else
		gf_Modify("Exp", 10000000 + 1000000*(GetLevel()-80));
		gf_AddItemEx({2, 95, 1506, 5, 4}, "洪荒碎片");
		gf_AddItemEx({2, 0, 553, 1, 4}, "大人参果");
		gf_AddItemEx({2, 1, 270, 5, 4}, "白驹丸");
	end
end

function qrs_talk_2()
	Talk(3,"", "   游侠值是侠士仗义江湖的凭证，侠士挑战剑冢魔影、地玄宫、通天顶、普通梵天林、普通太一塔，将不再获得常规奖励，而是根据侠士所挑战关卡的难度情况给予不同数量游侠值，游侠值为在基础数值范围内上下浮动的随机值。侠士获得游侠值可用于在游侠值商店兑换普通奖励。\n   此外，太虚、梁山、山河幻憶，也会在已有奖励基础上额外掉落少量游侠值。","   游侠值只针对常规奖励，对剑冢魔影、地玄宫、通天顶、普通梵天林、普通太一塔中的特殊奖励，包括沾满血迹的书信、天晶残片、披风令玄铁、太一玄晶、光昭烈武图鉴、光武玄铁，不纳入游侠值系统，掉率不变，并与游侠值共用掉率。","   游侠值每周上限为50000点，总上限为600000，侠士游侠值达到周上限后将不再获得游侠值，并将溢出的游侠值按一定比例转换为经验。每周六和周日将会有双倍游侠值活动，在两天通关关卡将会获得双倍游侠值。每日最多通过双倍奖励获得15000点游侠值。\n   轻松完成奖励也将随之变更。")
end

function OpenShopYouXiaZhi()
	show_equip_shop(148)
end










