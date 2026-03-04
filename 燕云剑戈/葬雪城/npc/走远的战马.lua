Include("\\script\\task\\global_task\\gtask_head.lua");


function main()
		if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 0 then
		 Say("<color=green>走远的战马<color>：",
		   2,
		   "牵起马儿的缰绳/laqimaer",
		   "结束对话/no")
		end
		if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 1 then
		 Say("<color=green>走远的战马<color>：",
		   2,
		   "牵起马儿的缰绳/laqimaer",
		   "结束对话/no")
		end
		if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 2 then
		 Say("<color=green>走远的战马<color>：",
		   2,
		   "牵起马儿的缰绳/laqimaer",
		   "结束对话/no")
		end
		if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 3 then
		 Say("<color=green>走远的战马<color>：",
		   2,
		   "牵起马儿的缰绳/laqimaer",
		   "结束对话/no")
		end

		if tGtTask:check_cur_task(945) == 1 and GetTask(3510) == 4 then
		 Say("<color=green>走远的战马<color>：",
		   2,
		   "牵起马儿的缰绳/laqimaer",
		   "结束对话/no")
		end
	
end;
function no()
	
end
function laqimaer()
	local nFollowerName = GetNpcName(GetFollower());
	 if nFollowerName == "走远的战马" then
		Talk(1,"","您不是已经有了一匹战马了吗?先把战马牵回马厩再来找我吧");
		 return
	 else 
		SummonNpc("走远的战马","走远的战马")
		local npcID = GetTargetNpc();
	    SetNpcLifeTime(npcID,0);--使得尸体消失
	    SetNpcScript(npcID,"");--撤销该Npc所挂脚本
	   i=random(1,4)
	   if i==1 then
		 local npcIndexYg = CreateNpc("走远的战马", "走远的战马",5079,4047,10939);
         SetNpcScript(npcIndexYg, "\\script\\北区\\葬雪城\\npc\\走远的战马.lua");
	   end
	   if i==2 then
		 local npcIndexYg = CreateNpc("走远的战马", "走远的战马",5079,3989,10978);
         SetNpcScript(npcIndexYg, "\\script\\北区\\葬雪城\\npc\\走远的战马.lua");
	   end		
	   if i==3 then
		 local npcIndexYg = CreateNpc("走远的战马", "走远的战马",5079,4110,11037);
         SetNpcScript(npcIndexYg, "\\script\\北区\\葬雪城\\npc\\走远的战马.lua");
	   end			
	   if i==4 then
		 local npcIndexYg = CreateNpc("走远的战马", "走远的战马",5079,4186,10992);
         SetNpcScript(npcIndexYg, "\\script\\北区\\葬雪城\\npc\\走远的战马.lua");
	   end			
	
		
	 end	
	
	
end