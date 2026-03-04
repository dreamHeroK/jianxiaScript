-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 超小礼包一换多公共释放脚本
-- 文件名：simple_item.lua
-- Edited by 
-- 2020/06/02 AM 11:52
-- ======================================================
Include("\\script\\lib\\awardtemplet.lua")
g_COLLECT_COAT_ID = 1;

tTab =
	-- 1：G,  2：D,     3：P,    
	-- 4：物品名字，
	-- 5：类型：
	---- 0: 势力声望{1：增加数值；2-1: 随机；2-2: 所有}
	---- 1: 物品{1：获得物品；2：空间负重；2-3：需要数量；2-4：有限期}
	---- 2: 外装{1：自身体型相关外装ID{1：外装id；2：永久收藏ID}
{
	{2, 114, 117, "真卷精华", 1, {item = {{gdp={2,114,118,1,1}, name = "无字天书"}, {gdp={2,114,120,1,1}, name = "真武手记"},},}, {1,100, 200}, "真卷精华。使用200张可以转为<color=yellow>无字天书X1,真武手记X1<color>。确定要转化吗？"},
	{2, 103, 1027, "白糖粽子", 0, {100, 1}},
	{2, 103, 1028, "红糖粽子", 0, {50, 2}},
	{2, 95, 4647, "超小包天骄令", 1, {item = {{gdp={2,97,236,5,1}, name = "天骄令"},},}, {1,100}, "打开这个包裹，您可以获得5个<color=yellow>天骄令<color>。",},
	{2, 111, 120, "一包修身丸", 1, {item = {{gdp={2,95,223,10,1}, name = "修身丸"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>修身丸<color>。",},
	{2, 95, 4648, "超小包新年许愿砂", 1, {item = {{gdp={2,95,231,25,1}, name = "新年许愿砂"},},}, {1,100}, "打开这个包裹，您可以获得25个<color=yellow>新年许愿砂<color>。"},
	{2, 96, 178, "打包的精致的宝箱钥匙", 1, {item = {{gdp={2,95,48,10,1}, name = "精致的宝箱钥匙"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>精致的宝箱钥匙<color>。"},
	{2, 95, 665, "小包镏金", 1, {item = {{gdp={2,201,12,5,1}, name = "镏金"},},}, {1,100}, "打开这个包裹，您可以获得5个<color=yellow>镏金<color>。"},
	{2, 95, 666, "大包镏金", 1, {item = {{gdp={2,201,12,50,1}, name = "镏金"},},}, {1,100}, "打开这个包裹，您可以获得50个<color=yellow>镏金<color>。"},
	{2, 114, 59, "小箱百炼", 1, {item = {{gdp={2,114,55,100,1}, name = "百炼"},},}, {1,100}, "打开这个箱子，您可以获得100个<color=yellow>百炼<color>。"},
	{2, 114, 60, "大箱百炼", 1, {item = {{gdp={2,114,55,500,1}, name = "百炼"},},}, {1,100}, "打开这个箱子，您可以获得500个<color=yellow>百炼<color>。"},
	{2, 114, 77, "小箱千锤", 1, {item = {{gdp={2,114,76,100,1}, name = "千锤"},},}, {1,100}, "打开这个箱子，您可以获得100个<color=yellow>千锤<color>。"},
	{2, 114, 78, "大箱千锤", 1, {item = {{gdp={2,114,76,500,1}, name = "千锤"},},}, {1,100}, "打开这个箱子，您可以获得500个<color=yellow>千锤<color>。"},
	{2, 0, 1093, "太易图鉴盒子", 1, {item = {{gdp={2,0,1082,10,1}, name = "太易混元功图鉴"},},}, {1,100}, "打开这个盒子，您可以获得10个<color=yellow>太易混元功图鉴<color>。"},
	{2, 0, 1094, "太易图鉴箱子", 1, {item = {{gdp={2,0,1082,100,1}, name = "太易混元功图鉴"},},}, {1,100}, "打开这个箱子，您可以获得100个<color=yellow>太易混元功图鉴<color>。"},
	{2, 0, 1082, "太易混元功图鉴", 1, {item = {{gdp={2,0,1083,1,1}, name = "太易混元谱"},},}, {1,100, 1000}, "散开的太易混元功的图谱，似乎可以整理为一本。使用1000张可以转为1本<color=yellow>太易混元谱<color>。确定要转化吗？"},
	{2, 0, 1083, "太易混元谱", 1, {item = {{gdp={2,0,1082,1000,1}, name = "太易混元功图鉴"},},}, {1,100}, "打开可以获得1000个<color=yellow>太易混元功图鉴<color>。"},
	{2, 95, 221, "小包陨铁", 1, {item = {{gdp={2,2,8,10,1}, name = "陨铁"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>陨铁<color>。"},
	{2, 102,198, "小包逆鳞", 1, {item = {{gdp={2,1,1156,4,1}, name = "逆鳞"},},}, {1,100}, "打开这个包裹，您可以获得4个<color=yellow>逆鳞<color>。"},
	{2, 102,199, "小包斗魂", 1, {item = {{gdp={2,1,1157,5,1}, name = "斗魂"},},}, {1,100}, "打开这个包裹，您可以获得5个<color=yellow>斗魂<color>。"},
	{2, 95,53, "小盒藏宝箱钥匙", 1, {item = {{gdp={2,95,52,10,1}, name = "藏宝箱钥匙"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>藏宝箱钥匙<color>。"},
	{2, 95,54, "大盒藏宝箱钥匙", 1, {item = {{gdp={2,95,52,50,1}, name = "藏宝箱钥匙"},},}, {1,100}, "打开这个包裹，您可以获得50个<color=yellow>藏宝箱钥匙<color>。"},
	{2, 95,3971, "一个伏虎令", 1, {item = {{gdp={2,95,3970,1,1}, name = "伏虎令"},},}, {1,100}, "打开这个包裹，您可以获得1个<color=yellow>伏虎令<color>。"},
	{2, 95,3972, "一箱伏虎令", 1, {item = {{gdp={2,95,3970,10,1}, name = "伏虎令"},},}, {1,100}, "打开这个箱子，您可以获得10个<color=yellow>伏虎令<color>。"},
	{2, 100,47, "天门银文虎符箱", 1, {item = {{gdp={2,100,44,10,1}, name = "天门银文虎符"},},}, {1,100}, "打开这个箱子，您可以获得10个<color=yellow>天门银文虎符<color>。"},
	{2, 100,48, "天门金文虎符箱", 1, {item = {{gdp={2,100,45,10,1}, name = "天门金文虎符"},},}, {1,100}, "打开这个箱子，您可以获得10个<color=yellow>天门金文虎符<color>。"},
	{2, 95,1462, "一包幸运金币", 1, {item = {{gdp={2,95,197,20,1}, name = "幸运金币"},},}, {1,100}, "打开这个包裹，您可以获得20个<color=yellow>幸运金币<color>。"},
	{2, 95, 3817, "霜染枫红普通兑换券", 1, {item = {{gdp={2, 95, 3819, 1, 1}, name = "霜染枫红普通外装包"},},}, {1,100, 100}, "收集100张霜染枫红普通兑换券，您可以兑换1个<color=yellow>霜染枫红普通外装包<color>。确定要兑换吗？"},
	{2, 95, 3818, "霜染枫红高级兑换券", 1, {item = {{gdp={2, 95, 3820, 1, 1}, name = "霜染枫红高级外装包"},},}, {1,100, 100}, "收集100张霜染枫红高级兑换券，您可以兑换1个<color=yellow>霜染枫红高级外装包<color>。确定要兑换吗？"},
	{2, 95, 4742, "味美甘甜的杨柳叶", 1, {item = {{gdp={0,105,10119,1,4,-1,-1,-1,-1,-1,-1}, name = "金甲碧麟神鹿"},},}, {1,100, 10}, "并不常见的杨柳枝，收集10个味美甘甜的杨柳叶，您可以兑换<color=yellow>金甲碧麟神鹿<color>坐骑。确定要兑换吗？"},
	{2, 95, 4743, "饱含灵气的杨柳叶", 1, {item = {{gdp={0,105,10122,1,4,-1,-1,-1,-1,-1,-1}, name = "金甲蓝麟神鹿坐骑"},},}, {1,100, 10}, "灵气充盈的杨柳枝，收集10个饱含灵气的杨柳叶，您可以兑换<color=yellow>金甲蓝麟神鹿<color>坐骑。确定要兑换吗？"},
	{2, 95, 5038, "长乐未央兑换凭证", 1, {item = {{gdp={2, 95, 5039, 1, 1}, name = "长乐未央外装包"},},}, {1,100, 100}, "兑换凭证，收集100张长乐未央兑换凭证，您可以换取一个<color=yellow>长乐未央外装包<color>。确定要兑换吗？"},
	{2, 95, 5314, "龙血豪华礼袋", 1, {item = {{gdp={2, 95, 2058, 1, 1}, name = "龙血仙丹"}, {gdp={2, 95, 2017, 5, 1}, name = "经验造化丹"}, {gdp={2, 1, 270, 5,1}, name = "白驹丸"}, },}, {3,300}, "武林盟特制礼包，打开可获得<color=yellow>龙血仙丹<color>*1；<color=yellow>经验造化丹<color>*5；<color=yellow>白驹丸<color>*5。"},
	{2, 95, 2056, "老友超值礼包", 1, {item = {{gdp={2,95,52,500,1,1}, name = "藏宝箱钥匙"}, {gdp={2,94,10,50,1,1}, name = "盛世铜宝箱"}, {gdp={2,95,247,5,1}, name = "千变梵天券"}, },}, {3,300}, "武林盟特制礼包，打开可获得<color=yellow>藏宝箱钥匙<color>*500；<color=yellow>盛世铜宝箱<color>*50；<color=yellow>千变梵天券<color>*5。"},
	{2, 95, 5315, "双“蛋”强化礼包", 1, {item = {{gdp={2, 2, 7, 20, 1}, name = "陨铁碎片"}, {gdp={2, 2, 8, 20, 1}, name = "陨铁"}, {gdp={2, 1, 1009, 60, 1}, name = "陨铁精石"}, {gdp={2, 1, 112, 5, 1}, name = "幸运兔脚"}, },}, {4,300}, "武林盟特制礼包，打开可获得<color=yellow>陨铁碎片<color>*20<color=yellow>陨铁<color>*20<color=yellow>陨铁精石<color>*60<color=yellow>幸运兔脚<color>*1。"},
	{2, 95, 5371, "充值贵宾礼箱", 1, {nYinJuan = 1500, item = {{gdp={2, 97, 232, 2, 4}, name = "洪荒披风玄铁"}, {gdp={2, 97, 231, 2, 4}, name = "洪荒令玄铁"}, },}, {8,300}, "充值礼箱，打开礼箱可获得<color=yellow>银券<color>*1500；<color=yellow>洪荒披风玄铁<color>*2；<color=yellow>洪荒令玄铁<color>*2。"},
	{2, 95, 5378, "消费贵族礼箱", 1, {item = {{gdp={2, 95, 1511, 250, 4}, name = "斗魄令"}, {gdp={2, 95, 3278, 30, 4}, name = "装备碎片（2级）"}, },}, {2,300}, "消费礼箱，打开礼箱可获得<color=yellow>斗魄令<color>*250；<color=yellow>装备碎片（2级）<color>*30。"},
--	{2, 95, 5317, "千变豪华礼包", 1, {item = {{gdp={2, 95, 573, 2, 1}, name = "千变梵宇券"},},}, {1,100}, "武林盟特制礼包，打开可获得<color=yellow>千变梵宇券<color>*2，1000~10000点随机千变点数。"},
	{2, 95, 5439, "庚子礼包", 1, {item = {{gdp={2, 95, 2017, 2, 1}, name = "经验造化丹"}, {gdp={2, 2, 105, 1, 1}, name = "5级血滴石"}, {gdp={2, 2, 205, 1, 1}, name = "5级月白石"}, {gdp={2, 95, 1916, 1, 1}, name = "10000银券兑换券"}, },}, {4,400}, "武林盟长老特制庚子年大礼包，打开可获得<color=yellow>经验造化丹<color>*2<color=yellow>5级血滴石<color>*1<color=yellow>5级月白石<color>*1<color=yellow>10000银券兑换券<color>*1。"},
	{2, 95, 5441, "庚子消费礼包兑换券", 1, {item = {{gdp={2, 95, 5439, 1}, name = "庚子礼包"},},}, {1,100}, "礼包兑换券，收集50张可以兑换1个庚子礼包哦！"},
	{2, 95, 5473, "寒塘雁迟兑换凭证", 1, {item = {{gdp={2, 95, 5474, 1}, name = "寒塘雁迟外装包"},},}, {1,100}, "兑换凭证，收集100张寒塘雁迟兑换凭证可换取一个寒塘雁迟外装包。"},
	{2, 95, 5671, "庚子礼包兑换券", 1, {item = {{gdp={2, 95, 5439, 1}, name = "庚子礼包"},},}, {1,100,30}, "集齐30张可兑换庚子礼包一个。确定兑换吗？"},
	{2, 111, 187, "蓬莱晨露", 1, {nExp = 47265}, {1,100}, "使用蓬莱晨露可获得少量经验。"},
	{2, 111, 188, "蓬莱云崖晨露", 1, {nExp = 147256}, {1,100}, "使用蓬莱云崖晨露可获得经验。"},
	{2, 111, 189, "蓬莱仙崖晨露", 1, {nExp = 1214726}, {1,100}, "使用蓬莱仙崖晨露获得大量经验。"},
	{2, 103, 1021, "五仁粽子", 1, {nExp = 2456250}, {1,100}, "五仁粽子，配合崂山蛇草水食用，风味更佳，食用可获得大量经验。"},
	{2, 103, 1022, "豆沙粽子", 1, {nExp = 456250}, {1,100}, "入口香甜的红豆沙为馅儿的粽子，食用可获得一些经验。"},
	{2, 103, 1023, "蜜枣粽子", 1, {nExp = 456250}, {1,100}, "蜜枣粽，清甜可口，补血养生。食用可获得少量经验。"},
	{2, 103, 1024, "香芋粽子", 1, {nPopur = 50}, {1,100}, "芋头为馅儿的香粽。食用可获得一些修为。"},
	{2, 103, 1025, "榴莲粽子", 1, {nPopur = 150}, {1,100}, "一个可口与否见仁见智的粽子。食用可获得一些修为。"},
	{2, 103, 1026, "竹筒粽子", 1, {nExp = 1725460}, {1,100}, "有竹叶清香的粽子。食用可获得一些经验。"},
	{2, 102, 173, "翻羽兑换券", 1, {item = {{gdp={0, 105, 15, 1, 4,-1,-1,-1,-1,-1,-1}, name = "翻羽（永久）"},},}, {1,100, 100}, "产自梁山英雄会，集齐100个兑换券可以兑换一匹<color=yellow>翻羽（永久）<color>。确定要兑换吗？"},
	{2, 102, 174, "超光兑换券", 1, {item = {{gdp={0, 105, 19, 1, 4,-1,-1,-1,-1,-1,-1}, name = "超光（永久）"},},}, {1,100, 100}, "产自梁山英雄会，集齐100个兑换券可以兑换一匹<color=yellow>超光（永久）<color>。确定要兑换吗？"},
	{2, 102, 175, "奔霄兑换券", 1, {item = {{gdp={0, 105, 16, 1, 4,-1,-1,-1,-1,-1,-1}, name = "奔霄（永久）"},},}, {1,100, 100}, "产自梁山英雄会，集齐100个兑换券可以兑换一匹<color=yellow>奔霄（永久）<color>。确定要兑换吗？"},
	{2, 102, 176, "腾雾兑换券", 1, {item = {{gdp={0, 105, 20, 1, 4,-1,-1,-1,-1,-1,-1}, name = "腾雾（永久）"},},}, {1,100, 100}, "产自梁山英雄会，集齐100个兑换券可以兑换一匹<color=yellow>腾雾（永久）<color>。确定要兑换吗？"},
	{2, 102, 181, "战狼兑换券", 1, {item = {{gdp={0, 105, 205, 1, 4,-1,-1,-1,-1,-1,-1}, name = "战狼"},},}, {1,100, 100}, "产自进贡任务，收集100张可以兑换坐骑<color=yellow>战狼<color>。确定要兑换吗？"},
	{2, 95, 4726, "高级坐骑装备礼盒", 1, {item = {{gdp={0, 105, 36, 1, 4,-1,-1,-1,-1,-1,-1},},},}, {1,100}, "装有坐骑装备的礼盒，打开后可以获得随机80级坐骑装备一个。"},
	{2, 102, 182, "摇铃听歌外装兑换券", 1, {item = {{gdp={0, 102, 184, 1, 1}, name = "摇铃听歌外装包"},},}, {1,100, 100}, "产自进贡任务，收集100张可以兑换摇铃听歌外装包。确定要兑换吗？"},
	{2, 102, 196, "和风礼包", 1, {item = {{gdp={2, 95, 2017, 1, 1}, name = "经验造化丹"}, {gdp={2, 95, 1511, 100}, name = "斗魄令"}, },}, {1,100}, "打开这个包裹，您可以获得<color=yellow>经验造化丹<color>*1<color=yellow>斗魄令<color>*100。"},
	{2,95,3448, "贵宾虎纹卡豪华礼袋", 1, {item = {{gdp={2,95,3451,1,1}, name = "贵宾虎纹卡（未激活）"}, {gdp={2,95,2058,1,1}, name = "龙血仙丹"}, {gdp={2,95,1432,2,1}, name = "侠士装备箱[+13]"}, {gdp={2,1,9977,1,1}, name = "辉煌军功章"}, {gdp={2,1,9998,5,1}, name = "大军功章"}, },}, {6,100}, "武林盟特制礼包，打开可获得：<color=yellow>贵宾虎纹卡（未激活）*1、龙血仙丹*1、侠士装备箱[+13]*2、辉煌军功章*1、大军功章*5。"},
	{2, 102, 204, "打包的烈武玄晶碎片", 1, {item = {{gdp={2, 102, 201, 10, 1}, name = "烈武玄晶碎片"},},}, {1,100}, "打开这个包裹，您可以获得10块<color=yellow>烈武玄晶碎片<color>。"},
	{2,95,5314, "龙血豪华礼袋", 1, {item = {{gdp={2,95,2058,1,1}, name = "龙血仙丹"}, {gdp={2,95,2017,5,1}, name = "经验造化丹"}, {gdp={2,1,270,5,1}, name = "白驹丸"}, },}, {3,100}, "武林盟特制礼包，打开可获得：<color=gold>龙血仙丹*1；经验造化丹*5；白驹丸*5。"},
	{2,95,5852, "双11超值礼包", 1, {item = {{gdp={2,95,1511,200,1}, name = "斗魄令"}, {gdp={0, 154, 3, 1, 4,-1,-1,-1,-1,-1,-1}, name = "五行天仪"}, {gdp={2,95,5777,1,1}, name = "5级宝石包"}, {gdp={2,95,1911,1,1}, name = "100银券兑换券"}, {gdp={2,95,5516,50,1}, name = "披风碎片"}, {gdp={2,95,5517,50,1}, name = "徽章碎片"}, },}, {3,100}, "武林盟特制礼包，打开可获得：<color=gold>斗魄令*200；五行天仪（3星）；5级宝石包*1；100银券兑换券*1；披风碎片*50；徽章碎片*50。"},
	{2,95,5317, "强化豪华礼包", 1, {item = {{gdp={2,1,1009, 200, 1}, name = "打包的陨铁精石"}, {gdp={2,101,14, 1, 1}, name = "强化精石（13级）"}, },}, {1,100}, "打开这个包裹，您可以获得<color=yellow>陨铁精石<color>*200<color=yellow>强化精石（13级）<color>*1。"},
	{2, 102, 230, "小包黑曜石", 1, {item = {{gdp={2, 102, 229, 10, 1}, name = "黑曜石"},},}, {1,100}, "打开这个包裹，您可以获得10块<color=yellow>黑曜石<color>。"},
	{2, 102, 231, "大包黑曜石", 1, {item = {{gdp={2, 102, 229, 100, 1}, name = "黑曜石"},},}, {1,100}, "打开这个包裹，您可以获得100块<color=yellow>黑曜石<color>。"},
	{2, 100, 46, "师门秘函包裹",  1, {item = {{gdp={2, 1, 1020, 5, 1}, name = "师门秘函"},},}, {1,100}, "打开这个包裹，您可以获得5个<color=yellow>师门秘函<color>。"},
	{2, 1, 1158, "一包鸳鸯结",  1, {item = {{gdp={2, 1, 572, 30, 1}, name = "鸳鸯结"},},}, {1,100}, "打开这个包裹，您可以获得30个<color=yellow>鸳鸯结<color>。"},
	{2, 95, 5183, "超大包大爱意丸",  1, {item = {{gdp={2, 1, 574, 20, 1}, name = "大爱意丸"},},}, {1,100}, "打开这个包裹，您可以获得20个<color=yellow>大爱意丸<color>。"},
	{2, 95, 5184, "大包大爱意丸",  1, {item = {{gdp={2, 1, 574, 15, 1}, name = "大爱意丸"},},}, {1,100}, "打开这个包裹，您可以获得15个<color=yellow>大爱意丸<color>。"},
	{2, 95, 5185, "小包大爱意丸",  1, {item = {{gdp={2, 1, 574, 10, 1}, name = "大爱意丸"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>大爱意丸<color>。"},
	{2, 95, 3616, "辰蛇在岁外装包",  2, {{717, 718, 719, 720}, {191,192,193}, 0}, {1,100}, "打开这个包裹，您可以获得一套对应体型的<color=yellow>辰蛇在岁外装<color>。"},
	{2, 95, 3617, "策马天下外装包",  2, {{811, 812, 813, 814}, {290,291,292}, 0}, {1,100}, "打开这个包裹，您可以获得一套对应体型的<color=yellow>策马天下外装<color>。"},
	{2, 95, 3618, "藤紫兰外装包",  2, {{885, 856, 857, 858}, {350,351,352}, 1}, {1,100}, "装有外装的包裹，打开包裹可以获得一套对应体型的<color=yellow>藤紫兰外装<color>。"},
	{2, 95, 3757, "鸿影轻烟外装包",  2, {{965, 966, 967, 968}, {407,408,409}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>鸿影轻烟外装<color>一套。"},
	{2, 95, 3819, "霜染枫红普通外装包",  2, {{973, 974, 975, 977}, {413,414,415}, 1}, {1,100}, "普通外装包，打开可以获得与自身体型相符<color=yellow>霜染枫红外装<color>一套。"},
	{2, 95, 3962, "叶上秋风外装包",  2, {{953, 954, 955, 956}, {398,399,400}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>叶上秋风外装<color>一套。"},
	{2, 95, 4032, "姬灵外装包",  2, {{897, 898, 899, 900}, {395,396,397}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>姬灵外装<color>一套。"},
	{2, 95, 4129, "浣熊头饰盒",  2, {{622, 623, 624, 625}, {133}, 1}, {1,100, 1, 30, {108}}, "装有浣熊头的盒子，打开可以获得有效期30天对应体型<color=yellow>浣熊头<color>1个。"},
	{2, 95, 4464, "扁舟夜泛外装包",  2, {{989, 990, 991, 992}, {422,423,424}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>扁舟夜泛外装<color>一套。"},
	{2, 95, 4559, "问情装外装包",  2, {{1009, 1010, 1011, 1012}, {434,435,436}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>问情装外装<color>一套。"},
	{2, 95, 4651, "白雨跳珠外装包",  2, {{1033, 1034, 1035, 1036}, {452,453,454}, 1}, {1,100}, "装有外装的礼包，打开可以获得对应体型<color=yellow>白雨跳珠外装<color>一套。"},
	{2, 95, 4699, "烁玉流金外装包",  2, {{1017, 1018, 1019, 1020}, {440,441,442}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>烁玉流金外装<color>一套。"},
	{2, 95, 4778, "碧海秋夕外装包",  2, {{1029, 1030, 1031, 1032}, {449,450,451}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>碧海秋夕外装<color>一套。"},
	{2, 95, 4838, "荷风竹露外装包",  2, {{1049, 1050, 1051, 1052}, {464,465,466}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>荷风竹露外装<color>一套。"},
	{2, 95, 4870, "碧城烟雨外装包",  2, {{1045, 1046, 1047, 1048}, {461,462,463}, 1}, {1,100}, "装有外装的包裹，打开包裹可以获得一套对应体型的<color=yellow>碧城烟雨外装<color>。"},
	{2, 95, 5039, "长乐未央外装包",  2, {{1013, 1014, 1015, 1016}, {437,438,439}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>长乐未央外装<color>一套。"},
	{2, 95, 5177, "傲睨外装包",  2, {{1041, 1042, 1043, 1044}, {458,459,460}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>傲睨装<color>一套。"},
	{2, 95, 5178, "傲雪凌霜外装包",  2, {{1025, 1026, 1027, 1028}, {446,447,448}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>傲雪凌霜外装<color>一套。"},
	{2, 95, 5179, "晴绮照烟外装包",  2, {{1057, 1058, 1059, 1060}, {470,471,472}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>晴绮照烟外装<color>一套。"},
	{2, 95, 5181, "金风玉露外装包",  2, {{1021, 1022, 1023, 1024}, {443,444,445}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>金风玉露外装<color>一套。"},
	{2, 95, 5182, "烟笼寒江外装包",  2, {{1081, 1082, 1083, 1084}, {488,489,490}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>烟笼寒江外装<color>一套。"},
	{2, 95, 5214, "汀上白沙外装包",  2, {{1073, 1074, 1075, 1076}, {482,483,484}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>汀上白沙外装<color>一套。"},
	{2, 95, 5216, "乞巧如意外装包",  2, {{1053, 1054, 1055, 1056}, {467,468,469}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>乞巧如意外装<color>一套。"},
	{2, 95, 5218, "落日孤城外装包",  2, {{1097, 1098, 1099, 1100}, {497,498,499}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>落日孤城外装<color>一套。"},
	{2, 95, 5281, "涧影潭香外装包",  2, {{1085, 1086, 1087, 1088}, {491,492,493}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>涧影潭香外装<color>一套。"},
	{2, 95, 5282, "霜染枫红外装包",  2, {{973, 974, 975, 977}, {413,414,415}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>霜染枫红外装<color>一套。"},
	{2, 95, 5283, "赤猿弄鹤外装包",  2, {{985, 986, 987, 988}, {419,420,421}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>赤猿弄鹤外装<color>一套。"},
	{2, 95, 5284, "看朱成碧外装包",  2, {{1001, 1002, 1003, 1004}, {425,426,427}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>看朱成碧外装<color>一套。"},
	{2, 95, 5319, "熏梅染柳外装包",  2, {{1077, 1078, 1079, 1080}, {485,486,487}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>熏梅染柳外装<color>一套。"},
	{2, 95, 5320, "晴空碧霄外装包",  2, {{1093, 1094, 1095, 1096}, {494,495,496}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>晴空碧霄外装<color>一套。"},
	{2, 95, 5338, "秋风暮雨外装包",  2, {{1101, 1102, 1103, 1104}, {503,504,505}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>秋风暮雨外装<color>一套。"},
	{2, 95, 5474, "寒塘雁迟外装包",  2, {{1133, 1134, 1135, 1136}, {530,531,532}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>寒塘雁迟外装<color>一套。"},
	{2, 95, 5542, "霜轻萋萋外装包",  2, {{1109, 1110, 1111, 1112}, {509,510,511}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>霜轻萋萋外装<color>一套。"},
	{2, 95, 5543, "潇湘烟暝外装包",  2, {{1113, 1114, 1115, 1116}, {512,513,514}, 1}, {1,100}, "装有外装的包裹，打开可以获得对应体型<color=yellow>潇湘烟暝外装<color>一套。"},
	{2, 95, 5561, "柳梢云雾外装包",  2, {{1145, 1146, 1147, 1148}, {536,537,538}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>柳梢云雾外装<color>一套。"},
	{2, 95, 5603, "碧山晚云外装包",  2, {{1089, 1090, 1091, 1092}, {500,501,502}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>碧山晚云外装<color>一套。"},
	{2, 95, 5704, "琼树桂魄外装包",  2, {{1121, 1122, 1123, 1124}, {518,519,520}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>琼树桂魄外装<color>一套。"},
	{2, 95, 5705, "玉人金缕外装包",  2, {{1141, 1142, 1143, 1144}, {533,534,535}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>玉人金缕外装<color>一套。"},
	{2, 95, 5708, "微霭和风外装包",  2, {{1153, 1154, 1155, 1156}, {542,543,544}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>微霭和风外装<color>一套。"},
	{2, 95, 5710, "刹那昙华外装包",  2, {{1129, 1130, 1131, 1132}, {527,528,529}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>刹那昙华外装<color>一套。"},
	{2, 95, 5711, "胭脂雪落外装包",  2, {{1125, 1126, 1127, 1128}, {521,522,523}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>胭脂雪落外装<color>一套。"},
	{2, 95, 5712, "霜华月明外装包",  2, {{1117, 1118, 1119, 1120}, {515,516,517}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>霜华月明外装<color>一套。"},
	{2, 102, 3, "春意盎然外装包",  2, {{1005, 1006, 1007, 1008}, {428,429,430}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>春意盎然外装<color>一套。"},
	{2, 102, 4, "逍遥外装包",  2, {{413, 443, 408, 398}, {103,104,105}, 0}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>逍遥外装<color>一套。"},
	{2, 102, 170, "未羊守岁外装包（雪色）",  2, {{905, 906, 907, 908}, {359,360,361}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>未羊守岁外装（雪色）<color>一套。"},
	{2, 102, 171, "暖日和风外装包",  2, {{1037, 1038, 1039, 1040}, {455,456,457}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>暖日和风外装<color>一套。"},
	{2, 102, 184, "摇铃听歌外装包",  2, {{957, 958, 959, 960}, {392,393,394}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>摇铃听歌外装<color>一套。"},
	{2, 102, 185, "飞鸿残霞外装包",  2, {{1065, 1066, 1067, 1068}, {476,477,478}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>飞鸿残霞外装<color>一套。"},
	{2, 102, 186, "暗香盈袖外装包",  2, {{1061, 1062, 1063, 1064}, {473,474,475}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>暗香盈袖外装<color>一套。"},
	{2, 95, 5475, "天羽袈裟外装包",  2, {{713, 714, 715, 716}, {194,195,196}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>天羽袈裟外装<color>一套。"},
	{2, 95, 5476, "黯魂鎏金装包裹",  2, {{680, 681, 682, 683}, {257,258,259}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>黯魂鎏金装外装<color>一套。"},
	{2, 95, 5477, "白露霜华外装包",  2, {{961, 962, 963, 964}, {401,402,403}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>白露外装<color>一套。"},
	{2, 95, 5478, "遗世独立外装包裹",  2, {{969, 970, 971, 972}, {410,411,412}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>遗世独立外装<color>一套。"},
	{2, 95, 5479, "香泽桃磎外装包裹",  2, {{1157, 1158, 1159, 1160}, {545,546,547}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>香泽桃磎外装<color>一套。"},
	{2, 95, 5480, "碧海潮生外装包裹",  2, {{1137, 1138, 1139, 1140}, {527,528,529}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>碧海潮生外装<color>一套。"},
	{2, 95, 5481, "露华香雪外装包裹",  2, {{1165, 1166, 1167, 1168}, {548,549,550}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>露华香雪外装<color>一套。"},
	{2, 95, 5857, "幽草晚晴外装包",  2, {{1161, 1162, 1163, 1164}, {554,555,556}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>幽草晚晴外装<color>一套。"},
	{2, 95, 3296, "流风回雪外装包",  2, {{0, 0, 801, 802}, {287,288,289}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>流风回雪外装<color>一套。"},
	{2, 95, 3540, "辛丑守岁外装包",  2, {{901, 902, 903, 904}, {356,357,358}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>辛丑守岁外装<color>一套。"},
	{2, 95, 3541, "辛丑守岁外装包(雪)",  2, {{905, 906, 907, 908}, {359,360,361}, 1}, {1,100}, "外装包，打开可以获得对应体型<color=yellow>辛丑守岁外装(雪色)<color>一套。"},
	
	{2, 95,5465, "小包小般若树种", 1, {item = {{gdp={2,0,504,10,1}, name = "小般若树种"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>小般若树种<color>。"},	
	{2, 95,5466, "小包般若树种", 1, {item = {{gdp={2,0,398,10,1}, name = "般若树种"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>般若树种<color>。"},	
	{2, 95,5467, "大包般若树种", 1, {item = {{gdp={2,0,398,50,1}, name = "般若树种"},},}, {1,100}, "打开这个包裹，您可以获得50个<color=yellow>般若树种<color>。"},		
	{2, 95,5468, "小包藏剑英雄帖", 1, {item = {{gdp={2,0,31,10,1}, name = "藏剑英雄帖"},},}, {1,100}, "打开这个包裹，您可以获得10个<color=yellow>藏剑英雄帖<color>。"},		
	{2, 95,5470, "打包的神器", 1, {item = {{gdp={2,95,55,100,1}, name = "神器"},},}, {1,100}, "打开这个包裹，您可以获得100个<color=yellow>神器<color>。"},		
	
	
	
	
	
	
}

function OnUse(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == G and value[2] == D and value[3] == P then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end

	style = tTab[nTabIndex][5]
	exchange = tTab[nTabIndex][6]
	dialog = tTab[nTabIndex][8] or ""
	room = tTab[nTabIndex][7] or ""
	UsePackToItem(PlayerIndex, nItemIndex, style, exchange, dialog, room)
end


function UsePackToItem(nPlayerIndex, nItemIndex, style, exchange, dialog, room)
	if style == 0 or style == 9  then
		open_pack_item(nPlayerIndex, nItemIndex, style, exchange, room)
	elseif style == 2 then
		local szMsg = ""
		if exchange[3] == 0 then
			szMsg = "\n<color=red>提示：可以选择叠起来收纳到衣橱，也可以直接获取外装<color>。"
		end
		local szTitle = dialog.."要打开么？"..szMsg
		local tbOpt = {}
			tinsert(tbOpt, {"是的，我直接打开", open_pack_item, {nPlayerIndex, nItemIndex, style, exchange, room, 1}})
			if exchange[3] == 0 then
				tinsert(tbOpt, {"是的，我要叠起来", open_pack_item, {nPlayerIndex, nItemIndex, style, exchange, room, 2}})
			end
			tinsert(tbOpt, {"暂时不打开", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	else
		local szMsg = ""
		if room[3] ~= nil and room[3] ~= "" then
			szMsg		= ""
		else
			szMsg		= "要打开么？"
		end
		local szTitle = dialog..szMsg
		local tbOpt = {}
			tinsert(tbOpt, {"是的", open_pack_item, {nPlayerIndex, nItemIndex, style, exchange, room}})
			tinsert(tbOpt, {"取消", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function open_pack_item(nPlayerIndex, nItemIndex, style, exchange, room, nType)
	PlayerIndex = nPlayerIndex
	local sItemName, g, d, p = get_item_info(nItemIndex)
	if style == 0 then
		local spopval = exchange[1]
		local spoptype = exchange[2]
		if spoptype == 2 then
			local nHave = havepop()
			for i = 1, getn(nHave) do
				AddPop(nHave[i],spopval)
				tPop = 1
			end
		elseif spoptype == 1 then
			local nHave = havepop()
			local nR = random(1, getn(nHave))
			AddPop(nHave[nR],spopval)
			tPop = 1
		end
		if tPop == 1 then
			DelItem(g, d, p, 1)
		end
	elseif style == 9 then
		local skillid = exchange[1]
		local skilltype = exchange[2]
		local skillname = exchange[3]
		local caption = nil
		local szmsg = nil
		if (GetSex() == 1) then
			caption = "少侠"
		else
			caption = "女士"
		end
		if (is_married(PlayerIndex) ~= 1) then
			Talk(1,"", caption.."还没有结婚，不能学习"..skillname.."技能。");
			return
		end
		if skilltype == 1 then
			if HaveLearnedSkill(skillid) == 1 then
				Talk(1,"", caption.."已经学习了"..skillname.."技能。");
				return
			end;
		end
		if skilltype == 2 then
			if HaveLearnedSkill(skillid) < 1 then
				Talk(1,"", caption.."还未学习了"..skillname.."技能，等学习了"..skillname.."才能升级。");	
				return
			end;
		end
		if skilltype == 1 then
			LearnSkill(skillid)
			tFlag = 1
			szmsg = caption.."成功学习了"..skillname.."技能"
		end
		if skilltype == 2 then
			local nSkillLevel = GetSkillLevel(skillid)
			for i=nSkillLevel, nSkillLevel + 1 do
				LevelUpSkill(skillid)
			end
			tFlag = 1
			szmsg = caption.."成功升级了"..skillname.."技能"
		end
		if tFlag == 1 then
			DelItem(g, d, p, 1)
			Msg2Player(szmsg);
		end
	elseif style == 2 then
		local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
		local nRoute = GetPlayerRoute();
		local nBody = GetBody();
		local nRouteFlag = 0
		if nRoute > 0 then
			for _, ckRoute in tbRouteTable do
				if ckRoute == nRoute then
					nRouteFlag		= 1;	-- Route标识
				end
			end
		end
		if nRouteFlag ~= 1 then
			Talk(1,"","侠士还没加入任何流派，不能兑换装备。");
			return
		end;
		local nFreeRoom		= GetFreeItemRoom()
		local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight()
		local nNeedCount		= 0
		local nTime			= 0
		local nPlace			= 0
		if room[3] ~= nil and room[3] ~= "" then
			nNeedCount		= room[3]
		else
			nNeedCount		= 1
		end
		if room[4] ~= nil and room[4] ~= "" then
			nTime		= room[4]*24*60*60
		else
			nTime		= 0
		end
		if room[5] ~= nil and room[5] ~= "" then
			nPlace		= room[5]
		else
			nPlace		= 0
		end
		-- 负重
		if nFreeWeight < room[2] then
			local szTalk = {"您的背包负重不足{"..room[2].."}，不能打开{"..sItemName.."}！",}
			TalkEx("", szTalk)
			return 0
		end
		-- 空间
		if nFreeRoom < room[1] then
			local szTalk = {"您的背包空间不足{"..room[1].."}，不能打开{"..sItemName.."}！",}
			TalkEx("", szTalk)
			return 0
		end
		-- 需要数量
		if GetItemCount(g, d, p) < nNeedCount then
			local szTalk = {"您的{"..sItemName.."}数量不足，请检查后再来！",}
			TalkEx("", szTalk)
			return 0
		end

		if nType == 2 then
			local tIndex = exchange[2];
			local nID3 = exchange[1][nBody];
			local bCheck = 0;
			for i=1,getn(tIndex) do
				if GetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i]) ~= 1 then
					bCheck = 1;
					break
				end
			end
			if bCheck ~= 1 then
				Talk(1, "", "您的衣橱里已经有此装备了。");
				return
			end	
			if nID3 == 0 then
				Talk(1, "", "此套外装限制了体系，侠士体型不匹配。");
				return
			end	
		end
		if (DelItem(g, d, p, nNeedCount) == 1) then
			if style == 2 then
				if nType == 1 then
					local nID3 = exchange[1][nBody];
					if nPlace == 0 then
						fe_AddFactionEquipment(108, nID3, nTime)
						fe_AddFactionEquipment(109, nID3, nTime)
						fe_AddFactionEquipment(110, nID3, nTime)
					else
						for i = 1, getn(nPlace) do
							fe_AddFactionEquipment(nPlace[i], nID3, nTime)
						end
					end
				else
					local tIndex = exchange[2];
					for i=1,getn(tIndex) do
						if SetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i], 1) ~= 1 then
							WriteLog(format("[外装收藏] [SetPlayerCollectionData] [Failed] [Acc: %s] [Role: %s] [Collection: %d, %d]", GetAccount(), GetName(), g_COLLECT_COAT_ID, tIndex[i]));
						end
					end
					Talk(1,"","您成功将外装叠起来放入衣橱里，如果下次装备外装，可以通过[<color=yellow>御萱千变盒<color>][小小衣橱]取出。");
				end
			end
		end
	else
		local nFreeRoom		= GetFreeItemRoom()
		local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight()
		local nNeedCount		= 0
		if room[3] ~= nil and room[3] ~= "" then
			nNeedCount		= room[3]
		else
			nNeedCount		= 1
		end
		-- 负重
		if nFreeWeight < room[2] then
			local szTalk = {"您的背包负重不足{"..room[2].."}，不能打开{"..sItemName.."}！",}
			TalkEx("", szTalk)
			return 0
		end
		-- 空间
		if nFreeRoom < room[1] then
			local szTalk = {"您的背包空间不足{"..room[1].."}，不能打开{"..sItemName.."}！",}
			TalkEx("", szTalk)
			return 0
		end
		-- 需要数量
		if GetItemCount(g, d, p) < nNeedCount then
			local szTalk = {"您的{"..sItemName.."}数量不足，请检查后再来！",}
			TalkEx("", szTalk)
			return 0
		end

		if (DelItem(g, d, p, nNeedCount) == 1) then
			if style == 1 then
				tbAwardTemplet:Give(exchange, "包裹释放", "释放"..sItemName)
			end
		end
	end

end

function fe_AddFactionEquipment(nID2, nID3, nTime)
	local name = GetItemName(0,nID2,nID3)
	local nRet, nItemIdx = 0, 0
	nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	if nTime ~= 0 then
		SetItemExpireTime(nItemIdx, nTime)
	end
	Msg2Player("您获得了["..name.."]×1");
end


function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

-- 是否已经结婚
function is_married(player)
	local old_idx = PlayerIndex
	local result = 0
	PlayerIndex = player
	if (GetMateName() ~= "") then
		result = 1
	end
	PlayerIndex = old_idx
	return result
end

-- 退出对话，不做任何操作
function cancel_dialog()
end