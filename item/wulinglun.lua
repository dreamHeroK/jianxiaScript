--使用五灵轮之后执行的脚本
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	local szTalk1 = {"恭喜你已经搞定啦，快去交任务吧。"};
	local szTalk2 = {"很奇怪，你没有接到任务，怎么会有这个道具？"};
	local szTalk3 = {"还是过一会儿再使用吧。(使用间隔为2分钟)"};
	local szTalk4 = {};
	if tGtTask:check_cur_task(544) == 1 then
		nGtask = 544
		nGtype = {2,96,47,1}
		nTimeTaskID = 3347
		nNextTime = 2
		szTalk4 = {"速去竹丝洞(174,195)附近使用五灵轮。"};
		tNpc = {"木灵", "木灵", 1, "", 2, 5*60, {317,1392,3120}}
	if GetItemCount(2,96,47) < 1 then
		AddItem(2,96,47,1,4)
	end				
	elseif tGtTask:check_cur_task(546) == 1 then
		nGtask = 546
		nGtype =  {2,96,48,1}
		nTimeTaskID = 3348
		nNextTime = 2
		szTalk4 = {"速去冰心洞(216,187)附近使用五灵轮。"};
		tNpc = {"水灵", "水灵", 1, "", 2, 5*60, {315,1730,2991}}
	if GetItemCount(2,96,48) < 1 then
		AddItem(2,96,48,1,4)
	end				
	elseif tGtTask:check_cur_task(548) == 1 then
		nGtask = 548
		nGtype =  {2,96,50,1}
		nTimeTaskID = 3349
		nNextTime = 2
		szTalk4 = {"速去金光洞(204,217)附近使用五灵轮。"};
		tNpc = {"金灵", "金灵", 1, "", 2, 5*60, {321,1639,3476}}
	if GetItemCount(2,96,50) < 1 then
		AddItem(2,96,50,1,4)
	end				
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