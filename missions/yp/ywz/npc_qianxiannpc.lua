Import("\\script\\missions\\yp\\ywz\\mission_head.lua")
Import("\\script\\missions\\yp\\ywz\\head.lua")
Import("\\script\\lib\\talktmp.lua")

function main()
	local msg = "N¬i ®©y ch­íng khÝ mÞt mï, ë ®©y sÏ khiÕn cho c¬ b¾p toµn th©n bÞ tª cøng, phßng thñ t¨ng cao m¹nh."
	local tSay = {
		"Giíi thiÖu ho¹t ®éng/qxn_info",
		"Liªn quan ThÕ Lùc Ba Phe/qxn_main",
		"Quy t¾c ho¹t ®éng/qxn_rule",
		"Rêi khái DiÔn Vâ ChiÕn Tr­êng/qxn_leave",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(msg, getn(tSay), tSay);
end

function qxn_info()
	Talk(1,"","ThÕ lùc Thiªn ¢m Gi¸o dÇn lui khái trung nguyªn, kh«i phôc nguyªn khÝ. TriÒu ®×nh nh»m muèn ng¨n chÆn sù ph¶n c«ng cña Thiªn ¢m Gi¸o, quyÕt ®Þnh t¨ng c­êng søc m¹nh cña vâ l©m, ban th­ëng lín cho ThÕ Lùc Ba Phe tiÕn hµnh diÔn vâ, ®Ó xÕp h¹ng cho 3 thÕ lùc; ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn chia thµnh 2 giai ®o¹n: X©y dùng tÕ ®µn thÕ lùc vµ ThÕ Lùc Ba Phe DiÔn Vâ; trong ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn, ®¹i hiÖp cã biÓu hiÖn kiÖt xuÊt sÏ nhËn ®­îc thªm phÇn th­ëng. Hy väng cã thÓ gióp ®ì mäi ng­êi.")
end

function qxn_main()
	local msg = format("§iÓm diÔn vâ: %d ®iÓm", ywzm_GetScore());
	local tSay = {
		--"»»È¡BUFF¼Ó³É/qxn_ItemExchgBuff",
		"Xem ®iÓm diÔn vâ thÕ lùc/qxn_ShowShiliScore",
		"Xem xÕp h¹ng ®iÓm diÔn vâ c¸ nh©n/qxn_ShowScoreRank",
		"\nT«i chØ xem xem th«i/nothing"
	}
	if ywzm_GetCamp() == 1 then
		tinsert(tSay, 1, "NhËn BUFF cña phe thñ/qxn_GetProtectBuff");
	end
	Say(msg, getn(tSay), tSay);
end

function qxn_leave()
	Say("QuyÕt ®Þnh muèn rêi khái DiÔn Vâ ChiÕn Tr­êng ngay kh«ng?", 2, "Tho¸t ngay/qxn_leave_do", "\nT«i chØ xem xem th«i/nothing")
end

function qxn_leave_do()
	DelMSPlayer(tbYWZ.missionID, ywzm_GetCamp());
end

function qxn_GetProtectBuff()
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(qxn_GetProtectBuff_CB);
end

function qxn_GetProtectBuff_CB(nCount, sdb)
	local nValue = 0;
	local nCamp,_ = ywzm_GetParam()
	for i = 1, nCount do
		local tData = sdb[i-1];
		if nCamp == tonumber(tData[1]) then
			nValue = tonumber(tData[2]);
			break
		end
	end
	local nBuff = 0;
	if nValue >= 300000 then
		nBuff = 300;
	elseif nValue >= 200000 then
		nBuff = 200;
	else
		nBuff = 100;
	end
	Say(format("§é x©y dùng thÕ lùc ®¹t %d, cã thÓ nhËn ®­îc %d ®iÓm BUFF thuéc tÝnh ph¸ ®Þch", nValue, nBuff), 2, format("NhËn /#qxn_GetProtectBuff_Do(%d)", nBuff), "Hñy bá/nothing");
end

function qxn_GetProtectBuff_Do(nValue)
	CastState("state_destiny_attack_point_add", nValue, 3600*18, 1, 10001, 1);
	SyncCustomState(1, 10001, 1, "Phe thñ céng thªm");
	Msg2Player(format("Chóc mõng b¹n nhËn ®­îc %d ®iÓm thuéc tÝnh ph¸ ®Þch", nValue));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function qxn_ItemExchgBuff()
	local msg = "§¹i hiÖp cã yªu cÇu g×?";
	local tItem = {
		{50, 100},
		{100, 200},
		{150, 300},
		{200, 400},
		{250, 500},
		{300, 600},
		{500, 700},
		{700, 800},
		{900, 900},
		{1300, 1000},
	}
	local tSay = {};
	for i = 1, getn(tItem) do
		local section = format("Nép %d c¸i %s (t¨ng %d ®iÓm thuéc tÝnh ph¸ ®Þch)/#qxn_ItemExchgBuffDo(%d, %d)", tItem[i][1], "Anh Dòng Chøng", tItem[i][2], tItem[i][1], tItem[i][2])
		tinsert(tSay, section);
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(msg, getn(tSay), tSay);
end

function qxn_ItemExchgBuffDo(nNum, nValue)
	if GetItemCount(2, 1,30969) < nNum then
		Talk(1,"",format("trong hµnh trang, sè l­îng cña %s kh«ng ®ñ %d", "Anh Dòng Chøng", nNum))
		return 0;
	end
	if DelItem(2, 1, 30969, nNum) ~= 1 then
		return 0;
	end
	CastState("state_destiny_attack_point_add", nValue, 3600*18, 1, 10002, 1);
	SyncCustomState(1, 10002, 1, "Anh dòng céng thªm");
	Msg2Player(format("Chóc mõng b¹n nhËn ®­îc %d ®iÓm thuéc tÝnh ph¸ ®Þch", nValue));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	AddRuntimeStat(36, 6, 0, nNum);
end

function qxn_ShowShiliScore()
	local tSay = {
		format("§iÓm diÔn vâ thÕ lùc §¹i Lý %d ®iÓm/nothing", GetMissionV(tbYWZ.mv1)),
		format("§iÓm diÔn vâ thÕ lùc Thæ Phån %d ®iÓm/nothing", GetMissionV(tbYWZ.mv2)),
		format("§iÓm diÔn vâ thÕ lùc T©y H¹ %d ®iÓm/nothing", GetMissionV(tbYWZ.mv3)),
		"\nT«i chØ xem xem th«i/nothing"
	}
	Say("§iÓm diÔn vâ ThÕ Lùc Ba Phe nh­ sau:", getn(tSay), tSay);
end

function qxn_ShowScoreRank()
	local nMapID = GetWorldPos();
	local t = ywzm_GetRankTable(nMapID)
	local tSay = {}
	for i = 1, getn(t) do
		tinsert(tSay, format("%d, %s (%d ®iÓm diÔn vâ)/nothing", t[i][1], t[i][2], t[i][3]));
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say("B¶ng xÕp h¹ng ®iÓm diÔn vâ c¸ nh©n:", getn(tSay), tSay);
end

function qxn_rule()
	local npcName = GetNpcName(GetTargetNpc());
	local tbSay = {};
	local msg = "\n1. §iÒu kiÖn tham gia: Trong giai ®o¹n 1, ng­êi ch¬i n»m trong TOP 100 ®iÓm x©y dùng cña thÕ lùc. Thêi gian ho¹t ®éng: 20:00-21:00 thø 7 h»ng tuÇn.\n2. Ng­êi ch¬i kh«ng thÓ tÊn c«ng cê cña phe m×nh, sau khi ng­êi ch¬i thÕ lùc kh¸c ®¸nh b¹i cê sÏ lËp tøc t¹o míi thµnh cê cña thÕ lùc kh¸c, ng­êi ch¬i ®¸nh b¹i cê sÏ nhËn ®­îc 50 ®iÓm diÔn vâ.\n3. Trong ph¹m vi cê cña thÕ lùc, chØ cã ng­êi ch¬i cßn sèng cïng phe víi cê míi nhËn ®­îc ®iÓm diÔn vâ, mçi 5 gi©y nhËn ®­îc 3 ®iÓm diÔn vâ.\n4. NÕu trong thêi gian giai ®o¹n 2 cña ho¹t ®éng tiÕn hµnh ®æi thÕ lùc, th× ®iÓm diÔn vâ cña ng­êi ch¬i nµy chØ gi÷ l¹i 20%.\n5. PhÇn th­ëng xÕp h¹ng thÕ lùc vµ xÕp h¹ng c¸ nh©n ®Òu cÇn ®iÓm diÔn vâ c¸ nh©n cña ng­êi ch¬i ®¹t 300 ®iÓm míi ®­îc nhËn.\n6. Trong giai ®o¹n 2 cña ho¹t ®éng, khi ng­êi ch¬i tiªu diÖt ng­êi ch¬i thÕ lùc kh¸c sÏ nhËn ®­îc 2 ®iÓm diÔn vâ, khi mît ng­êi ch¬i liªn tôc tö vong 2 lÇn, nÕu trong vßng 3 phót bÞ ®¸nh b¹i lÇn n÷a th× ng­êi ®¸nh b¹i ng­êi ch¬i nµy sÏ kh«ng nhËn ®­îc ®iÓm diÔn vâ.\n7. Sau khi giai ®o¹n 2 b¾t ®Çu 5 phót, ®ãng truyÒn tèng ®Õn tÝnh n¨ng Ch­íng KhÝ S¬n Cèc.";
	tbSay.msg = msg;
	tbSay.sel = {
		{"\n Ph¶n håi","main"},
		{"\n Tho¸t ", "nothing"},
	};
	temp_Talk(tbSay);
end
