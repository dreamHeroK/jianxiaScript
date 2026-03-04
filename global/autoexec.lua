--自动加载NPC脚本,服务器启动时调用
Include("\\script\\online\\春节活动\\newyear_head.lua")
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");--越南09年7月活动开关头文件
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Import("\\script\\class\\ktabfile.lua");--tab文件处理
Include("\\script\\system_switch_config.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\equip_feed\\equip_feed_npc.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
-- Include("\\script\\missions\\tong_activity\\head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\北区\\雁门关\\addnpcandtrap.lua")
Include("\\script\\江南区\\明教\\addnpcandtrap.lua")
Include("\\script\\西南区\\武林盟\\addnpcandtrap.lua")
Include("\\script\\西南区\\玉融峰\\addnpcandtrap.lua")
Include("\\script\\西南区\\翠烟\\addnpcandtrap.lua")
Include("\\script\\西北区\\昆仑\\addnpcandtrap.lua")
Include("\\script\\西南区\\五毒教\\addnpcandtrap.lua")
Include("\\script\\中原一区\\天波杨府\\addnpcandtrap.lua")
Include("\\script\\中原二区\\唐门\\addnpcandtrap.lua")
Include("\\script\\中原二区\\峨嵋\\addnpcandtrap.lua")
Include("\\script\\中原一区\\丐帮\\addnpcandtrap.lua")
Include("\\script\\中原二区\\武当\\addnpcandtrap.lua")
Include("\\script\\中原一区\\少林\\addnpcandtrap.lua")
Include("\\script\\燕云剑戈\\红莲山\\addnpcandtrap.lua")
Include("\\script\\燕云剑戈\\葬雪城\\addnpcandtrap.lua")
Include("\\script\\missions\\taixu_mission\\addnpcandtrap.lua")
Include("\\script\\global\\gm\\createautobuff.lua")
-- KSGVN
Include("\\script\\ksgvn\\autoexec\\autoload_npc.lua")
Include("\\script\\ksgvn\\autoexec\\autoload_features.lua")
-- end KSGVN


function handle_event(data, para)
	return main()
end

-- 职能NPC
npclist_function = {
--	{"武林盟护卫","武林盟传人",100,1440,2964,"\\script\\task\\teach\\新手指引npc.lua"},
--	{"武林盟护卫","武林盟传人",150,1694,3146,"\\script\\task\\teach\\新手指引npc.lua"},
--	{"武林盟护卫","武林盟传人",200,1397,2849,"\\script\\task\\teach\\新手指引npc.lua"},
--	{"武林盟护卫","武林盟传人",300,1750,3524,"\\script\\task\\teach\\新手指引npc.lua"},
--	{"武林盟护卫","武林盟传人",350,1452,2991,"\\script\\task\\teach\\新手指引npc.lua"},

--	{"紫清上人","礼官",100,1512,2990,"\\script\\中原一区\\汴京\\npc\\大内总管.lua"},
--	{"紫清上人","礼官",300,1787,3497,"\\script\\中原一区\\汴京\\npc\\大内总管.lua"},
--	{"紫清上人","礼官",400,1506,2847,"\\script\\中原一区\\汴京\\npc\\大内总管.lua"},

	{"中年瘦官吏1","VIP回馈大使",200,1484,2770,"\\script\\中原一区\\汴京\\npc\\VIP大使.lua"},

	{"西南马车船夫","大理车夫",400,1465,3110,"\\script\\西南区\\大理府\\npc\\大理车夫.lua"},
	{"西南马车船夫","大理车夫",400,1549,2882,"\\script\\西南区\\大理府\\npc\\大理车夫.lua"},
	{"西南马车船夫","大理车夫",400,1574,3110,"\\script\\西南区\\大理府\\npc\\大理车夫.lua"},

	{"吐蕃马车船夫","凤翔车夫",500,1849,3061,"\\script\\西北区\\凤翔府\\npc\\凤翔车夫.lua"},
	{"吐蕃马车船夫","凤翔车夫",500,1803,3220,"\\script\\西北区\\凤翔府\\npc\\凤翔车夫.lua"},
	{"吐蕃马车船夫","凤翔车夫",500,1671,3089,"\\script\\西北区\\凤翔府\\npc\\凤翔车夫.lua"},
	{"吐蕃马车船夫","凤翔车夫",500,1671,3202,"\\script\\西北区\\凤翔府\\npc\\凤翔车夫.lua"},

 	--采集地图车夫
	{"中原马车船夫","车夫",714,1425,2847,"\\script\\世界地图\\南槐谷\\npc\\车夫.lua"},
	{"中原马车船夫","车夫",714,1585,3166,"\\script\\世界地图\\南槐谷\\npc\\车夫.lua"},
	{"中原马车船夫","车夫",719,1624,3269,"\\script\\世界地图\\含幽谷\\npc\\车夫.lua"},
	{"中原马车船夫","车夫",719,1785,3516,"\\script\\世界地图\\含幽谷\\npc\\车夫.lua"},
	{"中原马车船夫","车夫",724,1656,3554,"\\script\\世界地图\\轩辕谷\\npc\\车夫.lua"},
	{"中原马车船夫","车夫",724,1814,3554,"\\script\\世界地图\\轩辕谷\\npc\\车夫.lua"},

	--进出桃花岛添加的NPC
	{"中原马车船夫","桃花岛船夫",102,1459,3163,"\\script\\江南区\\桃花岛\\npc\\桃花岛船夫.lua"},
	{"中原马车船夫","海滨船夫",104,1568,2975,"\\script\\江南区\\东海海滨二\\npc\\东海海滨2船夫.lua"},

	{"职能武林盟主1","门派接引人",150,1723,3143,"\\script\\西南区\\大理府\\npc\\门派接引人.lua"},
	{"职能武林盟主1","门派接引人",350,1434,2963,"\\script\\西南区\\大理府\\npc\\门派接引人.lua"},
	{"职能武林盟主1","门派接引人",400,1548,2981,"\\script\\西南区\\大理府\\npc\\门派接引人.lua"},
	{"职能武林盟主1","门派接引人",500,1751,3141,"\\script\\西北区\\凤翔府\\npc\\门派接引人.lua"},

	{"中原储物柜","物品保管人",400,1527,3112,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",400,1456,3071,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",400,1553,2914,"\\script\\global\\路人_物品保管人.lua"},

	{"吐蕃储物柜","物品保管人",500,1798,3216,"\\script\\global\\路人_物品保管人.lua"},
	{"吐蕃储物柜","物品保管人",500,1656,3214,"\\script\\global\\路人_物品保管人.lua"},
	{"吐蕃储物柜","物品保管人",500,1678,3095,"\\script\\global\\路人_物品保管人.lua"},
	{"吐蕃储物柜","物品保管人",500,1828,3048,"\\script\\global\\路人_物品保管人.lua"},

	--成都东门加物品保管人
	{"中原储物柜","物品保管人",300,1913,3615,"\\script\\global\\路人_物品保管人.lua"},

	{"挑担的","行脚商人",100,1462,2922,"\\script\\中原一区\\汴京\\npc\\行脚商人.lua"},
	{"挑担的","行脚商人",150,1698,3203,"\\script\\中原一区\\汴京\\npc\\行脚商人.lua"},

--	{"瘦富家老头","神秘商人",200,1488,2826,"\\script\\中原一区\\汴京\\npc\\神秘商人.lua"},
--	{"游方相士","神秘商人",100,1274,2962,"\\script\\vng\\vanmay_daohuu\\vanmay_npc.lua"},

--	{"中原当铺老板","商会老板",150,1636,3139,"\\script\\中原一区\\汴京\\npc\\商会老板.lua"},
--	{"中原当铺老板","商会老板",350,1456,2925,"\\script\\中原一区\\汴京\\npc\\商会老板.lua"},
--	{"程颐","商会老板",400,1486,2924,"\\script\\西南区\\大理府\\npc\\商会老板.lua"},
--	{"程颐","商会老板",500,1772,3186,"\\script\\西北区\\凤翔府\\npc\\商会老板.lua"},

	{"中原武器店老板","武器店老板",400,1566,3005,"\\script\\西南区\\大理府\\npc\\武器店老板.lua"},
	{"吐蕃铁匠师傅","武器店老板",500,1747,3092,"\\script\\西北区\\凤翔府\\npc\\武器店老板.lua"},
	 --公冶世家
	{"中原武器店老板","公冶兵",350,1399,2997,"\\script\\global\\路人_公冶世家.lua"},
	{"中原武器店老板","公冶器",150,1647,3149,"\\script\\global\\路人_公冶世家.lua"},
	{"中原武器店老板","公冶具",400,1493,3053,"\\script\\global\\路人_公冶世家.lua"},
	{"村中少年","刘铁匠弟子",350,1410,2925,"\\script\\中原二区\\襄阳\\npc\\刘铁匠弟子.lua"},
	
	{"西南玉器老板","饰品店老板",400,1497,2940,"\\script\\西南区\\大理府\\npc\\饰品店老板.lua"},
	{"吐蕃玉器老板","饰品店老板",500,1721,3115,"\\script\\西北区\\凤翔府\\npc\\饰品店老板.lua"},

	{"西南当铺老板","酒楼老板",400,1524,2894,"\\script\\西南区\\大理府\\npc\\酒楼老板.lua"},
	{"吐蕃当铺老板","酒楼老板",500,1700,3176,"\\script\\西北区\\凤翔府\\npc\\酒楼老板.lua"},

	{"西南武器店老板","男装店老板",400,1471,2956,"\\script\\西南区\\大理府\\npc\\男装店老板.lua"},
	{"吐蕃武器店老板","男装店老板",500,1739,3098,"\\script\\西北区\\凤翔府\\npc\\男装店老板.lua"},

	{"西南绸缎庄老板","女装店老板",400,1498,2969,"\\script\\西南区\\大理府\\npc\\女装店老板.lua"},
	{"绸缎庄老板","女装店老板",500,1701,3114,"\\script\\西北区\\凤翔府\\npc\\女装店老板.lua"},

	{"吐蕃药店掌柜","杂货店老板",400,1511,2955,"\\script\\西南区\\大理府\\npc\\杂货店老板.lua"},
	{"吐蕃当铺老板","杂货店老板",500,1730,3109,"\\script\\西北区\\凤翔府\\npc\\杂货店老板.lua"},

	{"西南药店掌柜","药店老板",400,1522,3007,"\\script\\西南区\\大理府\\npc\\药店老板.lua"},
	{"吐蕃药店掌柜","药店老板",500,1763,3091,"\\script\\西北区\\凤翔府\\npc\\药店老板.lua"},

	{"官员","凤翔府太守",500,1886,3102,"\\script\\西北区\\凤翔府\\npc\\凤翔府太守.lua"},

	{"官府衙役","捕头",100,1518,2988,"\\script\\中原二区\\成都\\npc\\捕头.lua"},
	{"官府衙役","捕头",150,1739,3158,"\\script\\中原二区\\成都\\npc\\捕头.lua"},
	{"官府衙役","捕头",350,1507,2997,"\\script\\中原二区\\成都\\npc\\捕头.lua"},
	{"六扇门高手1","捕头",500,1893,3114,"\\script\\西北区\\凤翔府\\npc\\捕头.lua"},
--	{"官府衙役","狱卒",701,1376,3143,"\\script\\task\\prison\\jailer_npc.lua"},
--	{"官府衙役","狱卒",200,1397,2653,"\\script\\task\\prison\\gaoler_npc.lua"},

--	{"王安石","藏剑使者",100,1510,3106,"\\script\\藏剑山庄\\task_script\\泉州\\藏剑使者.lua"},
	{"王安石","藏剑使者",100,1510,3106,"\\script\\新藏剑山庄\\s1山门\\jt_npc.lua"},	
    {"江湖俊杰", "藏剑剑僮", 100,1504,3104, "\\script\\missions\\cangjianshanzhuang\\wjz_mission_entry_npc.lua"},
--	{"王安石","藏剑使者",150,1745,3119,"\\script\\藏剑山庄\\task_script\\扬州\\藏剑使者.lua"},
--	{"王安石","藏剑使者",200,1229,2762,"\\script\\藏剑山庄\\task_script\\汴京\\藏剑使者.lua"},
--	{"王安石","藏剑使者",300,1776,3703,"\\script\\藏剑山庄\\task_script\\成都\\藏剑使者.lua"},
--	{"王安石","藏剑使者",350,1395,2851,"\\script\\藏剑山庄\\task_script\\襄阳\\藏剑使者.lua"},

}

-- 角色NPC
npclist_role = {
--	{"村中少年","李丰收",100,1607,2970,"\\script\\江南区\\泉州\\npc\\收耕学习.lua"},
--	{"游方医生","林药师",100,1558,2958,"\\script\\江南区\\泉州\\npc\\采药学习.lua"},
--	{"云游道人","莫君道长",100,1390,2965,"\\script\\江南区\\泉州\\npc\\集灵技能.lua"},
--	{"渔民","渔父",100,1409,3155,"\\script\\江南区\\泉州\\npc\\钓鱼学习.lua"},
--	{"中原药店掌柜","鲁伯能",200,1327,2728,"\\script\\中原一区\\汴京\\npc\\天工学习.lua"},
--	{"中原武器店老板","明师傅",350,1546,2930,"\\script\\中原二区\\襄阳\\npc\\制帽技能.lua"},
--	{"苗族少女","紫鹃姑娘",400,1409,2980,"\\script\\西南区\\大理府\\npc\\制裤技能.lua"},

	{"老年男","卓天行",350,1427,3024,"\\script\\中原二区\\襄阳\\npc\\卓天行.lua"},
	{"玲音","玲音",405,1323,2957,"\\script\\西南区\\武陵山脚\\npc\\玲音.lua"},
	{"蚩火小头目","蚩火小头目",405,1303,2971,"\\script\\西南区\\武陵山脚\\npc\\蚩火小头目.lua"},
	{"许少贤","许少贤",406,1325,2719,"\\script\\西南区\\武陵山\\npc\\许少贤.lua"},
	{"武陵山秋蓉","武陵山秋蓉",406,1472,3161,"\\script\\西南区\\武陵山\\npc\\武陵山秋蓉.lua"},
	{"瘦富家老头","刘管家",105,1412,3090,"\\script\\江南区\\泉州府西\\npc\\刘管家.lua"},	
--	{"杨浩辰","杨浩辰",103,1855,3374,"\\script\\江南区\\东海海滨一\\npc\\杨浩辰.lua"},
--	{"苏羽馨","神秘少女",103,1861,3372,"\\script\\江南区\\东海海滨一\\npc\\神秘少女.lua"},
	{"苏羽馨","苏羽馨",100,1272,3121,"\\script\\江南区\\泉州\\npc\\苏羽馨.lua"},
	{"李师师","刘思英",150,1668,3225,"\\script\\江南区\\扬州\\npc\\刘思英.lua"},
	{"苗族少女", "神秘少女",100,1415,2985,"\\script\\江南区\\泉州\\npc\\神秘少女.lua"},
	{"杨延昭","装备合成大师",100,1457,2930,"\\script\\江南区\\泉州\\npc\\hecheng.lua"},
	{"杨延昭","神兵锻造大师",100,1444,2945,"\\script\\global\\路人_公冶世家.lua"},
	{"战旗·风","披风令锻造",100,1433,2971,"\\script\\global\\天使之恋1.lua"},
	{"峨嵋首席性感女","天工巧手刘诗英",100,1437,2982,"\\script\\isolate\\functions\\armory\\npc_liushiying.lua"},
	{"峨嵋首席性感女","神秘女子",100,1422,3025,"\\script\\task\\killer_hall\\entrance_npc.lua"},

}
-- TASKNPC
npclist_dialog_create = {
	{"吐蕃马车船夫","张大友",106,1307,2983,"\\script\\江南区\\龙泉村\\npc\\张大友.lua"},
	{"星字机关人","月亮机关",111,1665,2826,"\\script\\task\\npc\\月亮机关.lua"},
	{"星字机关人","乌鸦机关",111,1698,3114,"\\script\\task\\npc\\乌鸦机关.lua"},
	{"星字机关人","太阳机关",111,1862,3040,"\\script\\task\\npc\\太阳机关.lua"},
	{"星字机关人","白云机关",111,1830,2849,"\\script\\task\\npc\\白云机关.lua"},
	{"峨嵋首席性感女","峨眉弟子",6012,1601,3209,"\\script\\世界地图\\少林议事厅\\峨眉弟子.lua"},
	{"杨门首席娇小女","杨门弟子",6012,1588,3207,"\\script\\世界地图\\少林议事厅\\杨门弟子.lua"},
	{"五毒首席标准男","五毒弟子",6012,1591,3204,"\\script\\世界地图\\少林议事厅\\五毒弟子.lua"},
	{"武当首席标准男","武当弟子",6012,1595,3202,"\\script\\世界地图\\少林议事厅\\武当弟子.lua"},
	{"唐门首席标准男","唐门弟子",6012,1598,3211,"\\script\\世界地图\\少林议事厅\\唐门弟子.lua"},
	{"丐帮首席标准男","丐帮弟子",6012,1596,3214,"\\script\\世界地图\\少林议事厅\\丐帮弟子.lua"},
	{"少林方丈","无名僧",6012,1601,3200,"\\script\\世界地图\\少林议事厅\\无名僧.lua"},
	{"中原药店掌柜","秃笔翁",6016,1562,2938,"\\script\\西南区\\梅庄\\秃笔翁.lua"},
	{"闪加","绿竹翁",350,1574,2904,"\\script\\中原二区\\襄阳\\npc\\绿竹翁.lua"},
	{"老年男","李老",507,1686,3322,"\\script\\task\\npc\\李老.lua"},
	{"吐蕃药店掌柜","岳不群",502,1682,3102,"\\script\\西北区\\华山\\npc\\岳不群.lua"},
	{"秦不智","秦不智",218,1627,3245,"\\script\\中原一区\\灵宝山\\npc\\颜柯.lua"},
	{"李元旭","向问天",6009,1598,3200,"\\script\\江南区\\桃花岛\\向问天.lua"},
	{"李元旭","向问天",6010,1598,3200,"\\script\\江南区\\桃花岛\\向问天.lua"},
	{"李元旭","向问天",6011,1598,3200,"\\script\\世界地图\\桃花小栈\\向问天.lua"},
	{"李元旭","向问天",6017,1628,3274,"\\script\\西南区\\黑木崖\\向问天.lua"},
	{"李元旭","向问天",6018,1596,3040,"\\script\\西南区\\黑木崖2\\向问天.lua"},
	{"任盈盈","任盈盈",6014,1580,3115,"\\script\\世界地图\\西岛\\任盈盈.lua"},
	{"任盈盈","任盈盈",6011,1602,3204,"\\script\\世界地图\\桃花小栈\\任盈盈.lua"},
	{"任盈盈","任盈盈",6017,1636,3273,"\\script\\西南区\\黑木崖\\任盈盈.lua"},
	{"任盈盈","任盈盈",6018,1581,2889,"\\script\\西南区\\黑木崖2\\任盈盈.lua"},
	{"明教教主","任我行",6013,1634,3216,"\\script\\世界地图\\梅庄地牢\\任我行.lua"},
	{"明教教主","任我行",6010,1600,3202,"\\script\\江南区\\桃花岛\\任我行.lua"},
	{"明教教主","任我行",6011,1600,3201,"\\script\\世界地图\\桃花小栈\\任我行.lua"},
	{"明教教主","任我行",6017,1631,3270,"\\script\\西南区\\黑木崖\\任我行.lua"},
	{"明教教主","任我行",6018,1621,2897,"\\script\\西南区\\黑木崖2\\任我行.lua"},
	{"金牌第一帮活动大使","黄钟公",6016,1488,2938,"\\script\\西南区\\梅庄\\黄钟公.lua"},
	{"管家","黑总管",6015,1503,3179,"\\script\\西南区\\黑木崖\\黑总管.lua"},
	{"邵雍","黑白子",6016,1460,2988,"\\script\\西南区\\梅庄\\黑白子.lua"},
	{"谪臣","韩飞子",400,1587,3081,"\\script\\西南区\\大理府\\npc\\韩飞子.lua"},
	{"书生","丹青生",6016,1517,3003,"\\script\\西南区\\梅庄\\丹青生.lua"},
	{"北方老头2","村长",202,1411,2997,"\\script\\中原一区\\杏花村\\npc\\村长.lua"},
	{"民家少女","小翠",507,1706,3384,"\\script\\task\\npc\\百姓小翠.lua"},
	{"辽难民","李华",507,1632,3374,"\\script\\task\\npc\\百姓李华.lua"},
	{"明教护法","任我行旧部",6017,1623,3285,"\\script\\西南区\\黑木崖\\任我行旧部.lua"},
	{"明教护法","任我行旧部",6017,1619,3281,"\\script\\西南区\\黑木崖\\任我行旧部.lua"},
	{"明教护法","任我行旧部",6017,1639,3277,"\\script\\西南区\\黑木崖\\任我行旧部.lua"},
	{"明教护法","内应",6017,1715,2957,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1726,2967,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1752,2992,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1734,2979,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1743,2985,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1764,2996,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1744,3005,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1731,3011,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1716,3017,"\\script\\task\\npc\\内应.lua"},
	{"明教护法","内应",6017,1699,3001,"\\script\\task\\npc\\内应.lua"},
	{"萨迦宁布","杨莲亭",6017,1622,2897,"\\script\\西南区\\黑木崖\\杨莲亭.lua"},
	{"萨迦宁布","杨莲亭",105,1555,3040,"\\script\\江南区\\泉州府西\\npc\\杨莲亭.lua"},
	{"瘦富家老头","鲍长老",215,1748,3066,"\\script\\中原一区\\黑风洞\\npc\\鲍长老.lua"},
	{"任盈盈","圣女任盈盈",150,1664,3165,"\\script\\江南区\\扬州\\npc\\圣女任盈盈.lua"},
	{"任盈盈","圣女任盈盈",500,1742,3039,"\\script\\missions\\hunduantongtianding\\ttd_mission_entry_npc.lua"},
}

-- 替身采集托管人
npclist_create_gather = {
	{"游方医生","采集指导",724,1737,3377,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"游方医生","采集指导",714,1500,3018,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"游方医生","含幽谷采集指导",719,1708,3376,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"中原马车船夫","兴安岭采集指导",710,1711,3395,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"中原马车船夫","会仙岭采集指导",715,1500,2992,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"中原马车船夫","苍龙岭采集指导",720,1727,3346,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"村中少年","青水村采集指导",713,1481,2944,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"村中少年","盈民村采集指导",718,1703,3410,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"村中少年","岚岳村采集指导",723,1701,3456,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"中原武器店老板","石门洞采集指导",711,1721,3373,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"中原武器店老板","灵岩洞采集指导",716,1707,3038,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"中原武器店老板","悬星洞采集指导",721,1682,3336,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"驯兽师","空桑山采集指导",712,1480,2919,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"妇女1","昆吾山采集指导",717,1744,2957,"\\script\\tishencaiji\\tishen_npc.lua"},
	{"驯兽师","紫桑山采集指导",722,1755,3430,"\\script\\tishencaiji\\tishen_npc.lua"},
	--采集地图物品保管人
	{"中原储物柜","物品保管人",710,1700,3391,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",711,1730,3368,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",712,1467,2926,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",713,1485,2952,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",714,1514,3018,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",715,1493,2992,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",716,1719,3037,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",717,1755,2976,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",718,1713,3394,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",719,1698,3377,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",720,1717,3342,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",721,1691,3323,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",722,1743,3427,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",723,1698,3445,"\\script\\global\\路人_物品保管人.lua"},
	{"中原储物柜","物品保管人",724,1725,3384,"\\script\\global\\路人_物品保管人.lua"},
}

npclist_create_xinan = {
	{"蚩火大护法","蚩火大护法",417,1642,3382,"\\script\\西南区\\白水洞二层\\npc\\蚩火大护法.lua"},
	{"夜叉鸦","夜叉",417,1815,3412,"\\script\\西南区\\白水洞二层\\npc\\夜叉.lua"},
	{"憎恶","蚩火僧恶",416,1724,2821,"\\script\\西南区\\白水洞一层\\npc\\蚩火僧恶.lua"},
	{"中年瘦官吏1","高升泉",400,1537,3050,"\\script\\西南区\\大理府\\npc\\高升泉.lua"},
	{"老板娘","郑贯之",400,1593,2928,"\\script\\西南区\\大理府\\npc\\郑贯之.lua"},
	{"老年男","董迦罗",400,1522,2848,"\\script\\西南区\\大理府\\npc\\董迦罗.lua"},
	{"管家","陈立衡",400,1470,2847,"\\script\\西南区\\大理府\\npc\\陈立衡.lua"},
	{"普通少年男1","刘典",400,1443,3018,"\\script\\西南区\\大理府\\npc\\刘典.lua"},
	{"狱火狂人","狱火狂人",401,1568,3085,"\\script\\西南区\\点苍山\\npc\\狱火狂人.lua"},
	{"蚩火教总坛主","蚩火教总坛主",413,1697,3192,"\\script\\西南区\\龙眼洞二层\\npc\\蚩火教总坛主.lua"},
	{"阿修罗","阿修罗",413,1701,3474,"\\script\\西南区\\龙眼洞二层\\npc\\阿修罗.lua"},
	{"蚩火大长老","蚩火大长老",412,1553,2976,"\\script\\西南区\\龙眼洞一层\\npc\\蚩火大长老.lua"},
	{"苗岭勇士","苗岭勇士",408,1321,3004,"\\script\\西南区\\苗岭\\npc\\苗岭勇士.lua"},
	{"西南男性","苗岭族长",408,1300,3140,"\\script\\西南区\\苗岭\\npc\\苗岭族长.lua"},
	{"护卫队长","护卫队长",409,1820,3518,"\\script\\西南区\\千寻塔一层\\npc\\护卫队长.lua"},
	{"乾达婆","乾达婆",409,1849,3598,"\\script\\西南区\\千寻塔一层\\npc\\乾达婆.lua"},
	{"千寻衲师","千寻衲师",410,1694,3134,"\\script\\西南区\\千寻塔二层\\npc\\千寻衲师.lua"},
	{"紧那罗","紧那罗",410,1693,3183,"\\script\\西南区\\千寻塔二层\\npc\\紧那罗.lua"},
	{"驭毒阴姬","驭毒阴姬",419,1774,3129,"\\script\\西南区\\入门迷宫二\\npc\\驭毒阴姬.lua"},
	{"腐骨毒人","腐骨毒人",418,1512,2825,"\\script\\西南区\\入门迷宫一\\npc\\腐骨毒人.lua"},
	{"狱火人","狱火人",406,1404,2770,"\\script\\西南区\\武陵山\\npc\\狱火人.lua"},
	{"半蝶人","半蝶人",405,1555,2959,"\\script\\西南区\\武陵山脚\\npc\\半蝶人.lua"},
	{"摩呼罗迦","摩呼罗迦",402,1319,2955,"\\script\\西南区\\西双版纳北部\\npc\\摩呼罗迦.lua"},
	{"大理二皇子","二皇子段素顺",403,1458,2842,"\\script\\西南区\\西双版纳南部\\npc\\大理二皇子.lua"},
	{"段承恩","段承恩",403,1537,2967,"\\script\\西南区\\西双版纳南部\\npc\\段承恩.lua"},
	{"苗岭首领","苗岭首领",421,1576,3469,"\\script\\西南区\\燕子洞二层\\npc\\苗岭首领.lua"},
}

npclist_create_xibei = {
	{"北方老头2","叶老",500,1808,3125,"\\script\\西北区\\凤翔府\\npc\\叶老.lua"},
	{"张择端","欧阳画",500,1727,3262,"\\script\\西北区\\凤翔府\\npc\\欧阳画.lua"},
	{"波斯商人","波斯商人",500,1686,3252,"\\script\\西北区\\凤翔府\\npc\\波斯商人.lua"},
	{"糖葫芦","唐葫芦",500,1675,3168,"\\script\\西北区\\凤翔府\\npc\\唐葫芦.lua"},
	{"明教教主","司马鸣风",500,1600,3157,"\\script\\西北区\\凤翔府\\npc\\司马鸣风.lua"},
	{"游方医生","孙方仁",500,1807,3045,"\\script\\西北区\\凤翔府\\npc\\孙方仁.lua"},
	{"唐门门人新","柳纵云",500,1717,2986,"\\script\\西北区\\凤翔府\\npc\\柳纵云.lua"},
	{"北方男性3","拓拔弘",500,1808,2994,"\\script\\西北区\\凤翔府\\npc\\拓拔弘.lua"},
	{"火器房主管","唐芊芊",500,1768,3256,"\\script\\西北区\\凤翔府\\npc\\唐芊芊.lua"},
	--凤翔府北
	{"袁飞云","袁飞云",504,1379,2839,"\\script\\西北区\\凤翔府\\npc\\袁飞云.lua"},
	{"鹰王","鹰王",504,1315,2977,"\\script\\西北区\\凤翔府北\\npc\\鹰王.lua"},
	{"雷胜尸体","寒星的尸体",504,1598,2906,"\\script\\西北区\\凤翔府北\\npc\\寒星的尸体.lua"},
	--龙门镇
	{"吐蕃酒店小二","店小二",507,1660,3293,"\\script\\西北区\\龙门镇\\npc\\店小二.lua"},
	{"普通少年男1","孙二琏",507,1649,3293,"\\script\\西北区\\龙门镇\\npc\\孙二琏.lua"},
	{"车轮霸王","车轮霸王",507,1791,3173,"\\script\\西北区\\龙门镇\\npc\\车轮霸王.lua"},
	{"春十三娘","春十三娘",507,1884,3317,"\\script\\西北区\\龙门镇\\npc\\春十三娘.lua"},
	--光明顶
	{"明教护法","殷铭",508,1691,2962,"\\script\\西北区\\光明顶\\npc\\殷铭.lua"},
	{"虬须客","虬须大汉",508,1792,3306,"\\script\\西北区\\光明顶\\npc\\虬须大汉.lua"},
	--古阳洞
	{"非常道人","非常道人",511,1702,3365,"\\script\\西北区\\古阳洞一层\\npc\\非常道人.lua"},
	--药王谷
	{"村中少年","刘三",511,1702,3365,"\\script\\西北区\\古阳洞一层\\npc\\非常道人.lua"},
	{"西夏法王","西夏法王",505,1538,3146,"\\script\\西北区\\药王谷\\npc\\西夏法王.lua"},
	--沙漠迷宫
--	{"独行老驼","独行老驼",506,1545,2958,"\\script\\西北区\\沙漠迷宫\\npc\\独行老陀.lua"},
	--秦始皇陵
	{"独臂","断臂",503,1412,2742,"\\script\\西北区\\秦始皇陵\\npc\\断臂.lua"},
	{"残腿","残腿",503,1587,2975,"\\script\\西北区\\秦始皇陵\\npc\\残腿.lua"},
	{"镇墓人","镇墓人",503,1513,2865,"\\script\\西北区\\秦始皇陵\\npc\\镇墓人.lua"},
	{"东守墓将军","东守墓将军",503,1530,3022,"\\script\\西北区\\皇陵墓室二层\\npc\\东守墓将军.lua"},
	{"南守墓将军","南守墓将军",503,1370,3117,"\\script\\西北区\\皇陵墓室二层\\npc\\南守墓将军.lua"},
	{"西守墓将军","西守墓将军",503,1301,2749,"\\script\\西北区\\皇陵墓室二层\\npc\\西守墓将军.lua"},
	{"北守墓将军","北守墓将军",503,1490,2773,"\\script\\西北区\\皇陵墓室二层\\npc\\北守墓将军.lua"},
	{"爪王","爪王",513,1464,2998,"\\script\\西北区\\皇陵墓室一层\\npc\\爪王.lua"},
	{"镇墓领军","东镇墓将军",514,1803,2983,"\\script\\西北区\\皇陵墓室二层\\npc\\镇墓将军东.lua"},
	{"镇墓领军","南镇墓将军",514,1629,3169,"\\script\\西北区\\皇陵墓室二层\\npc\\镇墓将军南.lua"},
	{"镇墓领军","西镇墓将军",514,1475,2977,"\\script\\西北区\\皇陵墓室二层\\npc\\镇墓将军西.lua"},
	{"镇墓领军","北镇墓将军",514,1624,2822,"\\script\\西北区\\皇陵墓室二层\\npc\\镇墓将军北.lua"},
	--鬼门回廊
	{"昆仑男弟子","昆仑弟子",328,1711,3258,"\\script\\中原二区\\鬼门回廊\\npc\\昆仑弟子.lua"},
	--天师秘境
--	{"昆仑男弟子","昆仑弟子",329,1731,3429,"\\script\\中原二区\\天师秘境\\npc\\昆仑弟子.lua"},
--	{"骷髅王","骷髅王",329,1620,3354,"\\script\\中原二区\\天师秘境\\npc\\骷髅王.lua"},
	--丰都
	{"澄义对话","澄义",307,1538,2985,"\\script\\中原二区\\丰都\\npc\\澄义.lua"},
	{"吴越老祖尸体","吴越老祖尸体",307,1436,2716,"\\script\\中原二区\\丰都\\npc\\吴越老祖尸体.lua"},
	{"清溪对话","清溪",307,1436,2801,"\\script\\中原二区\\丰都\\npc\\清溪.lua"},
	{"薛虎","薛虎",302,1575,2930,"\\script\\中原二区\\青城山\\npc\\薛虎.lua"},
	{"梅若童","梅若童",303,1492,3230,"\\script\\中原二区\\峨嵋\\npc\\梅若童.lua"},
	{"水果树","果树",303,1840,3210,"\\script\\中原二区\\峨嵋\\npc\\果树.lua"},
	--华山	
--	{"明教圣女","岳灵珊",502,1645,3224,"\\script\\西北区\\华山\\npc\\岳灵珊.lua"},
	--西北关卡
--	{"五行阵使","五行阵使",506,1325,2715,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
--	{"西北男性","白天成",506,1554,2658,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
--	{"药室看守人","药室看守人",510,1575,2853,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
--	{"昆仑男弟子","昆仑弟子",512,2061,3404,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
--	{"守墓人","守墓人",513,1591,3178,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
--	{"守墓将军","守墓将军",514,1733,2863,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
--	{"大宋西域密探","大宋西域密探",500,1759,3142,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
}

npclist_zgc_auto_fun_create = {
	--角色删除功能NPC
	{"谪臣","武林隐士",200,1313,2686,"\\script\\online\\zgc_npc_dialog.lua"},

	--结婚二期
	{"李师师","巧儿",150,1588,3143,"\\script\\task\\marriage\\qiao_girl.lua"},
	{"武当副掌门","龙光真人",500,1633,3185,"\\script\\西北区\\凤翔府\\npc\\龙光真人.lua"},

	--游戏活动大使	
--	{"职能武林盟主1","游戏活动大使",300,1726,3522,"\\script\\online\\activity_ambassador.lua"},
--	{"职能武林盟主1","游戏活动大使",200,1382,2845,"\\script\\online\\activity_ambassador.lua"},
	{"职能武林盟主1","游戏活动大使",100,1423,2968,"\\script\\online\\activity_ambassador.lua"},

	--师徒NPC	
	{"中年瘦官吏1","国子监学官",200,1463,2758,"\\script\\master_prentice\\国子监学官.lua"},
	{"火器房主管","琳汐",106,1557,3069,"\\script\\江南区\\龙泉村\\npc\\linxi_npc.lua"},
}

npclist_task_week_create = {
	{"宋将军","周末活动大使",150,1714,3137,"\\script\\task\\weekend\\周末活动大使.lua"},
	{"宋将军","周末活动大使",200,1380,2872,"\\script\\task\\weekend\\周末活动大使.lua"},
	{"宋将军","周末活动大使",350,1452,2967,"\\script\\task\\weekend\\周末活动大使.lua"},
	{"城门卫兵","兵马指挥使",100,1419,2987,"\\script\\task\\weekend\\兵马指挥使.lua"},
	--{"城门卫兵","兵马指挥使",150,1682,3161,"\\script\\task\\weekend\\兵马指挥使.lua"},
	--{"城门卫兵","兵马指挥使",350,1503,3024,"\\script\\task\\weekend\\兵马指挥使.lua"},
}

npclist_task_yangzhou_create = {
	{"游方医生","张伯汉",150,1711,3115,"\\script\\江南区\\扬州\\npc\\张伯汉.lua"},
	{"侠女","唐宁",107,1417,2946,"\\script\\江南区\\武夷山\\npc\\唐宁.lua"},
	{"游方相士","李进勇",150,1768,3112,"\\script\\江南区\\扬州\\npc\\李进勇.lua"},
	{"云游道人","刘玄清",150,1576,3112,"\\script\\江南区\\扬州\\npc\\刘玄清.lua"},
	{"老板娘","秋蓉",150,1678,3028,"\\script\\江南区\\扬州\\npc\\秋蓉.lua"},
	{"银狐之王","银狐之王",107,1387,3165,"\\script\\江南区\\武夷山\\npc\\银狐之王.lua"},
	{"上古火麒麟","上古火麒麟",113,1669,3225,"\\script\\江南区\\两水洞二层\\npc\\火麒麟.lua"},
	{"普通少年男1","蒋维",150,1679,3237,"\\script\\江南区\\扬州\\npc\\蒋维.lua"},
	{"素还真","邬远晴",108,1585,3195,"\\script\\江南区\\泉州府北\\npc\\邬远晴.lua"},
	{"鱼怪头目","鱼怪头目",103,1673,3431,"\\script\\江南区\\东海海滨一\\npc\\鱼怪头目.lua"},
	{"雷胜尸体","雷胜的尸体",111,1849,2887,"\\script\\江南区\\清溪洞\\npc\\雷胜的尸体.lua"},
	{"雷胜护卫尸体","雷胜护卫的尸体",111,1854,2887},
	{"雷胜护卫尸体","雷胜护卫的尸体",111,1847,2889},
	{"雷胜护卫尸体","雷胜护卫的尸体",111,1851,2877},
	{"雷胜尸体","泰宏绝的尸体",113,1668,3230},
	{"雷胜护卫尸体","蚩火教徒的尸体",113,1669,3231},
	{"雷胜护卫尸体","蚩火教徒的尸体",113,1664,3225},
	{"雷胜护卫尸体","蚩火教徒的尸体",113,1670,3224},
	{"雷胜护卫尸体","蚩火教徒的尸体",113,1661,3231},
	{"张伯汉的包裹","张伯汉的包裹",107,1573,2939,"\\script\\江南区\\武夷山\\npc\\张伯汉的包裹.lua"},
	{"少林执事尸体","少林执事尸体",311,1365,2966,"\\script\\中原二区\\伏牛山\\npc\\少林执事尸体.lua"},
	{"遗失包裹","遗失包裹",311,1484,2988,"\\script\\中原二区\\伏牛山\\npc\\遗失包裹.lua"},
}

npclist_task_bianjing_create = {
	{"西夏将领北堂玉","西夏将领北堂玉",310,1548,2952,"\\script\\中原二区\\剑门关\\npc\\北堂玉.lua"},
	{"西夏将领西门秋","西夏将领西门秋",310,1520,3128,"\\script\\中原二区\\剑门关\\npc\\西门秋.lua"},
	{"西夏将领东方桓","西夏将领东方桓",310,1394,3113,"\\script\\中原二区\\剑门关\\npc\\东方桓.lua"},
	{"宇文枫","宇文枫",310,1353,2877,"\\script\\中原二区\\剑门关\\npc\\宇文枫.lua"},
	{"宇文月","宇文月",310,1354,2876,"\\script\\中原二区\\剑门关\\npc\\宇文月.lua"},
}

npclist_task_xiangyang_create = {
	{"九尾银狐","九尾银狐",324,1822,3005,"\\script\\中原二区\\七星洞一层\\npc\\九尾银狐.lua"},
	{"伏牛山大王","伏牛山大王",322,1491,3323,"\\script\\中原二区\\龙虎洞一层\\npc\\伏牛山大王.lua"},
	{"西夏咒师言不悔","西夏咒师言不悔",311,1352,3117,"\\script\\中原二区\\伏牛山\\npc\\西夏咒师.lua"},
	{"西夏咒师言不语","西夏咒师言不语",311,1439,3144,"\\script\\中原二区\\伏牛山\\npc\\西夏咒师.lua"},
	{"西夏咒师言不离","西夏咒师言不离",311,1442,3033,"\\script\\中原二区\\伏牛山\\npc\\西夏咒师.lua"},
}

npclist_task_dali_create = {
	{"董明翰","董明翰",302,1337,2828,"\\script\\中原二区\\青城山\\npc\\董明翰.lua"},
	{"东海水族首领","东海水族首领",103,1629,3254,"\\script\\江南区\\东海海滨一\\npc\\东海水族首领.lua"},
	{"门派练功木桩","门派练功木桩",507,1797,3192},
	{"门派练功木桩","门派练功木桩",507,1800,3188},
	{"门派练功木桩","门派练功木桩",507,1804,3191},
}

npclist_new_server_create = {
	{"老年男","商店使者",100,1430,2989,"\\script\\global\\路人_降龙尊者.lua"},
--	{"降龙尊者","降龙尊者",200,1392,2848,"\\script\\global\\路人_降龙尊者.lua"},
--	{"降龙尊者","降龙尊者",300,1737,3520,"\\script\\global\\路人_降龙尊者.lua"},
	{"杨延昭","天使之恋",100,1418,2978,"\\script\\global\\天使之恋.lua"},
	{"杨延昭","天使之殇",100,1424,2984,"\\script\\global\\天使之殇.lua"},
	{"杨延昭","转生大使",100,1437,2970,"\\script\\global\\路人_武林盟长老.lua"},	
--	{"佟丽娅","改名大使",100,1420,2972,"\\script\\function\\rename\\rename_npc.lua"},		
--	{"老年男","血溅乌蒙",200,1394,2819,"\\script\\missions\\xuejianwumeng\\entrance_npc.lua"},--新副本入口
--	{"峨嵋掌门","峨嵋",100,1423,2987,"\\script\\global\\gm\\createautobuff.lua"},	
    {"宋将军","狭路相逢战场",200,1286,2863,"\\script\\exchg_server\\one_road_battle_npc.lua"},
    {"宋将军","狭路相逢战场",200,1302,2798,"\\script\\exchg_server\\one_road_battle_npc.lua"},	
    {"老年男","扶摇子",300,1777,3527,"\\settings\\static_script\\gem\\imp_npc_gem.lua"},		
	
	
	
		
}

npclist_tianmen_create = {
	{"宋将军","骠骑将军郭君鹏",350,1429,2816,"\\script\\missions\\tianmenzhen\\tmz_npc.lua"},
}

-- 帮派功能NPC创建
npclist_tong_create = {
--	{"谪臣","祭酒",300,1707,3544,"\\script\\tong\\jijiu.lua"},
	{"宋将军","帮会活动大使",300, 1922, 3577,"\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua"},
	{"老年男","紫光阁神秘人",150,1651,3174,"\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua"},
}

-- 国庆活动NPC创建
npclist_guoqing_create = {
	{"花灯2","烟花爆竹指定燃放点",100,1408,2991,""},
	{"花灯2","烟花爆竹指定燃放点",200,1352,2863,""},
	{"花灯2","烟花爆竹指定燃放点",300,1712,3529,""},
}


npclist_dragon_boat_day_create = {
--	{"外装2","端午龙舟大赛使者",100,1465,2794,"\\script\\online\\dragonboat06\\room_manager.lua"},
--	{"外装2","端午龙舟大赛使者",200,1170,2828,"\\script\\online\\dragonboat06\\room_manager.lua"},
--	{"外装2","端午龙舟大赛使者",300,1640,3526,"\\script\\online\\dragonboat06\\room_manager.lua"},
}

npclist_task_new_create = {
	{"职能武林盟主1","武林盟特使",150,1705,3173,"\\script\\task\\faction_boss\\wulinmeng_teshi.lua"},   --门派boss活动

	{"门派练功木桩","新手练功木桩",108,1450,3199},
	{"门派练功木桩","新手练功木桩",108,1443,3199},
	{"门派练功木桩","新手练功木桩",108,1443,3190},
	{"门派练功木桩","新手练功木桩",108,1450,3190},

	{"门派练功木桩","新手练功木桩",203,1534,3124},
	{"门派练功木桩","新手练功木桩",203,1534,3115},
	{"门派练功木桩","新手练功木桩",203,1540,3115},
	{"门派练功木桩","新手练功木桩",203,1540,3124},

	{"门派练功木桩","新手练功木桩",304,1570,2863},
	{"门派练功木桩","新手练功木桩",304,1577,2863},
	{"门派练功木桩","新手练功木桩",304,1577,2874},
	{"门派练功木桩","新手练功木桩",304,1570,2874},
}

npclist_trap_faction_back_room = {
	{"少林僧人","少林传送人",814,1626,3149,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图的少林传送人
	{"武当门人","武当传送人",812,1622,3093,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图的武当传送人
	{"峨嵋门人","峨嵋传送人",816,1626,3149,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图的峨嵋传送人
	{"丐帮门人","丐帮传送人",815,1373,3118,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图的丐帮传送人
	{"唐门门人新","唐门传送人",813,1677,2983,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图的唐门传送人
	{"杨门枪骑首席大弟子","杨门传送人",817,1457,2972,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图的杨门传送人
	{"五毒护法","五毒传送人",422,1628,3508,"\\script\\task\\practice\\出关传送人.lua"},	--修炼地图五毒传送人
}

function main()
    AddMailBox();--邮箱
    AddFirstTongNpc() 
    Addautobuff()                             -- 自动buff
	addnpc_yanmenbattle_signup();  						-- 雁门关战场
	init_xc_ls_sq()											-- 各种仙草状态
--	Addjiehun()											-- 结婚
	Addfengdutrap()										-- 丰都to鬼门回廊trap
	AddFsytrap()											-- 霜风崖to琼结trap
	AddYmgtrap()                                        --雁门关和平区域
    Addyunzhongtrap()                                   --云中和平区域
	AddNewBattle();										-- 新战场频道
	ApplyRelayInitData()									-- 取Gameser初始化时需要的Relay信息
	zgc_auto_fun_main()									-- 村长的自动函数
	AddKillerHall()											-- 杀手堂
	AddGongChengNpc();									-- 攻城战相关NPC
	add_biwudahui();										-- 比武大会
	get_server_id() 										-- Set server ID
	Liangshan_Entrance();									-- 梁山群雄会NPC创建
	LSB_Exec_CleanData();									-- 启动服务器数据清理（梁山BOSS）
--	biwu_3v3_init(); 										-- 3v3
--	sp_CreateDecorate(); 						 			-- 2021春节活动
--	AddActivtySnowMan(); 									-- 12月圣诞雪人
--	AddSnowBattleNpc(); 									-- 雪仗NPC
    AddTYNpc();	                                            --太一关卡npc
--	Observer:onEvent(SYSEVENT_GAMESERVER_START, 0)
--	new_weekend_npc_create();							-- 周末活动ADD的NPC
	new_task_xiangyang_create()
	add_dialognpc(npclist_task_week_create)
	add_dialognpc(npclist_new_server_create)			-- 新服活动大使	
	add_dialognpc(npclist_dragon_boat_day_create)		-- 端午活动NPC
--	add_dialognpc(npclist_guoqing_create)				-- 国庆活动NPC
	add_dialognpc(npclist_tianmen_create)				-- 天门阵郭君鹏
	AddJDYYNpc();	
	--增加npc
	add_dialognpc(npclist_function)
	add_dialognpc(npclist_role)
--	add_dialognpc(npclist_city_role)
	add_dialognpc(npclist_create_xinan)
	add_dialognpc(npclist_create_xibei)
	add_dialognpc(npclist_task_bianjing_create)
--	add_dialognpc(npclist_trap_faction_back_room)   已经改成真武遗迹地图
	add_dialognpc(npclist_task_yangzhou_create)
	add_dialognpc(npclist_task_dali_create)
	add_dialognpc(npclist_task_new_create)
	add_dialognpc(npclist_tong_create)					-- 帮会功能NPC
--	add_dialognpc(npclist_create_gather)					-- 替身采集托管人
	add_dialognpc(tbWuLinMeng.tbDialogNpc)			-- 增加武林盟npc
	add_dialognpc(tbYuRongFeng.tbDialogNpc)			-- 增加玉融峰npc
--	add_dialognpc(tbYanMenGuan.tbDialogNpc)			-- 增加雁门关npc
	add_dialognpc(tbMingJiao.tbDialogNpc)				-- 增加明教npc
	tbMingJiao:AddTrapQuanzhou()
	add_dialognpc(tbCuiYan.tbDialogNpc)					-- 增加翠烟npc
	add_dialognpc(tbKunLun.tbDialogNpc)				-- 增加昆仑npc
	add_dialognpc(tbWuDu.tbDialogNpc)					-- 增加五毒教npc
	tbWuDu:AddTrapRuWudu()
	add_dialognpc(tbYangMen.tbDialogNpc)				-- 增加天波杨府npc
--	tbYangMen:CreateBattleNpc()
	add_dialognpc(tbTangMen.tbDialogNpc)				-- 增加唐门npc
	add_dialognpc(tbEMei.tbDialogNpc)					-- 增加峨嵋npc
	tbEMei:AddTrapRuEMei()
	tbEMei:AddTrapToYuRongFeng()
	add_dialognpc(tbGaiBang.tbDialogNpc)				-- 增加丐帮npc
	tbGaiBang:AddTrapRuGaiBang()
	add_dialognpc(tbWuDang.tbDialogNpc)				-- 增加武当npc
	tbWuDang:AddTrapRuWuDang()
	add_dialognpc(tbShaoLin.tbDialogNpc)				-- 增加少林npc
	add_dialognpc(tbHongLianShan.tbDialogNpc)				-- 增加红莲山npc	
	add_dialognpc(tbZangXueCheng.tbDialogNpc)				-- 增加葬雪城npc		
	tbShaoLin:AddTrapRuShaoLin()
	add_dialognpc(tbTaiXu.tbDialogNpc)					-- 增加太虚幻境npc

end;

function ApplyRelayInitData()
	GetBattleData(0,7)			-- 取战场信息
	ApplyCityWarData(0,0)			-- 取攻城战信息
	ApplyCityWarData(1,0)			-- 取攻城战信息
	ApplyBWRankInfo()
end


function addnpc_yanmenbattle_signup()
--	local tbGAME_SIGNMAP = {806, 808} --记录各等级报名点的地图ID号 ，等级按低级向高级排布

	local tChannel =
	{								--频道名字与ID
		[1] = {"宋辽帮会战场",39},
		[2] = {"帮会战场宋方",40},
		[3] = {"帮会战场辽方",41},
	}

	CreateNpcList({
		{"城门卫兵","宋军募兵官",808, 1728, 3083,"\\script\\battles\\battlejoin1.lua"},
		{"北方男性3","辽军募兵官",808, 1652,3174,"\\script\\battles\\battlejoin2.lua"},
		{"中年瘦官吏1","宋军军需官",808, 1728,3065,"\\script\\battles\\battleshop1.lua"},
		{"北方男性2","辽军军需官",808, 1634,3175,"\\script\\battles\\battleshop2.lua"},
		{"中原马车船夫","宋军战场传送人",808, 1754,3040,"\\script\\battles\\battle_transport1.lua"},
		{"吐蕃马车船夫","辽军战场传送人",808, 1639,3200,"\\script\\battles\\battle_transport2.lua"},
	});

	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2],180);
	end;

end

function new_task_xiangyang_create()
	local tPoes = {
		{309, 1382, 3186},
		{309, 1299, 3193},
		{309, 1358, 3016},
		{309, 1426, 2916},
		{309, 1143, 2931},
		{309, 1219, 2910},
		{309, 1271, 2974},
		{309, 1222, 2985},
		{309, 1116, 3020},
		{309, 1269, 3092},
		{309, 1236, 3147},
		{309, 1356, 3149},
		{309, 1352, 3087},
		{309, 1307, 3079},
		{309, 1404, 2968},
		{309, 1326, 2949},
		{309, 1386, 2926},
		{309, 1428, 2966},
		{309, 1501, 2915},
		{309, 1525, 2935},
		{309, 1573, 2979},
		{309, 1552, 3028},
		{309, 1539, 3110},
		{309, 1571, 3166},
		{309, 1540, 3198},
		{309, 1501, 3174},
	}
	for _, tPos in tPoes do
		local npcIndex = CreateNpc("能打开的箱子", "毒药箱", tPos[1], tPos[2], tPos[3])
	end
	add_dialognpc(npclist_task_xiangyang_create)
end;

function new_weekend_npc_create()
	--倭寇地图的初始化NPC
	local tPoes = {
		{951, 1333, 2844},
		{952, 1333, 2844},
		{953, 1333, 2844},
		{954, 1333, 2844},
		{955, 1333, 2844},
		{956, 1333, 2844},
		{957, 1333, 2844},
		{958, 1333, 2844},
		{959, 1333, 2844},
		{960, 1333, 2844},
	}
	for _, tPos in tPoes do
		local npcIndex = CreateNpc("城门卫兵", "前线将领", tPos[1], tPos[2], tPos[3])
		SetNpcScript(npcIndex, "\\script\\task\\weekend\\man_killwk.lua");
	end
	add_dialognpc(npclist_task_week_create)
end;

function AddWk(nDistanceX, nDistanceY)
	rect_table = {
		{1294, 2854, 1501, 3119},
		{1294, 3119, 1482, 3169},
		{1508, 2973, 1534, 3034},
		{1534, 2842, 1578, 2894},
		{1554, 2901, 1580, 2908},
		{1519, 2913, 1538, 2926}
	};
	local sp = {   --每地图的开始坐标，地图ID，NPC模板名字
		{1294, 2854, 907, "倭寇"},
		{1294, 2854, 908, "倭寇士兵"},
		{1294, 2854, 909, "倭寇水兵"},
		{1294, 2854, 910, "倭寇陆兵"},
		{1294, 2854, 911, "倭寇武士"}
	};
	for index, v in sp do
		local nCount = getn(rect_table);
		for i = 1, nCount do
			for nX = rect_table[i][1], rect_table[i][3], nDistanceX do
				for nY = rect_table[i][2], rect_table[i][4], nDistanceY do
					CreateNpc(v[4], v[4], v[3], nX, nY);
				end;
			end;
		end;
	end;

end;

function Addfengdutrap()
	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2687 * 32, "\\script\\中原二区\\丰都\\trap\\丰都to十八层地狱.lua")
	end

	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2686 * 32, "\\script\\中原二区\\丰都\\trap\\丰都to十八层地狱.lua")
	end
end

function AddFsytrap()
	for i = 1672, 1680 do
		AddMapTrap(429, i * 32, 2852 * 32, "\\script\\西南区\\霜风崖\\trap\\霜风崖to琼结.lua")
	end	
end
tbyanmenguanTraps = {
	{{1354,2899},{1361,2894},{1354,2899},{1357,2888}}, --女真旁边门1
	{{1393,2822},{1400,2826},{1389,2825},{1397,2833}}, --车夫旁边门2
	{{1383,2880},{1390,2869},{1380,2872},{1386,2867}}, --西夏旁边门3
	{{1313,2901},{1320,2908},{1317,2897},{1333,2905}}, --队长旁边门4
	{{1318,2823},{1330,2815},{1320,2826},{1329,2818}}, --后门	5
	{{1625,3318},{1636,3328},{1624,3320},{1634,3329}}, --云中车夫门6
    {{1686,3462},{1693,3449},{1680,3458},{1692,3448}}, --云中桥	          --7
    {{1679,3109},{1687,3100},{1633,3103},{1641,3103}}, --云中-兴庆8
	{{1852,3214},{1858,3221},{1925,3259},{1931,3265}}, --云中-圣灵城9
	{{1926,3581},{1934,3567},{1858,3637},{1865,3634}}, --云中-红莲山	--10
	{{1734,3698},{1742,3702},{1720,3677},{1727,3684}}, --云中-黄龙11
	{{1524,2693},{1528,2686},{1522,2690},{1526,2684}}, --兴庆安全区桥12
	{{1402,2705},{1406,2711},{1402,2704},{1406,2709}}, --兴庆安全区左侧门 --13
	{{1581,2773},{1581,2789},{1516,3114},{1531,3099}}, --兴庆-云中--14
	{{1598,3319},{1610,3309},{1600,3322},{1611,3310}}, --圣灵城上15
	{{1695,3419},{1709,3405},{1693,3414},{1705,3400}}, --圣灵城下 --16
	{{1812,3590},{1812,3609},{1819,3503},{1818,3514}}, --圣灵城-云中--17
	{{1820,3600},{1822,3596},{1822,3604},{1825,3600}}, --黄龙府安全区--18
	{{1690,3326},{1699,3321},{1911,3243},{1916,3254}}, --黄龙府-云中--19
	{{1891,3171},{1898,3185},{1898,3291},{1889,3314}}, --红莲山-云中--20
	{{1896,2772},{1897,2788},{1852,2716},{1863,2727}}, --红莲山-葬雪城--21
	{{4086,11318},{4090,11315},{3959,11226},{3964,11232}}, --葬雪城---红莲山22	
	{{1626,3317},{1638,3327},{1623,3321},{1631,3332}}, --云中车夫补充23
    {{1675,3465},{1695,3449},{1676,3462},{1695,3441}}, --云中桥补充24		
	{{1617,3327},{1632,3342},{1610,3325},{1629,3343}}, --云中车夫补充25进		
    {{1597,3316},{1608,3305},{1595,3309},{1602,3299}}, --圣灵第五传道士门补充外层26			
};
function AddYmgtrap()
	local tTraps = {--暂时先补充这么多把 等后期找到明确路径再取消
		{604, tbyanmenguanTraps[1][1], tbyanmenguanTraps[1][2], "\\script\\北区\\雁门关\\trap\\chu.lua"},
		{604, tbyanmenguanTraps[1][3], tbyanmenguanTraps[1][4], "\\script\\北区\\雁门关\\trap\\jin.lua"},
		{604, tbyanmenguanTraps[2][1], tbyanmenguanTraps[2][2], "\\script\\北区\\雁门关\\trap\\chu.lua"},
		{604, tbyanmenguanTraps[2][3], tbyanmenguanTraps[2][4], "\\script\\北区\\雁门关\\trap\\jin.lua"},
		{604, tbyanmenguanTraps[3][1], tbyanmenguanTraps[3][2], "\\script\\北区\\雁门关\\trap\\chu.lua"},
		{604, tbyanmenguanTraps[3][3], tbyanmenguanTraps[3][4], "\\script\\北区\\雁门关\\trap\\jin.lua"},	
		{604, tbyanmenguanTraps[4][1], tbyanmenguanTraps[4][2], "\\script\\北区\\雁门关\\trap\\chu.lua"},
		{604, tbyanmenguanTraps[4][3], tbyanmenguanTraps[4][4], "\\script\\北区\\雁门关\\trap\\jin.lua"},	
		{604, tbyanmenguanTraps[5][1], tbyanmenguanTraps[5][2], "\\script\\北区\\雁门关\\trap\\chu.lua"},
		{604, tbyanmenguanTraps[5][3], tbyanmenguanTraps[5][4], "\\script\\北区\\雁门关\\trap\\jin.lua"},			
		{5075, tbyanmenguanTraps[12][1], tbyanmenguanTraps[12][2], "\\script\\燕云剑戈\\兴庆\\trap\\兴庆外层.lua"},
		{5075, tbyanmenguanTraps[12][3], tbyanmenguanTraps[12][4], "\\script\\燕云剑戈\\兴庆\\trap\\兴庆内层.lua"},		
		{5075, tbyanmenguanTraps[13][1], tbyanmenguanTraps[13][2], "\\script\\燕云剑戈\\兴庆\\trap\\兴庆外层.lua"},
		{5075, tbyanmenguanTraps[13][3], tbyanmenguanTraps[13][4], "\\script\\燕云剑戈\\兴庆\\trap\\兴庆内层.lua"},					
		{5074, tbyanmenguanTraps[15][1], tbyanmenguanTraps[15][2], "\\script\\燕云剑戈\\圣灵城\\trap\\圣灵城外层.lua"},
		{5074, tbyanmenguanTraps[15][3], tbyanmenguanTraps[15][4], "\\script\\燕云剑戈\\圣灵城\\trap\\圣灵城内层.lua"},		
		{5074, tbyanmenguanTraps[26][1], tbyanmenguanTraps[26][2], "\\script\\燕云剑戈\\圣灵城\\trap\\圣灵城外层.lua"},
		{5074, tbyanmenguanTraps[26][3], tbyanmenguanTraps[26][4], "\\script\\燕云剑戈\\圣灵城\\trap\\圣灵城外层.lua"},					
		{5074, tbyanmenguanTraps[16][1], tbyanmenguanTraps[16][2], "\\script\\燕云剑戈\\圣灵城\\trap\\圣灵城外层.lua"},
		{5074, tbyanmenguanTraps[16][3], tbyanmenguanTraps[16][4], "\\script\\燕云剑戈\\圣灵城\\trap\\圣灵城内层.lua"},		
		{5076, tbyanmenguanTraps[18][1], tbyanmenguanTraps[18][2], "\\script\\燕云剑戈\\黄龙府\\trap\\黄龙府外.lua"},
		{5076, tbyanmenguanTraps[18][3], tbyanmenguanTraps[18][4], "\\script\\燕云剑戈\\黄龙府\\trap\\黄龙府内.lua"},					
	};
	gf_CreateTraps(tTraps);
end
--====================================村长的自动函数================================================
--*****************************村长自动执行函数主函数*************************
function zgc_auto_fun_main()
	add_dialognpc(npclist_zgc_auto_fun_create)
--	ZgcNpcCreate()					--NPC自动创建
	randomseed(GetTime())			--随机种子添加
end
function ZgcNpcCreate()
	--帮会攻城战资源保护相关NPC
	local tPoes = {	
		{304,1532,2892},
		{304,1543,2897},
		{304,1533,2913},
		{304,1540,2998},
		{304,1551,2997},
		{304,1551,3014},
		{304,1541,3015},
		{304,1505,2980},
		{304,1494,2980},
		{304,1493,2994},
		{308,1451,3180},
		{308,1442,3181},
		{308,1451,3167},
		{308,1501,3124},
		{308,1490,3122},
		{308,1490,3104},
		{308,1500,3104},
		{308,1433,3078},
		{308,1421,3076},
		{308,1421,3058},
	}
	for _, tPos in tPoes do
		local npcIndex = CreateNpc("西北壮汉", "西北壮汉", tPos[1], tPos[2], tPos[3])
		SetNpcScript(npcIndex, "\\script\\gongcheng\\npc\\conf_res_protect.lua");
		SetUnitCurStates(npc_index,2,1)
		SetUnitCurStates(npc_index,4,0)
		SetUnitCurStates(npc_index,5,0)
	end
end

--======================================结束================================

function AddNewBattle()
	local tChannel =
	{								--频道名字与ID
		[1] = {"村落战场",12},
		[2] = {"草谷场战场",13},
		[3] = {"炮台战场",14},
		[4] = {"主战场",15},
		[5] = {"村落战场宋方",16},
		[6] = {"村落战场辽方",17},
		[7] = {"草谷场战场宋方",18},
		[8] = {"草谷场战场辽方",19},
		[9] = {"炮台战场宋方",20},
		[10] = {"炮台战场辽方",21},
		[11] = {"主战场宋方",22},
		[12] = {"主战场辽方",23},
		[13] = {"玉门关战场",36},
		[14] = {"玉门关战场宋方",37},
		[15] = {"玉门关战场辽方",38},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2],180);
	end;
	SetGlbValue(31,0)	--开启新战场
	local nNpcIdx = 0;
end;

function Addjiehun()
	CreateNpcList({
		{"媒婆","媒婆",150, 1600, 3136,"\\script\\结婚\\npc\\媒婆.lua"},
		{"商人","婚庆传送人",150, 1711, 3046,"\\script\\结婚\\npc\\媒婆.lua"},
		-- 预览场地媒婆
		{"媒婆","媒婆",855, 1554, 3232,"\\script\\结婚\\npc\\媒婆2.lua"},
		{"媒婆","媒婆",856, 1615, 3276,"\\script\\结婚\\npc\\媒婆2.lua"},
		{"媒婆","媒婆",857, 1550, 3217,"\\script\\结婚\\npc\\媒婆2.lua"},
		{"媒婆","媒婆",858, 1612, 3324,"\\script\\结婚\\npc\\媒婆2.lua"},
	});
	CreateChannel("结婚场地",26);
end

function AddKillerHall()
	local nNpcIdx = CreateNpc("江湖俊杰", "神秘的男子", 300,1778,3527);
	SetNpcScript(nNpcIdx, "\\script\\task\\killer_hall\\entrance_npc.lua");
end;

function AddGongChengNpc()
	local tChannel =
	{								--频道名字与ID
		[1] = {"泉州城",27},
		[2] = {"成都城 ",28},
		[3] = {"襄阳城",29},
		[4] = {"泉州城攻方",30},
		[5] = {"泉州城守方",31},
		[6] = {"成都城攻方",32},
		[7] = {"成都城守方",33},
		[8] = {"襄阳城攻方",34},
		[9] = {"襄阳城守方",35},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2]);
	end;

	CreateNpcList({
		{"职能武林盟主1","成都攻城大使",300,1742,3548,"\\script\\gongcheng\\npc\\gongchengdashi_npc.lua"},
--		{"官府衙役","成都帮会狱卒",300, 1792, 3489,"\\script\\gongcheng\\prison\\gaoler_npc.lua"},
		{"老板娘","成都城市管理人",300, 1729, 3536,"\\script\\gongcheng\\city_manage\\manage_npc.lua"},
---		{"城门卫兵","攻城任务接应人",889,1762,3805,"\\script\\gongcheng\\personal_task\\task_npc.lua"},	
---		{"中原马车船夫","攻城战车夫",300,1734,3553,"\\script\\function\\siege_qualification\\siege_npc.lua"},			
		

		-- 攻城战牢房
--		{"官府衙役","帮会狱卒",730, 1376, 3143,"\\script\\gongcheng\\prison\\jailer_npc.lua"},
--		{"中原储物柜","物品保管人",730, 1378, 3139,"\\script\\battles\\openbox.lua"},
--		{"官府衙役","帮会狱卒",731, 1376, 3143,"\\script\\gongcheng\\prison\\jailer_npc.lua"},
--		{"中原储物柜","物品保管人",731, 1378, 3139,"\\script\\battles\\openbox.lua"},
--		{"官府衙役","帮会狱卒",732, 1376, 3143,"\\script\\gongcheng\\prison\\jailer_npc.lua"},
--		{"中原储物柜","物品保管人",732, 1378, 3139,"\\script\\battles\\openbox.lua"},
--		{"官府衙役","帮会狱卒",733, 1376, 3143,"\\script\\gongcheng\\prison\\jailer_npc.lua"},
--		{"中原储物柜","物品保管人",733, 1378, 3139,"\\script\\battles\\openbox.lua"},
--		{"官府衙役","帮会狱卒",734, 1376, 3143,"\\script\\gongcheng\\prison\\jailer_npc.lua"},
--		{"中原储物柜","物品保管人",734, 1378, 3139,"\\script\\battles\\openbox.lua"},
	});

	-- 加trap

	for i=1805,1821 do
		AddMapTrap(889, i * 32, 3591 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1800,1815 do
		AddMapTrap(889, i * 32, 3584 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end

	for i=1728,1740 do
		AddMapTrap(889, i * 32, 3599 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1720,1732 do
		AddMapTrap(889, i * 32, 3591 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end

	for i=1605,1624 do
		AddMapTrap(889, i * 32, 3774 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1598, 1610 do
		AddMapTrap(889, i * 32, 3765 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end
end;

function add_biwudahui()
	ClearMapNpc(974)
	ClearMapNpc(975)
	ClearMapNpc(976)
	ClearMapNpc(7100)
	CreateNpcList({
		{"豪华甄子丹","比武大会特使",200,1391,2816,"\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua"},
		{"王安石","神武院司业",974,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"王安石","神武院司业",975,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"王安石","神武院司业",976,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
--		{"王安石","神武院司业",7100,1404,2858,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
	});
end;
function AddTYNpc()
	--先锋杨宗保（200 1378 3063） （100 1430 2791）（300,1807,3349）（350，1407，2853）
	--先锋穆桂英（200 1372 3068）（100 1436 2784）（300,1803,3353）（350，1413，2856）
	local tNpcs = {
--		{"先锋杨宗保", "先锋杨宗保", {350, 1407, 2853}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
--		{"先锋杨宗保", "先锋杨宗保", {300, 1807, 3349}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
--		{"先锋杨宗保", "先锋杨宗保", {200, 1378, 3063}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"先锋杨宗保", "先锋杨宗保", {100, 1430, 2791}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
--		{"先锋穆桂英", "先锋穆桂英", {350, 1413, 2856}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
--		{"先锋穆桂英", "先锋穆桂英", {300, 1803, 3353}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
--		{"先锋穆桂英", "先锋穆桂英", {200, 1372, 3068}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"先锋穆桂英", "先锋穆桂英", {100, 1436, 2784}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
	};
	for i = 1, getn(tNpcs) do
		if SubWorldID2Idx(tNpcs[i][3][1]) ~= -1 then
			local nIndex = CreateNpc(tNpcs[i][1], tNpcs[i][2], tNpcs[i][3][1], tNpcs[i][3][2], tNpcs[i][3][3]);
			SetNpcScript(nIndex, tNpcs[i][4]);
		end
	end
end
function init_xc_ls_sq()
	-- \script\item\xiancao.lua 注意：此表应该与该文件内的表保持一致！
	local tXclInfo =
	{
		{2, 1, 1012, 7200, 150, "逢来神水",1},
		{2, 0, 109, 7200, 200, "蓬莱仙露",1.5},
		{2, 1, 1013, 7200, 300, "蓬莱仙丹",2},
		{2, 1, 1052, 7200, 120, "蓬莱仙水",0},
	}
	for index, value in tXclInfo do
		InitXclSpeed(index, value[5])
	end

	-- \script\item\item_billing\shengwangwan.lua 注意：此表应该与该文件内的表保持一致！
	local tLsInfo =
	{
	{2, 1, 1064, 480, 1, "六神丸"},
	{2, 1, 1065, 480, 2, "强效六神丸"},
	{2, 1, 1066, 480, 3, "六神仙丹"},
	}
	for index, value in tLsInfo do
		InitLiushenSpeed(index, value[5])
	end
	InitLiushenInterval(6)

	-- \script\item\item_billing\sanqingwan.lua 注意：此表应该与该文件内的表保持一致！
	local tSqInfo =
	{
		{2, 1, 1097, 480, 1, "行气散"},
		{2, 1, 1098, 480, 2, "无常散"},
		{2, 1, 1099, 480, 3, "九转熊蛇丸"},
	}
	for index, value in tSqInfo do
		InitSanqinSpeed(index, value[5])
	end
	InitSanqinInterval(20)
end

--******************************第一帮活动*******************************
function AddFirstTongNpc()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("职能武林盟主1","华山活动特使",100,1415,3019);	--龙泉村163/186
	SetNpcScript(nNpcIndex, "\\script\\online\\jpz_event\\first_tong\\wulinteshi_npc.lua");

--	nNpcIndex = CreateNpc("箱子钱","物品保管人",969,1597,2981,-1,1,1,100)			--宝箱
--	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_box_npc.lua")
--	SetGlbValue(501,nNpcIndex)

	nNpcIndex = CreateNpc("职能武林盟主1","华山活动特使",969,1643,3225)		--华山npc
	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_npc.lua")
end;

--梁山传送NPC创建
function Liangshan_Entrance()
		local tPoes = {
		{200, 1161, 2862},
		{100, 1368, 2873},
		{300, 1967, 3537},
	}
	for _, tPos in tPoes do
		local npcIndex = CreateNpc("神行太保戴宗", "神行太保戴宗", tPos[1], tPos[2], tPos[3])
		AddUnitStates(npcIndex, 7, 0);
		AddUnitStates(npcIndex, 8, -GetUnitCurStates(npcIndex, 8));
		SetNpcScript(npcIndex, "\\script\\missions\\liangshan\\npc\\entrynpc_.lua");
	end
end

--加载npc_list.txt配置的NPC
function LoadNpcList()
	--------------------------------------------------------------------
	do	return	end
	--------------------------------------------------------------------
	---以下机制暂时先不开放吧以后再整理
	local SZ_NPC_LIST_FILE = "\\settings\\npc\\npc_list.txt"
	local tbNpcListFile = new(KTabFile, SZ_NPC_LIST_FILE);
	if tbNpcListFile then
		if tbNpcListFile.__bOpen ~= 0 then
			local nRowCnt = tbNpcListFile:getRow() or 0;
			local nCurDate = tonumber(date("%Y%m%d"));
			
			local szTemplateName, szNpcName = "", "";
			local nCreateStartDate, nCreateEndDate = 0, 0;
			local nMapId, nPosX, nPosY = 0, 0, 0;
			local szScript = "";
			for i = 3, nRowNum do
				nCreateStartDate = tonumber(tbNpcListFile:getCell(i, "CreateStartDate")) or 0;
				nCreateEndDate = tonumber(tbNpcListFile:getCell(i, "CreateEndDate")) or 0;
				if _IsInCreateDate(nCurDate, nCreateStartDate, nCreateEndDate) == 1 then--只有在有效期的NPC才创建
					szTemplateName = tbNpcListFile:getCell(i, "TemplateName");
					szNpcName = tbNpcListFile:getCell(i, "NpcName");
					szScript = tbNpcListFile:getCell(i, "DialogScript");
					nMapId = tonumber(tbNpcListFile:getCell(i, "MapId")) or 0 
					nPosX = tonumber(tbNpcListFile:getCell(i, "MapX")) or 0 
					nPosY = tonumber(tbNpcListFile:getCell(i, "MapY")) or 0 
					
					local nNpcIndex = CreateNpc(szTemplateName, szNpcName, nMapId, nPosX, nPosY);
					if szScript and szScript ~= "" and nNpcIndex > 0 then
						SetNpcScript(nNpcIndex, szScript);
					end
				end
			end
		end
		tbNpcListFile:close();--关闭文件
	end
end

--判断当前日期是否在有效期
function _IsInCreateDate(nCurDate, nStartDate, nFinishDate)
	if  not nCurDate or nCurDate <= 0 then
		return 0;
	end
	if nStartDate and nStartDate > 0 and nCurDate < nStartDate then
		return 0;
	end
	if nFinishDate and nFinishDate > 0 and nCurDate >= nFinishDate then
		return 0;
	end
	return 1;
end

function get_server_id()
	if GetGlbValue(GLB_TSK_SERVER_ID) == 0 then
		local fileName = ""
		if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
			fileName = "data\\serverid.txt";
		else
			fileName = "data/serverid.txt";
		end		
		local pf = openfile(fileName, "r");
		if not pf then 			
			return
		end		
		local str = read(pf, "*l");
		if not str then
			closefile(pf);
			return 
		end
		local nsid = tonumber(str) or 1;
		closefile(pf);
		SetGlbValue(GLB_TSK_SERVER_ID,nsid)
	end
end

function biwu_3v3_init()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		ClearMapNpc(8000)
		P3v3_Enable(1);
		local npcIndex = CreateNpc("昆仑首席标准男", "比武特使", 8000,1404,2858);
		SetNpcScript(npcIndex, "\\script\\missions\\nvn\\3v3npc.lua");
	end
end

function AddActivtySnowMan()
	SendScript2VM("\\script\\online_activites\\201412\\tong_christmas_tree.lua", "tct_create_snowman()");
end

function AddSnowBattleNpc()
	SendScript2VM("\\script\\online\\snowbattle\\head.lua", "SB_SnowBattleNpcCreate()");
end

-- szModel 模型
-- szName 名字
-- nMapID,nMapX,nMapY 位置
-- nRadius 刷怪范围，比如20，1500地图中心
-- local nNum = random(3,5);  --设定怪物数量为3～5个
-- local argMonsterID = {};
-- local i = 0;
-- nNum,argMonsterID = CreateNpc(szModel,szName,nMapID,nMapX,nMapY,-1,nNum,nRadius);
-- nNum = nNum-1;
-- for i=0,nNum do				
-- 	SetNpcScript(argMonsterID[i], "\\script\\task\\killer\\monster_fight.lua");
-- 	SetNpcLifeTime(argMonsterID[i],600);
-- end;

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);

		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
	end
end

function add_dialognpc(Tab)
	for i = 1 , getn(Tab) do 
		local tNpc = Tab[i]
		local npcindex = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		if tNpc[6] ~= nil and tNpc[6] ~= "" then
			SetNpcScript(npcindex, tNpc[6]);
		end
		if npcindex > 0 then
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
	end	
end;

--{1=NPC资源模板，2==NPC名字，3-5=坐标位置，6=脚本，7（SetCampToNpc）=阵营，8（SetCampToPlayer）=对阵阵营，9（SetNpcLifeTime）=生存时间，10（SetMapTaskTemp）= 写入NPC临时数据}
function add_fightnpc(Tab)
	for i = 1 , getn(Tab) do 
		local tNpc = Tab[i]
		local npcindex = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		if tNpc[6] ~= nil and tNpc[6] ~= "" then
			SetNpcScript(npcindex, tNpc[6]);
		end
		if tNpc[7] ~= nil and tNpc[7] ~= "" then
			SetCampToNpc(npcindex, tNpc[7]);
		end
		if tNpc[8] ~= nil and tNpc[8] ~= "" then
			SetCampToPlayer(tNpc[8]);
		end
		if tNpc[9] ~= nil and tNpc[9] ~= "" then
			SetNpcLifeTime(npcindex, tNpc[9]);
		end
		if tNpc[10] ~= nil and tNpc[10] ~= "" then
			SetMapTaskTemp(tNpc[3], tNpc[10], npcindex)
		end
		if npcindex > 0 then
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
	end
end;

function AddJDYYNpc()
		tNpcs = {
			{"燕云洛飞对话", "花圣洛飞", {300,1639,3526}, "\\script\\missions\\jiandangyanyun\\npcs\\luofei_npc.lua"},
			{"燕云洛飞对话", "花圣洛飞", {100,1439,2821}, "\\script\\missions\\jiandangyanyun\\npcs\\luofei_npc.lua"},
		};
	for i = 1, getn(tNpcs) do
		if SubWorldID2Idx(tNpcs[i][3][1]) ~= -1 then
			local nIndex = CreateNpc(tNpcs[i][1], tNpcs[i][2], tNpcs[i][3][1], tNpcs[i][3][2], tNpcs[i][3][3]);
			SetNpcScript(nIndex, tNpcs[i][4]);

			AddUnitStates(nIndex, 7, 0);
			AddUnitStates(nIndex, 8, -GetUnitCurStates(nNpcIdx, 8));	--视野变0
			ChangeNpcToFight(nIndex, 0, 6);
		end
	end
end
function AddMailBox()
	CreateNpcList({
		{"邮箱", "邮箱", 100, 1556, 3082, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 100, 1528, 2867, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 100, 1380, 2905, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 150, 1599, 3158, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 150, 1647, 3066, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 150, 1720, 3076, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 150, 1743, 3198, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 200, 1300, 2995, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 200, 1277, 2776, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 200, 1488, 2952, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 350, 1380, 3060, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 350, 1527, 2862, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 350, 1355, 2867, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 500, 1823, 3045, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 500, 1683, 3100, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 500, 1660, 3218, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 300, 1906, 3606, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 300, 1677, 3658, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 300, 1680, 3485, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 300, 1931, 3479, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 426, 1501, 2991, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 426, 1620, 2954, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 400, 1558, 2907, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 400, 1460, 3063, "\\script\\mail\\mail_box.lua"},
		{"邮箱", "邮箱", 400, 1531, 3108, "\\script\\mail\\mail_box.lua"},
	});
end

function Addautobuff()
Createautobuff()
end;

function Addyunzhongtrap()
gf_CreateSectionTrap(5077,1683,3464,1698,3452,"\\script\\北区\\雁门关\\trap\\chu.lua")--云中桥出去
gf_CreateSectionTrap(5077,1672,3449,1692,3446,"\\script\\北区\\雁门关\\trap\\jin.lua")--云中桥进来
gf_CreateSectionTrap(5077,1642,3323,1625,3318,"\\script\\北区\\雁门关\\trap\\chu.lua")--云中车夫出去
gf_CreateSectionTrap(5077,1624,3320,1626,3340,"\\script\\北区\\雁门关\\trap\\jin.lua")--云中车夫进来

		local nNpcIndex = CreateNpc("强化台", "真武遗迹入口", 100, 1397, 3008);
		SetCurrentNpcSFX(nNpcIndex,1043,0,1);
        gf_CreateSectionTrap(100,1395,3007,1398,3009,"\\script\\yyol\\trap\\jinruzhenwu.lua")--真武遗迹进
		local nNpcIndex = CreateNpc("强化台", "真武遗迹出口", 9999, 1782, 3351);
		SetCurrentNpcSFX(nNpcIndex,1043,0,1);
        gf_CreateSectionTrap(9999,1779,3349,1784,3352,"\\script\\yyol\\trap\\likaizhenwu.lua")--真武遗出
end;




