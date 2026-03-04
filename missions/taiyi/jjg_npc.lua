Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>菁菁姑娘<color>：";

tNonsense = {
	"嘿嘿，终于把吴家兄弟挤走了，以后这里就是我的地盘啦！",
	"即使任何一关失败也可以重新挑战，而不需要退出关卡重新进入。",
	"看我的坐骑，好看不？它就是辟邪神兽。",
	"来太一塔必须要带佛妹妹。",
	"偷偷告诉你，这个太一塔和我有莫大关系哦。",
	"要仔细听穆桂英和杨宗保讲的话哦！",
};

function main()
	local strTab = {
		"\n 离开副本/JJG_ConfirmLeave",
		"\n 重回副本(需要 ["..TYT_IB_ITEM[1].."]x2)/JJG_Back2Fight",
		"\n 结束对话/nothing",
	};
	local nIdx = random(1, getn(tNonsense));
	Say(g_NpcName..tNonsense[nIdx], getn(strTab), strTab);
end

function JJG_ConfirmLeave()
	local strtab = {
			"\n 我要离开/JJG_Leave",
			"\n 没事看看/nothing",
		};
	Say(g_NpcName.."少侠不要轻言放弃",
		getn(strtab),
		strtab)
end

function JJG_Leave()
	LeaveTeam(1);
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	TY_ClearAllGodState();
	NewWorld(nMapId, tExitPos[nMapId][1], tExitPos[nMapId][2]);
	if GetMSPlayerCount(tTY.missionID) == 0 then
		CloseMission(tTY.missionID);
	end
end

function JJG_AddGodState()
	if 1 == GetMissionV(tTY.mv_03) then	--作弊模式
		TY_AddGodState();
	end
	local nType = 1;
	if 1 ~= _JX2WZ then nType = 2; end
	local nRoute = GetPlayerRoute();
	if tRouteList[nRoute] and tRouteList[nRoute][2][nType] > 0 then
		RemoveState(10010);
		Msg2Player(format("伤害增加%d%%，持续5分钟", tRouteList[nRoute][2][nType]));
		CastState("state_attack_npc_add_spec", tRouteList[nRoute][2][nType], 5*60*18, 1, 10010);
	end
end

function JJG_Back2Fight()
	local nCurStageId = GetMissionV(MV_STAGE);
	if not tPlayerPos[nCurStageId] then
		WriteLog(format("[太一塔] [StageId = %d, 错误的地图坐标\n", nCurStageId));
		return 0;
	end
	
	if 1 ~= DelItem(TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 2) then
		Talk(1, "", g_NpcName.."你身上的"..TYT_IB_ITEM[1].."不够!");
		return 0;
	end
	SetFightState(1);
	JJG_AddGodState();
	RestoreAll();
	TY_SetPlayerPos(tPlayerPos[nCurStageId][1]);
	local nMSType = GetMissionV(1);
	local nTaskID = tTaskID.ConsumeTaskID[nMSType];
	SetTask(nTaskID, GetTask(nTaskID) + 2);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1})
end