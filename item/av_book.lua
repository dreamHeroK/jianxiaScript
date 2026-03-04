--文件说明
--ITEM：生存手册
--created by 
--2020-09-01 09:26
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\item\\av_booktuozhan.lua");

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
		szFactionRoute =   {8,9},
	},
	[4] =
	{
		szShowName = "丐帮",
		szFactionRoute =   {11, 12},
	},
	[5] =
	{
		szShowName = "唐门",
		szFactionRoute =   {6,31},
	},
	[6] =
	{
		szShowName = "杨门",
		szFactionRoute =   {17, 18},
	},
	[7] =
	{
		szShowName = "五毒",
		szFactionRoute =   {20,21},
	},
	[8] =
	{
		szShowName = "昆仑",
		szFactionRoute =   {23,32},
	},
	[9] =
	{
		szShowName = "明教",
		szFactionRoute =   {25,26,27},
	},
	[10] =
	{
		szShowName = "翠烟",
		szFactionRoute =   {29, 30},
	},
	[11] =
	{
		szShowName = "测试",
		szFactionRoute =   {31, 32},
	},	
}

tbFactionSex =
{
	[1] = {1, 2, 4, 5, 6, 7, 8, 9, },
	[2] = {2, 3, 4, 5, 6, 7, 9, 10, },
}

tbFactionRoute = {	--路线
	[2] = "少林俗家",
	[3] = "少林禅僧",
	[4] = "少林武僧",
	[6] = "唐门",
	[8] = "峨嵋佛家",
	[9] = "峨嵋俗家",
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
	local szTitle = format("%s 庆生新服，英雄共聚！", strTitle)
	if nRouteFlag ~= 1 then
		tinsert(selTab,"选择门派并获得相应的流派技能/#choose_faction("..nItemIndex..")");
	end;
	
		if 17 == nRoute then
			tinsert(selTab,"◆ 领取战马/Give_ZhanMa");
		end
		if 18 == nRoute then
		    tinsert(selTab,"◆ 领取战马/Give_ZhanMa");
			tinsert(selTab,"◆ 领取箭簇/Give_jiancu");
		end	
--	tinsert(selTab,"拓展列表/av_booktuozhan");	
--	tinsert(selTab,"技能石测试/skillapp");		
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																								     加入门派及派流
-----------------------------------------------------------------------------------------------------------------------------------------------------
function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	AddItem(0,105,51,1,4,4,101);
	AddItem(0,105,52,1,4,4,101);
end
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
--		{"返回上一层", set_faction_route, {nRoute}},
		{"我再考虑一下"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
-- C:\Users\Administrator\AppData\Local\Temp\scp09228\home\jx2JQ\gs\script\item\av_book.lua
function do_set_faction(nRoute)
	local szScript = format("MikeExpRoute3(%d)", nRoute)--拓展了3个版本MikeExpRoute怀旧模式自己去学，MikeExpRoute2直接学满，MikeExpRoute3学满带诛邪
	SendScript2VM("\\script\\item\\av_book.lua", szScript)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	local nLevel = GetLevel();
	if nLevel < 80 then
	SetLevel(80, 0);		--设置等级
	ExitGame()
	end;
	Msg2Player("您已成功加入了门派并学习了门派技能。")
	Talk(1,"","您已成功加入了门派并学习了门派技能。")
end
-------------------------MikeDai怀旧版本需要去师门学习---------------------------
function MikeExpRoute(nRoute)
	
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

	SetPlayerRoute(nRoute);					--设置流派

	if nRoute == 2 then					--少林俗家
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(21);
	elseif nRoute == 3 then					--少林禅僧
		LearnSkill(6);
		LearnSkill(45)
	elseif nRoute == 4 then					--少林武僧
		LearnSkill(2);
		LearnSkill(33);
	elseif nRoute == 6 then					--唐门
		LearnSkill(7);
		LearnSkill(58);
	elseif nRoute == 8 then					--峨嵋佛家
		LearnSkill(4);
		LearnSkill(75);	
		LearnSkill("比丘剑法");
		LearnSkill("菩提证果剑");		
	elseif nRoute == 9 then					--峨嵋俗家
        LearnSkill(9);
		LearnSkill(10);
		LearnSkill(90);
	elseif nRoute == 11 then					--丐帮净衣
		LearnSkill(2);
		LearnSkill(103);	
	elseif nRoute == 12 then					--丐帮污衣
		LearnSkill(5);
		LearnSkill(114);
	elseif nRoute == 14 then				--武当道家
		LearnSkill(4);
		LearnSkill(125);
	elseif nRoute == 15 then				--武当俗家
		LearnSkill(5);
		LearnSkill(147);
	elseif nRoute == 17 then				--杨门枪骑
		LearnSkill(11);
		LearnSkill(720);
	elseif nRoute == 18 then					--杨门弓骑
		LearnSkill(12);
		LearnSkill(733);
	elseif nRoute == 20 then					--五毒邪侠
		LearnSkill(13);
		LearnSkill(364);
	elseif nRoute == 21 then					--五毒蛊师
		LearnSkill(14);
		LearnSkill(347);
	elseif nRoute == 23 then					--昆仑天师
		LearnSkill(4);
		LearnSkill(1017);
	elseif nRoute == 25 then					--明教圣战
		LearnSkill(3);
		LearnSkill(1053);
	elseif nRoute == 26 then					--明教阵兵
		LearnSkill(8);
		LearnSkill(1083);
	elseif nRoute == 27 then					--明教血人
		LearnSkill(14);
		LearnSkill(1131);
	elseif nRoute == 29 then					--翠烟舞仙
		LearnSkill(15);
		LearnSkill(1165);
	elseif nRoute == 30 then					--翠烟灵女
		LearnSkill(16);
		LearnSkill(1218);
		LearnSkill(1217);
	elseif nRoute == 32 then					--昆仑剑尊
		LearnSkill(4);
		LearnSkill(1885);
		LearnSkill(1887);
		
--		nBegin = 1885 ;
--		nEnd = 1896;
	elseif nRoute == 31 then					--唐门任侠
		LearnSkill(17);
		LearnSkill(1873);
		LearnSkill(1872);
		LearnSkill(1874);
--		nBegin = 1872;
--		nEnd = 1882;
	else
		return
	end;
	LearnSkill(20);
	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;
end


function MikeExpRoute2(nRoute)--快餐版本直接学满
	
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

	SetPlayerRoute(nRoute);					--设置流派

	if nRoute == 2 then					--少林俗家
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--少林禅僧
		LearnSkill(6);
		LearnSkill(57);
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--少林武僧
		LearnSkill(2);
		LearnSkill(44);
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 6 then					--唐门
		LearnSkill(7);
		LearnSkill(74);
		LearnSkill(4002);--旧版本网子
		nBegin = 58
		nEnd = 73;
	
	elseif nRoute == 8 then					--峨嵋佛家
		LearnSkill(4);
		LearnSkill(89);
		nBegin = 75
		nEnd = 88;		
	elseif nRoute == 9 then					--峨嵋俗家
 		LearnSkill(10);
		LearnSkill(102);
		nBegin = 90
		nEnd = 101;	
	elseif nRoute == 11 then					--丐帮净衣
		LearnSkill(2);
		LearnSkill(113);
		nBegin = 103
		nEnd = 112;		
	elseif nRoute == 12 then					--丐帮污衣
		LearnSkill(5);
		LearnSkill(124);
		nBegin = 114
		nEnd = 123;	

	elseif nRoute == 14 then				--武当道家
		LearnSkill(4);
		LearnSkill(146);
		LearnSkill(4000);
		nBegin = 125;
		nEnd = 145;

	elseif nRoute == 15 then				--武当俗家
		LearnSkill(5);
		LearnSkill(159);
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 17 then				--杨门枪骑
		LearnSkill(11);
		LearnSkill(732);
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--杨门弓骑
		LearnSkill(12);
		LearnSkill(745);
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--五毒邪侠
		LearnSkill(13);
		LearnSkill(775);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--五毒蛊师
		LearnSkill(14);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--昆仑天师
		LearnSkill(4);
		LearnSkill(1032);
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--明教圣战
		LearnSkill(3);
		LearnSkill(1066);
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--明教阵兵
		LearnSkill(8);
		LearnSkill(1096);
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--明教血人
		LearnSkill(14);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--翠烟舞仙
		LearnSkill(15);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--翠烟灵女
		LearnSkill(16);
		LearnSkill(1230);
		nBegin = 1217 ;
		nEnd = 1229;
	elseif nRoute == 32 then					--昆仑剑尊
		LearnSkill(4);
		LearnSkill(1897);
		nBegin = 1885 ;
		nEnd = 1896;
	elseif nRoute == 31 then					--唐门任侠
		LearnSkill(17);
		LearnSkill(1885);
		LearnSkill(1883);
		nBegin = 1872;
		nEnd = 1882;
	else
		return
	end;
	LearnSkill(20);
	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;
end

function MikeExpRoute3(nRoute)--快餐版本直接学满带诛邪
	
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

	SetPlayerRoute(nRoute);					--设置流派

	if nRoute == 2 then					--少林俗家
		LearnSkill("屠魔刀法");
		LearnSkill("诸法空相");
		LearnSkill("无怖刀法");
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--少林禅僧
		LearnSkill(6);
		LearnSkill(57);
		LearnSkill("荡魔罡气");
		LearnSkill("明镜非台");
		LearnSkill("大悲咒");
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--少林武僧
		LearnSkill(2);
		LearnSkill(44);
		LearnSkill("梅花");
		LearnSkill("游龙飞步");
		LearnSkill("金刚怒目");
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 6 then					--唐门
		LearnSkill(7);
		LearnSkill(74);
		LearnSkill("穿心针");
		LearnSkill("飞蝗针");
		LearnSkill("引毒砂");
		LearnSkill(4002);--旧版本网子
		nBegin = 58
		nEnd = 73;
	
	elseif nRoute == 8 then					--峨嵋佛家
		LearnSkill(4);
		LearnSkill(89);
		LearnSkill("比丘剑法");
		LearnSkill("菩提证果剑");
		nBegin = 75
		nEnd = 88;		
	elseif nRoute == 9 then					--峨嵋俗家
 		LearnSkill(10);
		LearnSkill(102);
		LearnSkill("一剪梅");
		LearnSkill("迎香曲");
		LearnSkill("暗香疏影");
		nBegin = 90
		nEnd = 101;	
	elseif nRoute == 11 then					--丐帮净衣
		LearnSkill(2);
		LearnSkill(113);
		LearnSkill("御龙掌法");
		LearnSkill("山崩");
		LearnSkill("醉八仙");
		nBegin = 103
		nEnd = 112;		
	elseif nRoute == 12 then					--丐帮污衣
		LearnSkill(5);
		LearnSkill(124);
		LearnSkill("穷途棍法");
		LearnSkill("棍扫六合");
		LearnSkill("莲花阵");
		nBegin = 114
		nEnd = 123;	

	elseif nRoute == 14 then				--武当道家
		LearnSkill(4);
		LearnSkill(146);
		LearnSkill("真阳剑气");
		LearnSkill("玄阴剑气");
		LearnSkill("两仪内力");
		LearnSkill(4000);
		nBegin = 125;
		nEnd = 145;

	elseif nRoute == 15 then				--武当俗家
		LearnSkill(5);
		LearnSkill(159);
		LearnSkill("逍遥笔法");
		LearnSkill("沉醉吟");
		LearnSkill("写意篇");
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 17 then				--杨门枪骑
		LearnSkill(11);
		LearnSkill(732);
		LearnSkill("八方破灭枪");
		LearnSkill("杨家狂雷枪");
		LearnSkill("丹心决");
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--杨门弓骑
		LearnSkill(12);
		LearnSkill(745);
		LearnSkill("杨家迅发矢");
		LearnSkill("杨家落日箭");
		LearnSkill("挽月天狼阵");
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--五毒邪侠
		LearnSkill(13);
		LearnSkill(775);
		LearnSkill("五毒祭");
		LearnSkill("尸毒刃");
		LearnSkill("积尸气");
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--五毒蛊师
		LearnSkill(14);
		LearnSkill(774);
		LearnSkill("魇蛊");
		LearnSkill("麒麟蛊");
		LearnSkill("踏影蛊");
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--昆仑天师
		LearnSkill(4);
		LearnSkill(1032);
		LearnSkill("落雷");
		LearnSkill("旋风");
		LearnSkill("风雷咒");
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--明教圣战
		LearnSkill(3);
		LearnSkill(1066);
		LearnSkill("炎风");
		LearnSkill("阳炎刀");
		LearnSkill("焚身决");
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--明教阵兵
		LearnSkill(8);
		LearnSkill(1096);
		LearnSkill("布阵")
		LearnSkill("火蛇")
		LearnSkill("圣火笔法")
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--明教血人
		LearnSkill(14);
		LearnSkill(1213);
		LearnSkill("溢血爪");
		LearnSkill("灭魂印");
		LearnSkill("嗜血");
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--翠烟舞仙
		LearnSkill(15);
		LearnSkill(1196);
		LearnSkill("霓裳羽衣舞");
		LearnSkill("澄江似练");
		LearnSkill("薄媚摘遍");
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--翠烟灵女
		LearnSkill(16);
		LearnSkill(1230);
		LearnSkill("折花令");
		LearnSkill("雨霖铃");
		LearnSkill("玲珑四犯");
		nBegin = 1217 ;
		nEnd = 1229;
	elseif nRoute == 32 then					--昆仑剑尊
		LearnSkill(4);
		LearnSkill(1897);
		LearnSkill("惊蛰剑罡");
		LearnSkill("凌霜剑气");
		LearnSkill("炼剑-暮晓");
		nBegin = 1885 ;
		nEnd = 1896;
	elseif nRoute == 31 then					--唐门任侠
		LearnSkill(17);
		LearnSkill(1885);
		LearnSkill(1883);
		LearnSkill("回风");
		LearnSkill("骤雨");
    	LearnSkill("幻杀阵");
		nBegin = 1872;
		nEnd = 1882;
	else
		return
	end;
	LearnSkill(20);
	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;
end
function nothing()
end;

function skillapp()
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1, "", strTitle.."你还未加入门派")
		return
	end
	local selTab = {};
	local szTitleskill = format("%s技能石系统", strTitle)
		if nRoute == 2 then --少林俗家
			tinsert(selTab, "混元一气功/#skillapplv(21,20)")
			tinsert(selTab, "少林刀法/#skillapplv(22,20)")
			tinsert(selTab, "斗佛战法/#skillapplv(23,20)")
			tinsert(selTab, "斩魔刀法/#skillapplv(24,15)")
			tinsert(selTab, "封魔刀法/#skillapplv(25,15)")
			tinsert(selTab, "金钟罩/#skillapplv(26,20)")
			tinsert(selTab, "燃木刀法/#skillapplv(27,17)")
			tinsert(selTab, "无常刀法/#skillapplv(28,17)")
			tinsert(selTab, "大乘如来心法/#skillapplv(30,20)")
			tinsert(selTab, "达摩武经/#skillapplv(31,17)")
		end	
		if nRoute == 4 then --少林武僧	
			tinsert(selTab, "少林罗汉功/#skillapplv(33,20)")
			tinsert(selTab, "罗汉拳/#skillapplv(35,17)")
			tinsert(selTab, "迦叶腿/#skillapplv(36,17)")
			tinsert(selTab, "韦陀拳/#skillapplv(38,19)")
			tinsert(selTab, "文殊出云腿/#skillapplv(39,19)")
			tinsert(selTab, "无影脚/#skillapplv(42,19)")
			tinsert(selTab, "少林龙爪手/#skillapplv(43,17)")
        end	
		if nRoute == 4 then --少林禅僧	
			tinsert(selTab, "少林禅圆功/#skillapplv(45,20)")
			tinsert(selTab, "伏虎气功/#skillapplv(46,17)")
			tinsert(selTab, "因陀罗雷印破/#skillapplv(51,18)")
			tinsert(selTab, "袈裟伏魔神通/#skillapplv(52,18)")
			tinsert(selTab, "狮子吼/#skillapplv(54,15)")
			tinsert(selTab, "大力金刚指/#skillapplv(56,17)")
		end	
        if nRoute == 6 then --唐门普通		
			tinsert(selTab, "唐门暗器/#skillapplv(58,20)")
			tinsert(selTab, "心眼/#skillapplv(60,17)")
			tinsert(selTab, "毒刺骨/#skillapplv(61,17)")
			tinsert(selTab, "追心箭/#skillapplv(65,16)")
			tinsert(selTab, "穿心刺/#skillapplv(67,17)")
			tinsert(selTab, "暴雨梨花针/#skillapplv(70,17)")
			tinsert(selTab, "含沙射影/#skillapplv(71,16)")
			tinsert(selTab, "锁命针/#skillapplv(72,17)")
			tinsert(selTab, "满天花雨/#skillapplv(73,17)")
		end	
        if nRoute == 8 then --峨嵋佛				
			tinsert(selTab, "玉女心经/#skillapplv(75,20)")
			tinsert(selTab, "观音诀/#skillapplv(76,16)")
			tinsert(selTab, "玉女剑法/#skillapplv(78,17)")
			tinsert(selTab, "渡元诀/#skillapplv(79,16)")
			tinsert(selTab, "佛光普照/#skillapplv(80,15)")
			tinsert(selTab, "莲华心经/#skillapplv(81,18)")
			tinsert(selTab, "流水诀/#skillapplv(83,19)")
			tinsert(selTab, "普济众生/#skillapplv(84,16)")
			tinsert(selTab, "不灭心法/#skillapplv(85,15)")
			tinsert(selTab, "佛光战气/#skillapplv(86,16)")
			tinsert(selTab, "佛音战意/#skillapplv(87,16)")
		end
        if nRoute == 9 then --峨嵋琴		
			tinsert(selTab, "望月心法/#skillapplv(90,20)")
			tinsert(selTab, "随意曲/#skillapplv(91,17)")
			tinsert(selTab, "月蚀曲/#skillapplv(93,18)")
			tinsert(selTab, "静夜思/#skillapplv(95,16)")
			tinsert(selTab, "阳关三叠/#skillapplv(97,16)")
			tinsert(selTab, "焚琴煮鹤诀/#skillapplv(99,17)")
			tinsert(selTab, "乌夜啼/#skillapplv(100,16)")
			tinsert(selTab, "迷心飘香曲/#skillapplv(101,17)")
        end
        if nRoute == 11 then --丐帮净衣			
			tinsert(selTab, "混天气功/#skillapplv(103,20)")
			tinsert(selTab, "丐帮掌法/#skillapplv(104,20)")
			tinsert(selTab, "通臂拳/#skillapplv(105,15)")
			tinsert(selTab, "千斤闸/#skillapplv(106,17)")
			tinsert(selTab, "霸王拳/#skillapplv(107,15)")
			tinsert(selTab, "逍遥游/#skillapplv(109,15)")
			tinsert(selTab, "六合拳法/#skillapplv(110,16)")
			tinsert(selTab, "醉蝶/#skillapplv(111,18)")
			tinsert(selTab, "醉拳/#skillapplv(112,17)")
        end
        if nRoute == 12 then --丐帮污衣		
			tinsert(selTab, "天行气功/#skillapplv(114,20)")
			tinsert(selTab, "丐帮棍法/#skillapplv(115,20)")
			tinsert(selTab, "驱蛇棍法/#skillapplv(116,17)")
			tinsert(selTab, "泥鳅功/#skillapplv(118,18)")
			tinsert(selTab, "霸王卸甲/#skillapplv(121,17)")
			tinsert(selTab, "打狗棍法/#skillapplv(123,17)")
        end
        if nRoute == 14 then --丐帮污衣			
			tinsert(selTab, "武当剑经/#skillapplv(125,20)")
			tinsert(selTab, "流光剑法/#skillapplv(127,18)")
			tinsert(selTab, "未央剑法/#skillapplv(128,18)")
			tinsert(selTab, "柔云剑法/#skillapplv(129,18)")
			tinsert(selTab, "烈焰剑法/#skillapplv(130,18)")
			tinsert(selTab, "奔雷剑诀/#skillapplv(131,18)")
			tinsert(selTab, "太清剑气/#skillapplv(133,17)")
			tinsert(selTab, "缠梦剑意/#skillapplv(134,16)")
			tinsert(selTab, "落霜剑意/#skillapplv(135,16)")
			tinsert(selTab, "炙阳剑气/#skillapplv(136,17)")
			tinsert(selTab, "正两仪剑法/#skillapplv(139,16)")
			tinsert(selTab, "太乙三清剑/#skillapplv(140,17)")
			tinsert(selTab, "神门十三剑/#skillapplv(141,17)")
			tinsert(selTab, "地宁玄阴剑/#skillapplv(142,17)")
			tinsert(selTab, "天清纯阳剑/#skillapplv(143,17)")
			tinsert(selTab, "八卦剑气/#skillapplv(144,17)")
			tinsert(selTab, "真武七截剑/#skillapplv(145,17)")
        end
		if nRoute == 15 then
			tinsert(selTab, "武当奇经/#skillapplv(147,20)")
			tinsert(selTab, "武当笔法/#skillapplv(148,20)")
			tinsert(selTab, "太乙逍遥功/#skillapplv(149,15)")
			tinsert(selTab, "七星诀/#skillapplv(152,17)")
			tinsert(selTab, "少阳诀/#skillapplv(153,16)")
			tinsert(selTab, "少阴诀/#skillapplv(154,17)")
			tinsert(selTab, "残影诀/#skillapplv(156,16)")
			tinsert(selTab, "乾坤诀/#skillapplv(157,16)")
			tinsert(selTab, "上清无极功/#skillapplv(158,17)")
        end
		if nRoute == 21 then
			tinsert(selTab, "百蛊心经/#skillapplv(347,20)")
			tinsert(selTab, "疯蛊/#skillapplv(351,17)")
			tinsert(selTab, "狂风爪/#skillapplv(353,16)")
			tinsert(selTab, "毒蛊/#skillapplv(354,17)")
			tinsert(selTab, "血蛊/#skillapplv(356,17)")
			tinsert(selTab, "香蛊/#skillapplv(357,17)")
			tinsert(selTab, "尸蛊/#skillapplv(358,17)")
			tinsert(selTab, "妖蛊/#skillapplv(359,17)")
			tinsert(selTab, "心蛊/#skillapplv(360,17)")
			tinsert(selTab, "万蛊蚀天/#skillapplv(361,18)")
			tinsert(selTab, "幻蛊/#skillapplv(362,17)")
			tinsert(selTab, "蠶蛊/#skillapplv(363,17)")
			tinsert(selTab, "蠶蛊爆炸/#skillapplv(965,17)")
        end
		if nRoute == 20 then
			tinsert(selTab, "万毒心法/#skillapplv(364,20)")
			tinsert(selTab, "操尸术/#skillapplv(367,16)")
			tinsert(selTab, "尸毒术/#skillapplv(368,17)")
			tinsert(selTab, "尸爆大法/#skillapplv(369,15)")
			tinsert(selTab, "集尸邪气/#skillapplv(370,18)")
			tinsert(selTab, "驭尸术/#skillapplv(371,16)")
			tinsert(selTab, "万毒夺命刀/#skillapplv(372,17)")
			tinsert(selTab, "阴邪吸魂气/#skillapplv(373,15)")
			tinsert(selTab, "邪灵大法/#skillapplv(375,16)")
			tinsert(selTab, "邪毒功/#skillapplv(376,17)")
			tinsert(selTab, "尸裂魔功/#skillapplv(377,17)")
        end
		if nRoute == 17 then
			tinsert(selTab, "杨家枪心法/#skillapplv(720,20)")
			tinsert(selTab, "杨家枪法总诀/#skillapplv(721,20)")
			tinsert(selTab, "杨家破风枪/#skillapplv(722,17)")
			tinsert(selTab, "杨家奔狼枪/#skillapplv(724,17)")
			tinsert(selTab, "杨家战定诀/#skillapplv(725,16)")
			tinsert(selTab, "杨家天衡枪/#skillapplv(727,17)")
			tinsert(selTab, "杨家倒海枪/#skillapplv(729,16)")
			tinsert(selTab, "杨家御马术/#skillapplv(730,16)")
			tinsert(selTab, "碧月飞星枪/#skillapplv(731,17)")
        end
		if nRoute == 18 then
			tinsert(selTab, "杨家弓心法/#skillapplv(733,20)")
			tinsert(selTab, "杨家弓法总决/#skillapplv(734,20)")
			tinsert(selTab, "杨家连射术/#skillapplv(735,17)")
			tinsert(selTab, "杨家回龙箭/#skillapplv(737,17)")
			tinsert(selTab, "杨家缠云箭/#skillapplv(738,18)")
			tinsert(selTab, "杨家奇门盾/#skillapplv(739,15)")
			tinsert(selTab, "杨家正气箭/#skillapplv(740,19)")
			tinsert(selTab, "杨家碎金箭/#skillapplv(741,18)")
			tinsert(selTab, "杨家策马术/#skillapplv(743,15)")
			tinsert(selTab, "流光绝影箭/#skillapplv(744,17)")
        end
		if nRoute == 23 then
			tinsert(selTab, "太乙心法/#skillapplv(1017,20)")
			tinsert(selTab, "天雷符/#skillapplv(1020,17)")
			tinsert(selTab, "冰风诀/#skillapplv(1021,17)")
			tinsert(selTab, "御风诀/#skillapplv(1022,16)")
			tinsert(selTab, "狂雷符/#skillapplv(1023,17)")
			tinsert(selTab, "轰雷符/#skillapplv(1024,16)")
			tinsert(selTab, "扬沙诀/#skillapplv(1025,16)")
			tinsert(selTab, "罡风诀/#skillapplv(1026,17)")
			tinsert(selTab, "爆雷符/#skillapplv(1027,17)")
			tinsert(selTab, "五雷正法符/#skillapplv(1029,18)")
			tinsert(selTab, "万雷碎星符/#skillapplv(1030,18)")
        end
		if nRoute == 25 then
			tinsert(selTab, "圣火金炉功/#skillapplv(1053,20)")
			tinsert(selTab, "圣火刀法/#skillapplv(1054,19)")
			tinsert(selTab, "烈炀斩/#skillapplv(1056,17)")
			tinsert(selTab, "炽炎击/#skillapplv(1057,17)")
			tinsert(selTab, "天劫焚/#skillapplv(1058,18)")
			tinsert(selTab, "凝火璧/#skillapplv(1059,17)")
			tinsert(selTab, "狂焰奔/#skillapplv(1060,19)")
			tinsert(selTab, "炙风旋/#skillapplv(1061,17)")
			tinsert(selTab, "霸煌断/#skillapplv(1062,17)")
			tinsert(selTab, "气化游龙/#skillapplv(1063,17)")
			tinsert(selTab, "阳炎爆/#skillapplv(1064,19)")
			tinsert(selTab, "暴杀劲/#skillapplv(1065,17)")
        end
		if nRoute == 26 then
			tinsert(selTab, "光明逍遥功/#skillapplv(1083,20)")
			tinsert(selTab, "光明笔法/#skillapplv(1084,19)")
			tinsert(selTab, "金锁阵/#skillapplv(1085,17)")
			tinsert(selTab, "玄水阵/#skillapplv(1087,17)")
			tinsert(selTab, "盘木阵/#skillapplv(1089,17)")
			tinsert(selTab, "业火阵/#skillapplv(1092,17)")
			tinsert(selTab, "土牢阵/#skillapplv(1093,17)")
			tinsert(selTab, "五灵散元/#skillapplv(1094,19)")
			tinsert(selTab, "五灵归元/#skillapplv(1095,17)")
        end
		if nRoute == 27 then
			tinsert(selTab, "寒冰心法/#skillapplv(1131,20)")
			tinsert(selTab, "断骨爪/#skillapplv(1132,18)")
			tinsert(selTab, "腐伤印/#skillapplv(1133,17)")
			tinsert(selTab, "崩血印/#skillapplv(1135,18)")
			tinsert(selTab, "吸血印/#skillapplv(1136,16)")
			tinsert(selTab, "弑颈爪/#skillapplv(1140,18)")
			tinsert(selTab, "殒殇印/#skillapplv(1143,17)")
        end
		if nRoute == 29 then
			tinsert(selTab, "枫舞心法/#skillapplv(1165,20)")
			tinsert(selTab, "灵猫韵/#skillapplv(1167,17)")
			tinsert(selTab, "舞云心法/#skillapplv(1168,18)")
			tinsert(selTab, "媚花/#skillapplv(1169,17)")
			tinsert(selTab, "秋月赋/#skillapplv(1171,17)")
			tinsert(selTab, "蝶怨/#skillapplv(1173,18)")
			tinsert(selTab, "天火艳阳/#skillapplv(1174,17)")
			tinsert(selTab, "梦蛇/#skillapplv(1176,17)")
        end
		if nRoute == 30 then
			tinsert(selTab, "百花玉露功/#skillapplv(1217,20)")
			tinsert(selTab, "落花诀/#skillapplv(1219,17)")
			tinsert(selTab, "桃花瘴/#skillapplv(1220,16)")
			tinsert(selTab, "锁心诀/#skillapplv(1222,17)")
			tinsert(selTab, "还神术/#skillapplv(1223,16)")
			tinsert(selTab, "灵动诀/#skillapplv(1224,16)")
			tinsert(selTab, "仙炉香/#skillapplv(1226,18)")
			tinsert(selTab, "百蝶迎香诀/#skillapplv(1227,18)")
			tinsert(selTab, "玉龙穿月诀/#skillapplv(1229,17)")
        end
		if nRoute == 31 then
			tinsert(selTab, "魅影心法/#skillapplv(1872,20)")
			tinsert(selTab, "玲珑刺/#skillapplv(1873,17)")
			tinsert(selTab, "灵犀追命/#skillapplv(1874,17)")
			tinsert(selTab, "杀意/#skillapplv(1875,17)")
			tinsert(selTab, "碧落刃/#skillapplv(1876,17)")
			tinsert(selTab, "惊鸿断/#skillapplv(1877,17)")
			tinsert(selTab, "凄锋夺/#skillapplv(1878,17)")
			tinsert(selTab, "碎梦崩/#skillapplv(1880,17)")
			tinsert(selTab, "流星赶月/#skillapplv(1881,17)")
			tinsert(selTab, "烟雨迷离/#skillapplv(1882,17)")
        end
		if nRoute == 32 then
			tinsert(selTab, "昆虚剑诀/#skillapplv(1885,20)")
			tinsert(selTab, "残云剑罡/#skillapplv(1886,17)")
			tinsert(selTab, "断水剑罡/#skillapplv(1891,17)")
			tinsert(selTab, "暴雷剑罡/#skillapplv(1892,17)")
			tinsert(selTab, "回风剑罡/#skillapplv(1893,17)")
			tinsert(selTab, "剑守空明/#skillapplv(1896,17)")			
		end
	
	tinsert(selTab,"结束对话/nothing");
	Say(szTitleskill, getn(selTab), selTab)	

end

function skillapplv(nid,nmx)
local nMaxLevel = nmx
if GetSkillLevel(nid) >= nMaxLevel then
Talk(1,"","该技能已经到达上限。")
return
else
LevelUpSkill(nid)
Msg2Player("您成功升级了!")
end
end
















