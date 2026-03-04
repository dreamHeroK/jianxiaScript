--使用铲子之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {};
	if tGtTask:check_cur_task(383) == 1 then
		nGtask = 383
		tItem = {2,96,12,1}
		tPoints = {202, 1407, 2801}
		delItem = 0
		szTalk3 = {"位置不对哦！去杏花村的(176,175)处试试吧！"};
	elseif tGtTask:check_cur_task(880) == 1 then
		nGtask = 880
		tItem = {2,96,97,1}
		tPoints = {104, 1392, 3200}
		delItem = 0
		szTalk1 = {"你已经挖到了，不要以为我不知道。"};
		szTalk3 = {"你在这里试了试，结果什么都没有挖到，请按照藏宝图指示去东海海滨二的(174,200)寻找倭国秘宝！"};
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