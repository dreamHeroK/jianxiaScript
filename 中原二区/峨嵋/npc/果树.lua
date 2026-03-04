
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(11) == 1  then
		local nCurCount = GetItemCount(2,95,640)
		if nCurCount < 7 then
			if GetTask(3350) == 0 or GetTime() >= GetTask(3350) then
				local nCount = 2
				local nRand = 0;
				nRand = random(1,100);
				if nRand <= 30 then
					nCount = nCount - 1;
				elseif nRand <= 60 then
					nCount = nCount + 1;
				end;
				gf_AddItemEx({2,95,640,nCount}, "鲜果")
				SetTask(3350, GetTime()+5)	-- 5秒后可以再次刷新
			else
				Talk(1,"","果实尚未成熟，请稍等5秒钟");
			end
		elseif nCurCount >= 7 and nCurCount < 10 then
			gf_AddItemEx({2,95,640,10 - nCurCount}, "鲜果")
		else
			Talk(1,"","恭喜你已经搞定啦，快去交任务吧。");
		end
	end
end;