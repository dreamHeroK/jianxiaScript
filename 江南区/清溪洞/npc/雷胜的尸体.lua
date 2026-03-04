--在扬州任务雷胜的尸体
--created by lizhi
--2005-8-24 10:34

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(754) == 1 then
		task_set_01();
	end;
end;

function task_set_01()
	if GetItemCount(2,0,103) < 1 then
		gf_AddItemEx({2,0,103,1}, "神秘地图左部", 1)
	end
end;