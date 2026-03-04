Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local nPos = GetTask(POSITION);
	local MapID,MapX,MapY = GetWorldPos();
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		if nPos == TRAPCOUNT-1 then
			SetTask(POSITION,TRAPCOUNT);
			clearflag();
			Msg2Player("你跑完了赛道，在准备区等待比赛结束。");
			if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED then 
				StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
				StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
				SetMissionV(MV_TIMELEFT,WAITSTOP_TIMER_LOOP);
				SetMissionV(MV_ROOMSTATE,MS_STATE_WAITCOMPLETE);
				Msg2MSAll(MISSION_ID,GetName().."第一个到达终点，比赛将在一分钟后结束。");
			end;
			SetMissionV(MV_COMPLETENUM,GetMissionV(MV_COMPLETENUM)+1);	
			SetTask(RANK,GetMissionV(MV_COMPLETENUM));
			SetTask(FINISHTIME,GetGameLoop()-GetMissionV(MV_GAMELOOP));
			if GetTask(BEST_TIME) == 0 then
				SetTask(BEST_TIME,GetTask(FINISHTIME));	--记录最好成绩，单位为帧				
			elseif GetTask(BEST_TIME) > GetTask(FINISHTIME) then
				Msg2Player("祝贺你打破了第一名的记录。");
				SetTask(BEST_TIME,GetTask(FINISHTIME));	--记录最好成绩，单位为帧
			end;
			local FinishTime = GetTask(FINISHTIME);
			FinishTime = FinishTime/18;
			local nMin = floor(FinishTime/60);
			local nSec = format("%.2f",FinishTime - nMin*60);	--小数点后两位就够了
			local sResult = "总用时："..nMin.."分"..nSec.."秒"

			Msg2MSAll(MISSION_ID,GetName().."冲向终点"..sResult);
			if GetMissionV(MV_COMPLETENUM) == GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) then
				StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
				Msg2MSAll(MISSION_ID,"比赛结束了，请看你的排名。");
				StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
				SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
				Report_Result(Get_Rank());
				Give_Award();
			end;
			ForbidChangePK(0);
			SetPKFlag(0,0);	--设置为屠杀状态
			ForbidChangePK(1);	--禁止改变PK状态
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);		
		else
			NewWorld(MapID,2019,3291);
			InteractiveEnable(0);
			Msg2Player("不要向相反方向比赛。");
		end;
	end;
end;

function clearflag()
	for i=FLAG_BEGIN,FLAG_END do	--清除曾穿过的旗子的记录
		SetTask(i,0);
	end;
end;