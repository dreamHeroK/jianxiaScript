--  文件说明
--  所有触发器计时器
--  Created by lizhi
--  2005-8-3 15:05
Include("\\script\\task\\global_task\\gtask_head.lua");

function Zs_OnTimer()
	RemoveTrigger(GetRunningTrigger());
	RemoveTrigger(GetTrigger(87));
	KillFollower();
	local nStep = GetTask(3343)
	if (nStep == 2) then
		SetTask(3343, 1);
		Msg2Player("未在规定时间完成护送钟氏，任务失败");
		TaskTip("未在规定时间完成护送钟氏，任务失败");
	end;
end;