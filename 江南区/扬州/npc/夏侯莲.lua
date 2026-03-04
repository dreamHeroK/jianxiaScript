--在扬州任务夏侯莲
--created by lizhi
--2005-8-24 10:34
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
 	if tGtTask:check_cur_task(696) == 1 and GetTask(3431) == 0 and GetItemCount(2,0,302) == 1 then
		task_next_01();
		return
	end
end;

function task_next_01()
	local szTalk = {
		"<color=green>夏侯莲<color>：呜呜呜，我肚子又开始好痛……",
		"<color=green>玩家<color>：莲儿，我又给你送药来了，你赶紧服下吧！",
		"<color=green>夏侯莲<color>：嘻嘻，真有效果，真的不太疼了！",
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	DelItem(2,0,302,1);
	SetTask(3431, 1);
end;