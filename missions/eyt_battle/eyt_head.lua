Include("\\script\\system_switch_config.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\eyt_battle\\eyt_define.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\eyt_battle\\mission.lua"

EYT_MISSION = {
	name = "气血加成",
	missionID = EYT_MISSION_ID,
	realMapID = EYT_MAP_ID,
	dynamicMap = 1, --是否动态加载

	battleState = 1,
	redScore = 2,
	blueScore = 3,
	npcFlag = 4,
	flagTime = 5,
	result = 6,
}

EYT_MISSION = inherit(missionHead, EYT_MISSION);

--找到合适的MISSION
function eyt_GetSuitMap(nPlayerNum)
	local tbMapID = gf_GetDataTable(GetSameMaps(EYT_MAP_ID));
	local tbRetzult = {};
	for i =1, getn(tbMapID) do
		if tbMapID[i] ~= EYT_MAP_ID then
			local battleState = mf_GetMissionV(EYT_MISSION_ID, EYT_MISSION.battleState, tbMapID[i]);
			local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, tbMapID[i]);
			local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, tbMapID[i]);
			if (battleState == EYT_STATE_PEACE or battleState == EYT_STATE_FIGHT) and
				 (nRed + nPlayerNum <= EYT_PLAYER_MAX or nBlue + nPlayerNum <= EYT_PLAYER_MAX) then
				return tbMapID[i];
			end
		end
	end
	return 0;
end

function eyt_GetCamp()
	local campString = GetPlayerCampName()
	DebugOutput("campString =", campString);
	local nCamp = EYT_CAMP_STRING[campString];
	DebugOutput("nCamp =", nCamp);
	return nCamp;
end

function eyt_SetTempRevPos()
	local tPos = EYT_REV_POS[eyt_GetCamp()];
	local nMapID = GetMissionV(MV_MAP_ID);
	local nIndex = random(getn(tPos));
	SetTempRevPos(nMapID, tPos[nIndex][1] * 32, tPos[nIndex][2] * 32);
	DebugOutput("eyt_SetTempRevPos", nMapID, tPos[nIndex][1], tPos[nIndex][2]);
end

function eyt_CreateFlag()
	local oldnpc = GetMissionV(EYT_MISSION.npcFlag);
	if oldnpc > 0 and IsNpcDeath(oldnpc) ~= 1 then
		DebugOutput("oldnpc live", oldnpc);
		return 0;
	end
	local npcIndex = CreateNpc("EYT_Flag", EYT_NPC_FLAG, this.msPosition:getMapID(), 1613, 3206);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, thisFile);
		SetMissionV(EYT_MISSION.npcFlag, npcIndex);
		return 1;
	end
	return 0;
end

function eyt_AddScore(nValue)
	if GetMissionV(EYT_MISSION.battleState) ~= EYT_STATE_FIGHT then
		return 0;
	end
	local nCamp = eyt_GetCamp();
	tCamp = {
		[EYT_CAMP_RED] = EYT_MISSION.redScore,
		[EYT_CAMP_BLUE] = EYT_MISSION.blueScore,
	}
	if not tCamp[nCamp] then
		return 0;
	end
	SetMissionV(tCamp[nCamp], GetMissionV(tCamp[nCamp]) + nValue);
	eyt_SetMyScore(nValue);
	mf_OperateAllPlayer(EYT_MISSION_ID, eyt_FloatReport, 0, 0);
end

function eyt_KillSome(killPlayerIdx)
    local myName = GetName();
    local szName = GetName(killPlayerIdx);
    eyt_AddKilled();
    SetTaskTemp(TMP_TASK_KF_TIME, GetTime());
    Msg2Player(format("玩家 %s 被玩家 %s 击杀了！", szName, myName));
    local oldPlayerIdx = PlayerIndex;
    PlayerIndex = killPlayerIdx;
    eyt_AddScore(EYT_KILL_PLAYER);
    eyt_AddKill();
    Msg2Player(format("你成功击杀了 %s", myName));
    PlayerIndex = oldPlayerIdx;
end

function eyt_OpenFlag()
    if IsPlayerDeath() == 1 then
        return 0;
    end
    local npcIndex = GetMissionV(EYT_MISSION.npcFlag)
    local nMapID, nX, nY = GetWorldPos();
    local npcMapID, npcX, npcY = GetNpcWorldPos(npcIndex);
    if nMapID ~= npcMapID then
        return 0;
    end
    if (nX - npcX) * (nX -npcX) + (nY - npcY) * (nY - npcY) > 36 then
        Msg2Player("距离太远，无法操作！");
        return 0;
    end
    if npcIndex > 0 and IsNpcDeath(npcIndex) ~= 1 then
        SetMissionV(EYT_MISSION.flagTime, GetTime());
        SetNpcLifeTime(npcIndex, 0);
        SetMissionV(EYT_MISSION.npcFlag, 0);
        eyt_AddScore(EYT_OPEN_FLAG);
        local nCamp = eyt_GetCamp();
        Msg2MSAll(EYT_MISSION_ID, format("%s 与 %s 合作开启旗帜，共获得 %d 点积分。", EYT_CAMP_NAME[nCamp] or "", GetName(), EYT_OPEN_FLAG));
        AddRuntimeStat(27, 2, GetPlayerRoute(), 1);
    end
end

function eyt_Revive()
	RevivePlayer(1, PlayerIndex, 1); --满血复活
	SetFightState(0);
	eyt_SetTempRevPos();
	SetTempRevScript(thisFile);
	SetTaskTemp(TMP_TASK_KF_TIME, 0);
	eyt_AddBuff();
	RestoreAll();
end

function eyt_Report()
    local nRed = GetMissionV(EYT_MISSION.redScore);
    local nBlue = GetMissionV(EYT_MISSION.blueScore);
    Msg2MSAll(EYT_MISSION_ID, format("比分 - 红队 [%d:%d], 共计 %d 点获得胜利！", nRed, nBlue, EYT_SCROE_MAX));
end

function eyt_FloatReport()
    local nRed = GetMissionV(EYT_MISSION.redScore);
    local nBlue = GetMissionV(EYT_MISSION.blueScore);
    local nRedPlayer = GetMSPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED);
    local nBluePlayer = GetMSPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE);
    local msg = format("比分报告:\n红队 (%d人): %d点\n蓝队 (%d人): %d点", nRedPlayer, nRed, nBluePlayer, nBlue);
    FloatMsg2Player(msg);
end

function eyt_CheckAndKickSleep()
    local nCamp = eyt_GetCamp();
    if IsSleeping() == 1 then
        Say("队友长时间未响应，你先离开队伍吧！", 0);
        LeaveTeam();
        DelMSPlayer(EYT_MISSION_ID, nCamp);
        Msg2MSAll(EYT_MISSION_ID, GetName().."已被踢出比赛。");
        return 1;
    end;
    if IsPlayerDeath() == 1 and GetTaskTemp(TMP_TASK_KF_TIME) ~= 0 then
        local nLeftLoop = GetTime() - GetTaskTemp(TMP_TASK_KF_TIME);
        if nLeftLoop >= 60 then --60s
            Say("队友长时间未响应，你先离开队伍吧！", 0);
            LeaveTeam();
            DelMSPlayer(EYT_MISSION_ID, nCamp);
            Msg2MSAll(EYT_MISSION_ID, GetName().."已被踢出比赛。");
            return 1;
        end
    end;
    return 0;
end

function eyt_ShowExit(nWinner)
    local nCamp = eyt_GetCamp();
    local msg = "";
    if nCamp == nWinner then
        msg = "你战胜了对手，继续努力！";
    else
        msg = "你战败了，下次再来吧！";
    end
    local tSay = {
        format("离开比赛/#DelMSPlayer(%d,%d,%d)", EYT_MISSION_ID, PlayerIndex, nCamp),
        "退出/nothing",
    }
    Say(msg, table.getn(tSay), tSay);
end

function eyt_AddBuff()
	local nKillNum = eyt_GetKill();
	local nKilledNum = eyt_GetKilled()
	local nKillDistance = nKilledNum - nKillNum;
	if nKillDistance <= 0 then
		return 0;
	end
	local nTbIdx = 0;
	for i = 1,getn(EYT_XUEHEN) do
		if nKillDistance >= EYT_XUEHEN[i][1] then
			nTbIdx = i;
			break;
		end
	end
	--先清雪恨状态再加
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
if nTbIdx ~= 0 then
    CastState("state_p_attack_percent_add", EYT_XUEHEN[nTbIdx][2], 2 * 60 * 18, 1, 9908, 1); -- 外攻攻击
    CastState("state_m_attack_percent_add", EYT_XUEHEN[nTbIdx][2], 2 * 60 * 18, 1, 9909, 1); -- 内攻攻击
    CastState("state_life_max_percent_add", EYT_XUEHEN[nTbIdx][3], 2 * 60 * 18, 1, 9910, 1); -- 生命上限
    CastState("state_buff_resist", EYT_XUEHEN[nTbIdx][4], 2 * 60 * 18, 1, 9911, 1); -- 免疫负面状态
    SyncCustomState(1, 9908, 1, EYT_XUEHEN[nTbIdx][5]);
    Msg2Player("你获得了" .. EYT_XUEHEN[nTbIdx][5] .. "技能效果，提高攻击" .. format(EYT_XUEHEN[nTbIdx][6], EYT_XUEHEN[nTbIdx][2], EYT_XUEHEN[nTbIdx][3], EYT_XUEHEN[nTbIdx][4]) .. "持续2分钟。");
    if nTbIdx <= 9 then
        SetCurrentNpcSFX(PIdx2NpcIdx(), 921, 1, 0, 18 * 3);
    end
end
end

function eyt_CreateFo()
	for i, npc in pairs(EYT_FO_POS) do
		local npcIndex = CreateNpc(npc[1], npc[2], this.msPosition:getMapID(), npc[3], npc[4]);
		if npcIndex <= 0 then
			print(format("create npc fail: [%s][%s][%d][%d][%d]",npc[1], npc[2], this.msPosition:getMapID(), npc[3], npc[4]))
		end
		SetCampToNpc(npcIndex,npc[5]);
		CastState2Npc(npcIndex, "state_dispear", 100,180*60*60);
	end
end

function eyt_GetJoinTimes()
		return gf_GetTaskByte(EYT_TASK_2, 1);
end

function eyt_AddOnceJoinTimes()
	gf_SetTaskByte(EYT_TASK_2, 1, eyt_GetJoinTimes() + 1, TASK_ACCESS_CODE_EYT);
end

function eyt_GetKill()
	return gf_GetTaskByte(EYT_TASK_2, 2);
end

function eyt_AddKill()
	local nNum = eyt_GetKill();
	if nNum >= 255 then return 0 end
	gf_SetTaskByte(EYT_TASK_2, 2, nNum + 1, TASK_ACCESS_CODE_EYT);
end

function eyt_ResetKill()
	gf_SetTaskByte(EYT_TASK_2, 2, 0, TASK_ACCESS_CODE_EYT);
end

function eyt_GetKilled()
	return gf_GetTaskByte(EYT_TASK_2, 3);
end

function eyt_AddKilled()
	local nNum = eyt_GetKilled();
	if nNum >= 255 then return 0 end
	gf_SetTaskByte(EYT_TASK_2, 3, nNum + 1, TASK_ACCESS_CODE_EYT);
end

function eyt_ResetKilled()
	gf_SetTaskByte(EYT_TASK_2, 3, 0, TASK_ACCESS_CODE_EYT);
end

function eyt_GetMyScore()
	return gf_GetTaskByte(EYT_TASK_2, 4);
end

function eyt_SetMyScore(nValue)
	local nNum = eyt_GetMyScore()
	if nNum >= 255 then return 0 end
	gf_SetTaskByte(EYT_TASK_2, 4, nNum + nValue, TASK_ACCESS_CODE_EYT);
end

function eyt_ResetMyScore()
	gf_SetTaskByte(EYT_TASK_2, 4, 0, TASK_ACCESS_CODE_EYT);
end

function eyt_SetJoinTime(nTime)
	SetTask(EYT_TASK_3, nTime, TASK_ACCESS_CODE_EYT);
end

function eyt_GetJoinTime()
	return GetTask(EYT_TASK_3);
end

function eyt_DailyReset()
	local _, at_ggs = GetRealmType()
	if at_ggs ~= 0 then
		return 0;
	end
	DebugOutput("eyt_DailyReset()...")
	SetTask(EYT_TASK_1, 0, TASK_ACCESS_CODE_EYT);
	SetTask(EYT_TASK_2, 0, TASK_ACCESS_CODE_EYT);
end

function eyt_GetSucc()
	return gf_GetTaskByte(EYT_TASK_1, 3);
end

function eyt_AddSucc()
	gf_SetTaskByte(EYT_TASK_1, 3, eyt_GetSucc() + 1, TASK_ACCESS_CODE_EYT);
end

function eyt_ReduceSucc()
	gf_SetTaskByte(EYT_TASK_1, 3, eyt_GetSucc() - 1, TASK_ACCESS_CODE_EYT);
end

function eyt_GetFail()
	return gf_GetTaskByte(EYT_TASK_1, 4);
end

function eyt_AddFail()
	gf_SetTaskByte(EYT_TASK_1, 4, eyt_GetFail() + 1, TASK_ACCESS_CODE_EYT);
end

function eyt_ReduceFail()
	gf_SetTaskByte(EYT_TASK_1, 4, eyt_GetFail() - 1, TASK_ACCESS_CODE_EYT);
end