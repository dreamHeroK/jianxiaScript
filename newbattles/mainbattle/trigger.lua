Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

function OnTimer()
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nState = BT_GetTempData(PTT_FIGHT_STATE);
	local nCamp = BT_GetCamp();
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_FIGHT);
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("开始战斗了！时间已过去2分钟！");
		Talk(1,"","开始战斗了！时间已过去<color=yellow>2<color>分钟，让我们做好准备。");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),120);
	elseif nState == ROOM_STATE_FIGHT then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
		Msg2Player("战争结束了！双方势不可挡，5秒后离开战场……");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		SetFightState(0);
		BT_SetData(PT_SINGLE_DRAW,BT_GetData(PT_SINGLE_DRAW)+1);
		Say("战争结束了！双方势不可挡，5秒后离开战场……",0)
		local nOffset = (nRoomIndex-1)*2+nCamp-1;
		SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,0);
		Restore();
		RestoreNeili();
	elseif nState == ROOM_STATE_END then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		Msg2Player("返回后营");
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);
		BT_SetTempData(PTT_LOCK,0);	--解锁
		BT_SetTempData(PTT_ROOMINDEX,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);	
	end;
end;