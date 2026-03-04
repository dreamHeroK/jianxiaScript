--使用空瓶子之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"位置不对哦！去两水洞一层(211,185)处试试吧！"};
	if tGtTask:check_cur_task(772) == 1 then
		nGtask = 772
		tItem = {2,0,148,1}
		tPoints = {112, 1688, 2976}
		delItem = {2,0,147,1}
	end

	local nCheckTask = UseItemToItem(nItemIndex, nGtask, tItem, tPoints, delItem)
	if nCheckTask == 1 then
		TalkEx("", szTalk1);
	elseif nCheckTask == 2 then
		TalkEx("", szTalk2);
	elseif nCheckTask == 3 then
		TalkEx("", szTalk3);
	end
end;