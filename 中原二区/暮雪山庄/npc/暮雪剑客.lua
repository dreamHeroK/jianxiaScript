--和暮雪山庄家丁对话脚本
--created by lizhi
--2005-8-22 10:12
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");


function OnDeath(npcIdx)
	if GetTask(3378) == 0 then
		if random(100) <= 30 then
			gt_trigger_callback();
			local szTalk = {
				"……大侠饶命啊，是{暮}霭沉沉，{雪}夜昏昏，{山}麓重重，{庄}舍深深。（终于得到了，去交任务吧。)",
			};
			TalkEx("get_talk_set_409", szTalk);
			return
		else
			local szTalk = {
				"……大侠饶命啊，您说的那个我们真不知道。（还是继续打杀吧……）",
			};
			TalkEx("", szTalk);
			return
		end
	end
end

