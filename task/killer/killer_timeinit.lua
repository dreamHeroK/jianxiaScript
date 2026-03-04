-- ====================== 文件信息 ====================== 
-- 剑侠情缘onlineII 通缉任务信息初始化处理文件                  
-- Edited by starry night                                 
-- 2005/11/29 PM 17:44                                                                                
-- ======================================================
--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()
	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();

	--任务开启前初始化NO1
	if nHour == 0 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;

	--任务开启前初始化NO2
	if nHour == 2 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO3
	
	if nHour == 4 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO4
	if nHour == 6 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO5
	if nHour == 8 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO6
	if nHour == 10 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO7
	if nHour == 12 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO8
	if nHour == 14 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO9
	if nHour == 16 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO10
	if nHour == 18 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO11
	
	if nHour == 20 then
		
		print("杀手任务已更新!")
		
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
	
	--任务开启前初始化NO12
	if nHour == 22 then
		print("杀手任务已更新!")
		if SubWorldID2Idx(100) > 0 then
			SetMapTaskTemp(100,1,0);
		end;
		if SubWorldID2Idx(150) > 0 then
			SetMapTaskTemp(150,1,0);
		end;
		if SubWorldID2Idx(200) > 0 then
			SetMapTaskTemp(200,1,0);
		end;
		if SubWorldID2Idx(300) > 0 then
			SetMapTaskTemp(300,1,0);
		end;
		if SubWorldID2Idx(350) > 0 then
			SetMapTaskTemp(350,1,0);
		end;
	end;
end