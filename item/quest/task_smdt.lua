--使用神秘地图之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"请去牌坊附近挖宝藏吧。"};
	if tGtTask:check_cur_task(756) == 1 then
		nGtask = 756
		tItem = {2,0,106,1, {"似乎发现了什么东西，这应该就是神秘宝物了吧。","你已经挖到了吧？！嘻嘻……"}}
		tPoints = {107, 1336, 3120}
		delItem = 0
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