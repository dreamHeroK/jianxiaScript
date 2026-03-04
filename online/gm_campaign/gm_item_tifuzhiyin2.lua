--体服指引

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\gmgaojipin.lua")
Include("\\script\\online\\gm_campaign\\gm_book.lua")
Include("script\\online\\gm_campaign\\gm_book_joinRoute.lua")
Include("script\\online\\gm_campaign\\gm_book_getEquipment.lua") 
g_szTitle = "<color=green>剑网贰指引:<color>"
MISSION_mima = "kp476499498"  --密码  ---GM宝典

function OnUse(nItem)
	if 1 ~= IsExpSvrSystemOpen() then
		return
	end
	
	local tSay = {}
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		tSay = {
			"加入门派和升级/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
		--	format("%s/getTiLi", "获得体力"),
			  "获取坐标/chaxunzuobiao",
			--"领取光昭烈武套/Get_YaoYang_10",
			--"领取新手装备/xqx_Equipment_getSchool3",
			  "获取药品/Get_Yaopin",
			--"获取新手套/Get_YaoYang_10",
			  "秘籍秒修/Get_Book_Update",
			  "东皇材料/Get_XiSuiDan",
			  "龙隐材料/Get_Longyingcailiao",
			  "获取金子/Get_Money",
			  "获取诀要/Get_Book_JueYao",
			  "获取强化/Get_Yigui",
			  "获取灵石/Get_LingShi",
			  "获取密令/Get_Qianbian",
			  "获得称号/Get_XiaoJieSan",
			  "获取秘籍/Get_yingxiongtie",
			  "获得礼包/Get_JinXi",
			  "真武材料/Get_Zhenwu",
		   -- "获得坐骑/Get_ZuoQi",
			--"获得1000金/Get_Money",
			  "获得师门套/Get_HeShiBi",    --之前是蛊材料
			  "获得经验丹/Get_JinyanDdan",
			--"帮会操作/TongOperation",
		 	--"补充精力/Get_Energy",
			--"生活技能/Life_Skill",
			--"获得峨眉辅助套/Get_FuZhu",
		     "武少补学诛邪/BuXueZhuXie",
			 "佛家补学诛邪/BuXueZhuXiejineng",
			 "俗琴补学诛邪/BuXueQingZhuXiejineng",
			-- "转治物品保管员/wpbgy",	
		    --"太虚盘领取/baguazhuangbei",  错误的
			--"GM发布重启公告/fabuggao",	
			"换职业（需重登游戏）/xqx_Skill_joinRoute",
			"属性上限突破至2999/ShuXingTuPo",	
			"随身仓库/ask_chuwux",	
			--format("%s/getTianJiaoLing", "获得天骄令"),
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
		if 32 == nRoute then
			tinsert(tSay, "昆仑剑尊灵剑/jianzunlingjian")
		end
	end
	tinsert(tSay, "清空背包/ClearBag");
	tinsert(tSay, "退出/nothing");
	Say(g_szTitle.."你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
end


function chaxunzuobiao()
	local nW,nX,nY = GetWorldPos()
	 Msg2Player("坐标工具:地图编号ID是："..nW..",坐标:"..nX.."/"..nY.."")
	
end

function Get_Money()
	if GetCash() < 40000000 then
		Earn(1000000000 - GetCash());
	end
end


function Get_yingxiongtie()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 95, 617, 50);
	AddItem(0, 112, 301, 1);
	AddItem(0, 112, 302, 1);
	AddItem(0, 112, 303, 1);
	AddItem(0, 112, 304, 1);
	AddItem(0, 112, 305, 1);
	AddItem(0, 112, 306, 1);
	AddItem(0, 112, 307, 1);
	AddItem(0, 112, 310, 1);
	AddItem(0, 112, 311, 1);
	AddItem(0, 112, 315, 1);
	AddItem(0, 112, 317, 1);
	AddItem(0, 112, 318, 1);
	AddItem(0, 112, 309, 1);
	AddItem(0, 112, 312, 1);
	AddItem(0, 112, 320, 1);
	AddItem(0, 112, 319, 1);
	AddItem(0, 112, 321, 1);
	AddItem(0, 112, 322, 1);
	AddItem(0, 112, 323, 1);
end



function wpbgy()
SetTask(1, 26);
Talk(1,"","可以拿兔子尾巴去开启物品保管了。")
end
function zhancsw()
	ModifyReputation(5000,0)
	end
function zhancsws()
	SetTask(704,6)
	end
	function zhancswl()
	SetTask(704,-6)
	end	

function msy()
	OpenPop(0)
end
function lsm()
	OpenPop(1)
end
function pjlm()
	OpenPop(2)
end
function shrw()
	OpenPop(3)
end
function wlmsw()
	OpenPop(4)
end
function zcfsw()
	OpenPop(5)
end
function dmfsw()
	OpenPop(6)
end
function zlssw()
	OpenPop(7)
end
function wxfsw()
	OpenPop(8)
end
function hnfsw()
	OpenPop(9)
end
function qlzsw()
	OpenPop(10)
end
function jmsw()
	OpenPop(11)
end
function bbsw()
	OpenPop(12)
end
function dlssw()
	OpenPop(13)
end
function sxfsw()
	OpenPop(14)
end
function gyhsw()
	OpenPop(15)
end
function hssw()
	OpenPop(16)
end
function zysw()
	OpenPop(17)
end
function quankaiq()
	OpenPop(0)
	OpenPop(1)
	OpenPop(2)
	OpenPop(3)
	OpenPop(4)
	OpenPop(5)
	OpenPop(6)
	OpenPop(7)
	OpenPop(8)
	OpenPop(9)
	OpenPop(10)
	OpenPop(11)
	OpenPop(12)
	OpenPop(13)
	OpenPop(14)
	OpenPop(15)
	OpenPop(16)
	OpenPop(17)
end
function no()
end

function zhuanzhiyeQ()
	SetPlayerRoute(ID)
	ExitGame()

end
function zhuanzhiye()
	local szSay = {
		g_szTitle.."转职业会变成无门派，重新加入门派原本的镇派等级会变成1级，会自动退出游戏，你确定要转职业吗？",
		"确定转职/zhuanzhiyeQ",
		"不了退出/nothing",
	};
	SelectSay(szSay);
end

function bagualingshi()
	lspf_AddLingShiInBottle(1,500)
	lspf_AddLingShiInBottle(2,500)
	lspf_AddLingShiInBottle(3,500)
	lspf_AddLingShiInBottle(4,500)
	lspf_AddLingShiInBottle(5,500)
	lspf_AddLingShiInBottle(6,500)
	--lspf_AddLingShiInBottle(7,500)
	Msg2Player("领取成功，灵石已经存放于你的聚灵鼎中(襄阳公冶兵处可领取聚灵鼎)。")
end


function shuashuxing()
	SetLevel(99,999 * 5)

end

function ShuXingTuPo()
	SetStrengthMaxAddOn(2000) --力量上限+2000  
	SetDexterityMaxAddOn(2000) --身法上限+2000
	SetVitalityMaxAddOn(2000) --外功上限+2000
	SetEnergyMaxAddOn(2000) --内功上限+2000
	SetObserveMaxAddOn(2000) --洞察上限+2000

end

function getTianJiaoLing()
	AddItem(2,97,236,100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "激活宠物"))
	end
	tinsert(tSay, format("%s/getPetEgg", "获得宠物食品"))
	tinsert(tSay, format("%s/getLingLi", "Nh薾 甶觤 linh l鵦"))
	tinsert(tSay, "上一步/nothing");
	Say(g_szTitle.."Ngi c莕 gi髉  g?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("Х h鋍 Gi竛g Linh Thu藅 c蕄 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function Process_SanJianTao()
   if 1 ~= gf_Judge_Room_Weight(15, 1, g_szTitle) then
		return 0;
	end
	for i=26,28 do
    local pifeng,pIndex	=AddItem(0,154,i,1,1,-1,-1,-1,-1,-1,-1,0,1)
    FeedItem(pIndex,1000000)
		local huizhang,hIndex	=AddItem(0,153,i,1,1,-1,-1,-1,-1,-1,-1,0,1)
		FeedItem(hIndex,1000000)
		local xie,xIndex	=AddItem(0,152,i,1,1,-1,-1,-1,-1,-1,-1,0,1)
		FeedItem(xIndex,1000000)
	end
end

function getPetEgg()
	AddItem(2,1,30601,10)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getLingLi()
	local nAdd = 10000
	local nTask = 1535
	local nCur = GetTask(nTask) / 100
	if nCur < 1000000 then
		nCur = nCur + nAdd
		SetTask(nTask, nCur*100)
		Msg2Player(format("Nh薾 th祅h c玭g %d linh l鵦", nAdd))
	end
end

function Process_Equip_LingTu()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		for i=30221,30222 do 
			AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1,1)
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		if nRoute == 2 then
            AddItem(0,3,30207,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 3 then
            AddItem(0,8,30208,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 4 then
            AddItem(0,0,30209,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 6 then
            AddItem(0,1,30210,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 8 then
            AddItem(0,2,30211,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 9 then
            AddItem(0,10,30212,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 11 then
            AddItem(0,0,30213,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 12 then
            AddItem(0,5,30214,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 14 then
            AddItem(0,2,30215,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 15 then
            AddItem(0,9,30216,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 17 then
            AddItem(0,6,30217,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 18 then
            AddItem(0,4,30218,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 20 then
            AddItem(0,7,30219,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 21 then
            AddItem(0,11,30220,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 23 then
            AddItem(0,2,30221,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 29 then
            AddItem(0,13,30222,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 30 then
            AddItem(0,12,30223,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nBody == 1 then
			AddItem(0,101,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30239,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30243,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 2 then
			AddItem(0,101,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30240,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30244,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 3 then
			AddItem(0,101,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30241,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30245,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 4 then
			AddItem(0,101,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30242,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30246,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
end

function JoinRoute_UpdateLevel()
	if GetPlayerFaction() ~= 0 then
		Talk(1,"",format("Ngi  gia nh藀 m玭 ph竔 r錳, ta kh玭g th?gi髉 頲 g?"));
		return 0;
	end
	local tMenu = {
		"加入少林/join_sl",
		"加入武当/join_wd",
		"加入峨眉/join_em",
		"加入丐帮/join_gb",
		"加入唐门/join_tm",
		"加入杨门/join_ym",
		"加入五毒/join_wdu",
		"加入昆仑/join_kl",
		"加入翠烟/join_cy",
		"加入明教/join_mj",
		"上一步/nothing",
	};
	Say("加入门派吗?加门派后需要重新登陆游戏", getn(tMenu), tMenu);
end

--------------------------------------------------选择门派开始--------------------------------------
function join_sl()
	if GetSex() == 2 then
		Say(g_szTitle.."女性角色不能加入少林", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
		"唐门/#enter_mp(6)",
		"唐门任侠/#enter_mp(31)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
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
		g_szTitle.."你想加入哪个流派？",
		"翠烟舞仙/#enter_mp(29)",
		"翠烟灵女/#enter_mp(30)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

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

-----------------------------------------入门派----------------------------------------
function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

	SetPlayerRoute(nRoute);						--设置流派

	if nRoute == 2 then	          --少林俗家
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
	elseif nRoute == 14 then					--武当道家
		LearnSkill(4);
		LearnSkill(146);

		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--武当俗家
		LearnSkill(5);
		LearnSkill(159);

		nBegin = 147;
		nEnd = 158;
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
	elseif nRoute == 6 then					--唐门
		LearnSkill(7);
		LearnSkill(74);

		nBegin = 58
		nEnd = 73;
	elseif nRoute == 5 then					--唐门任侠
		LearnSkill(7);
		LearnSkill(2307);
		nBegin = 2313;
		nEnd = 2308;		
	elseif nRoute == 17 then					--杨门枪骑
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
		LearnSkill(1898);
	
		nBegin = 1885 ;
		nEnd = 1897;
	elseif nRoute == 31 then					--唐门任侠
		LearnSkill(17);
		LearnSkill(1902);
		LearnSkill(1903);

		nBegin = 1872;
		nEnd = 1885;
	else
		return
	end;

	LearnSkill(20);

	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;

	----------------------------设置数值------------
	SetTask(336, 10000);				--设置师门贡献度
	ModifyReputation(10000, 0);			--设置声望
--	PlayerReborn(1, random(4));			--6转
--	gf_SetTaskByte(1538, 1, 5) 			--5转
	SetLevel(80, 1);								--设置等级
	SetStrengthMaxAddOn(0) --力量上限+2000
	SetDexterityMaxAddOn(0) --身法上限+2000
	SetVitalityMaxAddOn(0) --外功上限+2000
	SetEnergyMaxAddOn(0) --内功上限+2000
	SetObserveMaxAddOn(0) --洞察上限+2000
	AddItem(0,105,10111,1,4,3,403)--太清无尘剑 御剑
	AddItem(0,105,199,1,4,3,403)-- 雪玖坐骑
	AddItem(0,153,6,1,4,-1,-1,-1,-1,-1,-1,-1,15,0)--光昭烈武令
	AddItem(0,152,6,1,4,-1,-1,-1,-1,-1,-1,-1,15,0)--光昭烈武披风
	AddItem(2,95,5448,2,4)--光昭烈武首饰箱两个
	AddItem(2,95,3281,3,4)--光昭烈武首饰箱三个
	AddItem(2,95,3282,1,4)--光昭烈武首饰箱三个
	AddItem(2,0,351,50,4)--露水50个
	AddItem(0,200,40,1,4)--神行宝典
	AddItem(2,1,1007,1,4)--大白驹
	AddItem(2,0,31,10,4)--英雄贴10个
	AddItem(2,0,398,10,4)--般若树种10个
	AddItem(2,95,247,10,4)--千变梵天卷10个
	AddItem(1,0,6,500,4);--药
	AddItem(1,0,11,500,4);--药
	AddItem(1,0,16,500,4);--药
	AddItem(2,0,553,1,4);--1个大人参果
	AddItem(2,0,554,5,4)--修真要诀5
	AddItem(2,95,617,1,4)--师门真卷包裹
	AddItem(2,97,236,20,4)--天骄令
    AddItem(2,114,5,1,4)--光武精魄
	AddItem(0,154,109,1,4,-1,-1,-1,-1,-1,-1,-1,0)--9级侠义令1个
	AddItem(2,95,1463,1,4)--新再战江湖称号1个
	AddItem(2,1,1005,1,4)--战神丸
	AddItem(2,144,4,1,4)--头部蕴灵1个
	AddItem(2,144,7,1,4)--上衣蕴灵1个
	AddItem(2,144,10,1,4)--下裤蕴灵1个
	AddItem(2,0,555,1,4)--乾坤符1个
	Msg2Global("欢迎大侠"..GetName().."来到 [再战江湖情怀版]成功获取入门光昭烈武装备套");  
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	Msg2Player("操作成功，请返回角色后重新进入游戏。")
	Talk(1,"","操作成功，请返回角色后重新进入游戏。")
end

function Get_YaoYang_10()
	if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		for i=8840,8841 do
				AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1)
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 10;
		if nRoute == 2 and nBody ==1 then 
				AddItem(0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 2 and nBody ==2 then 
				AddItem(0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 3 and nBody ==1 then 
				AddItem(0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 3 and nBody ==2 then 
				AddItem(0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 4 and nBody ==1 then 
				AddItem(0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 4 and nBody ==2 then 
				AddItem(0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 6 and nBody ==1 then 
				AddItem(0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 6 and nBody ==2 then 
				AddItem(0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 6 and nBody ==3 then 
				AddItem(0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 6 and nBody ==4 then 
				AddItem(0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 8 and nBody ==3 then 
				AddItem(0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 8 and nBody ==4 then 
				AddItem(0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end

		if nRoute == 9 and nBody ==3 then 
				AddItem(0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 9 and nBody ==4 then 
				AddItem(0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 11 and nBody ==1 then 
				AddItem(0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 11 and nBody ==2 then 
				AddItem(0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 11 and nBody ==3 then 
				AddItem(0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 11 and nBody ==4 then 
				AddItem(0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end

		if nRoute == 12 and nBody ==1 then 
				AddItem(0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 12 and nBody ==2 then 
				AddItem(0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 12 and nBody ==3 then 
				AddItem(0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 12 and nBody ==4 then 
				AddItem(0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 14 and nBody ==1 then 
				AddItem(0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 14 and nBody ==2 then 
				AddItem(0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 14 and nBody ==3 then 
				AddItem(0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 14 and nBody ==4 then 
				AddItem(0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 15 and nBody ==1 then 
				AddItem(0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 15 and nBody ==2 then 
				AddItem(0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 15 and nBody ==3 then 
				AddItem(0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 15 and nBody ==4 then 
				AddItem(0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 17 and nBody ==1 then 
				AddItem(0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 17 and nBody ==2 then 
				AddItem(0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 17 and nBody ==3 then 
				AddItem(0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 17 and nBody ==4 then 
				AddItem(0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end

		if nRoute == 18 and nBody ==1 then 
				AddItem(0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 18 and nBody ==2 then 
				AddItem(0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 18 and nBody ==3 then 
				AddItem(0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 18 and nBody ==4 then 
				AddItem(0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end

		if nRoute == 20 and nBody ==1 then 
				AddItem(0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 20 and nBody ==2 then 
				AddItem(0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 20 and nBody ==3 then 
				AddItem(0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 20 and nBody ==4 then 
				AddItem(0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 21 and nBody ==1 then 
				AddItem(0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 21 and nBody ==2 then 
				AddItem(0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 21 and nBody ==3 then 
				AddItem(0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 21 and nBody ==4 then 
				AddItem(0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 23 and nBody ==1 then 
				AddItem(0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 23 and nBody ==2 then 
				AddItem(0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 25 and nBody ==1 then 
				AddItem(0,100,3176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,9007,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 25 and nBody ==2 then 
				AddItem(0,100,3177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,9007,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 25 and nBody ==3 then 
				AddItem(0,100,3178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,9007,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 25 and nBody ==4 then 
				AddItem(0,100,3179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,9007,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end

		if nRoute == 26 and nBody ==1 then 
				AddItem(0,100,3180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9008,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 26 and nBody ==2 then 
				AddItem(0,100,3181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9008,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 26 and nBody ==3 then 
				AddItem(0,100,3182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9008,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 26 and nBody ==4 then 
				AddItem(0,100,3183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,9008,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end

		if nRoute == 27 and nBody ==1 then 
				AddItem(0,100,3184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9009,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 27 and nBody ==2 then 
				AddItem(0,100,3185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9009,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		
		if nRoute == 27 and nBody ==3 then 
				AddItem(0,100,3186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9009,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 27 and nBody ==4 then 
				AddItem(0,100,3187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,9009,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 29 and nBody ==3 then 
				AddItem(0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 29 and nBody ==4 then 
				AddItem(0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 30 and nBody ==3 then 
				AddItem(0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
		if nRoute == 30 and nBody ==4 then 
				AddItem(0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		end
end

function Get_JinShe()
		if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 1;
		if nRoute == 2 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,186,164,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,186,164,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,186,164,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 3 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 4 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		
		if nRoute == 6 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 8 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		

		if nRoute == 9 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end

		if nRoute == 11 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
			--	FeedItem(xIndex,1000000)
		end

		if nRoute == 12 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,178,758,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,178,758,754,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,163,178,758,754,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 14 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 15 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 17 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
			--	FeedItem(xIndex,1000000)
		end

		if nRoute == 18 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
			--	FeedItem(xIndex,1000000)
		end

		if nRoute == 20 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,179,758,755,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,179,758,755,630)
				FeedItem(hIndex,1000000)
		--		local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		--		SetItemFeedUpAttrs(xIndex,188,163,179,758,755,1004)
		--		FeedItem(xIndex,1000000)
		end
		
		if nRoute == 21 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,180,760,756,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,180,760,756,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,180,760,756,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 23 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 25 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 26 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		--		SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 27 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
			--	FeedItem(xIndex,1000000)
		end
		
		if nRoute == 29 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
			--	FeedItem(xIndex,1000000)
		end

		if nRoute == 30	then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
			--	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
			--	SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
			--	FeedItem(xIndex,1000000)
		end
	
end

function Get_Book()
	local szSay = {
		g_szTitle.."获得决要",
		--"获得真卷/Get_Book_ZhenJuan",
		--"获得凌波全本/Get_Book_LBQB",
		--"获得逍遥秘籍/Get_Book_XYMJ",
	    --"获得诀要/Get_Book_JueYao",
		--"获得四灵无双全本/Get_SiLing",
		--"获得修罗秘籍/Get_XiuLuo",
		--"获得紫霞天霞沾衣金禅/Get_ZiXia",
		  "秘籍升级/Get_Book_Update",
		"上一步/nothing",
	};
	SelectSay(szSay);
end

function Get_Book_ZhenJuan()
	if gf_Judge_Room_Weight(5, 1, g_szTitle) ~= 1 then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 204,5)
--		AddItem(0, 107, 204-38,5)
	end
	
		if nRoute == 3 then
		AddItem(0, 107, 206,5)
--		AddItem(0, 107, 206-38,5)
	end
	
		if nRoute == 4 then
		AddItem(0, 107, 205,5)
--		AddItem(0, 107, 205-38,5)
	end
	
		if nRoute == 6 then
		AddItem(0, 107, 207,5)
--		AddItem(0, 107, 207-38,5)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 208,5)
--		AddItem(0, 107, 208-38,5)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 209,5)
--		AddItem(0, 107, 209-38,5)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 210,5)
--		AddItem(0, 107, 210-38,5)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 211,5)
--		AddItem(0, 107, 211-38,5)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 212,5)
--		AddItem(0, 107, 212-38,5)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 213,5)
--		AddItem(0, 107, 213-38,5)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 214,5)
--		AddItem(0, 107, 214-38,5)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 215,5)
--		AddItem(0, 107, 215-38,5)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 216,5)
--		AddItem(0, 107, 216-38,5)
	end
	
			if nRoute == 21 then
		AddItem(0, 107, 217,5)
--		AddItem(0, 107, 217-38,5)
	end
	
	if nRoute == 23 then--昆仑天师
		AddItem(0, 107, 218,5)
--		AddItem(0, 107, 218-20,5)
	end
	
	if nRoute == 29 then--舞仙
		AddItem(0, 107, 222,5)
--	  AddItem(0, 107, 222-20,5)
	end
	
	if nRoute == 30 then--灵女
		AddItem(0, 107, 223,5)
--		AddItem(0, 107, 223-20,5)

	end
	
end

function Get_Book_LBQB()
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end

	AddItem(0, 112, 158, 1,4);
end

function Get_SiLing()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(0, 107, 165, 1);
end

function Get_XiuLuo()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(0, 107, 60, 1);
end

function Get_ZiXia()
	if gf_Judge_Room_Weight(4, 1) ~= 1 then
		return 0;
	end

	AddItem(0, 107, 65, 1);
	AddItem(0, 107, 64, 1);
	AddItem(0, 107, 66, 1);
	AddItem(0, 107, 59, 1);
end

function Get_Book_XYMJ()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(0, 112, 224, 1);
end

function Get_DaRenShen()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 0, 553, 1);
end

function Get_XiuZhen()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 0, 554, 9);
end

function Get_WuHenShui()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 1, 503, 4);
end

function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
		[31]	={241,250},
		[32]	={251,255},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "决要");
	end
end

function fabuggao()
	
	local tSay = {}
	tSay = {
			"确定要维护/fabuggao1",
		}
	tinsert(tSay, "\n退出/gmgaojipin");
	Say("GM卡：维护公告是否执行。", getn(tSay), tSay);



end






function zidyi()
	zidyiggneir = ""
	zidyiggneir2 = ""
	--zidyiggneir3 = ""
	AskClientForString("s_zidyi1","10分钟后进行例行维护！",1,32,"输入公告内容");--自定义广告内容
	
end

function s_zidyi1(sLeaveMsg)
	zidyiggneir2 = zidyiggneir..""..sLeaveMsg
	AskClientForString("s_zidyi2","维护时间",1,32,"输入公告内容");--自定义广告内容
end
function s_zidyi2(sLeaveMsg)
	zidyiggneir3 = zidyiggneir2..""..sLeaveMsg
	AskClientForString("zidyi2","",1,32,"输入公告内容");--自定义广告内容
end


function s_zidyi2(sLeaveMsg)
	zidyiggneir = zidyiggneir2..""..sLeaveMsg
	local tSay = {}
	tSay = {
			"发布该公告/fbgggao",
		--	"关闭/gmgaojipin",	
		}
	tinsert(tSay, "\n退出/gmgaojipin");
	Say("GM卡：当前公告内容\n\n<color=green>"..zidyiggneir.."<color>", getn(tSay), tSay);



end
function fbgggao()
	Msg2SubWorld(""..zidyiggneir);--全服广播
    AddLocalNews(""..zidyiggneir);--滚动通知
	gmgaojipin() --返回主界面
end	

function fabuggao1()
	Msg2SubWorld("本服将进行例行维护更新，角色数据服务器存储完毕！！！");--全服广播
    AddLocalNews("本服将进行例行维护更新，角色数据服务器存储完毕！！！");--滚动通知
	z_Playercunpan()
end

function z_Playercunpan()
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
    z_Playercun(player) 
    player = NextPlayer(player)	
	end
end
function z_Playercun(nIndex)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	SaveNow()
	Msg2Player("大侠:"..sName.." 本服例行维护！角色数据服务器存储完毕。");
	local tSay = {}
	tSay = {
		}
	tinsert(tSay, "\n确定收到通知/gonot");
	Say("剑网贰例行维护公告\n\n<color=green>"..sName.."<color>:你好，本服例行维护，角色数据服务器存储完毕。", getn(tSay), tSay);
	
	PlayerIndex = nOldPlayer
	return 
end
function gonot()
end

function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_Money()
	if GetCash() < 900000000 then
		Earn(900000000 - GetCash());
	end
end

function Give_ZhuzhuZhouzhou()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 3, 4, 99);
	AddItem(2, 3, 12, 99);	
end

function Give_JiguanAnqi()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end
  for i = 1,9 do
		AddItem(2, 11, i, 2000, 4);
	end
	AddItem(2, 3, 6, 999, 4);	
end

function Give_Dandan()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 7, 100, 4);
end

function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
    AddItem(0,105,51,1,1,-1,-1,-1,-1,-1,-1,-1,0);
end

function Give_Jiancu()
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		return 0;
	end
	AddItem(2, 15, 10, 2000);
    AddItem(0,105,38,1,1,4,-1);
end

function Give_Fengshifu()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end
	AddItem(1, 7, 46, 50, 4);
	AddItem(1, 7, 146,50, 4);
	AddItem(1, 7, 147,50, 4);
	AddItem(1, 7, 148,50, 4);
	AddItem(1, 7, 154,50, 4);
	AddItem(1, 7, 10000,100, 4);
end

function Give_GuGu()
	if gf_Judge_Room_Weight(32, 1) ~= 1 then   --蛊的妖
		return 0;
	end
	AddItem(2, 17, 1, 999);
	AddItem(2, 17, 2, 999);
	AddItem(2, 17, 3, 999);
	AddItem(2, 17, 4, 999);
	AddItem(2, 17, 5, 999);
	AddItem(2, 17, 6, 999);
	AddItem(2, 17, 7, 999);
	AddItem(2, 17, 8, 999);
	AddItem(2, 17, 9, 999);
	AddItem(2, 17, 10,999);
	AddItem(2, 17, 11, 999);
	AddItem(2, 17, 12, 999);
	AddItem(2, 17, 13, 999);
	AddItem(2, 17, 14, 999);
	AddItem(2, 17, 15,999);
	AddItem(2, 17, 16, 999);
	AddItem(2, 17, 17, 999);
	AddItem(2, 17, 18, 999);
	AddItem(2, 17, 19, 999);
	AddItem(2, 17, 20, 999);
	AddItem( 2, 17, 21, 999);
	AddItem(2, 17, 22, 999);
	AddItem(2, 17, 23, 999);
	AddItem(2, 17, 24, 999);
	AddItem(2, 17, 25, 999);
	AddItem(2, 17, 26, 999);
	AddItem(2, 17, 27, 999);
	AddItem(2, 17, 28, 999);
	AddItem(2, 17, 29, 999);
	AddItem(2, 17, 30, 999);
	AddItem(2, 17, 31, 999);

	
  for i = 1,31 do
		AddItem(2, 17, i, 99, 4);
	end

	if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
		AddItem(2, 0, 1063, 1);
	end
end

function jianzunlingjian()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
--	AddItem(2, 20, random(50, 55), 1, 4);
    AddItem(2, 20, 54, 1, 4);
end


function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "获得小貂/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "获得七尾貂/Give_QiWeiDiao";
	szSay[getn(szSay) + 1] = "获得小貂食物/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "喂貂/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "上一步/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end


function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(1, 5), 1, 4);
end

function Give_QiWeiDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(19, 24), 1, 4);
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
		Msg2Player("C竎 h?ch璦 c?th?c璶g, 你好像没有貂！");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C竎 h?ch璦 c?th?c璶g, kh玭g th?ti課 h祅h hu蕁 luy謓!");
		return
	end

	for i = 1, 84 do
		LevelUpPet(nPetItemIndex)
	end
end
-------------------------------------------------
function ClearBag()
	
	if GetTask(99) == 5 then
		gmgaojipin()
		return 
	else	
		AskClientForString("leave","清空背包",1,32,"确定清空背包");
		
	end
	
end
function leave(masli)
	if masli == "清空背包" then  -- GM密码
		ClearBagAllItem ()
		return 0
	end
	
	if masli == MISSION_mima then  -- GM密码
		gmgaojipin  ()
		return 
	end
	
end
-------------------------------------------------------------


function ClearBagAllItem(bTag)
	if GetItemCount(2,95,34510) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end
	if GetItemCount(2,95,34520) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end	
	if GetItemCount(2,95,34530) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end	
	if GetItemCount(2,95,34540) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end	
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."确定要清空背包吗?", 2, "是的/#ClearBagAllItem(1)", "不/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,103,500,1)  --清空背包后添加GM宝典
		AddItem(2,95,572, 1);--清空背包后添加御萱千变盒
		AddItem(2,114,5, 1,4);--清空背包后添加光武精破
		AddItem(2,114,170, 1,4);--清空背包后添加东皇精魄
		AddItem(0,200,40, 1,4);--清空背包后添加神行宝典
		
	end
end

function TongOperation()
	local szSay = {
		g_szTitle.."帮会操作",
		"建立帮会/TongOperation_Create",
		"帮会升级/TongOperation_update",
		"上一步/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","你早就已经有帮会了");
		return
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	--if GetItemCount(2,0,555) < 1 then
	--	AddItem(2,0,555,1)
	--end
	if GetItemCount(2,0,125) < 1 then
  	AddItem(2,0,125,1)
  end
  if GetReputation() < 2000 then
  	ModifyReputation(2000 - GetReputation(), 0)
  end
  if GetCash() < 5000000 then
  	Earn(5000000 - GetCash())
  end
  CreateTongDialog()
end


function TongOperation_update()
	if GetTongLevel() < 3 then
		AddTongLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function GetJingMai()
	local szSay = {
		g_szTitle.."经脉相关",
		"重置经脉/GetJingMai_Reset",
		format("%s/getZhenqi", "获得经脉"),
		format("%s/getJingMaiTongRen", "获得经脉铜人？"),
		"上一步/nothing",
	};
	if MeridianGetLevel() < 4 then
		tinsert(szSay, 2, "经脉升级/GetJingMai_Update")
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getJingMaiTongRen()
	AddItem(2, 1,30730, 10)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 4 do
		MeridianUpdateLevel()
	end
	local nNum = 600000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."确定要重置经脉？", 2,"是的/#GetJingMai_Reset(1)", "取消/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function player_reborn()
--	PlayerReborn(2, random(4));			--6转
--	gf_SetTaskByte(1538, 1, 5) 			--5转
	SetLevel(99, 1);								--设置等级
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function Get_Energy()
	local nCur, nMax = ModifyEnergy(0, 1);
	ModifyEnergy(nMax - nCur, 1);
end

function Life_Skill()
	local tSay = {
		"升级采集技能/upgrade_gather_skill",
		"升级制作技能/upgrade_compose_skill",
		"获得领土装备材料/get_lingtu_equip_material",
		"上一步/nothing",
	}
	Say(g_szTitle.."采集技能相关", getn(tSay), tSay);
end

function upgrade_gather_skill()
	local tGather = {1, 2, 5, 6};
	local tName = {"цn c﹜", "L祄 da", "Уo kho竛g", "K衞 t?"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(0, v)
		local nMax = GetLifeSkillMaxLevel(0, v);
		if nMax > nCur then
			local msg = g_szTitle..format("Hi謓 t筰 ch?c?th?th╪g c蕄 k?n╪g %s, <color=gold>%s<color> 產ng t c蕄 <color=green>%d<color>, mu鑞 th╪g c蕄 <color=gold>%s<color> n c蕄 <color=green>%d<color> kh玭g?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("是/#upgrade_gather_skill_do(%d, %d)", v, nMax), "不/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh玭g c?k?n╪g s鑞g c?th?th╪g c蕄, h穣 甶 t譵 NPC  h鋍 v?th╪g c蕄 gi韎 h筺 k?n╪g n c蕄 99")
end

function upgrade_gather_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(0, nSkill), nMax do
		AddLifeSkillExp(0, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","Hi謓  ho祅 th祅h th╪g c蕄 k?n╪g, 技能升到最高级了!")
	end
	Msg2Player(format("当前技能等级   %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function upgrade_compose_skill()
	local tGather = {2, 3, 4, 5, 9, 10};
	local tName = {"Ch?t筼 binh kh?d礽", "Ch?t筼 binh kh?ng緉", "Ch?t筼 k?m玭 binh kh?", "L祄 h?gi竝", "H?trang", "u qu竛"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(1, v)
		local nMax = GetLifeSkillMaxLevel(1, v);
		if nMax > nCur then
			local msg = g_szTitle..format("Hi謓 t筰 ch?c?th?th╪g c蕄 k?n╪g %s, <color=gold>%s<color> 產ng t c蕄 <color=green>%d<color>, mu鑞 th╪g c蕄 <color=gold>%s<color> n c蕄 <color=green>%d<color> kh玭g?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("是的/#upgrade_compose_skill_do(%d, %d)", v, nMax), "不/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh玭g c?k?n╪g s鑞g c?th?th╪g c蕄, h穣 甶 t譵 NPC  h鋍 v?th╪g c蕄 gi韎 h筺 k?n╪g n c蕄 99")
end

function upgrade_compose_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(1, nSkill), nMax do
		AddLifeSkillExp(1, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","Hi謓  ho祅 th祅h th╪g c蕄 k?n╪g, 技能升到最高级了!")
	end
	Msg2Player(format("当前技能等级  %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function get_lingtu_equip_material()
	if gf_Judge_Room_Weight(18, 100) ~= 1 then
		Talk(1,"",format("背包空间不够  %d 格", 18));
		return 0;
	end
	AddItem(2, 1, 30670, 999);
	AddItem(2, 1, 30671, 999);
	AddItem(2, 1, 30672, 999);
	AddItem(2, 1, 30673, 999);
	AddItem(2, 1, 30674, 999);
	AddItem(2, 2, 38, 999);
	AddItem(2, 2, 12, 999);
	AddItem(2, 2, 39, 999);
	AddItem(2, 2, 13, 999);
	AddItem(2, 2, 49, 999);
	AddItem(2, 2, 56, 999);
	AddItem(2, 2, 50, 999);
	AddItem(2, 2, 100, 999);
	AddItem(2, 1, 30680, 999);
	AddItem(2, 1, 30681, 999);
	AddItem(2, 1, 30682, 999);
	AddItem(2, 1, 30683, 999);
	AddItem(2, 1, 30684, 999);
end

function Get_Enhance()
	local tSay = {
		"获得陨铁灵石和定魂陨铁神石/Get_Enhance_1",
		"获得陨铁精石/Get_Enhance_2",
		"上一步/nothing",
	}
	Say(g_szTitle.."想要什么", getn(tSay), tSay);
end

function Get_Enhance_1()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 1068, 1}, "Thi猲 Th筩h linh th筩h", "Get_Enhance_1", "Nh薾 Th莕 Th筩h мnh H錸", 0, 1);
	gf_AddItemEx2({2, 1, 1067, 1}, "Thi猲 Th筩h linh th筩h", "Get_Enhance_1", "Nh薾 Th莕 Th筩h мnh H錸", 0, 1);
end

function Get_Enhance_2()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 1, 1009, 100);
	WriteLogEx("Get_Enhance_2","Nh薾 Tinh th筩h Thi猲 Th筩h", 100, "Thi猲 Th筩h Tinh Th筩h");
end

function Get_Gem()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 22, 101, 100);
	WriteLogEx("Get_Gem","Nh薾  qu?", 100, "Huy誸Tr輈hTh筩h Lv5");
	AddItem(2, 22, 201, 100);
	WriteLogEx("Get_Gem","Nh薾  qu?", 100, "Nguy謙B筩hTh筩h Lv5");
	AddItem(2, 22, 301, 100);
	WriteLogEx("Get_Gem","Nh薾  qu?", 100, "H?Ph竎h Th筩h C蕄 5");
	AddItem(2, 22, 401, 100);	
	WriteLogEx("Get_Gem","Nh薾  qu?", 100, "H綾 Di謚 Th筩h C蕄 5");
end

function Get_Yigui()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 2, 7, 50);
	AddItem(2, 2, 8, 50);
	AddItem(2, 1, 1009, 100);
	AddItem(2, 101, 13, 5);
	AddItem(2, 101, 14, 5);
	AddItem(2, 101, 15, 5);
end

function Get_LingShi()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 95, 553, 500);
	AddItem(2, 95, 554, 500);
	AddItem(2, 95, 555, 500);
    AddItem(2, 95, 556, 500);
	AddItem(2, 95, 557, 500);
	AddItem(2, 95, 558, 500);
	AddItem(2, 95, 559, 500);	
end


function Get_Qianbian()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 1, 10000, 1);
	AddItem(2, 1, 10001, 1);
	AddItem(2, 1, 10002, 1);
	AddItem(2, 1, 10003, 1);
	AddItem(2, 1, 10004, 1);
	AddItem(2, 1, 10005, 1);
	AddItem(2, 1, 9981, 1); --元帅封赏令
	AddItem(2, 1, 9982, 1); --元帅封赏令
	AddItem(2, 1, 999, 1);--元帅丸

end

function Get_Yaopin()
	if gf_Judge_Room_Weight(6, 1) ~= 1 then
		return 0;
	end

	AddItem(1, 0, 6, 100,1);
	AddItem(1, 0, 11,100,1);
	AddItem(1, 0, 16,100,1);
	AddItem(1, 0, 32,100,1);
	AddItem(2, 0, 556,50,1);
	AddItem(1, 1, 39,50,1);
	AddItem(1, 1, 40,50,1);
	AddItem(1, 0, 277,50,1);
	AddItem(1, 0, 281,50,1);
	AddItem(1, 1, 32,50,1);
	AddItem(2, 1, 1157, 50);
	AddItem(1, 0, 69, 50);
	
end

function Get_ZuoQi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "获得飞剑/Get_Feijian";
	szSay[getn(szSay) + 1] = "获得莲花/Get_LianHua";
	--szSay[getn(szSay) + 1] = "获得大兔子/Get_Tuzi";
	--szSay[getn(szSay) + 1] = "获得羊驼/Get_YangTuo";
	--szSay[getn(szSay) + 1] = "获得金丝银被/Get_MengMao";
	---szSay[getn(szSay) + 1] = "获得战象/Get_ZhanXiang";
---	szSay[getn(szSay) + 1] = "获得鹿车/Get_LuChe";
	---szSay[getn(szSay) + 1] = "获得其他坐骑/Get_QTZQ";
	---szSay[getn(szSay) + 1] = "上一步/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Get_Feijian()
	if gf_Judge_Room_Weight(14, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,242,1,4,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,243,1,4,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,244,1,4,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,240,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,180,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,181,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,182,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,196,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,197,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,208,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
	AddItem(0,105,209,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
    AddItem(0,105,216,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
    AddItem(0,105,217,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
 	AddItem(0,105,218,1,1,-1,-1,-1,-1,-1,-1,-1,0,0);
end

function Get_LianHua()
	if gf_Judge_Room_Weight(4, 1) ~= 1 then
		return 0;
	end
	AddItem(0,105,144,1,1,7,403);
	AddItem(0,105,145,1,1,7,403);
	AddItem(0,105,146,1,1,7,403);
	AddItem(0,105,147,1,1,7,403);
end

function Get_Tuzi()
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,30041,1,4,7,403);
	AddItem(0,105,30042,1,4,7,403);
	AddItem(0,105,30043,1,4,7,403);

end

function Get_YangTuo()
	if gf_Judge_Room_Weight(4, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,184,1,4,7,403);
	AddItem(0,105,185,1,4,7,403);
	AddItem(0,105,186,1,4,7,403);
	AddItem(0,105,187,1,4,7,403);

end

function Get_MengMao()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,210,1,4,7,403);
end

function Get_ZhanXiang()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,127,1,4,7,403);
end

function Get_LuChe()
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,131,1,4,7,403);
	AddItem(0,105,132,1,4,7,403);
	AddItem(0,105,133,1,4,7,403);

end

function Get_QTZQ()
	if gf_Judge_Room_Weight(15, 1) ~= 1 then
		return 0;
	end

	AddItem(0,105,211,1,4,7,403);
	AddItem(0,105,212,1,4,7,403);
	AddItem(0,105,213,1,4,7,403);
	AddItem(0,105,214,1,4,7,403);
	AddItem(0,105,174,1,4,7,403);
	AddItem(0,105,172,1,4,7,403);
	AddItem(0,105,168,1,4,7,403);
	AddItem(0,105,169,1,4,7,403);
	AddItem(0,105,170,1,4,7,403);
	AddItem(0,105,171,1,4,7,403);
	AddItem(0,105,150,1,4,7,403);
	AddItem(0,105,151,1,4,7,403);
	AddItem(0,105,152,1,4,7,403);
	AddItem(0,105,153,1,4,7,403);
	AddItem(0,105,154,1,4,7,403);
end

function Get_CJZB()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end
	AddItem(0, 103, 96, 5);
end


function Get_JinXi()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
    AddItem(2, 1, 1105, 1);--回归礼包
	AddItem(2, 95, 2056, 1);--390赞助商礼包
end

function Get_Zhenwu()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
    AddItem(2, 96, 176, 6000); --真武残页
	AddItem(2, 0, 554, 6000);--修真
	AddItem(2, 114,144, 200);--大真武魂石
end

function Get_HeShiBi()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 95, 1163, 2);
	AddItem(2, 95, 856, 3);
	AddItem(2, 95, 1162, 1);
	--AddItem(2, 17, 1, 99);
	--AddItem(2, 17, 2, 99);
	--AddItem(2, 17, 3, 99);
	--AddItem(2, 17, 4, 99);
	--AddItem(2, 17, 5, 99);
	--AddItem(2, 17, 6, 99);
	--AddItem(2, 17, 7, 99);
	--AddItem(2, 17, 8, 99);
	--AddItem(2, 17, 9, 99);
	--AddItem(2, 17, 10, 99);
	--AddItem(2, 17, 11, 99);
	--AddItem(2, 17, 12, 99);
	--AddItem(2, 17, 13, 99);
	--AddItem(2, 17, 14, 99);
	--AddItem(2, 17, 15, 99);
	--AddItem(2, 17, 16, 99);
	--AddItem(2, 17, 17, 99);
	--AddItem(2, 17, 18, 99);
	--AddItem(2, 17, 19, 99);
	--AddItem(2, 17, 20, 99);
	--AddItem( 2, 17, 21, 99);
	--AddItem(2, 17, 22, 99);
	--AddItem(2, 17, 23, 99);
	--AddItem(2, 17, 24, 99);
	--AddItem(2, 17, 2, 99);
	--AddItem(2, 17, 26, 99);
	--AddItem(2, 17, 27, 99);
	--AddItem(2, 17, 28, 99);
	--AddItem(2, 17, 29, 99);
	--AddItem(2, 17, 30, 99);
	--AddItem(2, 17, 31, 99);
	
end

function Get_JinyanDdan()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 95, 2017, 10);
	AddItem(2, 1, 1007, 100);
end

function Get_XiSuiDan()  --东皇材料
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 102, 252, 200);
	AddItem(2, 102, 279, 200);
	AddItem(2, 114, 171, 200);
	AddItem(2, 95, 3278, 200);
	AddItem(2, 111, 46, 200);
	AddItem(2, 111, 45, 200);
	AddItem(2, 95, 247, 200);
	AddItem(2, 0, 554, 200);
	AddItem(2, 95, 617, 200);
	AddItem(2, 95, 204, 200);	
end

function Get_Longyingcailiao()  --龙隐材料
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 95, 8100, 200);
	AddItem(2, 95, 8102, 200);
	AddItem(2, 95, 8105, 200);
	AddItem(2, 95, 8101, 200);
	AddItem(2, 95, 8200, 200);
	AddItem(2, 102, 248, 200);
	AddItem(2, 102, 249, 200);
	AddItem(2, 95, 999, 500);
end

function Get_XiaoJieSan()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 95, 240, 1);
	AddItem(2, 95, 241, 1);
	AddItem(2, 95, 242, 1);
	AddItem(2, 95, 243, 1);
	AddItem(2, 95, 244, 1);
	AddItem(2, 95, 245, 1);
	AddItem(2, 95, 7500,1);
end

function Get_ZhanShenWan()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 1, 1005, 1);
end

function Get_FuZhu()
	local szSay = {};
	szSay[getn(szSay) + 1] = "获得娇小体型/Get_JiaoXiao";
	szSay[getn(szSay) + 1] = "获得性感体型/Get_XingGan";
	szSay[getn(szSay) + 1] = "上一步/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Get_JiaoXiao()
	if gf_Judge_Room_Weight(4, 1) ~= 1 then
		return 0;
	end
	AddItem(0, 2, 8996, 1,1,7,852,7,484,6,390,-1,15);
	AddItem(0, 103, 3139, 1,1,7,852,7,484,6,841,-1,15);
	AddItem(0, 100, 3139, 1,1,7,852,7,484,6,485,-1,15);
	AddItem(0, 101, 3139, 1,1,7,852,7,484,6,483,-1,15);
	
end

function Get_XingGan()
	if gf_Judge_Room_Weight(4, 1) ~= 1 then
		return 0;
	end
	AddItem(0, 2, 8996, 1,1,7,852,7,484,6,390,-1,15);
	AddItem(0, 103, 3138, 1,1,7,852,7,484,6,841,-1,15);
	AddItem(0, 100, 3138, 1,1,7,852,7,484,6,485,-1,15);
	AddItem(0, 101, 3138, 1,1,7,852,7,484,6,483,-1,15);
end

function Get_ShenXing()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 1, 1067, 4);
	AddItem(2, 1, 1068, 4);
	AddItem(2, 1, 1113, 4);
end

function Want_ShengJi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "普通升级/Want_PuTong";
	szSay[getn(szSay) + 1] = "高级升级/Want_GaoJi";
	szSay[getn(szSay) + 1] = "属性重铸/Want_ChongZhu";
	szSay[getn(szSay) + 1] = "九天如意分解返还如意/Want_FenJieRuYi";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧", getn(szSay), szSay)
end

function Want_PuTong()
	local szSay = {};
	szSay[getn(szSay) + 1] = "吉祥升级九天吉祥/Want_JiXiang";
	szSay[getn(szSay) + 1] = "如意升级九天如意/Want_RuYi";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧", getn(szSay), szSay)
end

function Want_ChongZhu()
	local szSay = {};
	szSay[getn(szSay) + 1] = "九天舞带属性重铸/Want_CZWD";
	szSay[getn(szSay) + 1] = "九天璀璨属性重铸/Want_CZCC";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_FenJieRuYi()
	local szSay = {
		g_szTitle.."分解需要消耗九天如意1个，仅返还如意1个！",
		"确认分解/Want_FenJieRuYiQ",
		"不分解退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FenJieRuYiQ()
	if GetItemCount(0,102,128) < 1 then
		Talk(1,"","你并没有九天如意!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,128,1) == 1 then
		AddItem(0,102,23,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天如意分解兑换如意");
		AddLocalNews("恭喜玩家:"..GetName().." 九天如意分解兑换如意");
	end
end

function Want_CZWD()
	local szSay = {};
	szSay[getn(szSay) + 1] = "重铸降防九天舞带/Want_CZJiangFangC";
	szSay[getn(szSay) + 1] = "重铸生命九天舞带/Want_CZShengMingC";
	szSay[getn(szSay) + 1] = "重铸承受九天舞带/Want_CZChengShouC";
	szSay[getn(szSay) + 1] = "重铸伤害九天舞带/Want_CZShangHaiC";
	szSay[getn(szSay) + 1] = "重铸攻击九天舞带/Want_CZDuShangC";
	szSay[getn(szSay) + 1] = "重铸发招九天舞带/Want_CZFaZhaoC";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_CZCC()
	local szSay = {};
	szSay[getn(szSay) + 1] = "重铸降防九天璀璨/Want_CZJiangFangD";
	szSay[getn(szSay) + 1] = "重铸生命九天璀璨/Want_CZShengMingD";
	szSay[getn(szSay) + 1] = "重铸伤害九天璀璨/Want_CZShangHaiD";
	szSay[getn(szSay) + 1] = "重铸攻击九天璀璨/Want_CZDuShangD";
	szSay[getn(szSay) + 1] = "重铸发招九天璀璨/Want_CZFaZhaoD";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_GaoJi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "如意嫦娥升级九天舞带/Want_WuDai";
	szSay[getn(szSay) + 1] = "如意璀璨升级九天璀璨/Want_CuiCan";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧", getn(szSay), szSay)
end

function Want_JiXiang()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天吉祥/Want_JiangFangA";
	szSay[getn(szSay) + 1] = "升级生命九天吉祥/Want_ShengMingA";
	szSay[getn(szSay) + 1] = "升级承受九天吉祥/Want_ChengShouA";
	szSay[getn(szSay) + 1] = "升级伤害九天吉祥/Want_ShangHaiA";
	szSay[getn(szSay) + 1] = "升级攻击九天吉祥/Want_DuShangA";
	szSay[getn(szSay) + 1] = "升级发招九天吉祥/Want_FaZhaoA";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天如意没有承受减半属性）", getn(szSay), szSay)
end

function Want_RuYi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天如意/Want_JiangFangB";
	szSay[getn(szSay) + 1] = "升级生命九天如意/Want_ShengMingB";
	szSay[getn(szSay) + 1] = "升级伤害九天如意/Want_ShangHaiB";
	szSay[getn(szSay) + 1] = "升级攻击九天如意/Want_DuShangB";
	szSay[getn(szSay) + 1] = "升级发招九天如意/Want_FaZhaoB";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天如意没有承受减半属性）", getn(szSay), szSay)
end

function Want_WuDai()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天舞带/Want_JiangFangC";
	szSay[getn(szSay) + 1] = "升级生命九天舞带/Want_ShengMingC";
	szSay[getn(szSay) + 1] = "升级承受九天舞带/Want_ChengShouC";
	szSay[getn(szSay) + 1] = "升级伤害九天舞带/Want_ShangHaiC";
	szSay[getn(szSay) + 1] = "升级攻击九天舞带/Want_DuShangC";
	szSay[getn(szSay) + 1] = "升级发招九天舞带/Want_FaZhaoC";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天璀璨没有承受减半属性）", getn(szSay), szSay)
end

function Want_CuiCan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天璀璨/Want_JiangFangD";
	szSay[getn(szSay) + 1] = "升级生命九天璀璨/Want_ShengMingD";
	szSay[getn(szSay) + 1] = "升级伤害九天璀璨/Want_ShangHaiD";
	szSay[getn(szSay) + 1] = "升级攻击九天璀璨/Want_DuShangD";
	szSay[getn(szSay) + 1] = "升级发招九天璀璨/Want_FaZhaoD";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天璀璨没有承受减半属性）", getn(szSay), szSay)
end

function Want_JiangFangA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，吉祥1个，不会失败",
		"确认升级/Want_JiangFangAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-降防");
	end
end

function Want_ShengMingA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，吉祥1个，不会失败",
		"确认升级/Want_ShengMingAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-生命");
	end
end

function Want_ChengShouA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄佩5个，吉祥1个，不会失败",
		"确认升级/Want_ChengShouAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ChengShouAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,132) < 5 then
		Talk(1,"","你并没有5个九天玄佩!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,132,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-承受");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-承受");
	end
end

function Want_ShangHaiA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，吉祥1个，不会失败",
		"确认升级/Want_ShangHaiAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-伤害");
	end
end

function Want_DuShangA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，吉祥1个，不会失败",
		"确认升级/Want_DuShangAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-攻击");
	end
end

function Want_FaZhaoA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，吉祥1个，不会失败",
		"确认升级/Want_FaZhaoAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-发招");
	end
end

function Want_JiangFangB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，如意1个，不会失败",
		"确认升级/Want_JiangFangBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-降防");
	end
end

function Want_ShengMingB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，如意1个，不会失败",
		"确认升级/Want_ShengMingBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-生命");
	end
end


function Want_ShangHaiB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，如意1个，不会失败",
		"确认升级/Want_ShangHaiBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-伤害");
	end
end

function Want_DuShangB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，如意1个，不会失败",
		"确认升级/Want_DuShangBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-攻击");
	end
end

function Want_FaZhaoB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，如意1个，不会失败",
		"确认升级/Want_FaZhaoBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-发招");
	end
end

function Want_ChengShouC()--高级升级
	local szSay = {
		g_szTitle.."升级需要消耗九天玄佩5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_ChengShouCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ChengShouCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,132) < 5 then
		Talk(1,"","你并没有5个九天玄佩!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,132,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-承受");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-承受");
	end
end

function Want_ShangHaiC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_ShangHaiCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,135,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-伤害");
	end
end

function Want_DuShangC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_DuShangCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,134,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-攻击");
	end
end

function Want_FaZhaoC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_FaZhaoCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,131,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-发招");
	end
end

function Want_JiangFangC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_JiangFangCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,133,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-降防");
	end
end

function Want_ShengMingC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_ShengMingCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,129,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-生命");
	end
end



function Want_ShangHaiD() --高级升级
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_ShangHaiDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,135,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-伤害");
	end
end

function Want_DuShangD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_DuShangDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,134,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-攻击");
	end
end

function Want_FaZhaoD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_FaZhaoDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,131,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-发招");
	end
end

function Want_JiangFangD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_JiangFangDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,133,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-降防");
	end
end

function Want_ShengMingD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_ShengMingDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,129,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-生命");
	end
end

function Want_CZChengShouC()--高级升级
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄佩5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZChengShouCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZChengShouCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,132) < 5 then
		Talk(1,"","你并没有5个九天玄佩!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,132,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-承受");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-承受");
	end
end

function Want_CZShangHaiC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄石5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZShangHaiCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShangHaiCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-伤害");
	end
end

function Want_CZDuShangC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄袋5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZDuShangCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZDuShangCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-攻击");
	end
end

function Want_CZFaZhaoC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄环5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZFaZhaoCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZFaZhaoCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-发招");
	end
end

function Want_CZJiangFangC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄戒5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZJiangFangCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZJiangFangCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-降防");
	end
end

function Want_CZShengMingC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄玉5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZShengMingCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShengMingCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-生命");
	end
end



function Want_CZShangHaiD() --高级升级
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄石5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZShangHaiDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShangHaiDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-伤害");
	end
end

function Want_CZDuShangD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄袋5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZDuShangDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZDuShangDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-攻击");
	end
end

function Want_CZFaZhaoD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄环5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZFaZhaoDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZFaZhaoDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-发招");
	end
end

function Want_CZJiangFangD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄戒5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZJiangFangDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZJiangFangDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-降防");
	end
end

function Want_CZShengMingD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄玉5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZShengMingDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShengMingDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-生命");
	end
end

function BuXueZhuXie()
	LearnSkill("梅花");
	--LearnSkill("游龙飞步");
	--LearnSkill("金刚怒目");
end

function BuXueZhuXiejineng() --补学峨嵋佛家诛邪技能
	LearnSkill("比丘剑法");
end

function BuXueQingZhuXiejineng() --补学峨嵋俗家诛邪技能
	LearnSkill("一剪梅");
	--LearnSkill("迎香曲");
	LearnSkill("暗香疏影");
	
end

function Want_HuiShou()
	local szSay = {};
	szSay[getn(szSay) + 1] = "天地武器回收树种/HuiShouWuQi";
	szSay[getn(szSay) + 1] = "藏剑首饰回收树种/HuiShouShouShi";
	szSay[getn(szSay) + 1] = "不回收退出/nothing";
	Say(g_szTitle.."选一个回收吧", getn(szSay), szSay)
end

function HuiShouWuQi()
	local szSay = {
		g_szTitle.."一个天地武器可回收一个般若树种",
		"确认回收/HuiShouWuQiQ",
		"不回收退出/nothing",
	};
	SelectSay(szSay);
end

function HuiShouShouShi()
	local szSay = {
		g_szTitle.."一个藏剑首饰可回收两个般若树种",
		"确认回收/HuiShouShouShiQ",
		"不回收退出/nothing",
	};
	SelectSay(szSay);
end

function HuiShouWuQiQ()
	
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,0,17,1) == 1 or DelItem(0,2,39,1) == 1 or DelItem(0,5,43,1) == 1 or DelItem(0,1,56,1) == 1 or DelItem(0,3,67,1) == 1 or DelItem(0,10,78,1) == 1 or DelItem(0,9,89,1) == 1 or DelItem(0,8,100,1) == 1 or DelItem(0,6,111,1) == 1 or DelItem(0,4,122,1) == 1 or DelItem(0,11,15,1) == 1 or DelItem(0,7,15,1) == 1 or DelItem(0,12,15,1) == 1 or DelItem(0,13,15,1) == 1 then
		AddItem(2,0,398,1)
	end
end

function HuiShouShouShiQ()
	
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,38,1) == 1 or DelItem(0,102,39,1) == 1 or DelItem(0,102,40,1) == 1  then
		AddItem(2,0,398,2)
	end
end

function JiXiangDuiHuan()
	local szSay = {
		g_szTitle.."2个吉祥首饰可兑换1个随机的九天首饰（不含降防）",
		"确认兑换/JiXiangDuiHuanQ",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end

function JiXiangDuiHuanQ()
	if GetItemCount(0,102,22) < 2 then
		Talk(1,"","你并没有2个吉祥!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,2) == 1 then
		local nRand = random(1,1000);
		if nRand <= 200 then
		AddItem(0,102,134,1,1,3,675,4,842,1,485);--玄袋
		elseif nRand <= 400 then
		AddItem(0,102,135,1,1,3,675,4,842,5,268);--玄石
		elseif nRand <= 600 then
		AddItem(0,102,131,1,1,3,675,4,842,3,390);--玄环
		elseif nRand <= 800 then
		AddItem(0,102,132,1,1,3,675,4,842,3,483,-1,0);--玄佩
		elseif nRand <= 1000 then
		AddItem(0,102,129,1,1,3,675,4,842,4,486,-1,0);--玄玉
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用2个吉祥兑换九天系列首饰一个");
end
end

function Want_DuiHuan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "吉祥如意升级/Want_ShengJi";
	szSay[getn(szSay) + 1] = "吉祥兑换九天系列首饰/JiXiangDuiHuan";
	szSay[getn(szSay) + 1] = "九天系列首饰属性互换/JiuTianHuHuan";
	szSay[getn(szSay) + 1] = "老天罡换坐骑/DuiHuanZuoQi";
	szSay[getn(szSay) + 1] = "高级天罡换坐骑/DuiHuanZuoQiXin";
	szSay[getn(szSay) + 1] = "高级天罡换轩辕武器/DuiHuanXuYuan";
	szSay[getn(szSay) + 1] = "天地玄黄上三件升级炎帝/ShengJiYanDi";
	szSay[getn(szSay) + 1] = "炎黄铁魂兑换轩辕武器VIP发光/DuiHuanFaGuang";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function DuiHuanFaGuang()
	local szSay = {};
	szSay[getn(szSay) + 1] = "炎黄铁魂1个兑换至尊精华/Want_ZhiZunJingHua";
	szSay[getn(szSay) + 1] = "炎黄铁魂5个兑换王者精华/Want_WangZheJingHua";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_ZhiZunJingHua()
	local szSay = {
		g_szTitle.."兑换至尊精华需要消耗炎黄铁魂1个！",
		"确认兑换/Want_ZhiZunJingHuaQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ZhiZunJingHuaQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,1,1146,1) == 1 then
		local nRoute	= GetPlayerRoute();
		if nRoute == 4 then
		AddItem(2,95,2227,1);--至尊精华(武少)
		end
		if nRoute == 11 then
		AddItem(2,95,2231,1);--至尊精华(掌丐)
		end
		if nRoute == 2 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 3 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 6 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 8 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 9 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 12 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 14 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 15 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 17 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 18 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 20 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 21 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 23 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 25 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 26 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 27 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 29 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 30 then
		AddItem(2,95,2223,1);--至尊精华
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用炎黄铁魂兑换至尊精华VIP武器发光一个!!!");
end
end

function Want_WangZheJingHua()
	local szSay = {
		g_szTitle.."兑换王者精华需要消耗炎黄铁魂5个！",
		"确认兑换/Want_WangZheJingHuaQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_WangZheJingHuaQ()
	if GetItemCount(2,1,1146) < 5 then
		Talk(1,"","你并没有5个炎黄铁魂!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,1,1146,5) == 1 then
		local nRoute	= GetPlayerRoute();
		if nRoute == 4 then
		AddItem(2,95,2228,1);--王者精华(武少)
		end
		if nRoute == 11 then
		AddItem(2,95,2232,1);--王者精华(掌丐)
		end
		if nRoute == 2 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 3 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 6 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 8 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 9 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 12 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 14 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 15 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 17 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 18 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 20 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 21 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 23 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 25 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 26 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 27 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 29 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 30 then
		AddItem(2,95,2224,1);
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用炎黄铁魂兑换王者精华VIP武器发光一个!!!");
end
end

function JiuTianHuHuan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "兑换降防九天玄戒/Want_JiangFangE";
	szSay[getn(szSay) + 1] = "兑换生命九天玄玉/Want_ShengMingE";
	szSay[getn(szSay) + 1] = "兑换承受九天玄佩/Want_ChengShouE";
	szSay[getn(szSay) + 1] = "兑换伤害九天玄石/Want_ShangHaiE";
	szSay[getn(szSay) + 1] = "兑换攻击九天玄袋/Want_DuShangE";
	szSay[getn(szSay) + 1] = "兑换发招九天玄环/Want_FaZhaoE";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function DuiHuanXuYuan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "兑换破防轩辕武器/Want_PoFangWQ";
	szSay[getn(szSay) + 1] = "兑换发招轩辕武器/Want_FaZhaoWQ";
	szSay[getn(szSay) + 1] = "兑换峨眉佛家辅助武器/Want_FuZhuWQ";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."兑换轩辕武器需要消耗高级天罡令一个", getn(szSay), szSay)
end

function Want_ChengShouE()--高级升级
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_ChengShouEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ChengShouEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,132,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄佩-承受");
	end
end

function Want_ShangHaiE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_ShangHaiEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,135,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄石-伤害");
	end
end

function Want_DuShangE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_DuShangEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,134,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄袋-攻击");
	end
end

function Want_FaZhaoE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_FaZhaoEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,131,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄环-发招");
	end
end

function Want_JiangFangE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_JiangFangEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,133,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄戒-降防");
	end
end

function Want_ShengMingE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_ShengMingEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,129,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄玉-生命");
	end
end

function DuiHuanZuoQi()
	local szSay = {
		g_szTitle.."老的天罡令可以在这里1比1兑换随机的几种坐骑哦！",
		"确认兑换/DuiHuanZuoQiQ",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end

function DuiHuanZuoQiQ()
	if GetItemCount(2,95,204) < 1 then
		Talk(1,"","你并没有1个天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,204,1) == 1 then
		local nRand = random(1,2400);
		if nRand <= 200 then
		AddItem(0,105,15,1,1,7,403);--翻羽
		elseif nRand <= 400 then
		AddItem(0,105,19,1,1,7,403);--超光
		elseif nRand <= 600 then
		AddItem(0,105,16,1,1,7,403);--奔宵
		elseif nRand <= 800 then
		AddItem(0,105,33,1,1,7,403);--年兽
		elseif nRand <= 1000 then
		AddItem(0,105,38,1,1,4,101);--流云麒麟兽
		elseif nRand <= 1200 then
		AddItem(0,105,10116,1,1,7,403);--吉祥黄金虎（黄）
		elseif nRand <= 1400 then
		AddItem(0,105,10118,1,1,7,403);--吉祥黄金虎（白）
		elseif nRand <= 1600 then
		AddItem(0,105,36,1,1,7,403);--万里烟云罩
		elseif nRand <= 1800 then
		AddItem(0,105,206,1,1,7,403);--白狼
		elseif nRand <= 2000 then
		AddItem(0,105,199,1,1,7,403);--雪猊
		elseif nRand <= 2200 then
		AddItem(0,105,192,1,1,7,403);--吉祥仙鹤
		elseif nRand <= 2400 then
		AddItem(0,105,164,1,1,7,403);--火狐
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用天罡令兑换随机坐骑一个");
end
end

function DuiHuanZuoQiXin()
	local szSay = {
		g_szTitle.."高级天罡令可以在这里1比1兑换坐骑哦",
		"兑换拂晓（140速）/DuiHuanZuoQiXinQ1",
		"兑换拂晓（40速4000血杨门战马）/DuiHuanZuoQiXinQ2",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end

function DuiHuanZuoQiXinQ1()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
	AddItem(0,105,136,1,1,7,403);--拂晓
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换拂晓坐骑一个");
end

function DuiHuanZuoQiXinQ2()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
	AddItem(0,105,140,1,1,4,101,2,486);--拂晓
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换拂晓战马一个");
end

function Want_PoFangWQ()
	local szSay = {
		g_szTitle.."大侠你确认要兑换破防属性的轩辕武器吗？",
		"确认兑换/Want_PoFangWQ1",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end
function Want_PoFangWQ1()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
		local nRoute	= GetPlayerRoute();
		if nRoute == 2 then
		AddItem(0,3,19070,1,1,7,485,3,845,7,50,-1,10);--刀少武器
		end
		if nRoute == 4 then
		AddItem(0,0,19071,1,1,7,485,3,846,7,50,-1,10);--武少武器
		end
		if nRoute == 3 then
		AddItem(0,8,19072,1,1,7,485,3,846,7,50,-1,10);--禅少武器
		end
		if nRoute == 6 then
		AddItem(0,1,19073,1,1,7,485,3,845,7,50,-1,10);--唐门武器
		end
		if nRoute == 8 then
		AddItem(0,2,19074,1,1,7,485,3,846,7,50,-1,10);--佛峨眉武器
		end
		if nRoute == 9 then
		AddItem(0,10,19075,1,1,7,485,3,846,7,50,-1,10);--琴峨眉武器
		end
		if nRoute == 11 then
		AddItem(0,0,19076,1,1,7,485,3,845,7,50,-1,10);--掌丐武器
		end
		if nRoute == 12 then
		AddItem(0,5,19077,1,1,7,485,3,845,7,50,-1,10);--棍丐武器
		end
		if nRoute == 14 then
		AddItem(0,2,19078,1,1,7,485,3,846,7,50,-1,10);--剑武当武器
		end
		if nRoute == 15 then
		AddItem(0,9,19079,1,1,7,485,3,845,7,50,-1,10);--笔武当武器
		end
		if nRoute == 17 then
		AddItem(0,6,19080,1,1,7,485,3,845,7,50,-1,10);--枪武器
		end
		if nRoute == 18 then
		AddItem(0,4,19081,1,1,7,485,3,845,7,50,-1,10);--弓武器
		end
		if nRoute == 20 then
		AddItem(0,7,19082,1,1,7,485,3,845,7,50,-1,10);--邪侠武器
		end
		if nRoute == 21 then
		AddItem(0,11,19083,1,1,7,485,3,846,7,50,-1,10);--蛊武器
		end
		if nRoute == 23 then
		AddItem(0,2,19084,1,1,7,485,3,846,7,50,-1,10);--天师武器
		end
		if nRoute == 25 then
		AddItem(0,3,19085,1,1,7,485,3,845,7,50,-1,10);--明刀武器
		end
		if nRoute == 26 then
		AddItem(0,9,19086,1,1,7,485,3,845,7,50,-1,10);--阵兵武器
		end
		if nRoute == 27 then
		AddItem(0,11,19087,1,1,7,485,3,846,7,50,-1,10);--血人武器
		end
		if nRoute == 29 then
		AddItem(0,13,19088,1,1,7,485,3,845,7,50,-1,10);--舞女武器
		end
		if nRoute == 30 then
		AddItem(0,12,19089,1,1,7,485,3,845,7,50,-1,10);--灵女武器
		end
	
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换轩辕武器一个");
end
end

function Want_FaZhaoWQ()
	local szSay = {
		g_szTitle.."大侠你确认要兑换发招属性的轩辕武器吗？",
		"确认兑换/Want_FaZhaoWQ1",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end
function Want_FaZhaoWQ1()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
		local nRoute	= GetPlayerRoute();
		if nRoute == 2 then
		AddItem(0,3,19070,1,1,7,485,3,845,6,390,-1,10);--刀少武器
		end
		if nRoute == 4 then
		AddItem(0,0,19071,1,1,7,485,3,846,6,390,-1,10);--武少武器
		end
		if nRoute == 3 then
		AddItem(0,8,19072,1,1,7,485,3,846,6,390,-1,10);--禅少武器
		end
		if nRoute == 6 then
		AddItem(0,1,19073,1,1,7,485,3,845,6,390,-1,10);--唐门武器
		end
		if nRoute == 8 then
		AddItem(0,2,19074,1,1,7,485,3,846,6,390,-1,10);--佛峨眉武器
		end
		if nRoute == 9 then
		AddItem(0,10,19075,1,1,7,485,3,846,6,390,-1,10);--琴峨眉武器
		end
		if nRoute == 11 then
		AddItem(0,0,19076,1,1,7,485,3,845,6,390,-1,10);--掌丐武器
		end
		if nRoute == 12 then
		AddItem(0,5,19077,1,1,7,485,3,845,6,390,-1,10);--棍丐武器
		end
		if nRoute == 14 then
		AddItem(0,2,19078,1,1,7,485,3,846,6,390,-1,10);--剑武当武器
		end
		if nRoute == 15 then
		AddItem(0,9,19079,1,1,7,485,3,845,6,390,-1,10);--笔武当武器
		end
		if nRoute == 17 then
		AddItem(0,6,19080,1,1,7,485,3,845,6,390,-1,10);--枪武器
		end
		if nRoute == 18 then
		AddItem(0,4,19081,1,1,7,485,3,845,6,390,-1,10);--弓武器
		end
		if nRoute == 20 then
		AddItem(0,7,19082,1,1,7,485,3,845,6,390,-1,10);--邪侠武器
		end
		if nRoute == 21 then
		AddItem(0,11,19083,1,1,7,485,3,846,6,390,-1,10);--蛊武器
		end
		if nRoute == 23 then
		AddItem(0,2,19084,1,1,7,485,3,846,6,390,-1,10);--天师武器
		end
		if nRoute == 25 then
		AddItem(0,3,19085,1,1,7,485,3,845,6,390,-1,10);--明刀武器
		end
		if nRoute == 26 then
		AddItem(0,9,19086,1,1,7,485,3,845,6,390,-1,10);--阵兵武器
		end
		if nRoute == 27 then
		AddItem(0,11,19087,1,1,7,485,3,846,6,390,-1,10);--血人武器
		end
		if nRoute == 29 then
		AddItem(0,13,19088,1,1,7,485,3,845,6,390,-1,10);--舞女武器
		end
		if nRoute == 30 then
		AddItem(0,12,19089,1,1,7,485,3,845,6,390,-1,10);--灵女武器
		end
	
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换轩辕武器一个");
end
end

function Want_FuZhuWQ()
	local szSay = {
		g_szTitle.."大侠你确认要兑换峨眉佛家辅助属性的轩辕武器吗？",
		"确认兑换/Want_FuZhuWQ1",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end
function Want_FuZhuWQ1()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
	AddItem(0,2,19074,1,1,7,485,3,846,7,852,-1,10);--峨眉辅助武器
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换轩辕武器一个");
end

function ShengJiYanDi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "1.炎黄铁魂3个+天地装备升级/Want_ShengJiYanDiA";
	szSay[getn(szSay) + 1] = "2.炎黄铁魂1个+天地装备升级/Want_ShengJiYanDiB";
	szSay[getn(szSay) + 1] = "3.退出/nothing";
	Say(g_szTitle.."选一个吧！（选项一是必定成功，选项二是33%概率成功、失败扣除炎黄铁魂只返还当前体型天地装备无保底！）", getn(szSay), szSay)
end

function Want_ShengJiYanDiA()
	local szSay = {};
	szSay[getn(szSay) + 1] = "炎黄铁魂3个+天地玄黄盔升级炎帝盔/Want_YanDiKuiA";
	szSay[getn(szSay) + 1] = "炎黄铁魂3个+天地玄黄甲升级炎帝甲/Want_YanDiJiaA";
	szSay[getn(szSay) + 1] = "炎黄铁魂3个+天地玄黄装升级炎帝装/Want_YanDiZhuangA";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个部位吧（此页面必定成功）", getn(szSay), szSay)
end

function Want_ShengJiYanDiB()
	local szSay = {};
	szSay[getn(szSay) + 1] = "炎黄铁魂1个+天地玄黄盔升级炎帝盔/Want_YanDiKuiB";
	szSay[getn(szSay) + 1] = "炎黄铁魂1个+天地玄黄甲升级炎帝甲/Want_YanDiJiaB";
	szSay[getn(szSay) + 1] = "炎黄铁魂1个+天地玄黄装升级炎帝装/Want_YanDiZhuangB";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个部位吧（此页面升级只有33%成功率，失败扣除炎黄铁魂，返还当前体型天地玄黄装备）", getn(szSay), szSay)
end


function Want_YanDiKuiA()
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂3个+天地玄黄盔1个，不会失败",
		"确认升级/Want_YanDiKuiAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end
function Want_YanDiKuiAQ()
	if GetItemCount(2,1,1146) < 3 then
		Talk(1,"","你并没有3个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL3() ~= 1 then 
		return
	end
		local nBody 	= GetBody();
		if nBody ==1 then 
		AddItem(0,103,8001,1,1,7,675,4,483,7,847,-1,10)
		elseif nBody ==2 then 
		AddItem(0,103,8002,1,1,7,675,4,483,7,847,-1,10)
		elseif nBody ==3 then 
		AddItem(0,103,8003,1,1,7,675,4,483,7,847,-1,10)
		elseif nBody ==4 then 
		AddItem(0,103,8004,1,1,7,675,4,483,7,847,-1,10)
		end
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄盔升级到炎帝盔");
		AddLocalNews("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄盔升级到炎帝盔");	

	end	

function ask_DELL3() --随机删除天地装备
	local tdzjmbiao = GetItemCount(0,103,85)
	local tdzjmkuiw = GetItemCount(0,103,86)
	local tdzjmjiaox = GetItemCount(0,103,88)
	local tdzjmxingan = GetItemCount(0,103,87)
	local tiehun = GetItemCount(2,1,1146)
	i1 = tdzjmbiao
	i2 = tdzjmkuiw
	i3 = tdzjmjiaox
	i4 = tdzjmxingan
	i5 = tiehun
if i1 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,85,1)
	return 1
end	
if i2 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,86,1)
	return 1
end	
if i3 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,88,1)
	return 1
end	
if i4 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,87,1)
	return 1
end
end

function Want_YanDiJiaA()
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂3个+天地玄黄甲1个，不会失败",
		"确认升级/Want_YanDiJiaAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end
function Want_YanDiJiaAQ()
	if GetItemCount(2,1,1146) < 3 then
		Talk(1,"","你并没有3个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL4() ~= 1 then 
		return
	end
		local nBody 	= GetBody();
		if nBody ==1 then 
		AddItem(0,100,8001,1,1,5,286,7,848,7,485,-1,10)
		elseif nBody ==2 then 
		AddItem(0,100,8002,1,1,5,286,7,848,7,485,-1,10)
		elseif nBody ==3 then 
		AddItem(0,100,8003,1,1,5,286,7,848,7,485,-1,10)
		elseif nBody ==4 then 
		AddItem(0,100,8004,1,1,5,286,7,848,7,485,-1,10)
		end
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄甲升级到炎帝甲");
		AddLocalNews("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄甲升级到炎帝甲");	

	end	

function ask_DELL4() --随机删除天地装备
	local tdzjybiao = GetItemCount(0,100,85)
	local tdzjykuiw = GetItemCount(0,100,86)
	local tdzjyjiaox = GetItemCount(0,100,88)
	local tdzjyxingan = GetItemCount(0,100,87)
	local tiehun = GetItemCount(2,1,1146)
	i11 = tdzjybiao
	i12 = tdzjykuiw
	i13 = tdzjyjiaox
	i14 = tdzjyxingan
	i5 = tiehun
if i11 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,85,1)
	return 1
end	
if i12 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,86,1)
	return 1
end	
if i13 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,88,1)
	return 1
end	
if i14 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,87,1)
	return 1
end
end

function Want_YanDiZhuangA()
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂3个+天地玄黄装1个，不会失败",
		"确认升级/Want_YanDiZhuangAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end
function Want_YanDiZhuangAQ()
	if GetItemCount(2,1,1146) < 3 then
		Talk(1,"","你并没有3个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL5() ~= 1 then 
		return
	end
		local nBody 	= GetBody();
		if nBody ==1 then 
		AddItem(0,101,8001,1,1,2,2203,7,483,7,580,-1,10)
		elseif nBody ==2 then 
		AddItem(0,101,8002,1,1,2,2203,7,483,7,580,-1,10)
		elseif nBody ==3 then 
		AddItem(0,101,8003,1,1,2,2203,7,483,7,580,-1,10)
		elseif nBody ==4 then 
		AddItem(0,101,8004,1,1,2,2203,7,483,7,580,-1,10)
		end
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄装升级到炎帝装");
		AddLocalNews("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄装升级到炎帝装");	

	end	

function ask_DELL5() --随机删除天地装备
	local tdzjzbiao = GetItemCount(0,101,85)
	local tdzjzkuiw = GetItemCount(0,101,86)
	local tdzjzjiaox = GetItemCount(0,101,88)
	local tdzjzxingan = GetItemCount(0,101,87)
	local tiehun = GetItemCount(2,1,1146)
	i21 = tdzjzbiao
	i22 = tdzjzkuiw
	i23 = tdzjzjiaox
	i24 = tdzjzxingan
	i5 = tiehun
if i21 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,85,1)
	return 1
end	
if i22 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,86,1)
	return 1
end	
if i23 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,88,1)
	return 1
end	
if i24 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,87,1)
	return 1
end
end




function Want_YanDiKuiB() --33%概率合成
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂1个+天地玄黄盔1个，33%概率成功，失败扣除炎黄铁魂返还天地装备<enter><color=yellow>本选项有风险升级需谨慎！<color>",
		"确认升级/Want_YanDiKuiBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_YanDiKuiBQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL6() ~= 1 then 
		return
	end
		local nRand = random(1,100);
		if nRand <= 33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,103,8001,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			elseif nBody ==2 then 
			AddItem(0,103,8002,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			elseif nBody ==3 then 
			AddItem(0,103,8003,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			elseif nBody ==4 then 
			AddItem(0,103,8004,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			end
			return
		elseif nRand >33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,103,85,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			elseif nBody ==2 then 
			AddItem(0,103,86,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			elseif nBody ==3 then 
			AddItem(0,103,87,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			elseif nBody ==4 then 
			AddItem(0,103,88,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			end
		end	
	end
function ask_DELL6() --随机删除天地装备
	local tdzjmbiao = GetItemCount(0,103,85)
	local tdzjmkuiw = GetItemCount(0,103,86)
	local tdzjmjiaox = GetItemCount(0,103,88)
	local tdzjmxingan = GetItemCount(0,103,87)
	local tiehun = GetItemCount(2,1,1146)
	i1 = tdzjmbiao
	i2 = tdzjmkuiw
	i3 = tdzjmjiaox
	i4 = tdzjmxingan
	i5 = tiehun
if i1 >= 1 and i5 >= 1  then   
    DelItem(2,1,1146,1)
	DelItem(0,103,85,1)
	return 1
end	
if i2 >= 1 and i5 >= 1  then   
    DelItem(2,1,1146,1)
	DelItem(0,103,86,1)
	return 1
end	
if i3 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,103,88,1)
	return 1
end	
if i4 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,103,87,1)
	return 1
end
end

function Want_YanDiJiaB() --33%概率合成
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂1个+天地玄黄甲1个，33%概率成功，失败扣除炎黄铁魂返还天地装备<enter><color=yellow>本选项有风险升级需谨慎！<color>",
		"确认升级/Want_YanDiJiaBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_YanDiJiaBQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL7() ~= 1 then 
		return
	end
		local nRand = random(1,100);
		if nRand <= 33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,100,8001,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			elseif nBody ==2 then 
			AddItem(0,100,8002,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			elseif nBody ==3 then 
			AddItem(0,100,8003,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			elseif nBody ==4 then 
			AddItem(0,100,8004,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			end
			return
		elseif nRand >33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,100,85,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			elseif nBody ==2 then 
			AddItem(0,100,86,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			elseif nBody ==3 then 
			AddItem(0,100,87,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			elseif nBody ==4 then 
			AddItem(0,100,88,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			end
		end	
	end
function ask_DELL7() --随机删除天地装备
	local tdzjybiao = GetItemCount(0,100,85)
	local tdzjykuiw = GetItemCount(0,100,86)
	local tdzjyjiaox = GetItemCount(0,100,88)
	local tdzjyxingan = GetItemCount(0,100,87)
	local tiehun = GetItemCount(2,1,1146)
	i11 = tdzjybiao
	i12 = tdzjykuiw
	i13 = tdzjyjiaox
	i14 = tdzjyxingan
	i5 = tiehun
if i11 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,85,1)
	return 1
end	
if i12 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,86,1)
	return 1
end	
if i13 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,88,1)
	return 1
end	
if i14 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,87,1)
	return 1
end
end

function Want_YanDiZhuangB() --33%概率合成
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂1个+天地玄黄装1个，33%概率成功，失败扣除炎黄铁魂返还天地装备<enter><color=yellow>本选项有风险升级需谨慎！<color>",
		"确认升级/Want_YanDiZhuangBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_YanDiZhuangBQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL8() ~= 1 then 
		return
	end
		local nRand = random(1,100);
		if nRand <= 33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,101,8001,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			elseif nBody ==2 then 
			AddItem(0,101,8002,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			elseif nBody ==3 then 
			AddItem(0,101,8003,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			elseif nBody ==4 then 
			AddItem(0,101,8004,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			end
			return
		elseif nRand >33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,101,85,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			elseif nBody ==2 then 
			AddItem(0,101,86,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			elseif nBody ==3 then 
			AddItem(0,101,87,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			elseif nBody ==4 then 
			AddItem(0,101,88,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			end
		end	
	end
function ask_DELL8() --随机删除天地装备
	local tdzjzbiao = GetItemCount(0,101,85)
	local tdzjzkuiw = GetItemCount(0,101,86)
	local tdzjzjiaox = GetItemCount(0,101,88)
	local tdzjzxingan = GetItemCount(0,101,87)
	local tiehun = GetItemCount(2,1,1146)
	i21 = tdzjzbiao
	i22 = tdzjzkuiw
	i23 = tdzjzjiaox
	i24 = tdzjzxingan
	i5 = tiehun
if i21 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,85,1)
	return 1
end	
if i22 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,86,1)
	return 1
end	
if i23 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,88,1)
	return 1
end	
if i24 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,87,1)
	return 1
end
end

function suishensd()--随身商店
	local szSay = {
		g_szTitle.."随身商店仓库,方便你我他!!!",
		"储物箱/ask_chuwux",
		"药店/ask_yaodian",
	};
	SelectSay(szSay);
end

function ask_zahuod()
	Sale(35)
end

function ask_chuwux()
	OpenBox()
end

function ask_liewu1()
	local tSay = {}
	tSay = {
			"少林俗家标准/#xuanliewu1(1)",
			"少林俗家魁梧/#xuanliewu1(2)",
			"少林禅僧标准/#xuanliewu1(3)",
			"少林禅僧魁梧/#xuanliewu1(4)",
			"少林武僧标准/#xuanliewu1(5)",
			"少林武僧魁梧/#xuanliewu1(6)",
			"唐门标准/#xuanliewu1(7)",
			"唐门魁梧/#xuanliewu1(8)",
			"唐门性感/#xuanliewu1(9)",
			"唐门娇小/#xuanliewu1(10)",
			"峨眉佛家性感/#xuanliewu1(11)",
			"峨眉佛家娇小/#xuanliewu1(12)",
			"峨眉俗家性感/#xuanliewu1(13)",
			"峨眉俗家娇小/#xuanliewu1(14)",
			"丐帮净衣标准/#xuanliewu1(15)",
			"丐帮净衣魁梧/#xuanliewu1(16)",
			"丐帮净衣性感/#xuanliewu1(17)",
			"丐帮净衣娇小/#xuanliewu1(18)",
			"丐帮污衣标准/#xuanliewu1(19)",
			"丐帮污衣魁梧/#xuanliewu1(20)",
			"丐帮污衣性感/#xuanliewu1(21)",
			"丐帮污衣娇小/#xuanliewu1(22)",
			"武当道家标准/#xuanliewu1(23)",
			"武当道家魁梧/#xuanliewu1(24)",
			"武当道家性感/#xuanliewu1(25)",
			"武当道家娇小/#xuanliewu1(26)",
			"武当俗家标准/#xuanliewu1(27)",
			"武当俗家魁梧/#xuanliewu1(28)",
			"武当俗家性感/#xuanliewu1(29)",
			"武当俗家娇小/#xuanliewu1(30)",
			"杨门枪骑标准/#xuanliewu1(31)",
			"杨门枪骑魁梧/#xuanliewu1(32)",
			"杨门枪骑性感/#xuanliewu1(33)",
			"杨门枪骑娇小/#xuanliewu1(34)",
			"杨门弓骑标准/#xuanliewu1(35)",
			"杨门弓骑魁梧/#xuanliewu1(36)",
			"杨门弓骑性感/#xuanliewu1(37)",
			"杨门弓骑娇小/#xuanliewu1(38)",
			"五毒邪侠标准/#xuanliewu1(39)",
			"五毒邪侠魁梧/#xuanliewu1(40)",
			"五毒邪侠性感/#xuanliewu1(41)",
			"五毒邪侠娇小/#xuanliewu1(42)",
			"五毒蛊师标准/#xuanliewu1(43)",
			"五毒蛊师魁梧/#xuanliewu1(44)",
			"五毒蛊师性感/#xuanliewu1(45)",
			"五毒蛊师娇小/#xuanliewu1(46)",
			"昆仑天师标准/#xuanliewu1(47)",
			"昆仑天师魁梧/#xuanliewu1(48)",
			"翠烟舞仙性感/#xuanliewu1(49)",
			"翠烟舞仙娇小/#xuanliewu1(50)",
			"翠烟灵女性感/#xuanliewu1(51)",
			"翠烟灵女娇小/#xuanliewu1(52)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM卡：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
end

function xuanliewu1(nWz)
		if nWz ==1 then 
				AddItem(0,100,22410,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22410,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22410,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,3,22410,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==2 then 
				AddItem(0,100,22411,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22411,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22411,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,3,22411,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==3 then 
				AddItem(0,100,22412,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22412,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22412,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,8,22412,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==4 then 
				AddItem(0,100,22413,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22413,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22413,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,8,22413,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==5 then 
				AddItem(0,100,22414,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22414,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22414,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,0,22414,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==6 then 
				AddItem(0,100,22415,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22415,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22415,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,0,22415,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==7 then 
				AddItem(0,100,22416,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22416,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22416,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,1,22416,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==8 then 
				AddItem(0,100,22417,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22417,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22417,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,1,22417,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==9 then 
				AddItem(0,100,22418,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22418,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22418,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,1,22418,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==10 then 
				AddItem(0,100,22419,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22419,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22419,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,1,22419,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==11 then 
				AddItem(0,100,22420,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22420,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22420,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22420,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==12 then 
				AddItem(0,100,22421,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22421,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22421,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22421,1,1,0,0,0,0,0,0,0,10,120)
		end

		if nWz ==13 then 
				AddItem(0,100,22422,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22422,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22422,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,10,22422,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==14 then 
				AddItem(0,100,22423,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22423,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22423,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,10,22423,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==15 then 
				AddItem(0,100,22424,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22424,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22424,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,0,22424,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==16 then 
				AddItem(0,100,22425,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22425,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22425,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,0,22425,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==17 then 
				AddItem(0,100,22426,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22426,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22426,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,0,22426,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==18 then 
				AddItem(0,100,22427,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22427,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22427,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,0,22427,1,1,0,0,0,0,0,0,0,10,120)
		end

		if nWz ==19 then 
				AddItem(0,100,22428,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22428,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22428,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,5,22428,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==20 then 
				AddItem(0,100,22429,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22429,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22429,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,5,22429,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==21 then 
				AddItem(0,100,22430,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22430,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22430,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,5,22430,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==22 then 
				AddItem(0,100,22431,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22431,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22431,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,5,22431,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==23 then 
				AddItem(0,100,22432,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22432,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22432,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22432,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==24 then 
				AddItem(0,100,22433,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22433,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22433,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22433,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==25 then 
				AddItem(0,100,22434,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22434,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22434,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22434,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==25 then 
				AddItem(0,100,22435,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22435,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22435,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22435,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==27 then 
				AddItem(0,100,22436,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22436,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22436,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,9,22436,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==28 then 
				AddItem(0,100,22437,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22437,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22437,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,9,22437,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==29 then 
				AddItem(0,100,22438,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22438,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22438,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,9,22438,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==30 then 
				AddItem(0,100,22439,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22439,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22439,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,9,22439,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==31 then 
				AddItem(0,100,22440,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22440,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22440,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,6,22440,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==32 then 
				AddItem(0,100,22441,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22441,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22441,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,6,22441,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==33 then 
				AddItem(0,100,22442,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22442,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22442,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,6,22442,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==34 then 
				AddItem(0,100,22443,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22443,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22443,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,6,22443,1,1,0,0,0,0,0,0,0,10,120)
		end

		if nWz ==35 then 
				AddItem(0,100,22444,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22444,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22444,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,4,22444,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==36 then 
				AddItem(0,100,22445,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22445,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22445,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,4,22445,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==37 then 
				AddItem(0,100,22446,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22446,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22446,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,4,22446,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==38 then 
				AddItem(0,100,22447,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22447,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22447,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,4,22447,1,1,0,0,0,0,0,0,0,10,120)
		end

		if nWz ==39 then 
				AddItem(0,100,22448,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22448,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22448,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,7,22448,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==40 then 
				AddItem(0,100,22449,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22449,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22449,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,7,22449,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==41 then 
				AddItem(0,100,22450,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22450,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22450,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,7,22450,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==42 then 
				AddItem(0,100,22451,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22451,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22451,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,7,22451,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==43 then 
				AddItem(0,100,22452,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22452,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22452,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,11,22452,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==44 then 
				AddItem(0,100,22453,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22453,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22453,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,11,22453,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==45 then 
				AddItem(0,100,22454,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22454,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22454,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,11,22454,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==46 then 
				AddItem(0,100,22455,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22455,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22455,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,11,22455,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==47 then 
				AddItem(0,100,22456,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22456,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22456,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22456,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==48 then 
				AddItem(0,100,22457,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22457,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22457,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,2,22457,1,1,0,0,0,0,0,0,0,10,120)
		end
		
		if nWz ==49 then 
				AddItem(0,100,22470,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22470,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22470,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,13,22470,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==50 then 
				AddItem(0,100,22471,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22471,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22471,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,13,22471,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==51 then 
				AddItem(0,100,22472,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22472,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22472,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,12,22472,1,1,0,0,0,0,0,0,0,10,120)
		end
		if nWz ==52 then 
				AddItem(0,100,22473,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,101,22473,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,103,22473,1,1,0,0,0,0,0,0,0,10,120)
				AddItem(0,12,22473,1,1,0,0,0,0,0,0,0,10,120)
		end
end

function xqx_Skill_joinRoute()
	function LearnUpdateSkill(str)
		LearnSkill(str);  --学习技能
		while LevelUpSkill(str) == 1 do  --升级技能
		end
	end
	function enter_mpp(nRoute)   --入门派操作
		--for i=21, 4000 do RemoveSkill(i) end    --先废除当前全部武功
		--for i=1, 17 do LearnUpdateSkill(i) end    --学习普通攻击技能
		
		SetPlayerRoute(nRoute);						--设置流派
		if nRoute == 0 then	          --无门无派
		elseif nRoute == 2 then	          --少林俗家
			LearnUpdateSkill(3);
			LearnUpdateSkill(5);
			LearnUpdateSkill(32);
			for i = 21, 31 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 73, 1);
				AddItem(0, 109, 73, 1);
			else
				AddItem(0, 108, 77, 1);
				AddItem(0, 109, 77, 1);
			end
		elseif nRoute == 3 then					--少林禅僧
			LearnUpdateSkill(6);
			LearnUpdateSkill(57);
			for i = 45, 56 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 73, 1);
				AddItem(0, 109, 73, 1);
			else
				AddItem(0, 108, 77, 1);
				AddItem(0, 109, 77, 1);
			end
		elseif nRoute == 4 then					--少林武僧
			LearnUpdateSkill(2);
			LearnUpdateSkill(44);
			for i = 33, 43 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 73, 1);
				AddItem(0, 109, 73, 1);
			else
				AddItem(0, 108, 77, 1);
				AddItem(0, 109, 77, 1);
			end
		elseif nRoute == 14 then					--武当道家
			LearnUpdateSkill(4);
			LearnUpdateSkill(146);
			for i = 125, 145 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 74, 1);
				AddItem(0, 109, 74, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 78, 1);
				AddItem(0, 109, 78, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 82, 1);
				AddItem(0, 109, 82, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 86, 1);
				AddItem(0, 109, 86, 1);
			end
		elseif nRoute == 15 then					--武当俗家
			LearnUpdateSkill(5);
			LearnUpdateSkill(159);
			for i = 147, 158 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 74, 1);
				AddItem(0, 109, 74, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 78, 1);
				AddItem(0, 109, 78, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 82, 1);
				AddItem(0, 109, 82, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 86, 1);
				AddItem(0, 109, 86, 1);
			end
		elseif nRoute == 8 then					--峨嵋佛家
			LearnUpdateSkill(4);
			LearnUpdateSkill(89);
			for i = 75, 88 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 81, 1);
				AddItem(0, 109, 81, 1);
			else
				AddItem(0, 108, 85, 1);
				AddItem(0, 109, 85, 1);
			end
		elseif nRoute == 9 then					--峨嵋俗家
			LearnUpdateSkill(10);
			LearnUpdateSkill(102);
			for i = 90, 101 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 81, 1);
				AddItem(0, 109, 81, 1);
			else
				AddItem(0, 108, 85, 1);
				AddItem(0, 109, 85, 1);
			end
		elseif nRoute == 11 then					--丐帮净衣
			LearnUpdateSkill(2);
			LearnUpdateSkill(113);
			for i = 103, 112 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 75, 1);
				AddItem(0, 109, 75, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 79, 1);
				AddItem(0, 109, 79, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 83, 1);
				AddItem(0, 109, 83, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 87, 1);
				AddItem(0, 109, 87, 1);
			end
		elseif nRoute == 12 then					--丐帮污衣
			LearnUpdateSkill(5);
			LearnUpdateSkill(124);
			for i = 114, 123 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 75, 1);
				AddItem(0, 109, 75, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 79, 1);
				AddItem(0, 109, 79, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 83, 1);
				AddItem(0, 109, 83, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 87, 1);
				AddItem(0, 109, 87, 1);
			end
		elseif nRoute == 6 then					--唐门
			LearnUpdateSkill(7);
			LearnUpdateSkill(74);
			for i = 58, 73 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 76, 1);
				AddItem(0, 109, 76, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 80, 1);
				AddItem(0, 109, 80, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 84, 1);
				AddItem(0, 109, 84, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 88, 1);
				AddItem(0, 109, 88, 1);
			end
		elseif nRoute == 5 then					--唐门任侠
			LearnUpdateSkill(7);
			LearnUpdateSkill(2307);
			for i = 2313, 2308 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 76, 1);
				AddItem(0, 109, 76, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 80, 1);
				AddItem(0, 109, 80, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 84, 1);
				AddItem(0, 109, 84, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 88, 1);
				AddItem(0, 109, 88, 1);
			end
		elseif nRoute == 17 then					--杨门枪骑
			LearnUpdateSkill(11);
			LearnUpdateSkill(732);
			for i = 720, 731 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 105, 1);
				AddItem(0, 109, 105, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 106, 1);
				AddItem(0, 109, 106, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 107, 1);
				AddItem(0, 109, 107, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 108, 1);
				AddItem(0, 109, 108, 1);
			end
		elseif nRoute == 18 then					--杨门弓骑
			LearnUpdateSkill(12);
			LearnUpdateSkill(745);
			for i = 733, 744 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 105, 1);
				AddItem(0, 109, 105, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 106, 1);
				AddItem(0, 109, 106, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 107, 1);
				AddItem(0, 109, 107, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 108, 1);
				AddItem(0, 109, 108, 1);
			end
		elseif nRoute == 20 then					--五毒邪侠
			LearnUpdateSkill(13);
			LearnUpdateSkill(775);
			for i = 364, 377 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 123, 1);
				AddItem(0, 109, 123, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 124, 1);
				AddItem(0, 109, 124, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 125, 1);
				AddItem(0, 109, 125, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 126, 1);
				AddItem(0, 109, 126, 1);
			end
		elseif nRoute == 21 then					--五毒蛊师
			LearnUpdateSkill(14);
			LearnUpdateSkill(774);
			for i = 347, 363 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 123, 1);
				AddItem(0, 109, 123, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 124, 1);
				AddItem(0, 109, 124, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 125, 1);
				AddItem(0, 109, 125, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 126, 1);
				AddItem(0, 109, 126, 1);
			end
		elseif nRoute == 23 then					--昆仑天师
			LearnUpdateSkill(4);
			LearnUpdateSkill(1032);
			for i = 1017, 1031 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 530, 1);
				AddItem(0, 109, 530, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 531, 1);
				AddItem(0, 109, 531, 1);
			end
		elseif nRoute == 25 then					--明教圣战
			LearnUpdateSkill(3);
			LearnUpdateSkill(1066);
			for i = 1053, 1065 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 534, 1);
				AddItem(0, 109, 534, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 535, 1);
				AddItem(0, 109, 535, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 536, 1);
				AddItem(0, 109, 536, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 537, 1);
				AddItem(0, 109, 537, 1);
			end
		elseif nRoute == 26 then					--明教阵兵
			LearnUpdateSkill(8);
			LearnUpdateSkill(1096);
			for i = 1083, 1095 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 534, 1);
				AddItem(0, 109, 534, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 535, 1);
				AddItem(0, 109, 535, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 536, 1);
				AddItem(0, 109, 536, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 537, 1);
				AddItem(0, 109, 537, 1);
			end
		elseif nRoute == 27 then					--明教血人
			LearnUpdateSkill(14);
			LearnUpdateSkill(1213);
			for i = 1131, 1143 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 534, 1);
				AddItem(0, 109, 534, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 535, 1);
				AddItem(0, 109, 535, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 536, 1);
				AddItem(0, 109, 536, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 537, 1);
				AddItem(0, 109, 537, 1);
			end
		elseif nRoute == 29 then					--翠烟舞仙
			LearnUpdateSkill(15);
			LearnUpdateSkill(1196);
			for i = 1165, 1176 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 532, 1);
				AddItem(0, 109, 532, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 533, 1);
				AddItem(0, 109, 533, 1);
			end
		elseif nRoute == 30 then					--翠烟灵女
			LearnUpdateSkill(16);
			LearnUpdateSkill(1230);
			for i = 1217, 1229 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 532, 1);
				AddItem(0, 109, 532, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 533, 1);
				AddItem(0, 109, 533, 1);
			end
		elseif nRoute == 32 then					--昆仑剑尊
			LearnUpdateSkill(4);
			LearnUpdateSkill(1898);
			for i = 1885, 1897 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 530, 1);
				AddItem(0, 109, 530, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 531, 1);
				AddItem(0, 109, 531, 1);
			end
		elseif nRoute == 31 then					--唐门任侠
			LearnUpdateSkill(17);
			LearnUpdateSkill(1902);
			LearnUpdateSkill(1903);
			for i = 1872, 1885 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 76, 1);
				AddItem(0, 109, 76, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 80, 1);
				AddItem(0, 109, 80, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 84, 1);
				AddItem(0, 109, 84, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 88, 1);
				AddItem(0, 109, 88, 1);
			end
		else
			Msg2Player("流派参数错误，请检查xqx_Skill_joinRoute")
			return
		end;
	
		LearnSkill(20);    --轻功
		xqx_Skill_ZhuxieManager(0)    --学习诛邪技能
	
		----------------------------设置数值------------
		-- SetStrengthMaxAddOn(2000) --力量上限+2000
		-- SetDexterityMaxAddOn(2000) --身法上限+2000
		-- SetVitalityMaxAddOn(2000) --外功上限+2000
		-- SetEnergyMaxAddOn(2000) --内功上限+2000
		-- SetObserveMaxAddOn(2000) --洞察上限+2000
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		Say("转职后请重登游戏",0)
		Msg2Player("转职后请重登游戏")
	end
	function selectRoute()
		local szTitle = "转职后请退出游戏重新登录！"
		local tbOpt ={}
		
		if GetItemCount(2, 1, 1001) < 5 then
		Talk(1, "","袋子里的和氏壁不足，攒够了再来吧！");
		return
	end
	if DelItem(2, 1, 1001,5)== 1 then
	Msg2Player("你消耗了5个和氏壁！祝你转职愉快！")

   end
		--tinsert(tbOpt, {"退出门派并回归大侠号", enter_mpp, {0}})
		if GetSex() == 1 then
			tinsert(tbOpt, {"加入少林", SelectSay, {{"你想加入哪个流派？",
			"少林武僧/#enter_mpp(4)",
			"少林禅僧/#enter_mpp(3)",
			"少林俗家/#enter_mpp(2)",
			"取消"}}})
		end
		tinsert(tbOpt, {"加入武当", SelectSay, {{"你想加入哪个流派？",
		"武当道家/#enter_mpp(14)",
		"武当俗家/#enter_mpp(15)",
		"取消"}}})
		if GetSex() == 2 then
			tinsert(tbOpt, {"加入峨嵋", SelectSay, {{"你想加入哪个流派？",
			"峨嵋佛家/#enter_mpp(8)",
			"峨嵋俗家/#enter_mpp(9)",
			"取消"}}})
		end
		tinsert(tbOpt, {"加入丐帮", SelectSay, {{"你想加入哪个流派？",
		"丐帮净衣/#enter_mpp(11)",
		"丐帮污衣/#enter_mpp(12)",
		"取消"}}})
		tinsert(tbOpt, {"加入唐门", SelectSay, {{"你想加入哪个流派？",
		"唐门/#enter_mpp(6)",
		"唐门任侠/#enter_mpp(31)",
		"取消"}}})
		tinsert(tbOpt, {"加入杨门", SelectSay, {{"你想加入哪个流派？",
		"杨门枪骑/#enter_mpp(17)",
		"杨门弓骑/#enter_mpp(18)",
		"取消"}}})
		tinsert(tbOpt, {"加入五毒", SelectSay, {{"你想加入哪个流派？",
		"五毒邪侠/#enter_mpp(20)",
		"五毒蛊师/#enter_mpp(21)",
		"取消"}}})
		if GetSex() == 1 then
			tinsert(tbOpt, {"加入昆仑", SelectSay, {{"你想加入哪个流派？",
			"昆仑天师/#enter_mpp(23)",
			"昆仑剑尊/#enter_mpp(32)",
			"取消"}}})
		end
		if GetSex() == 2 then
			tinsert(tbOpt, {"加入翠烟", SelectSay, {{"你想加入哪个流派？",
			"翠烟舞仙/#enter_mpp(29)",
			"翠烟灵女/#enter_mpp(30)",
			"取消"}}})
		end
		tinsert(tbOpt, {"加入明教", SelectSay, {{"你想加入哪个流派？",
		"明教圣战/#enter_mpp(25)",
		"明教阵兵/#enter_mpp(26)",
		"明教血人/#enter_mpp(27)",
		"取消"}}})
		--tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"算了我再想想吧！"})
		xqx_CreateNewSayEx(szTitle, tbOpt)
	end
 
	
	if GetPlayerFaction() ~= 0 then
		local szTitle = "转职需花费<color=yellow>5个和氏壁<color>，转职后镇派技能升级到20级，你确定要转职业吗？"
		local tbOpt ={}
		tinsert(tbOpt, {"确定转职", function()
			-- SetPlayerRoute(0)
			-- Say("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常",0)
			-- Msg2Player("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常")
			-- CastState("state_vertigo",1,7*24*3600*18)	--长期眩晕，直至玩家重登游戏
			
			-- Include("script\\online\\gm_campaign\\gm_book_joinRoute.lua")
			-- xqx_Skill_joinRoute()
			selectRoute()
		end})
		tinsert(tbOpt, {"不了"})
		xqx_CreateNewSayEx(szTitle, tbOpt)
	else
		selectRoute()
	end
end

function xqx_Skill_ZhuxieManager(val)
	local SkillAction, res
	if val == 1 then    --学习诛邪技能
		SkillAction = LearnSkill
	elseif val == 2 then    --遗忘诛邪技能
		SkillAction = RemoveSkill
	elseif val == 0 then    --获取学习诛邪技能个数
		SkillAction = HaveLearnedSkill
	end
	res = 0
	if GetPlayerRoute() == 0 then	          --无门无派
		Msg2Player("请先加入门派再进行操作")
	elseif GetPlayerRoute() == 2 then	          --少林俗家
		res = res + SkillAction("屠魔刀法");
		res = res + SkillAction("诸法空相");
		res = res + SkillAction("无怖刀法");
	elseif GetPlayerRoute() == 3 then					--少林禅僧
		res = res + SkillAction("荡魔罡气");
		res = res + SkillAction("明镜非台");
		res = res + SkillAction("大悲咒");
	elseif GetPlayerRoute() == 4 then					--少林武僧
		res = res + SkillAction("梅花");
		res = res + SkillAction("游龙飞步");
		res = res + SkillAction("金刚怒目");
	elseif GetPlayerRoute() == 14 then					--武当道家
		res = res + SkillAction("真阳剑气");
		res = res + SkillAction("玄阴剑气");
		res = res + SkillAction("两仪内力");
	elseif GetPlayerRoute() == 15 then					--武当俗家
		res = res + SkillAction("逍遥笔法");
		res = res + SkillAction("沉醉吟");
		res = res + SkillAction("写意篇");
	elseif GetPlayerRoute() == 8 then					--峨嵋佛家
		res = res + SkillAction("比丘剑法");
		res = res + SkillAction("菩提证果剑");
	elseif GetPlayerRoute() == 9 then					--峨嵋俗家
		res = res + SkillAction("一剪梅");
		res = res + SkillAction("迎香曲");
		res = res + SkillAction("暗香疏影");
	elseif GetPlayerRoute() == 11 then					--丐帮净衣
		res = res + SkillAction("御龙掌法");
		res = res + SkillAction("山崩");
		res = res + SkillAction("醉八仙");
	elseif GetPlayerRoute() == 12 then					--丐帮污衣
		res = res + SkillAction("穷途棍法");
		res = res + SkillAction("棍扫六合");
		res = res + SkillAction("莲花阵");
	elseif GetPlayerRoute() == 6 then					--唐门
		res = res + SkillAction("穿心针");
		res = res + SkillAction("飞蝗针");
		res = res + SkillAction("引毒砂");
	elseif GetPlayerRoute() == 17 then					--杨门枪骑
		res = res + SkillAction("八方破灭枪");
		res = res + SkillAction("杨家狂雷枪");
		res = res + SkillAction("丹心决");
	elseif GetPlayerRoute() == 18 then					--杨门弓骑
		res = res + SkillAction("杨家迅发矢");
		res = res + SkillAction("杨家落日箭");
		res = res + SkillAction("挽月天狼阵");
	elseif GetPlayerRoute() == 20 then					--五毒邪侠
		res = res + SkillAction("五毒祭");
		res = res + SkillAction("尸毒刃");
		res = res + SkillAction("积尸气");
	elseif GetPlayerRoute() == 21 then					--五毒蛊师
		res = res + SkillAction("魇蛊");
		res = res + SkillAction("麒麟蛊");
		res = res + SkillAction("踏影蛊");
	elseif GetPlayerRoute() == 23 then					--昆仑天师
		res = res + SkillAction("落雷");
		res = res + SkillAction("旋风");
		res = res + SkillAction("风雷咒");
	elseif GetPlayerRoute() == 25 then					--明教圣战
		res = res + SkillAction("炎风");
		res = res + SkillAction("阳炎刀");
		res = res + SkillAction("焚身决");
	elseif GetPlayerRoute() == 26 then					--明教阵兵
		res = res + SkillAction("布阵")
		res = res + SkillAction("火蛇")
		res = res + SkillAction("圣火笔法")
	elseif GetPlayerRoute() == 27 then					--明教血人
		res = res + SkillAction("溢血爪");
		res = res + SkillAction("灭魂印");
		res = res + SkillAction("嗜血");
	elseif GetPlayerRoute() == 29 then					--翠烟舞仙
		res = res + SkillAction("霓裳羽衣舞");
		res = res + SkillAction("澄江似练");
		res = res + SkillAction("薄媚摘遍");
	elseif GetPlayerRoute() == 30 then					--翠烟灵女
		res = res + SkillAction("折花令");
		res = res + SkillAction("雨霖铃");
		res = res + SkillAction("玲珑四犯");
	elseif GetPlayerRoute() == 32 then					--昆仑剑尊
		res = res + SkillAction("惊蛰剑罡");
		res = res + SkillAction("凌霜剑气");
		res = res + SkillAction("炼剑-暮晓");
	elseif GetPlayerRoute() == 31 then					--唐门任侠
		res = res + SkillAction("回风");
		res = res + SkillAction("骤雨");
		res = res + SkillAction("幻杀阵");
	else
		Msg2Player("流派参数错误，请检查xqx_Skill_ZhuxieManager()")
	end;

	if val == 1 then    --学习诛邪技能
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		Msg2Player("诛邪技能学习完毕。")
	elseif val == 2 then    --遗忘诛邪技能
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		Msg2Player("诛邪技能已被移除。")
	elseif val == 0 then    --获取学习诛邪技能个数
		return res
	end
end


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)
	-- 字符串处理功能库
	Include("\\script\\lib\\string.lua");
	function SetTaskSayColor(str)
		local strKey = ":";
		local strKeyLeft = "{";
		local strKeyRight = "}";
		local strKeySex = "<sex>";
		local strPoint = strfind(str,strKey,1)
		local strName = "";
		local strColorText = str;

		local strSexChange = GetPlayerSex();

		if strPoint~=nil and strPoint>=1 then 
			strName = strsub(str, 1, strPoint-1);
			-- 处理人物名称颜色
			strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
		end;

		-- 处理重点标识颜色
		strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
		strColorText = join(split(strColorText,strKeyRight), "<color>");

		-- 处理性别标识
		strColorText = join(split(strColorText,strKeySex), strSexChange);

		str = strColorText;
		return str;
	end;
	function GetPlayerSex()
		local myTitel -- 用以显示人物称谓
		local nFactionID = GetPlayerFaction();

		if (GetSex() == 1) then
			if nFactionID ~= 0 then
				myTitel = PlayerFactionTitle[nFactionID][1];
			else
				myTitel = "少侠";
			end;
		end;

		if (GetSex() == 2) then
			if nFactionID ~= 0 then
				myTitel = PlayerFactionTitle[nFactionID][2];
			else
				myTitel = "女侠"
			end;
		end;

		return myTitel
	end

	local strMsg,strSel = "","";
	local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;