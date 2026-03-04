Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_head.lua");
function main()
 local MainID = GetName()
	
    if tGtTask:check_cur_task(1322) == 1 and GetTask(1382) == 0 then 
	 local strMain = {
	"<color=green>阿离<color>：呼噜…………",
	"<color=green>阿离<color>：谁啊…宗翰将军!",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>阿离<color>：将军，将军!我，我只是一时，啊，不不不，下次一定不会再犯了。",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>阿离<color>：我明白的，将军，论军法渎职者应处四十军棍。我自去军法处领罪。",
	"<color=green>"..MainID.."<color>:…………(不料女真大营竟如此军纪严明)"
	}
	TalkEx("task_0",strMain);
	  return
	end
	
	    if tGtTask:check_cur_task(1338) == 1 and GetTask(1382) == 0 then 
	 local strMain = {
	"<color=green>阿离<color>：呼噜…………",
	"<color=green>阿离<color>：谁啊…宗翰将军!",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>阿离<color>：将军，将军!我，我只是一时，啊，不不不，下次一定不会再犯了。",
	"<color=green>"..MainID.."<color>:…………",
	"<color=green>阿离<color>：我明白的，将军，论军法渎职者应处四十军棍。我自去军法处领罪。",
	"<color=green>"..MainID.."<color>:…………(不料女真大营竟如此军纪严明)"
	}
	TalkEx("task_0",strMain);
	  return
	end
	
	
	
   Talk(1,"","<color=green>阿离<color>：呼……噜…………")
end;
function task_0()
			local nTalk_001 = GetTask(1381)
		local nTalk_002 = GetTask(1382)
		local nTalk_003 = GetTask(1383)
		if (nTalk_001 == 1) and (nTalk_002 == 1) and (nTalk_003 == 1) then
	       SetTask(4002,3);
        end
	SetTask(4002,2);	
	SetTask(1382,1);
end
