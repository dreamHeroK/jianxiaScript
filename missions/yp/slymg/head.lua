Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\define.lua")

thisFile = "\\script\\missions\\yp\\slymg\\mission.lua";

tbSLYMG = { 
	debugVersion = nil,
	name = "ThÊt L¹c Nhai MËt Cèc",
	missionID = 84,
	realMapID = 7111,
	dynamicMap = 0,

	--ÒÔÏÂÎªmissionV±äÁ¿
	--control
	mv1 = 1, 
	mv2 = 2,
	--record
	mv3 = 3,
}
tbSLYMG = gf_CopyInherit(missionHead, tbSLYMG)

firePhases = {
	timerID = 118,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7Ìì£¿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

SLYMG_MISSION_CLOSE = 0;
SLYMG_MISSION_READY = 1;
SLYMG_MISSION_STEP_1 = 2;
SLYMG_MISSION_STEP_2 = 3;
SLYMG_MISSION_STEP_3 = 4;
SLYMG_MISSION_END = 5;

SLYMG_TEMP_REV1 = {
	{6300,1412,3624},
	{6300,1176,3277},
	{6300,1364,2970},
	{6300,1412,3624},
	{6300,1412,3624},
}

SLYMG_TEMP_REV2 = {
	{7111,1705,3414},
	{7111,1705,3254},
	{7111,1674,3548},
	{7111,1803,3396},
	{7111,1588,3355},
}

SLYMG_LEVEL_MAP1 = {7112, 7113, 7114, 7115};
SLYMG_LEVEL_MAP2 = {7116, 7117};
SLYMG_LEVEL_MAP3 = {7118};

SLYMG_TRAN_POS = {
	{1648, 3197},
	{1645, 3121},
	{1719, 3116},
	{1710, 3195},
}

SLYMG_LEVEL_BOSS1 = {"baihu1_boss", "Th¸m Tö ThÇn Bİ", 1679, 3145};
SLYMG_LEVEL_BOSS2 = {"baihu2_boss", "Long Hæ §­êng hé gi¸o sø", 1679, 3145};
SLYMG_LEVEL_BOSS3 = {"baihu3_boss", "Tiªu NhiÔm NguyÖt Thiªn ¢m Gi¸o", 1679, 3145};

SLYMG_TRANS_NPC = {
	[7112] = {"Xa phu", "Ng­êi truyÒn tèng ¢m §­êng"},
	[7113] = {"Xa phu", "Ng­êi truyÒn tèng ¢m §­êng"},
	[7114] = {"Xa phu", "Ng­êi truyÒn tèng D­¬ng §­êng"},
	[7115] = {"Xa phu", "Ng­êi truyÒn tèng D­¬ng §­êng"},
	[7116] = {"Xa phu", "Ng­êi truyÒn tèng tÇng 3"},
	[7117] = {"Xa phu", "Ng­êi truyÒn tèng tÇng 3"},
	[7118] = {"Xa phu", "Xa phu Thiªn ¢m Gi¸o"},
}

SLYMG_LEVEL_MSG = {
	[7112] = "%s[%s] V« ı kİch ho¹t c¬ quan, th«ng víi cöa lín Ph©n §µ ¢m §­êng",
	[7113] = "%s[%s] V« ı kİch ho¹t c¬ quan, th«ng víi cöa lín Ph©n §µ ¢m §­êng",
	[7114] = "%s[%s] V« ı kİch ho¹t c¬ quan, th«ng víi cöa lín Ph©n §µ D­¬ng §­êng",
	[7115] = "%s[%s] V« ı kİch ho¹t c¬ quan, th«ng víi cöa lín Ph©n §µ D­¬ng §­êng",
	[7116] = "%s[%s]Tr­ëng L·o ph©n ®µ bÊt ®Şch th©n vong, mét mËt th¸m Thiªn ¢m kh«ng may m¾n bŞ b¾t, c¸c hiÖp kh¸ch biÕt ®­îc c¬ quan mËt ®¹o, cöa lín tÇng 3 ®­îc më.",
	[7117] = "%s[%s]Tr­ëng L·o ph©n ®µ bÊt ®Şch th©n vong, mét mËt th¸m Thiªn ¢m kh«ng may m¾n bŞ b¾t, c¸c hiÖp kh¸ch biÕt ®­îc c¬ quan mËt ®¹o, cöa lín tÇng 3 ®­îc më.",
	[7118] = "%s[%s] Tiªu NhiÔm NguyÖt bÊt ®Şch b¹i tÈu, trong hçn lo¹n cöa lín ThÊt L¹c Nhai MËt Cèc kh«ng cã ®ãng, HiÖp kh¸ch muèn rêi khái cã thÓ ®Õn h­íng cöa ra ®Ó rêi khái",
}

SLYMG_SCORE_BASE = {
	[7112] = 10,
	[7113] = 10,
	[7114] = 10,
	[7115] = 10,
	[7116] = 30,
	[7117] = 30,
	[7118] = 60,
}

SLYMG_SCORE_BOSS = {
	[7112] = 25,
	[7113] = 25,
	[7114] = 25,
	[7115] = 25,
	[7116] = 50,
	[7117] = 50,
	[7118] = 100,
}

--Ğ¡¹Ö½±Àø
SLYMG_MONSTER_AWARD_PRO = {
	[7112] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7113] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7114] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7115] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7116] = {TASK_MISSION_BAIHUTANG_TAG1, 2, 2, 20, 1},
	[7117] = {TASK_MISSION_BAIHUTANG_TAG1, 2, 2, 20, 1},
	[7118] = {TASK_MISSION_BAIHUTANG_TAG1, 3, 3, 50, 1},
}
--boss½±Àø
SLYMG_BOSS_AWARD_PRO = {
	[7112] = 3,
	[7113] = 3,
	[7114] = 3,
	[7115] = 3,
	[7116] = 6,
	[7117] = 6,
	[7118] = 12,
}
--Ãû²á
SLYMG_BOSS_AWARD_BOOK = {
	[7112] = 1,
	[7113] = 1,
	[7114] = 1,
	[7115] = 1,
	[7116] = 2,
	[7117] = 2,
	[7118] = 4,
}

function mg_GetMissionState()
	local nTime = tonumber(date("%H%M"));
	if nTime >= 0730 and nTime < 0830 then
		return SLYMG_MISSION_CLOSE;
	end
	if nTime >= 1830 and nTime < 2130 then
		return SLYMG_MISSION_CLOSE;
	end
	local nMinute = tonumber(date("%M"));
	if nMinute >= 30 and nMinute < 60 then
		return SLYMG_MISSION_READY;
	end
	if nMinute >= 0 and nMinute < 7 then
		return SLYMG_MISSION_STEP_1;
	end
	if nMinute >= 7 and nMinute < 16 then
		return SLYMG_MISSION_STEP_2;
	end
	if nMinute >= 16 and nMinute < 25 then
		return SLYMG_MISSION_STEP_3;
	end
	if nMinute >= 25 and nMinute < 30 then
		return SLYMG_MISSION_END;
	end
	return SLYMG_MISSION_CLOSE;
end

function mg_CreateNpcList(tNpcList, nMapID)
	for _, v in tNpcList do
		local npcIndex = CreateNpc(v[1], v[2], nMapID, v[3], v[4]);
		if npcIndex > 0 then
			SetNpcScript(npcIndex, thisFile);
		end
	end
end

function mg_CreateBoss(tMap, tNpc, msg)
	for i = 1, getn(tMap) do
		local npcIndex = CreateNpc(tNpc[1], tNpc[2], tMap[i], tNpc[3], tNpc[4]);
		if npcIndex > 0 then
			SetNpcDeathScript(npcIndex, "\\script\\missions\\yp\\slymg\\npc_death.lua");
			Msg2Map(tMap[i], msg);
		end
	end
end

function mg_GotoLevel1(nType)
	local npcName = format("<color=gold>%s<color>:", GetTargetNpcName());
	if gf_CheckLevel(5, 90) ~= 1 or gf_CheckPlayerRoute() ~= 1 then
		Talk(1, "", npcName.."§¹t chuyÓn sinh 5 cÊp 90 vµ gia nhËp l­u ph¸i sÏ cã thÓ gia nhËp thÕ lùc!");
		return 0;
	end
	local nTimes = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3)
	if nTimes >= 3 then
		Talk(1,"", npcName..format("H«m nay ®· hoµn thµnh %d lÇn, ngµy mai h·y quay l¹i!", 3));
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1, "", npcName.."C¸c h¹ ¸c khİ qu¸ nÆng (PK>=10), kiÕn nghŞ c¸c h¹ röa s¹ch ¸c khİ (th«ng qua ph­¬ng thøc sö dông tiªu gi¶i t¸n h¹ thÊp ®iÓm PK).");
		return 0;
	end
	local nState = mf_GetMissionV(tbSLYMG.missionID, tbSLYMG.mv1, tbSLYMG.realMapID);
	if nState == SLYMG_MISSION_CLOSE then
		Talk(1, "", npcName.."Thêi kh¾c vÉn ch­a ®Õn, c¸c ®¹i hiÖp ®îi thªm nhĞ, sau khi ®îi th¸m tö th¨m dß râ rµng th× h·y ®i.")
		return 0;
	end
	if nState >= SLYMG_MISSION_STEP_1 and nState <= SLYMG_MISSION_END then
		Talk(1,"", npcName.."L­ît nµy ®· b¾t ®Çu, ®îi tİ råi ®Õn nhĞ!");
		return 0;
	end
	local nIndex = random(getn(SLYMG_TRAN_POS));
	NewWorld(SLYMG_LEVEL_MAP1[nType], SLYMG_TRAN_POS[nIndex][1], SLYMG_TRAN_POS[nIndex][2]);
	SetLogoutRV(1);
	SetDeathPunish(0);
	SetCampToPlayer("");	
	SetDeathScript("\\script\\missions\\yp\\slymg\\player_death.lua");
	SetFightState(0);
	AddRuntimeStat(32, 3, 1, 1)
	--Ã¿³¡¶¼ÖØÖÃµôÂäÏŞÖÆ
	for _, v in SLYMG_MONSTER_AWARD_PRO do
		gf_SetTaskByte(v[1], v[2], 0);
	end
end

function mg_Func2AllPlayer(tMap)
	local oldPlayerIndex = PlayerIndex;
	if tMap and type(tMap) == "table" then 
		for _, v in tMap do
			local tPlayer = GetMapPlayer(v);
			if tPlayer and type(tPlayer) == "table" then
				for _, m in tPlayer do
					PlayerIndex = m;
					mg_ModifyScore(SLYMG_SCORE_BASE[v]);
					mg_SetPlayerState();
					local nTimes = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3);
					gf_SetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3, nTimes + 1);
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function mg_GotoLevel2(nType)
	local nIndex = random(getn(SLYMG_TRAN_POS));
	NewWorld(SLYMG_LEVEL_MAP2[nType], SLYMG_TRAN_POS[nIndex][1], SLYMG_TRAN_POS[nIndex][2]);
	mg_SetPlayerState();
	mg_ModifyScore(SLYMG_SCORE_BASE[SLYMG_LEVEL_MAP2[nType]]);
	AddRuntimeStat(32, 3, 2, 1)
end

function mg_GotoLevel3()
	local nIndex = random(getn(SLYMG_TRAN_POS));
	NewWorld(SLYMG_LEVEL_MAP3[1], SLYMG_TRAN_POS[nIndex][1], SLYMG_TRAN_POS[nIndex][2]);
	mg_SetPlayerState();
	mg_ModifyScore(SLYMG_SCORE_BASE[SLYMG_LEVEL_MAP3[1]]);
	AddRuntimeStat(32, 3, 3, 1)
end

function mg_ReturnMg()
	SetPlayerScript("\\script\\missions\\yp\\slymg\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\slymg\\entrynpc.lua","enter()");	
end

function mg_NoticePer2Min()
	local currMinute = tonumber(date("%M"));
	if currMinute < 30 then currMinute = currMinute + 60; end
	currMinute = currMinute - 30;	
	local leftMinute = 60 - currMinute;
	local record = GetMissionV(this.mv3);
	if record ~= leftMinute and mod(leftMinute, 3) == 0 then
		local msg = format("Thiªn ¢m Ph©n §µ ®· xuÊt hiÖn vÕt nøt, dù tİnh sau %d phót sÏ sËp, c¸c ®¹i hiÖp muèn lÊy danh s¸ch th× h·y mau chãng ®i t×m kiÕm nhĞ.", 
			leftMinute);
		SetMissionV(this.mv3, leftMinute);
		local tMap = {SLYMG_LEVEL_MAP1, SLYMG_LEVEL_MAP2, SLYMG_LEVEL_MAP3};
		for _, v in tMap do
			for _, m in v do
				Msg2Map(m, msg);
			end
		end
	end
end

function mg_CreateMonster()
	local tPos = {
		{1679, 3103},
		{1648, 3121},
		{1629, 3160},
		{1649, 3193},
		{1682, 3213},
		{1708, 3189},
		{1735, 3161},
		{1711, 3122},
	};
	local tNpc = {
		{"baihu1_footman", "Mao TÆc lo¹n nhËp"},
		{"baihu2_footman", "Long Hæ §­êng C¬ Quan Thó"},
		{"baihu3_footman", "Hé VÖ Tr­ëng L·o"},	
	}
	local tMaps = {SLYMG_LEVEL_MAP1, SLYMG_LEVEL_MAP2, SLYMG_LEVEL_MAP3};
	local tFlag = {0, 0, 0, 0};
	for i = 1, getn(SLYMG_LEVEL_MAP1) do
		local tPlayer = GetMapPlayer(SLYMG_LEVEL_MAP1[i]);
		if getn(tPlayer) > 0 then
			tFlag[i] = 1;
		end
	end
	local tMapFlag = {tFlag,{0,0},{0}};
	if tFlag[1] == 1 or tFlag[2] == 1 then
		tMapFlag[2][1] = 1;
	end
	if tFlag[3] == 1 or tFlag[4] == 1 then
		tMapFlag[2][2] = 1;
	end
	if tMapFlag[2][1] == 1 or tMapFlag[2][2] == 1 then
		tMapFlag[3][1] = 1;
	end
	for i = 1, getn(tMaps) do
		for j = 1, getn(tMaps[i]) do
			if tMapFlag[i][j] == 1 then
				for _,n in tPos do
					for k = 1, 6 do
						local npcIndex = CreateNpc(tNpc[i][1], tNpc[i][2], tMaps[i][j], n[1] + random(-5, 5), n[2] + random(-5, 5));
						if npcIndex > 0 then
							SetNpcDeathScript(npcIndex, "\\script\\missions\\yp\\slymg\\monster_death.lua");
							SetNpcLifeTime(30*60);
						end
					end
				end
			end
		end
	end
end

function mg_MapClean()
	local oldPlayerIndex = PlayerIndex;
	local tMap = {SLYMG_LEVEL_MAP1, SLYMG_LEVEL_MAP2, SLYMG_LEVEL_MAP3};
	for _, v in tMap do
		for _, m in v do
			ClearMapNpc(m);
			local tPlayer = GetMapPlayer(m);
			for _,v in tPlayer do
				PlayerIndex = v;
				mg_ReturnMg();
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function mg_SetPlayerState()
	SetLogoutRV(1);
	SetDeathPunish(0);
	ForbidChangePK(0);
	SetPKFlag((IsTongMember() > 0) and 3 or 2, 0);
	ForbidChangePK(1);
	SetCampToPlayer("");	
	SetDeathScript("\\script\\missions\\yp\\slymg\\player_death.lua");
	RestoreAll();
	SetFightState(1);
end

function mg_BgStory()
	local tbBody = "Sau khi kÕt thóc trËn chiÕn HuyÕt B¹c LÜnh, Thiªn ¢m Gi¸o lÊy nanh vuèt ma quû duçi vµo ba n­íc T©y H¹, Thæ Phån, §¹i Lı cña biªn giíi phİa T©y B¾c, nghe th¸m tö tr×nh b¸o, 3 n­íc ®Òu cã ng­êi mê ¸m th«ng ®ång Thiªn ¢m gi¸o, chuÈn bŞ lËt ®æ 3 n­íc, Vâ L©m Minh ph¸i cao thñ hç trî truy b¾t tªn Thiªn ¢m gi¸o kh«ng muèn mang theo danh s¸ch, nh­ng bŞ träng th­¬ng.Nh©n d©n th¨m dß ®­îc biÕt danh s¸ch ®· bŞ ®­a ®Õn Thiªn ¢m Gi¸o ThÊt L¹c Nhai Ph©n §µ cña ThÊt L¹c Nhai, Ph©n ®µ nµy do Tiªu NhiÔm NguyÖt chiÕm gi÷, bªn trong hé vÖ nghiªm ngÆt, ng­êi ngoµi rÊt khã vµo.NhËn ®­îc th«ng tin néi bé cña 3 n­íc chiªu mé giang hå hiÖp kh¸ch, vµo Thiªn ¢m Gi¸o ThÊt L¹c Ph©n §µ, hy väng cã thÓ lÊy ®­îc danh s¸ch kÎ ph¶n béi, ®ång thêi lîi dông nh÷ng tªn ph¶n béi nµy ®¸nh n­íc kh¸c, Thiªn ¢m gi¸o ThÊt L¹c Nhai Ph©n §µ mét thêi ®· trë thµnh chiÕn tr­êng hçn chiÕn c¸c ph­¬ng.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_TimeInfo()
	local tbBody = "Thêi gian bÊt kú mçi ngµy ®Òu cã thÓ ®Õn ThÊt L¹c Nhai MËt Cèc, nh­ng muèn ®Õn Thiªn ¢m Ph©n §µ ph¶i xem thêi kh¾c, 8:30~17:30 21:30~6:30  mçi ngµy, tr­íc 30 phót cña kho¶ng thêi gian nµy hé vÖ t­¬ng ®èi láng lÎo, v× vËy cã thÓ kiÕm xa phu kh¸c gÇn ®ã dÉn c¸c b¹n vµo, nh­ng khi ®Õn kh«ng thÓ vµo, vİ dô: 8h30~9h mçi ngµy cã thÓ hç trî c¸c vŞ vµo tÇng 1, 9h~9h30 th× kh«ng thÓ vµo.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_FunctionInfo()
	local tbBody = "Ng­êi Ch¬i cã thÓ vµo ThÊt L¹c Nhai MËt Cèc th«ng qua NPC 3 phe bÊt cø thêi gian nµo, trong thêi gian nhÊt ®Şnh, ng­êi ch¬i cã thÓ tõ MËt cèc vµo tÇng 1 ph©n ®µ ThÊt L¹c Nhai Thiªn ¢m,  30 phót sau ho¹t ®éng b¾t ®Çu, sau khi b¾t ®Çu ng­êi ch¬i kh«ng thÓ b¸o danh gia nhËp n÷a, khi ho¹t ®éng b¾t ®Çu, ng­êi ch¬i ë tÇng 1 ph©n ®µ ThÊt L¹c Nhai Thiªn ¢m sÏ b¾t buéc ph¶i chuyÓn vµo tr¹ng th¸i PK lµ Tr¹ng Th¸i Bang ChiÕn( ng­êi ch¬i kh«ng cã bang héi sÏ lµ tr¹ng th¸i chiÕn ®Êu, ®èi lËp víi tÊt c¶ ng­êi kh¸c), ®ång thêi qu¸i vËt b¾t ®Çu xuÊt hiÖn, suy ra nh­ vËy, ph©n ®µ tæng céng 3 tÇng, mçi tÇng ®Òu cã 1 Boss, Boss sÏ xuÊt hiÖn trong thêi gian cè ®Şnh, sau khi tiªu diÖt boss sÏ th«ng h­íng víi xa phu truyÒn tèng ®Õn tÇng tiÕp theo, sau khi kÕt thóc thêi gian ho¹t ®éng 30 phót tÊt c¶ ng­êi ch¬i bŞ truyÒn tèng ®Õn ThÊt L¹c Nhai MËt Cèc.    ";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_ModifyScore(nValue)
	if not nValue or nValue == 0 then return 0; end
	local nCurrValue = GetTask(TASK_MISSION_BAIHUTANG_SCORE);
	local nRealValue = max(nCurrValue + nValue, 0);
	SetTask(TASK_MISSION_BAIHUTANG_SCORE, nRealValue);
	if nValue > 0 then
		Msg2Player(format("NhËn ®­îc %d ®iÓm tİch lòy Long Hæ §­êng", nValue));
	else
		Msg2Player(format("B¹n ®· tiªu hao %d ®iÓm tİch lòy Long Hæ §­êng", nCurrValue - nRealValue));
	end
end

function mg_MonsterDropItem()
	if GetFreeItemRoom() < 1 then
		Msg2Player(format("Hµnh trang kh«ng ®ñ kh«ng gian kh«ng thÓ nhËn ®­îc %s", "Thiªn ¢m MËt B¶o"));
		return 1;
	end	
	local mapID = GetWorldPos();
	local t = SLYMG_MONSTER_AWARD_PRO[mapID];
	local nCount = gf_GetTaskByte(t[1], t[2]);
	if nCount >= t[3] then
		return 0;
	end
	if t[4] >= random(100) then
		gf_SetTaskByte(t[1], t[2], nCount + 1);
		gf_AddItemEx2({2, 1, 30923, t[5]}, "Thiªn ¢m MËt B¶o", "Long Hæ §­êng", "PhÇn th­ëng giÕt qu¸i nhá", 0, 1);
	end
end

function mg_BossDropItem(mapID, npcIndex)	
	local t = SLYMG_BOSS_AWARD_PRO[mapID];
	for i = 1, t do
		gf_ThrowDice({2, 1, 30923, 1}, nil, nil, nil, 60, npcIndex);
	end
end

function mg_DailyReset()
	SetTask(TASK_MISSION_BAIHUTANG_TAG1, 0);
	SetTask(TASK_MISSION_BAIHUTANG_TAG2, 0);
end
