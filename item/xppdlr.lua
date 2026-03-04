--使用香喷喷的鹿肉之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为2分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(674) == 1 then
		nGtask = 674
		nGtype = {2,96,16,1}
		nTimeTaskID = 3347
		nNextTime = 2
		szTalk4 = {"请去龙泉村(192,180)使用此道具。"};
		tNpc = {"白虎", "白虎", 1, "", 2, 5*60, {106, 1536, 2880}}
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