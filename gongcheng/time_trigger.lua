--create date:07-04-16
--author:yanjun
--describe:单挑时间触发器
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnTimer()
	local nState = GetTaskTemp(TEMP_FIGHT_STATE);
	local nCamp = GCZ_GetPlayerCamp();
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("开始单挑!时间大约7分钟");
--		Talk(1,"","现在开始单挑!比赛时间是<color=yellow>7分钟<color>");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--一柱香时间
		SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,1);
	elseif nState == ROOM_STATE_FIGHT then
		local nLoop = GetTaskTemp(TEMP_FIGHT_TIMER_LOOP);
		if nLoop <= 6 then
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--一柱香时间
			SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,nLoop+1);
			Msg2Player("单挑时间: "..(7-nLoop).." 分钟");
			return 0;
		end;
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--当前是挑战者
			local nEnemyCamp = GCZ_GetEnemyCamp();
			local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
			Msg2MSAll(MISSION_ID,"大侠"..GetName().."和"..GetName(nEnemyIdx).."大战300回合不分胜负,择日再战");
		end;
		SetFightState(0);
		PlaySound("\\sound\\单挑平局.wav");
		Say("比赛结束了!双方不分胜负,5秒后离开战场......",0);
		Restore();
		RestoreNeili();
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		if nCamp == SHOU_ID then	--只处理守方人员
			if GetTaskTemp(TEMP_CHALLENGER) ~= 1 then	--如果不是挑战者，那平局次数就加1
				SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1)+1);
			end;
			if GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1) == 3 then	--连续三次平手				
				SetTaskTemp(TEMP_GURAD_ID,0);
				SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--清空所记录的玩家索引
				SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
				SetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1,1);	--城门被摧毁
				if nDoorIdx == 1 then	--如果是东门
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);	--对攻方开放墓地B2
					Msg2MSAll(MISSION_ID,"东门外的集合点已经开放");
				elseif nDoorIdx == 2 then 	--如果是中门
					Msg2MSAll(MISSION_ID,"城中区开放了。 ");
				elseif nDoorIdx == 3 then	--如果是西门
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);	--对攻方开放墓地B1
					Msg2MSAll(MISSION_ID,"西门的集合点已经开放了");
				end;
				--SetNpcLifeTime(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),0);
				AddUnitStates(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),1,-100000000);	--将城门机关的生命设为0
			end;
		end;
	elseif nState == ROOM_STATE_END then
		Msg2Player("回到后营!!");
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--当前是挑战者
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,0);	--清除挑战者的索引记录
			SetTaskTemp(TEMP_GURAD_ID,0);
		end;
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		SetTaskTemp(TEMP_CHALLENGER,0);
		SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);	
	end;
end;