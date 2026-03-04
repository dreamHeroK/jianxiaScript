--剑童默认对话
--created by lizhi
--2005-9-7 10:49

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(400) == 1 then
		if GetTask(3378) == 0 then
			Talk(1,"","<color=green>剑童<color>：快，帮我看看我师弟怎么了？!");
			SetTask(3378,1);
		else
			Talk(1,"","啊！书童这是怎么了?我应该赶紧回去告诉紫鹤真人！");
		end
		return
	elseif  tGtTask:check_cur_task(403) == 1 then
		if GetTask(3378) == 0 and GetItemCount(2,0,204) == 1  then
			Talk(2,"","<color=green>剑童<color>：你给我们带药过来了吗?哇，太好了！","快点给书童喝吧！");
			SetTask(3378,1);
		elseif GetTask(3378) == 1 then
			Talk(2,"","<color=green>剑童<color>：谢谢你，师弟已经好多了，你先回吧，我跟师弟走的慢……","嗯，下次找你们玩！");
		end
		return
	else
		Talk(1,"","<color=green>剑童<color>：师傅总说“剑的功夫在剑外”，那不在剑里到底在哪里啊？都把我搅糊涂了。");
	end;	
end;

