Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DebugOutput = nothing
EYT_MAP_ID = 6076;
EYT_MISSION_ID = 71;
EYT_TIMER_ID = 101;
EYT_JOIN_TIME_LIMIT = 4;
EYT_PLAYER_MAX = 8;
EYT_MISSION_MAX = 100;
EYT_KILL_PLAYER = 1;
EYT_OPEN_FLAG = 40;
EYT_COUNTDOWN_REVIVE = 2;
EYT_COUNTDOWN_TIME = 15;
EYT_SCROE_MAX = 150;
EYT_FLAG_REFLESH_TIME = 3 * 60;
EYT_PUNISH_TIME = 15 * 60;
EYT_AWARD_COEFFICIENT = VNG_CFG_EXTRA_EYT_ADD_RATE or 0;    --奖励加成系数

--==============双方阵营========================
EYT_CAMP_RED = 1;
EYT_CAMP_BLUE = 2;
EYT_CAMP_STRING = {
	["camp_player"] = EYT_CAMP_RED,
	["camp_enemy"] = EYT_CAMP_BLUE,
}
EYT_CAMP_NAME = {
[EYT_CAMP_RED] = "红方军队",
[EYT_CAMP_BLUE] = "蓝方军队",
}
--==============常量：战场的状态===================
EYT_STATE_PEACE = 1;				--等待人数阶段
EYT_STATE_FIGHT = 2;				--开战状态
EYT_STATE_COMPLETE = 3;		  --战争结束状态

EYT_REV_POS = {
	[EYT_CAMP_RED] = {
		{1644, 3178},
		{1640, 3175},
		{1635, 3169},
		{1632, 3163},
	},
	[EYT_CAMP_BLUE] = {
		{1587, 3253},
		{1583, 3251},
		{1579, 3244},
		{1579, 3251},
	},
}

EYT_NPC_FLAG = "敌对阵营标志";

--TASK-==========================
EYT_TASK_1 = 3271; --1,2byte未使用,3byte胜场，4byte败场
EYT_TASK_2 = 3272; --1byte参与次数，2byte击杀数，3byte被杀数，4个人贡献积分
EYT_TASK_3 = 3274; --参与时间

--雪恨BUFF
EYT_XUEHEN = {--差距数 攻击提高数值 生命上限提高数值 免疫负面次数
	{21,150,300,15,format("相差 %d", 11),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{19,150,300,14,format("相差 %d", 10),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{17,135,270,14,format("相差 %d", 9),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{15,120,240,13,format("相差 %d", 8),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{13,105,210,13,format("相差 %d", 7),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{11,90 ,180,12,format("相差 %d", 6),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{9 ,75 ,150,12,format("相差 %d", 5),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{7 ,60 ,120,10,format("相差 %d", 4),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{5 ,45 ,90 , 5,format("相差 %d", 3),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{3 ,30 ,60 , 3,format("相差 %d", 2),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
	{1 ,15 ,30 , 1,format("相差 %d", 1),"攻击提高 %d%%, 生命上限提高 %d%%, 免疫负面次数"},
};

--八个佛的位置
EYT_FO_POS = {
	{"峨嵋小师姐1", "峨嵋小师姐", 1634, 3163, "camp_player"},
	{"峨嵋小师姐2", "峨嵋小师姐", 1630, 3167, "camp_player"},
	{"峨嵋小师姐3", "峨嵋小师姐", 1645, 3173, "camp_player"},
	{"峨嵋小师姐4", "峨嵋小师姐", 1642, 3180, "camp_player"},
	{"峨嵋小师姐1", "峨嵋小师姐", 1572, 3247, "camp_enemy"},
	{"峨嵋小师姐2", "峨嵋小师姐", 1575, 3243, "camp_enemy"},
	{"峨嵋小师姐3", "峨嵋小师姐", 1588, 3256, "camp_enemy"},
	{"峨嵋小师姐4", "峨嵋小师姐", 1590, 3252, "camp_enemy"},
}