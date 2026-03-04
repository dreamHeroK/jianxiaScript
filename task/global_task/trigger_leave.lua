--  文件说明
--  所有触发器离开游戏计时停止
--  Created by lizhi
--  2005-8-3 15:05
Include("\\script\\task\\global_task\\gtask_head.lua");

function Zs_Leave_Game()
	RemoveTrigger(GetRunningTrigger());
	RemoveTrigger(GetTrigger(86));
	if GetTask(3343) == 2 then
		KillFollower();
		SetTask(3343, 1);
	end;
end;