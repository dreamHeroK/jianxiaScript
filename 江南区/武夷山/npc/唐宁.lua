--在扬州任务唐宁
--created by lizhi
--2005-8-24 10:34
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(757) == 1 and GetTask(3431) == 0 and GetItemCount(2,0,106) == 1 then
		task_Talk_01();
		return
	else
		Talk(1,"","<color=green>唐宁<color>：你有什么事情吗？")
	end;
end;

function task_Talk_01()
	local szTalk = {
		"<color=green>唐宁<color>：是夏候琴要你把这个<color=yellow>神秘宝物<color>交给我的吧，我等你很久了。"
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	DelItem(2,0,106,1);
	SetTask(3431, 1);
end;