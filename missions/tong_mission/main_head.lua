--create date:2007-07-04
--author:yanjun
--describe:帮会关卡头文件
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\fields.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
Include("\\script\\missions\\tong_mission\\stage\\npc_info.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage1.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage2.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage3.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage4.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage5.lua");
Include("\\script\\missions\\tong_mission\\stage\\stage6.lua");
DEBUG_VERSION = 0;		--调试版本？
LIMIT_VERSION = 1;		--限制版本？
--==========以下是Mission相关的常量定义====================================================
MISSION_ID = 36;									--Mission的ID
ALL_CAMP = 0;
TIMER_ID = 64;										--计时器的ID
ASSI_TIMER_ID = 65;									--辅助计时器ID
LOG_ID = 206;										--登陆触发器ID
LOG_CUSTOM_ID = 262;								--登陆触发器自定义编号
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填整数，单位为秒=============================================
READY_TIME = 2*60;									--准备时间
STARTED_TIME = 0;									--进行时间时间，填０表示无限时
ENDING_TIME = 1*60;									--等待结束时间
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 1*60;							--计时器触发的时间间隔，单位秒
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1*60;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================
MS_TONG_NAME = 1;									--记录帮会的名字
--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
MV_WEEK = 4											--记录开始关卡时所处的week
MV_KILL_SUB_NPC = 5;								--记录杀死替补区NPC的数量
MV_TIMER_TRIGGER_STATE = 6;							--记录关卡自定义的时间触发器的状态，1表示运行中，0表示停止
MV_GET_BOX = 7;										--记录是否拾取了宝箱
MV_APPLY_TIME = 8;									--记录上次玩家提出申请的时间
MV_ENTER_TIME = 9;									--记录上次玩家进入内堂的时间
MV_CHECK_POINT = 10;								--检查点
MV_STAGE = 11;										--记录当前处于第几关
MV_STAGE_OVER = 12;									--标记当前是否过关
MV_STAGE_START_TIME = 13;							--记录关卡开始时间
MV_BOSS1 = 14;										--BOSS1的索引
MV_BOSS2 = 15;										--BOSS2的索引
MV_NPC_COUNT = 16;									--记录NPC的数量
MV_FAC_NPC_COUNT = 17;								--记录门派类NPC的数量
MV_BOSS_COUNT = 18;									--记录BOSS的数量
MV_STAGE_STARTED = 19;								--标记是否已正式开始关卡(这个变量有点多余，暂时没起作用)
MV_CITY_MAP_ID = 20;								--记录这个关卡是在哪个城市的

MV_VALUE1 	= 21;									--STAGE的共用变量
MV_VALUE2 	= 22;									--不同关卡有不同的意义
MV_VALUE3 	= 23;									--使用时请在脚本中标明该值的含义
MV_VALUE4 	= 24;
MV_VALUE5 	= 25;
MV_VALUE6 	= 26;
MV_VALUE7 	= 27;
MV_VALUE8 	= 28;
MV_VALUE9 	= 29;
MV_VALUE10 	= 30;

--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开始阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--=========================================================================================
--===========以下是关卡设置常量============================================================
MAX_STAGE = 6;					--最大关卡数
MAX_AREA = 2;					--每台服务器的区数量
MAX_FIELD = 3;					--每个区的场地数量
MAX_NORMAL_PLAYER_COUNT = 16;	--最大正选玩家数
MAX_PLAYER_COUNT = 60;			--最大玩家数，这个数减去正选玩家数就是替补玩家数
MAX_ROUTE_PLAYER_COUNT = 3;		--内堂最大相同职业玩家数量
MIN_ENTER_INTERVAL = 2*60;		--最小进入时间间隔
MIN_APPLY_INTERVAL = 60;		--个人最小申请时间间隔
MIN_MS_APPLY_INTERVAL = 30;		--Mission的最小申请时间间隔
MIN_TEAM_MEMBER = 8;			--最小队伍人数
MIN_LEVEL = 75;					--最小要求等级
MIN_JOIN_TONG_DAY = 0;			--最小入帮时间
MIN_PLAYER_COUNT = 8;			--最少玩家数
MIN_KILL_SUB_NPC_COUNT = 300;	--获得外堂奖励要杀的最少外堂小怪数量
KILL_SUB_NPC_POINT = 100;		--杀外堂小怪所获的额外积分
SUB_NPC_COUNT = 20;				--外堂小怪刷新数量
--=========================================================================================

--Relay共享数据key=========================================================================
KEY_WEEK = "tong_mission_key_week";	--保存帮会在哪一周通关了（年份与周数组成的数据）
KEY_STAGE = "tong_mission_key_stage";	--保存帮会当前关卡
KEY_ATTEND = "tong_mission_key_attend"	--参与闯关的年份与周数
--===================以下是任务变量(650-660)========================================================
TSK_BEGIN = 650;
TSK_WEEK = 650;				--记录上次闯关是今年的第几周
TSK_APPLY_TIME = 651;		--记录上次申请进入内堂的时间
TSK_POINT = 652;			--记录玩家个人关卡积分
TSK_ATTEND_STAGE_1 = 653;	--记录每周通过第1关的次数
TSK_ATTEND_STAGE_2 = 654;	--记录每周通过第2关的次数
TSK_ATTEND_STAGE_3 = 655;	--记录每周通过第3关的次数
TSK_ATTEND_STAGE_4 = 656;	--记录每周通过第4关的次数
TSK_ATTEND_STAGE_5 = 657;	--记录每周通过第5关的次数
TSK_ATTEND_STAGE_6 = 658;	--记录每周通过第6关的次数
TSK_END = 660;
--===================以下是临时任务变量(61-69)====================================================
TEMP_BEGIN = 61;
TSK_TEMP_STATUS = 61;								--标记玩家身份，0为替补，1为正选
TSK_TEMP_AREA_IDX = 62;								--记录区域索引
TSK_TEMP_FIELD_IDX = 63;							--记录场地索引
TSK_TEMP_MAP_ID = 64;								--记录进入时的地图ID
TSK_TEMP_HELPER = 65;								--标记是否为外援
TEMP_END = 69;
--=========================================================================================
TONG_MISSIONEX = "tong_mission";	--missionEx的名字
--=========================================================================================
GLB_CLEAR_FIELD = 81;				--服务器变量，记录是否请过场地
--=========================================================================================
TB_BOSS_INFO = 
{
	[0] = "上古神兽的瘴气聚集形成的人的假象，必须要对应的门派才能将其真正消灭，否则将会重生。当影子护卫聚集过多时，将使人失去意识，导致闯关失败。",
	[1] = "\nBoss特殊属性和技能：大范围流血\n特殊小怪：璃府女将（使用小范围蛊毒技能），每隔一段时间将现身辅助璃烟。\n影子护卫：有",
	[2] = "\nBoss特殊属性和技能：重生（整个关卡中伯乔会使用嫁衣神功使自己复活，总共复活3次，如果在限定时间内将其击败第4次死亡后将不再重生，否则挑战失败）\n特殊小怪：禁卫兵（会使用强力攻击技能，需要快速消灭）\n影子护卫：有",
	[3] = "\nBoss特殊属性和技能：\n左右开弓（每隔一段时间发动，使所有玩家失去50%生命，需要联合发动，当两个boss距离大于30时会取消发动。）\n斗转星移（每隔一段时间发动，使所有玩家每秒失去5%生命，持续20秒，威力巨大，当2个boss距离小于10时会取消发动）\n特殊小怪：四大贱人（一旦消灭其中一个，必须在接下来的10秒内将剩余的全部消灭，否则将分裂重生：）\n影子护卫：有",
	[4] = "\nBoss特殊属性和技能：雷霆一击：每减少10%生命时施放，使所有人定身一段时间\n机关术：将整个内堂布满机关，按左右顺序轮流发动\n影子护卫：有",
	[5] = "\nBoss特殊属性和技能：无\n特殊小怪：机关（机关被摧毁时会使附近的非生命体造成5%伤害），恶犬（会咬人的哦！）\n影子护卫：无",
	[6] = "\nBoss特殊属性和技能：\n火羽：每20秒生命回复1%\n流光：每20秒生命降低1%\n移花接木：每隔一段时间火羽将6%的生命转移给流光\n阴差阳错：当火羽和流光生命百分比不相等时会因为阴阳失调使玩家遭受持续伤害，相差越大，伤害越高。\n影子护卫：有",
}

TB_STAGE = 			--各个关卡所对应的类（即table）
{
	[1] = CSTAGE1,
	[2] = CSTAGE2,
	[3] = CSTAGE3,
	[4] = CSTAGE4,
	[5] = CSTAGE5,
	[6] = CSTAGE6,
}
