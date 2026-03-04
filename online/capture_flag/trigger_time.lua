--filename:trigger_time.lua
--create date:2021-04-11
--author:
--describe:抢到旗子触发器脚本
Include("\\script\\online\\capture_flag\\head.lua")

function OnTimer()
	--是否关闭
	if not CF_SWITCH or CF_SWITCH ~= 1 then
		return
	end
	if cf_IsOpen() ~= 1 then
		return 0;
	end
	if cf_checktime() == 0 and GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		RemoveTrigger(GetTrigger(4200))
		KillFollower()
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		RemoveTitle(3,3)
	end
end