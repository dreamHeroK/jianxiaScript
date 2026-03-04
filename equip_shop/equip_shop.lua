--脚本名称：
--脚本功能：
--功能策划：盾盾
--功能开发：朱力
--开发时间：2011-05-27
--代码修改记录

Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\huofengtask\\equip_shop_call_back.lua")
--  local nEquipPos = 10; --获取装备索引
-- local nId1,nId2,nId3 = GetPlayerEquipInfo(nEquipPos); --获取外装衣服id
--  local sItemName = GetItemName(nId1,nId2,nId3)
--  Msg2Player(""..nId2..""..sItemName.."");
-- 0  头部
-- 1  衣服
-- 2  武器
-- 3  裤子
-- 4  首饰1
-- 5  首饰2
-- 6  外装头部
-- 7  外装衣服
-- 8  外装下装
-- 9  副秘籍
-- 10  坐骑
-- 11  主秘籍
-- 12  暗器宠物
-- 17  披风
-- 18  令牌徽章
-- 19  五行天仪
-- 20  侠义令
-- 21  挂件头部
-- 22  挂件肩部
-- 23  挂件足部
-- 24  纹饰头部
-- 25  纹饰衣服
-- 26  纹饰裤子
-- 27  纹饰首饰1
-- 28  纹饰首饰2
g_tItemDetail2EquipPos = {
	[100]	= 1,
	[101]	= 3,
	[102]	= 4,
	[103]	= 0,
	[105]	= 10,
	[107]	= 11,
	[108]	= 6,
	[109]	= 7,
	[110]	= 8,
	[112]	= 9,
--	[113]	= 18,
--	[114]	= 19,
--	[115]	= 20,
--	[116]	= 17,
--	[117]	= 22,
--	[118]	= 23,
--	[119]	= 24,
--	[120]	= 25,
--	[121]	= 26,
	--三件套
	[152]	= 17,--披风
	[153]	= 18,--徽章
	[154]	= 19,--鞋
	[155]	= 20,--令牌
};

function get_gdp_id(nG, nD, nP)
	if not nG or 0 > nG or nG > 255		then return	0;	end
	if not nD or 0 > nD or nD > 255		then return	0;	end
	if not nP or 0 > nP or nP > 65535	then return	0;	end

	-- 65536	2^16
	-- 16777216	2^24
	return nG * 16777216 + nD * 65536 + nP;
end

g_tBaguaItem = {
	get_gdp_id(0, 103, 85),
	get_gdp_id(0, 0, 15),
	get_gdp_id(0, 2, 37),
	get_gdp_id(0, 5, 41),
	get_gdp_id(0, 1, 54),
	get_gdp_id(0, 3, 65),
	get_gdp_id(0, 10, 76),
	get_gdp_id(0, 9, 87),
	get_gdp_id(0, 8, 98),
	get_gdp_id(0, 6, 109),
	get_gdp_id(0, 4, 120),
	get_gdp_id(0, 11, 13),
	get_gdp_id(0, 7, 13),
	get_gdp_id(0, 12, 13),
	get_gdp_id(0, 13, 13),
	get_gdp_id(0, 103, 73),
	get_gdp_id(0, 103, 74),
	get_gdp_id(0, 103, 75),
	get_gdp_id(0, 103, 76),
	get_gdp_id(0, 103, 77),
	get_gdp_id(0, 103, 78),
	get_gdp_id(0, 103, 79),
	get_gdp_id(0, 103, 80),
	get_gdp_id(0, 100, 73),
	get_gdp_id(0, 100, 74),
	get_gdp_id(0, 100, 75),
	get_gdp_id(0, 100, 76),
	get_gdp_id(0, 100, 77),
	get_gdp_id(0, 100, 78),
	get_gdp_id(0, 100, 79),
	get_gdp_id(0, 100, 80),
	get_gdp_id(0, 101, 73),
	get_gdp_id(0, 101, 74),
	get_gdp_id(0, 101, 75),
	get_gdp_id(0, 101, 76),
	get_gdp_id(0, 101, 77),
	get_gdp_id(0, 101, 78),
	get_gdp_id(0, 101, 79),
	get_gdp_id(0, 101, 80),
	get_gdp_id(0, 103, 85),
	get_gdp_id(0, 103, 86),
	get_gdp_id(0, 103, 87),
	get_gdp_id(0, 103, 88),
	get_gdp_id(0, 100, 85),
	get_gdp_id(0, 100, 86),
	get_gdp_id(0, 100, 87),
	get_gdp_id(0, 100, 88),
	get_gdp_id(0, 101, 85),
	get_gdp_id(0, 101, 86),
	get_gdp_id(0, 101, 87),
	get_gdp_id(0, 101, 88),
	get_gdp_id(0, 0,   17),
	get_gdp_id(0, 2,   39),
	get_gdp_id(0, 5,   43),
	get_gdp_id(0, 1,   56),
	get_gdp_id(0, 3,   67),
	get_gdp_id(0, 10,  78),
	get_gdp_id(0, 9,   89),
	get_gdp_id(0, 8,   100),
	get_gdp_id(0, 6,   111),
	get_gdp_id(0, 4,   122),
	get_gdp_id(0, 11,  15),
	get_gdp_id(0, 7,   15),
	get_gdp_id(0, 12,  15),
	get_gdp_id(0, 13,  15),
}
g_tBagua100 = {
	get_gdp_id(0,103,18),
	get_gdp_id(0,103,17),
	get_gdp_id(0,103,36),
	get_gdp_id(0,103,35),
	get_gdp_id(0,103,54),
	get_gdp_id(0,103,53),
	get_gdp_id(0,103,72),
	get_gdp_id(0,103,71),
	get_gdp_id(0,100,17),
	get_gdp_id(0,100,18),
	get_gdp_id(0,100,35),
	get_gdp_id(0,100,36),
	get_gdp_id(0,100,53),
	get_gdp_id(0,100,54),
	get_gdp_id(0,100,71),
	get_gdp_id(0,100,72),
	get_gdp_id(0,101,17),
	get_gdp_id(0,101,18),
	get_gdp_id(0,101,35),
	get_gdp_id(0,101,36),
	get_gdp_id(0,101,53),
	get_gdp_id(0,101,54),
	get_gdp_id(0,101,71),
	get_gdp_id(0,101,72),
	get_gdp_id(0,103,77),
	get_gdp_id(0,103,78),
	get_gdp_id(0,103,79),
	get_gdp_id(0,103,80),
	get_gdp_id(0,103,81),
	get_gdp_id(0,103,82),
	get_gdp_id(0,103,83),
	get_gdp_id(0,103,84),
	get_gdp_id(0,100,77),
	get_gdp_id(0,100,78),
	get_gdp_id(0,100,79),
	get_gdp_id(0,100,80),
	get_gdp_id(0,100,81),
	get_gdp_id(0,100,82),
	get_gdp_id(0,100,83),
	get_gdp_id(0,100,84),
	get_gdp_id(0,101,77),
	get_gdp_id(0,101,78),
	get_gdp_id(0,101,79),
	get_gdp_id(0,101,80),
	get_gdp_id(0,101,81),
	get_gdp_id(0,101,82),
	get_gdp_id(0,101,83),
	get_gdp_id(0,101,84),
	get_gdp_id(0,3,64),
	get_gdp_id(0,8,97),
	get_gdp_id(0,0,14),
	get_gdp_id(0,1,53),
	get_gdp_id(0,2,36),
	get_gdp_id(0,0,14),
	get_gdp_id(0,5,40),
	get_gdp_id(0,2,36),
	get_gdp_id(0,9,86),
	get_gdp_id(0,6,108),
	get_gdp_id(0,4,119),
	get_gdp_id(0,7,12),
	get_gdp_id(0,2,36),
	get_gdp_id(0,13,12),
	get_gdp_id(0,12,12),
	get_gdp_id(0,3,63),
	get_gdp_id(0,8,96),
	get_gdp_id(0,0,13),
	get_gdp_id(0,1,52),
	get_gdp_id(0,2,26),
	get_gdp_id(0,0,13),
	get_gdp_id(0,5,39),
	get_gdp_id(0,2,26),
	get_gdp_id(0,9,85),
	get_gdp_id(0,6,107),
	get_gdp_id(0,4,118),
	get_gdp_id(0,7,11),
	get_gdp_id(0,2,26),
	get_gdp_id(0,13,11),
	get_gdp_id(0,12,11),
}
g_tBagua999 = {
	get_gdp_id(0, 103, 85),-- 天地
	get_gdp_id(0, 103, 86),
	get_gdp_id(0, 103, 87),
	get_gdp_id(0, 103, 88),
	get_gdp_id(0, 100, 85),
	get_gdp_id(0, 100, 86),
	get_gdp_id(0, 100, 87),
	get_gdp_id(0, 100, 88),
	get_gdp_id(0, 101, 85),
	get_gdp_id(0, 101, 86),
	get_gdp_id(0, 101, 87),
	get_gdp_id(0, 101, 88),
	get_gdp_id(0, 2, 10),
	get_gdp_id(0, 2, 11),
	get_gdp_id(0, 2, 12),
	get_gdp_id(0, 2, 13),
	get_gdp_id(0, 3, 120),
	get_gdp_id(0, 0, 120),
	get_gdp_id(0, 8, 120),
	get_gdp_id(0, 1, 120),
	get_gdp_id(0, 2, 120),
	get_gdp_id(0, 10, 120),
	get_gdp_id(0, 0, 121),
	get_gdp_id(0, 5, 120),
	get_gdp_id(0, 2, 121),
	get_gdp_id(0, 9, 120),
	get_gdp_id(0, 6, 120),
	get_gdp_id(0, 4, 122),
	get_gdp_id(0, 7, 120),
	get_gdp_id(0, 11, 120),
	get_gdp_id(0, 2, 122),
	get_gdp_id(0, 3, 121),
	get_gdp_id(0, 9, 121),
	get_gdp_id(0, 11, 121),
	get_gdp_id(0, 13, 120),
	get_gdp_id(0, 12, 120),
	get_gdp_id(0, 103, 22722),-- 凤鸣
	get_gdp_id(0, 103, 22723),
	get_gdp_id(0, 103, 22724),
	get_gdp_id(0, 103, 22725),
	get_gdp_id(0, 103, 22726),
	get_gdp_id(0, 103, 22727),
	get_gdp_id(0, 103, 22728),
	get_gdp_id(0, 103, 22729),
	get_gdp_id(0, 103, 22730),
	get_gdp_id(0, 103, 22731),
	get_gdp_id(0, 103, 22732),
	get_gdp_id(0, 103, 22733),
	get_gdp_id(0, 103, 22734),
	get_gdp_id(0, 103, 22735),
	get_gdp_id(0, 103, 22736),
	get_gdp_id(0, 103, 22737),
	get_gdp_id(0, 103, 22738),
	get_gdp_id(0, 103, 22739),
	get_gdp_id(0, 103, 22740),
	get_gdp_id(0, 103, 22741),
	get_gdp_id(0, 103, 22742),
	get_gdp_id(0, 103, 22743),
	get_gdp_id(0, 103, 22744),
	get_gdp_id(0, 103, 22745),
	get_gdp_id(0, 103, 22746),
	get_gdp_id(0, 103, 22747),
	get_gdp_id(0, 103, 22748),
	get_gdp_id(0, 103, 22749),
	get_gdp_id(0, 103, 22750),
	get_gdp_id(0, 103, 22751),
	get_gdp_id(0, 103, 22752),
	get_gdp_id(0, 103, 22753),
	get_gdp_id(0, 103, 22754),
	get_gdp_id(0, 103, 22755),
	get_gdp_id(0, 103, 22756),
	get_gdp_id(0, 103, 22757),
	get_gdp_id(0, 103, 22758),
	get_gdp_id(0, 103, 22759),
	get_gdp_id(0, 103, 22760),
	get_gdp_id(0, 103, 22761),
	get_gdp_id(0, 103, 22762),
	get_gdp_id(0, 103, 22763),
	get_gdp_id(0, 103, 22764),
	get_gdp_id(0, 103, 22765),
	get_gdp_id(0, 103, 22766),
	get_gdp_id(0, 103, 22767),
	get_gdp_id(0, 103, 22768),
	get_gdp_id(0, 103, 22769),
	get_gdp_id(0, 103, 22770),
	get_gdp_id(0, 103, 22771),
	get_gdp_id(0, 103, 22772),
	get_gdp_id(0, 103, 22773),
	get_gdp_id(0, 103, 22774),
	get_gdp_id(0, 103, 22775),
	get_gdp_id(0, 103, 22776),
	get_gdp_id(0, 103, 22777),
	get_gdp_id(0, 103, 22778),
	get_gdp_id(0, 103, 22779),
	get_gdp_id(0, 103, 22780),
	get_gdp_id(0, 103, 22781),
	get_gdp_id(0, 103, 22782),
	get_gdp_id(0, 103, 22783),
	get_gdp_id(0, 103, 22784),
	get_gdp_id(0, 103, 22785),
	get_gdp_id(0, 103, 22786),
	get_gdp_id(0, 103, 22787),
	get_gdp_id(0, 103, 22788),
	get_gdp_id(0, 103, 22789),
	get_gdp_id(0, 103, 22790),
	get_gdp_id(0, 103, 22791),
	get_gdp_id(0, 100, 22722),
	get_gdp_id(0, 100, 22723),
	get_gdp_id(0, 100, 22724),
	get_gdp_id(0, 100, 22725),
	get_gdp_id(0, 100, 22726),
	get_gdp_id(0, 100, 22727),
	get_gdp_id(0, 100, 22728),
	get_gdp_id(0, 100, 22729),
	get_gdp_id(0, 100, 22730),
	get_gdp_id(0, 100, 22731),
	get_gdp_id(0, 100, 22732),
	get_gdp_id(0, 100, 22733),
	get_gdp_id(0, 100, 22734),
	get_gdp_id(0, 100, 22735),
	get_gdp_id(0, 100, 22736),
	get_gdp_id(0, 100, 22737),
	get_gdp_id(0, 100, 22738),
	get_gdp_id(0, 100, 22739),
	get_gdp_id(0, 100, 22740),
	get_gdp_id(0, 100, 22741),
	get_gdp_id(0, 100, 22742),
	get_gdp_id(0, 100, 22743),
	get_gdp_id(0, 100, 22744),
	get_gdp_id(0, 100, 22745),
	get_gdp_id(0, 100, 22746),
	get_gdp_id(0, 100, 22747),
	get_gdp_id(0, 100, 22748),
	get_gdp_id(0, 100, 22749),
	get_gdp_id(0, 100, 22750),
	get_gdp_id(0, 100, 22751),
	get_gdp_id(0, 100, 22752),
	get_gdp_id(0, 100, 22753),
	get_gdp_id(0, 100, 22754),
	get_gdp_id(0, 100, 22755),
	get_gdp_id(0, 100, 22756),
	get_gdp_id(0, 100, 22757),
	get_gdp_id(0, 100, 22758),
	get_gdp_id(0, 100, 22759),
	get_gdp_id(0, 100, 22760),
	get_gdp_id(0, 100, 22761),
	get_gdp_id(0, 100, 22762),
	get_gdp_id(0, 100, 22763),
	get_gdp_id(0, 100, 22764),
	get_gdp_id(0, 100, 22765),
	get_gdp_id(0, 100, 22766),
	get_gdp_id(0, 100, 22767),
	get_gdp_id(0, 100, 22768),
	get_gdp_id(0, 100, 22769),
	get_gdp_id(0, 100, 22770),
	get_gdp_id(0, 100, 22771),
	get_gdp_id(0, 100, 22772),
	get_gdp_id(0, 100, 22773),
	get_gdp_id(0, 100, 22774),
	get_gdp_id(0, 100, 22775),
	get_gdp_id(0, 100, 22776),
	get_gdp_id(0, 100, 22777),
	get_gdp_id(0, 100, 22778),
	get_gdp_id(0, 100, 22779),
	get_gdp_id(0, 100, 22780),
	get_gdp_id(0, 100, 22781),
	get_gdp_id(0, 100, 22782),
	get_gdp_id(0, 100, 22783),
	get_gdp_id(0, 100, 22784),
	get_gdp_id(0, 100, 22785),
	get_gdp_id(0, 100, 22786),
	get_gdp_id(0, 100, 22787),
	get_gdp_id(0, 100, 22788),
	get_gdp_id(0, 100, 22789),
	get_gdp_id(0, 100, 22790),
	get_gdp_id(0, 100, 22791),
	get_gdp_id(0, 101, 22722),
	get_gdp_id(0, 101, 22723),
	get_gdp_id(0, 101, 22724),
	get_gdp_id(0, 101, 22725),
	get_gdp_id(0, 101, 22726),
	get_gdp_id(0, 101, 22727),
	get_gdp_id(0, 101, 22728),
	get_gdp_id(0, 101, 22729),
	get_gdp_id(0, 101, 22730),
	get_gdp_id(0, 101, 22731),
	get_gdp_id(0, 101, 22732),
	get_gdp_id(0, 101, 22733),
	get_gdp_id(0, 101, 22734),
	get_gdp_id(0, 101, 22735),
	get_gdp_id(0, 101, 22736),
	get_gdp_id(0, 101, 22737),
	get_gdp_id(0, 101, 22738),
	get_gdp_id(0, 101, 22739),
	get_gdp_id(0, 101, 22740),
	get_gdp_id(0, 101, 22741),
	get_gdp_id(0, 101, 22742),
	get_gdp_id(0, 101, 22743),
	get_gdp_id(0, 101, 22744),
	get_gdp_id(0, 101, 22745),
	get_gdp_id(0, 101, 22746),
	get_gdp_id(0, 101, 22747),
	get_gdp_id(0, 101, 22748),
	get_gdp_id(0, 101, 22749),
	get_gdp_id(0, 101, 22750),
	get_gdp_id(0, 101, 22751),
	get_gdp_id(0, 101, 22752),
	get_gdp_id(0, 101, 22753),
	get_gdp_id(0, 101, 22754),
	get_gdp_id(0, 101, 22755),
	get_gdp_id(0, 101, 22756),
	get_gdp_id(0, 101, 22757),
	get_gdp_id(0, 101, 22758),
	get_gdp_id(0, 101, 22759),
	get_gdp_id(0, 101, 22760),
	get_gdp_id(0, 101, 22761),
	get_gdp_id(0, 101, 22762),
	get_gdp_id(0, 101, 22763),
	get_gdp_id(0, 101, 22764),
	get_gdp_id(0, 101, 22765),
	get_gdp_id(0, 101, 22766),
	get_gdp_id(0, 101, 22767),
	get_gdp_id(0, 101, 22768),
	get_gdp_id(0, 101, 22769),
	get_gdp_id(0, 101, 22770),
	get_gdp_id(0, 101, 22771),
	get_gdp_id(0, 101, 22772),
	get_gdp_id(0, 101, 22773),
	get_gdp_id(0, 101, 22774),
	get_gdp_id(0, 101, 22775),
	get_gdp_id(0, 101, 22776),
	get_gdp_id(0, 101, 22777),
	get_gdp_id(0, 101, 22778),
	get_gdp_id(0, 101, 22779),
	get_gdp_id(0, 101, 22780),
	get_gdp_id(0, 101, 22781),
	get_gdp_id(0, 101, 22782),
	get_gdp_id(0, 101, 22783),
	get_gdp_id(0, 101, 22784),
	get_gdp_id(0, 101, 22785),
	get_gdp_id(0, 101, 22786),
	get_gdp_id(0, 101, 22787),
	get_gdp_id(0, 101, 22788),
	get_gdp_id(0, 101, 22789),
	get_gdp_id(0, 101, 22790),
	get_gdp_id(0, 101, 22791),
	get_gdp_id(0, 103, 22894),-- 东凤
	get_gdp_id(0, 103, 22895),
	get_gdp_id(0, 103, 22896),
	get_gdp_id(0, 103, 22897),
	get_gdp_id(0, 103, 22898),
	get_gdp_id(0, 103, 22899),
	get_gdp_id(0, 103, 22900),
	get_gdp_id(0, 103, 22901),
	get_gdp_id(0, 103, 22902),
	get_gdp_id(0, 103, 22903),
	get_gdp_id(0, 103, 22904),
	get_gdp_id(0, 103, 22905),
	get_gdp_id(0, 103, 22906),
	get_gdp_id(0, 103, 22907),
	get_gdp_id(0, 103, 22908),
	get_gdp_id(0, 103, 22909),
	get_gdp_id(0, 103, 22910),
	get_gdp_id(0, 103, 22911),
	get_gdp_id(0, 103, 22912),
	get_gdp_id(0, 103, 22913),
	get_gdp_id(0, 103, 22914),
	get_gdp_id(0, 103, 22915),
	get_gdp_id(0, 103, 22916),
	get_gdp_id(0, 103, 22917),
	get_gdp_id(0, 103, 22918),
	get_gdp_id(0, 103, 22919),
	get_gdp_id(0, 103, 22920),
	get_gdp_id(0, 103, 22921),
	get_gdp_id(0, 103, 22922),
	get_gdp_id(0, 103, 22923),
	get_gdp_id(0, 103, 22924),
	get_gdp_id(0, 103, 22925),
	get_gdp_id(0, 103, 22926),
	get_gdp_id(0, 103, 22927),
	get_gdp_id(0, 103, 22928),
	get_gdp_id(0, 103, 22929),
	get_gdp_id(0, 103, 22930),
	get_gdp_id(0, 103, 22931),
	get_gdp_id(0, 103, 22932),
	get_gdp_id(0, 103, 22933),
	get_gdp_id(0, 103, 22934),
	get_gdp_id(0, 103, 22935),
	get_gdp_id(0, 103, 22936),
	get_gdp_id(0, 103, 22937),
	get_gdp_id(0, 103, 22938),
	get_gdp_id(0, 103, 22939),
	get_gdp_id(0, 103, 22940),
	get_gdp_id(0, 103, 22941),
	get_gdp_id(0, 103, 22942),
	get_gdp_id(0, 103, 22943),
	get_gdp_id(0, 103, 22944),
	get_gdp_id(0, 103, 22945),
	get_gdp_id(0, 103, 22946),
	get_gdp_id(0, 103, 22947),
	get_gdp_id(0, 103, 22948),
	get_gdp_id(0, 103, 22949),
	get_gdp_id(0, 103, 22950),
	get_gdp_id(0, 103, 22951),
	get_gdp_id(0, 103, 22952),
	get_gdp_id(0, 103, 22953),
	get_gdp_id(0, 103, 22954),
	get_gdp_id(0, 103, 22955),
	get_gdp_id(0, 103, 22956),
	get_gdp_id(0, 103, 22957),
	get_gdp_id(0, 103, 22958),
	get_gdp_id(0, 103, 22959),
	get_gdp_id(0, 103, 22960),
	get_gdp_id(0, 103, 22961),
	get_gdp_id(0, 103, 22962),
	get_gdp_id(0, 103, 22963),
	get_gdp_id(0, 100, 22894),
	get_gdp_id(0, 100, 22895),
	get_gdp_id(0, 100, 22896),
	get_gdp_id(0, 100, 22897),
	get_gdp_id(0, 100, 22898),
	get_gdp_id(0, 100, 22899),
	get_gdp_id(0, 100, 22900),
	get_gdp_id(0, 100, 22901),
	get_gdp_id(0, 100, 22902),
	get_gdp_id(0, 100, 22903),
	get_gdp_id(0, 100, 22904),
	get_gdp_id(0, 100, 22905),
	get_gdp_id(0, 100, 22906),
	get_gdp_id(0, 100, 22907),
	get_gdp_id(0, 100, 22908),
	get_gdp_id(0, 100, 22909),
	get_gdp_id(0, 100, 22910),
	get_gdp_id(0, 100, 22911),
	get_gdp_id(0, 100, 22912),
	get_gdp_id(0, 100, 22913),
	get_gdp_id(0, 100, 22914),
	get_gdp_id(0, 100, 22915),
	get_gdp_id(0, 100, 22916),
	get_gdp_id(0, 100, 22917),
	get_gdp_id(0, 100, 22918),
	get_gdp_id(0, 100, 22919),
	get_gdp_id(0, 100, 22920),
	get_gdp_id(0, 100, 22921),
	get_gdp_id(0, 100, 22922),
	get_gdp_id(0, 100, 22923),
	get_gdp_id(0, 100, 22924),
	get_gdp_id(0, 100, 22925),
	get_gdp_id(0, 100, 22926),
	get_gdp_id(0, 100, 22927),
	get_gdp_id(0, 100, 22928),
	get_gdp_id(0, 100, 22929),
	get_gdp_id(0, 100, 22930),
	get_gdp_id(0, 100, 22931),
	get_gdp_id(0, 100, 22932),
	get_gdp_id(0, 100, 22933),
	get_gdp_id(0, 100, 22934),
	get_gdp_id(0, 100, 22935),
	get_gdp_id(0, 100, 22936),
	get_gdp_id(0, 100, 22937),
	get_gdp_id(0, 100, 22938),
	get_gdp_id(0, 100, 22939),
	get_gdp_id(0, 100, 22940),
	get_gdp_id(0, 100, 22941),
	get_gdp_id(0, 100, 22942),
	get_gdp_id(0, 100, 22943),
	get_gdp_id(0, 100, 22944),
	get_gdp_id(0, 100, 22945),
	get_gdp_id(0, 100, 22946),
	get_gdp_id(0, 100, 22947),
	get_gdp_id(0, 100, 22948),
	get_gdp_id(0, 100, 22949),
	get_gdp_id(0, 100, 22950),
	get_gdp_id(0, 100, 22951),
	get_gdp_id(0, 100, 22952),
	get_gdp_id(0, 100, 22953),
	get_gdp_id(0, 100, 22954),
	get_gdp_id(0, 100, 22955),
	get_gdp_id(0, 100, 22956),
	get_gdp_id(0, 100, 22957),
	get_gdp_id(0, 100, 22958),
	get_gdp_id(0, 100, 22959),
	get_gdp_id(0, 100, 22960),
	get_gdp_id(0, 100, 22961),
	get_gdp_id(0, 100, 22962),
	get_gdp_id(0, 100, 22963),
	get_gdp_id(0, 101, 22894),
	get_gdp_id(0, 101, 22895),
	get_gdp_id(0, 101, 22896),
	get_gdp_id(0, 101, 22897),
	get_gdp_id(0, 101, 22898),
	get_gdp_id(0, 101, 22899),
	get_gdp_id(0, 101, 22900),
	get_gdp_id(0, 101, 22901),
	get_gdp_id(0, 101, 22902),
	get_gdp_id(0, 101, 22903),
	get_gdp_id(0, 101, 22904),
	get_gdp_id(0, 101, 22905),
	get_gdp_id(0, 101, 22906),
	get_gdp_id(0, 101, 22907),
	get_gdp_id(0, 101, 22908),
	get_gdp_id(0, 101, 22909),
	get_gdp_id(0, 101, 22910),
	get_gdp_id(0, 101, 22911),
	get_gdp_id(0, 101, 22912),
	get_gdp_id(0, 101, 22913),
	get_gdp_id(0, 101, 22914),
	get_gdp_id(0, 101, 22915),
	get_gdp_id(0, 101, 22916),
	get_gdp_id(0, 101, 22917),
	get_gdp_id(0, 101, 22918),
	get_gdp_id(0, 101, 22919),
	get_gdp_id(0, 101, 22920),
	get_gdp_id(0, 101, 22921),
	get_gdp_id(0, 101, 22922),
	get_gdp_id(0, 101, 22923),
	get_gdp_id(0, 101, 22924),
	get_gdp_id(0, 101, 22925),
	get_gdp_id(0, 101, 22926),
	get_gdp_id(0, 101, 22927),
	get_gdp_id(0, 101, 22928),
	get_gdp_id(0, 101, 22929),
	get_gdp_id(0, 101, 22930),
	get_gdp_id(0, 101, 22931),
	get_gdp_id(0, 101, 22932),
	get_gdp_id(0, 101, 22933),
	get_gdp_id(0, 101, 22934),
	get_gdp_id(0, 101, 22935),
	get_gdp_id(0, 101, 22936),
	get_gdp_id(0, 101, 22937),
	get_gdp_id(0, 101, 22938),
	get_gdp_id(0, 101, 22939),
	get_gdp_id(0, 101, 22940),
	get_gdp_id(0, 101, 22941),
	get_gdp_id(0, 101, 22942),
	get_gdp_id(0, 101, 22943),
	get_gdp_id(0, 101, 22944),
	get_gdp_id(0, 101, 22945),
	get_gdp_id(0, 101, 22946),
	get_gdp_id(0, 101, 22947),
	get_gdp_id(0, 101, 22948),
	get_gdp_id(0, 101, 22949),
	get_gdp_id(0, 101, 22950),
	get_gdp_id(0, 101, 22951),
	get_gdp_id(0, 101, 22952),
	get_gdp_id(0, 101, 22953),
	get_gdp_id(0, 101, 22954),
	get_gdp_id(0, 101, 22955),
	get_gdp_id(0, 101, 22956),
	get_gdp_id(0, 101, 22957),
	get_gdp_id(0, 101, 22958),
	get_gdp_id(0, 101, 22959),
	get_gdp_id(0, 101, 22960),
	get_gdp_id(0, 101, 22961),
	get_gdp_id(0, 101, 22962),
	get_gdp_id(0, 101, 22963),
	get_gdp_id(0, 103, 40070),-- 龙隐
	get_gdp_id(0, 103, 40071),
	get_gdp_id(0, 103, 40072),
	get_gdp_id(0, 103, 40073),
	get_gdp_id(0, 103, 40074),
	get_gdp_id(0, 103, 40075),
	get_gdp_id(0, 103, 40076),
	get_gdp_id(0, 103, 40077),
	get_gdp_id(0, 103, 40078),
	get_gdp_id(0, 103, 40079),
	get_gdp_id(0, 103, 40080),
	get_gdp_id(0, 103, 40081),
	get_gdp_id(0, 103, 40082),
	get_gdp_id(0, 103, 40083),
	get_gdp_id(0, 103, 40084),
	get_gdp_id(0, 103, 40085),
	get_gdp_id(0, 103, 40086),
	get_gdp_id(0, 103, 40087),
	get_gdp_id(0, 103, 40088),
	get_gdp_id(0, 103, 40089),
	get_gdp_id(0, 103, 40090),
	get_gdp_id(0, 103, 40091),
	get_gdp_id(0, 103, 40092),
	get_gdp_id(0, 103, 40093),
	get_gdp_id(0, 103, 40094),
	get_gdp_id(0, 103, 40095),
	get_gdp_id(0, 103, 40096),
	get_gdp_id(0, 103, 40097),
	get_gdp_id(0, 103, 40098),
	get_gdp_id(0, 103, 40099),
	get_gdp_id(0, 103, 40100),
	get_gdp_id(0, 103, 40101),
	get_gdp_id(0, 103, 40102),
	get_gdp_id(0, 103, 40103),
	get_gdp_id(0, 103, 40104),
	get_gdp_id(0, 103, 40105),
	get_gdp_id(0, 103, 40106),
	get_gdp_id(0, 103, 40107),
	get_gdp_id(0, 103, 40108),
	get_gdp_id(0, 103, 40109),
	get_gdp_id(0, 103, 40110),
	get_gdp_id(0, 103, 40111),
	get_gdp_id(0, 103, 40112),
	get_gdp_id(0, 103, 40113),
	get_gdp_id(0, 103, 40114),
	get_gdp_id(0, 103, 40115),
	get_gdp_id(0, 103, 40116),
	get_gdp_id(0, 103, 40117),
	get_gdp_id(0, 103, 40118),
	get_gdp_id(0, 103, 40119),
	get_gdp_id(0, 103, 40120),
	get_gdp_id(0, 103, 40121),
	get_gdp_id(0, 103, 40122),
	get_gdp_id(0, 103, 40123),
	get_gdp_id(0, 103, 40124),
	get_gdp_id(0, 103, 40125),
	get_gdp_id(0, 103, 40126),
	get_gdp_id(0, 103, 40127),
	get_gdp_id(0, 103, 40128),
	get_gdp_id(0, 103, 40129),
	get_gdp_id(0, 103, 40130),
	get_gdp_id(0, 103, 40131),
	get_gdp_id(0, 103, 40132),
	get_gdp_id(0, 103, 40133),
	get_gdp_id(0, 103, 40134),
	get_gdp_id(0, 103, 40135),
	get_gdp_id(0, 103, 40136),
	get_gdp_id(0, 103, 40137),
	get_gdp_id(0, 103, 40138),
	get_gdp_id(0, 103, 40139),
	get_gdp_id(0, 101, 40070),
	get_gdp_id(0, 101, 40071),
	get_gdp_id(0, 101, 40072),
	get_gdp_id(0, 101, 40073),
	get_gdp_id(0, 101, 40074),
	get_gdp_id(0, 101, 40075),
	get_gdp_id(0, 101, 40076),
	get_gdp_id(0, 101, 40077),
	get_gdp_id(0, 101, 40078),
	get_gdp_id(0, 101, 40079),
	get_gdp_id(0, 101, 40080),
	get_gdp_id(0, 101, 40081),
	get_gdp_id(0, 101, 40082),
	get_gdp_id(0, 101, 40083),
	get_gdp_id(0, 101, 40084),
	get_gdp_id(0, 101, 40085),
	get_gdp_id(0, 101, 40086),
	get_gdp_id(0, 101, 40087),
	get_gdp_id(0, 101, 40088),
	get_gdp_id(0, 101, 40089),
	get_gdp_id(0, 101, 40090),
	get_gdp_id(0, 101, 40091),
	get_gdp_id(0, 101, 40092),
	get_gdp_id(0, 101, 40093),
	get_gdp_id(0, 101, 40094),
	get_gdp_id(0, 101, 40095),
	get_gdp_id(0, 101, 40096),
	get_gdp_id(0, 101, 40097),
	get_gdp_id(0, 101, 40098),
	get_gdp_id(0, 101, 40099),
	get_gdp_id(0, 101, 40100),
	get_gdp_id(0, 101, 40101),
	get_gdp_id(0, 101, 40102),
	get_gdp_id(0, 101, 40103),
	get_gdp_id(0, 101, 40104),
	get_gdp_id(0, 101, 40105),
	get_gdp_id(0, 101, 40106),
	get_gdp_id(0, 101, 40107),
	get_gdp_id(0, 101, 40108),
	get_gdp_id(0, 101, 40109),
	get_gdp_id(0, 101, 40110),
	get_gdp_id(0, 101, 40111),
	get_gdp_id(0, 101, 40112),
	get_gdp_id(0, 101, 40113),
	get_gdp_id(0, 101, 40114),
	get_gdp_id(0, 101, 40115),
	get_gdp_id(0, 101, 40116),
	get_gdp_id(0, 101, 40117),
	get_gdp_id(0, 101, 40118),
	get_gdp_id(0, 101, 40119),
	get_gdp_id(0, 101, 40120),
	get_gdp_id(0, 101, 40121),
	get_gdp_id(0, 101, 40122),
	get_gdp_id(0, 101, 40123),
	get_gdp_id(0, 101, 40124),
	get_gdp_id(0, 101, 40125),
	get_gdp_id(0, 101, 40126),
	get_gdp_id(0, 101, 40127),
	get_gdp_id(0, 101, 40128),
	get_gdp_id(0, 101, 40129),
	get_gdp_id(0, 101, 40130),
	get_gdp_id(0, 101, 40131),
	get_gdp_id(0, 101, 40132),
	get_gdp_id(0, 101, 40133),
	get_gdp_id(0, 101, 40134),
	get_gdp_id(0, 101, 40135),
	get_gdp_id(0, 101, 40136),
	get_gdp_id(0, 101, 40137),
	get_gdp_id(0, 101, 40138),
	get_gdp_id(0, 101, 40139),
	get_gdp_id(0, 100, 40070),
	get_gdp_id(0, 100, 40071),
	get_gdp_id(0, 100, 40072),
	get_gdp_id(0, 100, 40073),
	get_gdp_id(0, 100, 40074),
	get_gdp_id(0, 100, 40075),
	get_gdp_id(0, 100, 40076),
	get_gdp_id(0, 100, 40077),
	get_gdp_id(0, 100, 40078),
	get_gdp_id(0, 100, 40079),
	get_gdp_id(0, 100, 40080),
	get_gdp_id(0, 100, 40081),
	get_gdp_id(0, 100, 40082),
	get_gdp_id(0, 100, 40083),
	get_gdp_id(0, 100, 40084),
	get_gdp_id(0, 100, 40085),
	get_gdp_id(0, 100, 40086),
	get_gdp_id(0, 100, 40087),
	get_gdp_id(0, 100, 40088),
	get_gdp_id(0, 100, 40089),
	get_gdp_id(0, 100, 40090),
	get_gdp_id(0, 100, 40091),
	get_gdp_id(0, 100, 40092),
	get_gdp_id(0, 100, 40093),
	get_gdp_id(0, 100, 40094),
	get_gdp_id(0, 100, 40095),
	get_gdp_id(0, 100, 40096),
	get_gdp_id(0, 100, 40097),
	get_gdp_id(0, 100, 40098),
	get_gdp_id(0, 100, 40099),
	get_gdp_id(0, 100, 40100),
	get_gdp_id(0, 100, 40101),
	get_gdp_id(0, 100, 40102),
	get_gdp_id(0, 100, 40103),
	get_gdp_id(0, 100, 40104),
	get_gdp_id(0, 100, 40105),
	get_gdp_id(0, 100, 40106),
	get_gdp_id(0, 100, 40107),
	get_gdp_id(0, 100, 40108),
	get_gdp_id(0, 100, 40109),
	get_gdp_id(0, 100, 40110),
	get_gdp_id(0, 100, 40111),
	get_gdp_id(0, 100, 40112),
	get_gdp_id(0, 100, 40113),
	get_gdp_id(0, 100, 40114),
	get_gdp_id(0, 100, 40115),
	get_gdp_id(0, 100, 40116),
	get_gdp_id(0, 100, 40117),
	get_gdp_id(0, 100, 40118),
	get_gdp_id(0, 100, 40119),
	get_gdp_id(0, 100, 40120),
	get_gdp_id(0, 100, 40121),
	get_gdp_id(0, 100, 40122),
	get_gdp_id(0, 100, 40123),
	get_gdp_id(0, 100, 40124),
	get_gdp_id(0, 100, 40125),
	get_gdp_id(0, 100, 40126),
	get_gdp_id(0, 100, 40127),
	get_gdp_id(0, 100, 40128),
	get_gdp_id(0, 100, 40129),
	get_gdp_id(0, 100, 40130),
	get_gdp_id(0, 100, 40131),
	get_gdp_id(0, 100, 40132),
	get_gdp_id(0, 100, 40133),
	get_gdp_id(0, 100, 40134),
	get_gdp_id(0, 100, 40135),
	get_gdp_id(0, 100, 40136),
	get_gdp_id(0, 100, 40137),
	get_gdp_id(0, 100, 40138),
	get_gdp_id(0, 100, 40139),
	get_gdp_id(0, 103, 40210),-- 苍梧龙隐
	get_gdp_id(0, 103, 40211),
	get_gdp_id(0, 103, 40212),
	get_gdp_id(0, 103, 40213),
	get_gdp_id(0, 103, 40214),
	get_gdp_id(0, 103, 40215),
	get_gdp_id(0, 103, 40216),
	get_gdp_id(0, 103, 40217),
	get_gdp_id(0, 103, 40218),
	get_gdp_id(0, 103, 40219),
	get_gdp_id(0, 103, 40220),
	get_gdp_id(0, 103, 40221),
	get_gdp_id(0, 103, 40222),
	get_gdp_id(0, 103, 40223),
	get_gdp_id(0, 103, 40224),
	get_gdp_id(0, 103, 40225),
	get_gdp_id(0, 103, 40226),
	get_gdp_id(0, 103, 40227),
	get_gdp_id(0, 103, 40228),
	get_gdp_id(0, 103, 40229),
	get_gdp_id(0, 103, 40230),
	get_gdp_id(0, 103, 40231),
	get_gdp_id(0, 103, 40232),
	get_gdp_id(0, 103, 40233),
	get_gdp_id(0, 103, 40234),
	get_gdp_id(0, 103, 40235),
	get_gdp_id(0, 103, 40236),
	get_gdp_id(0, 103, 40237),
	get_gdp_id(0, 103, 40238),
	get_gdp_id(0, 103, 40239),
	get_gdp_id(0, 103, 40240),
	get_gdp_id(0, 103, 40241),
	get_gdp_id(0, 103, 40242),
	get_gdp_id(0, 103, 40243),
	get_gdp_id(0, 103, 40244),
	get_gdp_id(0, 103, 40245),
	get_gdp_id(0, 103, 40246),
	get_gdp_id(0, 103, 40247),
	get_gdp_id(0, 103, 40248),
	get_gdp_id(0, 103, 40249),
	get_gdp_id(0, 103, 40250),
	get_gdp_id(0, 103, 40251),
	get_gdp_id(0, 103, 40252),
	get_gdp_id(0, 103, 40253),
	get_gdp_id(0, 103, 40254),
	get_gdp_id(0, 103, 40255),
	get_gdp_id(0, 103, 40256),
	get_gdp_id(0, 103, 40257),
	get_gdp_id(0, 103, 40258),
	get_gdp_id(0, 103, 40259),
	get_gdp_id(0, 103, 40260),
	get_gdp_id(0, 103, 40261),
	get_gdp_id(0, 103, 40262),
	get_gdp_id(0, 103, 40263),
	get_gdp_id(0, 103, 40264),
	get_gdp_id(0, 103, 40265),
	get_gdp_id(0, 103, 40266),
	get_gdp_id(0, 103, 40267),
	get_gdp_id(0, 103, 40268),
	get_gdp_id(0, 103, 40269),
	get_gdp_id(0, 103, 40270),
	get_gdp_id(0, 103, 40271),
	get_gdp_id(0, 103, 40272),
	get_gdp_id(0, 103, 40273),
	get_gdp_id(0, 103, 40274),
	get_gdp_id(0, 103, 40275),
	get_gdp_id(0, 103, 40276),
	get_gdp_id(0, 103, 40277),
	get_gdp_id(0, 103, 40278),
	get_gdp_id(0, 103, 40279),
	get_gdp_id(0, 100, 40210),
	get_gdp_id(0, 100, 40211),
	get_gdp_id(0, 100, 40212),
	get_gdp_id(0, 100, 40213),
	get_gdp_id(0, 100, 40214),
	get_gdp_id(0, 100, 40215),
	get_gdp_id(0, 100, 40216),
	get_gdp_id(0, 100, 40217),
	get_gdp_id(0, 100, 40218),
	get_gdp_id(0, 100, 40219),
	get_gdp_id(0, 100, 40220),
	get_gdp_id(0, 100, 40221),
	get_gdp_id(0, 100, 40222),
	get_gdp_id(0, 100, 40223),
	get_gdp_id(0, 100, 40224),
	get_gdp_id(0, 100, 40225),
	get_gdp_id(0, 100, 40226),
	get_gdp_id(0, 100, 40227),
	get_gdp_id(0, 100, 40228),
	get_gdp_id(0, 100, 40229),
	get_gdp_id(0, 100, 40230),
	get_gdp_id(0, 100, 40231),
	get_gdp_id(0, 100, 40232),
	get_gdp_id(0, 100, 40233),
	get_gdp_id(0, 100, 40234),
	get_gdp_id(0, 100, 40235),
	get_gdp_id(0, 100, 40236),
	get_gdp_id(0, 100, 40237),
	get_gdp_id(0, 100, 40238),
	get_gdp_id(0, 100, 40239),
	get_gdp_id(0, 100, 40240),
	get_gdp_id(0, 100, 40241),
	get_gdp_id(0, 100, 40242),
	get_gdp_id(0, 100, 40243),
	get_gdp_id(0, 100, 40244),
	get_gdp_id(0, 100, 40245),
	get_gdp_id(0, 100, 40246),
	get_gdp_id(0, 100, 40247),
	get_gdp_id(0, 100, 40248),
	get_gdp_id(0, 100, 40249),
	get_gdp_id(0, 100, 40250),
	get_gdp_id(0, 100, 40251),
	get_gdp_id(0, 100, 40252),
	get_gdp_id(0, 100, 40253),
	get_gdp_id(0, 100, 40254),
	get_gdp_id(0, 100, 40255),
	get_gdp_id(0, 100, 40256),
	get_gdp_id(0, 100, 40257),
	get_gdp_id(0, 100, 40258),
	get_gdp_id(0, 100, 40259),
	get_gdp_id(0, 100, 40260),
	get_gdp_id(0, 100, 40261),
	get_gdp_id(0, 100, 40262),
	get_gdp_id(0, 100, 40263),
	get_gdp_id(0, 100, 40264),
	get_gdp_id(0, 100, 40265),
	get_gdp_id(0, 100, 40266),
	get_gdp_id(0, 100, 40267),
	get_gdp_id(0, 100, 40268),
	get_gdp_id(0, 100, 40269),
	get_gdp_id(0, 100, 40270),
	get_gdp_id(0, 100, 40271),
	get_gdp_id(0, 100, 40272),
	get_gdp_id(0, 100, 40273),
	get_gdp_id(0, 100, 40274),
	get_gdp_id(0, 100, 40275),
	get_gdp_id(0, 100, 40276),
	get_gdp_id(0, 100, 40277),
	get_gdp_id(0, 100, 40278),
	get_gdp_id(0, 100, 40279),
	get_gdp_id(0, 101, 40210),
	get_gdp_id(0, 101, 40211),
	get_gdp_id(0, 101, 40212),
	get_gdp_id(0, 101, 40213),
	get_gdp_id(0, 101, 40214),
	get_gdp_id(0, 101, 40215),
	get_gdp_id(0, 101, 40216),
	get_gdp_id(0, 101, 40217),
	get_gdp_id(0, 101, 40218),
	get_gdp_id(0, 101, 40219),
	get_gdp_id(0, 101, 40220),
	get_gdp_id(0, 101, 40221),
	get_gdp_id(0, 101, 40222),
	get_gdp_id(0, 101, 40223),
	get_gdp_id(0, 101, 40224),
	get_gdp_id(0, 101, 40225),
	get_gdp_id(0, 101, 40226),
	get_gdp_id(0, 101, 40227),
	get_gdp_id(0, 101, 40228),
	get_gdp_id(0, 101, 40229),
	get_gdp_id(0, 101, 40230),
	get_gdp_id(0, 101, 40231),
	get_gdp_id(0, 101, 40232),
	get_gdp_id(0, 101, 40233),
	get_gdp_id(0, 101, 40234),
	get_gdp_id(0, 101, 40235),
	get_gdp_id(0, 101, 40236),
	get_gdp_id(0, 101, 40237),
	get_gdp_id(0, 101, 40238),
	get_gdp_id(0, 101, 40239),
	get_gdp_id(0, 101, 40240),
	get_gdp_id(0, 101, 40241),
	get_gdp_id(0, 101, 40242),
	get_gdp_id(0, 101, 40243),
	get_gdp_id(0, 101, 40244),
	get_gdp_id(0, 101, 40245),
	get_gdp_id(0, 101, 40246),
	get_gdp_id(0, 101, 40247),
	get_gdp_id(0, 101, 40248),
	get_gdp_id(0, 101, 40249),
	get_gdp_id(0, 101, 40250),
	get_gdp_id(0, 101, 40251),
	get_gdp_id(0, 101, 40252),
	get_gdp_id(0, 101, 40253),
	get_gdp_id(0, 101, 40254),
	get_gdp_id(0, 101, 40255),
	get_gdp_id(0, 101, 40256),
	get_gdp_id(0, 101, 40257),
	get_gdp_id(0, 101, 40258),
	get_gdp_id(0, 101, 40259),
	get_gdp_id(0, 101, 40260),
	get_gdp_id(0, 101, 40261),
	get_gdp_id(0, 101, 40262),
	get_gdp_id(0, 101, 40263),
	get_gdp_id(0, 101, 40264),
	get_gdp_id(0, 101, 40265),
	get_gdp_id(0, 101, 40266),
	get_gdp_id(0, 101, 40267),
	get_gdp_id(0, 101, 40268),
	get_gdp_id(0, 101, 40269),
	get_gdp_id(0, 101, 40270),
	get_gdp_id(0, 101, 40271),
	get_gdp_id(0, 101, 40272),
	get_gdp_id(0, 101, 40273),
	get_gdp_id(0, 101, 40274),
	get_gdp_id(0, 101, 40275),
	get_gdp_id(0, 101, 40276),
	get_gdp_id(0, 101, 40277),
	get_gdp_id(0, 101, 40278),
	get_gdp_id(0, 101, 40279),
	get_gdp_id(0,3,23250),-- 武器
	get_gdp_id(0,3,23251),
	get_gdp_id(0,8,23252),
	get_gdp_id(0,8,23253),
	get_gdp_id(0,0,23254),
	get_gdp_id(0,0,23255),
	get_gdp_id(0,1,23256),
	get_gdp_id(0,1,23257),
	get_gdp_id(0,1,23258),
	get_gdp_id(0,1,23259),
	get_gdp_id(0,2,23260),
	get_gdp_id(0,2,23261),
	get_gdp_id(0,10,23262),
	get_gdp_id(0,10,23263),
	get_gdp_id(0,0,23264),
	get_gdp_id(0,0,23265),
	get_gdp_id(0,0,23266),
	get_gdp_id(0,0,23267),
	get_gdp_id(0,5,23268),
	get_gdp_id(0,5,23269),
	get_gdp_id(0,5,23270),
	get_gdp_id(0,5,23271),
	get_gdp_id(0,2,23272),
	get_gdp_id(0,2,23273),
	get_gdp_id(0,2,23274),
	get_gdp_id(0,2,23275),
	get_gdp_id(0,9,23276),
	get_gdp_id(0,9,23277),
	get_gdp_id(0,9,23278),
	get_gdp_id(0,9,23279),
	get_gdp_id(0,6,23280),
	get_gdp_id(0,6,23281),
	get_gdp_id(0,6,23282),
	get_gdp_id(0,6,23283),
	get_gdp_id(0,4,23284),
	get_gdp_id(0,4,23285),
	get_gdp_id(0,4,23286),
	get_gdp_id(0,4,23287),
	get_gdp_id(0,7,23288),
	get_gdp_id(0,7,23289),
	get_gdp_id(0,7,23290),
	get_gdp_id(0,7,23291),
	get_gdp_id(0,11,23292),
	get_gdp_id(0,11,23293),
	get_gdp_id(0,11,23294),
	get_gdp_id(0,11,23295),
	get_gdp_id(0,2,23296),
	get_gdp_id(0,2,23297),
	get_gdp_id(0,3,23298),
	get_gdp_id(0,3,23299),
	get_gdp_id(0,3,23300),
	get_gdp_id(0,3,23301),
	get_gdp_id(0,9,23302),
	get_gdp_id(0,9,23303),
	get_gdp_id(0,9,23304),
	get_gdp_id(0,9,23305),
	get_gdp_id(0,11,23306),
	get_gdp_id(0,11,23307),
	get_gdp_id(0,11,23308),
	get_gdp_id(0,11,23309),
	get_gdp_id(0,13,23310),
	get_gdp_id(0,13,23311),
	get_gdp_id(0,12,23312),
	get_gdp_id(0,12,23313),
	get_gdp_id(0,14,23314),
	get_gdp_id(0,14,23315),
	get_gdp_id(0,14,23316),
	get_gdp_id(0,14,23317),
	get_gdp_id(0,2,23318),
	get_gdp_id(0,2,23319),
	get_gdp_id(0,3,23320),
	get_gdp_id(0,3,23321),
	get_gdp_id(0,8,23322),
	get_gdp_id(0,8,23323),
	get_gdp_id(0,0,23324),
	get_gdp_id(0,0,23325),
	get_gdp_id(0,1,23326),
	get_gdp_id(0,1,23327),
	get_gdp_id(0,1,23328),
	get_gdp_id(0,1,23329),
	get_gdp_id(0,2,23330),
	get_gdp_id(0,2,23331),
	get_gdp_id(0,10,23332),
	get_gdp_id(0,10,23333),
	get_gdp_id(0,0,23334),
	get_gdp_id(0,0,23335),
	get_gdp_id(0,0,23336),
	get_gdp_id(0,0,23337),
	get_gdp_id(0,5,23338),
	get_gdp_id(0,5,23339),
	get_gdp_id(0,5,23340),
	get_gdp_id(0,5,23341),
	get_gdp_id(0,2,23342),
	get_gdp_id(0,2,23343),
	get_gdp_id(0,2,23344),
	get_gdp_id(0,2,23345),
	get_gdp_id(0,9,23346),
	get_gdp_id(0,9,23347),
	get_gdp_id(0,9,23348),
	get_gdp_id(0,9,23349),
	get_gdp_id(0,6,23350),
	get_gdp_id(0,6,23351),
	get_gdp_id(0,6,23352),
	get_gdp_id(0,6,23353),
	get_gdp_id(0,4,23354),
	get_gdp_id(0,4,23355),
	get_gdp_id(0,4,23356),
	get_gdp_id(0,4,23357),
	get_gdp_id(0,7,23358),
	get_gdp_id(0,7,23359),
	get_gdp_id(0,7,23360),
	get_gdp_id(0,7,23361),
	get_gdp_id(0,11,23362),
	get_gdp_id(0,11,23363),
	get_gdp_id(0,11,23364),
	get_gdp_id(0,11,23365),
	get_gdp_id(0,2,23366),
	get_gdp_id(0,2,23367),
	get_gdp_id(0,3,23368),
	get_gdp_id(0,3,23369),
	get_gdp_id(0,3,23370),
	get_gdp_id(0,3,23371),
	get_gdp_id(0,9,23372),
	get_gdp_id(0,9,23373),
	get_gdp_id(0,9,23374),
	get_gdp_id(0,9,23375),
	get_gdp_id(0,11,23376),
	get_gdp_id(0,11,23377),
	get_gdp_id(0,11,23378),
	get_gdp_id(0,11,23379),
	get_gdp_id(0,13,23380),
	get_gdp_id(0,13,23381),
	get_gdp_id(0,12,23382),
	get_gdp_id(0,12,23383),
	get_gdp_id(0,14,23384),
	get_gdp_id(0,14,23385),
	get_gdp_id(0,14,23386),
	get_gdp_id(0,14,23387),
	get_gdp_id(0,2,23388),
	get_gdp_id(0,2,23389),
	get_gdp_id(0,3,40070),
	get_gdp_id(0,3,40071),
	get_gdp_id(0,8,40072),
	get_gdp_id(0,8,40073),
	get_gdp_id(0,0,40074),
	get_gdp_id(0,0,40075),
	get_gdp_id(0,1,40076),
	get_gdp_id(0,1,40077),
	get_gdp_id(0,1,40078),
	get_gdp_id(0,1,40079),
	get_gdp_id(0,2,40080),
	get_gdp_id(0,2,40081),
	get_gdp_id(0,10,40082),
	get_gdp_id(0,10,40083),
	get_gdp_id(0,0,40084),
	get_gdp_id(0,0,40085),
	get_gdp_id(0,0,40086),
	get_gdp_id(0,0,40087),
	get_gdp_id(0,5,40088),
	get_gdp_id(0,5,40089),
	get_gdp_id(0,5,40090),
	get_gdp_id(0,5,40091),
	get_gdp_id(0,2,40092),
	get_gdp_id(0,2,40093),
	get_gdp_id(0,2,40094),
	get_gdp_id(0,2,40095),
	get_gdp_id(0,9,40096),
	get_gdp_id(0,9,40097),
	get_gdp_id(0,9,40098),
	get_gdp_id(0,9,40099),
	get_gdp_id(0,6,40100),
	get_gdp_id(0,6,40101),
	get_gdp_id(0,6,40102),
	get_gdp_id(0,6,40103),
	get_gdp_id(0,4,40104),
	get_gdp_id(0,4,40105),
	get_gdp_id(0,4,40106),
	get_gdp_id(0,4,40107),
	get_gdp_id(0,7,40108),
	get_gdp_id(0,7,40109),
	get_gdp_id(0,7,40110),
	get_gdp_id(0,7,40111),
	get_gdp_id(0,11,40112),
	get_gdp_id(0,11,40113),
	get_gdp_id(0,11,40114),
	get_gdp_id(0,11,40115),
	get_gdp_id(0,2,40116),
	get_gdp_id(0,2,40117),
	get_gdp_id(0,3,40118),
	get_gdp_id(0,3,40119),
	get_gdp_id(0,3,40120),
	get_gdp_id(0,3,40121),
	get_gdp_id(0,9,40122),
	get_gdp_id(0,9,40123),
	get_gdp_id(0,9,40124),
	get_gdp_id(0,9,40125),
	get_gdp_id(0,11,40126),
	get_gdp_id(0,11,40127),
	get_gdp_id(0,11,40128),
	get_gdp_id(0,11,40129),
	get_gdp_id(0,13,40130),
	get_gdp_id(0,13,40131),
	get_gdp_id(0,12,40132),
	get_gdp_id(0,12,40133),
	get_gdp_id(0,14,40134),
	get_gdp_id(0,14,40135),
	get_gdp_id(0,14,40136),
	get_gdp_id(0,14,40137),
	get_gdp_id(0,2,40138),
	get_gdp_id(0,2,40139),
	get_gdp_id(0,3,40210),
	get_gdp_id(0,3,40211),
	get_gdp_id(0,8,40212),
	get_gdp_id(0,8,40213),
	get_gdp_id(0,0,40214),
	get_gdp_id(0,0,40215),
	get_gdp_id(0,1,40216),
	get_gdp_id(0,1,40217),
	get_gdp_id(0,1,40218),
	get_gdp_id(0,1,40219),
	get_gdp_id(0,2,40220),
	get_gdp_id(0,2,40221),
	get_gdp_id(0,10,40222),
	get_gdp_id(0,10,40223),
	get_gdp_id(0,0,40224),
	get_gdp_id(0,0,40225),
	get_gdp_id(0,0,40226),
	get_gdp_id(0,0,40227),
	get_gdp_id(0,5,40228),
	get_gdp_id(0,5,40229),
	get_gdp_id(0,5,40230),
	get_gdp_id(0,5,40231),
	get_gdp_id(0,2,40232),
	get_gdp_id(0,2,40233),
	get_gdp_id(0,2,40234),
	get_gdp_id(0,2,40235),
	get_gdp_id(0,9,40236),
	get_gdp_id(0,9,40237),
	get_gdp_id(0,9,40238),
	get_gdp_id(0,9,40239),
	get_gdp_id(0,6,40240),
	get_gdp_id(0,6,40241),
	get_gdp_id(0,6,40242),
	get_gdp_id(0,6,40243),
	get_gdp_id(0,4,40244),
	get_gdp_id(0,4,40245),
	get_gdp_id(0,4,40246),
	get_gdp_id(0,4,40247),
	get_gdp_id(0,7,40248),
	get_gdp_id(0,7,40249),
	get_gdp_id(0,7,40250),
	get_gdp_id(0,7,40251),
	get_gdp_id(0,11,40252),
	get_gdp_id(0,11,40253),
	get_gdp_id(0,11,40254),
	get_gdp_id(0,11,40255),
	get_gdp_id(0,2,40256),
	get_gdp_id(0,2,40257),
	get_gdp_id(0,3,40258),
	get_gdp_id(0,3,40259),
	get_gdp_id(0,3,40260),
	get_gdp_id(0,3,40261),
	get_gdp_id(0,9,40262),
	get_gdp_id(0,9,40263),
	get_gdp_id(0,9,40264),
	get_gdp_id(0,9,40265),
	get_gdp_id(0,11,40266),
	get_gdp_id(0,11,40267),
	get_gdp_id(0,11,40268),
	get_gdp_id(0,11,40269),
	get_gdp_id(0,13,40270),
	get_gdp_id(0,13,40271),
	get_gdp_id(0,12,40272),
	get_gdp_id(0,12,40273),
	get_gdp_id(0,14,40274),
	get_gdp_id(0,14,40275),
	get_gdp_id(0,14,40276),
	get_gdp_id(0,14,40277),
	get_gdp_id(0,2,40278),
	get_gdp_id(0,2,40279),
	get_gdp_id(0, 0, 124),
	get_gdp_id(0, 1, 124),
	get_gdp_id(0, 2, 124),
	get_gdp_id(0, 3, 124),
	get_gdp_id(0, 4, 124),
	get_gdp_id(0, 5, 124),
	get_gdp_id(0, 6, 124),
	get_gdp_id(0, 7, 124),
	get_gdp_id(0, 8, 124),
	get_gdp_id(0, 9, 124),
	get_gdp_id(0, 10, 124),
	get_gdp_id(0, 11, 124),
	get_gdp_id(0, 12, 124),
	get_gdp_id(0, 13, 124),
	get_gdp_id(0, 14, 124),
	get_gdp_id(0, 103, 120),
	get_gdp_id(0, 103, 121),
	get_gdp_id(0, 103, 122),
	get_gdp_id(0, 103, 123),
	get_gdp_id(0, 103, 124),
	get_gdp_id(0, 103, 125),
	get_gdp_id(0, 103, 126),
	get_gdp_id(0, 103, 127),
	get_gdp_id(0, 100, 120),
	get_gdp_id(0, 100, 121),
	get_gdp_id(0, 100, 122),
	get_gdp_id(0, 100, 123),
	get_gdp_id(0, 100, 124),
	get_gdp_id(0, 100, 125),
	get_gdp_id(0, 100, 126),
	get_gdp_id(0, 100, 127),
	get_gdp_id(0, 101, 120),
	get_gdp_id(0, 101, 121),
	get_gdp_id(0, 101, 122),
	get_gdp_id(0, 101, 123),
	get_gdp_id(0, 101, 124),
	get_gdp_id(0, 101, 125),
	get_gdp_id(0, 101, 126),
	get_gdp_id(0, 101, 127),
}

function get_equip_pos(nD)
	if not nD				then return		end
	if 0 <= nD and 15 >= nD	then return 2;	end
	return g_tItemDetail2EquipPos[nD];
end

--配置的时间单位转换为秒
function config_time_to_sec(nTime)
	local nRet = nTime or 0;
	nRet = nRet * 60 * 60;--配置的时间以小时为单位，转换成秒
	return nRet;
end
Pre_Click_Time1 = 3089; --宝箱A点击时间
Click_Space_time = 1; --2s--箱子点击间隔
function _DoOneExchange(tGoodInfo, tExchangeInfo, uShopId, uGoodID, uExchangeID)
	-- 检查兑换次数
	if GetTime() - GetTask(Pre_Click_Time1) < Click_Space_time then
		Msg2Player(format("服务器繁忙稍等%d秒",Click_Space_time));
		return 
	end
	if 0 < tGoodInfo.AwardTimes[1] then
		local nTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		if nTaskValue >= tGoodInfo.AwardTimes[2] then
			Talk(1, "", format("你的兑换次数已满%d次，不能兑换[%s]。", tGoodInfo.AwardTimes[2], tGoodInfo.Name));
			return 0
		end
	end

	-- 检查变量限制
	local bCheckLimitVaild	= 1;
	for _, tLimitTask in tExchangeInfo.LimitTask do
		if 1 ~= bCheckLimitVaild then
			break;
		end

		if 0 < tLimitTask[1] then
			local nTaskValue	= GetTask(tLimitTask[1]);
			local bNeedProcess	= 1;

			------------------
			-- 特殊处理
			if 704 == tLimitTask[1] then
				if 0 < tLimitTask[2] and tLimitTask[2] > nTaskValue then
					bCheckLimitVaild = 0;
					break;
				end
				if 0 > tLimitTask[2] and tLimitTask[2] < nTaskValue then
					bCheckLimitVaild = 0;
					break;
				end
				bNeedProcess	= 0;
			end
			-- 特殊处理
			------------------

			if 1 == bNeedProcess then
				if 0 < tLimitTask[2] and tLimitTask[2] > nTaskValue then -- 最小值
					bCheckLimitVaild = 0;
					break;
				end
				if 0 < tLimitTask[3] and tLimitTask[3] < nTaskValue then -- 最大值
					bCheckLimitVaild = 0;
					break;
				end
			end
		end
	end

	for _, tCostTask in tExchangeInfo.CostTask do
		if 1 ~= bCheckLimitVaild then
			break;
		end
		if 0 < tCostTask[1] then
			local nTaskValue	= GetTask(tCostTask[1]);
			if tCostTask[2] > nTaskValue then
				bCheckLimitVaild = 0;
				break;
			end
		end
	end

	if 1 ~= bCheckLimitVaild then
		Talk(1, "", format("你不满足“%s”，不能兑换[%s]。", tExchangeInfo.LimitDesc, tGoodInfo.Name));
		return 0
	end

	-- 检查钱
	for _, tCostMoney in tExchangeInfo.CostMoney do
    	if tCostMoney[1] ~= 0 then
    		local nCoin = GetVMoney(tCostMoney[1]);
    		if tCostMoney[2] > nCoin then
    			Talk(1, "", format("你没有足够的银两，不能兑换[%s)]。", tGoodInfo.Name));
				return 0
    		end
    	end
    end

	-- 检查物品限制
	local tEquipInfo		= {};
	local nEquipPos			= 0;
	local nEquipIDX			= 0;
	local nEquipEnhance		= 0;
	local nEquipEnhanceFail = 0;
	local nEquipLingqi		= 0;
	local nEquipDing5		= 0;
	local nEquipDing7		= 0;
	local nEquipDing10		= 0;
	local tItemTemplate		= GetItemTemplateInfo(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3]);
	local nFreeRoom			= GetFreeItemRoom();
	local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight();
	local nNeedRoom			= ((0 == tGoodInfo.AwardItem[1] or 0 >= tItemTemplate.StackCount) and tGoodInfo.AwardItem[4]) or ceil(tGoodInfo.AwardItem[4] / tItemTemplate.StackCount);
	local nNeedWeight		= ((nil and (1 == _JX2WZ)) and 0) or (((0 == tGoodInfo.AwardItem[1]) and tItemTemplate.Weight) or tItemTemplate.Weight * tGoodInfo.AwardItem[4]);
	nNeedWeight = nNeedWeight + tItemTemplate.Weight --多加一个道具的负重，不然additem可能失败
	-- 负重
	if nFreeWeight < nNeedWeight then
		Talk(1, "", format("你的背包没有足够的负重，不能兑换 [%s]，你需要预留%d负重", tGoodInfo.Name, nNeedWeight));
		return 0
	end

	-- 空间
	if nFreeRoom < nNeedRoom then -- 装备
		Talk(1, "", format("你的背包没有足够的空间，不能兑换[%s]，你需要预留%d空间", tGoodInfo.Name, nNeedRoom));
		return 0
	end

	local tAttrSave = nil
	local szSpecialOpStr =  tExchangeInfo.ExchangeFlag.SpecialOpStr or ""
	if 1 == tExchangeInfo.Type then -- 升级
		tEquipInfo						= tExchangeInfo.CostItem[1];
		nEquipPos						= get_equip_pos(tEquipInfo[2]);
		nEquipIDX						= GetPlayerEquipIndex(nEquipPos);
		local szItemName				= GetItemName(tEquipInfo[1], tEquipInfo[2], tEquipInfo[3]);
		local nEquipG, nEquipD, nEquipP	= GetPlayerEquipInfo(nEquipPos);
		if nEquipG ~= tEquipInfo[1] or nEquipD ~= tEquipInfo[2] or nEquipP ~= tEquipInfo[3] then
			Talk(1, "", format("你需要佩戴 [%s] 才能进行升级。", szItemName));
			return 0
		end
		if tEquipInfo[5] and tEquipInfo[5] > 0 and  GetItemLevel(nEquipIDX) < tEquipInfo[5] then
			Talk(1, "", format("需要有%d级[%s]", tEquipInfo[5], szItemName));
			return 0
		end
		
		
		if szSpecialOpStr ~= "" then
			if SpecialOp_AttrCheck(szSpecialOpStr, nEquipIDX) ~= 1 then
				return 0
			end
		end
		
		if szSpecialOpStr ~= "" then
			tAttrSave = SpecialOp_AttrSave(szSpecialOpStr, nEquipIDX)
			if not tAttrSave then
--				VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s SpecialOpStr:%s] attrsave fail",
--					uShopId, uGoodID, uExchangeID,GetAccount(), GetName(), szSpecialOpStr);
				return 0
			end
		end

--		if 1 == tExchangeInfo.ExchangeFlag.Baoliu then
--			nEquipEnhance				= GetEquipAttr(nEquipIDX, 2);
--			nEquipEnhanceFail			= GetEquipAttr(nEquipIDX, 3);
--
----			if 1 == _JX2WZ then
----				nEquipDing5				= GetItemSpecialAttr(nEquipIDX, "DING5");
--				nEquipDing10			= GetItemSpecialAttr(nEquipIDX, "DING10");
----			end
--
--			--if 1 == _JX2IB then
--				nEquipDing7				= GetItemSpecialAttr(nEquipIDX, "DING7");
--			--end
--		end

		if 1 == tExchangeInfo.ExchangeFlag.Bagua then
			nEquipLingqi				= GetItemMaxLingQi(nEquipIDX);
			if 0 >= nEquipLingqi then
				Talk(1, "", format("[%s] 没有灵气值。", szItemName));
				return 0
			end
			local nAttribute, _			= GetItemAttr(nEquipIDX, 1);
			if 0 ~= nAttribute then
				Talk(1, "", format("你的[%s]没有耐久了。", szItemName));
				return
			end
		end

		if 1 == GetItemSpecialAttr(nIndex, "LOCK") then
			Talk(1, "", format("为了您的财产安全，请先解锁您的 [%s]。", szItemName));
			return 0
		end

		tremove(tExchangeInfo.CostItem, 1);
		tExchangeInfo.CostItem.n = nil;
	end

	

	for _, tCostItem in tExchangeInfo.CostItem do
		if 0 < tCostItem[4] then
			local nCount	= GetItemCount(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[5] or 0);
			if tCostItem[4] > nCount then
				local szItemName = GetItemName(tCostItem[1], tCostItem[2], tCostItem[3]);
				Talk(1, "", format("你身上的[%s]不足%u个，不能兑换[%s]。", szItemName, tCostItem[4], tGoodInfo.Name));
				return 0
			end
		end
	end

	-- 扣除数据 -----------------------------------------------
	-- 扣除物品
	if 0 ~= nEquipIDX then
		local nRet 				= DelItemByIndex(nEquipIDX, -1);
		local tExchangeInfo2	= GetEquipShopExchangeData(uExchangeID);
		local tEquipInfo2						= tExchangeInfo2.CostItem[1];
		local szItemName2				= GetItemName(tEquipInfo2[1], tEquipInfo2[2], tEquipInfo2[3]);
--		VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostEquip:%d %s(%d,%d,%d,%d)][Ret:%d][Enhance:%d][Ding7:%d]",uShopId , uGoodID, uExchangeID
--			, nEquipPos, szItemName2, tEquipInfo2[1], tEquipInfo2[2], tEquipInfo2[3], tEquipInfo2[4]
--			, nRet, nEquipEnhance, nEquipDing7));
		if 1 ~= nRet then return 0 end
	end

	for _, tCostItem in tExchangeInfo.CostItem do
		if 0 < tCostItem[4] then
			local nRet = DelItem(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4], tCostItem[5] or 0);
			local szItemName = GetItemName(tCostItem[1], tCostItem[2], tCostItem[3]);
--			VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostItem:%s(%d,%d,%d,%d,%d)][Ret:%d]", uShopId, uGoodID, uExchangeID, szItemName, tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4], tCostItem[5] or 0, nRet));
			if 1 ~= nRet then return 0 end
			
--			local szCode = format("runtime_stat_equip_shop_consumme_item(%d, %d, %d, %d, %d)", PackItemId(tCostItem[1], tCostItem[2], tCostItem[3]), tCostItem[4], uShopId, uGoodID, uExchangeID)
--			SendScript2VM("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua", szCode)
			
		end
	end

	-- 扣除金钱
	for _, tCostMoney in tExchangeInfo.CostMoney do
    	if tCostMoney[1] ~= 0 then
    		local nRet = PayVMoney(tCostMoney[1], tCostMoney[2])
    		--local nRet = Pay(tExchangeInfo.CostCoin);
  --  		VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostMoney:%d %d][Ret:%d]", uShopId, uGoodID, uExchangeID, tCostMoney[1], tCostMoney[2], nRet));
    		if 1 ~= nRet then return 0 end
    	end
	end

	-- 扣除变量
	for _, tCostTask in tExchangeInfo.CostTask do
		if 0 < tCostTask[1] then
			local nTaskValue	= GetTask(tCostTask[1]);
			if tCostTask[1] == TASKID_CHARM_CAN_USED_POINT then  --魅力值
				AddCharmUsedPoint(tCostTask[2]);
			else
				SetTask(tCostTask[1], nTaskValue - tCostTask[2]);
			end
			local nNewTaskValue	= GetTask(tCostTask[1]);
--			VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostTask:%d,%d,%d][Ret:%d]", uShopId, uGoodID, uExchangeID, tCostTask[1], nTaskValue, nNewTaskValue, 1));
		end
	end

	--------------------------------
	-- 八卦装备处理
	local nEquipG	= 0;
	if nEquipG == tGoodInfo.AwardItem[1] and 0 >= nEquipLingqi then
		local nID	= get_gdp_id(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3]);
		local nKeyLingqi = tGoodInfo.StatKey or "";
		for _, id in g_tBaguaItem do
			if id == nID then
				nEquipLingqi						= 150;
				tExchangeInfo.ExchangeFlag.Bagua	= 1;
				break;
			end
		end
		for _, iid in g_tBagua100 do
			if iid == nID then
				if nKeyLingqi == "_119" then
					nEquipLingqi						= 119;
				elseif nKeyLingqi == "_120" then
					nEquipLingqi						= 120;
				end
				tExchangeInfo.ExchangeFlag.Bagua	= 1;
				break;
			end
		end
		for _, iid in g_tBagua999 do
			if iid == nID then
				if nKeyLingqi == "_666" then
					nEquipLingqi						= 666;
				elseif nKeyLingqi == "_999" then
					nEquipLingqi						= 999;
				end
				tExchangeInfo.ExchangeFlag.Bagua	= 1;
				break;
			end
		end
	end
	-- 八卦装备处理
	--------------------------------

	-- 给东西 -----------------------------------------------
	local nParam		= ((1 == tExchangeInfo.ExchangeFlag.Bangding)	and 4) or 1;
	local nAttribute	= ((1 == tExchangeInfo.ExchangeFlag.Bagua)		and 0) or -1;
	local nItemIDX		= 0;
	local bIBFlag		= 0;

	--------------------------------
	-- 外装处理 及 有耐久度的挫比道具【200】
	local nCoatG		= 0;
	local tCoatD		= {
		[108] = 1,
		[109] = 1,
		[110] = 1,
		[111] = 1,
		[200] = 1,
		[119] = 1,--外装挂件
		[120] = 1,
		[121] = 1,
	};
	if nCoatG == tGoodInfo.AwardItem[1] then
		if tCoatD[tGoodInfo.AwardItem[2]] then
			bIBFlag		= 1;	-- IB标识
			nAttribute	= 0;	-- 无属性
		end
	end
	-- 外装处理 及 有耐久度的挫比道具【200】
	--------------------------------
	for i = 1, tGoodInfo.AwardItem[4] do
    	if 0 == tGoodInfo.AwardItem[1] then
    		_, nItemIDX = AddItem(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], 1, nParam, nAttribute, nAttribute, nAttribute, nAttribute, nAttribute, nAttribute);
    	else
    		_, nItemIDX = AddItem(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], 1, nParam);
    	end
    --	WriteLog(format("[EquipShop:%d,%d][AwardItem:%d,%d,%d,%d,%d][ItemIDX:%d][Enhance:%d][EnhanceFail:%d][Ding5:%d][Ding7:%d][Ding10:%d][Lingqi:%d]",
    --	uGoodID, uExchangeID,
    --	tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], tGoodInfo.AwardItem[4], nParam,
    --	nItemIDX, nEquipEnhance, nEquipEnhanceFail, nEquipDing5, nEquipDing7, nEquipDing10, nEquipLingqi));
    
    	if 0 >= nItemIDX then return 0 end
    	
    	--设置物品的过期时间
    	local nExpireTime = tGoodInfo.TimeLimitSec or 0;
    	if nExpireTime > 0 then
    		SetItemExpireTime(nItemIDX, nExpireTime);
    	end
    	
    	local szItemName = GetItemName(nItemIDX);
--    	VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][AwardItem:%s(%d,%d,%d,%d/%d,%d)][ItemIDX:%d][Enhance:%d][Ding7:%d][Lingqi:%d][ItemExpireTimeSecond:%d]",
--    	uShopId, uGoodID, uExchangeID,
 --   	szItemName,tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], i, tGoodInfo.AwardItem[4], nParam,
--    	nItemIDX, nEquipEnhance, nEquipDing7, nEquipLingqi, nExpireTime));

		if szSpecialOpStr ~= "" then
			local nR = SpecialOp_AttrRestore(szSpecialOpStr, nItemIDX, tAttrSave)
			if nR ~= 1 then
--				VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s SpecialOpStr:%s] attrrestore fail",
--					uShopId, uGoodID, uExchangeID,GetAccount(), GetName(), szSpecialOpStr);
				return 0
			end
		end
--    	if 1 == tExchangeInfo.ExchangeFlag.Baoliu then
--    		if 0 < nEquipEnhance		then
--    			SetItemEnhance(nItemIDX, nEquipEnhance);
--    		end
--    
--    --		if 0 < nEquipEnhanceFail	then
--    --			SetItemEnhanceFailedNum(nItemIDX, nEquipEnhanceFail);
--    --		end
--    
--    --		if 1 == _JX2WZ then
--    --			if 0 < nEquipDing5			then
--    --				SetItemSpecialAttr(nItemIDX, "DING5", 1);
--    --			end
--    --
--   				if 0 < nEquipDing10			then
--    				SetItemSpecialAttr(nItemIDX, "DING10", 1);
--    			end
--    --		end
--    
--    		--if 1 == _JX2IB then
--    			if 0 < nEquipDing7			then
--    				SetItemSpecialAttr(nItemIDX, "DING7", 1);
--    			end
--    		--end
--    	end
    
    	if 1 == tExchangeInfo.ExchangeFlag.Bagua then
    		if 0 < nEquipLingqi			then
    			SetItemMaxLingQi(nItemIDX, nEquipLingqi);
    		end
    	end
    
    	if 1 == bIBFlag then
    		SetItemStatus(nItemIDX, 2, 1);
    	end
    
    	SyncItem2Client(nItemIDX);
  
	end
	
    if 0 < tGoodInfo.AwardTimes[1] then
		local nTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		SetTask(tGoodInfo.AwardTimes[1], nTaskValue + 1);
		local nNewTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
--		VET_WriteEquipShopLog(format("[EquipShop:%d,%d][AwardTimes:%d,%d,%d][Ret:%d]", uGoodID, uExchangeID, tGoodInfo.AwardTimes[1], nTaskValue, nNewTaskValue, 1));
	end
	
	return 1
end

function OnExchange(uShopId, uGoodID, uExchangeID, uBatchNum)
	-- 获取数据 -----------------------------------------------
	if not uGoodID			or 0 >= uGoodID		then return end
	if not uExchangeID		or 0 >= uExchangeID	then return end

	local tGoodInfo		= GetEquipShopGoodData(uGoodID);
	local tExchangeInfo	= GetEquipShopExchangeData(uExchangeID);
	if not tGoodInfo		or 'table' ~= type(tGoodInfo)		or uGoodID		~= tGoodInfo.ID		then return end
	if not tExchangeInfo	or 'table' ~= type(tExchangeInfo)	or uExchangeID	~= tExchangeInfo.ID	then return end

	local bCheckExchangeIDVaild		= 0;
	for _, uID in tGoodInfo.ExchangeData do
		if uID == uExchangeID then
			bCheckExchangeIDVaild	= 1;
			break;
		end
	end
	if 1 ~= bCheckExchangeIDVaild then return end

	-- 检查数据 -----------------------------------------------

	-- 检查箱子
	if 1 == IsBoxLocking() then
		Talk(1, "", format("为了您的财产安全，请先解锁储物箱。"));
		return
	end
	
	local nRealExchgCnt = 0;
	local bBreak = 0
	
--	VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s] log begin",
--		uShopId, uGoodID, uExchangeID,GetAccount(), GetName());
	for i = 1, uBatchNum do
		local suc = _DoOneExchange(tGoodInfo, tExchangeInfo, uShopId, uGoodID, uExchangeID)
		if suc and 1 == suc  then
			nRealExchgCnt = nRealExchgCnt + 1
			
			--统计
			VET_EquipShopStatic(uShopId, uGoodID, uExchangeID);
		--	tGoodInfo.StatKey		= tGoodInfo.StatKey 	or "";
		--	tExchangeInfo.StatKey	= tExchangeInfo.StatKey	or "";
		--	if "" ~= tGoodInfo.StatKey or "" ~= tExchangeInfo.StatKey then
		--		--AddStatValue(format("%s%s", tGoodInfo.StatKey, tExchangeInfo.StatKey), 1);
		--	end
		else
			break
		end
	end --for nRealExchgCnt=0,uBatchNum
	
	if nRealExchgCnt >= 1 then
		if uBatchNum > 1 then
			Msg2Player(format("你使用 [%d/%d]成功兑换了 [%s]×%d", nRealExchgCnt, uBatchNum, tGoodInfo.Name, nRealExchgCnt*tGoodInfo.AwardItem[4]));
		else
			Msg2Player(format("你获得了[%s]×%d", tGoodInfo.Name, tGoodInfo.AwardItem[4]));
		end
		
		local szCode = format("runtime_stat_equip_shop_exchange(%d, %d, %d, %d)", uShopId, uGoodID, uExchangeID, nRealExchgCnt)
		SendScript2VM("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua", szCode)

		if 1 == tGoodInfo.GlobalMsg then
			Msg2Global(format("恭喜[%s]在商店中兑换了[%s]×%d ", GetName(), tGoodInfo.Name, nRealExchgCnt*tGoodInfo.AwardItem[4]));
		end
		SetTask(Pre_Click_Time1,GetTime());
	end
end

function VET_WriteEquipShopLog(strFormat, ...)
	local strLogPath = "logs/equip_shop/"
	local strLog = format(strFormat, unpack(arg));
	local strDate = date("%Y_%m_%d");
	local strLogFile = format("equipshoplog_%s.log", strDate);
	local strLogFilePath = format("%s%s",strLogPath, strLogFile);

	local hFile = openfile(strLogFilePath, "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", strLogPath));
		hFile = openfile(strLogFilePath, "a+");
	end
	if (hFile ~= nil) then
		write (hFile, strLog .. "\n");
		closefile (hFile);
	end
end

--some special operation
--function Special_Op_Check(szOpStr, nItemIdx)
--end

--some condition check
function SpecialOp_AttrCheck(szOpStr, nOldItemIdx)
	if not szOpStr or not nOldItemIdx then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[1] then
			return t[1](nOldItemIdx)
		else
			return 1
		end
	end
	return 0
end

--save some attrs of old item
function SpecialOp_AttrSave(szOpStr, nOldItemIdx)
	if not szOpStr or not nOldItemIdx then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[2] then
			return t[2](nOldItemIdx)
		else
			return 1
		end
	end
end

--set some attrs to new items
function SpecialOp_AttrRestore(szOpStr, nNewItemIdx, tSave)
	if not szOpStr or not nNewItemIdx or not tSave then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[3] then
			return t[3](nNewItemIdx, tSave)
		else
			return 1
		end
		
	end
end

function _specialop_attrcheck_reduce_enhance(nOldItemIdx)
	local nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
	if nEquipEnhance >= 13 then
		return 1
	else
		Msg2Player("你的装备强化度 +13，不需要强化升级！")
		return 0
	end
end

function _specialop_attrsave_reduce_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_reduce_enhance(nNewItemIdx, tSave)
	local nEnhance = tSave.nEquipEnhance
	local nNewEnhance = 0
	if nEnhance > 0 then
		if nEnhance >= 1 and nEnhance <=13 then
			nNewEnhance = 0
		elseif nEnhance >= 14 and nEnhance <=15 then
			nNewEnhance = 7
		end
		if nNewEnhance > 0 then
			SetItemEnhance(nNewItemIdx, nNewEnhance);
		end
    end
    return 1
end

function __check_enhance_n(nOldItemIdx,nEnhanceLv)
	local nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
	if nEquipEnhance >= nEnhanceLv then
		return 1
	else
		Msg2Player(format("你的装备当前强化度+%d，无需再次强化升级！", nEnhanceLv))
		return 0
	end
end
function _specialop_attrcheck_reduce_enhance1(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 1) end
function _specialop_attrcheck_reduce_enhance2(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 2) end
function _specialop_attrcheck_reduce_enhance3(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 3) end
function _specialop_attrcheck_reduce_enhance4(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 4) end
function _specialop_attrcheck_reduce_enhance5(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 5) end
function _specialop_attrcheck_reduce_enhance6(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 6) end
function _specialop_attrcheck_reduce_enhance7(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 7) end
function _specialop_attrcheck_reduce_enhance8(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 8) end
function _specialop_attrcheck_reduce_enhance9(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 9) end
function _specialop_attrcheck_reduce_enhance10(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 10) end
function _specialop_attrcheck_reduce_enhance11(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 11) end
function _specialop_attrcheck_reduce_enhance12(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 12) end
function _specialop_attrcheck_reduce_enhance13(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 13) end
function _specialop_attrcheck_reduce_enhance14(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 14) end
function _specialop_attrcheck_reduce_enhance15(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 15) end
function _specialop_attrsave_none(nOldItemIdx)	return 1 end
function _specialop_attrrestore_none(nNewItemIdx, tSave)	return 1 end

--function _specialop_attrsave_reduce_enhance14(nOldItemIdx)
--	return _specialop_attrsave_reduce_enhance(nOldItemIdx)
--end
--function _specialop_attrrestore_reduce_enhance14(nNewItemIdx, tSave)
--	--强化度变为0，不保留定魂效果
--    return 1
--end

function _specialop_attrsave_save_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_save_enhance(nNewItemIdx, tSave)
	if 0 < tSave.nEquipEnhance then
    	SetItemEnhance(nNewItemIdx, tSave.nEquipEnhance);
    end
    if 0 < tSave.nEquipDing10 then
    	SetItemSpecialAttr(nNewItemIdx, "DING10", 1);
    end
    if 0 < tSave.nEquipDing7 then
    	SetItemSpecialAttr(nNewItemIdx, "DING7", 1);
    end
    return 1
end

function _specialop_attrsave_half_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_half_enhance(nNewItemIdx, tSave)
	local nEnhance = floor(tSave.nEquipEnhance / 2)
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
end
function _specialop_attrsave_enhance_reduce_3(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_enhance_reduce_3(nNewItemIdx, tSave)
	local nEnhance = tSave.nEquipEnhance - 3
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
end
function _specialop_attrsave_enhance_reduce_s(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_enhance_reduce_s(nNewItemIdx, tSave)
	local nEnhance = 0;
	if tSave.nEquipEnhance > 12 then
		nEnhance = 7;
	else
		nEnhance = 0;
	end
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
	return 1;
end


--this table must at end of file
T_OPSTR_2_FUNC = {
	--{check_func, save_func, restore_func}
	["reduce_enhance"] = {_specialop_attrcheck_reduce_enhance, _specialop_attrsave_reduce_enhance, _specialop_attrrestore_reduce_enhance},
	["reduce_enhance1"] = {_specialop_attrcheck_reduce_enhance1, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance2"] = {_specialop_attrcheck_reduce_enhance2, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance3"] = {_specialop_attrcheck_reduce_enhance3, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance4"] = {_specialop_attrcheck_reduce_enhance4, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance5"] = {_specialop_attrcheck_reduce_enhance5, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance6"] = {_specialop_attrcheck_reduce_enhance6, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance7"] = {_specialop_attrcheck_reduce_enhance7, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance8"] = {_specialop_attrcheck_reduce_enhance8, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance9"] = {_specialop_attrcheck_reduce_enhance9, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance10"] = {_specialop_attrcheck_reduce_enhance10, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance11"] = {_specialop_attrcheck_reduce_enhance11, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance12"] = {_specialop_attrcheck_reduce_enhance12, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance13"] = {_specialop_attrcheck_reduce_enhance13, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance14"] = {_specialop_attrcheck_reduce_enhance14, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance15"] = {_specialop_attrcheck_reduce_enhance15, _specialop_attrsave_none, _specialop_attrrestore_none},
	["save_enhance"] = {nil, _specialop_attrsave_save_enhance, _specialop_attrrestore_save_enhance},
	["half_enhance"] = {nil, _specialop_attrsave_half_enhance, _specialop_attrrestore_half_enhance},
	["enhance_reduce_3"] = {nil, _specialop_attrsave_enhance_reduce_3, _specialop_attrrestore_enhance_reduce_3},
	["enhance_reduce_s"] = {nil, _specialop_attrsave_enhance_reduce_s, _specialop_attrrestore_enhance_reduce_s},
	["update_huofeng_lv2"] = {_specialop_attrcheck_update_huofeng_lv2, _specialop_attrsave_update_huofeng_lv2, _specialop_attrrestore_update_huofeng_lv2},
	["update_huofeng_lv3"] = {_specialop_attrcheck_update_huofeng_lv3, _specialop_attrsave_update_huofeng_lv3, _specialop_attrrestore_update_huofeng_lv3},
	["update_huofeng_equip"] = {_specialop_attrcheck_update_huofeng_equip, _specialop_attrsave_update_huofeng_equip, _specialop_attrrestore_update_huofeng_equip},
	
}

--商队兑换统计
function VET_EquipShopStatic(uShopId, uGoodID, uExchangeID)
end

--每周清理
function on_weekly_clear()
	for i = 3356,3363 do--声望商店每周兑换次数限制
		SetTask(i, 0)
	end
	SetTask(3383, 0) --银券商店每周兑换次数
	SetTask(3384, 0) --银券商店同济之愿每周兑换次数
end