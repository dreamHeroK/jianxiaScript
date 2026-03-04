Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\lib\\talktmp.lua")

thisFile = "\\script\\function\\zk_update\\zk_main.lua"

zkwq_Start = {2016,06,01,0,0,0}
zkwq_End = {2016,06,30,0,0,0}

function Init()
--	AddMisEvent("event_talk_npc", "Thî rÌn L­u", 350, thisFile, "handle_zk_main", "T¨ng cÊp ChiÕn Cuång");
	AddMisEvent("event_daily_clean", "Xö lı h»ng ngµy", 0, thisFile, "handle_zk_dailyclean");
	local tMissionName = {
		{"event_mission_passstage", "V¹n KiÕm Tròng",  "handle_zk_mc"},
		{"event_mission_passstage", "§Şa HuyÒn Cung", "handle_zk_mc"},
		{"event_mission_passstage", "L­¬ng S¬n", "handle_zk_mc"},
		{"event_mission_passstage", "Th¸i NhÊt Th¸p", "handle_zk_mc"},
		{"event_mission_passstage", "Th¸i NhÊt Th¸p_Anh Hïng", "handle_zk_mc"},
		{"event_mission_joinonce", "Thiªn M«n trËn", "handle_zk_jo"},
		{"event_mission_joinonce", "Th«n L¹c Tranh §o¹t ChiÕn", "handle_zk_jo"},
		{"event_mission_joinonce", "Th¶o Cèc Tranh §o¹t ChiÕn", "handle_zk_jo"},
		{"event_mission_joinonce", "Ph¸o §µi Tranh §o¹t ChiÕn", "handle_zk_jo"},
		{"event_mission_joinonce", "ChiÕn tr­êng chİnh-Nh¹n M«n Quan", "handle_zk_jo"},
		{"event_mission_joinonce", "¢n O¸n §µi", "handle_zk_jo"},
		{"event_yp_taskfinish", "§µo Kho B¸u", "handle_zk_yptask"},
		{"event_yp_taskfinish", "Trém Kinh S¸ch", "handle_zk_yptask"},
		{"event_yp_taskfinish", "VËn tiªu", "handle_zk_yptask"},
		{"event_yp_taskfinish", "C­íp Tiªu", "handle_zk_yptask"},
		{"event_yp_taskfinish", "Trém Ngäc Ph¸ch", "handle_zk_yptask"},
		{"event_ywz_taskfinish", "NhiÖm vô tuÇn", "handle_zk_ywztask"},
		{"event_slyb_award", "yp_slyzz_award", "handle_zk_slyb", "PhÇn th­ëng ChiÕn ThÕ Lùc ThËt L¹c Nhai"},
		{"event_ywz_taskfinish", "§iÓm x©y dùng c¸ nh©n ®¹t 300", "handle_zk_award"},
		{"event_kill_npc", "§µo Hoa §¶o Chñ Hoµng Long", "handle_zk_killboss"},
		{"event_kill_npc", "T©y Vùc Th­¬ng Lang B¸ V­¬ng", "handle_zk_killboss"},
		{"event_kill_npc", "Ngäc S¬n Chi Linh Thiªn Cöu", "handle_zk_killboss"},
		{"event_kill_npc", "U Tr¹ch Chi ¶nh Minh Vâ", "handle_zk_killboss"},
	};
	for _, v in tMissionName do
		AddMisEvent(v[1], v[2], 0, thisFile, v[3]);
	end
	if zkwq_IsOpen() ~= 0 then
		AddMisEvent("event_server_start", "Th­¬ng Nh©n Chî §en", 0, thisFile, "handle_zkwq_createnpc");
		AddMisEvent("event_talk_npc", "Th­¬ng Nh©n Chî §en", 350, thisFile, "handle_zkwq_main", "Shop chî ®en");
		AddMisEvent("event_kill_npc", "Háa Kú L©n Con", 406, thisFile, "handle_zkwq_bossdeath1");
		AddMisEvent("event_kill_npc", "ThÇn Thó Háa Kú L©n", 218, thisFile, "handle_zkwq_bossdeath2");
	end
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31065), 0, thisFile, "handle_zkwq_useitem", "Mét t¸ VÈy Kú L©n");
end

ZK_TZQ_NUM_MAX = 3; --ÌôÕ½È¯Ã¿Ìì×î´óÊıÁ¿
ZK_ZMMX_COUNT_MAX = 5; --ÕÆÃÅÃÜĞÅÃ¿ÈÕÍê³É´ÎÊı
ZK_TASK_TAG1 = 3422; --Ã¿ÈÕÈÎÎñ1±ê¼Ç
ZK_TASK_TAG2 = 3466; --Ã¿ÈÕÉÏ½»ÈÎÎñ±ê¼Ç

ZK_TZQ_TASK = {
	{"V­ît phã b¶n", 381, 1, 1},
	{"HuyÕt ChiÕn Sa Tr­êng", 382, 2, 3},
	{"ThÕ Lùc Ba Phe", 383, 3, 2},
	{"V¹n Lı Tiªu Xa Lé", 384, 4, 1},
	{"Lo¹n chiÕn ThÊt L¹c Nhai", 385, 5, 3},
	{"X©m nhËp Long Hæ §­êng", 386, 6, 3},
	{"DiÔn Vâ LuyÖn ChiÕn", 387, 7, 3},
}

ZK_ZMMX_TASK = {
	{"ThiÕt Tinh cÊp 1", 3, {2,1,30533}, 8},
	{"ThiÕt Tinh cÊp 2", 1, {2,1,30534}, 9},
	{"Viªm Linh Ti", 20, {2,1,30671}, 10},
	{"HuyÒn Viªm ThiÕt", 20, {2,1,30670}, 11},
	{"Da §Şa Long", 20, {2,1,30673}, 12},
	{"Da Ma Lang", 20, {2,1,30672}, 13},
	{"Thiªn Kiªu LÖnh", 1, {2,97,236}, 14},
	{"Ma §ao Th¹ch cÊp 1", 1, {2,1,30428}, 15},
	{"TÈy T©m Th¹ch Kho¸ng", 5, {2,1,30536}, 16},
	{"LuyÖn L« ThiÕt Kho¸ng", 5, {2,1,30537}, 17},
	{"Kinh M¹ch §ång Nh©n", 1, {2,1,30730}, 18},
	{"Vµng", 80, 1, 19},
	{"Qu©n C«ng Ch­¬ng", 2, {2,1,9999}, 20},
	{"Ng­ng Tinh Lé", 15, {2,1,30804}, 21},
	{"Tô Linh Hoµn", 1, {2,1,30458}, 22},
	{"Tu Ch©n YÕu QuyÕt", 3, {2,0,554}, 23},
	{"HiÖp NghÜa Chi Chøng", 10, {2,1,30912}, 24},
	{"§ång TÕ Chi NguyÖn", 2, {2,1,30913}, 25},
	{"C©y B¸t Nh·", 1, {2,0,398}, 26},
	{"C©y b¸t nh· nhá", 3, {2,0,504}, 27},
	{"HuyÕtTrİchTh¹ch Lv1", 2, {2,22,101}, 28},
	{"NguyÖtB¹chTh¹ch Lv1", 2, {2,22,201}, 29},
	{"Hæ Ph¸ch Th¹ch CÊp 1", 2, {2,22,301}, 30},
	{"H¾c DiÖu Th¹ch CÊp 1", 2, {2,22,401}, 31},
}

function handle_zk_main(npcIndex)
	if gf_GetTransLevel() < 590 then
		Talk(1,"",format("CÊp nh©n vËt ch­a ®¹t ®Õn %d chuyÓn cÊp %d.", 5, 90));
		return 0;
	end
	if tGtTask:check_task_isfinish(380) ~= 1 then
		Talk(1,"","H·y hoµn thµnh nhiÖm vô chØ dÉn t¨ng cÊp ChiÕn Cuång råi quay l¹i nhĞ!");
		return 0;
	end
	local szNpcName = GetNpcName(npcIndex);
	local tSay = {
		format("PhiÕu Khiªu ChiÕn Vâ L©m (%d/%d)/#zk_TzqTask(%d)", zk_GetTzqNum(), ZK_TZQ_NUM_MAX, npcIndex),
		format("Tr­êng M«n MËt Tİn-cã thÓ l¾p l¹i(%d/%d)/#zk_ZmmxTask(%d)", zk_GetZmmxCount(), ZK_ZMMX_COUNT_MAX, npcIndex),
		format("Kiªu chiÕn cña m­êi ®¹i m«n ph¸i/#zk_BigTask(%d)", npcIndex),
		format("Shop HuyÒn TInh/#show_equip_shop(%d)", 3077),
		"Ta muèn nhËn Tói §å Phæ/zk_get_package"
	}
	if zkwq_IsOpen() ~= 0 then
		tinsert(tSay, format("Ho¹t ®éng n©ng cÊp vò khİ ChiÕn Cuång/#zkwq_Main(%d)", npcIndex));
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	local msg = "HuyÒn Tinh ë tay, Thiªn H¹ lµ cña ta";
	Say(format("<color=gold>%s<color>:%s", GetNpcName(npcIndex), msg), getn(tSay), tSay);
end

function zk_get_package()
	local nCnt = GetItemCount(2,1,31142)
	if nCnt ~= 0 then
		Talk(1,"handle_zk_main","Ngµi ®· cã 1 Tói §å Phæ råi.") 
		return 0;
	end
	if gf_Judge_Room_Weight(1, 0) == 1 then
		AddItem(2,1,31142,1);
	else
		Talk(1,"handle_zk_main","Kh«ng gian hµnh trang kh«ng dñ")
	end

end

function handle_zk_dailyclean()
	SetTask(ZK_TASK_TAG1, 0);
end

function handle_zk_mc(szType, szName, nStage)
	if tGtTask:check_cur_task(381) ~= 1 then
		return 0;
	end
	local t = {
		["V¹n KiÕm Tròng"] = 4,
		["§Şa HuyÒn Cung"] = 7,
		["L­¬ng S¬n"] = 7,
		["Th¸i NhÊt Th¸p"] = 6,
		["Th¸i NhÊt Th¸p_Anh Hïng"] = 6,
	}
	if t[szName] and t[szName] == nStage then
		SetTask(3423, 1);
	end
end

function handle_zk_jo(szType, szName)
	if tGtTask:check_cur_task(382) ~= 1 then
		return 0;
	end
	SetTask(3424, 1);
end

function handle_zk_yptask(szType, szName, nParam)
	if tGtTask:check_cur_task(383) ~= 1 and tGtTask:check_cur_task(384) ~= 1 and 
		tGtTask:check_cur_task(395) ~= 1 and tGtTask:check_cur_task(397) ~= 1 then
		return 0;
	end
	local tName2Task = {
		["§µo Kho B¸u"] = {3425, 2},
		["Trém Kinh S¸ch"] = {3426, 1},
		["VËn tiªu"] = {3427, 1},
		["C­íp Tiªu"] = {3429, 1},
		["Trém Ngäc Ph¸ch"] = {3430, 1},
	};
	local v = tName2Task[szName];
	local nTask = GetTask(v[1]);
	if nTask >= v[2] then return 0;	end
	if szName == "C­íp Tiªu" and nParam ~= 5 then
		return 0;
	end
	SetTask(v[1], nTask + 1);
end

function handle_zk_ywztask(szType, szName)
	if tGtTask:check_cur_task(387) ~= 1 then
		return 0;
	end
	local nTask = GetTask(3428);
	if nTask >= 7 then return 0; end
	SetTask(3428, nTask + 1);
end

function handle_zk_slyb(szType, szName, nRank)
	if tGtTask:check_cur_task(400) ~= 1 then
		return 0;
	end
	if nRank == 1 then
		SetTask(3431, 1);
	end
end

function handle_zk_award(szType, szName)
	if tGtTask:check_cur_task(391) ~= 1 then
		return 0;
	end
	SetTask(3432, 1);
end

function handle_zk_killboss(npcIndex)
	if tGtTask:check_cur_task(405) ~= 1 then
		return 0;
	end
	SetTask(3433, 1);
end

function zk_GetTzqNum()
	local nCount = 0;
	for _, v in ZK_TZQ_TASK do
		if gf_GetTaskBit(ZK_TASK_TAG1, v[3]) == 1 then
			nCount = nCount + v[4];
		end
	end
	return min(nCount, ZK_TZQ_NUM_MAX);
end

function zk_GetTaskState1(nTaskID, nBit)
	local nValue = gf_GetTaskBit(ZK_TASK_TAG1, nBit);
	if nValue == 0 then
		if tGtTask:check_cur_task(nTaskID) ~= 1 then
			return "(§­îc nhËn)";
		else
			if DirectIsTaskFinish(nTaskID) ~= 1 then
				return "(ch­a hoµn thµnh)";
			else
				return "(§­îc giao)";
			end
		end
	else
		if tGtTask:check_cur_task(nTaskID) == 1 then
			DirectDeleteTask(nTaskID);
		end
		return "(Ngµy mai quay l¹i)";
	end	
end

function zk_TzqTask(npcIndex)
	local szNpcName = GetNpcName(npcIndex);
	local tSay = {};
	for _, v in ZK_TZQ_TASK do
		tinsert(tSay, format("%s%s/#zk_TzqTask_do(%d, %d)", v[1], zk_GetTaskState1(v[2], v[3]), v[2], v[3]));
	end
	tinsert(tSay, "\nT¹i h¹ chØ xem qua th«i/nothing");
	local msg = format("Hoµn thµnh nhiÖm vô d­íi ®©y nhËn PhiÕu Khiªu ChiÕn t­¬ng øng, mçi ng­êi mçi ngµy <color=red>nhËn ®­îc nhiÒu nhÊt %d PhiÕu Khiªu ChiÕn<color>.", ZK_TZQ_NUM_MAX);
	Say(format("<color=gold>%s<color>:%s", szNpcName, msg), getn(tSay), tSay);
end

function zk_TzqTask_do(nTaskID, nBit)
	if gf_GetTaskBit(ZK_TASK_TAG1, nBit) ~= 0 then
		Talk(1,"","§· hoµn thµnh nhiÖm vô nµy! Ngµy mai h·y quay l¹i");
		return 0;
	end	
	if tGtTask:check_cur_task(nTaskID) == 1 then
		if DirectIsTaskFinish(nTaskID) ~= 1 then
			Talk(1,"","VÉn ch­a hoµn thµnh nhiÖm vô!");
			return 0;
		end
		if DirectFinishGTask(nTaskID, 2) ==  1 then
			gf_SetTaskBit(ZK_TASK_TAG1, nBit, 1);
			Msg2Player("NhiÖm vô hoµn thµnh!");
			SetCurrentNpcSFX(GetTargetNpc(), 907, 2, 0, 18*5);
			if nTaskID == 381 then SetTask(3423, 0) end
			if nTaskID == 382 then SetTask(3424, 0) end
			if nTaskID == 383 then SetTask(3425, 0); SetTask(3426, 0); end
			if nTaskID == 384 then SetTask(3427, 0) end
			if nTaskID == 387 then SetTask(3428, 0) end
			AddRuntimeStat(43, 1, nTaskID - 380, 1);
		else
			DirectDeleteTask(nTaskID);
		end
	else
		DirectGetGTask(nTaskID, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 906, 2, 0, 18*5);
	end
end

function zk_GetTaskState2(nBit)
	if gf_GetTaskBit(ZK_TASK_TAG2, nBit) ~= 0 then
		return "(§· hoµn thµnh)";
	else
		return "(Ch­a hoµn thµnh)";
	end
end

function zk_GetZmmxCount()
	local nCount = 0;
	for _, elem in ZK_ZMMX_TASK do
		if gf_GetTaskBit(ZK_TASK_TAG2, elem[4]) == 1 then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function zk_ZmmxTask(npcIndex)
	if zk_GetZmmxCount() >= ZK_ZMMX_COUNT_MAX then
		Talk(1,"","§· hoµn thµnh nhiÖm vô nµy! Ngµy mai h·y quay l¹i");
		return 0;
	end
	local szNpcName = GetNpcName(npcIndex);
	local tSay = {};
	for i = 1, getn(ZK_ZMMX_TASK) do
		local v = ZK_ZMMX_TASK[i];
		tinsert(tSay, format("%s%s/#zk_ZmmxTask_do(%d)", v[1], zk_GetTaskState2(v[4]), i));
	end
	tinsert(tSay, "\nT¹i h¹ chØ xem qua th«i/nothing");
	local msg = format("Hoµn thµnh %d nhiÖm vô bÊt kú sau sÏ nhËn ®­îc 1 %s.",--£¬<color=red>Ã¿ÈËÃ¿Ìì×î¶à»ñµÃ%d¸ö<color>¡£", 
		ZK_ZMMX_COUNT_MAX, "Bót Nghiªn GiÊy Mùc", 1);
	Say(format("<color=gold>%s<color>:%s", szNpcName, msg), getn(tSay), tSay);
end

function zk_ZmmxTask_do(nIndex)
	local v = ZK_ZMMX_TASK[nIndex];
	local msg = format("X¸c nhËn nép %s*%d ph¶i kh«ng?", v[1], v[2])
	Say(format("<color=gold>%s<color>:%s", GetNpcName(GetTargetNpc()), msg), 2,
		format("§ång ı/#zk_ZmmxTask_do_cb(%d)", nIndex), "\nT¹i h¹ chØ xem qua th«i/nothing");
end

function zk_ZmmxTask_do_cb(nIndex)
	local v = ZK_ZMMX_TASK[nIndex];
	if gf_GetTaskBit(ZK_TASK_TAG2, v[4]) ~= 0 then
		Talk(1,"","B¹n ®· hoµn thµnh nhiÖm vô nµy! H·y chän nhiÖm vô kh¸c");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	if type(v[3]) == "table" then
		if GetItemCount(unpack(v[3])) < v[2] then
			Talk(1,"",format("trong hµnh trang, sè l­îng cña %s kh«ng ®ñ %d", v[1], v[2]));
			return 0;
		end
		if DelItem(v[3][1], v[3][2], v[3][3], v[2]) ~= 1 then
			return 0;
		end
	else
		if GetCash() < v[2]*10000 then
			Talk(1,"",format("trong hµnh trang, sè l­îng cña %s kh«ng ®ñ %d", v[1], v[2]));
			return 0;
		end
		if Pay(v[2]*10000) ~= 1 then
			return 0;
		end
	end
	gf_SetTaskBit(ZK_TASK_TAG2, v[4], 1);
	Msg2Player(format("Nép thµnh c«ng %s*%d", v[1], v[2]));	
	if zk_GetZmmxCount() == ZK_ZMMX_COUNT_MAX then
		AddItem(2, 1, 31059, 1);
		Talk(1,"",format("NhËn ®­îc <color=green>%s<color>*%d!", "Bót Nghiªn GiÊy Mùc", 1));
		SetCurrentNpcSFX(GetTargetNpc(), 907, 2, 0, 18*5);
		SetTask(ZK_TASK_TAG2,0);
	end
	AddRuntimeStat(43, 2, nIndex, 1)
end

function zk_BigTask(npcIndex)
	local szNpcName = GetNpcName(npcIndex);
	local msg = "§Õn Tr­ëng M«n c¸c m«n ph¸i nhËn nhiÖm vô khiªu chiÕn1"
	Say(format("<color=gold>%s<color>:%s", szNpcName, msg), 0);
end

function _gtask_zk_award(nNum)
	local nCount = ZK_TZQ_NUM_MAX - zk_GetTzqNum();
	if nCount <= 0 then
		Msg2Player(format("H«m nay ®· nhËn ®­îc %s lín nhÊt", "PhiÕu Khiªu ChiÕn"))
		return 0;
	end
	nCount = min(nCount, nNum);
	AddItem(2,1,31058, nCount);   -- Ôö¼ÓÌôÕ½È¯
	Msg2Player(format("NhËn ®­îc %s*%d", "PhiÕu Khiªu ChiÕn", nCount));
end

--Õ½¿ñÎäÆ÷Éı¼¶
function handle_zkwq_createnpc()
	CreateNpc("Ch­ëng d­îc T©y Nam", "Th­¬ng Nh©n Chî §en", 350, 1402, 2952);
end

function handle_zkwq_main(npcIndex)
	show_equip_shop(3078);
end

function handle_zkwq_bossdeath1(npcIndex)
	local npcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex, 0);
	local msg = format("Chóc mõng [%s] ®· tiªu diÖt [%s]", GetName(), npcName);
	AddGlobalNews(msg);
	Msg2Global(msg);
	AddRuntimeStat(43, 5, 0, 1);
	local tPlayer = GetNearPlayerList();
	if tPlayer then
		AddRuntimeStat(43, 7, 0, getn(tPlayer));
		local oldPlayerIndex = PlayerIndex
		for _, v in tPlayer do
			PlayerIndex = v;
			AddRuntimeStat(43, 8, GetPlayerRoute(), 1);
			if GetTeamSize() > 1 then
				AddRuntimeStat(43, 11, 0, 1)
			end
			local nState, nCamp = GetPKFlag()
			if nState == 2 and nCamp == 0 then
				AddRuntimeStat(43, 12, 0, 1)
			end
		end
		PlayerIndex = oldPlayerIndex;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("zkwqup_ptboss", 1);
end

function handle_zkwq_bossdeath2(npcIndex)
	local npcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex, 0);
	local msg = format("Chóc mõng [%s] ®· tiªu diÖt [%s]", GetName(), npcName);
	AddGlobalNews(msg);
	Msg2Global(msg);
	AddRuntimeStat(43, 6, 0, 1);
	local tPlayer = GetNearPlayerList();
	if tPlayer then
		AddRuntimeStat(43, 9, 0, getn(tPlayer));
		local oldPlayerIndex = PlayerIndex
		for _, v in tPlayer do
			PlayerIndex = v;
			AddRuntimeStat(43, 10, GetPlayerRoute(), 1);
			if GetTeamSize() > 1 then
				AddRuntimeStat(43, 13, 0, 1)
			end
			local nState, nCamp = GetPKFlag()
			if nState == 2 and nCamp == 0 then
				AddRuntimeStat(43, 14, 0, 1)
			end
		end
		PlayerIndex = oldPlayerIndex;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("zkwqup_hjboss", 0);
end

function handle_zkwq_useitem(nItemIndex)
	Say(format("X¸c ®Şnh muèn dïng %s ®æi %s*%d?", GetItemName(nItemIndex), "VÈy Kú L©n", 10), 2,
		format("X¸c ®Şnh ®æi/#zkwq_ItemExchange(%d)", nItemIndex), "§Ó ta suy nghÜ/nothing");
end

function zkwq_ItemExchange(nItemIndex)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 31064, 10}, "VÈy Kú L©n", "T¨ng cÊp vò khİ ChiÕn Cuång", "Mét t¸ VÈy Kú L©n", 0, 1);
end

function zkwq_IsOpen()
	return gf_CheckDuration(zkwq_Start, zkwq_End);
end

function zkwq_Main(npcIndex)
	local tSay = {
		format("Giíi thiÖu ho¹t ®éng/#zkwq_Info(%d)", npcIndex),
		format("Shop HuyÒn TInh/#show_equip_shop(%d)", 3077),
		"\nT«i chØ xem xem th«i/nothing",
	}
	local msg = "Thêi gian ho¹t ®éng lµ 01-30/6/2016.";
	Say(format("<color=gold>%s<color>:%s", GetNpcName(npcIndex), msg), getn(tSay), tSay);
end

function zkwq_Info(npcIndex)
	local tbBody = "\n1. Nguyªn liÖu cÇn:\n\tDung LuyÖn Th¹ch*25, L©n PhiÕn*1, Thiªn M«n Kim LÖnh*3, Thiªn Cang LÖnh*2.\n2. C¸ch nhËn L©n PhiÕn:\n\tNghe nãi gÇn ®©y lóc 9h tèi mçi ngµy, Háa Kú L©n Con vµ ThÇn Thó Háa Kú L©n sÏ chia nhau xuÊt hiÖn ë [Vò L¨ng S¬n 176/180] vµ [Linh B¶o S¬n 224/218]. §¸nh b¹i Háa Kú L©n ®Ó nhËn L©n PhiÕn. Háa Kú L©n Con do ch­a tr­ëng thµnh nªn sÏ r¬i ra İt L©n PhiÕn h¬n. L­u ı, Háa Kú L©n lu«n ph¸t ra s¸t khİ Xİch Viªm ®Ó bao v©y ng­êi ®Õn tiªu diÖt nã, ®Ò nghŞ c¸c vŞ thiÕu hiÖp h·y tæ ®éi ®Ó hç trî nhau. NÕu ®Õn 11h ch­a cã thiÕu hiÖp nµo tiªu diÖt ®­îc nã th× nã sÏ biÕn mÊt.\n3.C¸ch nhËn Dung LuyÖn Th¹ch:\n\tLµ lo¹i vËt liÖu chÕ t¹o ®Æc biÖt, cã thÓ dung luyÖn mäi vËt chÊt. Do L©n PhiÕn ph¶i ®­îc ®un ë nhiÖt ®é cao nªn cÇn dïng ®Õn Dung LuyÖn Th¹ch nµy. Dung LuyÖn Th¹ch rÊt hiÕm, cã thÓ mua ë Ngù C¸c. Nghe nãi ë T­¬ng D­¬ng xuÊt hiÖn mét Th­¬ng Nh©n Chî §en chuyªn mua b¸n c¸c lo¹i nguyªn liÖu quı hiÕm, thiÕu hiÖp cã thÓ ®Õn ®ã xem sao.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(npcIndex))..tbBody;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function zkwq_CallBoss1()
	if zkwq_IsOpen() ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("huoqilin_zkweapon", "Háa Kú L©n Con", 406, 1415, 2891);
	if npcIndex > 0 then
		SetNpcLifeTime(npcIndex, 7200);
		local msg = format("%s xuÊt hiÖn ë %s, nÕu kh«ng thÓ ®¸nh b¹i nã trong %s giê, nã sÏ biÕn mÊt. Mau hµnh ®éng nµo!", "Háa Kú L©n Con", "Vò L¨ng S¬n (176/180)", 2);
		AddGlobalNews(msg);
		Msg2Global(msg);
	end
end

function zkwq_CallBoss2()
	if zkwq_IsOpen() ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("shenshouhuoqilin_zkweapon", "ThÇn Thó Háa Kú L©n", 218, 1799,3499);
	if npcIndex > 0 then
		SetNpcLifeTime(npcIndex, 7200);
		local msg = format("%s xuÊt hiÖn ë %s, nÕu kh«ng thÓ ®¸nh b¹i nã trong %s giê, nã sÏ biÕn mÊt. Mau hµnh ®éng nµo!", "ThÇn Thó Háa Kú L©n", "Linh B¶o S¬n (224/218)", 2);
		AddGlobalNews(msg);
		Msg2Global(msg);
	end
end


