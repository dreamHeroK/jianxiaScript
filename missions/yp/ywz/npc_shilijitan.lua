Import("\\script\\lib\\talktmp.lua")
Import("\\script\\missions\\yp\\ywz\\head.lua")
Import("\\script\\isolate\\functions\\tong_title\\head.lua")

NPC_FORMAT = "<color=green>%s<color>:";

function main()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","Event vÉn ch­a khëi ®éng");
		return 0;
	end
	local npcName = GetNpcName(GetTargetNpc());
	local s  = SDB(YWZ_SHARE_DATA, 1, 0);
	s:apply2(callout(main_CB, npcName));
end

function main_CB(npcName, nCount, sdb)
	local weekly = gf_GetWeekly();
	local nFlag = nil;
	if nCount == 1 then
		local tData = sdb[0];
		if tData[1] == "WeekFlag" and tonumber(tData[2]) == weekly then
			nFlag = 1;
		end
	end
	if not nFlag then
		local s = SDB(YWZ_SHARE_DATA, 1, 0);
		s["WeekFlag"] = {"d", weekly};
		for i = 0, 3 do
			s = SDB(YWZ_SHARE_DATA, 0, i);
			s:delete();
		end
		SetGlbValue(GLV_YWZ_PROTECT_CAMP, 0);
	end
	local tNpc2Shili = {
		["TÕ §µn §¹i Lý"] = 1,
		["TÕ §µn Thæ Phån"] = 2,
		["TÕ §µn T©y H¹"] = 3,
	}
	local msg = format(NPC_FORMAT, npcName);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"",msg.."B¹n ch­a gia nhËp thÕ lùc, kh«ng thÓ tham gia DiÔn Vâ ChiÕn.")
		return 0;
	end
	if tNpc2Shili[npcName] ~= nCamp then
		Talk(1,"",msg.."B¹n ®· gia nhËp thÕ lùc kh¸c, sao cßn ®Õn t×m ta ®Ó lµm g×? Hay lµ cã ©m m­u kh¸c?");
		return 0;
	end
	if ywz_GetStep() ~= 1 then
		Talk(1,"",msg.."Giai ®o¹n 1 ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn ®· kÕt thóc.");
		return 0;
	end
	local tSay = {
		"\n Giíi thiÖu ho¹t ®éng/sljt_info",
		"\nLiªn quan x©y dùng tÕ ®µn thÕ lùc/sljt_func",
		"\nQuy t¾c ho¹t ®éng/sljt_rule",
		"\n Tho¸t /nothing",
	}
	Say(msg..format("%s, ta cã thÓ gióp ®­îc g× ®©y?", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function sljt_info()
	local tSay = {};
	local npcName = GetNpcName(GetTargetNpc());
	tSay.msg = format(NPC_FORMAT, npcName)..format("ThÕ lùc Thiªn ¢m Gi¸o dÇn lui khái trung nguyªn, kh«i phôc nguyªn khÝ. TriÒu ®×nh nh»m muèn ng¨n chÆn sù ph¶n c«ng cña Thiªn ¢m Gi¸o, quyÕt ®Þnh t¨ng c­êng søc m¹nh cña vâ l©m, ban th­ëng lín cho ThÕ Lùc Ba Phe tiÕn hµnh diÔn vâ, ®Ó xÕp h¹ng cho 3 thÕ lùc; ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn chia thµnh 2 giai ®o¹n: X©y dùng tÕ ®µn thÕ lùc vµ ThÕ Lùc Ba Phe DiÔn Vâ; trong ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn, ®¹i hiÖp cã biÓu hiÖn kiÖt xuÊt sÏ nhËn ®­îc thªm phÇn th­ëng. Hy väng cã thÓ gióp ®ì mäi ng­êi.");
	tSay.sel = {
		{"\n Ph¶n håi", "main"},
		{"\n Tho¸t ", "nothing"},
	};
	temp_Talk(tSay);
end

function sljt_func()
	local npcName = GetNpcName(GetTargetNpc());
	local lastWeekTaskCount = ywz_GetWeekTaskCount();
	local lastExAwardCount = ywz_GetExAwardCount();
	local tSay = {
		format("NhiÖm vô tuÇn (TuÇn nµy cßn ®­îc hoµn thµnh %d lÇn)/#sljt_WeekTask(%d)", lastWeekTaskCount, lastWeekTaskCount),
		format("Cèng hiÕn Thiªn Kiªu LÖnh (TuÇn nµy cßn %d lÇn nhËn th­ëng thªm)/#sljt_IBTask(%d)", lastExAwardCount, lastExAwardCount),
		"Xem ®é x©y dùng tÕ ®µn thÕ lùc/sljt_ShowShiLiRank",
		format("Xem xÕp h¹ng ®iÓm x©y dùng cña thÕ lùc/sljt_ShowPlayerRank"),
		"\n Ph¶n håi/main",
		"Rêi khái/nothing",
	}
	Say(format(NPC_FORMAT, npcName)..format("§iÓm x©y dùng hiÖn t¹i lµ %d ®iÓm.", ywz_GetScore()), getn(tSay), tSay);
end

function sljt_WeekTask(nTime, bCost)
	if ywz_GetStep() ~= 1 then
		Talk(1,"",msg.."Giai ®o¹n 1 ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn ®· kÕt thóc.");
		return 0;
	end
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	local nIndex = ywz_GetWeekTaskIndex();
	local nMaxCount = ywz_GetKillMax();
	local nCurrCount = ywz_GetCurrKill();
	if 0 == nIndex then
		if nTime <= 0 then
			Talk(1,"",npcName.."§· dïng hÕt sè lÇn nhiÖm vô tuÇn cña tuÇn nµy.");
			return 0;
		end
		if not bCost then
			local npcName = GetNpcName(GetTargetNpc());
			local tSay = {
				format("NhËn nhiÖm vô (Tiªu hao %d ®iÓm cèng hiÕn bang)/#sljt_WeekTask(%d, 1)", 4, nTime),
				"\n Ph¶n håi/sljt_func",
				"Rêi khái/nothing",
			}
			Say(format(NPC_FORMAT, npcName)..format("§iÓm x©y dùng hiÖn t¹i lµ %d ®iÓm.", ywz_GetScore()), getn(tSay), tSay);
			return 0;
		else
			if get_tong_gxd() < 4 then
				Talk(1,"","§iÓm cèng hiÕn bang kh«ng ®ñ, kh«ng thÓ nhËn nhiÖm vô.");
				return 0;
			end
			if dec_tong_gxd(4) == -1 then
				return 0;
			end
			Msg2Player(format("§· tiªu hao %d ®iÓm cèng hiÕn bang", 4));
		end
		local nRandomIndex = random(getn(YWZ_WEEK_TASK_TABLE));
		local tItem = YWZ_WEEK_TASK_TABLE[nRandomIndex];
		ywz_SetWeekTaskIndex(nRandomIndex);
		ywz_SetKillMax(tItem[1]);
		ywz_AddCurrKill(-nCurrCount);
		ywz_AddWeekTaskCount(1);
		if ywz_GetWeekTaskCount() == 0 then
			AddRuntimeStat(36, 2, 0, 1);
		end
		local msg = format("§Õn %s, tiªu diÖt %d %s", tItem[3], tItem[1], tItem[2]);
		Talk(1,"",npcName..msg);
		TaskTip(msg);
	else
		local tItem = YWZ_WEEK_TASK_TABLE[nIndex];
		if not tItem then
			ywz_SetWeekTaskIndex(0);
			return 0;
		end
		local msg = format("§Õn %s, tiªu diÖt %d %s", tItem[3], tItem[1], tItem[2]);
		local szStatus = "(ch­a hoµn thµnh)"
		local tSay = {}
		if nCurrCount >= nMaxCount then
			szStatus = "(®· hoµn thµnh)";
			tinsert(tSay, "Hoµn thµnh nhiÖm vô/sljt_WeekTask_Finish");
		end
		tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
		Say(npcName..msg..szStatus, getn(tSay), tSay);
	end
end

function sljt_WeekTask_Finish()
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	if gf_Judge_Room_Weight(1, 10, npcName) ~= 1 then
		return 0;
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(sljt_WeekTask_Finish_CB);
end

function sljt_WeekTask_Finish_CB(nCount, sdb)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nValue = 10;
	for i = 1, nCount do
		local tData = sdb[i-1];
		if tonumber(tData[1]) == nCamp then
			nValue = nValue + tonumber(tData[2]);
		end
	end
	ywz_SetWeekTaskIndex(0);
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s.sortType = 2;
	s[nCamp] = {"d", nValue};
	Msg2Player(format("TÕ ®µn thÕ lùc t¨ng %d ®iÓm cèng hiÕn", 10));
	ywz_AddScore(5);
	Msg2Player(format("NhËn ®­îc %d ®iÓm x©y dùng", 5));
	local ss= SDB(YWZ_SHARE_DATA, 0, nCamp);
	ss.sortType = 2;
	ss[GetName()] = {"d", ywz_GetScore()};
	ModifyPopur(50);
	Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm tu luyÖn", 50));
	local tLimit = {40, 30, 20, 10, 0}; -- Ã¿10´ÎÍê³É¸øÒ»¸ö
	local lastCount = ywz_GetWeekTaskCount();
	for i = 1, getn(tLimit) do
		if tLimit[i] == lastCount then
			gf_AddItemEx2({2, 1, 30969, 1}, "Anh Dòng Chøng", "ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn", "NhiÖm vô tuÇn", 0, 1);
			AddRuntimeStat(36, 5, 0, 1);
		end
	end
	AddRuntimeStat(36, 1, 0, 1);
	TriggerMisEvent("event_ywz_taskfinish", "NhiÖm vô tuÇn", YWZ_WEEK_TASK_LIMIT-lastCount);
end

function sljt_IBTask(nTimes, bEnsure)
	if ywz_GetStep() ~= 1 then
		Talk(1,"",msg.."Giai ®o¹n 1 ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn ®· kÕt thóc.");
		return 0;
	end
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	if gf_Judge_Room_Weight(1, 10, npcName) ~= 1 then
		return 0;
	end
	if GetItemCount(2, 97, 236) < 1 then
		Talk(1,"",npcName..format("Trong tói kh«ng cã %s", "Thiªn Kiªu LÖnh"));
		return 0;
	end
	if not bEnsure then
		Say(format("Muèn giao nép %d Thiªn Kiªu LÖnh?", 1), 2, format("\nX¸c nhËn/#sljt_IBTask(%d, %d)", nTimes, 1), "\n vÒ sau xem l¹i/nothing");
		return 0;
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(callout(sljt_IBTask_CB, nTimes));
end

function sljt_IBTask_CB(nTimes, nCount, sdb)
	if DelItem(2, 97, 236, 1) ~= 1 then
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nValue = 30;
	for i = 1, nCount do
		local tData = sdb[i-1];
		if tonumber(tData[1]) == nCamp then
			nValue = nValue + tonumber(tData[2]);
		end
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s.sortType = 2;
	s[nCamp] = {"d", nValue};
	Msg2Player(format("TÕ ®µn thÕ lùc t¨ng %d ®iÓm cèng hiÕn", 30));
	ywz_AddScore(20);
	Msg2Player(format("NhËn ®­îc %d ®iÓm x©y dùng", 20));
	local ss= SDB(YWZ_SHARE_DATA, 0, nCamp);
	ss.sortType = 2;
	ss[GetName()] = {"d", ywz_GetScore()};
	if nTimes > 0 then
		ywz_AddExAwardCount(1);
		if ywz_GetExAwardCount() == 0 then
			AddRuntimeStat(36, 4, 0, 1);
		end
		gf_AddItemEx2({2, 1, 30968, 1}, "R­¬ng X©y Dùng ThÕ Lùc", "ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn", "Cèng hiÕn Thiªn Kiªu LÖnh", 0, 1);
		ModifyPopur(50);
		Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm tu luyÖn", 50));
		AddRuntimeStat(41, 6, 0, 1);
	end
	FireEvent("event_ib_cost", 2, 97, 236, 1);
	AddRuntimeStat(36, 3, 0, 1);
end

function sljt_ShowShiLiRank()
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(sljt_ShowShiLiRank_SB);
end

function sljt_ShowShiLiRank_SB(nCount, sdb)
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	local tSay = {};
	local tCamp2Name = {
		[1] = "TÕ §µn §¹i Lý",
		[2] = "TÕ §µn Thæ Phån",
		[3] = "TÕ §µn T©y H¹",
	}
	local nRank = 1;
	for i = 1, nCount do
		local tData = sdb[i-1];
		local lastData = sdb[i-2];
		local nCamp = tonumber(tData[1])
		local nScore = tonumber(tData[2]);
		if not tCamp2Name[nCamp] then error(format("camp = %d", nCamp)); end
		if lastData and getn(lastData) == 2 and nScore < tonumber(lastData[2]) then
			nRank = nRank + 1;
		end
		tinsert(tSay, format("H¹ng %d [%s] (§é x©y dùng %d)", nRank, tCamp2Name[nCamp], nScore));
	end
	tinsert(tSay, "\n Ph¶n håi/main");
	Say(npcName.."ThÕ Lùc Ba Phe-H¹ng ®é x©y dùng hiÖn t¹i:", getn(tSay), tSay);
end

function sljt_ShowPlayerRank()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local s = SDB(YWZ_SHARE_DATA, 0, nCamp);
	s:apply2(sljt_ShowPlayerRank_SB);
end

function sljt_ShowPlayerRank_SB(nCount, sdb)
	local tSay = {};
	local npcName = GetNpcName(GetTargetNpc());
	tSay.sel = {};
	local nRank = 0;--1;
	local szName = GetName();
	local nMyRank = 0;
	local nMyScore = 0;
	for i = 1, nCount do
		local tData = sdb[i-1];
		local nScore = tonumber(tData[2]);
		--local lastData = sdb[i-2];
		--if lastData and getn(lastData) == 2 and nScore < tonumber(lastData[2]) then
			nRank = nRank + 1;
		--end
		if szName == tData[1] then
			nMyRank = nRank;
			nMyScore = nScore;
			if nRank > 5 then
				break;
			end
		end
		if nRank <= 5 then
			tinsert(tSay.sel, {format("H¹ng %d [%s](§iÓm x©y dùng %d)", nRank, tData[1], nScore), "nothing"});
		end
	end
	tinsert(tSay.sel, {"\n Ph¶n håi", "main"});
	tSay.msg = format(NPC_FORMAT, npcName)..format("§iÓm x©y dùng hiÖn t¹i lµ <color=green>%d<color>, h¹ng <color=green>%d<color>.", nMyScore, nMyRank);
	temp_Talk(tSay);
end

function sljt_rule()
	local tSay = {};
	local npcName = GetNpcName(GetTargetNpc());
	tSay.msg = format(NPC_FORMAT, npcName).."1. Thêi gian giai ®o¹n 1 cña ho¹t ®éng lµ 00:00 thø 2 ®Õn 23:00 thø 6 h»ng tuÇn\n2. §iÒu kiÖn tham gia: Ng­êi ch¬i ®· gia nhËp thÕ lùc.\n3. H»ng tuÇn ng­êi ch¬i tèi ®a chØ ®­îc hoµn thµnh 50 nhiÖm vô tuÇn, mçi lÇn nhËn 1 nhiÖm vô tuÇn cÇn tiªu hao Hµo HiÖp LÖnh.\n4. NÕu trong giai ®o¹n 1 cña ho¹t ®éng ng­êi ch¬i tiÕn hµnh ®æi thÕ lùc, th× ®iÓm x©y dùng cña ng­êi ch¬i ®ã chØ gi÷ l¹i 50%, vµ sè lÇn nhiÖm vô tuÇn ®· hoµn thµnh vµ sè lÇn cèng hiÕn Thiªn Kiªu LÖnh (tr­íc 15 lÇn) kh«ng bÞ ¶nh h­ëng.\n5. Trong giai ®o¹n 1 cña ho¹t ®éng, ng­êi ch¬i cÇn ®¹t 120 ®iÓm x©y dùng míi ®­îc nhËn th­ëng xÕp h¹ng thÕ lùc; ®¹t 300 ®iÓm x©y dùng míi ®­îc nhËn th­ëng n¨ng ®éng x©y dùng thÕ lùc; ®¹t 950 ®iÓm x©y dùng vµ tháa ®iÒu kiÖn xÕp h¹ng míi nhËn ®­îc phÇn th­ëng h¹ng 1-h¹ng 3.\n6. Trong giai ®o¹n 1, ®iÓm x©y dùng thÕ lùc cña ng­êi ch¬i n»m trong TOP 100 míi ®­îc vµo giai ®o¹n 2 cña ho¹t ®éng.\n7. NÕu ng­êi ch¬i trong kho¶ng thêi gian kÕt thóc giai ®o¹n 1 vµ ch­a b¾t ®Çu giai ®o¹n 2 tiÕn hµnh chuyÓn thÕ lùc, th× ng­êi ch¬i sÏ mÊt t­ c¸ch tham gia giai ®o¹n 2 cña ho¹t ®éng.\n8. Trong giai ®o¹n 1, ng­êi ch¬i nhËn ®­îc Anh Dòng Chøng cã thÓ ®æi d­îc phÈm trong tiÖm d­îc phÈm Ba Phe DiÔn Vâ t¹i b¶n ®é thÕ lùc m×nh, npc tiÖm d­îc phÈm ®ã c¶u ba phe lµ: lý Nguyªn Hóc, §o¹n BÝch, T¸n Phæ Kham Bé.T¸n Phæ Kham Bé.";
	tSay.sel = {
		{"\n Ph¶n håi", "main"},
		{"\n Tho¸t ", "nothing"},
	};
	temp_Talk(tSay);
end
