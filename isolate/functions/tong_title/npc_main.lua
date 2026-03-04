Include("\\script\\isolate\\functions\\tong_title\\daily_task.lua")
Include("\\script\\isolate\\functions\\tong_extension\\main.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\missions\\kuafu_boss\\bossfight_head.lua")
Import("\\script\\lib\\globalfunctions.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Cã thÓ gióp g× ®­îc b¹n ?")
    local tbSay = {}
    
    tinsert(tbSay, format("%s/desc", "Giíi thiÖu tÝnh n¨ng"))
    tinsert(tbSay, format("%s/npc_talk_finish_rand_task", "NhiÖm vô h»ng ngµy"))
    tinsert(tbSay, format("%s/open_equip_shop", "Cöa hµng Bang héi."))
    tinsert(tbSay, format("%s/TongExt_DevotionTalk", "Gãp vËt phÈm"))
    tinsert(tbSay, format("%s/TongExt_BuyBossTicket", "Mua TriÖu Gäi Phï"))
    tinsert(tbSay, format("%s/TongExt_GiveGiftTalk", "Ph¸t phóc lîi bang"))
    tinsert(tbSay, format("%s/GetKFBossAward", "NhËn th­ëng ChiÕn BOSS Liªn Server"))
    tinsert(tbSay, format("%s/Exchange_ZhiYangHuan", "§æi ChÝ D­¬ng Hoµn"))
    tinsert(tbSay, format("%s/nothing", "Ra khái"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function Exchange_ZhiYangHuan()
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "1 Th¸i NhÊt LÖnh ®æi 15 ChÝ D­¬ng Hoµn, ®ång ý?")
    local nTaiyi = GetItemCount(2,	1,	30687)
    if nTaiyi == 0 then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "1 Th¸i NhÊt LÖnh ®æi 15 ChÝ D­¬ng Hoµn, hiÖn kh«ng ®ñ Th¸i NhÊt LÖnh."))
        return
    end
    local tbSay = {}
    tinsert(tbSay, format("%s/Exchange_ZhiYangHuan_Confirm", "X¸c ®Þnh "))
    tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
    Say(szTitle, getn(tbSay), tbSay)
end

function Exchange_ZhiYangHuan_Confirm()
    local nTaiyi = GetItemCount(2,	1,	30687)
    AskClientForNumber("Exchange_ZhiYangHuan_CB",1,min(999,nTaiyi),"Th¸i NhÊt LÖnh MiÔn PhÝ");
end

function Exchange_ZhiYangHuan_CB(nCount)
    local nZhiyang = nCount * 15
    local needbag = ceil(nZhiyang / 9999) 
    if gf_Judge_Room_Weight(needbag,needbag,"") ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
        return
    end
    local nHave = GetItemCount(2,1,30687)
    if nHave  < nCount then
        Talk(1,"","HiÖn kh«ng ®ñ Th¸i NhÊt LÖnh!")
        return
    end
    if DelItem(2,	1,	30687, nCount) == 1 then
        AddItem(2,	1,	31255, nZhiyang)
    end
end


function desc()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Thiªn ¢m Gi¸o lui gi÷ ë T©y Vùc, trung nguyªn kh¾p n¬i ®­îc nghØ ng¬i ng¾n h¹n. Lóc nµy Vâ L©m Minh hy väng c¸c bang héi lín cã thÓ nhanh chãng lËp bang, båi d­ìng hiÖp sÜ c­êng m¹nh, chuÈn bÞ tèt c«ng viÖc chèng l¹i Thiªn ¢m Gi¸o quay trë l¹i, v× vËy Vâ L©m Minh ñy th¸c t«i ®Õn gióp ®ì mäi ng­êi, t«i sÏ c«ng bè mét sè nhiÖm vô cho c¸c vÞ, sau khi hoµn thµnh cã thÓ nhËn ®­îc ®é cèng hiÕn bang héi, nÕu hiÖp sÜ cã kÝch ho¹t thÎ th¸ng th× cßn cã thÓ nhËn ®­îc phÇn th­ëng gÊp béi. §é cèng hiÕn cã thÓ dïng ë trong bang héi ®Ó nhËn ®­îc danh hiÖu bang héi vµ cung cÊp tiªu hao danh hiÖu bang héi, còng cã thÓ ho¸n ®æi mét sè ®å vËt ë ®©y. Hy väng cã thÓ gióp ®­îc mäi ng­êi.")
    local tbSay = {}
    tinsert(tbSay, format("%s/npc_talk_main", "trë l¹i"))
    tinsert(tbSay, format("%s/nothing", "Ra khái"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function open_equip_shop()
	if GetTongName() == "" then
		Talk(1, "", "Mêi gia nhËp bang héi tr­íc")
		return 0
	end
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3068, "Cöa hµng Bang héi."))
end

function GetKFBossAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "§· qu¸ h¹n nhËn th­ëng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Thêi gian nhËn th­ëng BOSS Liªn Server lµ 22:00-23:59 ngµy diÔn ra thi ®Êu.")
	end
	local szMsg = "Tham dù ChiÕn BOSS Liªn Server sÏ ®­îc nhËn th­ëng hÊp dÉn."
	local tTab = {
		format("L·nh phÇn th­ëng bang héi/GetTongAward"),
		format("NhËn Th­ëng KÕt LiÔu-Bang Héi/GetTongLastHitAward"),
		format("NhËn Th­ëng KÕt LiÔu-C¸ Nh©n/GetPersonLastHitAward"),
		format("NhËn Th­ëng Tham Dù-C¸ Nh©n/GetPersonJoinAward"),
		format("\n hñy bá/nothing"),
	}
	Say(szMsg, getn(tTab), tTab)
end

function GetTongAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "§· qu¸ h¹n nhËn th­ëng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Thêi gian nhËn th­ëng BOSS Liªn Server lµ 22:00-23:59 ngµy diÔn ra thi ®Êu.")
	end

	local nTongDuty = GetTongDuty();
	if nTongDuty ~= 1 and nTongDuty ~= 2 and nTongDuty ~= 3 then
		return Talk(1,"","ChØ cã bang chñ, phã bang chñ hoÆc tr­ëng l·o míi cã thÓ nhËn phÇn th­ëng Bang héi")
	end

	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", g_TongAwardRecord[szRealmTongName][4]))
	end
	local sdb = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2)
	sdb:apply2(GetTongAwardCB)
end

function GetTongAwardCB(nCount, sdb)
	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", g_TongAwardRecord[szRealmTongName][4]))
	end
	for i = 0, nCount - 1 do
		local tData = sdb[i]
		gf_PrintTable(tData)
		if tData[1] and tData[1] == szRealmTongName and tData[2] == 1 then
			return Talk(1, "", "Thµnh viªn bang ta ®· nhËn th­ëng h¹ng bang héi råi.")
		end
	end
	local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2, 2)
	--local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2)
	sdb.sortType = 2
	sdb:apply2(GetTongRankData)
end

function GetTongRank(nCount, sdb)
	local nDate = gf_TodayDate()
	local szTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	local nRank = 0;
	local tData = {}
	for i = 0, nCount - 1 do
		tData = sdb[i]
		if szTongName == tData[1] then
			nRank = i + 1;
			break;
		end
	end
	--return 16, {16, 20000}
	return nRank, tData
end

function GetTongRankData(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Yªu cÇu sè liÖu liªn server thÊt b¹i.")
	end
	local nRank, tData = GetTongRank(nCount, sdb)
	if nRank <= 0 then
		return Talk(1, "", "Bang cña ®¹i hiÖp kh«ng tham dù ho¹t ®éng lÇn nµy, kh«ng thÓ nhËn th­ëng")
	end
	
	if nRank <= 15 then
		GiveTongRankAward(nRank, tData)
	else
		GiveTongJoinAward(nRank, tData)
	end
end

function GiveTongRankAward(nRank, tData)
	local szMsg = format("Bang cña ®¹i hiÖp nhËn %f ®iÓm trong ho¹t ®éng lÇn nµy, ®¹t h¹ng %d", tData[2], nRank)
	local tSel  = {
		format("NhËn phÇn th­ëng xÕp h¹ng/#GetRankAward(%d, %d)",tData[2], nRank),
		"\n t¹m thêi ch­a muèn/nothing",
	}
	print("GiveTongRankAward")
	Say(szMsg, getn(tSel), tSel)
end

function GetRankAward(nScore, nRank)
	
	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", g_TongAwardRecord[szRealmTongName][4]))
	end
	local s = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2);
	s:apply2(callout(GetRankAwardCB, nScore, nRank));
end

function GetRankAwardCB(nScore, nRank, nCount, sdb)
	local nBagCount = g_tTongRankBagCount[nRank]
	if not nBagCount then
		return Talk(1, "", format("Bang cña ®¹i hiÖp ®¹t h¹ng %d, kh«ng thÓ nhËn th­ëng h¹ng."))
	end
	
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	local tData = sdb[RealmTongName];
	if g_TongAwardRecord[RealmTongName] and g_TongAwardRecord[RealmTongName][1] == 1 then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", g_TongAwardRecord[RealmTongName][4]))
	end
	if tData and tData[1] == 1 and tData[4] then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", tData[4]))
	end
	sdb[RealmTongName] = {"ddds", 1, nRank, nScore, GetName()};
	g_TongAwardRecord[RealmTongName] = {1, nRank, nScore, GetName()};
	
	--¸ø½±Àø
	gf_AddItemEx2({2,1,31418,nBagCount}, "Tói Quµ BOSS Liªn Server", "Ho¹t ®éng BOSS Liªn Server", "NhËn Th­ëng H¹ng BOSS Liªn Server", 0, 1)
	
	AddRuntimeStat(102, 1, 0, 1);
	
end

function checkJoinAward(nRank, tData)
	if tData[2] > 1000 then
		return 1
	end
	return 0
end

function GiveTongJoinAward(nRank, tData)
	if checkJoinAward(nRank, tData) ~= 1 then
		return Talk(1, "", "Bang cña ®¹i hiÖp ch­a nhËn ®­îc th­ëng trong ho¹t ®éng BOSS Liªn Server.")
	end
	
	local szMsg = format("Bang cña ®¹i hiÖp nhËn %f ®iÓm trong ho¹t ®éng lÇn nµy, ®¹t h¹ng %d, thÓ hiÖn tÝch cùc, nhËn ®­îc Th­ëng Tham Dù.", tData[2], nRank)
	local tSel  = {
		format("NhËn Th­ëng Tham Dù/#GetTongJoinAward2(%d, %d)",tData[2], nRank),
		"\n t¹m thêi ch­a muèn/nothing",
	}
	Say(szMsg, getn(tSel), tSel)
end

function GetTongJoinAward2(nScore, nRank)
	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", tData[4]))
	end
	local s = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2);
	s:reflash();
	s:apply2(callout(GetTongJoinAwardCB, nScore, nRank));
end

function GetTongJoinAwardCB(nScore, nRank, nCount, sdb)
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	local tData = sdb[RealmTongName];
	if g_TongAwardRecord[RealmTongName] and g_TongAwardRecord[RealmTongName][1] == 1 then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", g_TongAwardRecord[RealmTongName][4]))
	end
	
	if tData and tData[1] == 1 and tData[4] then
		return Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s bang ta nhËn råi.", tData[4]))
	end

	sdb[RealmTongName] = {"ddds", 1, nRank, nScore, GetName()};
	g_TongAwardRecord[RealmTongName] = {1, nRank, nScore, GetName()};
		--¸ø½±Àø
	gf_AddItemEx2({2,1,31418,2}, "Tói Quµ BOSS Liªn Server", "Ho¹t ®éng BOSS Liªn Server", "NhËn Th­ëng Tham Dù BOSS Liªn Server", 0, 1)
	
	AddRuntimeStat(102, 1, 0, 1);
end

function GetTongLastHitAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "§· qu¸ h¹n nhËn th­ëng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Thêi gian nhËn th­ëng BOSS Liªn Server lµ 22:00-23:59 ngµy diÔn ra thi ®Êu.")
	end

	local nTongDuty = GetTongDuty();
	if nTongDuty ~= 1 and nTongDuty ~= 2 and nTongDuty ~= 3 then
		return Talk(1,"","ChØ cã bang chñ, phã bang chñ hoÆc tr­ëng l·o míi cã thÓ nhËn phÇn th­ëng Bang héi kÕt liÔu Boss thËt")
	end

	if not g_LastHit then
		local s = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
		s:apply2(GetTongLastHitData);
		--s:delete()
	else
		if checkTongLastHit(g_LastHit) ~= 1 then
			return
		end
		GiveTongLastHitAward()
	end
end

function checkTongLastHit(tData)
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if not (tData and tData[3] and tData[3] == RealmTongName) then
		Talk(1, "", "Bang cña ®¹i hiÖp kh«ng ph¶i ng­êi kÕt liÔu BOSS, kh«ng thÓ nhËn th­ëng nµy.")
		return 0
	end
	if tonumber(tData[4]) == 1 then
		Talk(1, "", format("PhÇn th­ëng ®· ®­îc %s trong bang cña ®¹i hiÖp nhËn råi.", tData[5]))
		return 0
	end
	return 1
end

function GetTongLastHitData(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Bang cña ®¹i hiÖp kh«ng ph¶i ng­êi kÕt liÔu BOSS, kh«ng thÓ nhËn th­ëng nµy.")
	end
	local tData = sdb["LastHit"]
	g_LastHit = tData
	if checkTongLastHit(tData) ~= 1 then
		return
	end
	GiveTongLastHitAward()
end

function GiveTongLastHitAward()
	--¼ÇÂ¼Áì½±¼ÇÂ¼
	g_LastHit				 = {g_LastHit[1], g_LastHit[2], g_LastHit[3], 1, GetName()}
	local sdb				 = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
	sdb["LastHit"]   = {"sdsds", g_LastHit[1], g_LastHit[2], g_LastHit[3], 1, GetName()}
	--¸ø½±Àø
	gf_AddItemEx2({2,95,204,5},"Thiªn Cang LÖnh", "Ho¹t ®éng BOSS Liªn Server", "Th­ëng KÕt LiÔu BOSS Liªn Serve (Bang)", 0, 1)
	gf_AddItemEx2({2,1,30370,5},"Thiªn M«n Kim LÖnh", "Ho¹t ®éng BOSS Liªn Server", "Th­ëng KÕt LiÔu BOSS Liªn Serve (Bang)", 0, 1)
	AddRuntimeStat(102, 2, 0, 1);
end

function GetPersonLastHitAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "§· qu¸ h¹n nhËn th­ëng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Thêi gian nhËn th­ëng BOSS Liªn Server lµ 22:00-23:59 ngµy diÔn ra thi ®Êu.")
	end
	if not g_LastHit then
		local s = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
		s:apply2(GetPersonLastHitData);
	else
		if checkPersonLastHit(g_LastHit) ~= 1 then
			return
		end
		GivePersonLastHitAward()
	end
end

function checkPersonLastHit(tData)
	local RealmName = format("%s*%s", GetRouterGroupName(), GetName());
	if not (tData and tData[1] and tData[1] == RealmName) then
		Talk(1, "", "§¹i hiÖp kh«ng ph¶i ng­êi kÕt liÔu BOSS, kh«ng thÓ nhËn th­ëng nµy.")
		return 0
	end
	
	if tonumber(tData[2]) == 1 then
		Talk(1, "", "Kh«ng thÓ nhËn th­ëng nhiÒu lÇn.")
		return 0
	end
	return 1
end

function GetPersonLastHitData(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Bang cña ®¹i hiÖp kh«ng ph¶i ng­êi kÕt liÔu BOSS, kh«ng thÓ nhËn th­ëng nµy.")
	end
	
	local tData = sdb["LastHit"]
	g_LastHit 	= tData
	
	if checkPersonLastHit(tData) ~= 1 then
		return
	end
	
	GivePersonLastHitAward()
end

function GivePersonLastHitAward()
	--¼ÇÂ¼Áì½±¼ÇÂ¼
	g_LastHit				 = {g_LastHit[1], 1, g_LastHit[3], g_LastHit[4], g_LastHit[5]}
	local sdb				 = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
	sdb["LastHit"]   = {"sdsds", g_LastHit[1], 1, g_LastHit[3], g_LastHit[4], g_LastHit[5]}
	--¸ø½±Àø
	gf_AddItemEx2({2,95,204,2},"Thiªn Cang LÖnh", "Ho¹t ®éng BOSS Liªn Server", "Th­ëng KÕt LiÔu BOSS Liªn Serve (C¸ Nh©n)", 0, 1)
	gf_AddItemEx2({2,1,30370,2},"Thiªn M«n Kim LÖnh", "Ho¹t ®éng BOSS Liªn Server", "Th­ëng KÕt LiÔu BOSS Liªn Serve (C¸ Nh©n)", 0, 1)
	
	AddRuntimeStat(102, 3, 0, 1);
end

KFB_TSKID_ACTIVE_POINT 						= 3593
KFB_TASKID_PERSON_JOIN_AWARD_FLAG = 3597

function GetPersonJoinAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "§· qu¸ h¹n nhËn th­ëng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Thêi gian nhËn th­ëng BOSS Liªn Server lµ 22:00-23:59 ngµy diÔn ra thi ®Êu.")
	end
	if GetTask(KFB_TSKID_ACTIVE_POINT) < 5 then
		return Talk(1, "", "§iÓm n¨ng ®éng kh«ng ®ñ, kh«ng thÓ nhËn th­ëng.")
	end
	
	if GetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG) > 0 then
		return Talk(1, "", "§· nhËn th­ëng råi, kh«ng thÓ nhËn l¹i.")
	end
	
	local szTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szTongName] then
		local nRank = g_TongAwardRecord[szTongName][2]
		gf_SetLogCaption("KuaFuBossPersonalJoinAward")
		if nRank > 15 then
			gf_Modify("Exp", 300000000)
		else
			gf_Modify("Exp", 600000000)
		end
		gf_SetLogCaption("")
		SetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG, 1)
		AddRuntimeStat(102, 4, 0, 1);
		return
	end
	
	local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2, 2)
	sdb.sortType = 2
	sdb:apply2(GetTongRankData2)
	
end

function GetTongRankData2(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Yªu cÇu sè liÖu liªn server thÊt b¹i.")
	end
	local nRank, tData = GetTongRank(nCount, sdb)
	
	if nRank <= 0 then
		return Talk(1, "", "Bang cña ®¹i hiÖp kh«ng tham dù ho¹t ®éng lÇn nµy, kh«ng thÓ nhËn th­ëng")
	end
	
	if GetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG) > 0 then
		return Talk(1, "", "§· nhËn th­ëng råi, kh«ng thÓ nhËn l¹i.")
	end
	
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	g_TongAwardRecord[RealmTongName] = {0, nRank, tData[2], ""};
	gf_SetLogCaption("KuaFuBossPersonalJoinAward")
	if nRank > 15 then
		gf_Modify("Exp", 300000000)
	else
		gf_Modify("Exp", 600000000)
	end
	gf_SetLogCaption("")
	SetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG, 1)
	AddRuntimeStat(102, 4, 0, 1);
end