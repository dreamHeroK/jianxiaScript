--使用木笛之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为1分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(505) == 1 then
		nGtask = 505
		nGtype = {2,96,16,1}
		nTimeTaskID = 3348
		nNextTime = 1
		szTalk4 = {"请去灵宝山(221,225)使用此物。"};
		tNpc = {"白虎", "白虎", 1, "", 2, 5*60, {218, 1768, 3600}}
	if GetItemCount(2,96,16) < 1 then
		AddItem(2,96,16,1,4)
	end		
	elseif tGtTask:check_cur_task(429) == 1 then
		nGtask = 429
		nGtype = 1
		nTimeTaskID = 3349
		nNextTime = 1
		szTalk4 = {"请去阳中洞二层(238,196)使用此物。"};
		tNpc = {"木子铭", "木子铭", 1, "", 2, 5*60, {211,1907,3148}}
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
