--File name:waitstart_timer.lua
--Describe:报名结束后倒计时脚本
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			RunMission(MISSION_ID);
		else
			StopMissionTimer(MISSION_ID,WAITSTART_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTART_TIME/18;
			Msg2MSAll(MISSION_ID,"比赛时间还剩"..timeleft.." 秒 ");
		end;
	else
		Msg2MSAll(MISSION_ID,"由于参加人数不足"..LEASTPLAYER.."人，比赛无法进行!");
		CloseMission(MISSION_ID);
	end;
end;