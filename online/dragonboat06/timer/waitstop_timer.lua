--File name:waitstop_timer.lua
--Describe:决出第一名后倒计时脚本，在决出第一名的同时启动这个计时器
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			Msg2MSAll(MISSION_ID,"比赛时间结束，有些人还没到终点。发布当前排名，30秒后自动传送出比赛场地。");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
			Report_Result(Get_Rank());
			Give_Award();
		else
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTOP_TIME/18;
			Msg2MSAll(MISSION_ID," 还有 "..timeleft.." 秒比赛结束。");		
		end;
	else
		StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
		Msg2MSAll(MISSION_ID,"由于参加人数不足"..LEASTPLAYER.."人，比赛无法进行!30秒后将自动传送回去。");
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--等待传送玩家离场
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		Report_Result(Get_Rank());
		Give_Award();
	end;
end;
