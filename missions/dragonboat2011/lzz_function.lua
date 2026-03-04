--º£ÉÏÁúÖÛÕ½¹«¹²º¯ÊıÎÄ¼ş
--by liubo
Include("\\script\\missions\\dragonboat2011\\head.lua")

--·µ»ØÌìÊı
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--»ñÈ¡µ±Ç°ÒÑ¿ªÆôµÄµØÍ¼ÖĞ×îÊÊºÏ½øÈ¥µÄ
--ÏÈ¿´Ë«·½²î¾à£¬ÔÙ±È½Ï×ÜÈËÊı£¬¶¼Ò»Ñù¾ÍËæ»ú
--´«ÈëĞèÒª½øÈëÕ½³¡µÄÈËÊı£¬·µ»ØºÏÊÊµÄµØÍ¼id£¬·µ»Ø0±íÊ¾Ä¿Ç°Ã»ÓĞºÏÊÊµÄ£¬ĞèÒªĞÂ¿ªÆô
function LZZ_GetSuitMap()
	--print("LZZ_GetSuitMap() called!")
	local tbMapID = gf_GetDataTable(GetSameMaps(MAPID)) 
	local i = 1 
	while i <= getn(tbMapID) do
		if tbMapID[i] == MAPID then
			tremove(tbMapID,i) 
		--Ë«·½ÊÇ·ñÂúÔ±
		elseif mf_GetPlayerCount(MISSIONID,CampSong_ID,tbMapID[i]) + 1 > PLAYER_MAX_NUM
			and mf_GetPlayerCount(MISSIONID,CampLiao_ID,tbMapID[i]) + 1 > PLAYER_MAX_NUM then
			tremove(tbMapID, i) 
		--ÊÇ·ñÊÇÕ½¶·½áÊø×´Ì¬
		elseif mf_GetMissionV(MISSIONID,MV_LZZ_STATE,tbMapID[i]) == MS_STATE_COMPLETE then
			tremove(tbMapID, i) 
		--³ö´íÁË4´ÎÒÔÉÏ²»ÒªÁË
		elseif mf_GetMissionV(MISSIONID,MV_LZZ_ERROR_NUM,tbMapID[i]) >= 4 then
			tremove(tbMapID, i) 
		--¿ªÕ½ºóJOIN_TIMER_ALLOW·ÖÖÓµÄ²»ÒªÁË
		elseif mf_GetMissionV(MISSIONID,MV_LZZ_STATE,tbMapID[i]) == MS_STATE_FIGHT then
			if mf_GetMissionV(MISSIONID,MV_TIMER_LOOP,tbMapID[i]) < JOIN_TIMER_ALLOW then
				tremove(tbMapID,i) 
			else
				i = i + 1 
			end
		else
			i = i+1 
		end
	end
	if getn(tbMapID) == 0 then
		return 0 
	end
	if getn(tbMapID) > 1 then
		local  _sort = function(nMapID1,nMapID2)
			local bFightState1 = mf_GetMissionV(MISSIONID,MV_LZZ_STATE,nMapID1) 
			local bFightState2 = mf_GetMissionV(MISSIONID,MV_LZZ_STATE,nMapID2) 
			if bFightState1 == MS_STATE_FIGHT and bFightState2 ~= MS_STATE_FIGHT then
				return 1 
			end
			if bFightState1 ~= MS_STATE_FIGHT and bFightState2 == MS_STATE_FIGHT then
				return nil 
			end
			local nTotalNumOne = mf_GetPlayerCount(MISSIONID,CampSong_ID,nMapID1)+mf_GetPlayerCount(MISSIONID,CampLiao_ID,nMapID1) 
			local nTotalNumTwo = mf_GetPlayerCount(MISSIONID,CampSong_ID,nMapID2)+mf_GetPlayerCount(MISSIONID,CampLiao_ID,nMapID2) 
			if nTotalNumOne > nTotalNumTwo then
				return 1 
			else
				return nil 
			end
		end
		sort(tbMapID,_sort) 
	end
	return tbMapID[1] or 0 
end

--»ñµÃ¶¯Ì¬¼ÓÔØµØÍ¼ID¡¢Ë÷ÒıÓë¼ÓÔØ´ÎÊı£¬Ã»ÓĞ¶àÓàµØÍ¼Ê±·µ»Ø0,0,0
function LZZ_FindIdleRoom()
	--print("LZZ_FindIdleRoom() called! new map")
	local nCount = 0 
	nCount = LZZ_GetDynamicMapCount() 
	if nCount >= MAX_ROOM_COUNT then
		return 0,0,0 
	end 
	local nMapID,nMapIdx = DynamicLoadMap(MAPID) 
	if nMapID == 0 and nMapIdx == 0 then
		--print(format("DynamicLoadMap(%d)",MAPID))
	end
	return nMapID,nMapIdx,nCount 
end 

--»ñÈ¡µ±Ç°ÒÑÓÃµØÍ¼ÊıÁ¿
function LZZ_GetDynamicMapCount()
	local tbMapID = gf_GetDataTable(GetSameMaps(MAPID)) 
	local nCount = 0 
	local nMapID = 0 
	for i = 1,getn(tbMapID) do
		if tbMapID[i] == MAPID then
			tremove(tbMapID,i) 
		end
	end
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i] 
		if mf_GetMissionV(MISSIONID,MV_LZZ_LOAD,nMapID) == 1 then
			nCount = nCount + 1 
		end 
	end 
	return nCount 
end 

--³õÊ¼»¯Ê±ÒªÉèÖÃµÄÒ»Ğ©×´Ì¬
function LZZ_InitBattle()
	--print("LZZ_InitBattle() called!")
	local nDate = tonumber(date("%m%d%H%M%S")) 
	SetMissionV(MV_LZZ_LOG_TIME,nDate) 
	WriteLog("[H¶i ChiÕn Long Ch©u mission]:("..nDate..") ®· më 1 trËn h¶i chiÕn mission#") 
	SetMissionV(MV_TIMER_LOOP,PEACE_TIMER_LOOP) 
	--print(MISSIONID)
	--print(TIMERID)
	--print(PEACE_TIME)
	StartMissionTimer(MISSIONID,TIMERID,PEACE_TIME) 
	SetMissionV(MV_LZZ_STATE,MS_STATE_PEACE) 
	SetMissionV(MV_LZZ_GAME_LOOP,GetGameLoop()) 
	--´´½¨NPC
	local nMapId = gf_GetCurMapID()
	local nNpcIdx = 0
	--´´½¨ËÎNPC¾üĞè¹Ù
	nNpcIdx = CreateNpc("ÌìÍõ¸±°ïÖ÷","ËÎ¾üĞè¹Ù",nMapId,tMsNpcPos[CampSong_ID][1],tMsNpcPos[CampSong_ID][2],6)
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\song_npc.lua")
	--´´½¨ÁÉNPC¾üĞè¹Ù
	nNpcIdx = CreateNpc("±±·½ÄĞĞÔ1","ÁÉ¾üĞè¹Ù",nMapId,tMsNpcPos[CampLiao_ID][1],tMsNpcPos[CampLiao_ID][2],6)	
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\liao_npc.lua")
	--´´½¨ËÎNPCÁìº½Ô±
	nNpcIdx = CreateNpc("ÌìÍõ»¤·¨","º£ÉÏÁìº½Ô±",nMapId,tMsNpcPos[3][1],tMsNpcPos[3][2],6)
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\song_pilot_npc.lua")
	--´´½¨ÁÉNPCÁìº½Ô±
	nNpcIdx = CreateNpc("±±·½ÄĞĞÔ3","º£ÉÏÁìº½Ô±",nMapId,tMsNpcPos[4][1],tMsNpcPos[4][2],6)
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\liao_pilot_npc.lua")
	--Ãæ°åÏÔÊ¾
	LZZ_Panel_Show()
end

--ÕıÊ½¿ª´òÊ±ÒªÉèÖÃµÄÒ»Ğ©×´Ì¬
function LZZ_RunBattle()
	--print("LZZ_RunBattle() called!")
	StartMissionTimer(MISSIONID,TIMERID,FIGHT_TIME) 
	SetMissionV(MV_TIMER_LOOP,FIGHT_TIMER_LOOP) 
	SetMissionV(MV_LZZ_STATE,MS_STATE_FIGHT) 
	SetMissionV(MV_LZZ_SONGBOAT_IDX,0)
	SetMissionV(MV_LZZ_LIAOBOAT_IDX,0)
	SetMissionV(MV_LZZ_SONGFIREBOAT_TAG1,0)
	SetMissionV(MV_LZZ_SONGFIREBOAT_TAG2,0)
	SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1,0)
	SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2,0)
end


--½áÊøºó´¦Àí£¬°üÀ¨±äÁ¿µÄĞ´ÈëºÍ½±ÀøµÄ¹«²¼
function LZZ_ProcessBattleOver()
	--print("LZZ_ProcessBattleOver() called!")
	local OldPlayerIndex = PlayerIndex
	local IDTab = LZZ_GetMSPlayerIndex(ALL_ID)
	local nPlayerCount = getn(IDTab)
	local nDate = tonumber(date("%Y%m%d"))
	for i = 1,nPlayerCount do
		PlayerIndex = IDTab[i]
		if PlayerIndex > 0 then
			local nCamp = LZZ_GetCamp()
			local sName = GetName()
			local nWhoWin = GetMissionV(MV_LZZ_WINNER_CAMP) 
			local tCampPoint = {GetMissionV(MV_LZZ_CAMPONE_POINT),GetMissionV(MV_LZZ_CAMPTWO_POINT)}
			--Ğ´Èë·ÖÊı
			SetTask(VET_LZZ_PLAYER_POINT,tCampPoint[nCamp]) 
			if GetTask(VET_LZZ_PLAYER_DATE) < nDate then
				SetTask(VET_LZZ_PLAYER_DATE,nDate)
			end
			if GetTask(VET_LZZ_PLAYER_TAG) == 1 and GetTask(VET_LZZ_PLAYER_TAG2) == 1 then
				if tCampPoint[nCamp] > tCampPoint[3-nCamp] then
				--Ê¤Àû
					SetTask(VET_LZZ_PLAYER_RESULT,1)
				elseif tCampPoint[nCamp] == tCampPoint[3-nCamp] then
				--Æ½¾Ö
					SetTask(VET_LZZ_PLAYER_RESULT,3)
				else
				--Ê§°Ü
					SetTask(VET_LZZ_PLAYER_RESULT,2)
				end
				SetTask(VET_LZZ_PLAYER_TAG,0)
				SetTask(VET_LZZ_PLAYER_TAG2,0)
			end
			DelMSPlayer(MISSIONID,nCamp)
		end
	end
	PlayerIndex = OldPlayerIndex
end

--µÃµ½Ä³MissionÄ³ÕóÓªµÄËùÓĞÍæ¼ÒµÄË÷Òı£¬´æÓÚÒ»¸öÊı×é×÷º¯ÊıµÄ·µ»ØÖµ
function LZZ_GetMSPlayerIndex(nCamp)
	local tIndex = {}
	local nTotalPlayerNum = GetMSPlayerCount(MISSIONID,nCamp)
	local msidx,sidx = 0,0
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSIONID,msidx,nCamp)
			if sidx > 0 then
				tIndex[i] = sidx
			end
		end
	end
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog(tSTRING_MISSION_LOG[3]..nTotalPlayerNum..", getn(tIndex) chªnh lÖch lµ:"..getn(tIndex)) 
	end
	return tIndex
end

--µÃµ½Íæ¼ÒÔÚÕ½³¡ÖĞµÄÕóÓª£¬Õ½³¡Íâ²»¿ÉÓÃ´Ëº¯Êı
function LZZ_GetCamp()
	local nSignUpInfo = GetTask(VET_LZZ_PLAYER_CAMP)
	if nSignUpInfo == 0 then
		return 0
	end
	if nSignUpInfo == 1 then
		return CampSong_ID
	else
		return CampLiao_ID
	end
end

--Çå³ıËùÓĞMission±äÁ¿
function LZZ_ClearMissionData()
	for i=1,10 do
		SetMissionS(i,"")
	end
	for i=1,100 do
		SetMissionV(i,0)
	end
end

--Íæ¼ÒÀë¿ªÕ½³¡
--ĞèÒª·Ö¼¸ÖÖÇé¿ö
function LZZ_LeaveBattle()
	--print("LZZ_LeaveBattle() called!")
	local nCamp = LZZ_GetCamp() 
	LZZ_RestorePlayerState() 
	local nCurMapId = GetWorldPos() 
	if NewWorld(tMsLogOutPos[nCamp][1],tMsLogOutPos[nCamp][2],tMsLogOutPos[nCamp][3]) == 1 then
		local nBattleState = mf_GetMissionV(MISSIONID,MV_LZZ_STATE,nCurMapId) 
		if nBattleState == MS_STATE_READY or nBattleState == MS_STATE_FIGHT then
			Msg2MSAll(MISSIONID,tCampName[nCamp].."-"..GetName().." ÒÑ¾­Àë¿ªÕ½³¡!") 
			WriteLogEx(LONGCHAU_LOG_TITLE,GetName().." rêi khái chiÕn tr­êng")	
		end 
		return 1 
	else
		return 0 
	end 
end 

--Àë¿ªÕ½³¡Ê±Ëù×÷µÄ´¦Àí
function LZZ_RestorePlayerState()
	--print("LZZ_RestorePlayerState() called!@@@@@@")
	-------------------
	SetLogoutRV(0) 	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	SetDeathPunish(1) 	--ÎŞËÀÍö³Í·£
	SetCreateTeam(0) 	--¹Ø±Õ×é½¨¶ÓÎé(ÏÂÏßºó»á±»Çåµô)
	ForbitTrade(0) 	--½ûÖ¹½»Ò×
	InteractiveEnable(1) 	--¹Ø±Õ½»»¥	±ØĞëÔÚNewWorldÖ®ºóÖ´ĞĞ²ÅÓĞĞ§
	StallEnable(1) 	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	UseScrollEnable(1) 	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbidChangePK(0) 	--ÔÊĞí¸Ä±äPK×´Ì¬
	SetPKFlag(0,0) 
	--ForbidChangePK(1) 	--½ûÖ¹¸Ä±äPK×´Ì¬
	SetFightState(0) 
	----------------------------------------
	SetDeathScript("") 
	SetTempRevPos(0,0,0) 
	SetCampToPlayer("") 
	RemvoeTempEffect()  --Çå³ıÍæ¼ÒÉíÉÏµÄËùÓĞÁÙÊ±×´Ì¬
	LZZ_LeaveOperate()
	LZZ_DeleteAllBattleItem()
	LZZ_RestoreAll()
end 

--É¾³ıËùÓĞÕ½³¡Ïà¹ØµÄÎïÆ·£¨²»ÄÜ´ø³öÕ½³¡ÍâµÄ£©
function LZZ_DeleteAllBattleItem()
	--½â³ı×ù¼ÄÉÏµÄ×°±¸
	UnEquipAtPosition(10)
	local nResult = 0
	if BigDelItem(0,105,30034,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30035,1) ~= 1 then 
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30036,1) ~= 1 then 
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30037,1) ~= 1 then 
		nResult = nResult + 1
	end
	if nResult == 4 and GetTask(VET_LZZ_PLAYER_DRAG) ~= 0 then 
		--print("É¾³ıÁúÖÛÊ§°Ü")
		WriteLog(tSTRING_MISSION_LOG[7])
		return 0
	end
	--ÖØÖÃÈÎÎñ±äÁ¿
	SetTask(VET_LZZ_PLAYER_DRAG,0)
end

--Àë¿ªmissionÊ±½â³ıÏŞÖÆ²Ù×÷
function LZZ_LeaveOperate()
	--½â³ı½ûÖ¹ÉÏÏÂÂí
	SetTask(PLAYER_STATUS,0)
	SetTask(VET_LZZ_PLAYER_1715,0)	
	SetTask(VET_LZZ_DRAGBOAT_KIND,0)
	--²Ù×÷Íæ¼Ò£¬½â³ı½ûÖ¹Ê¹ÓÃ¼¼ÄÜ
	--È¥³ıÃæ°åÏÔÊ¾
	FloatMsg2Player()
end

--½øÈëmissionÊ±ÏŞÖÆ²Ù×÷
function LZZ_JoinOperate()
	Msg2Player(tSRING_SYS_MSG[2])
end

--Íæ¼Ò¼ÓÈëÕ½³¡
function LZZ_JoinBattle(nCamp)
	--print("LZZ_JoinBattle:nCamp="..nCamp)
	--ÔÚNewWorldÇ°½âÉ¢Ë«ÈË»¥¶¯¶¯×÷
	CleanInteractive() 
	local nCampPlace = nCamp 
	local nMapID = gf_GetCurMapID() 
	if NewWorld(nMapID,tMsLogInPos[nCampPlace][1],tMsLogInPos[nCampPlace][2]) == 1 then
		Msg2MSAll(MISSIONID,GetName().." ¼ÓÈë"..tCampName[nCamp]) 
		Msg2Player("ÄúÒÑ¾­¼ÓÈë"..tCampName[nCamp]) 
		LZZ_SetPlayerState(nCamp) 
		AddMSPlayer(MISSIONID,nCamp) 
		SetTask(VET_LZZ_PLAYER_CAMP,nCamp) 
		LZZ_Get_Game_Loop()
		--ÖÎÁÆËùÓĞºÍÆ½×´Ì¬µÄÍæ¼Ò
		--LZZ_CureAllPlayer()	
		--¼ÓÈëÏŞÖÆ²Ù×÷
		LZZ_JoinOperate()
		WriteLogEx(LONGCHAU_LOG_TITLE,GetName().." gia nhËp chiÕn tr­êng")			
		return 1 
	else
		return 0 
	end 
end 

--½øÈëÕ½Ê±¶ÔÍæ¼Ò½øĞĞµÄ²Ù×÷
function LZZ_SetPlayerState(nCamp)
	local nMapId = GetMissionV(MV_LZZ_MAP_ID) 
	--´´½¨µÇ³ö´¥·¢Æ÷
	if CreateTrigger(3,LOG_ID,LOG_TRIGGER_ID) == 0 then
		WriteLog(tSTRING_MISSION_LOG[5])
		--print("CreateTrigger Ê§°Ü")
	end
	-------------------
	SetLogoutRV(1) 	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	SetDeathPunish(0) 	--ÎŞËÀÍö³Í·£
	SetCreateTeam(1) 	--¹Ø±Õ×é½¨¶ÓÎé(ÏÂÏßºó»á±»Çåµô)
	ForbitTrade(1) 	--½ûÖ¹½»Ò×
	InteractiveEnable(0) 	--¹Ø±Õ½»»¥	±ØĞëÔÚNewWorldÖ®ºóÖ´ĞĞ²ÅÓĞĞ§
	StallEnable(0) 	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	UseScrollEnable(0) 	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbidChangePK(0) 	--ÔÊĞí¸Ä±äPK×´Ì¬
	SetPKFlag(1,nCamp) 
	ForbidChangePK(1) 	--½ûÖ¹¸Ä±äPK×´Ì¬
	SetFightState(0)  --ÉèÖÃºÍÆ½×´Ì¬
	----------------------------------------
	KillFollower() 	--É¾³ı¸ú°à
	SetMomentumBoundSwitch(1) 	--²»¿ÉÔö¼ÓÉ±ÆøÖµ	
	local nDate = tonumber(date("%Y%m%d")) 
	if GetTask(VET_LZZ_PLAYER_DATE) < nDate then
		SetTask(VET_LZZ_PLAYER_DATE,nDate) 
	end	
	SetTempRevPos(nMapId,tMsLogInPos[nCamp][1]*32,tMsLogInPos[nCamp][2]*32) 	--ÉèÖÃÖØÉúµã
	SetDeathScript(PLAYER_DEATH_SCRIPT) 
	if nCamp == CampSong_ID then
		--print("SetCamp Song")
		SetCampToPlayer(CampSong_Type) 
	else
		--print("SetCamp Liao")
		SetCampToPlayer(CampLiao_Type) 
	end
end

function LZZ_Get_Game_Loop()
	local nState = GetMissionV(MV_LZZ_STATE)+1 
	local tTimeDiff = {PEACE_TIME,READY_TIME,FIGHT_TIME,WAITOUT_TIME} 
	local tTimeLoop = {PEACE_TIMER_LOOP,READY_TIMER_LOOP,FIGHT_TIMER_LOOP,WAITOUT_TIMER_LOOP} 
	if GetGameLoop() - GetMissionV(MV_LZZ_GAME_LOOP) > tTimeDiff[nState] then
		SetMissionV(MV_TIMER_LOOP,tTimeLoop[nState]) 
		StartMissionTimer(MISSIONID,TIMERID,tTimeDiff[nState]) 
		SetMissionV(MV_LZZ_GAME_LOOP,GetGameLoop()) 
		SetMissionV(MV_LZZ_ERROR_NUM,GetMissionV(MV_LZZ_ERROR_NUM)+1) 
		WriteLog("[H¶i ChiÕn Long Ch©u]: "..GetMissionV(MV_LZZ_LOG_TIME).."Mission thø"..GetMissionV(MV_LZZ_ERROR_NUM).."T¹o míi thêi gian vµ giai ®o¹n chiÕn tr­êng: "..(nState-1)) 
	end
end

--¶ÔMissionÖĞÄ³Ò»ÕóÓªÍæ¼Ò½øĞĞÍ³Ò»²Ù×÷
--Ê¹ÓÃ·½·¨£ºÏÈ¶¨ÒåÒ»¸öÖ´ĞĞº¯Êı£¬Õâ¸öº¯ÊıµÄÊäÈë²ÎÊıÎªÒ»table¡£
--È»ºó°ÑÕâ¸öº¯Êı×÷ÎªµÚÒ»¸öÊäÈë²ÎÊı¸øOP_AllMSPlayerº¯Êı¡£
--Í¨¹ı´«tableµÄ·½Ê½¿ÉÒÔ´«¶à¸ö²ÎÊı¸øÖ´ĞĞº¯Êı¡£
function LZZ_OperateAllPlayer(func,tArg,nCamp)
	local OldPlayerIndex = PlayerIndex 
	local IDTab = LZZ_GetMSPlayerIndex(nCamp) 
	local nPlayerCount = getn(IDTab) 
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i] 
			if PlayerIndex > 0 then
				func(tArg) 
			else
				WriteLog(tSTRING_MISSION_LOG[4]) 
			end 
		end 
	end 
	PlayerIndex = OldPlayerIndex 
end 

function lzz_tell_end()
	local nWhoWin = GetMissionV(MV_LZZ_WINNER_CAMP) 
	if nWhoWin == 1 then
		szResult = tCampName[nWhoWin].."Giµnh chiÕn th¾ng" 
		Say(format(tSTRING_MISSION[9],tCampName[nWhoWin]),0)
	elseif nWhoWin == 2 then
		szResult = tCampName[nWhoWin].."Giµnh chiÕn th¾ng"
		Say(format(tSTRING_MISSION[10],tCampName[nWhoWin]),0) 
	else
		szResult = "hai phe hßa nhau" 
		Say(tSTRING_MISSION[11],0) 
	end 
	SetTask(VET_LZZ_PLAYER_TAG2,1)
	SetFightState(0) 
end 

--°ÑË¯¾õµÄÍæ¼ÒÌß³öÈ¥
function lzz_kicksleep()
	local nCmap = LZZ_GetCamp() 
	if IsSleeping() == 1 then
		Talk(1,"",sNpcNameEntrance..tSTRING_MISSION[12]) 
		DelMSPlayer(MISSIONID,nCmap)  
		Msg2MSAll(MISSIONID,GetName().."Àë¿ªÕ½³¡.") 
		WriteLogEx(LONGCHAU_LOG_TITLE,GetName().." bŞ kick v× ngñ gËt")		
		return 1 
	end 
	return 0 
end

--ÉèÖÃ²Î¼ÓÕ½¶·±êÖ¾
function lzz_set_fight()
	SetTask(VET_LZZ_PLAYER_TAG,1)
end

--ÖÎÁÆËùÓĞºÍÆ½×´Ì¬µÄÍæ¼Ò
function LZZ_CureAllPlayer() 
	local Func = function(tArg)
		if GetFightState() == 0 then
			LZZ_RestoreAll()
		end
	end
	LZZ_OperateAllPlayer(Func,{},ALL_ID)
end 

function LZZ_RestoreAll()
	Restore()
	RestoreNeili()
end

--ÑîÆßĞãNPC
function LZZ_Yangqixiu_Npc()
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		local nMapID = gf_GetCurMapID()
		local nIndex = CreateNpc("ÑîÆßĞã","ËÎÖ¸»Ó´¬",nMapID,tMsNpcPos[5][1],tMsNpcPos[5][2],0)
		SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\yqx_death.lua")
		SetCampToNpc(nIndex,CampSong_Type)
		Msg2MSAll(MISSIONID,tSTRING_MISSION[13])
	end
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		Msg2MSAll(MISSIONID,tSTRING_MISSION[14])
	end
end

--ÏôÌ©NPC
function LZZ_Xiaotai_Npc()
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		local nMapID = gf_GetCurMapID()
		local nIndex = CreateNpc("ÏôÌ©","ÁÉÖ¸»Ó´¬",nMapID,tMsNpcPos[6][1],tMsNpcPos[6][2],0)
		SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\xt_death.lua")
		SetCampToNpc(nIndex,CampLiao_Type)
		Msg2MSAll(MISSIONID,tSTRING_MISSION[15])
	end
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		Msg2MSAll(MISSIONID,tSTRING_MISSION[16])
	end
end

--ÁÉ»ğ´¬
function LZZ_Liao_Fireboat()
	--print("LZZ_Liao_Fireboat called********")
	--ÉèÖÃ±êÖ¾
	if GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1) == 0 then
		SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1,1)
	elseif GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1) == 1 and GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2) == 0 then
		SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2,1)
	else
		return 0
	end
	--´´½¨»ğ´¬
	local nMapID = gf_GetCurMapID()
	local nNpcIdx = CreateNpc("»ğ´¬","ÁÉ»ğ´¬",nMapID,tMsFireBoat[2][1],tMsFireBoat[2][2],0)
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\liao_fireboat_death.lua")
	SetCurrentNpcSFX(nNpcIdx,970,1,1)
	SetCampToNpc(nNpcIdx,CampLiao_Type)
	SetMissionV(MV_LZZ_LIAOBOAT_IDX,nNpcIdx)
	--print("ÁÉ»ğ´¬index=",nNpcIdx)
	--print("MV_LZZ_LIAOBOAT_IDX=",GetMissionV(MV_LZZ_LIAOBOAT_IDX))
	--²¥·ÅÒôĞ§
	--PlaySound("\\sound\\vn\\scene\\scene_waring.wav")
	LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_waring.wav",ALL_ID)
	--¹«¸æ
	Msg2MSAll(MISSIONID,tSTRING_MISSION[17])
	Msg2MSAll(MISSIONID,tSTRING_MISSION[18])
	--ÉèÖÃ£Á£É
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE)
	g_NpcAI:setWayPoint(nNpcIdx,tMsLiaoBoat)
end

--ËÎ»ğ´¬
function LZZ_Song_Fireboat()
	--print("LZZ_Song_Fireboat called********")
	--ÉèÖÃ±êÖ¾
	if GetMissionV(MV_LZZ_SONGFIREBOAT_TAG1) == 0 then
		SetMissionV(MV_LZZ_SONGFIREBOAT_TAG1,1)
	elseif GetMissionV(MV_LZZ_SONGFIREBOAT_TAG1) == 1 and GetMissionV(MV_LZZ_SONGFIREBOAT_TAG2) == 0 then
		SetMissionV(MV_LZZ_SONGFIREBOAT_TAG2,1)
	else
		return 0
	end
	--´´½¨»ğ´¬
	local nMapID = gf_GetCurMapID()
	local nNpcIdx = CreateNpc("»ğ´¬","ËÎ»ğ´¬",nMapID,tMsFireBoat[1][1],tMsFireBoat[1][2],0)
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\song_fireboat_death.lua")
	SetCurrentNpcSFX(nNpcIdx,970,1,1)
	SetCampToNpc(nNpcIdx,CampSong_Type)
	SetMissionV(MV_LZZ_SONGBOAT_IDX,nNpcIdx)
	--print("ËÎ»ğ´¬index=",nNpcIdx)
	--print("MV_LZZ_SONGBOAT_IDX=",GetMissionV(MV_LZZ_SONGBOAT_IDX))
	--²¥·ÅÒôĞ§
	--PlaySound("\\sound\\vn\\scene\\scene_waring.wav")
	LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_waring.wav",ALL_ID)
	--¹«¸æ
	Msg2MSAll(MISSIONID,tSTRING_MISSION[19])
	Msg2MSAll(MISSIONID,tSTRING_MISSION[20])
	--ÉèÖÃ£Á£É
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE)
	g_NpcAI:setWayPoint(nNpcIdx,tMsSongBoat)
end

--Ë¢ĞÂ³öÆ¯Á÷Ïä
function LZZ_Drifting_Box()
	local nMapID = gf_GetCurMapID()
	local nSize,nNum,nIndex,nCount
	local tFourBox = {
		[1] = {0,0},
		[2] = {0,0},
		[3] = {0,0},
		[4] = {0,0},
	}
	for i = 1,4 do 
		nSize = getn(tMsBoxCopy)
		if nSize == 0 then
			return 0
		end
		nCount = nSize / 4
		--print("nSize = "..nSize)
		nNum = random(nSize)
		--print("nNum = "..nNum)
		tFourBox[i][1] = tMsBoxCopy[nNum][1]
		tFourBox[i][2] = tMsBoxCopy[nNum][2]
		tremove(tMsBoxCopy,nNum)
		--print("tFourBox",tFourBox[i][1],tFourBox[i][2])
	end
	nIndex = CreateNpc("ÎäÆ÷¼Ü","ÎäÆ÷¼Ü",nMapID,tFourBox[1][1],tFourBox[1][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\weapon_npc.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	nIndex = CreateNpc("¶ÜÅÆ¼Ü","¶ÜÅÆ¼Ü",nMapID,tFourBox[2][1],tFourBox[2][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\armor_npc.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	nIndex = CreateNpc("·ÉĞ¬","·ÉĞ¬",nMapID,tFourBox[3][1],tFourBox[3][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\speedboots_npx.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	nIndex = CreateNpc("ÂÌÊ÷Ò¶","ÂÌÊ÷Ò¶",nMapID,tFourBox[4][1],tFourBox[4][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\densefog_npc.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	Msg2MSAll(MISSIONID,tSTRING_MISSION[21])
end

--½ûÖ¹Ê¹ÓÃ¼¼ÄÜ
function lzz_forbid_skill()

end

--ÈİĞíÊ¹ÓÃ¼¼ÄÜ
function lzz_allow_skill()

end

--»ğ´¬Î»ÖÃÅĞ¶Ï
function LZZ_FireBoat_Position()
	--print("LZZ_FireBoat_Position() called!!!")
	local nSongIndex = GetMissionV(MV_LZZ_SONGBOAT_IDX)
	local nLiaoIndex = GetMissionV(MV_LZZ_LIAOBOAT_IDX)
	--print("%%%%%%nSongIndex",nSongIndex)
	--print("%%%%%%nLiaoIndex",nLiaoIndex)
	if nSongIndex == 0 and nLiaoIndex == 0 then
		return 0
	end
--	local nMap,nX,nY
	local nAllow = 3 --ÈİĞíÎó²î·¶Î§
	--ËÎ
	if nSongIndex ~= 0 then
		local nMap,nX,nY = GetNpcWorldPos(nSongIndex)
		--print("nX",nX)
		--print("tMsSongBoat[2][1]-3=",tMsSongBoat[2][1]-nAllow)
		if tonumber(nX) == 0 then
			return 0
		end
		if tonumber(nX) >= tonumber(tMsSongBoat[2][1]-nAllow) then
			SetNpcLifeTime(nSongIndex,0)
			SetMissionV(MV_LZZ_CAMPONE_POINT,GetMissionV(MV_LZZ_CAMPONE_POINT)+FIREBOAT_POINT)
			SetMissionV(MV_LZZ_SONGBOAT_IDX,0)
			--print("Song index after",GetMissionV(MV_LZZ_LIAOBOAT_IDX))
			--¸üĞÂÃæ°å
			LZZ_Panel_Show()
			Msg2MSAll(MISSIONID,tSTRING_MISSION[22])
		end
	end
	--ÁÉ
	if nLiaoIndex ~= 0 then  
		local nMap,nX,nY = GetNpcWorldPos(nLiaoIndex)
		--print("nX",nX)
		--print("tMsLiaoBoat[2][1]+3=",tMsLiaoBoat[2][1]+nAllow)
		if tonumber(nX) == 0 then
			return 0
		end
		if tonumber(nX) <= tonumber(tMsLiaoBoat[2][1]+nAllow) then
			SetNpcLifeTime(nLiaoIndex,0)
			SetMissionV(MV_LZZ_CAMPTWO_POINT,GetMissionV(MV_LZZ_CAMPTWO_POINT)+FIREBOAT_POINT)
			SetMissionV(MV_LZZ_LIAOBOAT_IDX,0)
			--print("Liao index after",GetMissionV(MV_LZZ_LIAOBOAT_IDX))
			--¸üĞÂÃæ°å
			LZZ_Panel_Show()
			Msg2MSAll(MISSIONID,tSTRING_MISSION[23])
		end
	end
end

--Ãæ°åÏÔÊ¾
function LZZ_Panel_Show()
	--print("LZZ_Panel_Show() called#####")
	local str1,str2,num1,num2,fight1,fight2
	local nLoop,nSecond
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_PEACE then
		str1 = "ºÍÆ½"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 5*(PEACE_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_READY then
		str1 = "×¼±¸"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 5*(READY_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		str1 = "Õ½¶·"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 15*(FIGHT_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		str1 = "½áÊø"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 5*(WAITOUT_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
	else 
		--print("FloatMsg2Player ERROR %%%%%")
		WriteLog(tSTRING_MISSION_LOG[1])
	end	
end

--Ãë»»Ëã³ÉÊ±¼ä,·µ»Ø×Ö·û´®
function lzz_second_format(nSecond)
	local nM = floor(nSecond/60)
	local nS = nSecond - nM*60
	if nM < 10 and nS < 10 then
		return format("00:0%d:0%d",nM,nS)
	elseif nM < 10 and nS >= 10 then
		return format("00:0%d:%d",nM,nS)
	elseif nM >= 10 and nS <10 then
		return format("00:%d:0%d",nM,nS)
	else
		return format("00:%d:%d",nM,nS)
	end
end