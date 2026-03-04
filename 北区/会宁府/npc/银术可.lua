Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_head.lua");
function main()
 local MainID = GetName()
	
    if tGtTask:check_cur_task(1322) == 1 and GetTask(1381) == 0 then 
	 local strMain = {
	"<color=green>银术可<color>：宗翰，这是上次抓来的辽国密探，严刑逼供，恐怕时日不多了。要不要使用点非常手段?",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>银术可<color>：哈哈哈，放心宗翰,他就算是死，也会从他嘴里撬出话来的。"
	}
	TalkEx("task_0",strMain);
	  return
	end
	
	    if tGtTask:check_cur_task(1338) == 1 and GetTask(1381) == 0 then 
	 local strMain = {
	"<color=green>银术可<color>：宗翰，这是上次抓来的辽国密探，严刑逼供，恐怕时日不多了。要不要使用点非常手段?",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>银术可<color>：哈哈哈，放心宗翰,他就算是死，也会从他嘴里撬出话来的。"
	}
	TalkEx("task_0",strMain);
	  return
	end
	
	
	
	 Talk(1,"","<color=green>银术可<color>：辽国欺我女真太甚，现在辽主荒淫，正是反击的好时候！")
	
	
end

function task_0()
		local nTalk_001 = GetTask(1381)
		local nTalk_002 = GetTask(1382)
		local nTalk_003 = GetTask(1383)
		if (nTalk_001 == 1) and (nTalk_002 == 1) and (nTalk_003 == 1) then
	       SetTask(4002,3);
        end
	SetTask(4002,1);	
	SetTask(1381,1);
end

