Include("\\script\\lib\\textdata.lua") 
Include("\\script\\lib\\time.lua") 
Include("\\settings\\static_script\\global\\tonginfo_task.lua")

COEF_CONTRIB_TO_VALUE	=	2						--贡献度价值量转化系数
MAX_WEEK_CONTRIBUTION	=	2240000			--周累积贡献度上限(10w/h*4h/1000*80%*7d)

--贡献度入口活动类型
EVE_NOEVENT			=	0
EVE_BATTLES			=	1	-- 雁门关战场
EVE_TONGBATTLES	=	2	-- 帮会战场
EVE_CANGJIAN			=	3	-- 藏剑山庄
EVE_TAIXU				=	4	-- 太虚幻境
EVE_LIANGSHAN		=	5	-- 梁山群雄会
EVE_PLANT				=	6	-- 种植般若树
EVE_KILLER			=	7	-- 杀手任务
EVE_BIWUDAHUI		=	8	-- 比武大会
EVE_BOSS				=	9	-- 世界BOSS
EVE_YABIAO			=	10	-- 押镖劫镖
EVE_CHUANDAO		=	11	-- 西域传道
EVE_JINGSHU			=	12	-- 智夺经书
EVE_MIGUO			=	13	-- 幻境秘果
EVE_BAOZANG			=	14	-- 挖宝藏
EVE_SHIMEN			=	15	-- 师门任务

--周目标相关
MIN_WEEKGOAL_MEMBER			=	10																					--帮会周目标最少人数
DAILY_PRICE						=	50																					--每天帮众可到祭坛领取的奖励
TB_WEEKGOAL_PRICE_BASE		=	{ 2.5, 4.5, 6.75 }																		--三个难度级别的奖励基数
TB_WEEKGOAL_CHANGE			=	{ 4, 8, 16 }																			--三个难度级别的周手动小时数
WEEKGOAL_VALUE_PERSON		=	150 * 8																				--周目标个人贡献度需完成量
WEEKGOAL_VALUE_TONG_SYNC	=	WEEKGOAL_VALUE_PERSON / 10													--周目标帮会贡献度累积值同步阈值
WEEKGOAL_PRICE_PERSON		=	5000																				--周目标个人奖励经验值（单位：万）
WEEKGOAL_PRICE_TONG			=	50																					--周目标帮会奖励召唤令牌数
TB_WEEKGOAL_TYPE_ID			= 	{EVE_BATTLES, EVE_TONGBATTLES, EVE_CANGJIAN, EVE_TAIXU, EVE_LIANGSHAN, EVE_PLANT, EVE_KILLER, EVE_BIWUDAHUI, EVE_BOSS}	--周目标类型
TB_WEEKGOAL_TYPE_NAME		=	{"雁门关战场", "帮会战场", "藏剑山庄", "太虚幻境", "梁山群雄会", "种植般若树", "杀手任务", "比武大会", "世界BOSS" }						--周目标类型名称
TB_WEEKGOAL_PRICE_ITEM		=	{ 																					--周目标物品奖励类型
--	g,	d,	p,		lvl,	s,	luck,time,		bindstate,name
	{6,	1,	130,	1,	0,	0,	7*24*60,	-2,		"大白驹丸"},
	{6,	1,	2822,	1,	0,	0,	7*24*60,	-2,		"辉煌之果"},
	{6,	1,	1081,	1,	0,	0,	7*24*60,	-2,		"召唤令牌"},
	{6,	1,	1181,	1,	0,	0,	7*24*60,	-2,		"特效仙草露"},
	{6,	1,	2769,	1,	0,	0,	7*24*60,	-2,		"速效白驹丸（大）"},
	{6,	1,	1427,	1,	0,	0,	7*24*60,	-2,		"子母袋"},
	{6,	1,	1375,	1,	0,	0,	7*24*60,	-2,		"朝廷赦书"},
	{6,	1,	1263,	1,	0,	0,	7*24*60,	-2,		"高级寄卖牌"},
	{6,	1,	1337,	1,	0,	0,	7*24*60,	-2,		"女儿红（召唤野叟的酒）"},
}

TB_WEEKGOAL_PRICE_ITEM_WIDTH = 1
TB_WEEKGOAL_PRICE_ITEM_HEIGHT = 1	
TB_WEEKGOAL_PRICE_ITEM_FREEITEMCELLLIMIT = 1	

TONGTSK_WEEKGOAL_ITEM			=	1450			--帮会周目标物品奖励
TONGTSK_WEEKGOAL_CURITEM		=	1451			--帮会当前选择的周目标物品奖励
TONGTSK_WEEKGOAL_ITEM_WEEK	=	1452			--帮会选择周目标物品奖励的周数


--玩家任务变量定义
TASKID_CONTRIVALUE					=	1453			--玩家贡献价值量
TASKID_WEEK_CONTRIVALUE			=	1454			--玩家周目标贡献价值量
TASKID_STORED_OFFER				=	1455			--玩家后备贡献度
TASKID_CONTRIBUTE_USED			=	1456			--累积消耗的周贡献度（递增，领取时判断更新）
TASKID_ZUOYUEJIAJIANG_COUNT		=	1457			--每周使用卓越嘉奖令次数
TASKID_YOUXIUBANGZONG_COUNT	=	1458			--每周使用优秀帮众令次数

--帮会成员任务变量定义
TONGMTSK_WEEK_GOAL_PRICE		=	1459			--周目标领奖记录
TONGMTSK_DAILY_PRICE				=	1460			--祭坛领奖记录

--帮会任务变量定义（文件定义，列）
--\data\tong\tong.txt (列 - 帮会名称 - 贡献度)
TONGTSK_GOAL_CONTRIVALUE		=	2				--帮会总贡献度
--\data\tong\tong_"week".txt
--1：帮会名称
--2：周玩家累计贡献度
--3：当前玩家周目标贡献度
--4：本周周目标标识
--5：本周周目标名称
--6：周目标难度
--7：玩家周目标需要完成贡献度
--8：帮会周目标需要完成贡献度
--9：玩家周目标奖励
--10：帮会周目标奖励
-- TONGTSK_WEEKGOAL_COMPLETE		=	2			--帮会上周贡献度
TONGTSK_WEEKGOAL_CURCOMPLETE	=	2				--帮会当前周贡献度
TONGTSK_WEEKGOAL_TYPE_ID		=	3				--帮会当前周目标
TONGTSK_LAST_WM_DAY				= 	4				--帮会本周周期

TONGTSK_CLAIMWAR_DATE			=	5				--帮会宣战日期
TONGTSK_CLAIMWAR_TIMES			=	6				--帮会在某天宣战的次数
TONGTSK_CLAIMWAR_LEFT_TIMES		=	7				--帮会在某天宣战的剩余次数
TONGTSK_CHANGECAMP_DATE		=	8				--帮会换色的日期
TONGTSK_CHANGECAMP_TIMES		=	9				--帮会换色当日的次数

--帮会临时任务变量定义
--贡献度入口数据缓存
TONG_TEMPSTART						=	100				--临时变量ID必须大于此值
TONG_WEEKTEMP						=	101				--周目标累积贡献度缓存
TONG_STORETEMP						=	102				--储备贡献度缓存
TONG_TMPWEEKGOALPRICE			=	103				--周目标领奖临时
