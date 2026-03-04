Include("\\script\\online\\spring2021\\head.lua")

function InitMission()
	StartMissionTimer(SP_MISSION_ID, SP_TIMER_ID, 18);
end

function RunMission()
end

function JoinMission()
end

function EndMission()
	StopMissionTimer(SP_MISSION_ID, SP_TIMER_ID);
end

function OnLeave()
end