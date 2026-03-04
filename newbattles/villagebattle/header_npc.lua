Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","宋辽之战，无辜的老百姓才是深受苦难！");
		return 0;
	end;
	local npcIndex = GetTargetNpc();
	if npcIndex <= 0 then
		return 0;
	end;
	local _,nNpcX,nNpcY = GetNpcWorldPos(npcIndex);
	if BT_GetDistance(nNpcX,nNpcY) >= 5 then
		Msg2Player("你距离土民首领太远了。");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	if GetMissionV(MV_SONG_TASKSTEP-1+nCamp) >= MAX_TASK_STEP then
		SetNpcLifeTime(npcIndex,0);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,nCamp);
		ClearMapNpc(MAPID);
		BT_AddPersonalPoint(30);
		BT_SetData(PT_FIND_HEADER,BT_GetData(PT_FIND_HEADER)+1);
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"宋方"..GetName().."最先找到土民首领，宋方最终获得了胜利，30秒后将离开战场。");
		else
			Msg2MSAll(MISSION_ID,"辽方"..GetName().."最先找到土民首领，宋方最终获得了胜利，30秒后将离开战场。");
		end;
		BT_OperateAllPlayer(change_state_peace,{},ALL_ID);	--所有玩家变和平状态
		Talk(1,"","村落争夺战已结束！");
	else
		Talk(1,"","你是谁？我怎么不知道？");
	end;
end;

function change_state_peace(tArg)
	Say(tBattleName[BATTLE_TYPE].."村落争夺战已结束！您的努力将得到回报。",0);
	SetFightState(0);
end;