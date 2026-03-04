-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北区任务物品 破风槌 Script
-- By StarryNight
-- 2007/07/02 AM 11:14
-- ======================================================
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
FENGSHUIXUE_STATE 		= 2034;	--已经摧毁风水穴个数

function OnUse()
	local strTalk = {};
	local Mapid,nxpos,nypos = GetWorldPos();
	local nMapDataID = GetTask(FENGSHUIXUE_ID);
	--判断任务步骤
	if tGtTask:check_cur_task(703) == 1 and GetTask(3419) == 0 then
		if Mapid == 503 then
			if nMapDataID ~= 0 then
				nXworldpos,nYworldpos = Fengshuixue_MapData[nMapDataID][1],Fengshuixue_MapData[nMapDataID][2];
				--在目标位置范围内
				if nxpos >= (nXworldpos - 50) and nxpos <= (nXworldpos + 50) and nypos >= (nYworldpos - 50) and nypos <= (nYworldpos + 50) then
					SetTask(FENGSHUIXUE_STATE,GetTask(FENGSHUIXUE_STATE)+1);
					SetTask(FENGSHUIXUE_ID,0);
					if GetTask(FENGSHUIXUE_STATE) == 4 then
						strTalk = {"<color=green>玩家<color>：若按照柳前辈所说，4个风水穴已被破坏，是时候前往{一层入口}找到守墓人，唤醒并打败{镇墓灵兽}以便进入皇陵墓室二层了！"}
						SetTask(FENGSHUIXUE_STATE,0);
						SetTask(FENGSHUIXUE_ID,0);
						DelItem(2,0,713,1);--删掉一根断水杵
						SetTask(3419,1);
					else
						strTalk = {"成功破坏一个风水穴，目前已经破坏了{"..GetTask(FENGSHUIXUE_STATE).."个}风水穴，还有"..(4-GetTask(FENGSHUIXUE_STATE)).."个需要被找到并破坏方能成功破坏这一层的风水。"}
						DelItem(2,0,713,1);--删掉一根断水杵
					end
				else
					strTalk = {"<color=green>玩家<color>：没有任何效果，似乎不是风水穴所在，还是使用罗庚查探清楚为妙。"}
				end
			else
				strTalk = {"<color=green>玩家<color>：没有任何效果，似乎不是风水穴所在，还是使用罗庚查探清楚为妙。",}	
			end
		else
			strTalk = {"<color=green>玩家<color>：没有任何效果，似乎不是风水穴所在，还是使用罗庚查探清楚为妙。"}
		end		
	elseif tGtTask:check_cur_task(703) == 1 and GetTask(3419) == 1 then
		strTalk = {"<color=green>玩家<color>：若按照柳前辈所说，4个风水穴已被破坏，是时候前往{一层入口}找到守墓人，唤醒并打败{镇墓灵兽}以便进入皇陵墓室二层了！",}
	else
		strTalk = {"这东西可不能随便使用。",}
	end
	TalkEx("",strTalk);	
end
