--create date:2007-07-04
--author:yanjun
--describe:帮会关卡Mission头文件
Include("\\script\\missions\\tong_mission\\main_function.lua");

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_SECOND);	--开始一个计时器
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	local nMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_STAGE_OVER,1);	--非闯关时间段
	TM_CreateFieldNpc(nMapID);
	local nYearWeek = tonumber(date("%y%W"));
	SetMissionV(MV_WEEK,nYearWeek);
	local szTongName = GetMissionS(MS_TONG_NAME);
	TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nYearWeek);
	DelRelayShareDataCopy(szTongName,0,0);
	WriteLog("[紫光阁]:"..szTongName.."帮会开始闯关, nMSUID: "..nMSUID);
end;
--Mission开始
function MS_StartMission()
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,ALL_CAMP);
	if nPlayerCount < MIN_PLAYER_COUNT then
		Msg2MSAll(MISSION_ID,"闯关总人数少于"..MIN_PLAYER_COUNT.."人，场地已关闭。");
		CloseMission(MISSION_ID);
		return 0;
	end;
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
	StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	Msg2MSAll(MISSION_ID,"准备时间已结束");
end;
--Mission结束
function MS_EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID);
	ClearMapObj(nMapID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	local szTongName = GetMissionS(MS_TONG_NAME);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	TM_SetTongFieldState(nMapID,0);
	WriteLog("[紫光阁]:"..szTongName.."帮会结束闯关, nMSUID:"..nMSUID);
end;
--离开Mission
function MS_LeaveMission()
	local nMapID = GetTaskTemp(TSK_TEMP_MAP_ID);
	MS_RestorePlayerState();
	NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,ALL_CAMP);
	gf_ShowDebugInfor("player count:"..GetMSPlayerCount(MISSION_ID,0));
	if nPlayerCount < MIN_PLAYER_COUNT then
		if GetMissionV(MV_MISSION_STATE) > MS_STATE_READY then
			Msg2MSAll(MISSION_ID,"闯关总人数少于"..MIN_PLAYER_COUNT.."人，场地已关闭。");
			CloseMission(MISSION_ID);
		end;
	end;
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	local nMapID = SubWorldIdx2ID(SubWorld);
	NewWorld(nMapID,tPos_Out_Room[1],tPos_Out_Room[2]-10);
	MS_SetPlayerState();
	AddMSPlayer(MISSION_ID,nCamp)
	Msg2MSAll(MISSION_ID,GetName().."进入了关卡场地");
	Say("内堂与外堂的总玩家人数不得少于<color=yellow>"..MIN_PLAYER_COUNT.."<color>人，否则关卡将自动关闭。",0);
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"准备时间倒计时："..(tf_GetTimeString(nLoop*READY_TIMER_INTERVAL)));
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	SetMissionV(MV_TIMER_LOOP,nLoop+1);
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:ProcessTimer();
	nLoop = nLoop + 1;
	local szMsg = "";
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_ID);
	if mod(nLoop,12) == 0 then	--1分钟一报
		szMsg = "目前在该场地的人数："..nPlayerCount;
	end;
	if nPlayerCount < MIN_PLAYER_COUNT then
		Msg2MSAll(MISSION_ID,"闯关总人数少于"..MIN_PLAYER_COUNT.."人，场地已关闭。");
		CloseMission(MISSION_ID);
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"准备时间倒计时："..(tf_GetTimeString(nLoop*ENDING_TIMER_INTERVAL)));
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[帮会]: 玩家"..GetName().."离开任务不正常，正在重新处理登录过程。");
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = random(1,999999);	--随机一个吧，MSUID对关卡好像没什么用处
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()
	local nCurWeek = tonumber(date("%y%W"));
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetFightState(1);	--战斗状态
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetDeathScript("\\script\\missions\\tong_mission\\npc\\death_player.lua");
	local nMapID = GetTaskTemp(TSK_TEMP_MAP_ID);
	SetTempRevPos(nMapID,tPos_Entrance[nMapID][1]*32,(tPos_Entrance[nMapID][2]-10)*32);	--死亡重生点
	SetPKFlag(1,1);	--PK状态
	ForbidChangePK(1);	--禁止转换PK状态
	UseScrollEnable(0);	--禁止使用回城符
	ForbitTrade(1);	--禁止交易
	StallEnable(0);	--禁止摆摊
	OpenFriendliness(0);	--不增加好感度
	SetDeathPunish(0);	--无死亡惩罚
	SetMomentum(0);		--清除杀气值
	InteractiveEnable(0);	--禁止互动
	ClearStolenSkill();	--清除已偷取的技能，针对棍子
	if GetTongName() ~= GetMissionS(MS_TONG_NAME) then
		SetTaskTemp(TSK_TEMP_HELPER,1);	--标记为外援
	end;
	TM_WeeklyClear();	--一周一清
end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()
	SetLogoutRV(0);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	SetFightState(0);	--和平状态
	SetDeathScript("");	--清空死亡脚本
	SetTempRevPos(0,0,0);	--删除临时重生点
	ForbidChangePK(0);	--可以转换PK状态
	SetPKFlag(0,0);	--无PK状态
	UseScrollEnable(1);	--允许使用回城符
	ForbitTrade(0);	--允许交易
	StallEnable(1);	--允许摆摊
	OpenFriendliness(1);	--可增加好感度
	SetDeathPunish(1);	--有死亡惩罚
	LeaveTeam();	--离开队伍
	StopTimeGuage(-2);
	InteractiveEnable(1);	--允许互动
	MS_ClearTempTaskValue();
end;
--清除Mission所用到的临时变量
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;

