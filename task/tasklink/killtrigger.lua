TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- 当前选择的师门任务的难度等级

function killmonster()
	local task_id = 11
	local task_info = GetInfo(task_id, 4)					-- 任务NPC模板ID
			 	 
   	if (GetIfDoingTask(task_id, task_info) == 1) then
		FillTaskValue(task_id)
		TaskTip("师门任务: 追杀"..task_info..",已经完成")
	end
end

function killmonster1()
	local task_id = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local task_info = GetInfo(task_id, 4)					-- 任务NPC模板ID
			 	 
   	if (GetIfDoingTask(task_id, task_info) == 1) then
		FillTaskValue(task_id)
		TaskTip("循环任务师门: 追杀"..task_info..",已经完成")
	end
end