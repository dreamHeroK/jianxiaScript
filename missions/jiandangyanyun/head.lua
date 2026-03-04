Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_settings.lua");
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\lib\\define.lua");

thisFile = "\\script\\missions\\jiandangyanyun\\mission.lua";

MISSION_ID = 86;

JDYY_TSK_DC_ENTER = 3465;
JDYY_ENTER_LIMIT = 999;

eDifType = {
	["NORMAL"] = 1,
	["HARD"] = 2,
};

tOptions = {
	[eDifType.NORMAL] = {
		["MemberNum"]		= {1, 8},
		["MemberRouteNum"]	= {1, 8},
		["MemberLevel"]		= {0, 999},
		["MemberHaveRoute"] = 1,
		["RoomWeight"]		= {1, 10},
		["PKValue"]			= {0, 9},
	},
	[eDifType.HARD] = {
		["MemberNum"]		= {1, 8},
		["MemberRouteNum"]	= {1, 8},
		["MemberLevel"]		= {0, 999},
		["MemberHaveRoute"]	= 1,
		["RoomWeight"]		= {1, 10},
		["PKValue"]			= {0, 9},
	},
};

tJDYY = {
--	name = "剑荡燕云",
--	missionID = 70,
--	realMapID = 8011,
--	dynamicMap = 1,
	
	----------------------------
	MAP_ID = 19,
	
	mv_01 = 1,
	mv_02 = 2,
	mv_03 = 3,
	
	mv_19 = 19,
	mv_20 = 20,
	mv_21 = 21,
	mv_22 = 22,
	mv_23 = 23,
	mv_24 = 24,
	mv_25 = 25,
	mv_26 = 26,
	mv_27 = 27,
	mv_28 = 28,
	mv_29 = 29,
	mv_30 = 30,
	mv_31 = 31,
	mv_32 = 32,
	mv_33 = 33,
	mv_34 = 34,
	mv_35 = 35,
	mv_36 = 36,
	mv_37 = 37,
	mv_38 = 38,
	mv_39 = 39,
	mv_40 = 40,
	mv_41 = 41,
	mv_42 = 42,
	
	MS_STAGE = 1,
	ms_02 = 2,
};

tPhaseDriver = {
	timerID = 120,
	maxsecond = 60*60,
};

--tPhaseDriver = gf_CopyInherit(phaseBase, tPhaseDriver, msSettings:GetPhaseSettings(MISSION_ID));

tMapCountLimit = {
	[eDifType.NORMAL] = 30,
	[eDifType.HARD] = 30,
};

szCamp_1 = "xsc_boss";
szCamp_2 = "xsc_tianyinsiwei";

tNpcs = {
	jjg = {"菁菁姑娘", "菁菁姑娘", "\\script\\missions\\jiandangyanyun\\npcs\\jjg_npc.lua", CampPlayer},
	qy 	= {"青鸢", "青鸢", thisFile, CampPlayer},
	smr = {"神秘人", "神秘人", thisFile, CampPlayer},
	zr 	= {"火神祝融", "火神祝融", thisFile, CampEnemy},
	hsy = {"天阴教黑油护送员", "天阴教黑油护送员", thisFile, CampEnemy},
	tny = {"燕云唐弄月", "唐弄月", thisFile, CampPlayer},
	yy	= {"瞬神夜莺", "瞬神夜莺", thisFile, CampEnemy},
	lwq = {"落霞仙子凌婉秋", "落霞仙子凌婉秋", thisFile, CampPlayer},
	syy = {"寂灭尊者苏依依", "寂灭尊者苏依依", thisFile, CampEnemy},
	shx = {"苏慧娴", "苏慧娴", thisFile, CampEnemy},
	fj 	= {"方旌", "方旌", thisFile, CampEnemy},
	smmf= {"司马鸣风", "司马鸣风", thisFile, CampPlayer},
	tbh	= {"拓拔弘", "拓拔弘", thisFile, CampPlayer},
	sl 	= {"无量明王沙罗", "无量明王沙罗", thisFile, CampEnemy},
	lf 	= {"燕云花圣洛飞", "燕云花圣洛飞", thisFile, CampPlayer},
	hy 	= {"红印教主", "红印教主", thisFile, CampEnemy},
};

tNpcs_NORMAL = {
	zr 	= {"普通火神祝融", "火神祝融", thisFile, CampEnemy},
	hsy = {"普通天阴教黑油护送员", "天阴教黑油护送员", thisFile, CampEnemy},
	yy	= {"普通瞬神夜莺", "瞬神夜莺", thisFile, CampEnemy},
	syy = {"普通寂灭尊者苏依依", "寂灭尊者苏依依", thisFile, CampEnemy},
	shx = {"普通苏慧娴", "苏慧娴", thisFile, CampEnemy},
	fj 	= {"普通方旌", "方旌", thisFile, CampEnemy},
	sl 	= {"普通无量明王沙罗", "无量明王沙罗", thisFile, CampEnemy},
	hy 	= {"普通红印教主", "红印教主", thisFile, CampEnemy},
};

tNpcs_CHEAT = {
	zr 	= {"作弊火神祝融", "火神祝融", thisFile, CampEnemy},
	yy	= {"作弊瞬神夜莺", "瞬神夜莺", thisFile, CampEnemy},
	syy = {"作弊寂灭尊者苏依依", "寂灭尊者苏依依", thisFile, CampEnemy},
	sl 	= {"作弊无量明王沙罗", "无量明王沙罗", thisFile, CampEnemy},
	hy 	= {"作弊红印教主", "红印教主", thisFile, CampEnemy},
};

tNpcPos = {
	qy 	= {
		["01_1"] = {{1580, 3319}, },
	},
	smr = {
		["01_1"] = {{1553, 3255}, },
	},
	zr 	= {
		["01_2_2"] = {{1586, 3336}, },
		["06_2_2"] = {{1692, 3699}, },
	},
	tny = {
		["02_1"] = {{1559, 3415}, },
	},
	yy 	= {
		["02_2_2"] = {{1557, 3431}, },
		["06_2_2"] = {{1695, 3712}, },
	},
	lwq = {
		["03_1"] = {{1629, 3529}, },
	},
	syy = {
		["03_2_2"] = {{1617, 3543}, },	--{1603, 3560}, 
		["06_2_2"] = {{1702, 3706}, },
	},
	shx = {
		["03_2_2"] = {{1628, 3530}, },	--{1622, 3523},
		["06_2_2"] = {{1706, 3720}, },
	},
	fj	= {
		["03_2_2"] = {{1629, 3510}, },	--{1660, 3489},
		["06_2_2"] = {{1695, 3712}, },
	},
	smmf = {
		["04_1"] = {{1679, 3576}, },
	},
	sl	= {
		["04_1"] = {{1692, 3591}, },
		["06_2_2"] = {{1705, 3727}, },
	},
	tbh	= {
		["04_2_2"] = {{1679, 3625}, },
		["06_2_2"] = {{1698, 3706}, },
	},
	lf	= {
		["05_1"] = {{1708, 3681}, },
		["06_1"] = {{1708, 3681}, },
		["05_2_3"] = {{1708, 3681}, },
	},
	hy	= {
		["05_2_1"] = {{1696, 3700}, },
		["05_2_2"] = {{1696, 3700}, },
		["05_2_3"] = {{1696, 3700}, },
		["06_2_2"] = {{1703, 3712}, },
	},
	jjg = {
		[0] = {{1706, 3245}, },
	},
};

tPlayerPos = {
	["01"] = {{1580, 3317}, },
	["02"] = {{1563, 3409}, },
	["03"] = {{1614, 3510}, },
	["04"] = {{1676, 3577}, },
	["05"] = {{1707, 3680}, },
	["06"] = {{1707, 3680}, },
};

tTrapResetPos = {
	["01_2_2"] = {1587, 3336},
	["02_2_2"] = {1562, 3430},
	["03_2_2"] = {1629, 3530},
	["04_2_2"] = {1689, 3589},
	["05_2_2"] = {1705, 3713},
	["06_2_2"] = {1705, 3713},
};

tTrapPoints = {
	["01_2_2"] = {{{1565, 3399}, {1576, 3385}}, {{1570, 3281}, {1574, 3309}}, {{1582, 3301}, {1565, 3285}}, },
	["02_2_2"] = {{{1589, 3471}, {1606, 3494}}, {{1565, 3399}, {1576, 3385}}},
	["03_2_2"] = {{{1652, 3566}, {1669, 3563}}, {{1589, 3471}, {1606, 3494}}},
	["04_2_2"] = {{{1712, 3667}, {1724, 3652}}, {{1666, 3604}, {1678, 3637}}, {{1727, 3608}, {1708, 3634}}, {{1652, 3566}, {1669, 3563}}},
	["05_2_2"] = {{{1718, 3650}, {1714, 3678}}, {{1709, 3671}, {1724, 3652}}},
	["06_2_2"] = {{{1718, 3650}, {1714, 3678}}, {{1709, 3671}, {1724, 3652}}},
};

tTaskIDs = {
	[eDifType.HARD] = {
		["01"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_1_DAILY, 10},
		["02"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_2_DAILY, 10},
		["03"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_3_DAILY, 10},
		["04"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_4_DAILY, 10},
		["05"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_5_DAILY, 10},
	},
	[eDifType.NORMAL] = {
		["01"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_1_DAILY, 40},
		["02"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_2_DAILY, 40},
		["03"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_3_DAILY, 40},
		["04"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_4_DAILY, 40},
		["05"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_5_DAILY, 40},
	},
};

--地图上已经创建出的NPC缓存
tExistNpcList = {
--	[nMapId] = {
--		{szName, nNpcIdx},
--	},
};

tList = {
	[2 ] = "少林俗家",
	[3 ] = "少林禅僧",
	[4 ] = "少林武僧",
	[6 ] = "唐门",
	[8 ] = "峨嵋佛家",
	[9 ] = "峨嵋俗家",
	[11] = "丐帮净衣",
	[12] = "丐帮污衣",
	[14] = "武当道家",
	[15] = "武当俗家",
	[17] = "杨门枪骑",
	[18] = "杨门弓骑",
	[20] = "五毒邪侠",
	[21] = "五毒蛊师",
	[23] = "昆仑天师",
	[25] = "明教圣战",
	[26] = "明教阵兵",
	[27] = "明教血人",
	[29] = "翠烟舞仙",
	[30] = "翠烟灵女",
	[31] = "唐门任侠",
	[32] = "昆仑剑尊",
};

tDataStateList = {
	["yanyun_cheat"] = 1,
	["yanyun_easy_open_1"] = 2,
	["yanyun_easy_over_1"] = 3,
	["yanyun_easy_open_2"] = 4,
	["yanyun_easy_over_2"] = 5,
	["yanyun_easy_open_3"] = 6,
	["yanyun_easy_over_3"] = 7,
	["yanyun_easy_open_4"] = 8,
	["yanyun_easy_over_4"] = 9,
	["yanyun_easy_open_5"] = 10,
	["yanyun_easy_over_5"] = 11,
	["yanyun_hard_open_1"] = 12,
	["yanyun_hard_over_1"] = 13,
	["yanyun_hard_open_2"] = 14,
	["yanyun_hard_over_2"] = 15,
	["yanyun_hard_open_3"] = 16,
	["yanyun_hard_over_3"] = 17,
	["yanyun_hard_open_4"] = 18,
	["yanyun_hard_over_4"] = 19,
	["yanyun_hard_open_5"] = 20,
	["yanyun_hard_over_5"] = 21,
	["yanyun_easy_free"] = 22,
	["yanyun_easy_ib"] = 23,
	["yanyun_hard_free"] = 24,
	["yanyun_hard_ib"] = 25,
	["yanyun_easy_participate_1"] = 26,
	["yanyun_easy_participate_2"] = 27,
	["yanyun_easy_participate_3"] = 28,
	["yanyun_easy_participate_4"] = 29,
	["yanyun_easy_participate_5"] = 30,
	["yanyun_xuanyin"] = 31,
	["yanyun_zhenyang"] = 32,
};

tGodStates	= {
        tInfo	= {"真·天神下凡", 5},
	tState	= {
		[1] = {9920, "state_life_max_percent_add",	1000,	"生命上限提高10倍"},
		[2] = {9921, "state_p_attack_percent_add",		100,	"外功攻击 +100%"},	
		[3] = {9922, "state_m_attack_percent_add",		100,	"内功攻击 +100%"},
		[4] = {9923, "state_immune",				100,	"免疫所有负面效果"},
	},
}

tDeathPos = {1695, 3250};
tExitPos  = {1331, 2837};

this = msSettings:LoadHead(MISSION_ID);
this = inherit(tJDYY, this);

tTaskID = {
	["ConsumeTaskID"] = {
		[eDifType.NORMAL] = TASKID_JDYY_CONSUME_1,
		[eDifType.HARD] = TASKID_JDYY_CONSUME_2,
	},
};

tAdvancedPrize = {
	{"玄阴玉", {2,95,1500,8 }, 0.25*100000},
	{"真阳璧", {2,95,1501,8 }, 0.25*100000},
	{"玄阴玉", {2,95,1500,6 }, 0.15*100000},
	{"真阳璧", {2,95,1501,6 }, 0.15*100000},
	{"玄阴玉", {2,95,1500,10}, 0.1*100000},
	{"真阳璧", {2,95,1501,10}, 0.1*100000},
};

tPrize = {
	[1] = {	--免费
		[1] = {		--普通
			{"B錸g Lai Ti猲 Dc"			,{2,95,1503,1},  	10.00*1000},
			{"T骾 Ng﹏ Lng"			,{2,95,649,2},  	5.00*1000},
			{"T骾 Ng﹏ Lng"			,{2,95,649,1},  	5.00*1000},
			{"T骾 Ng﹏ Lng"			,{2,95,649,3},  	10.00*1000},
			{"T骾 Ng﹏ Lng"			,{2,95,649,9},  	1.78 *1000},
			{"T骾 Ng﹏ Lng"			,{2,95,649,99},  	0.20 *1000},
			{"T骾 Ng﹏ Lng"			,{2,95,649,999},  	0.02 *1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim"	,{2,95,1515,1},  	0.00 *1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim"	,{2,95,1515,4},  	0.00 *1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim"	,{2,95,1515,25},  	0.00 *1000},
			{"M秐h H錸g Hoang"			,{2,95,1506,1},  	14.00*1000},
			{"M秐h H錸g Hoang"			,{2,95,1506,2},  	9.00 *1000},
			{"M秐h H錸g Hoang"			,{2,95,1506,5},  	5.00 *1000},
			{"Li謙 V?Th筩h"			,{2,1,10012,1},  	1.00*1000},
			{"M秐h Ц K?N╪g"		,{2,1,10011,5},  	25.00*1000},
			{"M秐h Ц K?N╪g"		,{2,1,10011,20}, 	10.00 *1000},
			{"M秐h Ц K?N╪g"		,{2,1,10011,100},  	2.00 *1000},
			{"Quang V?Huy襫 thi誸"			,{2,114,3,1},  		1.00 *1000},
			{"Quang V?Huy襫 Th筩h"			,{2,114,106,1},  	1.00 *1000},
		},
		[2] = {		--英雄
			{"T骾 Ng﹏ Lng", 				{2,95,649,3}, 		7.00*1000},
			{"T骾 Ng﹏ Lng", 				{2,95,649,9}, 		3.30*1000},
			{"T骾 Ng﹏ Lng", 				{2,95,649,99}, 		0.71 *1000},
			{"T骾 Ng﹏ Lng", 				{2,95,649,999},		0.01 *1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,1}, 		12.00*1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,4}, 		6.00 *1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,25}, 	2.78 *1000},
			{"Phi誹 Kim Хng Y課 V﹏", 		{2,95,1512,1}, 		3.00 *1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,1}, 		10.00*1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,2}, 		9.00 *1000},
			{"M秐h H錸g Hoang",		 	{2,95,1506,5}, 		5.00 *1000},
			{"Li謙 V?Th筩h",		 		{2,1,10012,1}, 		10.00*1000},
			{"M秐h Ц K?N╪g",			{2,1,10011,100},  	15.00*1000},
			{"Ц K?N╪g C蕄 1",			{2,22,1,1}, 	 	5.00 *1000},
			{"Ц K?N╪g C蕄 2",			{2,22,2,1},  		1.00 *1000},
			{"Ц K?N╪g C蕄 3",			{2,22,3,1},  		0.20 *1000},
			{"Quang V?Huy襫 thi誸",			{2,114,3,1},  		10.00 *1000},
			{"Quang V?Huy襫 Th筩h",			{2,114,106,1},  	10.00 *1000},
		},
	},
	[2] = {			--付费
		[1] = {		--外传
			{"Huy襫  L謓h", 				{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,8}, 		0.0750 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,8}, 		0.0750 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,6}, 		0.0300 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,6}, 		0.0300 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,2}, 		0.0600 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,2}, 		0.0600 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,1}, 		0.2000 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,1}, 		0.2000 * 1000, 1},
			{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h-Nh?", 		{2,1,1067 ,1}, 		0.0750 * 1000, 1},
			{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", 		{2,1,1113 ,1}, 		0.0250 * 1000, 1},
--			{"黄金虎纹卡", 			{2,100,9  ,1}, 		0.2500 * 1000, 1},
			{"Thi猲 Bi課 Ph筸 Thi猲 Quy觧", 			{2,95,247 ,1}, 		0.5000 * 1000, 1},
			{"Nh﹏ S﹎ v筺 n╩", 			{2,0,796  ,1}, 		0.5000 * 1000, 1},
			{"Thi猲 Th筩h Tinh Th筩h", 			{2,1,1009 ,1}, 		4.0000 * 1000, 1},
			{"Phi誹 Thi猲 Bi課 Ph祅 Tinh", 			{2,95,246 ,1}, 		2.5000 * 1000},
			{"Bao m秐h Thi猲 Th筩h", 		{2,1,1049 ,1}, 		0.1500 * 1000},
			{"Чi Nh﹏ s﹎", 			{2,0,553  ,1}, 		1.0000 * 1000},
			{"Ng?S綾 Th竔 Nhi詍", 			{2,201,13 ,5}, 		0.2500 * 1000, 1},
			{"Ng?S綾 Th竔 Nhi詍", 			{2,201,13 ,1}, 		2.5000 * 1000, 1},
			{"Phng V╪ Kh綾 B秐 [Y ph鬰 c蕄 3]", {2,95,591 ,1}, 		0.5000 * 1000, 1},
			{"H?V╪ Kh綾 B秐 [H?trang c蕄 3]", {2,95,594 ,1}, 		0.5000 * 1000, 1},
			{"Long V╪ Kh綾 B秐 [u c蕄 3]", {2,95,588 ,1}, 		0.5000 * 1000, 1},
			{"Hoa V╪ Kh綾 B秐 [Trang s鴆 c蕄 3]", {2,95,597 ,1}, 		1.0000 * 1000, 1},
			{"T骾 Ng﹏ Lng", 				{2,95,649 ,4}, 		20.1800* 1000},
			{"B錸g Lai Ti猲 Dc", 			{2,95,1503,2}, 		6.0000 * 1000},
			{"Ti觰 Thi猲 Th筩h Bao", 			{2,95,221 ,1}, 		5.0000 * 1000},
			{"b竛h 輙 B竎 B秓", 			{2,1,1125 ,1}, 		5.5000 * 1000},
			{"C鰑 chuy觧 h錳 h錸 n", 			{1,0,32   ,1}, 		6.0000 * 1000},
			{"Tam Di謚 Long Hi_筺 Giao", 		{2,1,1260 ,5}, 		5.0000 * 1000},
			{"Tam Di謚 Long Hi_C竔 Th?", 		{2,1,1261 ,5}, 		5.0000 * 1000},
			{"Ti觰 Bao L璾 Kim", 			{2,95,665 ,1}, 		2.5000 * 1000},
			{"Ti觰 Thi猲 Th筩h Bao", 			{2,95,221 ,1}, 		8.0000 * 1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,1}, 		15.0000* 1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,2}, 		5.0000 * 1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,5}, 		2.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,1}, 		0.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,4}, 		0.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim	", 	{2,95,1515,25}, 	0.0000 * 1000},
		},
		[2] = {		--IB
			{"Huy襫  L謓h", 				{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,8 }, 	0.0750 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,8 }, 	0.0750 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,6 }, 	0.0300 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,6 }, 	0.0300 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,2 }, 	0.0600 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,2 }, 	0.0600 * 1000, 1},
			{"Huy襫  L謓h", 				{2,95,1500,1 }, 	0.2000 * 1000, 1},
			{"Ch﹏ Dng B輈h", 				{2,95,1501,1 }, 	0.2000 * 1000, 1},
			{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", 		{2,1,1067 ,1 }, 	0.0250 * 1000, 1},
			{"Bao Thi猲 Th筩h", 			{2,1,1050 ,1 }, 	0.1500 * 1000, 1},
			{"Thi猲 Bi課 Ph筸 Thi猲 Quy觧", 			{2,95,247 ,1 }, 	0.5000 * 1000, 1},
			{"Nh﹏ S﹎ v筺 n╩", 			{2,0,796  ,1 }, 	0.2500 * 1000, 1},
			{"Thi猲 Th筩h Tinh Th筩h", 			{2,1,1009 ,1 }, 	4.0000 * 1000, 1},
			{"Phi誹 Thi猲 Bi課 Ph祅 Tinh", 			{2,95,246 ,1 }, 	2.5000 * 1000},
			{"Bao m秐h Thi猲 Th筩h", 		{2,1,1049 ,1 }, 	0.1500 * 1000},
			{"Чi Nh﹏ s﹎", 			{2,0,553  ,1 }, 	1.0000 * 1000},
			{"Ng?S綾 Th竔 Nhi詍", 			{2,201,13 ,5 }, 	0.2500 * 1000, 1},
			{"Ng?S綾 Th竔 Nhi詍", 			{2,201,13 ,1 }, 	2.5000 * 1000, 1},
			{"Phng V╪ Kh綾 B秐 [Y ph鬰 c蕄 3]", {2,95,591 ,1 }, 	0.5000 * 1000, 1},
			{"H?V╪ Kh綾 B秐 [H?trang c蕄 3]", {2,95,594 ,1 }, 	0.5000 * 1000, 1},
			{"Long V╪ Kh綾 B秐 [u c蕄 3]", {2,95,588 ,1 }, 	0.5000 * 1000, 1},
			{"Hoa V╪ Kh綾 B秐 [Trang s鴆 c蕄 3]", {2,95,597 ,1 }, 	1.0000 * 1000, 1},
			{"T骾 Ng﹏ Lng", 				{2,95,649 ,4 }, 	30.1000* 1000},
			{"B錸g Lai Ti猲 Dc", 			{2,95,1503,2 }, 	6.0000 * 1000},
			{"Ti觰 Thi猲 Th筩h Bao", 			{2,95,221 ,1 }, 	5.0000 * 1000},
			{"b竛h 輙 B竎 B秓", 			{2,1,1125 ,1 }, 	5.5000 * 1000},
			{"C鰑 chuy觧 h錳 h錸 n", 			{1,0,32   ,1 }, 	6.0000 * 1000},
			{"B竎h Hoa Th藀 C萴 Nguy謙", 			{1,0,292  ,1 }, 	0.2500 * 1000},
			{"Ti觰 Bao L璾 Kim", 			{2,95,665 ,1 }, 	2.5000 * 1000},
			{"Ti觰 Thi猲 Th筩h Bao", 			{2,95,221 ,1 }, 	8.0000 * 1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,1 }, 	15.0000* 1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,2 }, 	5.0000 * 1000},
			{"M秐h H錸g Hoang", 			{2,95,1506,5 }, 	2.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,1 }, 	0.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,4 }, 	0.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 	{2,95,1515,25}, 	0.0000 * 1000},
		},
		[3] = {		--PAY
			{"Huy襫  L謓h", 						{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch﹏ Dng B輈h", 						{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"Huy襫  L謓h", 						{2,95,1500,8 }, 	0.0750 * 1000, 1},
			{"Ch﹏ Dng B輈h", 						{2,95,1501,8 }, 	0.0750 * 1000, 1},
			{"Huy襫  L謓h", 						{2,95,1500,6 }, 	0.0300 * 1000, 1},
			{"Ch﹏ Dng B輈h", 						{2,95,1501,6 }, 	0.0300 * 1000, 1},
			{"Huy襫  L謓h", 						{2,95,1500,2 }, 	0.0600 * 1000, 1},
			{"Ch﹏ Dng B輈h", 						{2,95,1501,2 }, 	0.0600 * 1000, 1},
			{"Huy襫  L謓h", 						{2,95,1500,1 }, 	0.2000 * 1000, 1},
			{"Ch﹏ Dng B輈h", 						{2,95,1501,1 }, 	0.2000 * 1000, 1},
			{"Thi猲 C?B秓 L鬰", 					{2,1,2645 ,1 }, 	0.7500 * 1000},
			{"Thi猲 Bi課 Ph筸 Thi猲 Quy觧", 					{2,95,247 ,1 }, 	0.5000 * 1000, 1},
			{"Nh﹏ S﹎ v筺 n╩", 					{2,0,796  ,1 }, 	0.3000 * 1000, 1},
			{"Phi誹 Thi猲 Bi課 Ph祅 Tinh", 					{2,95,246 ,1 }, 	2.5000 * 1000},
			{"Чi Nh﹏ s﹎", 					{2,0,553  ,1 }, 	1.1000 * 1000},
			{"Ng?S綾 Th竔 Nhi詍", 					{2,201,13 ,5 }, 	0.2500 * 1000, 1},
			{"Ng?S綾 Th竔 Nhi詍", 					{2,201,13 ,1 }, 	2.5000 * 1000, 1},
			{"Phng V╪ Kh綾 B秐 [Y ph鬰 c蕄 3]", 		{2,95,591 ,1 }, 	0.5000 * 1000, 1},
			{"H?V╪ Kh綾 B秐 [H?trang c蕄 3]", 		{2,95,594 ,1 }, 	0.5000 * 1000, 1},
			{"Long V╪ Kh綾 B秐 [u c蕄 3]", 		{2,95,588 ,1 }, 	0.5000 * 1000, 1},
			{"Hoa V╪ Kh綾 B秐 [Trang s鴆 c蕄 3]", 		{2,95,597 ,1 }, 	1.0000 * 1000, 1},
			{"T骾 Ng﹏ Lng", 						{2,95,649 ,4 }, 	30.0000* 1000},
			{"B錸g Lai Ti猲 Dc", 					{2,95,1503,2 }, 	6.0000 * 1000},
			{"Ti觰 Thi猲 Th筩h Bao", 					{2,95,221 ,1 }, 	5.0000 * 1000},
			{"b竛h 輙 B竎 B秓", 					{2,1,1125 ,1 }, 	5.5000 * 1000},
			{"C鰑 chuy觧 h錳 h錸 n", 					{1,0,32   ,1 }, 	6.0000 * 1000},
			{"B竎h Hoa Th藀 C萴 Nguy謙", 					{1,0,292  ,1 }, 	0.2500 * 1000},
			{"Ti觰 Bao L璾 Kim", 					{2,95,665 ,1 }, 	2.5000 * 1000},
			{"Ti觰 Thi猲 Th筩h Bao", 					{2,95,221 ,1 }, 	8.0000 * 1000},
			{"M秐h H錸g Hoang", 					{2,95,1506,1 }, 	18.5300* 1000},
			{"M秐h H錸g Hoang", 					{2,95,1506,2 }, 	5.0000 * 1000},
			{"M秐h H錸g Hoang", 					{2,95,1506,5 }, 	2.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 			{2,95,1515,1 }, 	0.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 			{2,95,1515,4 }, 	0.0000 * 1000},
			{"M秐h Ngo筰 Trang 乵 H錸 L璾 Kim", 			{2,95,1515,25}, 	0.0000 * 1000},
		},
	},
};


tExp = {  -- 过关默认基础经验，1为普通模式，2为英雄模式; 二级下标为关卡数，1-5是正常关卡，6号是作弊模式
	[1]={
		2000000 ,
		2200000 ,
		3000000 ,
		3300000 ,
		3600000 ,
		14100000 ,
	},
	[2]={ 
		3000000 ,
		3300000 ,
		3900000 ,
		4200000 ,
		4500000 ,
		18900000 ,
	},
}
tAward = {   -- 翻牌奖励字段，1为普通模式，2为英雄模式
	[1] = {
		"JD_free1",
		"JD_IB1",
	},
	[2] = {
		"YXJD_free1",
		"YXJD_IB1",
	}
}
tCostItem = {2, 97, 236, 2 , "不足2个天骄令"} -- 翻牌需要的物品