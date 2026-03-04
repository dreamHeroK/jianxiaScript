--describe:特殊计时器。可以根据计时器的状态来选择触发一些事件
--一般来说这个事件的持续时间不长
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnTimer()
	local nTimerState = GetMissionV(MV_SP_TIMER_STATE);
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if nTimerState == TM_STATE_CATERAN_SONG or nTimerState == TM_STATE_CATERAN_LIAO then
			Process_Sp_Careran_Even(nTimerState);
		end;
	else
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nTimerState-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nTimerState-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	end;
end;
--山贼劫营事件,nCamp指的是山贼的阵营
function Process_Sp_Careran_Even(nCamp)
	local nLoop = GetMissionV(MV_SP_TIMER_LOOP);
	SetMissionV(MV_SP_TIMER_LOOP,nLoop-1)
	local nCateranCount = CountGroupUnit(CATERAN_GROUP_SONG+nCamp-1);
	local nEnemyCamp = 3 - nCamp;
	if nLoop == 0 then
		if nCateranCount > 0 then
			if nEnemyCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"宋方后营的山贼似乎正在逃跑");
			else
				Msg2MSAll(MISSION_ID,"辽方后营的山贼似乎正在逃跑");
			end;
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nCamp-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nCamp-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	elseif nLoop <= 45 then	--15秒后才有效果
		if nCateranCount == 0 then
			if nLoop > 30 then
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"宋方后营的山贼正在被赶走");
				else
					Msg2MSAll(MISSION_ID,"辽方后营的山贼正在被赶走");
				end;
			else
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"宋方后营的山贼正在被赶走");
				else
					Msg2MSAll(MISSION_ID,"辽方后营的山贼正在被赶走");
				end;
			end;
			SetMissionV(MV_SP_TIMER_STATE,0);
			StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
			return 0;
		end;
		Add_Resource(nCamp,nCateranCount);	--nCamp方粮草增加
		Msg2MSGroup(MISSION_ID,"击败山贼，获得"..nCateranCount.."包粮草",nCamp);
		Dec_Resource(nEnemyCamp,nCateranCount);	--nEnemyCamp方粮草减少
		Msg2MSGroup(MISSION_ID,"前线战报:"..nCateranCount.."包粮草被山贼劫走",nEnemyCamp);
	elseif nCateranCount == 0 then	--15秒内如果山贼数量为0
		if nEnemyCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"宋方后营的山贼全部被赶走");
		else
			Msg2MSAll(MISSION_ID,"辽方后营的山贼全部被赶走");
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
		return 0;		
	end;
end;
