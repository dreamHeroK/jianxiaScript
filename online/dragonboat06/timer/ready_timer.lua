--File name:ready_timer.lua
--Describe:报名阶段计时器脚本
--		　 报名截止后执行这个脚本
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	local timeleft = GetMissionV(MV_TIMELEFT);
	if timeleft == 0 then
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) < LEASTPLAYER then
			Msg2MSAll(MISSION_ID,"由于参加人数不足"..LEASTPLAYER.."人，比赛无法进行!");
			CloseMission(MISSION_ID);
			return 0;
		end;
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
		SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);	--初始化报时次数
		Msg2MSAll(MISSION_ID,"报名时间已经结束，选手们准备上船，30秒后比赛正式开始。");
	else
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,READY_TIMER_ID,READY_TIME);
		SetMissionV(MV_TIMELEFT,timeleft-1);
		timeleft = timeleft*READY_TIME/18;
		Msg2MSAll(MISSION_ID,"报名将在稍后"..timeleft.."秒后结束报名。");		
	end;
end;