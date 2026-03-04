--=============================================
--create by baiyun 2009.10.19
--describe:Ô½ÄÏ°æ11ÔÂ»î¶¯ÉñÆæÊ÷missionº¯Êý
--=============================================
Include("\\script\\online\\viet_event\\200911\\3\\mission_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission ®· b¾t ®Çu, MSUID:"..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission½áÊø
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission ®· kÕt thóc, MSUID:"..nMSUID);
end;
--Àë¿ªMission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nMapId = GetGlbValue(1015);
		local nMapX = GetGlbValue(1016);
		local nMapY = GetGlbValue(1017);
		local nDengLongIndex = GetGlbValue(1014);
		--ÕâÀï´´½¨ÅÖÍÃ×Ó
		for i = 1, 20 do
			local nNpcIndex = CreateNpc("Thá MËp", "Thá MËp", nMapId, nMapX, nMapY);
			--SetNpcLifeTime(nNpcIndex, 300);
			SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\3\\death_pangtuzi.lua");
		end
		local nState = GetUnitCurStates(nDengLongIndex, 4)
		AddUnitStates(nDengLongIndex, 4, (0 - nState));--°Ñ´Ë×´Ì¬Çå0
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()

end;
--=====================================================================================
--×ª»»Missionµ±Ç°×´Ì¬
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊý
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖÐøÊ±¼ä
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öÐÂµÄ¼ÆÊ±Æ÷
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()

end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()

end;
