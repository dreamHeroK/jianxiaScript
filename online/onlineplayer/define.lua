
DEBUG_VERSION 					= 0;				--1表示调试版本，0表示外网发布版本
IB_VERSION 						= 1				--1表示是免费区，0表示收费区

g_nLastCheckTime 					= 0;				-- 保存上次检测服务器人数的时间点
g_CHECKINTERVAL 				= 10*60;		--检测服务器人数的最小间隔

--活动时间
OL_START = {2021, 03, 06, 0, 0, 0};
OL_END  = {2021, 03, 31, 23, 59, 59};

TASK_ONLINE_BIT 					= 1313         		-- BIT:23--
