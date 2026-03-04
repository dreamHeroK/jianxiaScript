Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function check_cur_task_login_retask()
	if tGtTask:check_cur_task(525) == 1 then
		SetTask(3350,0)
	end
	if tGtTask:check_cur_task(753) == 1 then
		SetTask(3349,0)
	end
	if tGtTask:check_cur_task(425) == 1 then
		SetTask(3348,0)
	end
	if tGtTask:check_cur_task(433) == 1 then
		SetTask(3349,0)
	end
	if tGtTask:check_cur_task(763) == 1 then
		SetTask(3350,0)
	end
	if tGtTask:check_cur_task(505) == 1 then
		SetTask(3348,0)
	end
	if tGtTask:check_cur_task(429) == 1 then
		SetTask(3349,0)
	end
	if tGtTask:check_cur_task(402) == 1 then
		SetTask(3348,0)
	end
	if tGtTask:check_cur_task(470) == 1 then
		SetTask(3348,0)
	end
	if tGtTask:check_cur_task(566) == 1 then
		SetTask(3346,0)
	end
	if tGtTask:check_cur_task(709) == 1 then
		SetTask(3347,0)
	end
	if tGtTask:check_cur_task(875) == 1 then
		SetTask(3346,0)
	end
	if tGtTask:check_cur_task(544) == 1 then
		SetTask(3347,0)
	end
	if tGtTask:check_cur_task(546) == 1 then
		SetTask(3348,0)
	end
	if tGtTask:check_cur_task(548) == 1 then
		SetTask(3349,0)
	end
	if tGtTask:check_cur_task(716) == 1 then
		SetTask(3350,0)
	end
	if tGtTask:check_cur_task(673) == 1 then
		SetTask(3346,0)
	end
	if tGtTask:check_cur_task(674) == 1 then
		SetTask(3347,0)
	end
	if tGtTask:check_cur_task(871) == 1 then
		SetTask(3347,0)
	end
	if tGtTask:check_cur_task(1071) == 1 then
		SetTask(3347,0)
	end
	if tGtTask:check_cur_task(835) == 1 then
		SetTask(3350,0)
	end
	if tGtTask:check_cur_task(636) == 1 then
		SetTask(3347,0)
	end
	if tGtTask:check_cur_task(464) == 1 then
		SetTask(3378, 0);
		SetTask(3346, 0);
		SetTask(3347, 0);
	end
	if tGtTask:check_cur_task(465) == 1 then
		SetTask(3378, 0);
	end
	if tGtTask:check_cur_task(816) == 1 then
		SetTask(3346, 0);
	end
	if tGtTask:check_cur_task(745) == 1 then
		SetTask(3350, 0);
	end
	if tGtTask:check_cur_task(385) == 1 then
		SetTask(3346, 0);
	end
	if tGtTask:check_cur_task(806) == 1 then
		SetTask(3347, 0);
	end
	if tGtTask:check_cur_task(622) == 1 then
		SetTask(3349, 0);
		SetTask(2033, 0);
	end
end;
