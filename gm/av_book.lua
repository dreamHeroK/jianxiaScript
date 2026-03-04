--文件说明
--ITEM：生存手册
--created by moocrun
--2020-09-01 09:26
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\writelog.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\gm\\gmgaojipin.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

strTitle = "<color=green>生存手册<color>："

tbFaction =
{
	[1] =
	{
		szShowName = "少林",
		szFactionRoute =   {2, 3, 4},
	},
	[2] =
	{
		szShowName = "武当",
		szFactionRoute =   {14, 15},
	},
	[3] =
	{
		szShowName = "峨嵋",
		szFactionRoute =   {8, 9},
	},
	[4] =
	{
		szShowName = "丐帮",
		szFactionRoute =   {11, 12},
	},
	[5] =
	{
		szShowName = "唐门",
		szFactionRoute =   {6},
	},
	[6] =
	{
		szShowName = "杨门",
		szFactionRoute =   {17, 18},
	},
	[7] =
	{
		szShowName = "五毒",
		szFactionRoute =   {20},
	},
	[8] =
	{
		szShowName = "昆仑",
		szFactionRoute =   {23,32},
	},
	[9] =
	{
		szShowName = "明教",
		szFactionRoute =   {25, 26},
	},
	[10] =
	{
		szShowName = "翠烟",
		szFactionRoute =   {29, 30},
	},
}

tbFactionSex =
{
	[1] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
	[2] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
}

tbFactionRoute = {	--路线
	[2] = "少林俗家",
	[3] = "少林禅僧",
	[4] = "少林武僧",
	[6] = "唐门",
	[8] = "峨嵋佛家",
	[9] = "峨嵋俗家",
	[11] = "丐帮净尧",
	[12] = "丐帮污尧",
	[14] = "武当道家",
	[15] = "武当俗家",
	[17] = "杨门枪骑",
	[18] = "杨门弓骑",
	[20] = "五毒邪侠",
	[23] = "昆仑天师",
	[25] = "明教圣战",
	[26] = "明教阵兵",
	[29] = "翠烟舞仙",
	[30] = "翠烟灵女",
	[32] = "剑尊",
}


function OnUse(nItemIndex)
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
	local selTab = {};
	local szTitle = format("%s春来秋去不相待，不负多年的期盼，基于国外残端研究汉化，修改得以续武侠经典，共筑北宋中原，诚挚欢迎侠士游览另一个武侠世界。\n    ", strTitle)
	if nRouteFlag ~= 1 then
		tinsert(selTab,"选择门派并获得相应的流派技能/#choose_faction("..nItemIndex..")");
	end;
--	tinsert(selTab,"我要了解开放的流派/#task_Talk_01("..nItemIndex..")");
--	tinsert(selTab,"我要了解新手指南/#task_Talk_02("..nItemIndex..")");
--	tinsert(selTab,"我要了解副本特色/#task_Talk_03("..nItemIndex..")");
--	tinsert(selTab,"我要了解当前有什么活动/#task_Talk_04("..nItemIndex..")");
--	tinsert(selTab,"◆领取【时装蕴灵】/#ask_yunling("..nItemIndex..")");
	tinsert(selTab,"◆当前【坐标位置】/#Get_word_xy("..nItemIndex..")");
--	tinsert(selTab,"◆指定【7级灵石】/#ask_lingshi("..nItemIndex..")");
--	tinsert(selTab,"◆指定【6级灵石】/#ask_lingshi6("..nItemIndex..")");
	tinsert(selTab, "◆随身【仓库】/#suishensd("..nItemIndex..")");
	tinsert(selTab, "\n◆清空【背包】/ClearBag");
	tinsert(selTab, format("\n◆书籍商店/#show_equip_shop(25)"));
	tinsert(selTab, format("◆杂货商店/#show_equip_shop(4002)"));
	tinsert(selTab, format("◆日常商店/#show_equip_shop(4012)"));
	tinsert(selTab, format("◆炎帝装备/#show_equip_shop(3001)"));
	tinsert(selTab, format("◆轩辕装备/#show_equip_shop(3003)"));
	tinsert(selTab, format("◆师门装备/#show_equip_shop(3100)"));
	tinsert(selTab, format("\n◆皓月装备/#show_equip_shop(3101)"));
	tinsert(selTab, format("◆耀阳装备/#show_equip_shop(3102)"));
	tinsert(selTab, format("◆凤鸣装备/#show_equip_shop(3106)"));
	tinsert(selTab, format("◆东皇装备/#show_equip_shop(3107)"));
	tinsert(selTab, format("◆龙隐装备/#show_equip_shop(3110)"));
	tinsert(selTab, format("◆终级装备/#show_equip_shop(4018)"));
	tinsert(selTab,"\n◆我还没准备好/nothing");
	Say(szTitle, getn(selTab), selTab)
end


-----------------------------------------------------------------------------------------------------------------------------------------------------
--																								     加入门派及派流
-----------------------------------------------------------------------------------------------------------------------------------------------------

function choose_faction(nItemIndex)
	if GetPlayerFaction() ~= 0 then
		Talk(1, "", strTitle.."你已经加入过门派了")
		return
	end

	local szTitle = strTitle.."一旦加入门派就不可更改，请考虑清楚"
	local nSex = GetSex();
	local tbOpt = {}
	for i=1, getn(tbFactionSex[nSex]) do
		local nIndex = tbFactionSex[nSex][i]
		tinsert(tbOpt, {tbFaction[nIndex].szShowName, set_faction_route, {tbFaction[nIndex].szFactionRoute}})
	end
	tinsert(tbOpt, {"返回上一层", OnUse, {nItemIndex}})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szTitle, tbOpt)
end

function set_faction_route(szFactionRoute)
	local szTitle = strTitle.."选择你要加入的流派，一旦选择了流派就不可更改，要考虑清楚"
	local tbOpt = {}
	for i=1, getn(szFactionRoute) do
		local nRoute = szFactionRoute[i]
		tinsert(tbOpt, {tbFactionRoute[nRoute], set_faction, {nRoute, tbFactionRoute[nRoute]}})
	end

	tinsert(tbOpt, {"返回上一层", choose_faction})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szTitle, tbOpt)
end

function set_faction(nRoute, szFactionRouteName)
	local szTitle = strTitle.."派流一旦选定则不能修改，只能以该角色加入，确认要加入<color=yellow>"..szFactionRouteName.."<color>吗？"
	local tbOpt =
	{
		{"确认", do_set_faction, {nRoute}},
		{"返回上一层", set_faction_route, {nRoute}},
		{"我再考虑一下"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction(nRoute)
	local szScript = format("MikeDai(%d)", nRoute)--原来的－MikeExpRoute 现在的－MikeDai
	SendScript2VM("\\script\\gmscript.lua", szScript)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	Msg2Player("您已成功加入了门派并学习了门派技能。")
	Talk(1,"","您已成功加入了门派并学习了门派技能。")
end

function nothing()
end;

function task_Talk_01(nItemIndex)
	local szTalk = {
		strTitle.."基于平衡发展，归来版第一阶段开放只开放{少林俗家}、{少林禅僧}、{少林武僧}、{唐门}、{峨嵋佛家}、{丐帮净衣}、{丐帮污尧}、{武当道家}、{武当俗家}、{杨门枪骑}、{杨门弓骑}、{五毒邪侠}、{昆仑天师}、{翠烟舞仙}、{翠烟灵女}职业（暂不开放琴蛊和明教），职业技能和诀要技能均基于国服{灵动山河}和{燕云剑戈}版本，只修复了部分闪避和命中属性。",
	};
	TalkEx("#OnUse("..nItemIndex..")", szTalk);
end;

function task_Talk_02(nItemIndex)
	local szTalk = {
		strTitle.."进服10分钟就可论战中原\n1、去汴京中间新服活动大使签到，直升52级\n2、找野叟接入门任务。完成入门任务，获{师恩难忘包}，打开礼包，吃龙血丸，直升73且获得+7师门套；秘籍去掌门秒修；穿戴上师门套披风令牌和五行牌子。\n3、去玉融峰，找NPC李壕，兑换10个辉星碎片，找NPC迟东兑换师门声望，使用掌门初级特封令，亮出称号。\n同时可以开启背包里的{归来新手礼包}可以获得阶段性奖励（飞剑、神行、般若种子等）。开始您的中原江湖之旅吧。",
	};
	TalkEx("#OnUse("..nItemIndex..")", szTalk);
end;

function task_Talk_03(nItemIndex)
	local szTalk = {
		strTitle.."打宝体验提升，让您更畅快。\n1、梁山副本，首日即开；地宫副本，80级别即可，丰厚装备等您来拿。每天无限次进入！\n2、 副本产出优化，地玄宫、免费翻牌奖励进行更换，统一改为随机数量的游侠令，游侠令可兑换秘籍箱/蕴灵箱/强化箱/宝石箱。",
	};
	TalkEx("#OnUse("..nItemIndex..")", szTalk);
end;

function task_Talk_04(nItemIndex)
	local szTalk = {
		strTitle.."日常活动不断开启\n1、开放城市种树（副本产出小般若树种、般若树种）。\n2、开放周末活动，每周六、周日，大侠可在周末活动大使处接取上阵杀敌任务，上交物质，运送物资等活动。\n3、开放商会任务：声望、金、银券产出（根据角色等级决定每日次数及银券数量）\n4、全面开放三大主线任务、西南任务及西北任务，开放任务跟踪和指引，开放所有的任务奖励；此阶段任务完成，角色升级到80级同时获得全套师门4套装备及首饰。",
	};
	TalkEx("#OnUse("..nItemIndex..")", szTalk);
end;
function ask_yunling(nItemIndex)
	local tSay = {}
	tSay = {
			"◆我要头部全属性99生命6666施展9%/#choose_yunl(1)",
			"◆我要衣服全属性99生命6666施展9%/#choose_yunl(2)",
			"◆我要裤子全属性99生命6666施展9%/#choose_yunl(3)",
			"◆我要衣服内外攻11%/#choose_yunl(4)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end


function choose_yunl(nWz)
	
	if nWz == 1	then 
	AddItem(0,148,52,1)
--	AddItem(0,148,101,1)
--	AddItem(0,148,102,1)
--	AddItem(0,148,103,1)
----	AddItem(0,148,104,1)
--	AddItem(0,148,105,1)
--	AddItem(0,148,106,1)
--	AddItem(0,148,107,1)
--	AddItem(0,148,108,1)
--	AddItem(0,148,109,1)
--	AddItem(0,148,110,1)
--	AddItem(0,148,111,1)
--	AddItem(0,148,112,1)
--	AddItem(0,148,113,1)
--	AddItem(0,148,114,1)
--	AddItem(0,148,115,1)
--	AddItem(0,148,116,1)
	Msg2Player("你获得气御（头部）")
	end
	if nWz == 2	then 
	AddItem(0,149,52,1)
--	AddItem(0,149,104,1)
--	AddItem(0,149,105,1)
--	AddItem(0,149,106,1)
--	AddItem(0,149,107,1)
--	AddItem(0,149,108,1)
--	AddItem(0,149,109,1)
--	AddItem(0,149,110,1)
----	AddItem(0,149,111,1)
--	AddItem(0,149,112,1)
--	AddItem(0,149,113,1)
--	AddItem(0,149,114,1)
--	AddItem(0,149,115,1)
--	AddItem(0,149,116,1)
--	AddItem(0,149,117,1)
--	AddItem(0,149,118,1)
--	AddItem(0,149,119,1)
--	AddItem(0,149,120,1)
	Msg2Player("你获得气御（衣服）")
	end
	if nWz == 3	then 
	AddItem(0,150,52,1)
--	AddItem(0,150,101,1)
--	AddItem(0,150,102,1)
--	AddItem(0,150,103,1)
--	AddItem(0,150,104,1)
--	AddItem(0,150,105,1)
--	AddItem(0,150,106,1)
--	AddItem(0,150,107,1)
--	AddItem(0,150,108,1)
--	AddItem(0,150,109,1)
--	AddItem(0,150,110,1)
--	AddItem(0,150,111,1)
--	AddItem(0,150,112,1)
--	AddItem(0,150,113,1)
--	AddItem(0,150,114,1)
--	AddItem(0,150,115,1)
--	AddItem(0,150,116,1)
	Msg2Player("你获得气御（下装）")
	end
	if nWz == 4	then 
	AddItem(0,149,40,1)
	AddItem(0,149,118,1)
	AddItem(0,149,119,1)
	Msg2Player("你获得怒吟（衣服）")
	end
	
end
function Get_word_xy(nItemIndex)
	local map,x,y = GetWorldPos();
	Msg2Player("map:"..map.."x:"..x.."y:"..y)
end
function ask_lingshi(nItemIndex)
	local tSay = {}
	tSay = {
			"◆头部施展速度7级/#xuan_lingshi(1)",
			"◆头部承受减半7级/#xuan_lingshi(2)",
			"◆头部全属性7级/#xuan_lingshi(22)",
			"◆600秒帽子耐久回复7级/#xuan_lingshi(18)",
			"◆衣服承受减半7级/#xuan_lingshi(3)",
			--"衣服受伤动作7级/#xuan_lingshi(4)",
			"◆衣服全属性7级/#xuan_lingshi(23)",
			"◆衣服外攻百分比7级/#xuan_lingshi(20)",
			"◆衣服内攻百分比7级/#xuan_lingshi(21)",
			"◆600秒衣服耐久回复7级/#xuan_lingshi(17)",
			"◆裤子承受减半7级/#xuan_lingshi(5)",
			"◆裤子全属性7级/#xuan_lingshi(6)",
			"◆裤子生命上限7级/#xuan_lingshi(7)",
			--"裤子内力上限7级/#xuan_lingshi(8)",
			"◆600秒裤子耐久回复7级/#xuan_lingshi(19)",
			"◆武器外攻百分比7级/#xuan_lingshi(9)",
			"◆武器内攻百分比7级/#xuan_lingshi(10)",
			"◆武器削内防7级/#xuan_lingshi(11)",
			"◆武器削外防7级/#xuan_lingshi(12)",
			--"武器破防7级/#xuan_lingshi(13)",
			--"武器发招7级/#xuan_lingshi(14)",
			"◆武器伤害7级/#xuan_lingshi(15)",
			"◆600秒武器耐久回复7级/#xuan_lingshi(16)",



		}
	tinsert(tSay, "◆退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function ask_lingshi6(nItemIndex)
	local tSay = {}
	tSay = {
			"◆头部施展速度6级/#xuan_lingshi6(160)",
			"◆头部承受减半6级/#xuan_lingshi6(260)",
			"◆头部全属性6级/#xuan_lingshi6(2260)",
			"◆600秒帽子耐久回复6级/#xuan_lingshi6(1860)",
			"◆衣服承受减半6级/#xuan_lingshi6(360)",
			--"衣服受伤动作6级/#xuan_lingshi6(460)",
			"◆衣服全属性6级/#xuan_lingshi6(2360)",
			"◆衣服外攻百分比6级/#xuan_lingshi6(2060)",
			"◆衣服内攻百分比6级/#xuan_lingshi6(2160)",
			"◆600秒衣服耐久回复6级/#xuan_lingshi6(1760)",
			"◆裤子承受减半6级/#xuan_lingshi6(560)",
			"◆裤子全属性6级/#xuan_lingshi6(660)",
			"◆裤子生命上限6级/#xuan_lingshi6(760)",
			--"裤子内力上限6级/#xuan_lingshi6(860)",
			"◆600秒裤子耐久回复6级/#xuan_lingshi6(1960)",
			"◆武器外攻百分比6级/#xuan_lingshi6(960)",
			"◆武器内攻百分比6级/#xuan_lingshi6(1060)",
			"◆武器削内防6级/#xuan_lingshi6(1160)",
			"◆武器削外防6级/#xuan_lingshi6(1260)",
			--"武器破防6级/#xuan_lingshi6(1360)",
			--"武器发招6级/#xuan_lingshi6(1460)",
			"◆武器伤害6级/#xuan_lingshi6(1560)",
			"◆600秒武器耐久回复6级/#xuan_lingshi6(1660)",



		}
	tinsert(tSay, "◆退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end


function xuan_lingshi(nWz)
	
	if nWz == 1	then 
	AddLingShi(371,0,7)
	AddLingShi(371,0,7)
	AddLingShi(371,0,7)
	AddLingShi(371,0,7)
	end
	if nWz == 2	then 
	AddLingShi(365,0,7)
	AddLingShi(365,0,7)
	AddLingShi(365,0,7)
	AddLingShi(365,0,7)
	end
	if nWz == 3	then 
	AddLingShi(365,1,7)
	AddLingShi(365,1,7)
	AddLingShi(365,1,7)
	AddLingShi(365,1,7)
	end
	if nWz == 4	then 
	AddLingShi(355,1,7)
	AddLingShi(355,1,7)
	AddLingShi(355,1,7)
	AddLingShi(355,1,7)
	end
	if nWz == 5	then 
	AddLingShi(365,3,7)
	AddLingShi(365,3,7)
	AddLingShi(365,3,7)
	AddLingShi(365,3,7)
	end
	if nWz == 6	then 
	AddLingShi(367,3,7)
	AddLingShi(367,3,7)
	AddLingShi(367,3,7)
	AddLingShi(367,3,7)
	end
	if nWz == 7	then 
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	end
	if nWz == 8	then 
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	end
	if nWz == 9	then 
	AddLingShi(368,2,7)
	AddLingShi(368,2,7)
	AddLingShi(368,2,7)
	AddLingShi(368,2,7)
	end
	if nWz == 10	then 
	AddLingShi(369,2,7)
	AddLingShi(369,2,7)
	AddLingShi(369,2,7)
	AddLingShi(369,2,7)
	end
	if nWz == 11	then 
	AddLingShi(383,2,7)
	AddLingShi(383,2,7)
	AddLingShi(383,2,7)
	AddLingShi(383,2,7)
	end
	if nWz == 12	then 
	AddLingShi(382,2,7)
	AddLingShi(382,2,7)
	AddLingShi(382,2,7)
	AddLingShi(382,2,7)
	end
	if nWz == 13	then 
	AddLingShi(362,2,7)
	AddLingShi(362,2,7)
	AddLingShi(362,2,7)
	AddLingShi(362,2,7)
	end
	if nWz == 14	then 
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	end
	if nWz == 15	then 
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	end
	if nWz == 16	then 
	AddLingShi(43,2,7)
	AddLingShi(43,2,7)
	AddLingShi(43,2,7)
	AddLingShi(43,2,7)
	end
	if nWz == 17	then 
	AddLingShi(112,1,7)
	AddLingShi(112,1,7)
	AddLingShi(112,1,7)
	AddLingShi(112,1,7)
	end
	if nWz == 18	then 
	AddLingShi(113,0,7)
	AddLingShi(113,0,7)
	AddLingShi(113,0,7)
	AddLingShi(113,0,7)
	end
	if nWz == 19	then 
	AddLingShi(114,3,7)
	AddLingShi(114,3,7)
	AddLingShi(114,3,7)
	AddLingShi(114,3,7)
	end
	if nWz == 20	then 
	AddLingShi(18,1,7)
	AddLingShi(18,1,7)
	AddLingShi(18,1,7)
	AddLingShi(18,1,7)
	end
	if nWz == 21	then 
	AddLingShi(19,1,7)
	AddLingShi(19,1,7)
	AddLingShi(19,1,7)
	AddLingShi(19,1,7)
	AddLingShi(19,1,7)
	end
	if nWz == 22	then 
	AddLingShi(367,0,7)
	AddLingShi(367,0,7)
	AddLingShi(367,0,7)
	AddLingShi(367,0,7)
	end
	if nWz == 23	then 
	AddLingShi(367,1,7)
	AddLingShi(367,1,7)
	AddLingShi(367,1,7)
	AddLingShi(367,1,7)
	end


end

function xuan_lingshi6(nWz)
	
	if nWz == 160	then 
	AddLingShi(371,0,6)
	AddLingShi(371,0,6)
	AddLingShi(371,0,6)
	AddLingShi(371,0,6)
	end
	if nWz == 260	then 
	AddLingShi(365,0,6)
	AddLingShi(365,0,6)
	AddLingShi(365,0,6)
	AddLingShi(365,0,6)
	end
	if nWz == 360	then 
	AddLingShi(365,1,6)
	AddLingShi(365,1,6)
	AddLingShi(365,1,6)
	AddLingShi(365,1,6)
	end
	if nWz == 460	then 
	AddLingShi(355,1,6)
	AddLingShi(355,1,6)
	AddLingShi(355,1,6)
	AddLingShi(355,1,6)
	end
	if nWz == 560	then 
	AddLingShi(365,3,6)
	AddLingShi(365,3,6)
	AddLingShi(365,3,6)
	AddLingShi(365,3,6)
	end
	if nWz == 660	then 
	AddLingShi(367,3,6)
	AddLingShi(367,3,6)
	AddLingShi(367,3,6)
	AddLingShi(367,3,6)
	end
	if nWz == 760	then 
	AddLingShi(79,3,6)
	AddLingShi(79,3,6)
	AddLingShi(79,3,6)
	AddLingShi(79,3,6)
	end
	if nWz == 860	then 
	AddLingShi(80,3,6)
	AddLingShi(80,3,6)
	AddLingShi(80,3,6)
	AddLingShi(80,3,6)
	end
	if nWz == 960	then 
	AddLingShi(368,2,6)
	AddLingShi(368,2,6)
	AddLingShi(368,2,6)
	AddLingShi(368,2,6)
	end
	if nWz == 1060	then 
	AddLingShi(369,2,6)
	AddLingShi(369,2,6)
	AddLingShi(369,2,6)
	AddLingShi(369,2,6)
	end
	if nWz == 1160	then 
	AddLingShi(383,2,6)
	AddLingShi(383,2,6)
	AddLingShi(383,2,6)
	AddLingShi(383,2,6)
	end
	if nWz == 1260	then 
	AddLingShi(382,2,6)
	AddLingShi(382,2,6)
	AddLingShi(382,2,6)
	AddLingShi(382,2,6)
	end
	if nWz == 1360	then 
	AddLingShi(362,2,6)
	AddLingShi(362,2,6)
	AddLingShi(362,2,6)
	AddLingShi(362,2,6)
	end
	if nWz == 1460	then 
	AddLingShi(370,2,6)
	AddLingShi(370,2,6)
	AddLingShi(370,2,6)
	AddLingShi(370,2,6)
	end
	if nWz == 1560	then 
	AddLingShi(372,2,6)
	AddLingShi(372,2,6)
	AddLingShi(372,2,6)
	AddLingShi(372,2,6)
	end
	if nWz == 1660	then 
	AddLingShi(43,2,6)
	AddLingShi(43,2,6)
	AddLingShi(43,2,6)
	AddLingShi(43,2,6)
	end
	if nWz == 1760	then 
	AddLingShi(112,1,6)
	AddLingShi(112,1,6)
	AddLingShi(112,1,6)
	AddLingShi(112,1,6)
	end
	if nWz == 1860	then 
	AddLingShi(113,0,6)
	AddLingShi(113,0,6)
	AddLingShi(113,0,6)
	AddLingShi(113,0,6)
	end
	if nWz == 1960	then 
	AddLingShi(114,3,6)
	AddLingShi(114,3,6)
	AddLingShi(114,3,6)
	AddLingShi(114,3,6)
	end
	if nWz == 2060	then 
	AddLingShi(18,1,6)
	AddLingShi(18,1,6)
	AddLingShi(18,1,6)
	AddLingShi(18,1,6)
	end
	if nWz == 2160	then 
	AddLingShi(19,1,6)
	AddLingShi(19,1,6)
	AddLingShi(19,1,6)
	AddLingShi(19,1,6)
	AddLingShi(19,1,6)
	end
	if nWz == 2260	then 
	AddLingShi(367,0,6)
	AddLingShi(367,0,6)
	AddLingShi(367,0,6)
	AddLingShi(367,0,6)
	end
	if nWz == 2360	then 
	AddLingShi(367,1,6)
	AddLingShi(367,1,6)
	AddLingShi(367,1,6)
	AddLingShi(367,1,6)
	end


end


function suishensd()--随身商店
	OpenBox()
end

function ClearBag()
	AskClientForString("leave","清空背包",1,32,"确定清空背包");
end
function leave(masli)
	if masli == "清空背包" then  -- GM密码
		ClearItemInPos()
		return 0
	end
	
end



