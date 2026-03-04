Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnTimer()
	SetMissionV(MV_TMZ_GAME_LOOP,GetGameLoop());
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_PEACE then
		Process_Peace_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Peace_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);
	if nLoop == 0 then
		if nPlayerOne < PLAYER_NEED_NUM or nPlayerTwo < PLAYER_NEED_NUM then
			GLB_TMZ_NoOpen();
			_stat_on_misson_none_start()
		end 
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,3) == 0 then --15秒播放一次
			Msg2MSAll(MISSION_ID,"时间进度: ["..(PEACE_TIMER_LOOP-nLoop+1)..":"..(PEACE_TIMER_LOOP+1).."]");
			Msg2MSAll(MISSION_ID,"双方阵营比例:"..CampOne_Name.."["..nPlayerOne.."]:["..nPlayerTwo.."]"..CameTwo_Name.."。 当两方所有人数达到"..PLAYER_NEED_NUM.."人, 天门阵战场将开始！");
		end
		if nPlayerOne >= PLAYER_NEED_NUM and nPlayerTwo >= PLAYER_NEED_NUM then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIME);
			SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_READY);
			Msg2MSAll(MISSION_ID,"天门阵演武将在1分钟内开始，请大侠们做好准备。");
		end
	end
end

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	if nLoop == 0 then
		--判断下人数
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		_stat_on_misson_start(MISSION_ID)
		WriteLog("[天门阵演武开始]: 时间是"..GetMissionV(MV_TMZ_LOG_TIME).."战役已经开始，参加人数是： ["..nPlayerOne.."]:["..nPlayerTwo.."]，总人数为： "..(nPlayerOne+nPlayerTwo));
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,6) == 0 then	--30秒播放一次
			Msg2MSAll(MISSION_ID,"还有"..Get_Time_String(READY_TIME/18*nLoop)..", “天门阵演武”战役将正式开始，参加人数目前是："..CampOne_Name.."["..nPlayerOne.."]:["..nPlayerTwo.."]"..CameTwo_Name);
		end
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	local nEyeOne = GetMissionV(MV_TMZ_CAMPONE_EYE);
	local nEyeTwo = GetMissionV(MV_TMZ_CAMPTWO_EYE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TMZ_WINNER_CAMP,ALL_ID);
		Msg2MSAll(MISSION_ID,format("%s和%s决战40分钟，胜负未定。",CampOne_Name,CameTwo_Name));
		TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
		
		_stat_on_misson_end(MISSION_ID, 0)
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		--每过15秒就检查双方的阵眼
		SetMissionV(MV_TMZ_CAMPONE_POINT,GetMissionV(MV_TMZ_CAMPONE_POINT)+nEyeOne*5);
		SetMissionV(MV_TMZ_CAMPTWO_POINT,GetMissionV(MV_TMZ_CAMPTWO_POINT)+nEyeTwo*5);
		local nPointOne = GetMissionV(MV_TMZ_CAMPONE_POINT);
		local nPointTwo = GetMissionV(MV_TMZ_CAMPTWO_POINT);				
		TMZ_Set_ShowData_Msg();	
		--检查比分
		if nPointOne >= OVER_GAME_POINT and nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,ALL_ID);
			Msg2MSAll(MISSION_ID,format("%s和%s双方积分都达到%d, 无法决出胜负。",CampOne_Name,CameTwo_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			
			_stat_on_misson_end(MISSION_ID, 0)
			return 0;								
		end		
		if nPointOne >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,CampOne_ID);
			Msg2MSAll(MISSION_ID,format("%s阵营获得了%d积分, 取得胜利！",CampOne_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			_stat_on_misson_end(MISSION_ID, 1)
			return 0;			
		end
		if nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,CampTwo_ID);
			Msg2MSAll(MISSION_ID,format("%s阵营获得了%d积分, 取得胜利！",CameTwo_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			_stat_on_misson_end(MISSION_ID, 2)		
			return 0;
		end		
		if (nPointOne >= APPEAR_FLAG_POINT or nPointTwo >= APPEAR_FLAG_POINT) and GetMissionV(MV_TMZ_APPEAR_FLAG) == 0 then
			SetMissionV(MV_TMZ_APPEAR_FLAG,1);
			--创建战旗
			local nMapId = gf_GetCurMapID();
			local nNpcIdx = CreateNpc(tPositionNpcFlag[1][1][1],tPositionNpcFlag[1][1][2],nMapId,tPositionNpcFlag[1][1][3],tPositionNpcFlag[1][1][4]);
			SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
			SetCampToNpc(nNpcIdx,CampOne_Type);
			nNpcIdx = CreateNpc(tPositionNpcFlag[2][1][1],tPositionNpcFlag[2][1][2],nMapId,tPositionNpcFlag[2][1][3],tPositionNpcFlag[2][1][4]);
			SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
			SetCampToNpc(nNpcIdx,CampTwo_Type);
			Msg2MSAll(MISSION_ID,"注意了各位英雄，战旗已经出现在敌人战场的后方，只需占领地方的战旗就可以加快赢得战斗的进程。"); 
		end
		if mod(nLoop,4) == 0 then
			Msg2MSAll(MISSION_ID,"时间进度: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
			Msg2MSAll(MISSION_ID,"双方当前积分是: "..CampOne_Name.."["..nPointOne.."]:["..nPointTwo.."]"..CameTwo_Name)
			TMZ_OperateAllPlayer(TMZ_KickSleep,{},ALL_ID); --睡眠的强行踢出战场
		end		
		if mod(nLoop,10) == 0 then
			Msg2MSAll(MISSION_ID,format("双方当前人数是: %s[%d]: [%d]%s",CampOne_Name,nPlayerOne,nPlayerTwo,CameTwo_Name));
		end;
		TMZ_OperateAllPlayer(TMZ_KickDeather,{},ALL_ID); --死亡的强行踢出战场
		TMZ_DrivePlayerOutOfShelter();	--后营的强行传到前营
		TMZ_CureAllPlayer();						--治疗所有和平状态的玩家
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)		
		if GLB_TMZ_RealmCheck() == 1 then --跨服帮会天门阵处理
			GLB_TMZ_BattleOver();
		end 	
--		Msg2MSAll(MISSION_ID,"还有"..(COMPLETE_TIME/18*nLoop).."秒退出本次天门阵战场");
	end;
end;
