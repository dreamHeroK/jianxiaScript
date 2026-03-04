--生存手册 总脚本
--20201024
--\script\online\new_group_activities\expert_mode\av_book.lua
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\writelog.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\gm\\gmgaojipin.lua")
g_szTitle = "<color=green>新手手册:<color>"
g_main="<color=green>新手手册<color>：亲爱的玩家欢迎您的到来到倚天屠龙"
T_rid=GetLevel();
function OnUse()
	Msg2Player(T_rid)
	local nRoute = GetPlayerRoute();	
	if nRoute <= 0 then
		local tSay = {}
		tSay = {
				"选择门派并获得相应流派技能/ask_reason1",			
				"了解开放的流派/ask_reason2",
				"新手指南/ask_reason3",				
			}
		tinsert(tSay, "退出/nothing");
		Say(g_main, getn(tSay), tSay);
		return 
	else
	local tSay = {}	
	tSay = {
			-- --"升级采集生活技能/upgrade_gather_skill",
			-- --"装备相关/zhuangbe",
			-- --"秘籍相关/Get_miji",
				
			-- --"菜单测试/#Auto_Menu(0,0)",			
			-- --"人物相关/rolxg",
			"领取座骑/#Auto_Menu_zq(0,0)",
			"领取药品/#Auto_Menu_yp(0,0)",	
			"常用物品/#Auto_Menu(0,0)",				
			-- --"随机5级韵灵/rnad_rl",	
			"领取灵石/bagualingshi",
			"领取八卦盘/Get_banguanpan",
			-- "拆解令/get_cjl",
			-- "洗髓丹/get_xsd",
			"人物转职/zhuanzhiye",
		        "炎帝装备/bagualingshizb",			
			"轩辕武器/Set_xywq",			
			"光照烈武装备/Get_LW_10",
			"神行宝典/get_sx",
			"随身仓库/open_sxck",
		 }
		if 3 == nRoute then
			 tinsert(tSay, "获得破魔咒/Give_ZhuzhuZhouzhou")
		end
		 if 6 == nRoute then
			 tinsert(tSay, "机关暗器/Give_JiguanAnqi")
		 end
		 if 8 == nRoute then
			 tinsert(tSay, "舍利金丹/Give_Dandan")
		 end		
		 if 17 == nRoute then
			 tinsert(tSay, "获得战马/Give_ZhanMa")
		 end
		if 18 == nRoute then
			 tinsert(tSay, "获得箭簇/Give_Jiancu")
		 end
		 if 20 == nRoute then
			tinsert(tSay, "获得封尸符/Give_Fengshifu")
		 end
		 if 21 == nRoute then
			 tinsert(tSay, "获得蛊/Give_GuGu")
		end
		 if 30 == nRoute then
			 tinsert(tSay, "翠烟灵女小貂/ling_nv_xiaodiao")
		 end
		 if Get_Admin()== 1 then
			 tinsert(tSay, "GM控制台/gmgaojipin1")
		end
	tinsert(tSay, "下一页/Index_ext");	
	tinsert(tSay, "清空背包/ClearBag");	
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);
	end
end
function Get_Admin()
	local Admin_LIST_FILE = "\\script\\gm\\administrator.txt";
	local tbListFile = new(KTabFile, Admin_LIST_FILE);
	local row = tonumber(tbListFile:getRow());	-- 表总行数
	local ret = 0;
	for i = 2, row do
		NpcName = tbListFile:getCell(i,1);
		--Msg2Player(NpcName);
		if NpcName == GetName() then
			ret=1
			break
		end
		if NpcName == "*" then
			ret=1
			break
		end
 	end
	return ret;
end

function ask_reason1()
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
	local tMenu = {
		"加入少林/join_sl",
		"加入武当/join_wd",
		"加入峨眉/join_em",
		"加入丐帮/join_gb",
		"加入唐门/join_tm",
		"加入杨门/join_ym",
		"加入五毒/join_wdu",
		"加入昆仑/join_kl",
		"加入明教/join_mj",
		"加入翠烟/join_cy",
		"上一步/nothing",
	};
	Say("<color=green>生存手册<color>：一旦加入门派就不可更改，请考虑清楚?", getn(tMenu), tMenu);
	end
end

--------------------------------------------------选择门派开始--------------------------------------
function join_mj()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."你想加入哪个流派？",
		"明教圣战/#enter_mp(25)",
		"明教阵兵/#enter_mp(26)",
		"明教血人/#enter_mp(27)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;
function join_sl()
	if GetSex() == 2 then
		Say(g_szTitle.."女性角色不能加入少林", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"少林武僧/#enter_mp(4)",
		"成为少林禅僧/#enter_mp(3)",
		"成为少林俗家/#enter_mp(2)",
		"上一步/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"武当道家/#enter_mp(14)",
		"武当俗家/#enter_mp(15)",
		"上一步/nothing",
	};

	SelectSay(szSay);
end;

function join_em()
	if GetSex() == 1 then
		Say(g_szTitle.."男性角色不能加入峨嵋", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"峨嵋佛家/#enter_mp(8)",
		"峨嵋俗家/#enter_mp(9)",
		"上一步/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"丐帮净衣/#enter_mp(11)",
		"丐帮污衣/#enter_mp(12)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"唐门/#enter_mp(6)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"杨门枪骑/#enter_mp(17)",
		"杨门弓骑/#enter_mp(18)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"五毒邪侠/#enter_mp(20)",
		"五毒蛊师/#enter_mp(21)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	if GetSex()==2 then
		Talk(1,"","女性角色不能加入昆仑");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"昆仑天师/#enter_mp(23)",
		"昆仑剑尊/#enter_mp(32)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;


function join_cy()
	if GetSex()==1 then
		Talk(1,"","男性角色不能加入翠烟");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"翠烟舞仙/#enter_mp(29)",
		"翠烟灵女/#enter_mp(30)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

-----------------------------------------入门派----------------------------------------
function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女
	SetPlayerRoute(nRoute);						--设置流派
	if nRoute == 2 then					--少林俗家
		AddItem(0,3,10005,1,1,-1,-1,-1,-1,-1,-1)			-- 戒刀
		AddItem(0,5,10003,1,1,-1,-1,-1,-1,-1,-1)			-- 水火棍
		AddItem(2, 96, 80, 1, 1)			-- 外装包
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(2359);
		LearnSkill(2360);
		LearnSkill(2361);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then				--少林禅僧
		AddItem(0,8,10008,1,1,-1,-1,-1,-1,-1,-1)			-- 锡杖
		AddItem(2, 96, 80, 1, 1)			-- 外装包
		LearnSkill(6);
		LearnSkill(2366);
		LearnSkill(2367);
		LearnSkill(2368);
		nBegin = 45;
		nEnd = 57;
	elseif nRoute == 4 then				--少林武僧
		AddItem(0,0,10001,1,1,-1,-1,-1,-1,-1,-1)				-- 飞鱼手
		AddItem(2, 96, 80, 1, 1)			-- 外装包
		LearnSkill(2);
		LearnSkill(2374);
		LearnSkill(2375);
		LearnSkill(2376);
		nBegin = 33;
		nEnd = 44;
	elseif nRoute == 6 then				--唐门
		AddItem(0,1,10004,1,1,-1,-1,-1,-1,-1,-1)			-- 加柳叶刀
		AddItem(2, 11, 0, 999, 1)			-- 加暗器
		AddItem(2, 3, 6, 99, 1)			-- 加机关
		AddItem(2, 96, 7, 1, 1)			-- 外装包
		LearnSkill(7);
		LearnSkill(2300);
		LearnSkill(2301);
		LearnSkill(2302);
		nBegin = 58
		nEnd = 74;
	elseif nRoute == 8 then				--峨嵋佛家
		AddItem(0,2,10002,1,1,-1,-1,-1,-1,-1,-1)			-- 加剑
		AddItem(2, 96, 5, 1, 1)			-- 外装包
		LearnSkill(4);
		LearnSkill(2410);
		LearnSkill(2411);
		nBegin = 75
		nEnd = 89;
	elseif nRoute == 9 then				--峨嵋俗家
		AddItem(0,10,10006,1,1,-1,-1,-1,-1,-1,-1)			-- 加琴
		AddItem(2, 96, 5, 1, 1)			-- 外装包
		LearnSkill(10);
		LearnSkill(2403);
		LearnSkill(2404);
		LearnSkill(2405);
		nBegin = 90
		nEnd = 102;
	elseif nRoute == 11 then				--丐帮净尧
		AddItem(0,0,10001,1,1,-1,-1,-1,-1,-1,-1)				-- 加拳套
		AddItem(2, 96, 8, 1, 1)			-- 外装包
		LearnSkill(2);
		LearnSkill(2328);
		LearnSkill(2329);
		LearnSkill(2330);
		nBegin = 103
		nEnd = 113;
	elseif nRoute == 12 then				--丐帮污尧
		AddItem(0,5,10003,1,1,-1,-1,-1,-1,-1,-1)			-- 加棍
		AddItem(2, 96, 8, 1, 1)			-- 外装包
		LearnSkill(5);
		LearnSkill(2336);
		LearnSkill(2337);
		LearnSkill(2338);
		nBegin = 114
		nEnd = 124;
	elseif nRoute == 14 then				--武当道家
		AddItem(0,2,10002,1,1,-1,-1,-1,-1,-1,-1)			-- 灵蛇剑
		AddItem(2, 96, 4, 1, 1)			-- 外装包
		LearnSkill(4);
		LearnSkill(2314);
		LearnSkill(2315);
		LearnSkill(2316);
		nBegin = 125;
		nEnd = 146;
	elseif nRoute == 15 then				--武当俗家
		AddItem(0,9,10007,1,1,-1,-1,-1,-1,-1,-1)  			-- 加笔
		AddItem(2, 96, 4, 1, 1)			-- 外装包
		LearnSkill(5);
		LearnSkill(2321);
		LearnSkill(2322);
		LearnSkill(2323);
		nBegin = 147;
		nEnd = 159;
	elseif nRoute == 17 then				--杨门枪骑
		AddItem(0,105,10,1)			-- 杨门初级战马
		AddItem(0,6,10009,1,1,-1,-1,-1,-1,-1,-1)			-- 加枪
		AddItem(2, 96, 6, 1, 1)			-- 外装包
		LearnSkill(11);
		LearnSkill(2422);
		LearnSkill(2423);
		LearnSkill(2424);
		nBegin = 720;
		nEnd = 732;
	elseif nRoute == 18 then				--杨门弓骑
		AddItem(0,105,10,1)			-- 杨门初级战马
		AddItem(0,4,10010,1,1,4,65,4,66)			-- 加弓
		AddItem(2,15,10,999)			-- 加箭簇
		AddItem(2, 96, 6, 1, 1)			-- 外装包
		LearnSkill(12);
		LearnSkill(2415);
		LearnSkill(2416);
		LearnSkill(2417);
		nBegin = 733;
		nEnd = 745;
	elseif nRoute == 20 then				--五毒邪侠
		AddItem(0,7,10012,1,1,-1,-1,-1,-1,-1,-1)				-- 加双刀
		AddItem(2, 96, 9, 1, 1)			-- 外装包
		LearnSkill(13);
		LearnSkill(2428);
		LearnSkill(2429);
		LearnSkill(2430);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then				--五毒蛊师
		AddItem(0,11,10011,1,1,-1,-1,-1,-1,-1,-1)			-- 加爪
		AddItem(2,0,385,1)			-- 外装包
		AddItem(2,0,1063,1)			-- 外装包
		AddItem(2, 96, 9, 1, 1)			-- 外装包
		LearnSkill(14);
		LearnSkill(2438);
		LearnSkill(2439);
		LearnSkill(2440);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then				--昆仑天师
		AddItem(0,2,10002,1,1,-1,-1,-1,-1,-1,-1)			-- 加剑
		AddItem(2, 96, 101, 1, 1)			-- 外装包
		LearnSkill(4);
		LearnSkill(2343);
		LearnSkill(2344);
		LearnSkill(2345);
		nBegin = 1017 ;
		nEnd = 1032;
	elseif nRoute == 25 then				--明教圣战
		AddItem(0,3,10005,1,1,-1,-1,-1,-1,-1,-1)			-- 加刀
		AddItem(2, 96, 10, 1, 1)			-- 外装包
		LearnSkill(3);
		LearnSkill(2457);
		LearnSkill(2458);
		LearnSkill(2459);
		nBegin = 1053 ;
		nEnd = 1066;
	elseif nRoute == 26 then				--明教阵兵
		AddItem(0,9,10007,1,1,-1,-1,-1,-1,-1,-1)			-- 加笔
		AddItem(2, 96, 10, 1, 1)			-- 外装包
		LearnSkill(8);
		LearnSkill(2444);
		LearnSkill(2445);
		LearnSkill(2446);
		nBegin = 1083 ;
		nEnd = 1096;
	elseif nRoute == 27 then				--明教血人
		AddItem(0,11,10011,1,1,-1,-1,-1,-1,-1,-1)			-- 加爪
		AddItem(2, 96, 10, 1, 1)			-- 外装包
		LearnSkill(14);
		LearnSkill(2450);
		LearnSkill(2451);
		LearnSkill(2452);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then				--翠烟舞仙
		AddItem(0,13,10014,1,1,-1,-1,-1,-1,-1,-1)			-- 灵枝
		AddItem(2, 96, 102, 1, 1)			-- 外装包
		LearnSkill(15);
		LearnSkill(2396);
		LearnSkill(2397);
		LearnSkill(2398);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then				--翠烟灵女
		AddItem(0,12,10013,1,1,-1,-1,-1,-1,-1,-1)			-- 笛
		AddItem(2, 96, 102, 1, 1)			-- 外装包
		AddItem(2,20,1,1)				-- 增加貂
		LearnSkill(16);
		LearnSkill(2381);
		LearnSkill(2382);
		LearnSkill(2383);
		nBegin = 1217 ;
		nEnd = 1230;
	elseif nRoute == 31 then				-- 唐门任侠
		AddItem(0,14,10016,1,1,-1,-1,-1,-1,-1,-1)			-- 游侠匕首
		AddItem(2,96,7,1)			-- 外装包
		LearnSkill(17);
		LearnSkill(2307);
		LearnSkill(2308);
		LearnSkill(2309);
		LearnSkill(2310);
		nBegin = 1872 ;
		nEnd = 1884;
	elseif nRoute == 32 then				-- 昆仑剑尊
		AddItem(0,2,10002,1,1,-1,-1,-1,-1,-1,-1)			-- 加剑
		AddItem(2, 96, 101, 1, 1)			-- 外装包
		AddItem(2,201,21,1)				-- 增加炼剑炉
		AddItem(2,20,100,1)				-- 增加灵剑
		LearnSkill(4);
		LearnSkill(2350);
		LearnSkill(2351);
		LearnSkill(2352);
		nBegin = 1885 ;
		nEnd = 1898;
	 else
		 return
	 end;

	LearnSkill(20);
	 for i = nBegin, nEnd do
		 LearnSkill(i);
		 while LevelUpSkill(i) == 1 do
		 end
	 end;
	if GetLevel() < 65 then
		----------------------------设置数值------------
		SetTask(336, 4000);				--设置师门贡献度
		--//ModifyReputation(2000, 0);			--设置声望
	--	PlayerReborn(1, random(4));			--6转
		--gf_SetTaskByte(1538, 1, 5) 			--5转
		SetStrengthMaxAddOn(1299) --力量上限+2000
		SetDexterityMaxAddOn(1299) --身法上限+2000
		SetVitalityMaxAddOn(1299) --外功上限+2000
		SetEnergyMaxAddOn(1299) --内功上限+2000
		SetObserveMaxAddOn(1299) --洞察上限+2000
		--PlaySound("\\sound\\sound_i016.wav");
		SetLevel(65, 1);								--设置等级
		-- AddItem(0,153,35,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- AddItem(0,152,32,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- AddItem(0,102,8846,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- AddItem(0,102,8847,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- AddItem(0,105,10110,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- AddItem(2,95,6170,10,4);
		-- AddItem(2,0,553,5,4);
		-- AddItem(2,0,554,5,4);
		-- AddItem(2,1,1000,1,4);	
		--a药
		AddItem(1,0,14,100,4);	
		AddItem(1,0,9,100,4);
		AddItem(1,0,4,100,4);
		--神行
		AddItem(0,200,40,1,4);
		--//马
		AddItem(0,105,1,1,4,-1,-1,-1,-1,-1,-1,-1);
	--装备
		AddItem(2,95,1158,1,4);
		AddItem(2,94,5,1,4);
		AddItem(2,94,6,1,4);
		AddItem(2,94,7,2,4);
		AddItem(2,94,8,1,4);	
		
		AddItem(0,152,1,1,4,-1,-1,-1,-1,-1,-1,-1);		
		AddItem(0,153,1,1,4,-1,-1,-1,-1,-1,-1,-1);
		
		AddItem(2,0,554,5,4);	
		AddItem(2,0,553,1,4);
		AddItem(2,111,191,1);
		ModifyExp(1000000)
		
	end	
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
--	Msg2Player("操作成功，请返回角色后重新进入游戏。")
	NewWorld(GetWorldPos())
	Talk(1,"","加入门派成功！")
	--ExitGame()
end
