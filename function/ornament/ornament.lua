
TaskOrnamentScore = 3407

function ornament_get_score()
	return GetTask(TaskOrnamentScore)
end

function ornament_add_score(nVal)
	local nOld = ornament_get_score()
	local nNew = nOld + nVal
	SetTask(TaskOrnamentScore, nNew)
end

function ornament_set_score(nVal)
	SetTask(TaskOrnamentScore, nVal)
end
