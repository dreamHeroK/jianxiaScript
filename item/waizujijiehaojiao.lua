--使用外族集结号角之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为2分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(875) == 1 then
		nGtask = 875
		nGtype = {2,0,3,1}
		nTimeTaskID = 3346
		nNextTime = 2
		szTalk4 = {"请去王旗部落使用此道具。"};
		tNpc = {"外族最强武士", "外族最强武士", 1, "", 2, 5*60, {600}}
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