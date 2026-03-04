Include("\\script\\gongcheng\\gongcheng_function.lua");
Include("\\script\\lib\\writelog.lua");

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local szCityName,nCityMapID,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	local szGongName,szShouName = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	SetMissionS(MS_GONG_TONG_NAME,szGongName);
	SetMissionS(MS_SHOU_TONG_NAME,szShouName);
	SetMissionS(MS_CITY_NAME,szCityName);
	local nMSUID = MS_CreateMSUID(nCityIdx);	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	GCZ_InitGraveyard();
	GCZ_CreateTrap(nBattleMapID);
	GCZ_InitTrap();	--三个城门双方均可通过直到某一方派人驻守后
	GCZ_CreateNpc(nBattleMapID);
	WriteLog("[攻城战] 攻城 : 一场恶战开始了, MSUID 是: "..nMSUID..". 侧攻: "..szGongName.."; 边手: "..szShouName);
end;
--Mission开始
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_GONGMEN);	--设置Mission的状态为开始状态
	SetMissionV(MV_TIMER_LOOP,GONGMEN_TIMER_COUNT);	--设置开始状态的持续时间
	StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	StartMissionTimer(MISSION_ID,TIMER_ID2,INTERVAL_TIME);
	StartMissionTimer(MISSION_ID,TIMER_ID,GONGMEN_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	GCZ_ComeToGongmeng();
	mf_Talk2Camp(MISSION_ID,ALL_ID,"大军来了, 战鼓已经响了...攻城战开始!!!!!");
	Msg2MSAll(MISSION_ID,"大军来了, 战鼓已经响了...攻城战开始!!!!!");
	GCZ_PlaySound(ALL_ID,"战斗开始.wav");
	SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);	--设置最初的背景音乐
	SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);
	GCZ_PlayBackGroundMusic(ALL_ID);
	SetMissionV(MV_DESTROY_EAST_DOOR,0);	--这三条指令方便测试时使用RunMission
	SetMissionV(MV_DESTROY_SOUTH_DOOR,0);
	SetMissionV(MV_DESTROY_WEST_DOOR,0);
end;
--Mission结束
function MS_EndMission()
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL)
	StopMissionTimer(MISSION_ID,TIMER_ID2);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	--	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	mf_DelAllMSPlayer(MISSION_ID,ALL_ID);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	ClearMapNpc(nBattleMapID);
	ClearMapTrap(nBattleMapID);
	WriteLog("[攻城战]:一场比赛 Mission 已经结束了, MSUID 是: "..nMSUID);
end;
--离开Mission
function MS_LeaveMission()
	local nGuardID = GetTaskTemp(TEMP_GURAD_ID);
	local nCamp = GCZ_GetPlayerCamp();
	local nOldPlayerIdx = PlayerIndex;
	if nGuardID ~= 0 then	--如果是守卫离开
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nCamp-1,0);	--相应的记录守卫索引的MissionV清0
		if nCamp == GONG_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,SHOU_ID);
		elseif nCamp == SHOU_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,ALL_ID);
		end;
	end;
	local bFighting = GetTaskTemp(TEMP_ARENA_FIGHTING);
	if bFighting ~= 0 then	--如果正在单挑
		local nEnemyCamp = GCZ_GetEnemyCamp();
		local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,0);	--获取单挑对手的索引
		if nEnemyIdx > 0 then
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,nEnemyIdx);	--设置新的守卫
		end;
		PlayerIndex = nEnemyIdx;
		SetMissionV(MV_EAST_DOOR_DRAW+nGuardID-1,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetFightState(0);
		Restore();
		RestoreNeili();
		SetPos(tEntrancePos[nEnemyCamp][1],tEntrancePos[nEnemyCamp][2]);
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		Say("你赢得了单挑的胜利",0);
		Msg2Player("回到后营!");
		PlaySound("\\sound\\单挑胜利.wav");
		SetTaskTemp(TEMP_CHALLENGER,0);	--赢了的就不是挑战者了
		Msg2MSAll(MISSION_ID,GetName(nEnemyIdx).."("..tCampNameZ[nEnemyCamp]..")单挑胜利"..GetName(nOldPlayerIdx).."("..tCampNameZ[nCamp].."), 成为新守卫"..tDoorName[nGuardID]..".");
		PlayerIndex = nOldPlayerIdx;
	end;
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_RestorePlayerState();	--这个要在NewWorld之前，不然切换不了PK状态
	SetMissionV(MV_NORMAL_FLAG2_OWNER,0);
	SetMissionV(MV_NORMAL_FLAG3_OWNER,0);	
	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."-"..GetName().." 已经离开战场");
end;
--加入Mission
function MS_JoinMission(nCamp)
	SetTaskTemp(TEMP_CAMP,nCamp);
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local _,_,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	SetTaskTemp(TEMP_CITY_INDEX,nCityIdx);
	NewWorld(nBattleMapID,tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
	if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
		AddMSPlayer(MISSION_ID,nCamp+2);
		SetTaskTemp(TEMP_REINFORCEMENT,nCamp);
	else
		AddMSPlayer(MISSION_ID,nCamp);
	end;
	Msg2MSAll(MISSION_ID,"大侠"..GetName().."加入了"..tCampNameZ[nCamp]);
	MS_SetPlayerState();
	if nCamp == GONG_ID then
		SetTask(TNC_CAMP_TIME, 0);
--	Say("功方: 整个攻城战将持续2个小时为每周6晚8点到10点，7点种攻城地图开放可以进入进行准备。如果进攻方在战斗中获得了8成攻城积分战斗将强制结束进攻方获得胜利。当战斗时限到达时进攻方攻城积分大于或等于6成攻城成功，否则攻城失败。.",0);
	elseif nCamp == SHOU_ID then
		if GetTask(TNC_CAMP_TIME) == 0 then
			SetTask(TNC_CAMP_TIME, GetTime());
		end
--		Say("守方: 整个攻城战将持续2个小时为每周6晚8点到10点，7点种攻城地图开放可以进入进行准备。如果进攻方在战斗中获得了8成攻城积分战斗将强制结束进攻方获得胜利。当战斗时限到达时进攻方攻城积分大于或等于6成攻城成功，否则攻城失败。",0);
	end;
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,GetMissionS(MS_CITY_NAME).."攻城战,将在"..(nLoop*READY_TIMER_INTERVAL).."分钟后开始.");
	end;
end;
--攻门阶段计时器
function MS_ProcessGongMenTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		GCZ_ComeToGongmeng();
		for i=1,getn(tChengMenJiGuanPos) do
			local nJiGuanIdx = GetMissionV(MV_EAST_JIGUAN_INDEX+i-1);
			if nJiGuanIdx ~= 0 then
				--SetNpcLifeTime(nJiGuanIdx,0);	--让没消失的城门机关消失
				AddUnitStates(nJiGuanIdx,1,-100000000);	--将城门机关的生命设为0
				SetMissionV(MV_DESTROY_EAST_DOOR+i-1,1);	--城门为永久打开状态
				SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,0);
			end;
		end;
	--	GCZ_Msg2Camp("攻城大炮开火, 城门被彻底摧毁",ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	--	Msg2MSAll(MISSION_ID,"距离炮火攻城时间还"..(nLoop*GONGMEN_TIMER_INTERVAL).." 分钟 ");
	end;
end;
--攻城阶段计时器
function MS_ProcessGongChengTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local gongjifen = GetMissionV(MV_NORMAL_FLAG2_OWNER)
    local shoujifen = GetMissionV(MV_NORMAL_FLAG3_OWNER)
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		local szResult = "";
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		if gongjifen > shoujifen then	--攻城方赢了
		    Msg2MSAll(MISSION_ID,"攻:"..gongjifen.."      守:"..shoujifen.."");
			SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
			szResult = "攻城战已经结束了,最后帮会<color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color>成功占领<color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color>守卫的<color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(GONG_ID,"攻城战胜利.wav");
			GCZ_PlaySound(SHOU_ID,"攻城战失败.wav");
			SetMissionV(MV_WAR_RESULT,GONG_ID);	--设置结果
		elseif shoujifen > gongjifen then	--守城方赢了
		    Msg2MSAll(MISSION_ID,"攻:"..gongjifen.."      守:"..shoujifen.."");
			SetCityWarWinner(nCityMapID,GetMissionS(MS_SHOU_TONG_NAME));
			szResult = "攻城战已经结束了,最后帮会<color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color>帮会成功击败<color=red>"..GetMissionS(MS_GONG_TONG_NAME).."帮会,继续占领"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(SHOU_ID,"攻城战胜利.wav");
			GCZ_PlaySound(GONG_ID,"攻城战失败.wav");
			SetMissionV(MV_WAR_RESULT,SHOU_ID);	--设置结果	
		end;
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
		Msg2MSAll(MISSION_ID,"攻城战已经结束了,大家离开战场吧");
		WriteLog("[c??ng thành 攻城战]:"..sf_RemoveTag(szResult,"<",">").."MSUID 是 "..GetMissionV(MV_MISSION_UID));
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"攻:"..gongjifen.."      守:"..shoujifen.."");
		Msg2MSAll(MISSION_ID,"攻城时间还"..(nLoop*GONGMEN_TIMER_INTERVAL).."分钟 ");
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"攻城战結束,"..(nLoop*ENDING_TIMER_INTERVAL).." 分钟 ");
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[攻城战]: 侠客  "..GetName().." 离开Mozilla不正常,正在处理登录.");
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID(nCityIdx)
	local nMSUID = tonumber(date("%y%m%d"))*10+nCityIdx+random(1,1000);	--后面的加数是用来方便测试的
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()
	SetTask(TNC_MUID,GetMissionV(MV_MISSION_UID));
	local nCamp = GCZ_GetPlayerCamp();
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	SetTask(TNC_CAMP,nCamp);
	SetCampToPlayer(tCampNameP[nCamp]);
	EnterChannel(tCityChannel[nCity][1]);
	EnterChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	LeaveTeam();
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetDeathPunish(0);	--无死亡惩罚
	InteractiveEnable(0);	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(0);	--禁止使用回城符
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--禁止改变PK状态
	SetFightState(0);
	KillFollower();	--删除跟班
	ClearStolenSkill();	--清除已偷取的技能，针对棍子
	SetDeathScript("\\script\\gongcheng\\player_death.lua");
	local nCurMapID = tCityInfo[nCity][3];
	SetTempRevPos(nCurMapID,tEntrancePos[nCamp][1]*32,tEntrancePos[nCamp][2]*32);	--设置重生点
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	PlayMusic("\\music\\"..tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)],1);	--播放背景音乐
end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	local nCamp = GCZ_GetPlayerCamp();
	SetLogoutRV(0)
	SetDeathPunish(1);
	InteractiveEnable(1)
	StallEnable(1)
	UseScrollEnable(1);
	ForbidChangePK(0);
	SetPKFlag(0,0);
	LeaveTeam();
	SetFightState(0)
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	SetCampToPlayer("");
	--下面三条指令主要是针对单挑的玩家
	DesaltPlayer(0);
	UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_ClearTempTaskValue();
	if nCity > 0 then	--如果是OnLogin触发的，nCity就是0,于是不用处理了
		LeaveChannel(tCityChannel[nCity][1]);
		LeaveChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	end;
end;
--清除所有的战场临时变量
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;