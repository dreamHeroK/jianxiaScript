DebugOutput = nothing
SLT_CHANGE_PET = 1; --开启变身
SLT_EXP_ADD_PRB = 0; --副本系数F
SLT_NPC_NAME = "守卫老头"
SLT_LIMIT_LEVEL = 90; --限制等级
SLT_LIMIT_PLAYER = 4; --最低要求人数
SLT_COST_NUM_1 = 20;  --消耗精力数目
SLT_COST_NUM_2 = 4;   --消耗天骄令数目
SLT_AERA_NUM = 9; --区域个数
SLT_POINT_NUM = 3; --每个点怪物数量
SLT_GENBAN_NUM = 4; --跟班数量

SLT_MISSION_TIME_MAX = 20; --20min副本最长时间
SLT_MISSION_SETP = 5;      --5s步进
SLT_MISSION_STEP_MAX = (SLT_MISSION_TIME_MAX * 60) / SLT_MISSION_SETP  --最大步进

SLT_SCRIPT = "\\script\\missions\\siling_trial\\slt_head.lua"
SLT_NPC_TEMP_DATA_1 = 1;
SLT_NPC_TEMP_DATA_2 = 2;
SLT_NEED_ROOM = 2;
SLT_OPEN_NEED = {"天骄令", 2, 97, 236, 1};

--TASKID任务变量----------------
SLT_TASKID_1 = 3265  --1,2位记录MapSeq，AeraSeq,怪物轮数,是否等待开箱
SLT_TASKID_2 = 3266  --计数器
SLT_TASKID_3 = 3267  --记录npc索引
--时间触发器--------------------
SLT_TRIGGER_ID = 1536; --5s触发一次
SLT_LOGOUT_ID = 3011; --登出触发器
--退出点坐标--------------------
SLT_EXIT_POS = {100, 1434, 2949};

SLT_MAP_ID = {
	6001, 
	6002, 
	6003, 
	6004, 
	6005,
};
SLT_AERA_POS = {
	{1546, 3141},
	{1579, 3218},
	{1682, 3175},
	{1704, 3312},
	{1655, 3431},
	{1670, 3514},
	{1531, 3405},
	{1558, 3494},
	{1633, 3338},
};
SLT_NPC_POS_1 = {
	{1541, 3160},
	{1579, 3180},
	{1695, 3170},
	{1684, 3307},
	{1634, 3444},
	{1688, 3506},
	{1542, 3394},
	{1536, 3507},
	{1613, 3346},
};
SLT_NPC_POS_2 = {
	{1529, 3189},
	{1594, 3200},
	{1675, 3189},
	{1679, 3286},
	{1628, 3473},
	{1677, 3476},
	{1527, 3359},
	{1528, 3475},
	{1603, 3327},	
};
SLT_NPC_POS_3 = {
	{1539, 3222},
	{1606, 3178},
	{1678, 3216},
	{1695, 3264},
	{1653, 3478},
	{1688, 3448},
	{1544, 3343},
	{1541, 3448},
	{1620, 3331},	
};
SLT_BOSS_POS = {
	{1553, 3188},
	{1590, 3155},
	{1699, 3199},
	{1703, 3283},
	{1634, 3502},
	{1702, 3484},
	{1557, 3365},
	{1561, 3461},
	{1615, 3331},	
};

SLT_NPC_TEMPLATE_1 = {
	{"sl_dujiacong", "强力壮汉"},
	{"sl_bianfu", "边伏"},
	{"sl_huli", "狐狸"},
};
SLT_NPC_TEMPLATE_2 = {
	{"sl_elang", "雄鹰"},
	{"sl_heiya", "黑牙"},
	{"sl_shirene", "石人"},
	{"sl_chanchu", "蟾蜍"},
	{"sl_xixuebianfu", "吸血边伏"},
	{"sl_tianxie", "螳螂"},
	{"sl_yinhu", "银狐"},
	{"sl_changyuan", "长鸢"},
	{"sl_shuguai", "蜀怪"},
	{"sl_huixiong", "灰熊"},
	{"sl_dufeng", "毒蜂"},
	{"sl_jinjia", "金甲"},
};
SLT_NPC_TEMPLATE_3 = {
	{"sl_hongbaoshizhe", "红宝石者"},
	{"sl_xibeizhuanghan", "西北壮汉"},
	{"sl_yipingtangmishi", "一品堂秘士"},
	{"sl_cihuozhanglao", "赤火长老"},
	{"sl_wokou", "倭寇"},
	{"sl_xiannv", "仙女"},
	{"sl_nvxiaoxian", "女侠小仙"},
	{"sl_chimaohuwei", "驰猫护卫"},
};
SLT_BOSS_TEMPLATE = {
	{"sl_longling", "龙灵"},
	{"sl_yingling", "影灵"},
	{"sl_huling", "虎灵"},
	{"sl_fengling", "凤灵"},
	{"sl_qitiandasheng", "齐天大圣"},
};
SLT_PARTNER_TEMPLATE = {
	{"sl_huoqiling", "火麒麟"},
	{"sl_baitoudiao", "白头雕"},
	{"sl_huwang", "虎王"},
	{"sl_luanniao", "鸾鸟"},
	{"sl_juyuan", "巨猿"},
};

SLT_TONG_BOX = "铜龙匣"
SLT_YING_BOX = "银龙匣"
SLT_JING_BOX = "金龙匣"

SLT_AWARD = {
	[1] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[2] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[3] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[4] = {
		{"jinbaoxiang", SLT_JING_BOX, 1, SLT_SCRIPT},
	},	
}

SLT_EXP = {
	[1] = 2000000,
	[2] = 2500000,
	[3] = 3000000,
	[4] = 3500000,
}

SLT_ROUTE_ADD = {
	[1] = 0,
	[2] =	0,
	[3] =	0,
	[4] =	0,
	[5] =	0.2,
	[6] =	0.4,
	[7] =	0.6,
	[8] =	1,
}
