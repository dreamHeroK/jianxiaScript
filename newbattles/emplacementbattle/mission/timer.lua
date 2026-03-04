--filename:timer.lua
--create date:2006-06-19
--describe:炮台争夺战场中主计时器脚本
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");
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
		if mod(nLoop,10) == 0 then
			AddGlobalNews("距雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战三场战役打响还有"..(floor(nLoop/10)*5).."分钟，请各路英雄速速报名参战，御敌勤王！");
			Msg2Global("距雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战三场战役打响还有"..(floor(nLoop/10)*5).."分钟，请各路英雄速速报名参战，御敌勤王！");
		end;
		Msg2MSAll(MISSION_ID,"现在还在准备阶段，"..tBattleName[BATTLE_TYPE].."还有"..Get_Time_String(READY_TIME/18*nLoop).."开启，当前宋辽双方["..nPlayerSong.."]:["..nPlayerLiao.."]");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nOccupyTime = 0;
	if nLoop == 0 then
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--如果目前还占领着炮台
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			SetMissionV(MV_OCCUPY_TIME_SONG,GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_SONG,0);		
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			SetMissionV(MV_OCCUPY_TIME_LIAO,GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_LIAO,0);			
		end;
		local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		local sResult = "";
		if nTimeSong > nTimeLiao then
			SetMissionV(MV_WINNER,SONG_ID);--宋赢
		elseif nTimeSong == nTimeLiao then
			SetMissionV(MV_WINNER,ALL_ID);--打平
		else
			SetMissionV(MV_WINNER,LIAO_ID);--辽赢
		end;
		if nTimeSong > nTimeLiao then
			sResult = "经过激烈的战斗，宋军在雁门关炮台战场赢得了最后的胜利！";
		elseif nTimeLiao > nTimeSong then
			sResult = "经过激烈的战斗，辽军在雁门关炮台战场赢得了最后的胜利！";
		else
			sResult = "经过激烈的战斗，宋辽双方在雁门关炮台战场打成平局！";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."已经结束。");
		Msg2MSAll(MISSION_ID,"最终宋辽双方占领炮台时间 ["..nTimeSong.."秒]:["..nTimeLiao.."秒]。"..sResult);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		local nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--如果目前还占领着炮台
			nOccupyTimeSong = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTimeSong;
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTimeLiao = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTimeLiao;	
		end;
		Msg2MSAll(MISSION_ID,"当前宋辽双方占领炮台时间 ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		local nScaleSong = floor(100*(nOccupyTimeSong/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		local nScaleLiao = floor(100*(nOccupyTimeLiao/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		Msg2MSAll(MISSION_ID,"当前宋辽双方战场积分 ["..nScaleSong.."]:["..nScaleLiao.."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--一分钟报一次双方人数
			Msg2MSAll(MISSION_ID,"当前宋辽双方战场人数 ["..nPlayerSong.."]:["..nPlayerLiao.."]");
		end;
		if mod(nLoop,5*3) == 0 then	--五分钟刷一次NPC
			Create_Npc("土民",GetMissionV(MV_KILL_NATIVE_COUNT));
			SetMissionV(MV_KILL_NATIVE_COUNT,0);
			Create_Npc("炮台守卫",GetMissionV(MV_KILL_GUARD_COUNT));
			SetMissionV(MV_KILL_GUARD_COUNT,0);		
		end;
		if mod(nLoop,4) == 0 then
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
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
	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 4));
end;