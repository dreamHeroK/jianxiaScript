
Include("\\script\\lib\\globalfunctions.lua")

CF_SWITCH = 0 --夺旗活动开关，1为开，0为关

--活动时间
CF_START = {2021, 04, 12, 0, 0, 0};
CF_END  = {2021, 05, 08, 23, 59, 59};

--以下是全局变量
ID_FLAG_NUMBER_CD 			= 4570		--用来记录上交的旗子的数目（成都府南）
ID_FLAG_NUMBER_BJ 			= 4571		--用来记录上交的旗子的数目（汴京府南）
ID_FLAG_NUMBER_QZ 			= 4572		--用来记录上交的旗子的数目（泉州府北）

--以下是任务变量
TASK_FLAG_HANDUP 			= 2350		--用来记录是否上交过旗子

--以下是临时任务变量
TASK_FLAG_FOLLOW 			= 111		--用来记录是否带着旗子
MAP_ID 						= 112		--记录得到旗子时玩家的座标（M,X,Y）
MAP_X							= 113
MAP_Y							= 114

function cf_IsOpen()
	return gf_CheckDuration(CF_START, CF_END);
end

function cf_checktime()
	local nTime = tonumber(date("%H%M"));
	if (not ((2100 <= nTime  and nTime < 2159) or (2300 <= nTime and nTime < 2359))) then	--只在21点和23点内开放
		return 0;
	else
		return 1;
	end;
end;

function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function GetCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end

function GetCurMonth()
	nMonth = date("%m")
	return tonumber(nMonth)
end