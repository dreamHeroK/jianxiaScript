--奖励装备属性配置
--注意：此处填写尽量只新增不修改，因为玩家可能已经存在了该属性的装备。
--说明，1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4-9（1-3的魔法属性和等级）10：五行（），11：名字
Include("\\script\\lib\\writelog.lua")
Include("\\script\\class\\clause3.lua")
strLogCaption = "帮会任务"
prize_att = {}
for i = 1,7 do
	prize_att[i] = {}
end
prize_att[1] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10, 	4,	357,	7,	358,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	10, 	4,	357,	7,	361,	7,	0, 	0,	0,	"墨玉玉佩(男)"},
	{102,	5,  	4,	357,	7,	358,	7,	0,  0,	0,	"龙涎香囊(女)"},
	{102,	5,  	4,	357,	7,	361,	7,	0,  0,	0,	"龙涎香囊(女)"},
	{100,	14, 	4,	333,	4,	340,	5,	341,5,	0,	"赤龙袍(标准男)"},
	{100,	32, 	4,	333,	4,	340,	5,	341,5,	0,	"五雷亮银甲(魁梧男)"},
	{100,	50, 	4,	333,	4,	340,	5,	341,5,	0,	"胡姬舞衣(性感女)"},
	{100,	68, 	4,	333,	4,	340,	5,	341,5,	0,	"彩华裳(娇小女)"},
	{0,  	12, 	4,	333,	4,	65, 	6,	43,	7,	0,	"五方鬼众(护手)"},
	{1,  	51, 	4,	333,	4,	65, 	6,	43,	7,	0,	"七煞天罗(暗器)"},
	{4,  	117,	4,	333,	4,	65, 	6,	43,	7,	0,	"蚩牙(弓)"},
}
prize_att[2] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	360,	7,	361,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	10,		4,	358,	7,	361,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	5,		4,	357,	7,	358,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{102,	5,		4,	357,	7,	361,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{101,	14,		4,	333,	4,	340,	5,	341,5,	0,	"飞鱼装(标准男)"},
	{101,	32,		4,	333,	4,	340,	5,	341,5,	0,	"天雷装(魁梧男)"},
	{101,	50,		4,	333,	4,	340,	5,	341,5,	0,	"天马(性感女)"},
	{101,	68,		4,	333,	4,	340,	5,	341,5,	0,	"神女(娇小女)"},
	{0,		12,		4,	333,	4,	67,		6,	43,	7,	0,	"五方鬼众(护手)"},
	{3,		62,		4,	333,	4,	65,		6,	43,	7,	0,	"天煞(刀)"},
	{11,	10,		4,	333,	4,	65,		6,	43,	7,	0,	"凝霜(爪)"},
}
prize_att[3] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	358,	7,	359,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	10,		4,	358,	7,	360,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	10,		4,	357,	7,	359,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	5,		4,	358,	7,	359,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{102,	5,		4,	358,	7,	360,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{102,	5,		4,	357,	7,	359,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{103,	14,		4,	333,	4,	340,	5,	341,5,	0,	"赤蜻眼罩(标准男)"},
	{103,	32,		4,	333,	4,	340,	5,	341,5,	0,	"五鬼头巾(魁梧男)"},
	{103,	50,		4,	333,	4,	340,	5,	341,5,	0,	"夺魂(性感女)"},
	{103,	68,		4,	333,	4,	340,	5,	341,5,	0,	"鸿鹄(娇小女)"},
	{5,		38,		4,	333,	4,	65,		6,	43,	7,	0,	"天蛇棍(棍)"},
	{10,	73,		4,	333,	4,	67,		6,	43,	7,	0,	"绿绮(琴)"},
	{9,		84,		4,	333,	4,	65,		6,	43,	7,	0,	"破军(笔)"},
}
prize_att[4] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	359,	7,	360,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	10,		4,	359,	7,	361,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	10,		4,	357,	7,	360,	7,	0,	0,	0,	"墨玉玉佩(男)"},
	{102,	5,		4,	359,	7,	360,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{102,	5,		4,	359,	7,	361,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{102,	5,		4,	357,	7,	360,	7,	0,	0,	0,	"龙涎香囊(女)"},
	{102,	8,		4,	333,	4,	340,	5,	341,5,	0,	"桃花玉佩(男)"},
	{102,	3,		4,	333,	4,	340,	5,	341,5,	0,	"沉檀香囊(女)"},
	{2,		25,		4,	333,	4,	67,		6,	43,	7,	0,	"碧血(剑)"},
	{8,		95,		4,	333,	4,	67,		6,	43,	7,	0,	"大般若杖(锡杖)"},
	{6,		106,	4,	333,	4,	65,		6,	43,	7,	0,	"丈八蛇矛(枪)"},
	{7,		10,		4,	333,	4,	65,		6,	43,	7,	0,	"淬月(双刀)"},
}
--二等装备:1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4、几项属性，5、名字
prize_att[5] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"天绛袍(标准男)"},
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"天绛袍(标准男)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"龙霸乌金衣(魁梧男)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"龙霸乌金衣(魁梧男)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"飞天彩裳(性感女)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"飞天彩裳(性感女)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"五彩霓裳(娇小女)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"五彩霓裳(娇小女)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"乌蚕装(标准男)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"乌蚕装(标准男)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"乌蚕装(标准男)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"天罡装(魁梧男)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"天罡装(魁梧男)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"天罡装(魁梧男)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"太清(性感女)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"太清(性感女)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"太清(性感女)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"出云(娇小女)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"出云(娇小女)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"出云(娇小女)"},
	{103,	18,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"秘神冠(标准男)"},
	{103,	36,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"异神头巾(魁梧男)"},
	{103,	54,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"朱雀(性感女)"},
	{103,	72,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"长生(娇小女)"},
}
prize_att[6] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"山鬼血衣(标准男)"},
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"山鬼血衣(标准男)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"血河鬼王铠(魁梧男)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"血河鬼王铠(魁梧男)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"天衣(性感女)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"天衣(性感女)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"无双斗衣(娇小女)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"无双斗衣(娇小女)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"杀劫装(标准男)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"杀劫装(标准男)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"杀劫装(标准男)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"血河装(魁梧男)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"血河装(魁梧男)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"血河装(魁梧男)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"虎啸(性感女)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"虎啸(性感女)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"虎啸(性感女)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"红玉(娇小女)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"红玉(娇小女)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"红玉(娇小女)"},
	{103,	17,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"山鬼面具(标准男)"},
	{103,	35,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"钟馗面具"},
	{103,	53,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"修罗(性感女)"},
	{103,	71,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"巫咸(娇小女)"},
}
--黄金装备：需要填入1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4：名称，5：属性。
prize_att[7] = {
{3,		6001,	1,	0,	"破烟刀"},
{5,		6002,	1,	0,	"破烟棍"},
{0,		6004,	1,	0,	"含烟手"},
{8,		6003,	1,	0,	"浮烟杖"},
{1,		6005,	1,	0,	"藏烟针"},
{2,		6006,	1,	0,	"飞烟剑"},
{10,	6007,	1,	0,	"韵烟琴"},
{0,		6008,	1,	0,	"云烟手"},
{5,		6009,	1,	0,	"流烟棍"},
{2,		6010,	1,	0,	"玄烟剑"},
{9,		6011,	1,	0,	"雨烟笔"},
{6,		6012,	1,	0,	"霞烟枪"},
{4,		6013,	1,	0,	"行烟弓"},
{7,		6014,	1,	0,	"浊烟刃"},
{11,	6015,	1,	0,	"妖烟爪"},
{102,	2612,	1,	0,	"腾蛟之壁"},
}
--装备属性对应解释
prize_att_string = {
"体力上限增加/1",
"反弹伤害/1%",
"暗器攻击距离提高/1%",
"吸内免疫",
"吸血免疫",
"中值攻击概率/1%",
"攻击使敌人溃逃概率/1%",
"制止敌人自动回血概率/1%",
"武器磨损概率降低/1%",
"每10秒暗器加/1",
"生命上限增加/1",
"内力上限增加/1",
"每10秒内力回复/1%",
"每10秒生命回复/1%",
"破防免疫概率/1%",
"10秒生命减少/1;外攻提高/2%",
"10秒内力减少/1;内攻提高/2%",
"外防降低/1%;外攻提高/2%",
"内防降低/1%;内攻提高/2%",
"杀死敌人内力回复/1",
"杀死敌人生命回复/1",
"暗器伤害减少/1",
"命中值增加/1",
"武功施展速度提高/1%",
"重生后内伤减轻/1",
"重生后外伤减轻/1",
"武功发招概率提高/1%",
"武功耗内降低/1%",
"致敌减速/t秒",
"发挥最大攻击概率/1%",
"杀死敌人力量增加/1",
"杀死敌人根骨增加/1",
"杀死敌人身法增加/1",
"杀死敌人洞察增加/1",
"杀死敌人内功增加/1",
"杀死敌人命中增加/1",
"杀死敌人闪避增加/1",
"杀死敌人会心增加/1",
"药效时间延长/1%",
"减速免疫概率/1%",
"攻击辅助持续时间延长/1%",
"防御辅助持续时间延长/1%",
"600秒武器耐久回复/1",
"内功点数防御增加/1",
"外功点数防御增加/1",
"受伤转化内力/1%",
"对阴属性伤害增加/1",
"对阴属性命中增加/1",
"攻击损耗敌人内力/1%",
"破防攻击概率/1%",
"吸内/1",
"吸血/1",
"一定概率使敌人气血受损/1%",
"一定概率使敌人真元受损/1%",
"攻击使敌人力量减少/1",
"攻击使敌人根骨减少/1",
"攻击使敌人内功减少/1",
"攻击使敌人洞察减少/1",
"攻击使敌人身法减少/1",
"范围攻击概率/1%",
"攻击使敌人外防减少/1",
"攻击使敌人内防减少/1",
"攻击使敌人外防降低/1%",
"攻击使敌人内防降低/1%",
"武器外攻上限增加/1",
"武器外攻下限增加/1",
"武器内攻上限增加/1",
"武器内攻下限增加/1",
"攻击附带毒伤害/1",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻速提高/1%",
"暗器伤害增加/1",
"生命上限提高/1%",
"内力上限提高/1%",
"攻击可能击退敌人",
"毒伤害减少/1",
"杀死敌人内力回复/1",
"杀死敌人生命回复/1",
"外攻提高/1%",
"内攻提高/1%",
"外防加/1",
"内防加/1",
"受伤动作时间缩短/1%",
"攻击使敌人内外防各降低/1%",
"外伤回复速度提高/1%",
"内伤回复速度提高/1%",
"武功打断概率降低/1%",
"根骨增加/1",
"力量增加/1",
"身法增加/1",
"洞察增加/1",
"内功增加/1",
"经验获得提高/1%",
"抗中毒概率/1%",
"跑动速度/1%",
"所有属性增加/1",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"回避陷阱概率/1%",
"承受伤害减半概率/1%",
"必闪/1%",
"装备需求等级减少/1",
"负重上限增加/1",
"会心概率提高/1%",
"600秒上衣耐久回复/1",
"600秒帽子耐久回复/1",
"600秒下衣耐久回复/1",
"经验获得提高/1%",
"抵抗降低攻速比例/1%",
"抵抗降低跑速比例/1%",
"攻击后仰概率增加/1%",
"打断敌人发招概率增加/1%",
"聚气上限增加1格",
"击倒免疫概率/1%",
"击退免疫概率/1%",
"麻痹免疫概率/1%",
"眩晕免疫概率/1%",
"定身免疫概率/1%",
"混乱免疫概率/1%",
"睡眠免疫概率/1%",
"迟缓免疫概率/1%",
"减速免疫概率/1%",
"闪避值增加/1",
"外攻提高/1%",
"内攻提高/1%",
"外攻提高/1%",
"内攻提高/1%",
"外攻提高/1%",
"内攻提高/1%",
"外攻提高/1%",
"负重上限增加/1",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"致敌减速/t秒",
"致敌迟缓/t秒",
"致敌麻痹/t秒",
"致敌眩晕/t秒",
"致敌定身/t秒",
"致敌混乱/t秒",
"致敌睡眠/t秒",
"攻击可能击倒敌人",
"攻击可能击退敌人",
"攻击/t秒内锁定物品",
"攻击/t秒内锁定攻击技能",
"攻击/t秒内锁定辅助技能",
"一定概率致敌受一级内伤",
"一定概率致敌受一级外伤",
"一定概率致敌受二级内伤",
"一定概率致敌受二级外伤",
"一定概率致敌受三级内伤",
"一定概率致敌受三级外伤",
"一定概率致敌受四级内伤",
"一定概率致敌受四级外伤",
"一定概率致敌受五级内伤",
"一定概率致敌受五级外伤",
"根骨增加/1",
"力量增加/1",
"身法增加/1",
"洞察增加/1",
"内功增加/1",
"生命上限增加/1",
"攻击附带毒伤害/1",
"破防攻击概率/1%",
"生命上限提高/1%",
"内力上限提高/1%",
"武器外攻上限增加/1",
"武器内攻上限增加/1",
"每10秒内力回复/1%",
"每10秒生命回复/1%",
"蛊毒伤害增加/1",
"杀死敌人生命回复/1",
"外攻提高/1%",
"内攻提高/1%",
"根骨增加/1",
"力量增加/1",
"身法增加/1",
"洞察增加/1",
"内功增加/1",
"增加伤害/1",
"武功发招概率提高/1%",
"武功发招概率提高/1%",
"武功发招概率提高/1%",
"武功发招概率提高/1%",
"攻击使敌人内外防降低/1%",
"攻击使敌人攻击力降低/1%",
"攻击附带毒伤害/1",
"武功施展速度提高/1%",
"生命上限提高/1%",
"内力上限提高/1%",
"内功点数防御增加/1",
"外功点数防御增加/1",
"攻击附带毒伤害/1",
"闪避值增加/1",
"打断敌人发招概率增加/1%",
"蛊毒伤害增加/1",
"蛊毒伤害增加/1",
"受伤动作时间缩短/1%",
"聚气上限增加/1格",
"武功打断概率降低/1%",
"闪避值增加/1",
"生命上限提高/1%",
"内力上限提高/1%",
"攻击辅助持续时间延长/1%",
"防御辅助持续时间延长/1%",
"外防降低/1%;外攻提高/2%",
"外防降低/1%;内攻提高/2%",
"必闪/1%",
"攻击使敌人力量减少/1",
"攻击使敌人根骨减少/1",
"攻击使敌人内功减少/1",
"攻击使敌人洞察减少/1",
"攻击使敌人身法减少/1",
"承受伤害减半概率/1%",
"发挥最大攻击概率/1%",
"武功耗内降低/1%",
"药效时间延长/1%",
"命中值增加/1",
"命中值增加/1",
"受伤转化内力/1%",
"武器外攻上限增加/1",
"武器外攻下限增加/1",
"武器内攻上限增加/1",
"武器内攻下限增加/1",
"斩魔刀法、封魔棍法攻击力提高15%",
"因陀螺雷印破攻击力提高15%",
"罗汉拳、迦叶腿攻击力提高15%",
"追心箭攻击力提高15%",
"玉女剑法攻击力提高15%",
"随意曲攻击力提高15%",
"霸王拳攻击力提高15%",
"驱蛇棍法攻击力提高15%",
"炙阳剑气攻击力提高15%",
"七星诀攻击力提高15%",
"杨家奔狼枪攻击力提高15%",
"攻击后仰概率增加/1%",
"杨家碎金箭攻击力提高15%",
"攻击忽视对手闪避概率/1%",
"万毒夺命刀攻击力提高15%",
"狂风爪攻击力提高15%",
"所有属性增加/1",
"<enter>使用效果：<enter>5秒内跑动速度提高100%，间隔10分钟",
"增加伤害/1",
"蛊毒伤害增加/1",
"杀死敌人生命回复/1",
"装备需求等级减少/1",
"范围攻击概率/1%",
"体力上限提高/1%",
"命中值增加/1",
"闪避值增加/1",
"反弹伤害/1%",
"每10秒内力回复/1%",
"每10秒生命回复/1%",
"会心概率提高/1%",
"内功点数防御增加/1",
"外功点数防御增加/1",
"武功耗内降低/1%",
"发挥最大攻击概率/1%",
"毒伤害减少/1",
"攻击使敌人力量减少/1",
"攻击使敌人根骨减少/1",
"攻击使敌人内功减少/1",
"攻击使敌人洞察减少/1",
"攻击使敌人身法减少/1",
"攻击使敌人外防减少/1",
"攻击使敌人内防减少/1",
"受伤动作时间缩短/1%",
"武功打断概率降低/1%",
"根骨增加/1",
"力量增加/1",
"身法增加/1",
"洞察增加/1",
"内功增加/1",
"破防攻击概率/1%",
"攻击附带毒伤害/1",
"必闪/1%",
"承受伤害减半概率/1%",
"经验获得提高/1%",
"所有属性增加/1",
"外攻提高/1%",
"内攻提高/1%",
"武功发招概率提高/1%",
"武功施展速度提高/1%",
"增加伤害/1",
"减速回避概率/1%",
"迟缓回避概率/1%",
"击退回避概率/1%",
"击倒回避概率/1%",
"麻痹回避概率/1%",
"眩晕回避概率/1%",
"定身回避概率/1%",
"混乱回避概率/1%",
"睡眠回避概率/1%",
"攻击使敌人外防削减/1%",
"攻击使敌人内防削减/1%",
"根骨增加/1",
"力量增加/1",
"身法增加/1",
"洞察增加/1",
"内功增加/1",
"内外攻提高/1%",
"武功发招概率提高/1%",
"<enter>使用效果：<enter>服用月亮兔的灵丹妙药，间隔5分钟",
"<enter>使用效果：<enter>召唤嫦娥仙子，为友方回复，间隔5分钟",
"<enter>使用效果：<enter>召唤后羿大神，发射落日箭，间隔5分钟",
"增加伤害/1",
"(PK状态无法使用)",										
}
prize_iron_num = {5,5,5,5,5,5,20}
prize_water_num = {2,2,2,2,2,2,2}
--prize_zhuangbei_jilv = {220,220,260,240,24,24,30} --原版概率
prize_zhuangbei_jilv = {220,220,260,240,240,240,300} --景秀概率
--prize_zhuangbei_jilv = {1000,1000,1000,1000,1000,1000,1000} --测试概率
--======================================点击宝箱分配装备=============================


tAllAward = {
	[1] = {--杀手任务完成奖励(ok)
		maxRand = 10000,
		subclauses = {
		{{"灵石宝箱", {2,95,5435,6},}, 2000},		
        {{"陨铁", {2,2,8,5}, }, 2000},					
        {{"陨铁碎片", {2,2,7,5}, }, 2000},			
		{{"贵宾虎纹卡（未激活）", {2,95,3451,1,1},}, 50},			
		},
		giveClause = ClauseRandom.giveClause,
	},
	[2] = {--杀手任务完成奖励(ok)
		maxRand = 10000,
		subclauses = {
		{{"灵石宝箱", {2,95,5435,12},}, 2000},		
        {{"陨铁", {2,2,8,10}, }, 2000},					
        {{"陨铁碎片", {2,2,7,10}, }, 2000},			
		{{"贵宾虎纹卡（未激活）", {2,95,3451,2,1},}, 100},			
		},
		giveClause = ClauseRandom.giveClause,
	},	
};


msg = "恭喜$n开启步非烟百宝箱获得$i";

function OnUse(id)
	local box_diff = GetItemParticular(id)
	local PlayerIndex_save = PlayerIndex 											--保存帮主索引
	--物品初始化处理及校验--
	for i = 1,2 do
		if GetItemParam(id,i) > 10000 then
			SetItemParam(id,0,0)
			SetItemParam(id,1,0)
			SetItemParam(id,2,0)
		end
	end
	--处理结束--
	local prize_level = box_diff - 525										--奖励等级
	-----------------------------------陨铁增加-------------------------------------------
	if GetItemParam(id,1) == 0 then											--首先判断陨铁是否还在
		if zgc_conf_task_iron_add(prize_level) == 1 then--普通箱子		    
           tAllAward[1]:giveClause(); --普通箱子	  
			if prize_level == 7 and random(1000) <= prize_zhuangbei_jilv[7] then
				local add_flag = AddItem(2,1,1009,3)
				if add_flag == 1 then
				    tAllAward[2]:giveClause(); --步非烟的宝箱
					AddGlobalNews("玩家"..GetName().."打开宝箱获得陨铁晶石")
					SendTongMessage(GetName().."打开宝箱获得陨铁晶石!")
				else
					WriteLog("步非烟: 玩家["..GetName().."]打开步非烟的宝箱' 陨铁晶石'失败,标记:  "..add_flag)
				end
			end
			SetItemParam(id,1,1)
		else
			return
		end		
	end
	---------------------------------装备属性写入---------------------------------------
	if GetItemParam(id,0) == 0 then											--宝箱第一次分配
		if random(1,1000) > prize_zhuangbei_jilv[prize_level] then			--无装备出现
			local del_flag = DelItemByIndex(id,1)
			if del_flag ~= 1 then				
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "清除宝箱失败, 反馈:"..del_flag)				
			end
			return
		else																--有装备出现
			local prize_seq = 0
			if prize_level <= 4 then										--1-4等直接保存顺序好
				prize_seq = random(1,getn(prize_att[prize_level]))
			elseif prize_level == 7 then									--7等直接保存数据号
				prize_seq = random(1,getn(prize_att[7]))
			else															--二等处理较为复杂
				prize_seq = random(1,getn(prize_att[prize_level]))
				local att_1,att_2,att_3 = zgc_conf_task_att_return(prize_level,prize_seq)
				prize_seq = Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
			end
			SetItemParam(id,0,prize_seq)
		end
	end
	------------------------------------装备属性读取--------------------------------------
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""	
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = GetItemParam(id,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_3 = prize_att[prize_level][prize_seq][8]
		prize_jieshi_1 = " (属性:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; 锁)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; 锁)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		prize_jieshi_1 = "黄金装备:"..prize_att[7][prize_seq][5]
		--按兔子姐姐要求加上世界消息
		AddGlobalNews("玩家"..GetName().."使用 \'步非烟的百宝箱\' 开启黄金武器:"..prize_att[7][prize_seq][5])
	else
		prize_seq,att_seq_1,att_seq_2,att_seq_3 = Zgc_conf_task_att_dealout(prize_seq)				--属性解析取到属性序号，而不是属性代码
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_1 = prize_att[prize_level][prize_seq][5+(att_seq_1*2)]
			att_2 = prize_att[prize_level][prize_seq][11+(att_seq_2*2)]
			att_3 = prize_att[prize_level][prize_seq][15+(att_seq_3*2)]
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_1 = prize_att[prize_level][prize_seq][5]
			att_2 = prize_att[prize_level][prize_seq][7+(att_seq_2*2)]			
		end
		prize_jieshi_1 = " (属性:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; 锁)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; 锁)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	------------------------------------队友对话组合-------------------------------------
		local teamer_dialog = {}											--队友table
		local player_name = ""
		if GetTeamSize() == 0 then
			player_name = GetName()
			player_name = replace(player_name,"/","-")
			player_name = replace(player_name,"|","-")
			player_name = replace(player_name,":","-")
			teamer_dialog[1]=player_name..": "..player_fini_cond().." (只能给自己帮)./#Prize_add(0)"
			teamer_dialog[2]="先自己临时保管吧/Zgc_end_dialog"
		else
			local conf_name_save = GetTongName()
			local team_number = GetTeamSize()
			local team_seq = 1
			for i = 1, team_number do
				PlayerIndex = GetTeamMember(i)									--修改当前玩家索引
				if conf_name_save == GetTongName() then
					player_name = GetName()
					player_name = replace(player_name,"/","-")
					player_name = replace(player_name,"|","-")
					player_name = replace(player_name,":","-")
					local finish_condition = player_fini_cond()
					teamer_dialog[team_seq] = player_name.." 第三轮:"..finish_condition.."/#Prize_add("..i..")"
					team_seq = team_seq + 1
				end
			end
			teamer_dialog[team_seq]="先自己临时保管吧/Zgc_end_dialog"
			PlayerIndex = PlayerIndex_save
		end
	------------------------------------分配对话组合--------------------------------------
	SendTongMessage(GetName().." 打开箱子,发现 "..prize_jieshi_1)
	if prize_level ~= 7 then
		SendTongMessage(prize_jieshi_2)
	end
	SetTaskTemp(155,id)
	prize_jieshi = prize_jieshi_1..prize_jieshi_2
	Say("你发现箱子里面有一个 "..prize_jieshi.." 请选择你要分配的人. <color=red>(注意：该装备是绑定的!)<color>.",
		getn(teamer_dialog),teamer_dialog
	)
end
--*****************************************物品分配函数*******************************
function Prize_add(player_seq)
	local PlayerIndex_save = PlayerIndex 											--保存帮主索引
	local box_index = GetTaskTemp(155)
	local box_diff = GetItemParticular(box_index)
	local prize_level = box_diff - 525												--奖励等级
	local prize_seq = 0
	local att_1 = 0
	local att_level_1 = 0
	local att_2 = 0
	local att_level_2 = 0
	local att_3 = 0
	local att_level_3 = 0
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""
	prize_seq = GetItemParam(box_index,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_level_1 = prize_att[prize_level][prize_seq][5]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_level_2 = prize_att[prize_level][prize_seq][7]
		att_3 = prize_att[prize_level][prize_seq][8]
		att_level_3 = prize_att[prize_level][prize_seq][9]
		prize_jieshi_1 = " (属性:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		att_1 = -1
		att_level_1 = -1
		att_2 = -1
		att_level_2 = -1
		att_3 = -1
		att_level_3 = -1
		prize_jieshi_1 = "黄金装备:"..prize_att[7][prize_seq][5]
	else
		prize_seq,att_1,att_2,att_3 = Zgc_conf_task_att_dealout(prize_seq)				--属性解析
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_level_1 = prize_att[prize_level][prize_seq][(att_1*2)+6]
			att_1 = prize_att[prize_level][prize_seq][(att_1*2)+5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+12]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+11]
			att_level_3 = prize_att[prize_level][prize_seq][(att_3*2)+16]
			att_3 = prize_att[prize_level][prize_seq][(att_3*2)+15]		
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_level_1 = prize_att[prize_level][prize_seq][6]
			att_1 = prize_att[prize_level][prize_seq][5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+8]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+7]		
		end
		prize_jieshi_1 = " (属性:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	if player_seq == 0 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--??é????????????á??????????????????						--=========================????????????????á??????????????á??????à????é????
			Say ("你背包没有足够的空间!",
					1,
					"我知道!/Zgc_dialog_end"
				)
				return
		else
			local del_flag = DelItemByIndex(box_index,1)
			if del_flag == 1 then
				local add_flag = 0
				if prize_level <=4 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
				elseif prize_level == 7 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
				else
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
				end
				if add_flag ~= 0 then
					SendTongMessage(GetName().."获得:"..prize_jieshi_1..prize_jieshi_2)
					SendTongMessage("帮会任务:"..player_fini_cond())
					if prize_level == 7 then												
						WriteLogEx(strLogCaption, "黄金装备" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())				
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"添加装备失败, 反馈:"..add_flag)
				end
			else
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"清除箱子失败, 反馈:"..del_flag)
			end
		end
	else
		-------------------------------------判断该完家是否在在该队伍中-------------------------------------
		local player_belong_flag = 0
		PlayerIndex = GetTeamMember(player_seq)
		local player_name = GetName()
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if player_name == GetName() then
				player_belong_flag = 1
			end
		end
		PlayerIndex = PlayerIndex_save
		if player_belong_flag ~= 1 then			
			Say("请确认玩家是否存在于团队中,如果变更的队必须重新分布。!",
				1,
				"我知道/Zgc_end_dialog"
			)
			return
		else
			PlayerIndex = GetTeamMember(player_seq)
			if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--判断玩家负重和空间						--=========================在此加入负重和空格数的判断
				PlayerIndex = PlayerIndex_save				
				Say ("你的背包没有足够的空间，请检查!",
					1,
					"我知道!/Zgc_dialog_end"
				)
				return
			else
				PlayerIndex = PlayerIndex_save
				local del_flag = DelItemByIndex(box_index,1)
				PlayerIndex = GetTeamMember(player_seq)
				if del_flag == 1 then
					local add_flag = 0
					if prize_level <=4 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
					elseif prize_level == 7 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
					else
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
					end
					if add_flag ~= 0 then
						local name = GetName()
						local task_fini_cond = player_fini_cond()
						PlayerIndex = PlayerIndex_save
						SendTongMessage(GetName().."??em 1:"..prize_jieshi_1..prize_jieshi_2)
						SendTongMessage("步非烟 "..name.." , 第三轮任务:"..task_fini_cond)
						WriteLog("步非烟: 玩家 ["..GetName().."] 地图 ID"..GetWorldPos().."L??y 1 "..prize_jieshi_1..prize_jieshi_2.."Cho "..name)
						PlayerIndex = GetTeamMember(player_seq)
						if prize_level == 7 then														
							WriteLogEx(strLogCaption, "黄金装备" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())
						end
					else
						WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"添加失败页面, 反馈:"..add_flag)
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"清除箱子失败, 反馈:"..del_flag)
				end
				PlayerIndex = PlayerIndex_save
			end
		end
	end
end
--===================================本脚本公用函数===================================
--*********************************二等箱子属性计算函数********************************
function zgc_conf_task_att_return(prize_level,prize_seq)
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	local random_num = 0
	if prize_att[prize_level][prize_seq][4] == 2 then
		random_num = random(0,2)
		att_2 = random_num
		return 0,att_2,0
	else
		random_num = random(0,2)
		att_1 = random_num
		random_num = random(0,1)
		att_2 = random_num
		random_num = random(0,1)
		att_3 = random_num
		return att_1,att_2,att_3
	end
end
--***********************************属性整合*************************************
function Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
	local att_save_num = prize_seq*1000+att_1*100+att_2*10+att_3
	return att_save_num
end
--***********************************属性分解*************************************
function Zgc_conf_task_att_dealout(att_save_num)
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = floor(att_save_num/1000)
	att_1 = floor((att_save_num - prize_seq*1000)/100)
	att_2 = floor((att_save_num - prize_seq*1000 - att_1*100)/10)
	att_3 = floor((att_save_num - prize_seq*1000 - att_1*100 - att_2*10)/10)
	return prize_seq,att_1,att_2,att_3
end
--***********************************陨铁增加函数**********************************
function zgc_conf_task_iron_add(prize_level)
	if GetFreeItemRoom() < (prize_water_num[prize_level] + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < (prize_iron_num[prize_level] + 50) then			--判断玩家负重和空间					--=========================在此加入负重和空格数的判断
		Say ("你的背包没有足够的空间，请检查!",
			1,
			"我知道!/Zgc_dialog_end"
			)
		return 0
	else	
		local iron_name = "陨铁"
		local add_flag = 0
		if prize_level < 5 then
			add_flag = AddItem(2,2,7,prize_iron_num[prize_level])
			iron_name = "陨铁碎片"
		else
			add_flag = AddItem(2,2,8,prize_iron_num[prize_level])
		end
		add_flag = add_flag + AddItem(2,1,1009,prize_water_num[prize_level])
		if add_flag == 0 then
			WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "获得 "..iron_name.." 失败, 反馈:"..add_flag)				
		else
			Msg2Player("你发现箱子里面有"..prize_iron_num[prize_level].."个"..iron_name.."!")
			Msg2Player("你发现箱子里面有"..prize_water_num[prize_level].." 陨铁晶石!")
			SendTongMessage(GetName().."打开箱子, 获得"..prize_iron_num[prize_level].."个"..iron_name.."!")
			SendTongMessage(GetName().."打开箱子, 获得"..prize_water_num[prize_level].." 陨铁晶石!")
			WriteLogEx(strLogCaption, "获得" ,prize_iron_num[prize_level], iron_name, "", GetTongName())
			WriteLogEx(strLogCaption, "获得" ,prize_water_num[prize_level], "陨铁晶石", "", GetTongName())			
		end
		return 1
	end
end
--***************************计算玩家近三轮的收集品缴纳情况***********************
function player_fini_cond()
	local string_return = ""
	local goods_num_count = 0
	local turn_num_sum = 0
	for i = 956,958 do
		if (Zgc_conf_task_time_return() - Zgc_conf_task_cent_date(1,i)) <=2 then
			goods_num_count = goods_num_count + Zgc_conf_task_cent_date(0,i)
			turn_num_sum = turn_num_sum + 1
		end
	end
	string_return = "("..turn_num_sum.." 轮,"..goods_num_count.." 累积点)"
	return string_return
end
--**************************数量和日期分装函数*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************轮次计算函数*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 57600)/(172800))
	return time_return
end
--***********************************字符替换函数*********************************
function replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--***********************************对话结束（空）*******************************
function Zgc_end_dialog()

end