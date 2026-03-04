--百草翁的默认对话
--created by lizhi 
--2005-8-29 11:22

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(385) == 1 and GetTask(3378) == 1 then
		task_Talk_01();
	elseif tGtTask:check_cur_task(385) == 1 and GetTask(3378) == 5 then
		task_Talk_02();
	end;
end;


function task_Talk_01()
	local szTalk = {
		"<color=green>百草翁<color>：谢谢<sex>，朝廷一直想逮捕他，他绑架我需要我去医治他们的天阴主教！",
		"<color=green>玩家<color>：先生客气了，您的女儿帮了我很大的忙！",
		"<color=green>百草翁<color>：哈！哈！哈！她已经已经是一位很好的接班人！我这有一封萧寒的密信，麻烦你送到汴京的寇准哪里。",
		"<color=green>玩家<color>：好的，先生再见……"
	};
	TalkEx("task_set_01", szTalk);
end;

function task_Talk_02()
	local szTalk = {
		"<color=green>百草翁<color>：快去把萧寒的密信，送到汴京的寇准那里。",
	};
	TalkEx("task_set_02", szTalk);
end;

function task_set_01()
	if GetItemCount(2, 0, 50) < 1 then
		gf_AddItemEx({2, 0, 50,1}, "萧寒的密信", 1)
	end
	SetTask(3378, 5);
	local nIndexNpc = GetTargetNpc();
	SetNpcLifeTime(nIndexNpc,2*60)	--2分钟后消失

end;

function task_set_02()
	local nIndexNpc = GetTargetNpc();
	SetNpcLifeTime(nIndexNpc,1*60)	--1分钟后消失
end;
