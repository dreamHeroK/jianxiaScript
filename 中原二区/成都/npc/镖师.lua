
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 镖师脚本
-- Edited by joker
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")
Include("\\script\\lib\\writelog.lua")
strLogCaption = "帮会收集任务"
File_name = "\\script\\中原二区\\成都\\npc\\镖师.lua"
Tasktemp_task_return = 199
CONFTASKBOSSCREATE_RATE = 20

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	else
		if GetTask(956) == 0 then
			Zgc_conf_task_main_dialog()
		else							--非第一次对话
			Zgc_conf_task_dialog_2()
		end
	end
	
end
---------------------------------------------公共变量定义区-----------------------------------------
Zgc_conf_task_goos_num = {						--任务收集等级为9级
	{8000,4},{16000,10},{24000,16},{32000,18},{40000,20},{48000,22},{56000,24},{64000,26},{72000,28}
}
Zgc_conf_task_boss_jies = {
	"十年前江湖上出现的武林新秀步非烟人称翠烟仙子，武功高强，身法飘逸。在 刺杀辽国征南将军失败后便消声匿迹，查无音讯,但是传言最近昙花一现的步非烟又重出江湖，却已像是变了一个人一样，为天下所不为，似乎已经做了辽人瓜牙，其中必有暖晓.\n 太后七十大寿在即，各州，都的生辰纲都已陆续发往京城。显然步非烟是不会放过这次机会.各地漂师为了防患于未然准备先引诱出步非烟并将其抓获，不给步非烟任何可乘之机. ",
	"十年前纵横漠北的刀客，后投靠辽国，做了辽国将领.",
	"小人只知此人乃辽国猛将，但其身世却是一无所知啊.",
	"用唐传奇中的名篇做自己的名字，却又委身于步非烟手下其中原委实是难以琢磨.",
	"用唐传奇中的名篇做自己的名字，却又委身于步非烟手下其中原委实是难以琢磨.",
	"用唐传奇中的名篇做自己的名字，却又委身于步非烟手下其中原委实是难以琢磨.",
	"用唐传奇中的名篇做自己的名字，却又委身于步非烟手下其中原委实是难以琢磨.",
	
}
Zgc_conf_task_coll_goods = {					
--收集品ID，收集品名称，收集品分数比例，收集品选中标志，收集品选中数量
	{"兔尾",2,10000000},
	{"土狼牙",3,0.2},
	{"兔儿果",4,0.2},
	{"狼毛",5,0.2},
	{"虫卵",6,0.2},
	{"野猪牙",7,0.2},
	{"上等狼毛",8,1},
	{"问路石",9,0.2},
	{"铁扳指",10,0.2},
	{"绣花鞋",11,0.2},
	{"烧酒",12,0.2},
	{"蜂巢",13,0.2},
	{"上等野猪牙",14,1},
	{"行缎",15,0.2},
	{"猴儿果",16,0.2},
	{"青金",17,0.2},
	{"蝙蝠翅膀",18,0.2},
	{"虎尾",19,0.2},
	{"铁枪头",20,0.2},
	{"刀鞘",21,0.2},
	{"雪精",22,0.2},
	{"腿骨",23,0.2},
	{"搜神记",24,0.2},
	{"甲木牌",25,0.2},
	{"暗烟",26,0.2},
	{"阴魄",27,0.2},
	{"鸟蛋",28,0.2},
	{"宝瓶",29,0.2},
	{"铜剑",30,0.2},
	{"木手",31,0.2},
	{"红睛",32,0.2},
	{"乙木牌",33,0.2},
	{"官服",34,0.2},
	{"烧饼",35,0.2},
	{"家法棒",36,0.2},
	{"狼魂",37,0.2},
	{"商货",38,0.2},
	{"夜明珠",39,0.2},
	{"半截枪身",40,0.3},
	{"金钗",41,0.3},
	{"铜块",42,0.3},
	{"草鞋",43,0.3},
	{"酒杯",44,0.3},
	{"雪魄",45,0.3},
	{"丙木牌",46,0.3},
	{"铁叉",47,0.3},
	{"黄虎尾",48,1},
	{"神魔志",49,0.3},
	{"手骨",50,0.3},
	{"幽魂",51,0.3},
	{"鸩酒",52,0.3},
	{"夷则钟",53,0.3},
	{"绣缎",54,0.3},
	{"茶壶",55,0.3},
	{"公文",56,0.3},
	{"梳妆匣",57,0.3},
	{"吸血蝠翅",58,0.3},
	{"丁木牌",59,0.3},
	{"羊皮酒袋",60,0.3},
	{"铁链",61,0.3},
	{"绿魄",62,0.3},
	{"钩爪",63,0.3},
	{"戊木牌",64,0.3},
	{"牛皮酒袋",65,0.3},
	{"己木牌",66,0.3},
	{"大宋地理志",67,0.3},
	{"针炙铜人",68,0.3},
	{"黄金扳指",69,0.3},
	{"庚木牌",70,0.3},
	{"铁八卦",71,0.3},
	{"印石",72,0.3},
	{"钉耙",73,0.3},
	{"鹿皮手套",74,0.3},
	{"目雷纹刀",75,0.5},
	{"牡丹",76,0.5},
	{"辛木牌",77,0.5},
	{"熊纹",78,0.5},
	{"金秤砣",79,0.5},
	{"剑魂",80,0.5},
	{"白云杯",81,0.5},
	{"八卦葵花镜",82,0.5},
	{"壬木牌",83,0.5},
	{"琥珀",84,0.5},
	{"葵木牌",85,0.5},
	{"金刚",86,0.5},
	{"玉如意",87,0.5},
	{"玉壶",88,0.5},
	{"犀牛筋弦",89,0.6},
	{"护佛扳指",90,0.6},
	{"绿柱",91,0.7},
	{"鬼魂",92,1},
	{"白玉环",93,0.6},
	{"邪佛扳指",94,0.5},
	{"雪花戒箍",95,1},
	{"指南鱼",96,0.8},
	{"伤寒论",97,1},
	{"溪山行旅图摹本",98,1},
	{"幻光",99,1},
	{"东陵",100,1},
	{"天王面具",101,1},
	{"人屠斧",102,1},
	{"瘟疫瓶",103,1},
	{"虎符",104,1},
	{"武经总要",105,1},
	{"麒麟鳞片",106,1},
	{"黄帝内经",107,1},
	{"破损的玉器商货",154,0.3},
	{"狐皮毛",155,0.3},
	{"白雕之蛋",156,0.3},
	{"普通的弓",157,0.3},
	{"天阴教地图碎片",158,0.3},
	{"天阴密信",159,0.3},
	{"怪异的石头",160,0.3},
	{"鳄尾骨",161,0.3},
	{"毒蟾蜍之涎",162,0.3},
	{"蝎针",163,0.3},
	{"异族挂链",164,0.5},
	{"异族皮靴",165,0.5},
	{"苍猿皮毛",166,0.5},
	{"银狐丹",167,0.5},
	{"损坏的银枪",168,0.5},
	{"蚩火棍",169,0.5},
	{"白鱼鳞",170,0.5},
	{"红鱼鳞",171,0.5},
	{"破损的夜刃",172,1},
	{"武士刀",173,1},
	{"武士腰带",174,1},
	{"武士面罩",175,1},
	{"毒蜂刺",176,1},
	{"甲壳碎片",177,1},
	{"火影神刀",178,1},
	{"鬼头杖",179,1},
	{"鳄鱼眼球",180,1},
	{"神秘之斧",181,1},
	{"神秘之剑",182,1},
	{"灵箫",183,1},
	{"灵果",184,1},
	{"灵伞",185,1},
	{"灵琴",186,1},
	{"灵笛",187,1},
	{"毒蜂液",271,0.2},
	{"甲虫壳",272,0.2},
	{"蜈蚣触角",273,0.2},
	{"蚊翅",274,0.2},
	{"蜘蛛毒液",275,0.2},
	{"食人草芽",276,0.2},
	{"蜥蜴尾巴",277,0.3},
	{"破碎铜钥匙",278,0.3},
	{"破碎铁钥匙",279,0.3},
	{"破碎银钥匙",280,0.3},
	{"红缨",281,0.3},
	{"蚩火密信",282,0.5},
	{"护法令牌",284,0.5},
	{"血鸦羽",285,1},
	{"血包裹",286,0.5},
	{"牦牛皮革",287,0.4},
	{"长刀",288,0.5},
	{"小手帕",289,0.5},
	{"古字画",290,0.5},
	{"羽绒",291,0.6},
	{"虎皮毛",292,0.6},
	{"碎骨",293,0.8},
	{"阴阳镜",294,1},
	{"大钢刀",295,1},
	{"猩猩牙齿",296,1},
	{"大象皮毛",297,1},
	{"湿火药",298,1},
	{"残剑",299,1},
	{"红木",300,1},
	{"残枪",301,1},
	{"符印",302,1},
	{"布手套",303,1},
	{"佛经",304,1},
	{"陀罗杖",305,1},
	{"胭脂盒",306,1},
	{"血鳞",307,1},
	{"腐骨",308,1},
	{"小毒囊",309,1},
	{"花斑蝴蝶",310,1},
	{"明火符",311,1},
	{"大铁耙",312,1},
	{"蚩火印",313,1},
	{"白磷",314,1},
	{"干粮",315,1},
	{"碎石",316,1},
	{"粗布长袍",317,1},
	{"火酒",318,1},
	{"迦楼罗之羽",319,1},
	{"蚩火长印",320,1},
	{"蚩火圣印",321,1},
	{"阿修罗之羽",322,1},
	{"摩呼罗迦颅骨",323,5},
	{"段承恩的手书",324,5},
	{"一阳指残章一",325,5},
	{"碧玉戒指",326,5},
	{"钢绳",327,1},
	{"一串念珠",328,1},
	{"紧那罗的颅骨",329,5},
	{"大修圆镜",330,1},
	{"一阳指残章二",331,5},
	{"死骨",1089,1},
	{"面纱",1400,1},
	{"西凤酒",1401,1},
	{"方锁",1402,1},
	{"唐三彩",1403,1},
	{"火狐毛皮",1404,1},
	{"银针",1405,1},
	{"迷烟",1406,1},
	{"青龙纹镜",1407,1},
	{"白虎纹镜",1408,1},
	{"干粮",1409,1},
	{"麻沸散",1410,1},
	{"日晷",1411,1},
	{"烈女歌",1412,1},
	{"烟枪",1413,1},
	{"酒葫芦",1414,1},
	{"五石散",1415,1},
	{"螭龙鳞片",1416,1},
	{"骰子",1417,1},
	{"蜡烛",1418,1},
	{"玄武纹镜",1419,1},
	{"朱雀纹镜",1420,1},
	{"勇士令牌",1421,1},
	{"千年树根",1422,1},
	{"墨砚",1423,1},
	{"白骨扇",1177,1},
	{"骷髅头",1178,1},
}
Zgc_conf_task_goods_need = {50,90,140,200,400}
-------------------------------------------------功能函数区----------------------------------------------
--***********************帮会任务NPC对话主函数***********************
function Zgc_conf_task_main_dialog()				
	Say("<color=green>镖师<color>：十年前江湖上出现的武林新秀步非烟人称翠烟仙子，武功高强，身法飘逸。在刺杀辽国征南 将军失败后便消声匿迹，杏无音讯。但是传言最近昙花现的步非烟又重出江湖，却已像是变了一 个人一样，为天下所不为，似乎已经做了辽人瓜牙，其中必有蹊跷。若是贵帮能探出个原由来那是 为武林，社稷做了极大的贡南献啊.",
		2,
		"可是我从未听说过此人,如何查起啊?/Zgc_conf_task_dialog_1",
		"我对此人没有兴趣,还是算了吧!/Zgc_end_dialog"
	)
	if GetTask(956) == 0 then
		SetTask(956,1)
	end
end
--*************************
function Zgc_conf_task_dialog_1()
	Say("<color=green>镖师<color>：据可靠消息，太后七十大寿在即，各州，郡的生辰纲都已陆续发往京城。显然步非烟是不会 放过这次机会。我需要各种收集品来置办假生辰纲引诱步非烟和她的瓜牙现身。现在你们赶紧去张罗吧?",
		1,	
		"好的，我知道了/Zgc_end_dialog"
	)
end
--***************************非第一次对话函数************************
function Zgc_conf_task_dialog_2()
	Say("<color=green>镖师<color>：步履轻品手甚纤，飞仙得见也汗颜。烟围雾统身不现，花落凝血是非烟。这是十年前步非烟 的真实写照，若不尽快将其铲除，武林恐怕又有一场血雨腥风啊!",
		7,
		"我想了解此任务/Zgc_conf_task_content",
		"我想了解步非烟等人/Zgc_conf_task_boss_con",
		"我想看看我们帮的进度/Zgc_conf_task_step_inq",
		"我想上交我收集的物品/Zgc_conf_taskgoods_turnin",
		--"我想了解其他帮派的动静/Zgc_conf_task_fini_list",
		"我的帮会想要接受这个任务(帮主、副帮主、长老可接受)/Zgc_conf_task_get",
		"我的帮会想要领取任务奖励(帮主可领取)/Zgc_conf_task_pay",
		"\n我另有它事/Zgc_end_dialog"
	)
end
--***************************任务介绍********************************
function Zgc_conf_task_content()
	Talk(2, "", 
		"<color=green>镖师<color>：该任务每周为一轮，由帮主，副帮主或长老来成都镖师处领取帮会任务,(<color=red>可以接爱的 任务分为5个级别，越高级别的保务可以蒙得的生辰纲越多，当然需要的收集品也更多。你只有在成了下级别的住务后才能无启更高级别的住务)<color>，领取后帮众可以到成都镖师处上缴任务需要的收集品.",
		"<color=green>镖师<color>：<color=red>每位等级为50级以上帮众限上交400分每轮(一周50级以下帮众上缴物品分值上限递增)<color>.待任务完成后由各帮主来领取生辰纲到指定地点可以引诱出步非烟或瓜牙，将 其消灭。如果在这轮任务时间（一周）内你所在的帮会无法上缴足够的收集品，任务将自然 终止并只能接受下一轮的任务."
	)
end
--***************************人物介绍*********************************
function Zgc_conf_task_boss_con()
	Say("<color=green>镖师<color>：所谓知己知彼，百战不殆。但步非烟一伙却似乎突然冒出来一样，对他们的情况我部二个大报概,希望对供士有所帮助.",
		8,
		"我要了解:步非烟/#Zgc_conf_task_boss(1)",
		"我要了解:沙漠狂刀贺景胜/#Zgc_conf_task_boss(2)",
		"我要了解:以头车军基大锤/#Zgc_conf_task_boss(3)",
		"我要了解:昆仑奴/#Zgc_conf_task_boss(4)",
		"我要了解:悲航/#Zgc_conf_task_boss(5)",
		"我要了解:柳颜/#Zgc_conf_task_boss(6)",
		"我要了解:红线 好的/#Zgc_conf_task_boss(7)",
		"\n我知道了/Zgc_end_dialog"
	)	
end
function Zgc_conf_task_boss(boss_seq)
	Say("<color=green>镖师<color>:"..Zgc_conf_task_boss_jies[boss_seq],
		3,
		"进行其它操作/Zgc_conf_task_dialog_2",
		"查看其它首领信息/Zgc_conf_task_boss_con",
		"好的,我知道了/Zgc_end_dialog"
	)
end
--****************************排行榜**********************************
function Zgc_conf_task_fini_list()
	
end
--***************************帮会任务进度查询*************************
function Zgc_conf_task_step_inq()
	if IsTongMember() == 0 then
		Say("<color=green>镖师<color>：你好像连帮都没有入吧?",
			1,
			"结束对话/Zgc_end_dialog"
		)
		return
	end
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackStepInq")
end
--**************************帮会任务进度查询回调**********************
function CallBackStepInq(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
	if tong_level_max == nil or tong_level_max <= 0 then
		ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
		return
	end
	--结束--
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	local dialog_date_now = ""					--本轮任务结束时间
	local dialog_date_next =""					--下轮任务开始时间
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date_now =  "今晚24点"
		dialog_date_next = "明晚24点"
	else
		dialog_date_now = "明晚24点 "
		dialog_date_next = "今晚24点"
	end
	if tong_state == 1 then
		Say("<color=green>镖师<color>：尚未收到此任务，已经到达<color=yellow>"..dialog_date_now.."<color>结束.",
			1,
			"结束对话/Zgc_end_dialog"
		)		
	elseif tong_state == 2 then
		Say("<color=green>镖师<color>：您接受任务，物品的收集和交付的状态是:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..",这个任务"..dialog_date_now.."结束",
			1,
			"结束对话/Zgc_end_dialog"
		)
	elseif tong_state == 3 then
		Say("<color=green>镖师<color>：这次您的任务已经完成，可以来领取奖励.",
			2,
			"我的帮会想要领取任务奖励/Zgc_conf_task_pay",
			"结束对话/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("<color=green>镖师<color>：任务已完成，并且也收到了奖励。 请执行下一个任务，下一个任务<color=yellow>"..dialog_date_now.."<color>开始.",
			1,
			"好的,知道了/Zgc_end_dialog"
		)
	end
end
--*************************帮会任务接受函数***************************
function Zgc_conf_task_get()
	if IsTongMember() == 0 then 																--判断是否入帮
		Say("<color=green>镖师<color>：你未入加帮会,待你加入了再来找我吧!",
			1,
			"我这就去加入帮会，稍后再来找你/Zgc_end_dialog"
		)
	elseif IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() ==3 then				--判断帮会职务
		ApplyRelayShareData(GetTongName(),0,0,File_name,"ConfTaskGetCallBack")
	else
		Say("<color=green>镖师<color>: 这很重要!只有帮主,副帮主或长老才能来接取此任务.",
			1,
			"我晚点再回来!/Zgc_end_dialog"
		)		
	end
end
--*****************************任务接受数据存储回调************************
function ConfTaskGetCallBack(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--结束--
	local tong_ID_save = Zgc_conf_task_time_return()
	if tong_ID == tong_ID_save then
		Say("<color=green>镖师<color>:我已经收到了一部分，请查看进度.",
			2,
			"我想看看我们帮的进度/Zgc_conf_task_step_inq",
			"结束对话/Zgc_end_dialog"
		)
	elseif tong_ID ~= tong_ID_save and tong_state == 3 then
		Say("<color=green>镖师<color>:您的任务已经完成,但尚未领取奖励,请及时领取!",
			2,
			"我的帮会想要领取任务奖励/Zgc_conf_task_pay",
			"结束对话/Zgc_end_dialog"
		)
	else
		if tong_state == 2 and tong_num < Zgc_conf_task_goos_num[tong_level][1] then
			if tong_level_max > 1 then
				tong_level_max = tong_level_max - 1
				SendTongMessage("由于未完成先前任务，因此任务等级将减少1级.")
			end
		end
		if tong_level_max == nil or tong_level_max <= 0 then
			tong_level_max = 1
		end
		local dialog = {}
		for i = 1, tong_level_max do
			dialog[i] = ""..i.."级任务,需要"..Zgc_conf_task_goos_num[i][1].." 收集物品,可兑换"..Zgc_conf_task_goos_num[i][2].."生辰纲/#Zgc_conf_task_accept("..i..","..tong_level_max..")"
		end
			dialog[tong_level_max + 1] = "结束对话/Zgc_end_dialog"
		Say("<color=green>镖师<color>:请选择您要接收的任务的等级:",
			getn(dialog),dialog
		)		
	end
end
--******************************任务接受****************************
function Zgc_conf_task_accept(task_level,level_max)
	local tong_ID = Zgc_conf_task_time_return()
	local tong_level = task_level
	local tong_num = 0											--新接任务，交纳收集品为0
	local tong_state = 2
	local tong_level_max = level_max
	if tong_level_max > getn(Zgc_conf_task_goos_num) then
		tong_level_max = getn(Zgc_conf_task_goos_num)
	end	
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Msg2Player("你的帮会接受了"..task_level.."级任务!")
	SendTongMessage(GetName().."接受"..task_level.." (级)任务,帮里的成员可以到成都镖师那里上交收集。")
	WriteLogEx(strLogCaption, "接受帮会的任务", "", "", "", GetTongName())
end
--*************************帮会任务物品收集函数***********************
function Zgc_conf_taskgoods_turnin()
	local cent_num_save = Zgc_conf_task_cent_date(0,956)
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	if GetLevel() < 65 then
		Say("你的等级不足65级,不能上交物品?",
			1,
			"结束对话/Zgc_end_dialog"
		)
	return
	end
	if IsTongMember() == 0 then
		Say("<color=green>镖师<color>：步非烟此人可非一般人物,少使连帮会都没有入当不是太小看此人了?还是去入了帮会再找据全来与我商谈加何机捕先非烟吧!",
			1,
			"好的,我知道了/Zgc_end_dialog"
		)
		return
	elseif task_id_save == Zgc_conf_task_time_return() and (Zgc_conf_task_num_max() - cent_num_save)<=0 then
			local dialog = ""
			if Zgc_conf_task_dist_date() == 1 then
				dialog = "明天"
			else
				dialog = "后天"
			end
			Say("<color=green>镖师<color>：您的贡献点是："..Zgc_conf_task_num_max()..","..dialog.."再试一次!",
				1,
				"结束对话/Zgc_end_dialog"
			)
			return
	else
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGoodsin")
	end
end
function CallBackGoodsin(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--结束--
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	if tong_state == 2 then																--该帮派已经领取任务，但是收集物品数量不足
		local cent_remain = 0
		if task_id_save ~= Zgc_conf_task_time_return() then								--先判断个人的收集品缴纳情况
			cent_remain = Zgc_conf_task_num_max()
		else
			cent_remain = Zgc_conf_task_num_max() - goods_num_save
		end
		Say("贵帮任务进度,现在的贡献点是:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1].."当前上交的收集品。每人最多获得"..Zgc_conf_task_num_max().."积分,当前可获得积分:"..cent_remain..". \n <color=red>请确认你身上有没有上交的物品!<color>",
				2,
				"我要上交收集/Zgc_task_goods_inconf",
				"结束对话/Zgc_end_dialog"
			)
	elseif tong_state == 3 then
		Say("<color=green>镖师<color>：该任务已完成.帮主，副帮主，长老都可以领取奖励.",
			1,
			"结束对话/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("<color=green>镖师<color>：完成任务并获得奖励后,请等待下一个任务.",
			1,
			"结束对话/Zgc_end_dialog"
		)
	else
		Say("<color=green>镖师<color>：该帮会未接受这项任务.",
			1,
			"结束对话/Zgc_end_dialog"
		)			
	end
end
--*****************************物品收集确认***************************
function Zgc_task_goods_inconf()
	Say("<color=green>镖师<color>：您的背包没有重要的物品!",
		2,
		"上缴物品/Zgc_task_goods_change",
		"结束对话/Zgc_end_dialog"
	)
end
--*****************************收集处理函数***************************
function Zgc_task_goods_change()															--收集品的计算和扣除
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 200 then
		Say("<color=green>镖师<color>：背包空间或负重不足，请重新整理.",0)
		return
	end
	local cent_count = 0
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	local cent_remain = 0
	if task_id_save ~= Zgc_conf_task_time_return() then								--先判断个人的收集品缴纳情况
		cent_remain = Zgc_conf_task_num_max()
	else
		cent_remain = Zgc_conf_task_num_max() - goods_num_save
	end
	for i = 1,getn(Zgc_conf_task_coll_goods) do
		if cent_remain > 0 then
			local goods_num = GetItemCount(2,1,Zgc_conf_task_coll_goods[i][2])						--物品数量
			local goods_cent = floor(goods_num * Zgc_conf_task_coll_goods[i][3])					--物品可兑换积分
			if  goods_num > 0 and goods_cent > 0 then										
				if goods_cent >= cent_remain then													--物品收集是否到达400上限
					local needs_num = floor(goods_num *cent_remain/goods_cent)
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],needs_num)		--删除收集品
					if remove_flag == 0 then														
						--break																		--删除失败退出
					else
						cent_count = cent_count + cent_remain
						local nRnd = random(1,100)
						if nRnd <= CONFTASKBOSSCREATE_RATE and IsTongMember() >= 1 and IsTongMember() <= 5 and GetLevel() >= 50 then
							local add_flag = AddItem(2,89,6,1)
							if add_flag ~= 0 then
								Msg2Player("您将获得1个生辰纲.")
								SendTongMessage(GetName().."接受任务的奖励：1个生辰纲")
								WriteLogEx(strLogCaption, "收到1个生辰纲", "", GetTongName())
							end
						end												
					end
					local dialog_date = ""
					if Zgc_conf_task_dist_date() ==  1 then
						dialog_date = "今日"
					else
						dialog_date = "明日"
					end
					Say("<color=green>镖师<color>：您完成了这一系列任务，交付了足够的物品，,"..dialog_date.."再试一次！!",
						1,
						"结束对话/Zgc_end_dialog"
					)
					break
				else
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],goods_num)		--删除收集品
					if remove_flag == 0 then
						break
					else
						cent_count = cent_count + goods_cent
						cent_remain = cent_remain - goods_cent										--将可提交的收集品积分减少
					end
				end
			end
		end
	end																								--删除玩家收集品结束
	if cent_count == 0 then
		Say("你连任务物品都没有,真浪费我的时间!",
			1,
			"结束对话/Zgc_end_dialog"
		)
	else
		Msg2Player("你的物品为帮会增加"..cent_count.."累积点!")
		SetTaskTemp(157,cent_count)																	--本次上交的信息放入临时变量
		local goods_cent_total = 0
		if Zgc_conf_task_cent_date(1,956) == Zgc_conf_task_time_return() then						--本轮已经提交过的处理
			goods_cent_total = Zgc_conf_task_cent_date(0,956) + cent_count
			goods_cent_total = (goods_cent_total * 10000) + Zgc_conf_task_time_return()
		else																						--将近三轮的信息依次压入
			SetTask(958,GetTask(957))
			SetTask(957,GetTask(956))
			goods_cent_total = (cent_count * 10000) + Zgc_conf_task_time_return()
		end
		SetTask(956,goods_cent_total)
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackConfDeal")
	end
end
--*************************玩家提交收集品的帮会处理********************
function CallBackConfDeal(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local player_goods_num = GetTaskTemp(157)
	local dialog_date = ""
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date = "今日24点"
	else
		dialog_date = "明日24点"
	end
	local need_num = ""
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) then
		need_num ="完成了."
	else
		need_num = "缺少"..(Zgc_conf_task_goos_num[tong_level][1] - tong_num - player_goods_num).."点积分"	
	end
	local money_prize = task_money_prize(player_goods_num)
	if money_prize ~= 0 then				---金钱增加
		Earn(money_prize)
		WriteLogEx(strLogCaption, "收到", money_prize, "金", "", GetTongName())
	end
	SendTongMessage(GetName().."完成“帮会”任务"..player_goods_num.."积分!")
	SendTongMessage("此任务:"..dialog_date.."结束啦,现在的帮"..need_num)
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) and tong_state == 2 then
		SendTongMessage("贵帮完成了对步非烟的诱惑任务,帮主可以去镖师领取奖励!")
		if tong_level_max < getn(Zgc_conf_task_goos_num) then
			tong_level_max = tong_level_max + 1
			SendTongMessage("贵帮已经完成了“步非烟”的任务。"..tong_level_max.."!!")
		end
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],3,tong_level_max)
	else
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	end
	SetTaskTemp(157,0)
	SaveNow()
end
--**************************帮会任务数据转移************************
function CallBackDataRepair(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,GetTongName())
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if tong_level_max == nil or tong_level_max <= 0 then
		tong_ID = 0
		tong_level = 0
		tong_num = 0
		tong_state = 0
		tong_level_max = 6
	end
	if tong_level_max >= 3 then
		WriteLog("恢复成功帮会任务的数量，角色名称:["..GetName().."],帮会名称: ["..GetTongName().."]")
	end
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Say("<color=green>镖师<color>：步履轻品手甚纤，飞仙得见也汗颜。烟围雾统身不现，花落凝血是非烟。这是十年前步非烟 的真实写照，若不尽快将其铲除，武林恐怕又有一场血雨腥风啊!",
		7,
		"我想了解此任务/Zgc_conf_task_content",
		"我想了解步非烟等人/Zgc_conf_task_boss_con",
		"我想看看我们帮的进度/Zgc_conf_task_step_inq",
		"我想上交我收集的物品/Zgc_conf_taskgoods_turnin",
		--"我想了解其他帮派的动静/Zgc_conf_task_fini_list",
		"我的帮会想要接受这个任务(帮主、副帮主、长老可接受)/Zgc_conf_task_get",
		"我的帮会想要领取任务奖励(帮主可领取)/Zgc_conf_task_pay",
		"\n结束对话/Zgc_end_dialog"
	)
end
--*****************************金钱计算***************************
function task_money_prize(cent)
	local money_prize = {2000,4000,7500,12000}
	local player_level = GetLevel()
	local money_num = 0
	if player_level <= 30 then
		money_num = floor(sqrt(player_level) * money_prize[1] * cent/400)
	elseif player_level <= 50 then
		money_num = floor(sqrt(player_level) * money_prize[2] * cent/400)
	elseif player_level <= 70 then
		money_num = floor(sqrt(player_level) * money_prize[3] * cent/400)
	else
		money_num = floor(sqrt(player_level) * money_prize[4] * cent/400)
	end
	return money_num
end
--*************************帮会奖励给予函数****************************
function Zgc_conf_task_pay()
	--0为从未领取任务，1为领取过任务，2领取了任务尚未完成，3为领取任务且已经完成但是没有领取奖励，4为完成且已经领取奖励。
	if IsTongMember() == 0 then
		Say("<color=green>镖师<color>：你需要先加和帮会.",
			1,
			"好的,我知道了/Zgc_end_dialog"
		)
		return
	elseif IsTongMember() ~= 1 then
		Say("<color=green>镖师<color>：您无权获得帮会奖励！!",
			1,
			"结束对话/Zgc_end_dialog")
	else
		SetTaskTemp(Tasktemp_task_return,Zgc_conf_task_time_return())
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackPrizeGet")
	end
end
--****************************帮会奖励给予调用函数*********************
function CallBackPrizeGet(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--结束--
	if tong_state == 2 then																--该帮派已经领取任务，但是收集物品数量不足
		if tong_ID == Zgc_conf_task_time_return() then
			Say("<color=green>镖师<color>：已领取任务但尚未完成,无法获得奖励,请检查完成进度.",
				2,
				"我想看看帮会的进度/Zgc_conf_task_step_inq",
				"好的,我知道了/Zgc_end_dialog"
			)
		else
			Say("<color=green>镖师<color>：帮会没有接到任务,无法领取奖励.",
				1,
				"好的,我知道了/Zgc_end_dialog"
			)
		end
	elseif tong_state == 1 or tong_state == 0 or tong_state == nil then
		Say("<color=green>镖师<color>：该周尚未接受这项任务。.",
			1,
			"我知道了/Zgc_end_dialog"
		)			
	elseif tong_state == 3 then
		local box_num = Zgc_conf_task_goos_num[tong_level][2]
		if GetFreeItemRoom() < (floor(box_num/10) + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < box_num then									--=========================在此加入负重和空格数的判断
			Say ("<color=green>镖师<color>：背包空间或附中不足",
				1,
				"我知道!/Zgc_dialog_end"
			)
		else
			if GetTaskTemp(Tasktemp_task_return) ~= Zgc_conf_task_time_return() then
				return
			else
				SetTaskTemp(Tasktemp_task_return,(GetTask(Tasktemp_task_return)-1))
				local add_flag = AddItem(2,89,6,box_num)				--test
				if add_flag ~= 0 then
					Msg2Player("你这次的任务奖励"..box_num.."生辰纲.")
					SendTongMessage(GetName().."获得“帮会”任务奖:生辰刚"..box_num.."个")
				WriteLogEx(strLogCaption, "收到", box_num, "生辰刚", "", GetTongName())
				else
				WriteLogEx(strLogCaption, "", "", "", "", GetTongName(), "兑换奖励：生辰纲失败了,反馈处理：:"..add_flag)
				end
				AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],4,tong_level_max)
			end
		end
	elseif tong_state == 4 then
		Say("<color=green>镖师<color>完成任务并获得奖励后，请等待下一个任务.",
			1,
			"好的,我知道了/Zgc_end_dialog"
		)
	end
end
--***************************对话结束（为空）**************************
function Zgc_end_dialog()
	
end
--***************************回调（为空）**************************
function cb()

end
--**************************轮次计算函数*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 61200)/(172800))
	return time_return
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
--**************************下一轮时间计算*****************************
function Zgc_conf_task_dist_date()
	local date_tomorrow = floor((GetTime() + 25200)/(172800))
	if Zgc_conf_task_time_return() == date_tomorrow then
		return 2
	else
		return 1
	end
end
--*************************可收取收集品上限计算函数**********************
function Zgc_conf_task_num_max()
	local ruturn_num = 0
	if GetLevel() > 50 then
		ruturn_num = 10000000
	else
		local num_seq = floor(GetLevel()/10)
		ruturn_num = Zgc_conf_task_goods_need[num_seq]
	end
	return ruturn_num
end
