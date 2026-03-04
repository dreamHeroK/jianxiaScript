function talktask()
	task_id = 11
	task_info = {GetInfo(task_id, 1),
		     GetInfo(task_id, 2),
		     GetInfo(task_id, 3),
		     GetInfo(task_id, 4)}	

	if (GetIfDoingTask(task_id, task_info[1]) == 1) then
		RemoveTrigger(GetRunningTrigger())
		Say(task_info[3].."\n\n"..task_info[4], 0)
		TaskTip("与"..task_info[1].."对话，完成任务")
	else
		RemoveTrigger(GetRunningTrigger())
	end
end
