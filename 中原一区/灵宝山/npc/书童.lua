--书童默认对话
--created by lizhi
--2005-9-7 10:49
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if  tGtTask:check_cur_task(400) == 1 then
		if GetTask(3378) == 0 then
			Talk(1,"","<color=green>书童<color>：啊……");
		else
			Talk(2,"","<color=green>书童<color>：啊……","啊！书童这是怎么了?我应该赶紧回去告诉紫鹤真人！");
			SetTask(3378,1);
		end
		return
	elseif tGtTask:check_cur_task(403) == 1 then
		if GetItemCount(2,0,204) == 1  then
			Talk(3,"task_set_01","<color=green>书童<color>：……咕噜咕噜","你慢点喝，我先回去了……","嗯，下次找你们玩！");
		else
			Talk(2,"","<color=green>剑童<color>：谢谢你，我已经好多了，你先回吧，我跟师弟走的慢……","嗯，下次找你们玩！");
		end
		return
	else
		Talk(1,"","<color=green>书童<color>：……");
	end;
end;

function task_set_01()
	DelItem(2,0,204,1);
end;