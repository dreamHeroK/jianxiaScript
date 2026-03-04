--任务：画中画功能演示
--地点： 任务：
--策划：樊万松  2004.03.
--append by lizhi
--2005-8-8 11:20
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(385) == 1 and GetTask(3378) == 5 then
		task_Talk_01();
	else
		Talk(1,"","<color=yellow>寇准<color>：嘿嘿，别看我寇老西儿足不出汴京，可是天下的事情又有哪一件逃的了我的眼睛呢。")
	end;
end;

function task_Talk_01()
	local szTalk = {
		"<color=green>玩家<color>：百草翁让我给您带一份密信。",
		"<color=green>寇准<color>：谢谢<sex>，我先看看信。",
		"<color=green>寇准<color>：萧寒是天阴教卧底，天阴教有一个阴谋好像对公孙书不利，麻烦<sex>去襄阳告知公孙书一声。",
		"<color=green>玩家<color>：好的，我这就去",
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	DelItem(2, 0, 50,1);
	SetTask(3378, 10);
end;