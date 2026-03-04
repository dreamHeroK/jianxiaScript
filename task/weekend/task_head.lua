--周末活动头文件
--created by lizhi
--2005-9-9 11:22

Include("\\script\\task\\weekend\\weekend_switch.lua");
TASK_IB_BOOK1 = 1737				-- 出东西概率的书
TASK_IB_BOOK2 = 1738				-- 保留军功到下周，记录有效起始时间和持续时间
TASK_WK_ISDISCONNECT = 1741;		--判断杀倭寇时是否掉线
TASK_WHICH_MAP = 1742;			--判断进入了那个地图
TASK_GQ_DELIVER = 1750;		 	--送货物的任务变量
TASK_GQ_KILLWK_START = 1751;		--记录是否可以接杀倭寇任务
TASK_GQ_KILLWK = 1752;		  	--杀倭寇任务，用于计数
TASK_GQ_KILLWK_FLAG = 1770;		--记录杀了倭寇完成是否领取奖励
TASK_GQ_KILLWK_TIMES = 1753;		--记录杀了几轮倭寇，杀一轮可以换一个boss召唤牌
TASK_NPC_INDEX = 1754;		  	--用于记录call出来的NPC index
TASK_POINT = 1755;			 	--用于记录玩家当前的"贡献度"
TASK_BOSS_INDEX = 1756;			--记录当前召唤的是第几个boss
TASK_POINT_TIME = 1757;			--记录最近一个获得"贡献度"的时间，数值是一年中的第几天
TASK_COOLDOWN = 1758;			--记录杀死倭寇以后要多少时间才能进入下一次
TASK_240_TIMES = 1759;			--记录一天之内换取奖励的次数
TASK_240_DAYS = 1760;				--记录上次换取奖励是哪天
TASK_POSITION = 1761;		   		--用于记录玩家坐标，用了1761,1762,1763
TASK_ITEM = 1771;					--用于记录给玩家的东西，从TASK_ITEM到TASK_ITEM + 6

--------------------------------------------------------
--记录送货的路线
PATH_BJ2QZ = 1;
PATH_XY2YZ = 2;
PATH_YZ2XY = 3;
--------------------------------------------------------

MAXNUM_KILLWK = 200;
POINT_PER_MATERIALS = 10;	--每上交一个材料积1分
POINT_PER_ONCE_DELIVER = 25;	--运送一次
--------------------------------------------------------

ErrorMsg = "对不起，你走错路了，帮大宋运送物资没有成功。"

--杀所有怪都随机掉落的材料列表
material_table = {
	{2,0,307,"军用矿石"},
};

--上交成品物资
supply_table = {
	{2,97,1,"军用物资"},
};

--成品系列道具列表
finished_product_table = {
	{2,97,1,"军用物资"},
};

boss_drop_table = {
	{2,0,321},	  --第一个掉落的八卦图和第二个一样
	{2,0,321},
	{2,0,322},
	{2,0,323},
	{2,0,324},
	{2,0,325},
	{2,0,326},
	{2,0,327},
	{2,0,328}
};

--军备表
armament_table = {
	{2,0,329},  --军用置物箱
	{2,0,330},  --军用医药箱
	{2,0,331},  --军用装备箱
	{2,0,332}   --军用藏书箱
};

life_item_table = {
	{"共工镐", 0, 200, 23},
	{"雷神刀", 0, 200, 24},
	{"炎帝锄", 0, 200, 25},
	{"盘古斧", 0, 200, 26},
	{"织女梭", 0, 200, 27},
	{"神农锄", 0, 200, 28}
};

--运送物资时必须经过的地图ID表
--汴京到泉州
--汴京府南，杏花村，扬州，龙泉村，泉州府北，泉州
--地图ID代表的table项里对应为记录走过地图的任务变量
path_table_index = {201, 202, 150, 106, 108, 100};
path_table = {1730, 1731, 1732, 1733, 1734, 1735};

--运送物资的襄阳到扬州
--灵宝山，少林，汴京府西，汴京，汴京府南，杏花村，扬州
path_table_2_index = {218, 204, 203, 200, 201, 202, 150};
path_table_2 = {1730, 1731, 1732, 1733, 1734, 1735, 1736};

--运送物资从扬州到襄阳
--杏花村，汴京府南，汴京，汴京府西，少林，灵宝山，襄阳
path_table_3_index = {202, 201, 200, 203, 204, 218, 350};
path_table_3 = {1730, 1731, 1732, 1733, 1734, 1735, 1736};

--进入地图的提示
map_message = {
	[1] = {},
	[2] = {},
	[3] = {}
}
map_message[1][201] = "已经在汴京府南，请将物资运送到杏花村！";
map_message[1][202] = "已经在杏花村，请将物资运送到扬州！";
map_message[1][150] = "已经在扬州，请将物资运送到龙泉村！";
map_message[1][106] = "已经在龙泉村，请将物资运送到泉州府北！";
map_message[1][108] = "已经在泉州府北，请将物资运送到泉州！";
map_message[1][100] = "已经在泉州，请将物资交给到泉州兵马指挥使！";

map_message[2][218] = "已经在灵宝山，请将物资运送到少林！";
map_message[2][204] = "已经在少林，请将物资运送到汴京府西！";
map_message[2][203] = "已经在汴京府西，请将物资运送到汴京！";
map_message[2][200] = "已经在汴京，请将物资运送到汴京府南！";
map_message[2][201] = "已经在汴京府南，请将物资运送到杏花村！";
map_message[2][202] = "已经在杏花村，请将物资运送到扬州！";
map_message[2][150] = "已经在扬州，请将物资交给到扬州兵马指挥使！";

map_message[3][202] = "已经在杏花村，请将物资运送到汴京府南！";
map_message[3][201] = "已经在汴京府南，请将物资运送到汴京！";
map_message[3][200] = "已经在汴京，请将物资运送到汴京府西！";
map_message[3][203] = "已经在汴京府西，请将物资运送到少林！";
map_message[3][204] = "已经在少林，请将物资运送到灵宝山！";
map_message[3][218] = "已经在灵宝山，请将物资运送到襄阳！";
map_message[3][350] = "已经在襄阳，请将物资交给到襄阳兵马指挥使！";

--需要创建的rect类型触发器列表
--表内的数据结构：前是配置文件里的ID，后是触发器的ID
rect_trigger_table = {
	{1400, 2001},
	{1401, 2002},
	{1402, 2003},
	{1403, 2004},
	{1404, 2005},
	{1405, 2006}
};

--需要创建的rect类型触发器列表
--表内的数据结构：前是配置文件里的ID，后是触发器的ID
rect_trigger_table_2 = {
	{1430, 2001},
	{1431, 2002},
	{1432, 2003},
	{1433, 2004},
	{1434, 2005},
	{1435, 2006},
	{1436, 2007}
};
--需要创建的rect类型触发器列表
--表内的数据结构：前是配置文件里的ID，后是触发器的ID
rect_trigger_table_3 = {
	{1430, 2001},
	{1431, 2002},
	{1432, 2003},
	{1433, 2004},
	{1434, 2005},
	{1435, 2006},
	{1437, 2007}
};

--wk
rect_wk_table = {
	["wk_20"] = {1420, 2003},
	["wk_30"] = {1421, 2003},
	["wk_40"] = {1422, 2003},
	["wk_41"] = {1425, 2003},
	["wk_50"] = {1423, 2003},
	["wk_51"] = {1427, 2003},
	["wk_60"] = {1424, 2003},
	["wk_61"] = {1428, 2003},
	["wk_70"] = {1429, 2003},
	["wk_80"] = {1438, 2003}
};

log_wk_table = {400, 2004};

--boss
rect_boss_table = {
	{1426, 2015}	--出地图
};

log_boss_table = {401, 2016};
time_boss_table = {1001, 2017}

--杀怪型触发器列表
kill_trigger_table = {
	["all"] = {1000, 2000}, --杀所有怪都掉落某种物品的触发器
	["wk_20"] = {1001, 2002},   --杀倭寇
	["wk_30"] = {1002, 2002},
	["wk_40"] = {1003, 2002},
	["wk_41"] = {1006, 2002},
	["wk_50"] = {1004, 2002},
	["wk_51"] = {1007, 2002},
	["wk_60"] = {1005, 2002},
	["wk_61"] = {1008, 2002},
	["wk_70"] = {1009, 2002},
	["wk_80"] = {1010, 2002}
};

--时间型触发器列表
time_trigger_table = {
	["wk"] = {1000, 2001}   --杀倭寇计时
};

--玩家传送位置
maps_table = {
	["wk_20"] = {951, 1341, 2849},	   --杀倭寇地图
	["wk_30"] = {952, 1341, 2849},
	["wk_40"] = {953, 1341, 2849},
	["wk_41"] = {956, 1341, 2849},
	["wk_50"] = {954, 1341, 2849},
	["wk_51"] = {957, 1341, 2849},
	["wk_60"] = {955, 1341, 2849},
	["wk_61"] = {958, 1341, 2849},
	["wk_70"] = {959, 1341, 2849},
	["wk_80"] = {960, 1341, 2849},
};

--记录没有boss刷新的地图
no_boss_map_list = 
{
	100, 150, 200, 300, 350, 400
};

--callboss的道具与boss对应表
boss_item_table = {
	[1] = {2,	0,	340},
	[2] = {2,	0,	341},
	[3] = {2,	0,	342},
	[4] = {2,	0,	343},
	[5] = {2,	0,	344},
	[6] = {2,	0,	345},
	[7] = {2,	0,	346},
	[8] = {2,	0,	347},
	[9] = {2,	0,	348}
};

--boss数据列表
boss_data_table = {
	[1] = {
		["name"] = "鹰戈部落武师",  --boss 名字
		["template"] = "鹰戈部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[2] = {
		["name"] = "德夷部落武师",  --boss 名字
		["template"] = "德夷部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[3] = {
		["name"] = "伊达部落武师",  --boss 名字
		["template"] = "伊达部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[4] = {
		["name"] = "敖狄部落武师",  --boss 名字
		["template"] = "敖狄部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[5] = {
		["name"] = "鄂罗部落武师",  --boss 名字
		["template"] = "鄂罗部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[6] = {
		["name"] = "法岚部落武师",  --boss 名字
		["template"] = "法岚部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[7] = {
		["name"] = "梅利部落武师",  --boss 名字
		["template"] = "梅利部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[8] = {
		["name"] = "伊本部落武师",  --boss 名字
		["template"] = "伊本部落武师",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	[9] = {
		["name"] = "西摩",		  --boss 名字
		["template"] = "西摩",  --boss 模板
		["script"] = "",			--boss 脚本
		["index"] = 0,			  --boss index
	},
	["MAXCOUNT"] = 9
};

--称号对应表
title_table = {
	{7200, 2, 10},		--抗倭总元帅
	{6000, 2, 9},		--抗倭大将军
	{4800, 2, 8},		--抗倭指挥使
	{3600, 2, 7},		--抗倭名将
	{2400, 2, 6},		--抗倭英雄
	{1200, 2, 5},		--抗倭精英
	{600 , 2, 4},		--抗倭勇士
	{400 , 2, 3},		--抗倭先锋
	{200 , 2, 2},		--抗倭女侠
	{200 , 2, 1}		--抗倭侠士
};

--返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23点59分
function CheckTime(day)

	--活动开关
	if WEEKEND_SWITCH == 0 then
		return 0
	end;

	if day ~= GetWeekDay() then
		return 0
	end;

	return 1
	
--	local nBegin;
--	local nEnd;
--	if day == 0 then	--周日是下午2：00 - 晚上10：00
--		nBegin = 14 * 60;
--		nEnd = 22 * 60;
--	else
--		nBegin = 19 * 60;	--其他日子是晚上7：00到晚上12：00
--		nEnd = 24 * 60;
--	end;
	
--	local nHour, nMin = GetLocalTime();
--	local nValue = nHour * 60 + nMin;
--	if nValue >= nBegin and nValue <= nEnd then
--		return 1
--	else
--		return 0
--	end;
end;

function InitBoss()
	--time trigger
	CreateTrigger(1, time_boss_table[1], time_boss_table[2]);
	ContinueTimer(GetTrigger(time_boss_table[2]));
	--初始化boss的rect触发器
	CreateTrigger(2, rect_boss_table[1][1], rect_boss_table[1][2]);
	--logout
	CreateTrigger(3, log_boss_table[1], log_boss_table[2]);
	SetLogType(1);
end;

function CreateBoss(bossIndex, nMapId, nX, nY) --CreateBoss，返回被创建出来的boss索引，失败返回0
	InitBoss();
	local npcIndex = CreateNpc(
						boss_data_table[bossIndex]["template"],
						boss_data_table[bossIndex]["name"],
						nMapId, nX, nY
					 );
	szNpcScript = boss_data_table[bossIndex]["script"];
	if szNpcScript ~= nil and szNpcScript ~= "" then
		SetNpcScript(npcIndex, szNpcScript);
	else
		SetNpcScript(npcIndex, "\\script\\task\\weekend\\boss_script.lua");
	end
	SetNpcLifeTime(npcIndex, 600);		  --10分钟
	SetTask(TASK_NPC_INDEX, npcIndex);	--记录召唤出来的boss索引
	SetTask(TASK_BOSS_INDEX, bossIndex);
	return npcIndex
end;


function CallBoss(bossIndex)
	
	if (CheckTime(0) == 0 and CheckTime(6) == 0) then	--不是星期天也不是星期六 
		Msg2Player("活动仅在周六和周日开放");
		return
	end;

	if GetFightState() == 0 then
		Msg2Player("外族武师不在这里，只有去野外才能找到他");
		return
	end;

	local nMapId, nX, nY = GetWorldPos();
	if nMapId >= 700 then
		Msg2Player("外族武师不会出现在这里");
		return
	end;
	for index, value in no_boss_map_list do
		if nMapId == value then
			Msg2Player("外族武师不会出现在这里");
			return
		end;
	end;
	
	--修复触发器丢失造成的不能召唤boss的情况
	if GetTask(TASK_NPC_INDEX) ~= 0 and GetTrigger(time_boss_table[2]) == 0 then
		SetTask(TASK_NPC_INDEX, 0);
	end;
   	--同一时间只能召唤一个
	if GetTask(TASK_NPC_INDEX) ~= 0 then
		Msg2Player("请先打败外族武师再说！");
		return
	end;
	
	local IsEixst = DelItem(boss_item_table[bossIndex][1], boss_item_table[bossIndex][2], boss_item_table[bossIndex][3], 1);
	if IsEixst ~= 1 then
		return
	end;
	CreateBoss(bossIndex, nMapId, nX, nY);
	--成功召唤boss后删除道具
	
	TaskTip("外族武师出现了，赶快击败他们！");
end;

--返回当前是距离2005年1月一号的第几天
function GetDay()
	local nYear = date("%Y");
	local nDay = tonumber(date("%j"));
	return nDay + (nYear - 2005) * 365
end;

function AddPlayerPoint(nPoint)	--给与player安邦功劳值
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	
	if (nTime - nLastTime) > 2 then		--不是这个星期变动的
		local nVv = GetTask(TASK_POINT)
		SetTask(TASK_POINT, 0)
		if GetTask(TASK_IB_BOOK2) == 1 then	-- 如果使用了委任书
			SetTask(TASK_POINT, nVv)
			SetTask(TASK_IB_BOOK2, 0)
		end
		
		if nPoint <= 0 then
			return
		end;
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_POINT, GetTask(TASK_POINT) + nPoint);
end;

function PayPlayerPoint(nPoint)	--消耗player安邦功劳值
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	
	if (nTime - nLastTime) > 2 then		--不是这个星期变动的
		local nVv = GetTask(TASK_POINT)
		SetTask(TASK_POINT, 0)
		if GetTask(TASK_IB_BOOK2) == 1 then	-- 如果使用了委任书
			SetTask(TASK_POINT, nVv)
			SetTask(TASK_IB_BOOK2, 0)
		end
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_POINT, GetTask(TASK_POINT) - nPoint);
end;

function AddPlayerTitle(nPoint)	--换取player抗倭称号
	--给与玩家称号
	n = GetTask(TASK_POINT);
	RemoveAllTitle();
	
	for index, value in title_table do
		if n >= value[1] then
			if value[1] == 200 and GetSex() == 1 then
				AddTitle(2, 1);
				SetCurTitle(2, 1);
			elseif value[1] == 200 and GetSex() == 2 then
				AddTitle(2, 2);
				SetCurTitle(2, 2);
			else
				AddTitle(value[2], value[3]);
				SetCurTitle(value[2], value[3]);
			end;
			break
		end;
	end;
end;

function RemoveAllTitle()
	for index, value in title_table do
		RemoveTitle(value[2], value[3]);
	end;
end;

function AddKillWkTimes(nTimes)
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	if (nTime - nLastTime) > 2 then		--不是这个星期变动的
		SetTask(TASK_GQ_KILLWK_TIMES, 0);
		if nTimes <= 0 then
			return
		end;
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_GQ_KILLWK_TIMES, GetTask(TASK_GQ_KILLWK_TIMES) + nTimes);
end;

function QueryTimes()
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	if (nTime - nLastTime) > 2 then		--不是这个星期变动的
		SetTask(TASK_GQ_KILLWK_TIMES, 0);
	end;
	return GetTask(TASK_GQ_KILLWK_TIMES);
end;

function QueryPoint()
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	local nVv = GetTask(TASK_POINT)
	if (nTime - nLastTime) > 2 then		--不是这个星期变动的
		nVv = 0
		if GetTask(TASK_IB_BOOK2) == 1 then
			nVv = GetTask(TASK_POINT)
		end
	end
	--给与玩家称号
	n = nVv
	RemoveAllTitle();
	
	for index, value in title_table do
		if n >= value[1] then
			if value[1] == 200 and GetSex() == 1 then
				AddTitle(2, 1);
				SetCurTitle(2, 1);
			elseif value[1] == 200 and GetSex() == 2 then
				AddTitle(2, 2);
				SetCurTitle(2, 2);
			else
				AddTitle(value[2], value[3]);
				SetCurTitle(value[2], value[3]);
			end;
			break
		end;
	end;
	
	return nVv
end;

function SetLaskEnterTime()
	local nDay = GetDay();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));

	local nCoolDown = nDay * 24 * 3600 + nHour * 3600 + nMin * 60 + nSec;
	SetTask(TASK_COOLDOWN, nCoolDown);
end;

function GetCooldownTime(nCDTime)
	local nTime = GetTask(TASK_COOLDOWN);
	local nDay = GetDay();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));

	return nCDTime - (nDay * 24 * 3600 + nHour * 3600 + nMin * 60 + nSec - nTime)
end;

function Add240Times()
	local nNow = GetDay();
	local nDay = GetTask(TASK_240_DAYS);
	if nNow ~= nDay then
		SetTask(TASK_240_TIMES, 0);		--不是同一天，回0
		SetTask(TASK_240_DAYS, nNow);
	end;
	if GetTask(TASK_240_TIMES) >= 3 then
		return 0
	else
		SetTask(TASK_240_TIMES, GetTask(TASK_240_TIMES) + 1);
		return 1
	end;
end;

function Check240Time()
	local nNow = GetDay();
	local nDay = GetTask(TASK_240_DAYS);
	if nNow ~= nDay then
		SetTask(TASK_240_TIMES, 0);		--不是同一天，回0
	end;
end;

function is_exist(t)
	local nExist = 0;
	for index, value in t do
		if GetItemCount(value[1], value[2], value[3]) >= 1 then
			nExist = 1;
			break
		end;
	end;
	return nExist
end;