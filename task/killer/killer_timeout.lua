-- ====================== 文件信息 ======================                                        
-- 剑侠情缘onlineII 通缉任务通告信息发布文件                  
-- Edited by starry night                                 
-- 2005/11/28 PM 15:17                                    
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()
	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	if nWeekDay == 1 or nWeekDay == 2 or nWeekDay == 3 or nWeekDay == 4 or nWeekDay == 5 or nWeekDay == 6 or nWeekDay == 0 then
		if nHour == 10 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");
		elseif nHour == 12 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");
		elseif nHour == 14 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");	
		elseif nHour == 16 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");	
		elseif nHour == 18 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");	
		elseif nHour == 20 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");	
		elseif nHour == 22 then
			AddLocalNews("杀手任务已更新，请各位去接杀手任务吧！");
			Msg2SubWorld("杀手任务已更新，请各位去接杀手任务吧！");			
		else
			AddLocalNews("杀手任务随时都可以做,各位请自便");
			Msg2SubWorld("杀手任务随时都可以做,各位请自便");
		end;
	end;
end;
