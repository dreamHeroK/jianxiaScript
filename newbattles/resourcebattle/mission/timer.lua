--filename:timer.lua
--create date:2006-06-16
--describe:粮草争夺战场中主计时器脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		if mod(nGlobalState,10) == 1 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--变为xx2
			AddGlobalNews("雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战已经准备就绪，请尽快前往赵延年或萧远楼处前往战场");
			Msg2Global("雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战已经准备就绪，请尽快前往赵延年或萧远楼处前往战场");
		end;
	else
--		if mod(nLoop,10) == 0 then
--			AddGlobalNews("距雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战三场战役打响还有"..(floor(nLoop/10)*5).."分钟，请各路英雄速速报名参战，御敌勤王！");
--			Msg2Global("距雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战三场战役打响还有"..(floor(nLoop/10)*5).."分钟，请各路英雄速速报名参战，御敌勤王！");
--		end;
		Msg2MSAll(MISSION_ID,"现在还在准备阶段，"..tBattleName[BATTLE_TYPE].."还有"..Get_Time_String(READY_TIME/18*nLoop).."开启，当前宋辽双方["..nPlayerSong.."]:["..nPlayerLiao.."]");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nResSong = Get_ResCount(SONG_ID);
	local nResLiao = Get_ResCount(LIAO_ID);
	local sResult = "";
	if nLoop == 0 then	
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."战斗结束");
		if nResSong > nResLiao then
			sResult = "经过激烈的战斗，宋军在雁门关草谷场战场赢得了最后的胜利！"
		elseif nResLiao > nResSong then
			sResult = "经过激烈的战斗，辽军在雁门关草谷场战场赢得了最后的胜利！"
		else
			sResult = "经过激烈的战斗，宋辽双方在雁门关草谷场战场赢得了打成平局！"
		end;
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,"当前宋辽双方获得粮草 ["..nResSong.."]:["..nResLiao.."]."..sResult);
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"当前宋辽双方获得粮草 ["..nResSong.."]:["..nResLiao.."], 剩余时间: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			Reflash_Res();	--40秒刷新一次粮草点
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--每一分钟公布一下当前双方人数
			Msg2MSAll(MISSION_ID,"当前宋辽双方战场人数 ["..nPlayerSong.."]:["..nPlayerLiao.."]");
			Create_Res_Npc(ceil(GetMSPlayerCount(MISSION_ID,ALL_ID)/2));	--一分钟刷一次高级粮草堆
		end;
		if mod(nLoop,15) == 0 then	--每五分钟触发一次山贼打劫后营事件
			Create_Cateran_Even();
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"战场停留时间剩余："..(COMPLETE_TIME/18*nLoop).."秒");
	end;
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."战场已结束，您的努力将会得到回报。",0);
	SetFightState(0);
end;