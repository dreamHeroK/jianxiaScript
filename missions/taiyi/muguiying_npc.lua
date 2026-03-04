Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>先锋穆桂英:<color>";

function main()
--	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
--		return 0;
--	end
	local szName;
	local strTab = {
		format("◆我要参加英雄难度的梵天林(消耗%s)/Talk_1", "精力*"..TYT_JOIN_COST_JINGLI[1][2]),
		format("◆我要参加英雄难度的梵天林(队长消耗%s)/Talk_1_IB", TYT_JOIN_COST_ITEM[1][2][2].."*"..TYT_JOIN_COST_ITEM[1][2][1][4]),
		format("◆我要参加英雄难度的太一塔(消耗%s)/Talk_2", "精力*"..TYT_JOIN_COST_JINGLI[2][2]),
		format("◆我要参加英雄难度的太一塔(队长消耗%s)/Talk_2_IB", TYT_JOIN_COST_ITEM[2][2][2].."*"..TYT_JOIN_COST_ITEM[2][2][1][4]),
		"◆太一塔系列关卡英雄难度参加条件/Talk_5",
		"◆关卡伤害加成/Talk_6",
		"◆ 凤鸣装备直接兑换/#show_equip_shop(3106)",
		"◆ 东皇凤鸣装备升级/#show_equip_shop(3107)",
		"结束/nothing",
	};
	
	if GetSex() == 1 then
		szName = "大侠";
	elseif GetSex() == 2 then
		szName = "女侠";
	end
	Say(format(g_szNpcName.."金沙滩一役金刀杨令公遭奸臣潘美出卖被辽军所俘，身故后葬于辽境。探听得知，杨业被辽国安葬在一处名叫太一塔的地方，我和桂英奉命进入太一塔寻回老令公骨灰和其佩刀“荒火鎏金”。这太一塔内必然机关重重，凶险万分，大侠可做好准备？", szName), getn(strTab), strTab);
end

function Talk_1()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.HARD) then return 0; end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林太一塔需要组队进入！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	SetGlbValue(GLB_TASKID, GetGlbValue(GLB_TASKID) + 1);
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 42, GetPlayerRoute(), 1);		
	end);
end

function Talk_1_IB()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.HARD) then return 0; end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林太一塔需要组队进入！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	SetGlbValue(GLB_TASKID, GetGlbValue(GLB_TASKID) + 1);
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 42, GetPlayerRoute(), 1);		
	end);
end

function _checkOpenTime()
	--do return 1 end--体服策略
	
	local nWeekDay = tonumber(date("%w"))
	-- if nWeekDay~=3 and nWeekDay~=6 and nWeekDay~=0 then
		-- Talk(1, "", g_szNpcName..format("Th竔 Nh蕋 Th竝_Anh H飊g m?th?[%s] h籲g tu莕", "Th?4, th?7, ch?nh藅"));
		-- return 0
	-- end
	return 1
end

function TY_ChargeTicket()
	SetTask(TASKID_TAIYI_TICKET, GetTask(TASKID_TAIYI_TICKET) - 1);
end

function Talk_2()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林太一塔需要组队进入！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_2_IB()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."梵天林太一塔需要组队进入！");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
end

function TY_Enter(nCamp)
	self.msOption:check(nCamp);
	local m,x,y = self.msPosition:getEntryPos(nCamp);
	CleanInteractive();--在NewWorld前解散双人互动动作
	NewWorld(nMapId, tPlayerPos[4][1], tPlayerPos[4][2]);
end

function Talk_6()
	local msg = "";
	tRouteList.n = nil;
	
	if 1 == _JX2WZ then
		for k,v in tRouteList do
			msg = msg..format("%-16s 伤害加成: <color=yellow>%d%%<color>\n",tList[k], tRouteList[k][2][1]);
		end
	else
		for k,v in tRouteList do
			if k <= 21 or k == 31 or k == 32 or k == 23 then
				msg = msg..format("%-16s 伤害加成: <color=yellow>%d%%<color>\n",tList[k], tRouteList[k][2][2]);
			end
		end
	end
	suTalk("main", g_szNpcName.."关卡各流派伤害加成如下\n"..msg);
end

function Talk_5()
	suSay(g_szNpcName.."这太一塔内必然机关重重，凶险万分，大侠可做好准备？关卡进入条件包括以下： \n	  需组队进入，队伍成员为4-8人；; \n	  队伍流派数≥4; \n	  队伍所有玩家等级≥90；; \n	  队伍所有玩家已入门派：;", 2, "返回/main", "结束/nothing");
end
