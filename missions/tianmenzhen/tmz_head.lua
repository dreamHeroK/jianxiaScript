--天门阵头文件
--by vivi
--2009-07-15

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\topscorelib.lua");
--Include("\\script\\lib\\xoyobi.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\online_activites\\task_values.lua")

Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
THIENMON_LOG_TITLE = "Chien truong Thien Mon Tran"

CampOne_Name = "宋方";
CameTwo_Name = "辽方";

ALL_ID = 0;
CampOne_ID = 1;	--武林联盟在mission中阵营
CampTwo_ID = 2;	--武林叛徒在mission中阵营

tCampName = {"宋方","辽方"};

CampOne_Type = "camp_player"; --武林联盟阵营类型，包括npc
CampTwo_Type = "camp_enemy";  --武林叛徒阵营类型，包括npc
Neutral_Type = "camp_evil";		--中立npc阵营类型

TMZ_EXP_EXT_RATE = min(VNG_CFG_TMZ_EXP_EXT_ADD_RATE or 0, 2)--经验加成系数
TMZ_JUNGONG_EXT_RATE = min(VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE or 0, 2)--军功加成系数

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",};

--===============全局变量==========================
g_NpcName = "<color=green>骠骑将军郭君鹏<color>：";

MAP_ID = 6006;

PLAY_NEED_LV = 70;      --参与最小等级

PLAYER_NEED_NUM = 1;    --对阵双方需要的最少人数 默认12
PLAYER_MAX_NUM = 16;    --对阵双方可加入的最大人数

MAX_ROOM_COUNT = 40;   --地图最大可加载数
--local nVersion,nCurGs = GetRealmType();
--if nCurGs == 1 then
--	MAX_ROOM_COUNT = 10;
--end

DEAD_BODY_TIME = 5;			--尸体存在时间

APPEAR_FLAG_POINT = 500; --500分的时候出现大阵旗
BROKEN_FLAG_POINT = 200; --击倒阵旗得到200分
BROKEN_EYE_POINT = 5; --击倒阵眼得到5分
OVER_GAME_POINT = 1000;  --当一方的战阵达到1000分时，对战结束

GIVE_AWARD_MARK = 20; --参加一次的全额积分
MAX_MARK = 20000; --积分上限
MAX_HUFU = 8;  --免费虎符数

CURE_ALL_PLAYER = 0;						--是否治疗所有和平状态的玩家
DRIVE_PLAYER_OUTOF_SHELTER = 1;	--是否打开强制传送后营停留过久的玩家的功能
INVINCIBILITY_TIME = 5;			--传出后营的无敌时间，单位秒

DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\playerdeath.lua";
NPC_DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\npc_death.lua";
TMZ_VM_SCRIPT = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
TMZ_TONG_RELAY_KEY_1 = "TMZ_TONG_SOCRE_RANK"; --在跨服区的排名，每周清
TMZ_TONG_RELAY_KEY_2 = "TMZ_TONG_RANK_SHOW";  --显示在面板上的，即上面的备份
TMZ_TONG_RELAY_KEY_3 = "TMZ_TONG_RELAY_DATA"; --记在本服的数据

--活跃度相关
TMZ_ACTIVE_PVP_DEATH_NUM = 6
TMZ_ACTIVE_PVP_LIMIT = 3
TMZ_ACTIVE_DAMAGE_LIMIT = 200000
TMZ_ACTIVE_HEAL_LIMIT = 100000
TMZ_ACTIVE_PVE_LIMIT = 6
TMZ_ACTIVE_EYE_LIMIT = 1
TMZ_ACTIVE_FLAG_LIMIT = 1

--每日参加限制
TMZ_DAILY_JOIN_LIMIT = 2

--每日领奖限制
TMZ_DAILY_AWARD_LIMIT = 2

--===============任务变量=========================
--在define中定义

--=====================临时变量==================================
PTT_DIE_LOOP = 201;				--记录玩家在战场死亡的时候，当前计时器的循环数
TASK_TEMP_DIE_TIME = 202; --记录玩家死亡时时间，存入GetTime()，用于死后10s后才能出去战场

--===============mission相关======================
MISSION_ID = 54; --mission id
TIMER_ID = 84; --time id
LOG_ID = 404;					--登陆触发器表ID
LOG_TRIGGER_ID = 304;			--登陆触发器自定义ID

FRAME_PER_SECOND = 18;
FRAME_PER_MIN = 60*FRAME_PER_SECOND;

PEACE_TIME = 5*FRAME_PER_SECOND;--等待玩家人数开启计时器的报时间隔，5秒
PEACE_TIMER_LOOP = (15*FRAME_PER_MIN/PEACE_TIME)-1;--等待玩家人数开启计时器报时次数（15分钟）
READY_TIME = 5*FRAME_PER_SECOND;--开战准备时间计时器的报时间隔，5秒
READY_TIMER_LOOP = (1*FRAME_PER_MIN/READY_TIME)-1;--开战准备时间计时器报时次数（1分钟）
FIGHT_TIME = 15*FRAME_PER_SECOND;			--打仗时间计时器的报时间隔，15秒
FIGHT_TIMER_LOOP = (40*FRAME_PER_MIN/FIGHT_TIME)-1;	--打仗时间计时器的报时次数（40分钟）
WAITOUT_TIME = 15*FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）

--==============公用missionV变量===================
MV_TMZ_LOAD = 1;   --是否已经加载开启
MV_TMZ_STATE = 2;  --记录战场的状态
MV_TMZ_MAP_ID = 3;		--本场天门阵的MAPID
MV_TMZ_MAP_INDEX = 4;	--本场天门阵的MAP索引
MV_TMZ_CAMPONE_EYE = 5; --记录当前阵营一的阵眼数
MV_TMZ_CAMPTWO_EYE = 6; --记录当前阵营二的阵眼数
MV_TMZ_CAMPONE_POINT = 7; --记录当前阵营一的战阵时间（积分）
MV_TMZ_CAMPTWO_POINT = 8; --记录当前阵营二的战阵时间（积分）
MV_TMZ_APPEAR_FLAG = 9;   --记录是否已创建大战旗
MV_TMZ_WINNER_CAMP = 10;   --记录谁赢了
MV_TMZ_SHOWDATA_IDX = 11;  --记录本次对阵在TMZ_ShowData中第几项
MV_TIMER_LOOP = 12;				--记录TIMER的报时次数
MV_TMZ_LOG_TIME = 13;	 --记录开启的时间 格式：%m%d%H%M%S
MV_TMZ_GAME_LOOP = 14;	--记录GetGameLoop()
MV_TMZ_ERROR_NUM = 15;	--记录重新创建触发器的次数，达到一定次数将去除场地
MV_TMZ_TONG_CAMPONE_MAX = 16; --阵营一帮会可进去最大人数
MV_TMZ_TONG_CAMPTWO_MAX = 17; --阵营二帮会可进去最大人数
MV_TMZ_TONG_CAMPONE_USEFUL = 18; --阵营一有效参与对阵的人数
MV_TMZ_TONG_CAMPTWO_USEFUL = 19; --阵营二有效参与对阵的人数
MV_TMZ_TONG_CAMPONE_SCORE = 20;--阵营一当前对阵积分
MV_TMZ_TONG_CAMPTWO_SCORE = 21;--阵营二当前对阵积分
MV_TMZ_TONG_CAMPONE_LV = 22;--阵营一当前对阵等级
MV_TMZ_TONG_CAMPTWO_LV = 23;--阵营二当前对阵等级
MV_TMZ_TONG_CAMPONE_WEEK_WIN = 24;--阵营一本周对战胜场数
MV_TMZ_TONG_CAMPTWO_WEEK_WIN = 25;--阵营二本周对战胜场数
MV_TMZ_TONG_CAMPONE_WEEK_LOSE = 26;--阵营一本周对战负场数
MV_TMZ_TONG_CAMPTWO_WEEK_LOSE = 27;--阵营二本周对战负场数
MV_TMZ_TONG_CAMPONE_TOTAL_WIN = 28;--阵营一总对战胜场数
MV_TMZ_TONG_CAMPTWO_TOTAL_WIN = 29;--阵营二总对战胜场数
MV_TMZ_TONG_CAMPONE_TOTAL_LOSE = 30;--阵营一总对战负场数
MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE = 31;--阵营二总对战负场数
MV_TMZ_TONG_CAMPONE_LAST_WIN = 32;--阵营一上场胜负
MV_TMZ_TONG_CAMPTWO_LAST_WIN = 33;--阵营二上场胜负
MV_TMZ_TONG_CAMPONE_HUFU = 34;--阵营一虎符数
MV_TMZ_TONG_CAMPTWO_HUFU = 35;--阵营二虎符数

--==============公用missionS变量===================
MV_TMZ_TONG_CAMPONE_NAME = 1; --记录阵营一帮会名字
MV_TMZ_TONG_CAMPTWO_NAME = 2; --记录阵营二帮会名字

--==============常量：战场的状态===================
MS_STATE_PEACE = 0;				--等待人数阶段
MS_STATE_READY = 1;				--准备状态，人数齐等待开战阶段
MS_STATE_FIGHT = 2;				--开战状态
MS_STATE_COMPLETE = 3;		--战争结束状态

tPositionNpcA = {
--最后为物品掉落率
	{"华南虎","华南虎",1792,3745},
	{"华南幼崽","华南幼崽",1791,3742},
	{"华南幼崽","华南幼崽",1785,3743},
	{"母灰狼","母灰狼",1780,3341},
	{"小土狼1","小土狼",1786,3349},
	{"小土狼1","小土狼",1781,3352},
	{"劫径小贼","劫径小贼",1770,3656},
	{"劫径小贼","劫径小贼",1765,3658},
	{"劫径小贼","劫径小贼",1772,3657},
	{"李鬼2","李逵",1767,3416},
	{"秦俊","秦俊",1768,3423},
	{"罗琼","罗琼",1759,3419},
	{{50,150,250,350},{"斗气",2,1,3849},{"铁锹",2,1,3850},{"斗气",2,1,3849},{"铁锹",2,1,3850}},
};

tPositionNpcB = {
	{"大木人","大木人",1863,3419},
	{"大木人","大木人",1691,3636},
	{{200,400,600,800},{"燃烧瓶",2,1,3851},{"铁锹",2,1,3850},{"斗气",2,1,3849},{"铁锹",2,1,3850}}	
};

tPositionNpcC = {
	{"谢三颖","谢三颖",1898,3557},
	{"吕二娘","吕二娘",1890,3559},
	{"莫惊风","莫惊风",1903,3598},
	{"杨延烈的亡魂","杨延烈的亡魂",1654,3325},
	{"李巡山","李巡山",1661,3519},
	{"大大王柴风","大大王柴风",1646,3487},
	{"二大王韦娘","二大王韦娘",1666,3488},
	{{200},{"香蕉皮",2,1,3852}}
};

tPositionNpcS = {
	{"强盗罗罗","强盗罗罗"},
	{{1844,3621},{1841,3633},{1834,3628},{1835,3619},{1839,3612},{1842,3614},{1716,3627},{1712,3635},{1704,3631},{1704,3619},{1709,3612},
	 {1714,3613},{1729,3446},{1726,3436},{1717,3442},{1718,3452},{1718,3452},{1729,3456},{1854,3430},{1850,3442},{1844,3439},{1843,3426},
	 {1848,3418},{1853,3421}},	
};

tPositionNpcBOSS = { -- 别超过四个
	{{"狂将冥日","狂将冥日",1776,3528},{3,25,250},{150,TASKID_TMZ_BOSS}},
	{{"诡将黯月","诡将黯月",1776,3528},{0,10,0},{50,TASKID_TMZ_BOSS}},
};

--道具效果
tPositionBox = {--模板名 npc名 状态姓名 效果描述 魔法属性字符串 数值 持续时间
	{"武器架","武器架",1787,3508,"攻击","攻击力提高100%, 持续30秒","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"武器架","武器架",1754,3543,"攻击","攻击力提高 100%, 持续30秒","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"盾牌架","盾牌架",1775,3411,"防御","承受伤害减半概率100%, 持续30秒","state_receive_half_damage",100,30},
	{"绿树叶","绿树叶",1775,3666,"治疗","每秒恢复10%的生命, 持续30秒","state_life_per_per8f",500,30},
	{"飞鞋","飞鞋",1851,3527,"隐藏","遁去行踪, 持续30秒","state_illusion_latent",0,30},
	{"飞鞋","飞鞋",1686,3528,"隐藏","遁去行踪, 持续30秒","state_illusion_latent",0,30},
};

tPositionNpcEye = {--模板名、npc名、坐标点
	[0] = {
		{"旗杆1","生门阵眼 (尚未占领)",1840,3622},
		{"旗杆2","死门阵眼 (尚未占领)",1710,3626},
		{"旗杆3","景门阵眼 (尚未占领)",1724,3447},
		{"旗杆4","灭门阵眼 (尚未占领)",1849,3431},		
	},
	[1] = {
		{"紫色生门","生门阵眼 ("..CampOne_Name..")",1840,3622},
		{"紫色死门","死门阵眼 ("..CampOne_Name..")",1710,3626},
		{"紫色景门","景门阵眼 ("..CampOne_Name..")",1724,3447},
		{"紫色灭门","灭门阵眼 ("..CampOne_Name..")",1849,3431},				
	},
	[2] = {
		{"蓝色生门","生门阵眼 ("..CameTwo_Name..")",1840,3622},
		{"蓝色死门","死门阵眼 ("..CameTwo_Name..")",1710,3626},
		{"蓝色景门","景门阵眼 ("..CameTwo_Name..")",1724,3447},
		{"蓝色灭门","灭门阵眼 ("..CameTwo_Name..")",1849,3431},				
	},	
};

tPositionNpcFlag = {--模板名、npc名、坐标点 
	[1] = {
		{"紫色阵旗","大阵旗("..CampOne_Name..")",1820,3347},
		{"紫色败旗","破损的战旗 ("..CampOne_Name..")",1820,3347},		
	},
	[2] = {
		{"蓝色阵旗","大阵旗("..CameTwo_Name..")",1737,3726},
		{"蓝色败旗","破损的战旗 ("..CameTwo_Name..")",1737,3726},		
	},
};

--八个佛的位置
tPositionFo = {
	{"峨嵋小师姐1","峨嵋小师姐",1907,3367,1645,3666},
	{"峨嵋小师姐2","峨嵋小师姐",1913,3367,1652,3665},
	{"峨嵋小师姐3","峨嵋小师姐",1908,3390,1652,3689},
	{"峨嵋小师姐4","峨嵋小师姐",1914,3389,1642,3687}
}

tPositionCamp = { --后营复活点 前营战场点 仓库管理员 离开npc 上阵npc
	{{1912,3377},{{1855,3435},{1831,3335}},{1901,3356},{1891,3349},{1891,3361}},
	{{1643,3675},{{1703,3618},{1725,3737}},{1664,3715},{1657,3709},{1660,3689}},
};

--界面显示
--TMZ_ShowData = TMZ_ShowData or {
--	CurN = 0,
--	name = "天门阵",
--	title = {"姓名","阵营","流派","杀人数","死亡数","阵眼"},
--	szFormat = "%-17s%-9s%-9s%-7s%-7s%-6s",
--};
--TMZ_LoadData();

--经验翻倍的物品
tAwardItem = 
{
	[0] = {},
	[1] = {"军功章",2,1,9999,1},
	[2] = {"大军功章",2,1,9998,1},
	[3] = {"辉煌军功章",2,1,9977,1},
	[4] = {"荣耀军功章",2,1,30642,1},
};

g_tWinExtraAward =--胜方专属奖励
{
	{{MA_GiveMoney, {5000}}, 7000},
	{{MA_GiveMoney, {8000}}, 2000},
	{{MA_GiveMoney, {100000}}, 900},
	{{MA_GiveMoney, {1000000}}, 100},
};

--必给奖励
g_tWinExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,200,1},--军功
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,300,1},--军功
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--军功
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,500,1},--军功
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,600,1},--军功
		},
	},
};

g_tLoseExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,100,1},--军功
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,200,1},--军功
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,300,1},--军功
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--军功
		},
	},
};

tbNormalAward = 
{
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,100000,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,200000,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,300000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,400000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,500000,1},
		},
	},
}
 tbAcvtiveDesc = 
{
	{"<color=green>很一般<color>", "<color=green>排名第六<color>",},
	{"<color=green>一般般<color>", "<color=green>排名第五<color>",},
	{"<color=yellow>一般<color>", "<color=yellow>排名第四<color>",},
	{"<color=yellow>厉害<color>", "<color=yellow>排名第三<color>",},
	{"<color=red>很厉害<color>", "<color=red>排名第二<color>",},
	{"<color=red>超厉害<color>", "<color=red>排名第一<color>",},
}

tbAcvtiveWinAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,400000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,500000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,600000,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,800000,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,1000000,1},
		},
	},
}

tbAcvtiveLossAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,100000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,200000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,300000,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,400000,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,500000,1},
		},
	},
}

tTongScoreLv = {
	{150,1,8},
	{190,2,12},
	{99999,3,16},
};
