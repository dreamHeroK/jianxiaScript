
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 门派任务头文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
Include("\\script\\global\\技能树操作.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件

-- 子函数，用以获取门派任务的进展程度
function FN_GetTaskState(fn)
	return GetTask(fn)
end

-- 子函数，用以设置门派任务的进展程度
function FN_SetTaskState(fn, nValue)
	SetTask(fn, nValue)
end

-- 子函数，使门派任务进展到下一步
function FN_SetTaskAdd(fn)
	SetTask(fn, GetTask(fn) + 1)
	return
end

-- 子函数，用于扩展对话 TALK 函数的功能
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	
-- 子函数，用于根据玩家性别获得名称
function GT_SexName(fn)
	local strSex = ""
	local fn = 1
	if GetSex() == 1 then
		if fn == 2 then
			strSex = "小兄弟"
		elseif fn == 3 then
			strSex = "公子"
		elseif fn == 4 then
			strSex = "施主"
		else
			strSex = "大侠"
		end
	elseif GetSex() == 2 then
		if fn == 2 then
			strSex = "小妹妹"
		elseif fn == 3 then
			strSex = "姑娘"
		elseif fn == 4 then
			strSex = "施主"
		else
			strSex = "女侠"
		end
	else
		strSex = "大侠"
	end;
	return strSex;
end;

--脚本功能：流派加入NPC相关功能统一处理
--功能设计：村长
--代码开发：村长
--开发时间：2009-3-14
--我问佛祖：bug为什么改不完？佛祖曰：策划乃bug之母。我问：bug之父呢？佛祖曰：非你莫属！
--门派名称
--====================门派传送人===============


g_szInfoHead = "<color=green>门派接引人<color>:";
MAX_SEL_PER_PAGE = 5;	--每页门派数量

TB_FACTION_PLACE =
{	--{门派名字,{坐标点信息},战斗状态,门派编号}
	{"少林",{204,1501,3328},1,1},
	{"武当",{312,1713,3469},1,2},
	{"峨眉",{303,1603,3240},1,3},
	{"丐帮",{209,1528,3246},1,4},
	{"唐门",{305,1532,2915},1,5},
	{"天波扬府",{219,1630,3274},1,6},
	{"五毒教",{407,1555,3282},1,7},
	{"昆仑",{509,1513,3285},0,8},
	{"明教",{152,1518,3078},0,9},
	{"翠烟",{404,1507,2788},0,10},
}
TB_FACTION_PLACE_INDEX = nil
function _init_TB_FACTION_PLACE_INDEX()
	if not TB_FACTION_PLACE_INDEX then
		TB_FACTION_PLACE_INDEX = {}
		for i=1,getn(TB_FACTION_PLACE) do
			local t = TB_FACTION_PLACE[i]
			TB_FACTION_PLACE_INDEX[t[4]] = t;
		end
		return 1
	end
end
--获得选项table
function get_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};
	local tbFactionTb = get_faction_list();
	local szFactionName = "";
	local nFactionIdx = 0;
	_init_TB_FACTION_PLACE_INDEX()
	for i=1,getn(tbFactionTb) do
		nFactionIdx = tbFactionTb[i];
		szFactionName = TB_FACTION_PLACE_INDEX[nFactionIdx][1];
		if i == 1 and nFaction ~= 0 then
			tinsert(tbRetTb,"回师门("..szFactionName..")/#go_to_faction("..nFactionIdx..")");
		else
			tinsert(tbRetTb,szFactionName.."/#go_to_faction("..nFactionIdx..")");
		end;
	end;
	return tbRetTb;
end;
--获得门派对应的对话顺序table
function get_faction_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};	--返回table
	local tbInitTb = {};	--基础table，用作中间处理
	for i=1,getn(TB_FACTION_PLACE) do
		tbInitTb[i] = TB_FACTION_PLACE[i][4];
	end;
	if nFaction == 0 then
		tbRetTb = tbInitTb;
	else
		tinsert(tbRetTb,nFaction);	--先把对应的门派放第一位
		--tbInitTb[nFaction] = 0;	--标记对应的门派已放进tbRetTb
		for i=1,getn(tbInitTb) do
			if tbInitTb[i] ~= nFaction then
				tinsert(tbRetTb,tbInitTb[i])	--把剩下未放进tbRetTb的门派按顺序放进tbRetTb
			end;
		end;
	end;
	return tbRetTb;
end;

--列出对话选项
function list_content(nPageNum)
	local tbList = get_list();
	local nRecordCount = getn(tbList);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n上一页/#list_content(%d)",nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n下一页/#list_content(%d)",nPageNum+1));
	end;
	tinsert(selTab,"我想取消当前入门任务/cancel_faction");
	tinsert(selTab,"哪里都不想去/no");
	Say(g_szInfoHead.."我就是江湖鼎鼎大名的门派接引人，可以快速送你到江湖各大门派，请问你想去哪个门派呢？",getn(selTab),selTab);
end

function moneygo()
	--if GetLevel()<70 then
		--return 1
	--elseif GetCash()>=500 then
		--PrePay(500)
		--return 1
	--else
		--return 0
	--end
	
	return 1
end;

--去目的地
function go_to_faction(nFaction)
	if moneygo() == 1 then
		CleanInteractive();
		local nMapID,nMapX,nMapY = 0,0,0;
		local nFightState = 0;
		_init_TB_FACTION_PLACE_INDEX()
		nMapID = TB_FACTION_PLACE_INDEX[nFaction][2][1];
		nMapX = TB_FACTION_PLACE_INDEX[nFaction][2][2];
		nMapY = TB_FACTION_PLACE_INDEX[nFaction][2][3];
		nFightState = TB_FACTION_PLACE_INDEX[nFaction][3];
		NewWorld(nMapID,nMapX,nMapY);
		SetFightState(nFightState);
	else
		Talk(1,""..g_szInfoHead.."大侠的银两不够，不能为您传送啊。")
	end;
end;

function no()
end;

--取消目前所有入门任务进度
function cancel_faction()
	if GetPlayerFaction()~=0 then
		Say(g_szInfoHead.."阁下已是身有门派之人，取消与否已经不再重要了？",0);
	else
		Say(g_szInfoHead.."阁下确定要取消入门任务吗？",0);
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			SetTask(TB_FACTION_TASKID_LIST[i],0)
		end
		if GetNpcName(GetFollower())  == "小貂" then
			KillFollower()
		end
	end
end

FN_SL 	= 1001; --少林
FN_WD 	= 1002; --武当
FN_EM 	= 1003; --峨眉
FN_GB 	= 1004; --丐帮
FN_TM 	= 1005; --唐门
FN_YM 	= 1031; --杨门男
FN_YMM  = 1032; --杨门女
FN_WP	= 1033; --五毒
--====================新门派其它功能===========
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018,1019}
TB_FACTION_INFO = {
	"少林",
	"武当",
	 "峨嵋",
	"丐帮",
	"唐门",
	"杨门",
	"五毒",
	"昆仑",
	"明教",
	"翠烟",
}

--流派名称
TB_ROUTE_INFO = {
	"少林",
	"少林俗家",
	"少林禅僧",
	"少林武僧",
	"唐门",
	"唐门",
	"峨嵋",
	"峨嵋佛家",
	"峨嵋俗家",
	"丐帮",
	"丐帮净尧",
	"丐帮污尧",
	"武当",
	"武当道家",
	"武当俗家",
	"杨门",
	"杨门枪骑",
	"杨门弓骑",
	"五毒",
	"五毒邪侠",
	"五毒蛊师",
	"昆仑",
	"昆仑天师",
	"明教",
	"明教圣战",
	"明教阵兵",
	"明教血人",
	"翠烟",
	"翠烟舞仙",
	"翠烟灵女",
	"唐门任侠",
	"昆仑剑尊",
}
--门派对应的流派
TB_FACTION_ROUTE = {
	[1] = 1,
	[2] = 13,
	[3] = 7,
	[4] = 10,
	[5] = 5,
	[6] = 16,
	[7] = 19,
	[8] = 22,
	[9] = 24,
	[10] = 28,
}
--掌门人NPC
TB_FACTION_MASTER_NAME = {
	[1] = "玄慈",
	[2] = "紫鹤真人",
	[3] = "真如师太",
	[4] = "龙在天",
	[5] = "唐门姥姥",
	[6] = "佘太君",
	[7] = "白莹莹",
	[8] = "周不惑",
	[9] = "方腊",
	[10] = "柴凰儿",
}

--师门重复任务的对应难度
TB_FACTION_TASK_DIFF = {
	[2] = TASK_ID_SHAOLIN_SUJIA,
	[3] = TASK_ID_SHAOLIN_CHANSENG,
	[4] = TASK_ID_SHAOLIN_WUSENG,
	[6] = TASK_ID_TANGMEN,
	[8] = TASK_ID_EMEI_FOJIA,
	[9] = TASK_ID_EMEI_SUJIA,
	[11] = TASK_ID_GAIBANG_JINGYI,
	[12] = TASK_ID_GAIBANG_WUYI,
	[14] = TASK_ID_WUDANG_DAOJIA,
	[15] = TASK_ID_WUDANG_SUJIA,
	[17] = TASK_ID_YANGMEN_QIANGQI,
	[18] = TASK_ID_YANGMEN_GONGQI,
	[20] = TASK_ID_WUDU_XIEXIA,
	[21] = TASK_ID_WUDU_GUSHI,
	[23] = TASK_ID_KUNLUN_TIANSHI,
	[25] = TASK_ID_MINGJIAO_SHENGZHAN,
	[26] = TASK_ID_MINGJIAO_ZHENBING,
	[27] = TASK_ID_MINGJIAO_XUEREN,
	[29] = TASK_ID_CUIYAN_WUXIAN,
	[30] = TASK_ID_CUIYAN_LINGNV,
	[31] = TASK_ID_TANGMEN_RENXIA,
	[32] = TASK_ID_KUNLUN_JIANZUN,
}
--师门密室NPC
TB_FACTION_BACK_NAME = {
	[1] = "玄空",
	[2] = "薛云铮",
	[3] = "慧芸师太",
	[4] = "彭虏望",
	[5] = "唐苏幕",
	[6] = "杨延昭",
	[7] = "勾册",
	[8] = "陈不为",
	[9] = "石宝",
	[10] = "刘青眉",
}

tFactionBook45 = {
	{"金刚伏魔经", 0, 107, 1, 1, 1},
	{"金刚伏魔心法", 0, 107, 2, 1, 0},
	{"潜龙秘籍", 0, 107, 3, 1, 1},
	{"潜龙心法", 0, 107, 4, 1, 0},
	{"无尘秘籍", 0, 107, 5, 1, 1},
	{"无尘心法", 0, 107, 6, 1, 0},
	{"天罗秘籍", 0, 107, 7, 1, 1},
	{"天罗心法", 0, 107, 8, 1, 0},
	{"如意秘籍", 0, 107, 9, 1,1},
	{"如意心法", 0, 107, 10, 1, 0},
	{"碧海谱", 0, 107, 11, 1, 1},
	{"碧海心法", 0, 107, 12, 1, 0},
	{"混沌秘籍", 0, 107, 13, 1, 1},
	{"混沌心法", 0, 107, 14, 1, 0},
	{"揆天秘籍", 0, 107, 15, 1, 1},
	{"揆天心法", 0, 107, 16, 1, 0},
	{"幻影秘籍", 0, 107, 17, 1, 1},
	{"幻影心法", 0, 107, 18, 1, 0},
	{"君子秘籍", 0, 107, 19, 1, 1},
	{"君子心法", 0, 107, 20, 1, 0},
	{"镇军秘籍", 0, 107, 21, 1, 1},
	{"镇军心法", 0, 107, 22, 1, 0},
	{"穿云秘籍", 0, 107, 23, 1, 1},
	{"穿云心法", 0, 107, 24, 1, 0},
	{"幽冥鬼录", 0, 107, 25, 1, 1},
	{"幽冥心法", 0, 107, 26, 1, 0},
	{"灵蛊秘籍", 0, 107, 27, 1, 1},
	{"灵蛊心法", 0, 107, 28, 1, 0},
	{"惊风秘籍", 0, 107, 180, 1, 1},
	{"惊风心法", 0, 107, 181, 1, 0},
	{"回锋秘籍", 0, 107, 182, 1, 1},
	{"回锋心法", 0, 107, 183, 1, 0},
	{"负旗秘籍", 0, 107, 184, 1, 1},
	{"负旗心法", 0, 107, 185, 1, 0},
	{"凝血秘籍", 0, 107, 186, 1, 1},
	{"凝血心法", 0, 107, 187, 1, 0},
	{"醉梦秘籍", 0, 107, 188, 1, 1},
	{"醉梦心法", 0, 107, 189, 1, 0},
	{"繁花秘籍", 0, 107, 190, 1, 1},
	{"繁花心法", 0, 107, 191, 1, 0},
}

--流派入门相关
TB_ROUTE_IN_INFO = {
	[2] = {
		npc_name = "玄悲",
		bewrite = "阿弥陀佛！本脉武功专供<color=yellow>俗家弟子<color>修习，重在强筋健骨，可练不坏之金身。武器擅用<color=yellow>刀<color>、<color=yellow>棍<color>。有什么我能帮你的？",
	},
	[3] = {
		npc_name = "玄晦",
		bewrite = "阿弥陀佛！本脉禅法只传<color=yellow>修禅弟子<color>，可以无边佛法倒转五行，并以强劲内气，护身伤敌。<color=yellow>锡杖<color>是我脉弟子专用作法之宝。有什么我能帮你的？",
	},
	[4] = {
		npc_name = "玄苦",
		bewrite = "阿弥陀佛！本脉武功只传<color=yellow>武僧弟子<color>，重在以内气驱动招式，近身后连续攻击可使敌人无处可逃。武器以<color=yellow>护手<color>来提升攻击能力。有什么我能帮你的？",
	},
	[6] = {
		npc_name = "唐天啸",
		bewrite = "本门武功轻巧灵活，讲究与敌人周旋，从远处攻敌之要害，独门<color=yellow>陷阱<color>更可以充分尚弱敌人战斗力。弟子均以<color=yellow>暗器<color>为武器。有什么我能帮你的？",
	},
	[8] = {
		npc_name = "慧心师太",
		bewrite = "凡我脉弟子，须潜心修佛，尽去全身戾气，以佛法度人，自身也受益匪浅。<color=yellow>剑<color>是我脉弟子最擅长的武器。有什么我能帮你的？",
	},
	[9] = {
		npc_name = "慧音师太",
		bewrite = "修习我脉琴法，可融万灵于一体，以内气化琴音，干扰敌人，保自身无虞。我脉弟子必须用<color=yellow>琴<color>。有什么我能帮你的？",
	},
	[11] = {
		npc_name = "马靖生",
		bewrite = "我脉武功力大势沉，练成后擎可碎石、指可破刀，降龙十八掌威镇天下。我脉弟子都用<color=yellow>护手<color>提升攻击能力。有什么我能帮你的？",
	},
	[12] = {
		npc_name = "宋元安",
		bewrite = "本脉功夫以<color=yellow>身法<color>为基，轻而不浮、灵而不浊，来去自如，游刃有余，独门心法更可以彼之道还施彼身。我脉弟子普持<color=yellow>棍<color>一根，以为武器。有什么我能帮你的？",
	},
	[14] = {
		npc_name = "俞振生",
		bewrite = "以气御剑、剑气合一，化五行之气于剑便可无坚不摧，更可来去自如。我脉剑气，须借<color=yellow>剑<color>而发。有什么我能帮你的？",
	},
	[15] = {
		npc_name = "代剑州",
		bewrite = "我脉功夫最讲究自身灵动，招数快、准、狠，更可影其身而政敌之不备。轻灵武器以笔为尊，我脉弟子均须用<color=yellow>笔<color>。有什么我能帮你的？",
	},
	[17] = {
		npc_name = "杨宗保",
		bewrite = "我杨门枪骑专供<color=yellow>枪骑子弟<color>修习，重在冲锋陷阵，斩敌立功。随身武器<color=yellow>长枪<color>一根。有什么我能帮你的？",
	},
	[18] = {
		npc_name = "穆桂英",
		bewrite = "杨门弓骑专供<color=yellow>弓骑子弟<color>修习，重在牵制敌人，保护战友。以<color=yellow>弓<color>为武器。有什么我能帮你的？",
	},
	[20] = {
		npc_name = "吴言",
		bewrite = "聚八方之邪气，魑魅魍魉皆为我所用。借尸还魂，则同驭尸而行千里，假手伤人。本脉功夫以<color=yellow>身法<color>、<color=yellow>力量<color>和<color=yellow>内功<color>为基，而邪气须籍<color=yellow>双刀<color>而发。不知有什么我能帮你的？",
	},
	[21] = {
		npc_name = "柳新竹",
		bewrite = "西南异地，多毒虫瘴气。籍我蛊师独门蛊术，任他有百年功力，也尽枉然。。本脉功夫以<color=yellow>洞察<color>为基，而门下弟子均须用<color=yellow>爪<color>。有什么我能帮你的？",
	},
	[23] = {
		npc_name = "秦不智",
		bewrite = "昆色景色清幽，正是修身养性之地！本脉武功只传天师弟子，通过焚化符咒祭祀风和雷两种再施展对应技能，风系技能以控制与防护为主，攻击技能伤害偏低；雷系技能以伤害输出为主，政击较高，技能多以群攻为主。本脉功夫以<color=yellow>内功<color>为基，武器以<color=yellow>剑<color>来提升攻击能力。",
	},
	[25] = {
		npc_name = "厉天闰",
		bewrite = "明教圣火经久不息，教内弟子皆为热血之人！本脉武功只传圣战弟子，通过积攒怒气挥刀打击敌人，攻击时刚劲而威猛，防守时犹如铜墙铁壁。本脉功夫以<color=yellow>力量<color>为基，武器以<color=yellow>刀<color>来提升攻击能力。",
	},
	[26] = {
		npc_name = "王寅",
		bewrite = "明教阵兵为教内的精锐之师，攻无不克，战无不胜！本脉武功只传阵兵弟子，精通五行相生相克之理，笔锋所指，给敌人予以沉重。本脉功夫以<color=yellow>洞察<color>为基，武器以<color=yellow>笔<color>来提升攻击能力。",
	},
	[27] = {
		npc_name = "司行方",
		bewrite = "明教教众亲如兄弟，而对敌人则要狠之又狠！本脉武功只传血人弟子，讲求动作迅速，身法敏捷，用利瓜给敌人施以印记，则施展武功致敌于死地。本脉功夫以<color=yellow>身法<color>为基，以<color=yellow>爪子<color>来提升攻击能力。",
		equip = 11,
	},
	[29] = {
		npc_name = "周子雯",
		bewrite = "墨烟繁花似锦，落英缤纷，正是练习舞蹈绝美之境！本脉武功只传舞仙弟子，讲求身法，可在武功施展过程中移动，醉人的舞蹈会削弱敌人，并且提高友方属性。本脉功夫以<color=yellow>身法<color>为基，武器以<color=yellow>灵枝<color>来提升攻击能力。",
	},
	[30] = {
		npc_name = "胡曼成",
		bewrite = "只有拥有自然之心，才能与小貂和睦相处！本脉武功只传灵女弟子，平时学习喂养小貂，伴随其成长，战斗时可通过笛子召唤小貂施展武功攻击敌人。本脉功夫以<color=yellow>洞察<color>为基，武器以<color=yellow>笛子<color>来提升攻击能力。",
	},
	[31] = {
		npc_name = "唐弄月",
		bewrite = "凡入我脉者，不必拘泥于唐姓门门阀之旧俗，随心所欲闯荡江湖。<color=yellow>匕首<color>是我脉弟子最擅长的武器",
	},
	[32] = {
		npc_name = "云羲和",
		bewrite = "凡入我脉者，必立誓穷其毕生带剑修行，以窥剑心通明之大道。<color=yellow>剑<color>是我脉弟子最擅长的武器。",
	},
}

--师门售卖
TB_FACTION_SALE = {
	[1]={44,66,67},
	[2]={46,78,79},
	[3]={45,72,73},
	[4]={47,75,76},
	[5]={48,69,70},
	[6]={51,81,82},
	[7]={55,84,85},
	[8]={112,113,114},
	[9]={116,117,118},
	[10]={120,121,122},
}

--师门售卖NPC
TB_FACTION_SALE_NPC = {
	[1] = "祖闻达",
	[2] = "鄢茹",
	[3] = "叶子馨",
	[4] = "尤知味",
	[5] = "唐天海",
	[6] = "杨排风",
	[7] = "泰光",
	[8] = "梅不容",
	[9] = "方七佛",
	[10] = "何谐",
}

--师门传送
TB_TRANSPORT_INFO = {
	[1] = {"<color=green>净圆<color>：阿弥陀佛！"..GT_SexName(4).."光降少林，敞寺上下何如幸之，"..GT_SexName(4).."是要下山吗？小僧可以帮忙。",
		{
			{200,1501,2978},
			{200,1267,2970},
			{200,1249 ,2732},
			{200,1169,2845},
		}
	},
	[2] = {"<color=green>莫秋风<color>："..GT_SexName(1).."，是要下山吗？贫道可以送你下山。",
		{
			{350,1518,3050},
			{350,1362,3053},
			{350,1332,2865},
			{350,1542,2865},
		}
	},
	[3] = {"<color=green>仪和<color>："..GT_SexName(3).."，是要下山吗？贫尼送你一程。",
		{
			{300,1677,3671},
			{300,1681,3464},
			{300,1911,3442},
			{300,1718,3534},
		}
	},
	[4] = {"<color=green>洪七<color>："..GT_SexName(3).."，是要下山吗？小乞丐送你一程。",
		{
			{150,1724,3075},
			{150,1630,3050},
			{150,1615,3175},
			{150,1757,3179},
		}
	},
	[5] = {"<color=green>唐婉儿<color>："..GT_SexName(3).."，是要出去吗？我送你一程。",
		{
			{300,1677,3671},
			{300,1681,3464},
			{300,1911,3442},
			{300,1744,3562},
		}
	},
	[6] = {"<color=green>杨洪<color>："..GT_SexName(2).."，是要出去吗？我送你一程。",
		{
			{200,1501,2978},
			{200,1267,2970},
			{200,1249,2732},
			{200,1169,2845},
		}
	},
	[7] = {"<color=green>熊立<color>："..GT_SexName(1).."是不是想要离开，山上道路险要，要离开的话我送"..GT_SexName(1).."一程。",
		{
			{100,1521,2870},
			{100,1386,2905},
			{100,1555,3080},
			{100,1429,3005},
		}
	},
	[8] = {"<color=green>王不凡<color>：此乃昆仑山，我派虽未在中原大举招收弟子，但是清幽景色也吸引了无数武林中人前来观赏，你可以进入本派参观，招待不周还望见谅。山上道路险要，要下山的话我可为你领路。",
		{
			{300,1793,3544},
			{300,1755,3518},
			{300,1718,3534},
			{300,1744,3562},
		}
	},
	[9] = {"<color=green>方百花<color>：此地路道险要，还是我来送你一程吧。",
		{
			{100,1460,2967},
			{100,1429,3005},
			{100,1398,2979},
			{100,1433,2947},
		}
	},
	[10] = {"<color=green>巧巧<color>：翠烟风光旖旗，景色迷人，但是小心迷路了，还是我送你出去吧。",
		{
			{400,1549,2968},
			{400,1512,2980},
			{400,1533,2993},
			{400,1541,2935},
		}
	}
}


--=============流派师父相关=================
function master_main(faction_seq,route_seq)
	local t_dia_sel = {
		"学习"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."武功/#learn_skill("..route_seq..")",
--		"领取师傅送给弟子的师恩难忘包/#giveShiEnBox("..route_seq..")",
		"打个招呼/end_dialog",
	}
	local t_dia_show = {}
	local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>："..TB_ROUTE_IN_INFO[route_seq].bewrite
	if GetPlayerRoute()  == 31 or GetPlayerRoute()  == 32  then
		tinsert(t_dia_show,t_dia_sel[1])
		if route_seq == 32 then
--			tinsert(t_dia_show,"我要选择炼剑材料/#show_equip_shop(80)");				 --炼剑材料
		end
	else
		if GetPlayerFaction() == faction_seq then
			if GetPlayerRoute()  == route_seq then
				tinsert(t_dia_show,t_dia_sel[1])
				if route_seq == 21 then
					tinsert(t_dia_show,"弟子想跟师傅借阅《蛊经》一书/give_gujing_book");		 --蛊经
					tinsert(t_dia_show,"请您给我一个神木王鼎/give_shenmuwangding");			 --神木王鼎
--					tinsert(t_dia_show,"请您给我一些蛊/give_gu");			 --蛊（临时）
				end
				if route_seq == 30 then
					tinsert(t_dia_show,"请给我一本《养貂指南》/give_yangdiao_book");			 --养貂指南
--					tinsert(t_dia_show,"请给我一些小貂食物/give_yangdiao_feed");				 --养貂秒修（临时）
				end
			end
		end
	end
	tinsert(t_dia_show,t_dia_sel[2])
	if getn(t_dia_show) == 1 then
		Talk(1,"",s_dia_main)
	else
		Say(s_dia_main,
			getn(t_dia_show),
			t_dia_show
		)
	end
end


--学习技能
function learn_skill(route_seq)
	if GetPlayerRoute() ~= route_seq then	--流派检测
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>：大侠没入任何门派，不能学习武功哦！")
	else
		Say(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>：武功图标右下角出现，√表示可以学习该武功，出现↑表示可以升级该武功，用左键直接点击它们就好了。")
		AllowLearnSkill()
	end
end

function giveShiEnBox(route_seq)
	if GetPlayerRoute() ~= route_seq then	--流派检测
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>：大侠没入任何门派，不能领取师恩难忘包哦！")
	else
		local nTalkValue = GetBit(GetTask(1314), 5)
		if nTalkValue == 0 then
			if gf_Judge_Room_Weight (1,10, "") ~= 1 then
				return
			end
			local nRet, nIndex = AddItem(2,1,593,1,4) 
			Msg2Player("您获得了[师恩难忘包]×1");
			SetTask(1314, SetBit(GetTask(1314), 5, 1));
			WriteLog("shiennanwangbao log:\t"..GetName().." 领取 师恩难忘包！");
		else
			Talk(1,"", "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>：不要太贪心哦，你已经领过师恩难忘包了。")
		end
	end
end

--=============师门重复任务相关==========
function ftask_repeat_main(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：师门重复任务相关！",
		2,
		"接取师门任务/#start_faction("..faction_seq..")",
--		"师门贡献度检查/#check_query("..faction_seq..")",
--		"师门任务说明/shimenshuoming",
--		"修复无法完成bug/#repair_faction("..faction_seq..")",
		"结束对话/end_dialog"
		)
end

function start_faction(faction_seq)
	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：抱歉，你不是"..TB_FACTION_INFO[faction_seq].."的成员")
		return
	elseif (GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq]) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：已经是本门派的弟子了，快去完成任务吧！")
		return
	else
		task_main_entrance(TB_FACTION_TASK_DIFF[GetPlayerRoute()])
	end
end
function check_query(faction_seq)
	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：在加入本门派之前无法查询门派贡献。加入门派需要完成一些任务并达到一定的声望值，具体信息请咨询本门派使者或者前往本门派总部。")
		return
	end

	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你不是本门派的成员，无法查看门派贡献。按下F3键可以查看门派贡献。")
		return
	end
--	query_faction_contribute()
end

function shimenshuoming()
	Talk(1,"shuoming2","<color=green>师门说明：<color>\n<color=yellow>如何获得师门任务：<color>通过完成主线任务或者与师门相关的特定任务，可以获得师门任务。\n<color=yellow>完成师门任务：<color>每天可以完成一定数量的师门任务。任务难度越高，奖励也越丰厚。\n<color=yellow>师门任务奖励：<color>完成师门任务可以获得经验、声望、门派贡献和其他奖励。\n<color=yellow>任务限制：<color>完成师门任务需要角色等级达到一定要求，并且不能超过一定的重修次数。\n<color=yellow>师门贡献：<color>通过完成师门任务可以获得门派贡献，贡献值可以用于购买门派特殊物品或者提升师门内的地位。")
end

function shuoming2()
	Talk(1,"","<color=green>师门说明：<color>\n<color=yellow>师门任务的不同类型：<color>不同类型的师门任务具有不同的任务内容和奖励。完成师门任务时，需要根据任务类型采取相应的行动。\n<color=yellow>任务完成奖励：<color>完成师门任务可以获得经验、声望、贡献和其他奖励。根据任务难度不同，完成任务所需的时间和付出也会有所差异。\n<color=yellow>个人经验总结：<color>根据个人经验总结，完成师门任务的最佳方式和技巧。个人经验总结<3000经验时不增加经验，>3000经验时经验增加较多。")
end

-- 修复杀怪任务无法完成的bug
function repair_faction(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：修复杀怪任务无法完成的bug",
		2,
		"确认修复问题/#cfm_repair_bug("..faction_seq..")",
		"取消/no")
end;

function cfm_repair_bug(faction_seq)
	RepairAllChainTask()
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：重置师门任务task!")
end;

--==============闭关修炼=================
cards_table = {
	{2, 0, 205},
	{2, 0, 206},
	{2, 0, 207},
	{2, 0, 208},
	{2, 0, 209},
	{2, 0, 350},
	{2, 0, 390},
	{2, 0, 787},
	{2, 0, 788},
	{2, 0, 789},
}

function practice_main(faction_seq)
	if GetPlayerFaction() == 0 then return 0; end
	if GetPlayerFaction() ~= faction_seq then
		Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：这是"..TB_FACTION_INFO[faction_seq].."的闭关修练之地，大侠还是去自己的门派吧。");
	else
		Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：天阴教势力日益强大，红印教主如日中天，辽国决定携天阴席卷中原之势，借燕云十六州，大举南侵。并派天阴密探潜入各大门派弟子修炼之地附近，试图扰乱门派弟子清修，在这种严峻的形势下，各派掌门决定关闭密室修炼，让我亲传武功，快速修炼本门秘籍。你可愿意？",
			4,
			"我要快速修炼秘籍28级（需要小人参果10小时，大人参果4小时，修为4000点，50金）/#practice_main_confirm_xiao("..faction_seq..")",
			"我要快速修炼秘籍53级（需要大人参果6小时，千年人参果4小时，修为6000点，100金）/#practice_main_confirm_da("..faction_seq..")",
			"我要快速修炼秘籍99级（需要千年人参果8小时，大修真要诀2本，修为7000点，150金）/#practice_main_confirm_qiannian("..faction_seq..")",
--			"我师傅让我来找您修炼初级秘籍（45级秘籍心法，免费秒修）/#practice_main_confirm_free("..faction_seq..")",
			"弟子资质欠缺，暂不修炼/end_dialog"
		)
	end;
end

function practice_main_confirm_xiao(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：要快速修炼秘籍28级需要小人参果<color=red>10小时<color>，大人参果<color=red>4小时<color>，修为<color=red>4000点<color>，请仔细检查你的秘籍，如果你的秘籍大于28级，一样会消耗你的修炼时间但不会升级，你得再次确认？",
		2,
		"确定修炼/#practice_confirm_xiao("..faction_seq..")",
		"弟子再看看/end_dialog"
	)
end

function practice_main_confirm_da(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：要快速修炼秘籍53级需要大人参果<color=red>6小时<color>，千年人参果<color=red>4小时<color>，修为<color=red>6000点<color>，请仔细检查你的秘籍，如果你的秘籍大于53级，一样会消耗你的修炼时间但不会升级，你得再次确认？",
		2,
		"确定修炼/#practice_confirm_da("..faction_seq..")",
		"弟子再看看/end_dialog"
	)
end

function practice_main_confirm_qiannian(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：要快速修炼秘籍99级需要千年人参果<color=red>8小时<color>，修为<color=red>8000点<color>，请仔细检查你的秘籍，如果你的秘籍已经99级，一样会消耗你的修炼时间，你得再次确认？",
		2,
		"确定修炼/#practice_confirm_qiannian("..faction_seq..")",
		"弟子再看看/end_dialog"
	)
end

function practice_main_confirm_free(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：初级秘籍心法（45级）现在免费快速修炼，请仔细检查你的秘籍，如果你的秘籍已经99级，就不需要快速修炼了，你得再次确认？",
		2,
		"确定修炼/#practice_confirm_free("..faction_seq..")",
		"弟子再看看/end_dialog"
	)
end


function practice_confirm_xiao(faction_seq)
	local nTimeMinus = 60 * 18 * 60
	local confirm_time_xiao = 10 * nTimeMinus
	local confirm_time_da = 4 * nTimeMinus
	local confirm_xiuwei = 4000
	local TASK_XIAO_ID = 2506
	local nLeftTime_xiao = GetTask(TASK_XIAO_ID)
	nLeftTime_xiao = floor(nLeftTime_xiao / 18 / 60)
	local nHour_xiao = floor(nLeftTime_xiao / 60)
	local TASK_DA_ID = 2505
	local nLeftTime_da = GetTask(TASK_DA_ID)
	nLeftTime_da = floor(nLeftTime_da / 18 / 60)
	local nHour_da = floor(nLeftTime_da / 60)
	if nHour_xiao < 10 or nHour_da < 4 or GetPopur() < 4000 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：您当前的小人参果修炼时间<color=yellow>"..nHour_xiao.."小时<color>，大人参果修炼时间<color=yellow>"..nHour_da.."小时<color>，修为<color=yellow>"..GetPopur().."点<color>，要快速修炼秘籍28级需要小人参果<color=red>10小时<color>，大人参果<color=red>4小时<color>，修为<color=red>4000点<color>，你好像有所欠缺，稍后再来吧。");
		return 0
	end
	if GetCash() < 500000 then
		Talk(1,"main","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你没有带上足够的金钱!");
		return 0;
	end
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你需要先把秘籍佩戴在身上，不然怎么修炼？!!!");
		return 0		
	end
	SetTask(2506, GetTask(2506) - confirm_time_xiao)
	SetTask(2505, GetTask(2505) - confirm_time_da)
	ModifyPopur(- confirm_xiuwei)
	Pay(500000)
	for i=1,27 do LevelUpBook() end	
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：此次修炼圆满成功，成功把秘籍修炼到28级，要再接再厉啊！")		
	Msg2Player("秘籍成功修炼到28级")
	gf_WriteLogEx("秒修秘籍", "成功修炼", 1, "秘籍修炼到28")	
end

function practice_confirm_da(faction_seq)
	local nTimeMinus = 60 * 18 * 60
	local confirm_time_da = 6 * nTimeMinus
	local confirm_time_qiannian = 4 * nTimeMinus
	local confirm_xiuwei = 6000
	local TASK_QIANNIAN_ID = 2039
	local nLeftTime_qiannian = GetTask(TASK_QIANNIAN_ID)
	nLeftTime_qiannian = floor(nLeftTime_qiannian / 18 / 60)
	local nHour_qiannian = floor(nLeftTime_qiannian / 60)
	local TASK_DA_ID = 2505
	local nLeftTime_da = GetTask(TASK_DA_ID)
	nLeftTime_da = floor(nLeftTime_da / 18 / 60)
	local nHour_da = floor(nLeftTime_da / 60)
	if nHour_da < 6 or nHour_qiannian < 4  or GetPopur() < 6000 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：您当前的大人参果修炼时间<color=yellow>"..nHour_da.."小时<color>，千年人参果修炼时间<color=yellow>"..nHour_qiannian.."小时<color>，修为<color=yellow>"..GetPopur().."点<color>，要快速修炼秘籍53级需要大人参果<color=red>6小时<color>，千年人参果<color=red>4小时<color>，修为<color=red>6000点<color>，你好像有所欠缺，稍后再来吧。");
		return 0
	end
	if GetCash() < 1000000 then
		Talk(1,"main","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你没有带上足够的金钱!");
		return 0;
	end
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你需要先把秘籍佩戴在身上，不然怎么修炼？!!!");
		return 0		
	end
	SetTask(2505, GetTask(2505) - confirm_time_da)
	SetTask(2039, GetTask(2039) - confirm_time_qiannian)
	ModifyPopur(- confirm_xiuwei)
	Pay(1000000)
	for i=1,52 do LevelUpBook() end	
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：此次修炼圆满成功，成功把秘籍修炼到53级，要再接再厉啊！")		
	Msg2Player("秘籍成功修炼到53级")
	gf_WriteLogEx("秒修秘籍", "成功修炼", 1, "秘籍修炼到53")	
end

function practice_confirm_qiannian(faction_seq)
	local nTimeMinus = 60 * 18 * 60
	local confirm_time_qiannian = 8 * nTimeMinus
	local confirm_xiuwei = 7000
	local TASK_QIANNIAN_ID = 2039
	local nLeftTime_qiannian = GetTask(TASK_QIANNIAN_ID)
	nLeftTime_qiannian = floor(nLeftTime_qiannian / 18 / 60)
	local nHour_qiannian = floor(nLeftTime_qiannian / 60)
	if nHour_qiannian < 8  or GetPopur() < 7000 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你当前的千年人参果修炼时间<color=yellow>"..nHour_qiannian.."小时<color>，修为<color=yellow>"..GetPopur().."点<color>，要快速修炼秘籍99级需要千年人参果<color=red>8小时<color>，修为<color=red>8000点<color>，你好像有所欠缺，稍后再来吧。");
		return 0
	end
	if GetItemCount(2,95,585) < 2 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你好像携带的大修真要诀不够，稍后再来吧。");
		return 0	
	end	
	if GetCash() < 1500000 then
		Talk(1,"main","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你没有带上足够的金钱!");
		return 0;
	end
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你需要先把秘籍佩戴在身上，不然怎么修炼？!!!");
		return 0		
	end
	SetTask(2039, GetTask(2039) - confirm_time_qiannian)
	ModifyPopur(- confirm_xiuwei)
	Pay(1500000)
	DelItem(2,95,585,2)
	for i=1,100 do LevelUpBook() end	
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：此次修炼功力大成，成功把秘籍修炼圆满之99级！")		
	Msg2Player("秘籍成功修炼到99级")
	gf_WriteLogEx("秒修秘籍", "成功修炼", 1, "秘籍修炼到99")	
end


function practice_confirm_free(faction_seq)
	local nBookIdx = GetPlayerEquipIndex(11)
	local nId1,nId2,nId3 = GetPlayerEquipInfo(11); --获取装备id
	local nFree, nAttributes = api_book_table(nId1, nId2, nId3)
	if nBookIdx == 0 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你需要先把秘籍佩戴在身上，不然怎么修炼？!!!");
		return 0		
	end
	if nFree ~= 1 then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你佩戴秘籍不是初级秘籍，不能免费修炼！");
		return 0	
	end
	for i=1,100 do LevelUpBook() end
--	if nBookIdx > 0 then
--		if nAttributes == 1 then
--			SetBookInfo(nBookIdx,10,3,80,80,50,50)
--		elseif nAttributes == 0 then
--			SetBookInfo(nBookIdx,10,3,50,50,80,80)
--		end
--	end
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：此次修炼功力大成，成功把秘籍修炼圆满之99级！")		
	Msg2Player("秘籍成功修炼到99级")
	gf_WriteLogEx("秒修秘籍", "成功修炼", 1, "秘籍修炼到99")	
end

function _practice_main(faction_seq)
	if GetPlayerFaction() == 0 then return 0; end
	if GetPlayerFaction() ~= faction_seq then
		Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：这是"..TB_FACTION_INFO[faction_seq].."的闭关修练之地，大侠还是去自己的门派吧。");
	else
		if GetItemCount(%cards_table[faction_seq][1], %cards_table[faction_seq][2], %cards_table[faction_seq][3]) >= 1 then  --师门令牌
			Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：您确定要闭关修练吗？",
				2,
				"开始修练/practice_start",
				"稍后再来/end_dialog");
		else
			Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>：你没有<color=yellow>"..TB_FACTION_INFO[faction_seq].."师门令牌<color>，不能进行训练。");
		end;
	end;
end
--=============师门售卖=================
function sale_main(faction_seq)
	if GetPlayerFaction() == faction_seq  then
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>：这位<color=yellow>"..GT_SexName(1).."<color>，有什么可以帮你的？?",
		4,
		"我想买些普通的用品。/#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"我听说师门有一套适合江湖新手的神兵宝甲？我想看看。/#Sale("..TB_FACTION_SALE[faction_seq][2]..")",
		"我听说师门有一套适合武林老手的神兵宝甲？我想看看。/#Sale("..TB_FACTION_SALE[faction_seq][3]..")",
--		"我听说师门有一些神秘令牌？我想看看。/#Sale("..TB_FACTION_SALE[faction_seq][4]..")",
		"我只是随便看看/end_dialog"
		)
	else
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>：这是"..TB_FACTION_INFO[faction_seq].."的师门商店，其他门派弟子可以买些普通的用品哦！",
		2,
		"我想买些普通的用品。/#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"我只是随便看看/end_dialog"
		)
	end
end

--==============师门传送==================
function transport_main(faction_seq)
	Say(TB_TRANSPORT_INFO[faction_seq][1],
		2,
		"请送我一程吧/#trans_2_city("..faction_seq..")",
		"我要看看风景/end_dialog"
	)
end

--传送走
function trans_2_city(faction_seq)
	if(GetPKValue() >3 ) then
		Msg2Player("大侠的PK值有点高，还是呆在城里安全一些。")
	end
	SetFightState(0)
	local n_ran_att = random(getn(TB_TRANSPORT_INFO[faction_seq][2]))
	NewWorld(TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][1],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][2],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][3])
end

function showlimit(n)	--师门说话
--	if n==1 then
--		Say(NPC_NAME.."你的武功精进了！",0)
	if n==2 then
		Say(NPC_NAME.."你的等级不够学习新的武功，要不先去升了级再来？",0)
	elseif n==3 then
		Say(NPC_NAME.."大侠的经验值不够，请继续努力！",0)
	elseif n==4 then
		Say(NPC_NAME.."大侠的声望不够，继续努力！",0)
	elseif n==5 then
		Say(NPC_NAME.."需要先学习上一个技能才能学习本技能哦！",0)
	elseif n==6 then
		Say(NPC_NAME.."大侠的铜钱好像不够，检查一下哦！",0)
	else
	end
end;
function beforelearnskill(id)
end

function afterlearnskill(id)
	if id == 732 or id == 745 or id == 146 or id == 159 or id == 774 or id == 775 or id == 74 or id == 1883 or id == 44 or id == 57 or id == 32 or id == 113 or id == 124 or id == 89 or id == 102 or id == 1032 or id == 1897 or id == 1196 or id == 1066 or id == 1230 or id == 1213 or id == 1096 or id == 1883 or id == 1897 then
		if GetSkillLevel(id) == 1 then
			SetMomentum(10)
			RandomTaskTipEx("你获得10点杀气值，可以使用镇派武功了。", "momentumtip")
		end
	end
end

function give_yangdiao_book()
	if BigGetItemCount(2,100,33) >= 1 then
		Talk(1,"","<color=green>胡曼成<color>：你已经有了一本了，是不是放箱子里了？");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>胡曼成<color>：你的背包空间不够，请整理一下。");
		return 0;
	end
	AddItem(2,100,33,1)
end

function give_yangdiao_feed()
	local szSay = {};
	szSay[getn(szSay) + 1] = "我要领取一只小貂/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "我要领取小貂食物/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "我要升级小貂/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "随便看看/nothing";
	Say("<color=green>胡曼成<color>：你需要什么？", getn(szSay), szSay)
end


function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, 24, 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Talk(1,"","<color=green>胡曼成<color>：你好像还没有领养小貂。");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil) or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","<color=green>胡曼成<color>：你好像还没有小貂。");
		return
	end
	for i = 1, 99 do
		LevelUpPet(nPetItemIndex)
	end
	Msg2Player("你成功升级了你的小貂");
end

function give_gujing_book()
	if BigGetItemCount(2,0,385) >= 1 then
		Talk(1,"","<color=green>柳新竹<color>：你已经有了一本了，是不是放箱子里了？");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>柳新竹<color>：你的背包空间不够，请整理一下。");
		return 0;
	end
	AddItem(2,0,385,1)
end

tGuNum = {
	{"太虚八卦盘-坎",2,1,471,99},
	{"蛊", 2, 17, 1},
	{"毒蛊", 2, 17, 2},
	{"猛毒蛊", 2, 17, 3},
	{"毒妖蛊", 2, 17, 4},
	{"血蛊", 2, 17, 5},
	{"嗜血蛊", 2, 17, 6},
	{"血精蛊", 2, 17, 7},
	{"香蛊", 2, 17, 8},
	{"迷香蛊", 2, 17, 9},
	{"醍醐蛊", 2, 17, 10},
	{"尸蛊", 2, 17, 11},
	{"三尸蛊", 2, 17, 12},
	{"鬼王蛊", 2, 17, 13},
	{"妖蛊", 2, 17, 14},
	{"食妖蛊", 2, 17, 15},
	{"妖皇蛊", 2, 17, 16},
	{"心蛊", 2, 17, 17},
	{"蚀心蛊", 2, 17, 18},
	{"心煞蛊", 2, 17, 19},
	{"幻蛊", 2, 17, 20},
	{"冰幻蛊", 2, 17, 21},
	{"忘仙蛊", 2, 17, 22},
	{"蠶蛊", 2, 17, 23},
	{"血蠶蛊", 2, 17, 24},
	{"金蠶蛊", 2, 17, 25},
	{"灵蛊", 2, 17, 26},
	{"玲珑蛊", 2, 17, 27},
	{"七彩小仙蛊", 2, 17, 28},
	{"魔蛊", 2, 17, 29},
	{"幽影蛊", 2, 17, 30},
	{"无影魔蛊", 2, 17, 31},
}

function give_gu()
	local selTab = {};
	local szTitle = format("<color=green>柳新竹<color>：选择八卦盘相关道具")
	for i = 1, getn(tGuNum) do
		local nIndex = tGuNum[i]
		tinsert(selTab, format("我要领取999个%s/#do_give_gu(%d)", nIndex[1], i));
	end
	tinsert(selTab,"结束对话/end_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function do_give_gu(nIndex)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_AddItemEx({tGuNum[nIndex][2], tGuNum[nIndex][3], tGuNum[nIndex][4], 999})
end

function give_shenmuwangding()
	if BigGetItemCount(2,0,1063) >= 1 then
		Talk(1,"","<color=green>柳新竹<color>：你已经有神木王鼎了，是不是放箱子里了？");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>柳新竹<color>：你的背包空间不够，请整理一下。");
		return 0;
	end
	AddItem(2,0,1063,1)
end

function api_book_table(nGenre, nDetail, nParticular)
	local nFree = 0;
	local nAttributes = 0;
	for i=1, getn(tFactionBook45) do
		local nIndex = tFactionBook45[i]
		local G = nIndex[2]
		local D = nIndex[3]
		local P = nIndex[4]
		if G == nGenre and D == nDetail and P == nParticular then
			nFree = nIndex[5]
			nAttributes = nIndex[6]
		end
	end
	return nFree, nAttributes;
end

--对话结束
function end_dialog()

end