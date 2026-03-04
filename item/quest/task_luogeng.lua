-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 西北区任务物品 罗庚 Script
-- By StarryNight
-- 2007/07/02 AM 11:11
-- ==================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--世界坐标X，世界坐标Y，小地图坐标X，小地图坐标Y
Fengshuixue_MapData = {
	[1] = {1340,2803,167,175},
	[2] = {1383,2724,172,170},
	[3] = {1461,2772,182,173},
	[4] = {1583,2841,197,177},
	[5] = {1567,2892,195,180},
	[6] = {1575,2945,196,184},
	[7] = {1560,3024,195,189},
	[8] = {1540,3100,192,193},
	[9] = {1588,3146,198,196},
	[10]= {1511,3118,188,194},
	[11]= {1530,3190,191,199},
	[12]= {1492,3179,186,198},
	[13]= {1451,3200,181,200},
	[14]= {1428,3178,178,198},
	[15]= {1394,3206,174,200},
	[16]= {1300,3129,162,195},
	[17]= {1303,3003,162,187},
	[18]= {1331,2834,166,177},
	[19]= {1333,2762,166,172},
	[20]= {1331,2833,166,177},
}

FENGSHUIXUE_ID 			= 2033;	--当前风水穴index

function OnUse()
	local nMapDataID = 0;
	local nXpos,nYpos = 0,0;
	local strTalk = {};
	local Mapid,nxpos,nypos = GetWorldPos();

	--判断任务步骤
	if tGtTask:check_cur_task(703) == 1 and GetTask(3419) == 0 then
		if Mapid == 503 then
			--已经破坏了一个风水穴或还没获得风水穴坐标
			if GetTask(FENGSHUIXUE_ID) == 0 then
				nMapDataID = random(1,getn(Fengshuixue_MapData));
				SetTask(FENGSHUIXUE_ID,nMapDataID);
			end
			nMapDataID = GetTask(FENGSHUIXUE_ID);
			nXpos = Fengshuixue_MapData[nMapDataID][3];
			nYpos = Fengshuixue_MapData[nMapDataID][4];	
			strTalk = {"<color=green>玩家<color>：{罗庚}上显示，位于此地上的{"..nXpos.."}，{"..nYpos.."}处有异常，应该就是风水穴所在了。"}	
		else	
			strTalk = {"<color=green>玩家<color>：{罗庚}上显示，只有在{秦始皇陵}才能找到风水穴所在了。"}
		end
	elseif tGtTask:check_cur_task(703) == 1 and GetTask(3419) == 1 then
		strTalk = {"<color=green>玩家<color>：若按照柳前辈所说，4个风水穴已被破坏，是时候前往{一层入口}找到守墓人，唤醒并打败{镇墓灵兽}以便进入皇陵墓室二层了！",}
	else
		strTalk = {"这东西可不能随便使用。",}	
	end
	
	TalkEx("",strTalk);
	
end