Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
 Say("<color=green>马厩看守<color>：",
		   1,
		  "我要交回走远的战马/jiaohuizhanma")
end;

function jiaohuizhanma()
   local nFollowerName = GetNpcName(GetFollower());
	if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 0 then

       if nFollowerName == "走远的战马" then
		   KillFollower();---删除后完成一次
		   SetTask(3510,1)
		   Talk(1,"","马厩看守:谢谢大侠帮我找回战马。");
		   return
		else
		   Talk(1,"","大侠身边没有走远的战马。");
	    end	

	end
	if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 1 then
       if nFollowerName == "走远的战马" then
		   KillFollower();---删除后完成一次
		   SetTask(3510,2)
		   Talk(1,"","马厩看守:谢谢大侠帮我找回战马。");
		   return
		else
		   Talk(1,"","大侠身边没有走远的战马。");
	    end
	end
	if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 2 then
       if nFollowerName == "走远的战马" then
		   KillFollower();---删除后完成一次
		   SetTask(3510,3)
		   Talk(1,"","马厩看守:谢谢大侠帮我找回战马。");
		   return
		else
		   Talk(1,"","大侠身边没有走远的战马。");
	    end
	end
	if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 3 then
       if nFollowerName == "走远的战马" then
		   KillFollower();---删除后完成一次
		   SetTask(3510,4)
		   Talk(1,"","马厩看守:谢谢大侠帮我找回战马。");
		   return
		else
		   Talk(1,"","大侠身边没有走远的战马。");
	    end
	end	
	if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 4 then
       if nFollowerName == "走远的战马" then
		   KillFollower();---删除后完成一次
		   SetTask(3510,5)
		   Talk(1,"","马厩看守:谢谢大侠帮我找回战马。");
		   return
		else
		   Talk(1,"","大侠身边没有走远的战马。");
	    end
	end	
end
