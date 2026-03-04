--使用金砖之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为2分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(425) == 1 then
		nGtask = 425
		nGtype = {2,96,19,1}
		nTimeTaskID = 3348
		nNextTime = 2
		szTalk4 = {"请去阳中洞一层(191,195)使用金砖。"};
		tNpc = {"木子钢", "木子钢", 1, "", 2, 5*60, {210,1532,3113}}
	elseif tGtTask:check_cur_task(433) == 1 then
		nGtask = 433
		nGtype = 1
		nTimeTaskID = 3349
		nNextTime = 2
		szTalk4 = {"请去阳中洞三层(196,197)使用金砖。"};
		tNpc = {"木子钢", "木子钢", 1, "", 2, 5*60, {212,1558,3136}}
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