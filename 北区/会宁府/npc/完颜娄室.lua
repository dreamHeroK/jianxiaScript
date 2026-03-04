Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()
	 local MainID = GetName()
	if tGtTask:check_cur_task(1322) == 1 and GetTask(1383) == 0 then 
   local strMain = {
	"<color=green>完颜娄室<color>：将军，操练已毕。",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>完颜娄室<color>：…………",
	"<color=green>完颜娄室<color>：将军?",
	"<color=green>"..MainID.."<color>:…………(完颜娄室看来也是个沉默寡言的人，我还是离开吧。)",
	"<color=green>完颜娄室<color>：恭送将军。"
	}
	TalkEx("task_0",strMain);
	
	  return
	end
	if tGtTask:check_cur_task(1338) == 1 and GetTask(1383) == 0 then 
	   local strMain = {
	"<color=green>完颜娄室<color>：将军，操练已毕。",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>完颜娄室<color>：…………",
	"<color=green>完颜娄室<color>：将军?",
	"<color=green>"..MainID.."<color>:…………(完颜娄室看来也是个沉默寡言的人，我还是离开吧。)",
	"<color=green>完颜娄室<color>：恭送将军。"
	}
	TalkEx("task_0",strMain);
	
	
	  return
	end
	
	
	
   Talk(1,"","<color=green>完颜娄室<color>：………………")
end;


function task_0()
		local nTalk_001 = GetTask(1381)
		local nTalk_002 = GetTask(1382)
		local nTalk_003 = GetTask(1383)
		if (nTalk_001 == 1) and (nTalk_002 == 1) and (nTalk_003 == 1) then
	       SetTask(4002,3);
        end
	SetTask(4002,3);	
	SetTask(1383,1);
end