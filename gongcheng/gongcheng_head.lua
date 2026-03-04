--create date:07-04-10
--author:yanjun
--describe:攻城战脚本头文件，定义相关的脚本常量
Include("\\script\\gongcheng\\position.lua");
DEBUG_VERSION = 1;	--调试版本？
FREE_VERSION = 0;	--免费版本？
LIMIT_IGNORE = 0;	--忽略一些限制

TRUE = 1;
FALSE = 0;
NONE_ID = -1;		--不是人
ALL_ID = 0;			--所有人
GONG_ID = 1;		--攻城方ID
SHOU_ID = 2;		--守城方ID
GONG_RFM_ID = 3;	--攻城方外援ID
SHOU_RFM_ID = 4;	--守城方外援ID
GONGSHOU_ID = GONG_ID+SHOU_ID;	--用来计算敌对阵营ID的
--=======以下是table常量================================================================
tCampNameP = 					--阵营名字（拼音），设置阵营的时候用的
{
	[GONG_ID] = "gongcheng",
	[SHOU_ID] = "shoucheng",
}
tCampNameZ =					--阵营名字（中文），显示对话的时候用的
{
	[GONG_ID] = "攻城方",
	[SHOU_ID] = "守城方",
}
tCityInfo = 			--攻城地图的名字
{
	[1] = {"泉州",100,886},
	[2] = {"成都",300,5100},
	[3] = {"襄阳",350,888},
}
tItemInfo = 			--攻城战物品相关信息
{
	[1] = {"攻城先锋令",2,1,1203},
	[2] = {"守卫令",2,1,1202},
	[3] = {"勇士令",2,1,1201},
	[4] = {"前线报告",2,1,1206},
	[5] = {"攻城战酬谢（胜",2,1,1208},
	[6] = {"攻城战酬谢（负）",2,1,1209},
}
tCityChannel = 			--攻城战城市频道
{
	[1] = {"泉州城",27},
	[2] = {"成都城",28},
	[3] = {"襄阳城",29},
}
tCampChannel = 			--攻城战阵营频道
{
	[1] = {"泉州城攻方",30},
	[2] = {"泉州城守方",31},
	[3] = {"成都城攻方",32},
	[4] = {"成都城守方",33},
	[5] = {"襄阳城攻方",34},
	[6] = {"襄阳城守方",35},
}
tDoorName = {"城东城门","城中城门","城西城门"};
--特效音乐结构
tWavFileName = 
{
	[1] = {"获得大旗.wav","失去大旗.wav"},
	[2] = {"获得小旗.wav","失去小旗.wav"},
	[3] = {"获得机关.wav","失去机关.wav"},
}
MUSIC_DEFAULT = 0;
MUSIC_JIANG = 1;
MUSIC_WEIJI = 2;
MUSIC_YOUSHI = 3;
--背景音乐
tMusicFileName = 
{
	[MUSIC_DEFAULT] = "攻城战_激昂.mp3",
	[MUSIC_JIANG] = "攻城战_激昂.mp3",
	[MUSIC_WEIJI] = "攻城战_优势.mp3",	--不是填反了，只是音乐文件名写错了
	[MUSIC_YOUSHI] = "攻城战_危机.mp3",
}
--攻城系统脚本全局变量设定==============================================================
RELAY_DATA_BATTLE = "gongcheng_result";	--共享数据库的字符串标识
RELAY_CALLBACK_SCRIPT = "";	--Relay共享数据库回调脚本路径

FLAG_COUNT_WIN = 99;			--攻方占领8面旗子就赢了
FLAG_COUNT_END_WIN = 6;		--在攻城战结束的时候攻方占领6面旗子就赢了
LEAST_STAY_DAY = 7;			--要求呆在帮会的最少天数
MAX_REGULAR_ARMY = 150;		--正规军最大人数
MAX_REINFORCEMENT = 150;	--最大外援数
MAX_TOTAL_PLAYER = 150;		--最大人数
INVINCIBILITY_TIME = 5;		--出后营无敌时间
--======================================================================================

--服务器全局变量========================================================================
--700~710
GLB_GONGCHENG_FORBIDEN = 700	--是否允许开启攻城战，1为禁止，0为允许
--固定任务变量==========================================================================
--450~499
TASK_LIZHI = 450;		--被李志用去了
TASK_AWARD_WIN = 451;	--记录当前玩家还没领取的攻城战酬谢大礼包数量
TASK_AWARD_LOST = 452;	--记录当前玩家还没领取的攻城战酬谢小礼包数量
--在加入新的战场时会被清除的任务变量====================================================
TNC_BEGIN = 490;
TNC_MUID = 490;			--记录玩家加入的战场所对应的MUID
TNC_KILL = 491;			--记录玩家单场PK人数
TNC_CAMP = 492;			--记录参加的阵营，此阵营非Mission阵营，指的是攻守阵营
TNC_END = 499;
--临时任务变量80~100====================================================================
TEMP_BEGIN = 80;
TEMP_CAMP = 81;				--记录玩家是攻城方还是守城方
TEMP_GURAD_ID = 82;			--记录玩家是否为城门完卫，值可以为1,2,3,分别对应三个（东南西）城门
TEMP_ARENA_FIGHTING = 83;	--是否正在单挑，1和2表示是（1表示攻方，2表示守方），0表示否。正在单挑的情况下，TEMP_GURAD_ID对应的变量的值不会为0
TEMP_FIGHT_STATE = 84;		--记录单挑状态，对应于单挑状态集
TEMP_CITY_INDEX = 85;		--记录所参加战役对应的城市索引
TEMP_AUDIENCE = 86;			--标识玩家是不是单挑观众，值可以为1,2,3,分别对应三个（东南西）城门
TEMP_CHALLENGER = 87;		--标识玩家在单挑的时候是不是挑战者
TEMP_REINFORCEMENT = 88;	--标识玩家是不是外援，值为1表示攻方外援，2表示守方外援
TEMP_LOCK = 89;				--玩家被锁定标识。为1时表示该玩家正在回应单挑申请
TEMP_FIGHT_TIMER_LOOP = 90;	--记录当前单挑计时器的循环次数
TEMP_END = 90;
--======================================================================================

--======================================================================================
--下面是与Mission密切相关的常量定义
--======================================================================================
MISSION_ID = 35;									--Mission的ID
TIMER_ID = 63;										--计时器的ID
TIMER_ID2 = 16;										--计时器2的ID引用的剑1的id号反正这个版本也没用
INTERVAL_TIME = 10*18;			                    --刷新间隔时间
LOG_ID = 207;										--登陆触发器ID
LOG_CUSTOM_ID = 3015;								--登陆触发器自定义编号
FIGHT_TIMER_ID = 4;									--单挑时间触发器ID
FIGHT_TRIGGER_ID = 3014;							--单挑时间触发器自定义编号
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填非0正整数==================================================
READY_TIME = 6;									--准备时间，6分钟   6
GONGMEN_TIME = 6;									--攻门时间，6分钟 6
GONGCHENG_TIME = 30;								--攻城时间，60分钟 30
ENDING_TIME = 2;									--等待结束时间，2分钟 2
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 3;							--计时器触发的时间间隔，单位分钟
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
GONGMEN_TIMER_INTERVAL = 3;					
GONGMEN_TIMER_COUNT = (GONGMEN_TIME/GONGMEN_TIMER_INTERVAL)-1;	
GONGCHENG_TIMER_INTERVAL = 3;					
GONGCHENG_TIMER_COUNT = (GONGCHENG_TIME/GONGCHENG_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================
MS_GONG_TONG_NAME = 1;								--记录攻城方帮会的名字			
MS_SHOU_TONG_NAME = 2;								--记录守城方帮会的名字
MS_CITY_NAME = 3;									--城市名字		
--MissionV变量=============================================================================
MV_MISSION_STATE		= 1;						--记录Mission状态
MV_TIMER_LOOP 			= 2;						--记录计时器的计数
MV_MISSION_UID 			= 3;						--记录Mission的唯一ID
MV_CUR_MUSIC_GONG		= 4;						--攻方当前背景音乐索引
MV_CUR_MUSIC_SHOU		= 5;						--守方当前背景音乐索引
MV_WAR_RESULT			= 6;						--记录战场的最终结果。0表示战场未开始或未结束，1表示攻方赢，2表示守方赢
MV_DEATH_GONG			= 7;						--攻方死亡人数
MV_DEATH_SHOU			= 8;						--守方死亡人数

MV_FLAG_OWN_COUNT 		= 11;						--记录攻方占领了多少面旗子
MV_DESTROY_EAST_DOOR	= 12;						--记录城门机关1是否被摧毁，相当于城门是否永久打开
MV_DESTROY_SOUTH_DOOR	= 13;						--记录城门机关2是否被摧毁
MV_DESTROY_WEST_DOOR	= 14;						--记录城门机关3是否被摧毁
MV_DESTROY_FLAG1		= 15;						--记录旗子1是否被摧毁
MV_DESTROY_FLAG2		= 16;						--记录旗子2是否被摧毁
MV_DESTROY_FLAG3		= 17;						--记录旗子3是否被摧毁
MV_TRAP_EAST_DOOR		= 18;						--东门TRAP点，1表示攻方可用，2表示守方可用，0表示攻守双方均可用，-1表示攻守双方均不可用
MV_TRAP_SOUTH_DOOR		= 19;						--南门TRAP点
MV_TRAP_WEST_DOOR		= 20;						--西门TRAP点
MV_GRAVEYARD_A1 		= 21;						--记录10个墓地的状态
MV_GRAVEYARD_A2			= 22;						--1表示攻方可用
MV_GRAVEYARD_B1			= 23;						--2表示守方可用
MV_GRAVEYARD_B2			= 24;						--0表示攻守双方均可用
MV_GRAVEYARD_C1			= 25;						-- -1表示攻守双方均不可用
MV_GRAVEYARD_C2			= 26;
MV_GRAVEYARD_11			= 27;
MV_GRAVEYARD_12			= 28;
MV_GRAVEYARD_21			= 29;
MV_GRAVEYARD_22 		= 30;
MV_EAST_DOOR_DRAW		= 31;						--记录东门守卫单挑连续出现平手的次数
MV_SOUTH_DOOR_DRAW		= 32;						--记录南门守卫单挑连续出现平手的次数
MV_WEST_DOOR_DRAW		= 33;						--记录西门守卫单挑连续出现平手的次数
MV_GPIDX_EAST_DOOR		= 34;						--攻方东门守卫者索引，由这个索引可以计算出其它MissionV的变量号，公式MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1
MV_SPIDX_EAST_DOOR		= 35;						--守方东门守卫者索引
MV_GPIDX_SOUTH_DOOR		= 36;						--攻方南门守卫者索引
MV_SPIDX_SOUTH_DOOR		= 37;						--守方南门守卫者索引
MV_GPIDX_WEST_DOOR		= 38;						--攻方西门守卫者索引
MV_SPIDX_WEST_DOOR		= 39;						--守方西门守卫者索引
MV_GET_GONG_TOKEN 		= 40;						--攻方是否领取过攻城令			
MV_GET_SHOU_TOKEN		= 41;						--守方是否领取过守城令
MV_EAST_JIGUAN_INDEX	= 42;						--东门机关NPC索引
MV_SOUTH_JIGUAN_INDEX	= 43;						--南门机关NPC索引
MV_WEST_JIGUAN_INDEX	= 44;						--西门机关NPC索引
MV_REVIVI_FLAG1_OWNER	= 45;						--用来记录7个可重生旗子被占领的情况
MV_REVIVI_FLAG2_OWNER	= 46;						--1表示攻方占领，2表示守方占领
MV_REVIVI_FLAG3_OWNER	= 47;
MV_REVIVI_FLAG4_OWNER	= 48;
MV_REVIVI_FLAG5_OWNER	= 49;
MV_REVIVI_FLAG6_OWNER	= 50;
MV_REVIVI_FLAG7_OWNER	= 51;
MV_NORMAL_FLAG1_OWNER	= 52;						--用来记录3个不可重生旗子被占领的情况
MV_NORMAL_FLAG2_OWNER	= 53;                       --改成攻城方公共积分
MV_NORMAL_FLAG3_OWNER	= 54;                       --改成守城方公共积分
--Mission状态集============================================================================
MS_STATE_IDEL 		= 0;							--场地空闲
MS_STATE_READY 		= 1;							--准备阶段
MS_STATE_GONGMEN 	= 2;							--攻门阶段
MS_STATE_GONGCHENG 	= 3;							--攻城阶段
MS_STATE_ENDING 	= 4;							--等待结束阶段
--单挑状态集===============================================================================
ROOM_STATE_IDLE = 0;								--单挑场地状态：空闲
ROOM_STATE_READY = 1;								--单挑场地状态：准备
ROOM_STATE_FIGHT = 2;								--单挑场地状态：战斗
ROOM_STATE_END = 3;									--单挑场地状态：等待结束
--=========================================================================================