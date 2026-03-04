--使用积满妖气的锁妖锺之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为2分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(566) == 1 then
		nGtask = 566
		nGtype = 1
		nTimeTaskID = 3346
		nNextTime = 2
		szTalk4 = {"速去封魔洞二层(207,198)使用此物！"};
		tNpc = {"幽冥鬼王", "幽冥鬼王", 1, "", 2, 5*60, {320,1658,3187}}
	elseif tGtTask:check_cur_task(709) == 1 then
		nGtask = 709
		nGtype = 1
		nTimeTaskID = 3347
		nNextTime = 2
		szTalk4 = {"速去清音洞二层使用此物！"};
		tNpc = {"蚩火大长老", "蚩火教长老", 1, "", 2, 5*60, {110}}
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