Import("\\script\\missions\\yp\\ywz\\head.lua")
Import("\\script\\missions\\yp\\ywz\\mission_head.lua")

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
	local tSay = {
		"PhÇn th­ëng giai ®o¹n 1/ywz_GetAward1",
		"PhÇn th­ëng giai ®o¹n 2/ywz_GetAward2",
		"Quy t¾c nhËn th­ëng/ywz_GetAwardInfo",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("™ chç cña ta cã thÓ nhËn th­ëng liªn quan ®Õn ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn, thêi gian nhËn th­ëng giai ®o¹n 1 lµ: <color=green>00:00-18:00 thø 7<color>, thêi gian nhËn th­ëng giai ®o¹n 2 lµ: <color=green>21:00-23:00 thø 7<color>", getn(tSay), tSay);
end

function ywz_GetAward1()
	if ywz_GetStep() ~= 2 then
		Talk(1,"","HiÖn kh«ng ph¶i thêi gian nhËn th­ëng.");
		return 0;
	end
	local tSay = {
		"NhËn th­ëng xÕp h¹ng thÕ lùc/ywz_GetAward1_RankAward",
		"NhËn th­ëng ®é n¨ng ®éng x©y dùng/ywz_GetAward1_AcitivtyAward",
		"NhËn th­ëng xÕp h¹ng c¸ nh©n/ywz_GetAward1_PlayerRankAward",
		"Ra khái/nothing",
	}
	Say("PhÇn th­ëng giai ®o¹n 1 ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn:", getn(tSay), tSay);
end

function ywz_GetAward2()
	if ywz_GetStep() ~= 4 then
		Talk(1,"","HiÖn kh«ng ph¶i thêi gian nhËn th­ëng.");
		return 0;
	end
	if gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 4) ~= 1 then
		Talk(1,"","DiÔn Vâ ChiÕn bÞ tho¸t ra bÊt th­êng, thµnh tÝch v« hiÖu.");
		return 0;
	end
	local tSay = {
		"NhËn th­ëng xÕp h¹ng thÕ lùc/ywz_GetAward2_RankAward",
		"NhËn th­ëng xÕp h¹ng c¸ nh©n/ywz_GetAward2_PlayerRankAward",
		"NhËn phÇn th­ëng n¨ng ®éng diÔn vâ/ywz_GetAward2_ActivityAward",
		"Ra khái/nothing",
	}
	Say("PhÇn th­ëng giai ®o¹n 2 ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn:", getn(tSay), tSay);
end

function ywz_GetAward1_RankAward()
	if ywz_GetAward1Flag1() ~= 0 then
		Talk(1,"","§· nhËn phÇn th­ëng nµy råi.");
		return 0;
	end
	local nScore = ywz_GetScore();
	if nScore < 120 then
		Talk(1,"",format("§iÓm x©y dùng cña b¹n lµ %d, kh«ng ®ñ %d ®iÓm, kh«ng thÓ nhËn th­ëng xÕp h¹ng thÕ lùc.", nScore, 120));
		return 0;
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(ywz_GetAward1_RankAward_CB);
end

function ywz_GetAward1_RankAward_CB(nCount, sdb)
	--gf_PrintTable(sdb)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP)
	local nRank = 1;
	local bFlag = nil;
	for i = 1, nCount do
		local tData = sdb[i-1];
		local lastData = sdb[i-2];
		if lastData and getn(lastData) == 2 and tonumber(tData[2]) < tonumber(lastData[2]) then
			nRank = nRank + 1;
		end
		if tonumber(tData[1]) == nCamp then
			bFlag = 1;
			break
		end
	end
	if not bFlag then
		Talk(1,"","ThÕ lùc kh«ng cã b¶ng xÕp h¹ng ®iÓm x©y dùng tÕ ®µn, kh«ng thÓ nhËn th­ëng.")
		return 0;
	end
	local tAwardString = {
		"SLYWZ_YJSLPMJ_a",
		"SLYWZ_YJSLPMJ_b",
		"SLYWZ_YJSLPMJ_c",
	}
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then
		return 0;
	end
	ywz_SetAward1Flag1(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
	AddRuntimeStat(36, 11, 0, 1);
end

function ywz_GetAward1_AcitivtyAward()
	if ywz_GetAward1Flag2() ~= 0 then
		Talk(1,"","§· nhËn phÇn th­ëng nµy råi.");
		return 0;
	end
	local nScore = ywz_GetScore();
	if nScore < 300 then
		Talk(1,"",format("§iÓm x©y dùng cña b¹n lµ %d, kh«ng ®ñ %d ®iÓm, kh«ng thÓ nhËn th­ëng xÕp h¹ng thÕ lùc.", nScore, 300));
		return 0;
	end
	ywz_SetAward1Flag2(1);
	if CustomAwardCheckCondition("SLYWZ_YJJSHYJ") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("SLYWZ_YJJSHYJ", 1);
	AddRuntimeStat(36, 7, 0, 1);
	TriggerMisEvent("event_ywz_taskfinish", "§iÓm x©y dùng c¸ nh©n ®¹t 300", nScore);
end

function ywz_GetAward1_PlayerRankAward()
	if ywz_GetAward1Flag3() ~= 0 then
		Talk(1,"","§· nhËn phÇn th­ëng nµy råi.");
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP)
	local s = SDB(YWZ_SHARE_DATA, 0, nCamp);
	s:apply2(ywz_GetAward1_PlayerRankAward_CB);
end

function ywz_GetAward1_PlayerRankAward_CB(nCount, sdb)
	--gf_PrintTable(sdb);
	local szName = GetName();
	local nRank = 0;--1;
	local nScore = 0;
	for i = 1, nCount do
		local tData = sdb[i-1];
		--local lastData = sdb[i-2];
		--if lastData and getn(lastData) == 2 and tonumber(tData[2]) < tonumber(lastData[2]) then
			nRank = nRank + 1;
		--end
		if tData[1] == szName then
			nScore = tonumber(tData[2])
			break;
		end
	end
	if nScore == 0 then
		Talk(1, "", "H¹ng qu¸ thÊp kh«ng thÓ nhËn th­ëng.");
		return 0;
	end
	if nCount <=0 or nRank > 3 then
		Talk(1,"",format("H¹ng cña b¹n lµ <color=red>%d<color>, thÊp h¬n h¹ng %d, kh«ng thÓ nhËn th­ëng.", nRank, 3));
		return 0;
	end
	if nScore < 950 then
		Talk(1,"",format("§iÓm x©y dùng c¸ nh©n ch­a ®¹t %d, kh«ng thÓ nhËn th­ëng.", 950));
		return 0;
	end
	Say(format("Chóc mõng b¹n, ®iÓm x©y dùng c¸ nh©n ®¹t <color=gold>h¹ng %d<color>, h·y nhËn th­ëng ngay nµo!", nRank), 2,
		format("NhËn th­ëng h¹ng %d/#ywz_GetAward1_PlayerRankAward_CB_done(%d)", nRank, nRank), "\n§Ó nãi sau/nothing")
end

function ywz_GetAward1_PlayerRankAward_CB_done(nRank)
	local tAwardString = {
		"SLYWZ_YJGRPMJ_a",
		"SLYWZ_YJGRPMJ_b",
		"SLYWZ_YJGRPMJ_b",
		--"SLYWZ_YJGRPMJ_b",
		--"SLYWZ_YJGRPMJ_b",
	}
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then
		return 0;
	end
	ywz_SetAward1Flag3(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
end

function ywz_GetAward2_RankAward()
	local nShiliRank = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 1);
	if nShiliRank <= 0 then
		Talk(1,"","ThÕ lùc cña b¹n kh«ng nhËn ®­îc ®iÓm diÔn vâ trong DiÔn Vâ ChiÕn.")
		return 0;
	end
	local nNeed = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 3);
	Say(format("ThÕ lùc cña b¹n xÕp h¹ng %d trong DiÔn Vâ ChiÕn, muèn nhËn th­ëng xÕp h¹ng thÕ lùc kh«ng? <color=red>(§iÓm diÔn vâ c¸ nh©n ®¹t %d míi ®­îc nhËn)<color>", nShiliRank, 300),
		2, format("NhËn lÊy./#ywz_GetAward2_RankAward_do(%d, %d)", nShiliRank, nNeed), "T¹i h¹ chØ xem qua th«i/nothing");
end

function ywz_GetAward2_RankAward_do(nRank, nNeed)
	if ywz_GetAward2Flag1() ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
		return 0;
	end
	if nNeed == 0 or nNeed > 6 then
		Talk(1,"",format("§iÓm diÔn vâ c¸ nh©n ch­a ®¹t %d, kh«ng thÓ nhËn th­ëng.", 300));
		return 0;
	end
	local tAwardString = {
		"SLYWZ_EJSLPMJ_a",
		"SLYWZ_EJSLPMJ_b",
		"SLYWZ_EJSLPMJ_c",
	}
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then
		return 0;
	end
	ywz_SetAward2Flag1(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
	AddRuntimeStat(36, 12, 0, 1);
end

function ywz_GetAward2_PlayerRankAward()
	local nRank = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 2);
	if nRank > 20 or nRank <= 0 then
		Talk(1,"","ChØ cã ng­êi ch¬i n»m trong TOP 20 ®iÓm diÔn vâ míi ®­îc nhËn th­ëng");
		return 0;
	end
	Say(format("H¹ng hiÖn t¹i: %d, muèn nhËn th­ëng xÕp h¹ng kh«ng?", nRank), 2, format("NhËn lÊy./#ywz_GetAward2_PlayerRankAward_cb(%d)", nRank), "T¹i h¹ chØ xem qua th«i/nothing");
end

function ywz_GetAward2_PlayerRankAward_cb(nRank)
	if ywz_GetAward2Flag2() ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
		return 0;
	end
	local szAward = "";
	local tAwardString = {
		"SLYWZ_EJGRPMJ_a",
		"SLYWZ_EJGRPMJ_b",
		"SLYWZ_EJGRPMJ_c",
	}
	local nType = 1;
	if nRank <= 3 then
		szAward = tAwardString[nRank];
	else
		szAward = "SLYWZ_EJGRPMJ_d";
		nType = 0;
	end
	if CustomAwardCheckCondition(szAward) ~= 1 then
		return 0;
	end
	ywz_SetAward2Flag2(1);
	CustomAwardGiveGroup(szAward, nType);
	--¾­ÂöÈÎÎñ
	local nTask = GetTask(3411);
	if nTask <= 0 or nTask > 5 then
		SetTask(3411, nRank);
	end
end

function ywz_GetAward2_ActivityAward()
	local tRankString = {
		"Gi¶i 1", "Gi¶i 2", "Gi¶i 3", "Gi¶i 4", "Gi¶i khuyÕn khÝch",
	}
	local nRank = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 3);
	if not tRankString[nRank] then
		Talk(1, "", "B¹n ch­a nhËn phÇn th­ëng t­ c¸ch n¨ng ®éng diÔn vâ");
		return 0;
	end
	Say(format("Chóc mõng b¹n trong ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn nhËn ®­îc phÇn th­ëng n¨ng ®éng diÔn vâ %s", tRankString[nRank]), 2, format("\n NhËn phÇn th­ëng/#ywz_GetAward2_ActivityAward_do(%d)", nRank), "T¹i h¹ chØ xem qua th«i/nothing");
end

function ywz_GetAward2_ActivityAward_do(nRank)
	if ywz_GetAward2Flag3() ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
		return 0;
	end
	local tAwardString = {
		"SLYWZ_YWHYJ_a", "SLYWZ_YWHYJ_b", "SLYWZ_YWHYJ_c", "SLYWZ_YWHYJ_d", "SLYWZ_YWHYJ_e",
	}
	if not tAwardString[nRank] then return 0; end
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then return 0; end
	ywz_SetAward2Flag3(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
	AddRuntimeStat(36, 12+nRank, 0, 1);
end

function ywz_GetAwardInfo()
	local msg1 = "Trong giai ®o¹n 1 cña ho¹t ®éng, ®iÓm x©y dùng c¸ nh©n cña ng­êi ch¬i ph¶i ®¹t 120 ®iÓm míi ®­îc nhËn th­ëng xÕp h¹ng thÕ lùc, nhËn phÇn th­ëng n¨ng ®éng x©y dùng tÕ ®µn thÕ lùc cÇn ®iÓm x©y dùng c¸ nh©n ®¹t 300 ®iÓm."
	local msg2 = "khi nhËn th­ëng xÕp h¹ng c¸ nh©n, ®iÓm x©y dùng cña nh©n vËt ph¶i ®¹t 950 ®iÓm míi cã thÓ nhËn."
	Say(msg1..msg2, 2, "Trang kÕ/ywz_GetAwardInfo2", "trë l¹i/main");
end

function ywz_GetAwardInfo2()
	Say("Trong giai ®o¹n 2 cña ho¹t ®éng, ®iÓm diÔn vâ c¸ nh©n cña ng­êi ch¬i ph¶i ®¹t 300 ®iÓm mëi ®­îc nhËn th­ëng xÕp h¹ng thÕ lùc vµ xÕp h¹ng c¸ nh©n.", 0);
end
