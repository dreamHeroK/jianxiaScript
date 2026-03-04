--filename:timer.lua
--create date:2006-06-5
--describe:村落战计时器
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
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
	--处理目标战斗NPC打斗超时
	process_fight_timeout(SONG_ID)
	process_fight_timeout(LIAO_ID)
	local nStepSong = GetMissionV(MV_SONG_TASKSTEP);
	local nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
	local sResult = "";
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,ALL_ID);	--时间结束时双方都没有找到首领，会在EndMission处处理胜负关系
		if nStepSong > nStepLiao then
			sResult = "经过激烈的战斗，宋军在雁门关村落争夺战场赢得了最后的胜利！";
		elseif nStepLiao > nStepSong then
			sResult = "经过激烈的战斗，辽军在雁门关村落争夺战场赢得了最后的胜利！";
		else
			sResult = "经过激烈的战斗，宋辽双方在雁门关村落争夺战场都没能找到土民首领，打成平局！";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."已经结束，宋辽双方仍然没有找到土民首领。");
		Msg2MSAll(MISSION_ID,"最终宋辽双方击杀知情人 ["..nStepSong.."]:["..nStepLiao.."], "..sResult);
		Msg2MSAll(MISSION_ID,"");
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"当前宋辽双方击杀知情人 ["..nStepSong.."]:["..nStepLiao.."] 剩余时间: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"当前宋辽双方战场人数 ["..nPlayerSong.."]:["..nPlayerLiao.."]");
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
--处理与目标NPC战斗超时的情况
function process_fight_timeout(nCamp)
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local sNewTargetName = "";
	local nTaskFailed = 0;
	if GetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1) == 1 then	--如果目前任务NPC为战斗状态
		local nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		local nBeginTime = GetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT1 then
				BT_ShowDebugInfor("仇恨的NPC");
				Modify_Task_Step(nCamp,-2);
				nTaskFailed = 1;
			end;
		elseif nNpcType == ANGRY_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT2 then
				BT_ShowDebugInfor("愤怒的NPC");
				Modify_Task_Step(nCamp,-3);
				nTaskFailed = 1;
			end;		
		else
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT3 then
				BT_ShowDebugInfor("狂暴的NPC");
				Modify_Task_Step(nCamp,-5);
				nTaskFailed = 1;
			end;		
		end;
		if nTaskFailed == 1 then
			sNewTargetName = Go_To_Next_Step(nCamp);
			if sNewTargetName == "" then	--nCamp方人数为0
				return 0;
			end;
			BT_OperateAllPlayer(tell_fail,{sNewTargetName,nCamp},nCamp);
		end
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "太遗憾了！知情人在我们到来之前已被敌人谋杀。但是我们得到了一个消息：土民<color=yellow>"..sName.."<color>可能知道首领的下落，邀请将士们<color=yellow>"..GetMissionS(MSTR_SONG_ONE+nCamp-1)..","..GetMissionS(MSTR_SONG_TWO+nCamp-1)..","..GetMissionS(MSTR_SONG_THREE+nCamp-1).."<color> 迅速去那里找到下一个知情人<color=yellow>"..sName.."<color>.";
	Say(sContent,0);
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."战场已结束，您的努力将会得到回报。",0);
	SetFightState(0);
	--store_battle_infor();
end;

function store_battle_infor()
	local nSongStep = GetMissionV(MV_SONG_TASKSTEP);
	local nLiaoStep = GetMissionV(MV_LIAO_TASKSTEP);
	local tPointRank = BT_SortMSPlayerByTaskValue(PT_BATTLEPOINT,0)
	local tRankTable = {
					[1] = "",
					[2] = "",
					[3] = "",
					[4] = "",
					[5] = "",
					}
	for i=1,5 do
		if tPointRank[i] == nil then
			break;
		else
			tRankTable[i] = tPointRank[i];
		end;
	end;
	CustomDataSave(CD_BTS_VILLAGE,"ddsssss",nSongStep,nLiaoStep,tRankTable[1],tRankTable[2],tRankTable[3],tRankTable[4],tRankTable[5]);
end;