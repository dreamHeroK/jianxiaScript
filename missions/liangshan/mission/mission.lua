Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\lib\\missionfunctions.lua")

Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\missions\\liangshan\\stage\\stage_1.lua")
Include("\\script\\missions\\liangshan\\stage\\stage_2.lua")
Include("\\script\\missions\\liangshan\\stage\\stage_3.lua")
Include("\\script\\missions\\liangshan\\stage\\stage_4.lua")
Include("\\script\\missions\\liangshan\\stage\\stage_5.lua")
Include("\\script\\missions\\liangshan\\stage\\stage_6.lua")
Include("\\script\\missions\\liangshan\\stage\\stagehide_1.lua")
Include("\\script\\missions\\liangshan\\stage\\stagehide_2.lua")
Include("\\script\\missions\\liangshan\\npc\\box_jingli.lua")

--活动产出头文件包含
Include("\\script\\online\\collect_card\\cc_head.lua")
Include("\\script\\online\\award_head.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

Include("\\script\\missions\\liangshan\\npc\\box_tong.lua")
Include("\\script\\missions\\liangshan\\npc\\box_gold.lua")

_stage = {
	[1] = tStage_1,
	[2] = tStage_2,
	[3] = tStage_3,
	[4] = tStage_4,
	[5] = tStage_5,	-- 跳关
	[6] = tStage_6,	-- boss关
	[7] = tStage_7,	-- boss关
	[8] = tStage_8,	-- boss关
	[9] = tStage_9,	-- boss关
	[HIDEMISSION_BEGIN] = tStageHide_1,
	[HIDEMISSION_BEGIN+1] = tStageHide_2,
}

function InitMission()
	resetMissionV()
	SetMissionV(MV_STAGE_LEVEL, 1);
	SetMissionV(MV_STAGE_LEVEL_OLD, 1);
	getStage():init()
end;

function RunMission()
	getStage():start()
end;

function EndMission()
	local nMapID = gf_GetCurMapID();
	local nMapIdx = GetMissionV(MV_MAP_INDEX);
	ClearMapNpc(nMapID);

	local f = function()
		DelMSPlayer(MISSION_ID,1);
	end

	mf_OperateAllPlayer(MISSION_ID,f,nil,1)
	
--	local state = GetMissionV(MV_STAGE_STATE);
--	local pass = 0
--	if state == SS_WAITING_2 or state == SS_WAITING or state == SS_PASSING then
--		pass = 1
--	end
--	local nStage = getStage()
--	if (nStage > 4) or (nStage == 4 and pass == 1) then
--		_stat_when_first_4_stage_pass()
--	end

	resetMissionV();
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
	if nRetCode ~= 1 then
		print("[FreeDynamicMap] error!!!!!!!!!!!!!!");
		WriteLog("FreeDynamicMap error,nRetCode:"..nRetCode);
	end;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	_OnJoin(nCamp);
	PlayerIndex = RoleIndex;
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	_OnLeave();
	PlayerIndex = RoleIndex;
end;

function OnTimer()
	local nLoop = GetMissionV(MV_TIME_LOOP);
	nLoop = nLoop + 1;
	SetMissionV(MV_TIME_LOOP, nLoop);
	getStage():OnTimer()
end

function _OnJoin(nCamp)
	CleanInteractive();					--在NewWorld前解散双人互动动作
	local nMapID = gf_GetCurMapID();
	if NewWorld(nMapID, entryPos[1], entryPos[2]) == 1 then
		AddMSPlayer(MISSION_ID,nCamp);
		Msg2MSAll(MISSION_ID,GetName()..LSMsgToTeam[6]);
		SetCampToPlayer(CampPlaye);
		SetDeathScript("\\script\\missions\\liangshan\\mission\\mission.lua");
		SetFightState(1);
		SetDeathPunish(0);				--无死亡惩罚
		UseScrollEnable(0);				--禁止使用回城符
		SetLogoutRV(1)					-- 中途中断后回城
		SetCreateTeam(1)				-- 关闭组队功能
	    InteractiveEnable(0)			-- 交互开关，0关闭，1打开
		OpenFriendliness(0)					-- 不提升好感
		Say(NpcSayInfo[3][1], 1, {NpcSayInfo[3][2].."/nothing"});
		return 1;
	else
		return 0;
	end;
end;

function _OnLeave()
	SetLogoutRV(0)						-- 中途中断后回城
	SetCreateTeam(0)					-- 关闭组队功能
    InteractiveEnable(1)				-- 交互开关，0关闭，1打开
	OpenFriendliness(1)					-- 恢复提升好感
	SetCampToPlayer("");
	SetDeathScript("");
	SetFightState(0);
	SetDeathPunish(1);
	UseScrollEnable(1);
	StopTimeGuage(-1);
	RemvoeTempEffect(); --清除玩家身上的所有临时状态
	tStage_3:CleanTempAward();
	tStage_5:CleanGodState();
	local retMapId = GetMissionV(MV_RETURN_MAP_ID)
	if IsPlayerDeath(PlayerIndex) == 1 or GetLife() <= 1 then
	--RevivePlayer(0)
		LeaveTeam();
	end
	RestoreAll()
	if NewWorld(retMapId, returnPos[retMapId][1], returnPos[retMapId][2]) == 1 then
		Say(NpcSayInfo[4][1],0);
		return 1;
	else
		return 0;
	end;
end;

------------------------------------------------------------------
function main()
	getStage():OnTalk();
end

function OnDeath(Launcher_or_npcIndex, n)
	local nLife = GetLife() or 1;
	if nLife < 1 then
		getStage():OnPlayerDeath(Launcher_or_npcIndex);
	else
		getStage():OnNpcDeath(Launcher_or_npcIndex);
	end
end

function OnBossDeath(npcIdx)
	local name = GetNpcName(npcIdx);
	if name and LSNpcChat[2][name] then
		NpcChat(npcIdx, LSNpcChat[2][name][random(getn(LSNpcChat[2][name]))]);
	end

	local funCheckTaskDone = function(tbArg)
		local bossname = tMission:getBossName(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3_BOSS));
		if bossname and %name == bossname then
			SetTaskDone(3);
		end
	end;
	gf_OperatePlayers(mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP),funCheckTaskDone,{});

	getStage():OnBossDeath(npcIdx)
--	drop_jingli_box(npcIdx)--掉落精力宝箱
	
	local nStep = GetMissionV(MV_STAGE_LEVEL);
	if nStep == 6 then
		--最后boss个数
		SetMissionV(MV_GAME_OVER_TAG, GetMissionV(MV_GAME_OVER_TAG) + 1);
	end
end

function ShowWelcome()
	local tWelcome = getStage().tWelcome;
	if tWelcome and getn(tWelcome) > 0 then
		for i = 1, getn(tWelcome) do
			Msg2MSAll(MISSION_ID, tWelcome[i]);
		end
		SetMissionV(MV_SHOW_WELCOME, 1);
	end
end

function OnTrap(nSel, nID)
	local m, x, y = getResetPosition();
	if m and x and y then
		NewWorld(m, x, y);
	end
	if nID == 10 and GetMissionV(MV_STAGE_LEVEL_OLD) ~= 5 then
		NewWorld(GetWorldPos(), 1645, 3170)
		Msg2Player(LSMsgToPlayer[1])
	end

	if not getStage().nEntryTrap or nID == getStage().nEntryTrap then
		if 1 ~= GetMissionV(MV_SHOW_WELCOME) then
			ShowWelcome();
		end
	end
end
