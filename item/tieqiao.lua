-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 唐门门派任务铁锹使用脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03
-- ======================================================
Include("\\script\\task\\global_task\\gtask_head.lua");

function OnUse()
	local nMapId, nX, nY = GetWorldPos();
	local flagEast = 0;
	if tGtTask:check_cur_task(332) == 1 and GetItemCount(2,0,6) == 1 then
		nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, 305,1570,2996);   --到唐门山脚的距离	
		if nDistEast >= 0 and nDistEast <= 20 then
			flagEast = 1;
		end;

		if flagEast ~= 1 then
			Talk(1,"","位置不对哦！去唐门山脚的(196,187)处试试吧！");
			return
		end;
		
		if flagEast == 1 then
			if GetTask(3378) ~= 1 then
				TaskTip("成功挖了一个陷阱。");
				SetTask(3378,1);
			else
				Talk(1,"","恭喜你已经搞定啦，快去交任务吧。");
			end
		end;
	else
		Talk(1,"","很奇怪，你没有接到任务，怎么会有这个道具？");
	end;
end;