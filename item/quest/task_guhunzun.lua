--使用孤魂樽之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为1分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(636) == 1 then
		nGtask = 636
		nGtype = {2,0,717,1}
		nTimeTaskID = 3347
		nNextTime = 1
		szTalk4 = {"请去鬼门深处使用此物。"};
		tNpc = {"怨魂之王", "怨魂之王", 1, "", 2, 5*60, {328}}
		-- 不要在此处给物品(2,0,717)，否则 CallSpclNpc 会认为任务已完成直接 return 1，不会召唤
	end

	local nCheckTask = UseItemToCallNpc(nItemIndex, nGtask, nGtype, nTimeTaskID, tNpc, nNextTime)
	if nCheckTask == 1 then
		TalkEx("", szTalk1);
	elseif nCheckTask == 2 then
		TalkEx("", szTalk2);
	elseif nCheckTask == 3 then
		TalkEx("", szTalk3);
	elseif nCheckTask == 4 then
		TalkEx("", szTalk4);
	end
end;