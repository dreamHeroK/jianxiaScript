Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_GONGCHENG then
		return 0;
	end;
	if GetMissionV(MV_LONGZHU_FLAG) ~= 1 then
		return 0;
	end
	SetMissionV(MV_LONGZHU_FLAG, 2);
	Msg2MSAll(MISSION_ID, "Long Trô ®· bÞ ph¸ hñy, th¾ng b¹i ®· ph©n, C«ng Thµnh §¹i ChiÕn s¾p kÕt thóc!");
	SetNpcLifeTime(nNpcIdx, 0);	
	StopMissionTimer(MISSION_ID,TIMER_ID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
	SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
	StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	local szResult = "";
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
	szResult = "C«ng thµnh chiÕn ®· kÕt thóc, cuèi cïng bang héi <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> chiÕm lÜnh thµnh c«ng (do bang héi <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> thñ vÖ) <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
	GCZ_PlaySound(GONG_ID,"¹¥³ÇÕ½Ê¤Àû.wav");
	GCZ_PlaySound(SHOU_ID,"¹¥³ÇÕ½Ê§°Ü.wav");
	SetMissionV(MV_WAR_RESULT,GONG_ID);	--ÉèÖÃ½á¹û	
	local lfFunc = function(tArg)
		Say(%szResult,0);
		SetFightState(0);
		if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
			SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			if GetTongDuty() == 1 then
				SetTask(TNC_TONG_AWARD, 1);
			end
		else
			SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			if GetTongDuty() == 1 then
				SetTask(TNC_TONG_AWARD, 2);
			end
		end;
	end;
	mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	AddGlobalCountNews(szResult,1);
	Msg2Global(sf_RemoveTag(szResult,"<",">"));
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	Msg2MSAll(MISSION_ID,"C«ng thµnh chiÕn ®· kÕt thóc, mäi ng­êi rêi khái chiÕn tr­êng th«i");
	WriteLog("[c«ng thµnh C«ng thµnh chiÕn]:"..sf_RemoveTag(szResult,"<",">").."MSUID lµ "..GetMissionV(MV_MISSION_UID));
end