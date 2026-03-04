--一些公共数据
Include("\\script\\lib\\floyd.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\time.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalvalue.lua")

g_nDebugVersion = 0;   --debug版本

FIELD_PVP_RELAY_KEY = "FIELD_PVP_CAMP_CHARM"; --人气值

--三个势力地图ID
tMainMapID = {{5074,"拜火","圣灵城"},{5076,"女真","黄龙府"},{5075,"西夏","兴庆"},{5077,"云中","云中"},{6400,"天阴圣地","天阴圣地"},{5078,"红莲山","红莲山"},{5079,"葬雪城","葬雪城"}};
--阵营
CampOne = "yp_dali"; 		--阵营1类型，包括npc--拜火教
CampTwo = "yp_xx";  		--阵营2类型，包括npc--西夏
CampThree = "yp_tubo";	--阵营3类型，包括npc--女真
CampNeutral = "yp_zhuli";		--中立npc阵营类型
CampJiangYou = "yp_jiangyou"; --酱油团，跟以上都是同盟

tAllCamp = {
	[1] = CampOne,
	[2] = CampTwo,
	[3] = CampThree,
	[4] = CampNeutral,
	[5] = CampJiangYou,
};

--临时重生点
tTempRev = {
	[1] = {--拜火圣灵城=5074
		[5074] = {5074,1611,3344},
		[5076] = {5077,1603,3353},
		[5075] = {5077,1603,3353},
		[5077] = {5077,1603,3353},
		[5078] = {5077,1603,3353},
		[5079] = {5077,1603,3353},		
		[6400] = {5077,1603,3353},
	},
	[2] = {--女真黄龙府=5076
		[5074] = {5077,1585,3352},
		[5076] = {5076,1835,3660},
		[5075] = {5077,1585,3352},
		[5077] = {5077,1585,3352},
		[5078] = {5077,1603,3353},	
		[5079] = {5077,1603,3353},			
		[6400] = {5077,1585,3352},
	},
	[3] = {--西夏--兴庆=5075
		[5074] = {5077,1593,3364},
		[5076] = {5077,1593,3364},
		[5075] = {5075,1483,2644},
		[5077] = {5077,1593,3364},
		[5078] = {5077,1603,3353},	
		[5079] = {5077,1603,3353},			
		[6400] = {5077,1593,3364},
	},
	[5] = {--进入坐标
		[5074] = {5077,1593,3364},
		[5076] = {5077,1593,3364},
		[5075] = {5077,1593,3364},
		[5077] = {5077,1593,3364},
		[5078] = {5077,1603,3353},	
		[5079] = {5077,1603,3353},			
		[6400] = {5077,1593,3364},
	},
};

tNpcs = {
	[5074] = {
		cdz1 = {"拜火教传道者1", "拜火教第一传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz2 = {"拜火教传道者2", "拜火教第二传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz3 = {"拜火教传道者3", "拜火教第三传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz4 = {"拜火教传道者4", "拜火教第四传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz5 = {"拜火教传道者5", "拜火教第五传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz6 = {"拜火教传道者6", "拜火教第六传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz7 = {"拜火教传道者7", "拜火教第七传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz8 = {"拜火教传道者8", "拜火教第八传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		cdz9 = {"拜火教传道者8", "拜火教第九传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampOne, 0},
		chd = {"柴火点", "柴火点", nil,910, CampPlayer, 0},
		army1 = {"圣灵城住持", "拜火圣灵城住持", "\\script\\missions\\yp\\tls\\mission.lua", 900, CampOne, 0, "\\script\\missions\\yp\\tls\\mission.lua"},
		army2 = {"圣灵城执事1", "圣灵城执事", "\\script\\missions\\yp\\army_npc.lua", 900, CampOne, 0},
		army3 = {"圣灵城执事2", "圣灵城执事", "\\script\\missions\\yp\\army_npc.lua", 900, CampOne, 0},
				
		bt = {"镇远镖局镖头","折冲镖局镖头","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampOne,0},
--		qhys = {"青海盐商","青海盐商","\\script\\missions\\yp\\qhys_npc.lua",nil,CampOne,0},
			
		tree1 = {"太虚古树1", "太虚古树", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		tree2 = {"太虚古树2", "太虚古树", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		tree3 = {"太虚古树3", "太虚古树", "\\script\\missions\\yp\\tls\\tree_npc.lua", nil, CampOne, 0},
		dqh = {"段轻侯","塞东恩","\\script\\missions\\yp\\dqh_npc.lua", nil, CampOne, 0},--偷书得
		dqr = {"段轻人", "闪加", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampOne, 0},--种树得
		dxy = {"段心怡", "喇赤", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampOne, 0},--藏宝得
--		dhf = {"段和丰","段和丰","\\script\\missions\\yp\\dhf_npc.lua", nil, CampOne, 0},
--		db = {"段碧", "段碧", "\\script\\missions\\yp\\db_npc.lua", nil, CampOne, 0},
--		jy1 = {"拜火皇族统军", "拜火皇族统军", nil, nil, CampOne, 0},
--		jy2 = {"段玉儿", "段玉儿", nil, nil, CampOne, 0},
		cnhw = {"天龙寺护卫", "城内护卫", nil, nil, CampOne, 0},
		cnhw2 = {"天龙寺护卫", "城内护卫", nil, nil, CampOne, 0},
		hrhw = {"天龙寺护卫", "城边护卫", nil, nil, CampOne, 0},
		bgy = {"中原储物柜","物品保管人","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
		ydlb = {"中原药店掌柜","药店老板","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
		cf = {"中原马车船夫","车夫","\\script\\missions\\yp\\cf_npc.lua", nil, CampOne, 0},
	},
	[5076] = {--黄龙府
		cdz1 = {"女真传道者1", "女真第一传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz2 = {"女真传道者2", "女真第二传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz3 = {"女真传道者3", "女真第三传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz4 = {"女真传道者4", "女真第四传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz5 = {"女真传道者5", "女真第五传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz6 = {"女真传道者6", "女真第六传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz7 = {"女真传道者7", "女真第七传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz8 = {"女真传道者8", "女真第八传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		cdz9 = {"女真传道者9", "女真第九传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampTwo, 0},
		chd = {"柴火点", "柴火点", nil,910, CampPlayer, 0},
		army1 = {"化生寺住持", "女真赤巴", "\\script\\missions\\yp\\hss\\mission.lua", 900, CampTwo, 0, "\\script\\missions\\yp\\hss\\mission.lua"},
		army2 = {"化生寺执事1", "女真执事", "\\script\\missions\\yp\\army_npc.lua", 900, CampTwo, 0},
		army3 = {"化生寺执事1", "女真执事", "\\script\\missions\\yp\\army_npc.lua", 900, CampTwo, 0},
				
		bt = {"镇远镖局镖头","折冲镖局镖头","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampTwo,0},
--		qhys = {"青海盐商","青海盐商","\\script\\missions\\yp\\qhys_npc.lua",nil,CampTwo,0},
			
		tree1 = {"太虚古树1", "太虚古树", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		tree2 = {"太虚古树2", "太虚古树", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		tree3 = {"太虚古树3", "太虚古树", "\\script\\missions\\yp\\hss\\tree_npc.lua", nil, CampTwo, 0},
		dqh = {"达西翁则","忽松吉针","\\script\\missions\\yp\\dqh_npc.lua", nil, CampTwo, 0},--偷书得
		dqr = {"局本格贵", "沭阳程风", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampTwo, 0},--种树得
		dxy = {"乃冬郭聂", "哈西", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampTwo, 0},--藏宝得
--		dhf = {"都松吉瓦","都松吉瓦","\\script\\missions\\yp\\dhf_npc.lua", nil, CampTwo, 0},
--		db = {"赞普堪布", "赞普堪布", "\\script\\missions\\yp\\db_npc.lua", nil, CampTwo, 0},
--		jy1 = {"李元珍", "李元珍", nil, nil, CampTwo, 0},
--		jy2 = {"萨迦宁布", "萨迦宁布", nil, nil, CampTwo, 0},		
		cnhw = {"化生寺护卫", "城内护卫", nil, nil, CampTwo, 0},
		cnhw2 = {"化生寺护卫", "城内护卫", nil, nil, CampTwo, 0},
		hrhw = {"化生寺护卫", "城边护卫", nil, nil, CampTwo, 0},
		bgy = {"中原储物柜","物品保管人","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},
		ydlb = {"中原药店掌柜","药店老板","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},		
		cf = {"中原马车船夫","车夫","\\script\\missions\\yp\\cf_npc.lua", nil, CampTwo, 0},
	},	
	[5075] = {
		cdz1 = {"西夏明门传道者1", "西夏明门第一传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz2 = {"西夏明门传道者2", "西夏明门第二传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz3 = {"西夏明门传道者3", "西夏明门第三传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz4 = {"西夏明门传道者4", "西夏明门第四传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz5 = {"西夏明门传道者5", "西夏明门第五传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz6 = {"西夏明门传道者6", "西夏明门第六传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz7 = {"西夏明门传道者7", "西夏明门第七传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz8 = {"西夏明门传道者8", "西夏明门第八传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		cdz9 = {"西夏明门传道者9", "西夏明门第九传道者", "\\script\\missions\\yp\\cdz_npc.lua", nil, CampThree, 0},
		chd = {"柴火点", "柴火点", nil,910, CampPlayer, 0},
		army1 = {"西夏征南将军", "西夏征南将军", "\\script\\missions\\yp\\mm\\mission.lua", 900, CampThree, 0, "\\script\\missions\\yp\\mm\\mission.lua"},
		army2 = {"西夏征南军士1", "西夏征南军士", "\\script\\missions\\yp\\army_npc.lua", 900, CampThree, 0},
		army3 = {"西夏征南军士2", "西夏征南军士", "\\script\\missions\\yp\\army_npc.lua", 900, CampThree, 0},
				
		bt = {"镇远镖局镖头","折冲镖局镖头","\\script\\missions\\yp\\biaotou_npc.lua",nil,CampThree,0},
--		qhys = {"青海盐商","青海盐商","\\script\\missions\\yp\\qhys_npc.lua",nil,CampThree,0},
			
		tree1 = {"太虚古树1", "太虚古树", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		tree2 = {"太虚古树2", "太虚古树", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		tree3 = {"太虚古树3", "太虚古树", "\\script\\missions\\yp\\mm\\tree_npc.lua", nil, CampThree, 0},
		dqh = {"李德庆","李德庆","\\script\\missions\\yp\\dqh_npc.lua", nil, CampThree, 0},
		dqr = {"李德翊", "李德翊", "\\script\\missions\\yp\\ldx_npc.lua", nil, CampThree, 0},
		dxy = {"李元亮", "李元亮", "\\script\\missions\\yp\\dxy_npc.lua", nil, CampThree, 0},
		dhf = {"李继明","李继明","\\script\\missions\\yp\\dhf_npc.lua", nil, CampThree, 0},
		db = {"李元旭", "李元旭", "\\script\\missions\\yp\\db_npc.lua", nil, CampThree, 0},
		jy1 = {"少门主", "少门主", nil, nil, CampThree, 0},
		cnhw = {"明门武士", "城内护卫", nil, nil, CampThree, 0},
		cnhw2 = {"明门武士", "城内护卫", nil, nil, CampThree, 0},
		hrhw = {"明门武士", "城边护卫", nil, nil, CampThree, 0},
		bgy = {"中原储物柜","物品保管人","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},
		ydlb = {"中原药店掌柜","药店老板","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},					
		cf = {"中原马车船夫","车夫","\\script\\missions\\yp\\cf_npc.lua", nil, CampThree, 0},
	},
	[5077] = {
		kmds = {"摸金校尉曹啸天","摸金校尉曹啸天","\\script\\missions\\mojin\\entrance_npc.lua",nil,CampNeutral,0},
		qhys = {"前线士官","云中军需官","\\script\\燕云剑戈\\云中\\npc\\军需官.lua",nil,CampNeutral,0},
		xbr = {"寻宝人","寻宝人","\\script\\missions\\yp\\qmy\\mission.lua",nil,CampNeutral,0},
		cf = {"中原马车船夫","车夫","\\script\\missions\\yp\\cf_npc.lua", nil, CampNeutral, 0},
		ck = {"中原储物柜","物品管理员","\\script\\江南区\\泉州\\npc\\物品保管人西.lua", nil, CampNeutral, 0},
		yd = {"中原药店掌柜","药店老板","\\script\\江南区\\泉州\\npc\\药店老板.lua", nil, CampNeutral, 0},
	
	},
}

tPos = {
	[5074] = {--圣灵城
		cdz1 = {{1486,3141}},
		cdz2 = {{1568,3132}},
		cdz3 = {{1642,3086}},
		cdz4 = {{1512,3395}},
		cdz5 = {{1556,3298}},
		cdz6 = {{1688,3260}},
		cdz7 = {{1544,3507}},
		cdz8 = {{1716,3573}},
		cdz9 = {{1766,3470}},
		bt = {{1615,3330}},
--		qhys = {{1538,3151}},
		chd = {
			{1491,3141},
			{1572,3134},
			{1647,3087},
			{1516,3396},
			{1559,3300},
			{1691,3261},
			{1549,3507},
			{1722,3574},
			{1767,3475},	
		},
		army = {{1380,2516}},	
		tree1 = {{1513,3331}},
		tree2 = {{1645,3172}},
		tree3 = {{1701,3546}},
		dqh = {{1621,3413}},
		dqr = {{1677,3328}},
		dxy = {{1593,3374}},
--		dhf = {{1623,2805}},
--		db = {{1592,2780}},
--		jy1 = {{1555,2743}},
--		jy2 = {{1613,2807}},
		cnhw = {{1600,3309}},
		cnhw2 = {{1694,3395}},
		hrhw = {{1644,3426}},
		bgy = {{1593,3348}},
		ydlb = {{1655,3306}},
		cf = {{1704,3361}},
	},
	[5076] = {--黄龙府
		cdz1 = {{1736,3392}},
		cdz2 = {{1826,3399}},
		cdz3 = {{1890,3345}},
		cdz4 = {{1713,3506}},
		cdz5 = {{1793,3482}},
		cdz6 = {{1893,3469}},
		cdz7 = {{1630,3505}},
		cdz8 = {{1693,3593}},
		cdz9 = {{1745,3629}},
		bt = {{1837,3675}},
--		qhys = {{1538,3151}},
		chd = {
			{1741,3393},
			{1830,3401},
			{1896,3347},
			{1717,3506},
			{1800,3482},
			{1901,3470},
			{1630,3502},
			{1699,3597},
			{1748,3628},	
		},
--		army = {{1644,3191}},	
		tree1 = {{1755,3593}},
		tree2 = {{1750,3454}},
		tree3 = {{1878,3356}},
		dqh = {{1877,3586}},
		dqr = {{1931,3581}},
		dxy = {{1845,3664}},
--		dhf = {{1680,3698}},
--		db = {{1672,3640}},
--		jy1 = {{1590,3667}},
--		jy2 = {{1591,3681}},		
		cnhw = {{1835,3617}},
		cnhw2 = {{1798,3570}},
		hrhw = {{1738,3641}},
		bgy = {{1906,3563}},
		ydlb = {{1815,3665}},
		cf = {{1861,3597}},
	},		
	[5075] = {
		cdz1 = {{1736,3393}},
		cdz2 = {{1825,2727}},
		cdz3 = {{1528,2735}},
		cdz4 = {{1232,2918}},
		cdz5 = {{1360,2915}},
		cdz6 = {{1559,2920}},
		cdz7 = {{1179,3138}},
		cdz8 = {{1352,3140}},
		cdz9 = {{1424,3152}},
		bt = {{1467,2643}},
--		qhys = {{1538,3151}},
		chd = {
			{1169,2665},
			{1364,2727},
			{1530,2735},
			{1234,2918},
			{1362,2915},
			{1561,2920},
			{1181,3138},
			{1354,3140},
			{1426,3152},	
		},
		army = {{1274,3020}},	
		tree1 = {{1390,2935}},
		tree2 = {{1508,2872}},
		tree3 = {{1232,2861}},
		dqh = {{1465,2585}},
		dqr = {{1406,2645}},
		dxy = {{1523,2631}},
--		dhf = {{1484,2587}},
--		db = {{1417,2631}},
--		jy1 = {{1160,2714}},		
		cnhw = {{1467,2694}},
		cnhw2 = {{1476,2587}},
		hrhw = {{1423,2685}},
		bgy = {{1462,2706}},
		ydlb = {{1434,2618}},
		cf = {{1486,2681}},
	},
	[5077] = {
		kmds = {{1600,3365}},
		qhys = {{1770,3312}},
		cf =   {{1623,3348}},
		ck =   {{1589,3345}},
		yd =   {{1605,3373}},
		xbr = {{1770,3266}},
	},
} 

if g_nDebugVersion == 1 then
	tCreatTime = {--烤火时间
		100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300		
	};
else
	tCreatTime = {--烤火时间
		1100,1700,2100,
	};
end

tBzPos = { --宝藏的随机点
	[5074] = {--圣灵城
		{1747,3579},{1588,3569},{1603,3508},{1507,3367},{1469,3184},{1566,3136},{1676,3151},{1763,3319},{1698,3501},{1623,3246},
		{1747,3579},{1594,3541},{1595,3492},{1512,3352},{1477,3164},{1579,3121},{1707,3171},{1772,3337},{1675,3511},{1618,3224},
		{1740,3587},{1588,3528},{1595,3492},{1519,3330},{1478,3144},{1589,3105},{1656,3204},{1775,3362},{1534,3316},{1594,3210},
		{1713,3603},{1572,3517},{1587,3478},{1522,3311},{1487,3130},{1600,3088},{1663,3218},{1783,3382},{1545,3306},{1573,3191},
		{1699,3607},{1555,3513},{1579,3463},{1517,3291},{1498,3138},{1616,3074},{1670,3237},{1788,3404},{1549,3290},{1556,3193},
		{1684,3615},{1536,3527},{1562,3451},{1510,3278},{1510,3156},{1634,3077},{1681,3252},{1785,3425},{1551,3270},{1542,3199},
		{1665,3582},{1522,3520},{1548,3438},{1500,3258},{1526,3161},{1637,3086},{1692,3266},{1768,3446},{1562,3254},{1532,3206},
		{1654,3564},{1520,3494},{1531,3424},{1492,3238},{1533,3160},{1646,3096},{1707,3280},{1747,3460},{1575,3261},{1523,3220},
		{1618,3562},{1514,3469},{1514,3407},{1483,3218},{1541,3157},{1653,3107},{1722,3293},{1737,3479},{1588,3269},{1524,3227},
		{1601,3570},{1561,3497},{1505,3387},{1477,3204},{1555,3148},{1665,3135},{1741,3300},{1719,3491},{1601,3266},{1529,3240},
	},
	[5076] = {--黄龙府
		{1711,3375},{1838,3404},{1854,3297},{1931,3385},{1882,3488},{1765,3597},{1703,3471},{1675,3594},{1663,3559},{1617,3483},
		{1713,3380},{1849,3410},{1866,3282},{1927,3400},{1874,3513},{1750,3603},{1700,3486},{1662,3601},{1657,3545},{1608,3467},
		{1724,3395},{1867,3413},{1877,3287},{1921,3411},{1855,3524},{1740,3615},{1703,3504},{1655,3617},{1653,3508},{1604,3446},
		{1741,3400},{1879,3377},{1888,3294},{1912,3425},{1840,3533},{1724,3620},{1711,3514},{1649,3629},{1648,3509},{1624,3514},
		{1758,3391},{1871,3372},{1898,3299},{1904,3422},{1829,3546},{1704,3616},{1717,3525},{1639,3639},{1644,3490},{1614,3532},
		{1772,3390},{1856,3367},{1898,3313},{1898,3402},{1818,3556},{1674,3620},{1714,3539},{1634,3643},{1650,3480},{1720,3588},
		{1782,3393},{1848,3350},{1901,3325},{1876,3425},{1803,3574},{1719,3422},{1708,3553},{1622,3657},{1652,3468},{1743,3594},
		{1797,3396},{1844,3337},{1910,3342},{1878,3437},{1795,3581},{1717,3436},{1703,3568},{1636,3654},{1642,3459},{1750,3609},
		{1809,3397},{1847,3323},{1915,3358},{1882,3455},{1783,3582},{1712,3447},{1697,3578},{1649,3642},{1634,3471},{1749,3624},
		{1819,3402},{1849,3312},{1928,3370},{1882,3471},{1773,3589},{1707,3460},{1686,3589},{1665,3623},{1628,3482},{1738,3640},
	},
	[5075] = {--兴庆
		{1413,2757},{1453,2794},{1492,2772},{1527,2736},{1546,2787},{1536,2683},{1556,2728},{1520,2820},{1530,2858},{1521,2897},
		{1549,2896},{1523,2948},{1477,2928},{1486,2862},{1510,2871},{1465,2901},{1461,2865},{1448,2982},{1471,3017},{1479,3050},
		{1428,3065},{1436,3107},{1394,3131},{1384,3176},{1423,3156},{1369,3088},{1343,3063},{1322,3106},{1342,3138},{1335,3159},
		{1307,3166},{1296,3136},{1272,3174},{1236,3179},{1210,3150},{1178,3141},{1208,3117},{1214,3083},{1248,3080},{1279,3072},
		{1267,3030},{1269,2999},{1244,2962},{1215,2966},{1254,2926},{1253,2901},{1229,2918},{1296,2894},{1313,2853},{1337,2836},
		{1358,2781},{1361,2729},{1343,2697},{1307,2730},{1281,2787},{1262,2827},{1247,2865},{1227,2829},{1239,2695},{1264,2653},
		{1292,2628},{1251,2609},{1215,2626},{1236,2653},{1168,2668},{1141,2700},{1107,2728},{1134,2748},{1171,2764},{1176,2723},
		{1196,2703},{1406,2839},{1402,2803},{1421,2801},{1427,2835},{1439,2871},{1445,2913},{1420,2950},{1417,2996},{1384,3019},
		{1378,3050},{1348,3012},{1350,2973},{1321,2957},{1281,2962},{1338,2917},{1357,2894},{1383,2898},{1401,2936},{1373,2951},
		{1269,2762},{1348,2689},{1386,2774},{1528,2734},{1465,2964},{1450,3009},{1424,3096},{1343,3059},{1290,3046},{1249,2958},
	},
	[5077] = {--云中
		{1792,3605},{1811,3482},{1892,3418},{1845,3341},{1721,3375},{1732,3226},{1646,3237},{1625,3176},{1735,3457},{1734,3295},
		{1805,3617},{1824,3482},{1888,3398},{1844,3354},{1712,3365},{1721,3234},{1656,3225},{1621,3193},{1735,3457},{1741,3266},
		{1819,3611},{1842,3484},{1900,3374},{1842,3373},{1722,3342},{1704,3245},{1665,3209},{1615,3219},{1738,3428},{1729,3226},
		{1836,3603},{1857,3486},{1914,3358},{1836,3384},{1734,3316},{1692,3259},{1670,3198},{1597,3227},{1748,3406},{1741,3213},
		{1848,3599},{1875,3490},{1919,3342},{1815,3394},{1744,3301},{1674,3271},{1675,3183},{1747,3287},{1761,3389},{1754,3195},
		{1848,3583},{1889,3504},{1909,3316},{1801,3393},{1754,3281},{1654,3278},{1674,3162},{1793,3300},{1774,3363},{1749,3179},
		{1836,3568},{1902,3503},{1899,3300},{1779,3388},{1766,3256},{1639,3287},{1661,3157},{1812,3300},{1761,3346},{1745,3157},
		{1826,3547},{1903,3477},{1881,3291},{1769,3379},{1774,3237},{1622,3288},{1659,3168},{1838,3305},{1745,3333},{1741,3137},
		{1821,3530},{1896,3459},{1863,3299},{1762,3364},{1779,3217},{1623,3273},{1649,3173},{1868,3308},{1734,3327},{1730,3124},
		{1807,3505},{1897,3435},{1856,3319},{1750,3361},{1745,3225},{1635,3257},{1636,3171},{1909,3315},{1730,3310},{1770,3106},
	},
	[6400] = {--天阴圣地
		{1642,3196},{1695,3201},{1731,3193},{1786,3190},{1839,3217},{1836,3262},{1891,3259},{1875,3322},{1892,3366},{1839,3413},
		{1818,3353},{1765,3298},{1709,3370},{1636,3302},{1622,3394},{1638,3489},{1636,3445},{1696,3440},{1707,3508},{1756,3501},
		{1737,3558},{1786,3534},{1800,3494},{1845,3483},{1883,3508},{1844,3535},{1812,3581},{1765,3551},{1754,3592},{1788,3606},
		{1837,3610},{1847,3577},{1871,3593},{1873,3620},{1760,3434},{1777,3404},{1742,3296},{1673,3248},{1692,3331},{1640,3525},
		{1698,3611},{1650,3587},{1683,3544},{1826,3377},{1798,3302},{1731,3241},{1790,3222},{1885,3220},{1710,3342},{1670,3417},	
	},
}

tBCRand = {24,72,88,96,100}; --镖车概率

tBiaoChe = {
	{"镖车1","普通镖车"},
	{"镖车2","重要镖车"},
	{"镖车3","军用镖车"},
	{"镖车4","机密镖车"},
	{"镖车5","皇家镖车"},
};

tSeedName = { --树种
	--名字 id 品质随机范围 浇水奖励
	[1] = {{"一等无花子",{2,95,908},{40,50}, 1},{"一等菩提子",{2,95,909},{40,50}, 1}},
	[2] = {{"二等紫檀仙种",{2,95,904},{21,35}, 2},{"二等黄檀仙种",{2,95,905},{21,35}, 2},{"二等紫藤仙种",{2,95,906},{21,35}, 2},{"二等银杏仙种",{2,95,907},{21,35}, 2}},
	[3] = {{"三等樱桃树种",{2,95,900},{11,30}, 3},{"三等桃树树种",{2,95,901},{11,30}, 3},{"三等花椒树种",{2,95,902},{11,30}, 3},{"三等水杉树种",{2,95,903},{11,30}, 3}},
}

tYupoName = {
	{"特品虚空玉魄",{2,95,913},32},
	{"一品莫邪玉魄",{2,95,912},21},
	{"二品秀泽玉魄",{2,95,911},17},
	{"三品冰心玉魄",{2,95,910},0},
}

tPlantInfo = {}; --玩家的太虚树info缓存

tPVPItemInfo = {
	{"金陵酒",2,95,822},      --1
	{"藏剑秘传心经",2,95,823},--2
	{"百晓生秘法",2,95,824},	--3
	{"金刚经",2,95,825},			--4
	{"武林盟信物",2,95,935},--5
	{"太虚化形丹",2,95,914},	--6
	{"凤精丹",2,95,916},	--7
	{"藏宝图",2,95,917},	--8
	{"换镖令",2,95,918}, --9	
	{"普通镖车的镖旗",2,95,919},	--10
	{"重要镖车的镖旗",2,95,920},	--11
	{"军用镖车的镖旗",2,95,921},	--12
	{"机密镖车的镖旗",2,95,922},	--13
	{"皇家镖车的镖旗",2,95,923},	--14
	{"武林盟徽章",2,95,924},	--15
	{"义气酒",2,95,925},		--16
	{"藏宝图",	2,95,926},  --17
	{"宝藏铁锹",	2,95,927},	--18
	{"西夏宝珠",	2,95,928},  --19
	{"拜火绸缎",	2,95,929},	--20
	{"女真毛皮",	2,95,930},	--21
	{"珍品宝藏",	2,95,931},	--22
	{"貔貅宝藏",	2,95,932},	--23
	{"遗物宝藏",	2,95,933},	--24
	{"惊世宝藏",	2,95,934},	--25
	{"武林盟表彰信",	2,95,936}, --26
	{"明门宝藏",	2,97,33},	--27
	{"圣灵城宝藏",	2,97,34},	--28
	{"黄龙府宝藏",	2,97,35},	--29	
};

tRewardTime = { --赏金时间
	{1600,1630},{2200,2230},
};

--赏金道具效果
tRewardBox = {--模板名 npc名 状态名称 效果描述 魔法属性字符串 数值 持续时间
	{"武器架野外","武器架",1787,3508,"攻击","攻击力提高100%, 持续30秒","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"盾牌架野外","盾牌架",1775,3411,"防御","承受伤害减半概率100%, 持续30秒","state_receive_half_damage",100,30},
	{"绿树叶野外","绿树叶",1775,3666,"治疗","每秒恢复10%的生命, 持续30秒","state_life_per_per8f",500,30},
	{"飞鞋野外","飞鞋",1851,3527,"隐藏","遁去行踪, 持续30秒","state_illusion_latent",0,30},
};

-----------------------------------公共函数------------------------------------------
function yp_CreateMonster(npc, pos, way, nAiType)
	local model, name = npc[1], npc[2];
	local m = this.msPosition:getMapID();
	local newnpc = 0;
	if type(pos[1]) ~= "table" then
		pos = {pos};
	end
	for i = 1, getn(pos) do
		local x, y = pos[i][1], pos[i][2];
		newnpc = CreateNpc(model, name, m, x, y);
		if npc[3] then
			SetNpcScript(newnpc, npc[3]);
		end
		if npc[4] then
			SetNpcLifeTime(newnpc, npc[4]);
		end
		if npc[5] then
			SetCampToNpc(newnpc, npc[5]);
		end
		if npc[6] then
			SetNpcDir(newnpc, npc[6]);
		end
		if npc[7] then
			SetNpcRemoveScript(newnpc, npc[7]);
		end		
		SetNpcActivator(newnpc);
		if way then
			nAiType = nAiType or AT_SM_ATTACK;
			g_NpcAI:setAI(newnpc, nAiType);
			g_NpcAI:setWayPoint(newnpc, way);
		end
	end
	return newnpc;
end

function yp_fire_OnTimer()
--	Msg2Player("yp_fire_OnTimer");
	local nTime = tonumber(date("%H%M"));
	local m,x,y = GetWorldPos();
	if m ~= 5074 and m ~= 5076 and m ~= 5075 then
		return 0;
	end
	for i = 1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 and GetMissionV(12) == i then --15分钟内
			local nMapID,nPosX,nPosY = GetWorldPos();
			local nDistance = 0;
			if tPos[nMapID] == nil then
				return 0;
			end
			for j = 1,getn(tPos[nMapID].chd) do
				local n = abs(nPosX-tPos[nMapID].chd[j][1])+abs(nPosY-tPos[nMapID].chd[j][2]);
				if nDistance == 0 or n < nDistance then
					nDistance = n;
				end
			end
			
--			Msg2Player("nDistance:"..nDistance)
			if nDistance > 32 then
				return 0;
			end
			--判断是否打坐
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			local nNpcState = GetNpcBehaveStatus(nPidxNpc);
			if nNpcState ~= 13 and GetTime() - GetTask(TASK_FIELD_PVP_DRINK) > 20*60 then --打坐
				return 0;
			end
			local nTeamSize = GetTeamSize();
			local nExp = floor(GetLevel()*GetLevel()*2*(1+nTeamSize/10));
			local nMpExp = 36;
			if GetTime() - GetTask(TASK_FIELD_PVP_DRINK) < 20*60 and GetTask(TASK_FIELD_PVP_DRINK) ~= 0 then --20分钟
				local nRand = random(1,100);
				if nRand <= 90 then
					nExp = 3*nExp;
				else
					nExp = 5*nExp;
					SetCurrentNpcSFX(nPidxNpc,972,1,0);
				end
				nMpExp = 72;
			end
--			MP_MasterAddPoint(nMpExp);
			gf_Modify("Exp",nExp);
		end
	end	
end

function yp_ChooseArmy()
	local nRand = random(1,3);
	SetGlbValue(GLV_YP_CHOOSE_ARMY,nRand);
end

--1:贡献度，2：pvp点数，3：精力值，4：对战经验，5：三国势力声望，6：武林盟声望
function yp_setValue(nType,Value)
	yp_clearPlayerData();
	local tTaskID = {TASK_FIELD_PVP_GXD, TASK_FIELD_PVP_COUNT, 12345678, TASK_BIWU_DUIZHAN_JINGYAN};
	local strMsg = {"贡献度","PVP点数","精力值","对战经验","武林盟声望"};
	if nType == 5 then
		--程序接口
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp >=1 and nCamp <= 3 then
			AddPop(nCamp, Value);
		else
			print(GetName(),"yp_setValue",nType,Value,"error camp")
		end
	elseif nType == 6 then
		AddPop(4, Value);
	elseif nType == 3 then
		ModifyEnergy(Value, 1)
	else
		local nCurTask = tTaskID[nType];
		if nCurTask then
			if nType == 4 then
				SetTask(nCurTask,GetTask(nCurTask)+Value, 21);
			else
				SetTask(nCurTask,GetTask(nCurTask)+Value);
			end
			if Value > 0 then
				Msg2Player("您获得了["..strMsg[nType].."]"..Value.."点！");
			elseif Value < 0 then
				Msg2Player("您消耗了["..strMsg[nType].."]"..abs(Value).."点！");
			end
		end
	end
end

function yp_getValue(nType)
	yp_clearPlayerData();
	local tTaskID = {TASK_FIELD_PVP_GXD, TASK_FIELD_PVP_COUNT, 12345678, TASK_BIWU_DUIZHAN_JINGYAN};
	if nType == 5 then
		--程序接口
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if nCamp >=1 and nCamp <= 3 then
			return GetPop(nCamp);
		else
			print("yp_setValue",nType,Value,"error camp")
		end
		return 0;
	elseif nType == 6 then
		return GetPop(4);
	elseif nType == 3 then
		local nCur, nMax = ModifyEnergy(0, 1)
		return nCur
	else
		local nCurTask = tTaskID[nType];
		if nCurTask then
			return GetTask(nCurTask);
		end
		return 0;
	end
end

function yp_clearPlayerData()
	local nCurWeek = tf_GetWeekSequence(1,0);
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_FIELD_PVP_CLEAR_TIME) < nDate then
		gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,0); --当天偷经书任务的次数
		SetTask(TASK_FIELD_PVP_CLEAR_TIME,nDate);
	end
	if GetTask(TASK_FIELD_PVP_CLEAR_DATA) < nCurWeek then
		SetTask(TASK_FIELD_PVP_GXD,0);
		SetTask(TASK_FIELD_PVP_CLEAR_DATA,nCurWeek);
	end
end

function yp_addCharm(nType,nAddNum,nSpe)
	SetPlayerScript("\\script\\missions\\yp\\dhx_npc.lua");
	if nSpe then
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua",format("dhx_addCharm2(%d,%d)",nType,nAddNum));		
	else
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua",format("dhx_addCharm(%d,%d)",nType,nAddNum));		
	end
end

--赏金时间
function yp_checkRewardTime()
	local nCurTime = tonumber(date("%H%M"));
	for i = 1,getn(tRewardTime) do
		if nCurTime >= tRewardTime[i][1] and nCurTime <= tRewardTime[i][2] then
			return i;
		end
	end
	return 0;
end

--地图触发器
g_nRectCostomerID = 3007*2;
g_nRectTriggerID = 3007;
function yp_onMapJoin()
--	print("yp_onMapJoin")
	yp_onLogin();
end

function yp_onEnterMap()
	SetPKFlag(0);
	ForbidChangePK(1);
end

function yp_onLeaveMap()
	ForbidChangePK(0);
end

--登陆触发器
g_nLoginCostomerID = 3012*2;
g_nLoginTriggerID = 3012;
function yp_onLogin()
--	print("yp_onLogin")
	local m,x,y = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	yp_ProcessTrigger(m, nCamp);
	local nType = 0;	
	for i = 1,getn(tMainMapID) do
		if tMainMapID[i][1] == m then
			nType = i
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tScript = {
		"\\script\\missions\\yp\\tls\\mission.lua",
		"\\script\\missions\\yp\\hss\\mission.lua",
		"\\script\\missions\\yp\\mm\\mission.lua",
		"\\script\\missions\\yp\\qmy\\mission.lua",
		"\\script\\missions\\yp\\tysd\\mission.lua",
		"\\script\\missions\\yp\\hls\\mission.lua",
		"\\script\\missions\\yp\\zxc\\mission.lua"
	}
	SetPlayerScript(tScript[nType]);
	SendScript2VM(tScript[nType],"this:onLogin("..nCamp..")");	
end

--势力界面显示相关介绍
function yp_c2s_detail()
	local strtab = {
		"智夺经书/#yp_c2s_detail2(1)",
		"挖宝藏/#yp_c2s_detail2(2)",
		"幻境秘果/#yp_c2s_detail2(3)",
		"西域传道/#yp_c2s_detail2(4)",
		"押镖劫镖/#yp_c2s_detail2(5)",
		"结束对话/nothing"	
	};
	Say("邪恶势力入侵中原领土，西夏、女真、拜火三方势力分崩离析，乱世枭雄谁主沉浮？征战的号角已经吹响，反击的鼓声已经擂起！保卫西域的同僚，守护共同的家园，勇闯逆境才是武林侠士的宿命，快来加入吧！",
		getn(strtab),
		strtab)
end

function yp_c2s_detail2(nType)
	local strMsg = {
			"每天任意时间，玩家都可以在本势力接取智夺经书任务，每次消耗5点精力值。",
			"每天17点和21点，在中立地图会有神秘的寻宝人现身，据说他已寻觅到天阴教埋藏宝物之处，快去他那里打听一下宝物的下落吧。\n",
			"每个势力地图都有3棵太虚古树。在种植期间，可以前往本方任务NPC处接取偷取太虚古树和种植太虚古树的任务，接取任务消耗5点精力值，完成后可领取任务奖励，并增加本方势力人气值2点。",
			"每个势力地图都有9个传道者。当传道开始后，传道者会点燃柴火点，快去烤火吧！",
			"每日任意时间，玩家可在本方势力的镇远镖局镖头处领取镖车，每次领取镖车消耗15点精力值，每日限制完成3次运镖任务。",
		}
	Talk(1,"yp_c2s_detail",strMsg[nType]);
end

--势力界面获得人气值
function yp_c2s_getRqz()
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	tbPVPCharm:reflash();
	tbPVPCharm:apply("\\script\\missions\\yp\\yp_head.lua","yp_c2s_getRqz_CallBack");	
end

function yp_c2s_getRqz_CallBack(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nRqz = 0;
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 then
		nRqz = tbPVPCharm[0][2+nCamp];
	end
	SendScript2Client(format("UpdateWindow('pvp',%d)",nRqz))
end

function yp_dailyClean()
	SetTask(TASK_FIELD_PVP_CAR_TASK, 0);
	SetTask(TASK_FIELD_PVP_CAR_BIAOLING, 0);
	SetTask(TASK_FIELD_PVP_CAR_DAILY_NUM, 0);
	SetTask(TASK_FIELD_PVP_FIREBOX_NUM, 0);
end

function yp_weeklyClean()
	SetTask(TASK_FIELD_PVP_GXD_WARD, 0);
end

function yp_get_camp()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	return nCamp
end
function yp_get_camp_name(nCamp)
	local tCamp = tMainMapID[nCamp]
	if tCamp then
		return tCamp[2]
	end
	return ""
end
function yp_get_camp_pop()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp >= 1 and nCamp <= 3 then
		return GetPop(nCamp-1)
	end
	return 0
end

function yp_ProcessTrigger(m, nCamp)
	local tWhiteList = {
		[425] = 1, 
		[5074] = 1, 
		[5075] = 1, 
		[5076] = 1, 
		[5077] = 1, 
		[5078] = 1, 
		[5079] = 1,
	};
	if tWhiteList[m] then
		local tChannel = {
			[1] = "大理势力",
			[2] = "吐蕃势力",
			[3] = "西夏势力",
		}
		if not tChannel[nCamp] then
			return 0;
		end
		EnterChannel(tChannel[nCamp]);
	else
		LeaveChannel("大理势力");
		LeaveChannel("吐蕃势力");
		LeaveChannel("西夏势力");
	end
end