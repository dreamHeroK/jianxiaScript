Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = {
  nPriority 			= 1,
  szEngName 			= "the_Mummy",
  szViewName 			= "§¹o Mé Mª Thµnh",
  nTalkBeginDate 	= 20151115,
  nBeginDate 			= 20151115,
  nEndDate 				= 20151130,
  nTaskGroup 			= 5,
  nTaskGroupVersion	= 15,
}

DBMC_NPC_NAME = "<color=green>Binh Bé ThÞ Lang<color>:"
DBMC_DAILY_TASK_LIMIT = 20
DBMC_USE_ITEM_LIMIT = 600

g_Dbmc_tTask = {
	{"ThÊt L¹c Nhai", "NhËt ®µn hé ph¸p", 20, 6300},
	{"ThÊt L¹c Nhai", "NguyÖt §µn Hé Ph¸p", 20, 6300},
	{"ThÊt L¹c Nhai", "Tinh §µn Hé Ph¸p", 20, 6300},
	{"ThÊt L¹c Nhai", "Nhai Th­îng S¬n TÆc", 20, 6300},
	{"Cæ D­¬ng ®éng_1", "¢m NhËt Sø ", 30, 511},
	{"Cæ D­¬ng ®éng_2", "XÝch LuyÖn Háa Hå", 20, 512},
	--{"´ó²ÝÔ­¶þ", "Òì×å¼ýÊÖ", 20, 602},
	{"H¾c Phong ®éng", "M·ng KhÊu", 20, 215},
	--{"Á½Ë®¶´¶þ²ã", "ò¿»ð½ÌÍ½", 20, 113},
	--{"¹íÃÅ»ØÀÈ", "Ð¡À¶µ¶¹í", 20, 328},
}

g_Dbmc_tAward = {
	{"item", 10, "Da §Þa Long", {2, 1, 30673, 100}},
	{"item", 25, "Viªm Linh Ti", {2, 1, 30671, 100}},
	{"item", 50, "Da Ma Lang", {2, 1, 30672, 100}},
	{"item", 75, "HuyÒn Viªm ThiÕt", {2, 1, 30670, 100}},
	{"item", 100, "Tiªn ¢m Th¹ch", {2, 1, 30674, 100}},
	{"exp", 200, "100000000EXP", 100000000},
	{"item", 300, "Th¸i NhÊt LÖnh", {2, 1, 30687, 4}},
	{"item", 400, "Th¸i NhÊt LÖnh", {2, 1, 30687, 6}},
	{"item", 500, "Th¸i NhÊt LÖnh", {2, 1, 30687, 10}},
}

function on_init_ok()
	AcivityBase.TaskGroup.Task1 = 1; --¼ÇÂ¼µ±Ç°ÄêÔÂÈÕ
	AcivityBase.TaskGroup.Task2 = 2; --µ±Ç°ÈÎÎñË÷Òý1£¬É±¹Ö´ÎÊý2£¬Ã¿ÈÕ½ÓÈ¡ÈÎÎñ¸öÊý3, µÁ±¦Ôô¼ÆÊý4
	AcivityBase.TaskGroup.Task3 = 3; --ÆÕÍ¨²Ø±¦Í¼Ê¹ÓÃ´ÎÊý
	AcivityBase.TaskGroup.Task4 = 4; --×ø±êË÷Òý
	AcivityBase.TaskGroup.Task5 = 5; --µÁÄ¹ÔôµÄ²Æ±¦Ê¹ÓÃ´ÎÊý
	AcivityBase.TaskGroup.Task6 = 6; --µÁÄ¹ÔôµÄ²Æ±¦ÀÛ¼Æ½±Àø±ê¼Ç
	AcivityBase.TaskGroup.Task7 = 7; --Ë¢ÐÂÉ±¹Ö¿ª¹Ø±ê¼Ç1,2,3bit
	AcivityBase.TaskGroup.Task8 = 8; --¼ÇÂ¼Ë¢¹ýµÁÄ¹ÔôµÄ²Æ±¦
	isolate_enable_event_dispatch(-1)
end

function on_add_watches()
	isolate_watch_npc_talk("Binh Bé ThÞ Lang", 200, "handle_npc_talk_main")
	isolate_watch_item_talk(2, 1, 30947, "handle_on_item_talk") --ÆÕÍ¨²Ø±¦Í¼
	isolate_watch_item_talk(2, 1, 30940, "handle_on_item_treasure") --µÁÄ¹ÔôµÄ²Æ±¦
	for _, v in g_Dbmc_tTask do
		isolate_watch_event("event_kill_npc", "kill_npc_task_on_trigger", v[2], v[4]);
	end
	isolate_watch_event("event_kill_npc", "kill_npc_daobaozei", "§¹o B¶o TÆc", -1);
	isolate_watch_event("event_kill_npc", "kill_npc_baozangshouhuzhe", "Ng­êi B¶o VÖ Kho B¸u", -1);
end

function on_event_player_login(nExchangeComing) 
	local tTaskGroup = AcivityBase.TaskGroup
	if tTaskGroup:GetTaskBit(tTaskGroup.Task7, 1) ~= 0 then
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger")
	else
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger")
	end
	if tTaskGroup:GetTaskBit(tTaskGroup.Task7, 2) ~= 0 then
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
	else
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
	end
	if tTaskGroup:GetTaskBit(tTaskGroup.Task7, 3) ~= 0 then
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe")
	else
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe")
	end
end

function handle_npc_talk_main(nNpcIndex)
	if gf_CheckLevel(5, 80) ~= 1 then
		Talk(1, "", DBMC_NPC_NAME..format("Ch­a ®¹t ®Õn yªu cÇu chuyÓn sinh %d cÊp %d ", 5, 80))
		return 0;
	end
	local msg = "GÇn ®©y Binh Bé ThÞ Lang tiªu diÖt mét nhãm §¹o Mé TÆc trong L¨ng TÇn Thñy Hoµng, nhËn ®­îc rÊt nhiÒu Tµng B¶o §å. Bçng nhiªn khiÕn cho nh÷ng ng­¬i cã t©m ®Þa xÊu ®ét nhËp vµo ThÞ Lang Phñ khiÕn cho Binh Bé ThÞ Lang phiÒn lßng; ®Ó gi¶i quyÕt chuyÖn nµy th× Binh Bé ThÞ Lang ®· ban th­ëng Tµng B¶o §å ®Ó triÖu tËp hiÖp sÜ giang hå ®Ó trõng trÞ chóng."
	local tSay = {
		"NhiÖm vô Trõng Giíi/reprimand_task",
		"PhÇn th­ëng tÝch lòy Tµi S¶n §¹o B¶o TÆc/treasure_accumulative_award",
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(DBMC_NPC_NAME..msg, getn(tSay), tSay)
end

function reprimand_task()
	local tTaskGroup = AcivityBase.TaskGroup
	local nTaskIndex = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 1)
	local szTalkStr = "H·y ®Õn [<color=green>%s<color>] tiªu diÖt <color=red>%s*%d<color>";
	if nTaskIndex ~= 0 then
		local tTask = g_Dbmc_tTask[nTaskIndex];
		local msg = DBMC_NPC_NAME..format(szTalkStr, tTask[1], tTask[2], tTask[3])
		if tTaskGroup:GetTaskByte(tTaskGroup.Task2, 2) >= tTask[3] then
			local tSay = {
				"Hoµn thµnh/reprimand_task_finish",
				"H·y quay l¹i sau/nothing",
			}
			Say(msg, getn(tSay), tSay)
			return 0;
		end
		Talk(1,"", msg);
		return 0;
	end
	local nCurDate = tonumber(date("%Y%m%d"));
	if tTaskGroup:GetTask(tTaskGroup.Task1) ~= nCurDate then
		tTaskGroup:SetTaskByte(tTaskGroup.Task2, 3, 0);
		tTaskGroup:SetTask(tTaskGroup.Task1, nCurDate);
		tTaskGroup:SetTask(tTaskGroup.Task8, 0);
	end
	local nTotal = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 3);
	if nTotal >= DBMC_DAILY_TASK_LIMIT then
		Talk(1,"",format("H»ng ngµy ®­îc tham gia tèi ®a %d lÇn nhiÖm vô Trõng Giíi", DBMC_DAILY_TASK_LIMIT));
		return 0;
	end
	local nRandIndex = random(getn(g_Dbmc_tTask));
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 1, nRandIndex);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 2, 0);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 3, nTotal + 1)
	local tTask = g_Dbmc_tTask[nRandIndex];
	tTaskGroup:SetTaskBit(tTaskGroup.Task7, 1, 1);
	isolate_enable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger"); --ÉúÐ§
	Talk(1,"",DBMC_NPC_NAME..format(szTalkStr, tTask[1], tTask[2], tTask[3]));
	TaskTip(format("H·y ®Õn [%s] tiªu diÖt %s*%d", tTask[1], tTask[2], tTask[3]));
end

function reprimand_task_finish()
	if gf_Judge_Room_Weight(1, 10, DBMC_NPC_NAME) ~= 1 then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 1, 0);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 2, 0);
	local nNum = 1;
	if IsActivatedVipCard() ~= 0 then
		nNum = nNum + 1
	end
	gf_AddItemEx2({2, 1, 30947, nNum}, "Tµng B¶o §å-Th­êng", "§¹o Mé Mª Thµnh", "NhiÖm vô Trõng Giíi", 0, 1)
end

function kill_npc_task_on_trigger(data)
	local tTaskGroup = AcivityBase.TaskGroup
	local nTaskIndex = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 1);
	local nTaskCount = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 2);
	local tTask = g_Dbmc_tTask[nTaskIndex];
	local msg = format("Tiªu diÖt %s (%d/%d)", tTask[2], nTaskCount + 1, tTask[3])
	if tTask[2] ~= data[1] then
		return 0;
	end
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 2, nTaskCount + 1);
	if nTaskCount + 1 >= tTask[3] then
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 1, 0);
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger")
		Msg2Player(msg.."(Hoµn thµnh)");
		return 0;
	end
	Msg2Player(msg)
end

function handle_on_item_talk(nItemIndex)
	local tPos = {
		{"ThÊt L¹c Nhai (167,217)", {6300,1342,3481}},
		{"ThÊt L¹c Nhai (165,190)", {6300,1320,3043}},
		{"ThÊt L¹c Nhai(184,205)", {6300,1473,3294}},
		{"Quúnh KÕt(221,203)", {6100,1768,3252}},
		{"H­ng Kh¸nh(176,195)", {6200,1412,3124}},
		{"Thiªn Long Tù(177,165)", {6000,1417,2649}},
		{"T©y Thµnh §« (182,178)", {301,1458,2854}},
		{"Nam Thµnh §«(188,184)", {304,1508,2956}},
		{"§«ng BiÖn Kinh (211,189)", {205,1692,3029}},
		{"T©y BiÖn Kinh (182,183)", {203,1462,2942}},
		{"T©y TuyÒn Ch©u (184,190)", {105,1472,3056}},
		{"B¾c TuyÒn Ch©u(185,186)", {108,1486,2981}},
	}
	local tTaskGroup = AcivityBase.TaskGroup;
	local UseTimes = tTaskGroup:GetTask(tTaskGroup.Task3);
	if UseTimes >= DBMC_USE_ITEM_LIMIT then
		Talk(1,"", DBMC_NPC_NAME..format("Trong thêi gian ho¹t ®éng <color=green>%s<color> tèi ®a dïng ®­îc <color=green>%d<color> lÇn", GetItemName(nItemIndex), DBMC_USE_ITEM_LIMIT));
		return 0;
	end
	local nPosIndex = tTaskGroup:GetTask(tTaskGroup.Task4);
	if nPosIndex == 0 then
		nPosIndex = random(getn(tPos));
		tTaskGroup:SetTask(tTaskGroup.Task4, nPosIndex);
	end
	local nDesPos = tPos[nPosIndex][2];
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == nDesPos[1] then
		local nDisX = nX - nDesPos[2]
		local nDisY = nY - nDesPos[3]
		if nDisX*nDisX + nDisY*nDisY < 64 then
			found_treasure_event(nItemIndex)
			return 0
		end
	end
	local msg = format("Mêi %s ®Õn %s t×m b¶o vËt ®­îc §¹o Mé TÆc ®Ó l¹i!", gf_GetPlayerSexName(), tPos[nPosIndex][1]);
	Talk(1,"", DBMC_NPC_NAME..msg);
	TaskTip(msg);
end

function found_treasure_event(nItemIndex)
	if gf_Judge_Room_Weight(2, 10, DBMC_NPC_NAME) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup;
	tTaskGroup:SetTask(tTaskGroup.Task3, tTaskGroup:GetTask(tTaskGroup.Task3) + 1);
	tTaskGroup:SetTask(tTaskGroup.Task4, 0);
	local tEvent = {
		{1, 300},
		{1, 1099},
		{1, 1},
		{1, 8600},
	}
	local nIndex = gf_GetRandItemByTable(tEvent, 10000, 1);
	if nIndex == 3 and tTaskGroup:GetTask(tTaskGroup.Task8) ~= 0 then
		nIndex = 4;
	end
	event_treasure_deal(nIndex);
end

function event_treasure_deal(nType)
	if nType == 1 then
		local tTaskGroup = AcivityBase.TaskGroup;
		tTaskGroup:SetTaskByte(tTaskGroup.Task2, 4, 0);
		local nMapId, nX, nY = GetWorldPos()
		for i = 1, 4 do 
			CreateNpc("hd_daomuzei", "§¹o B¶o TÆc", nMapId, nX + random(-4, 4), nY + random(-4, 4)); 
		end
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 2, 1);
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
		Talk(1,"","Nguy hiÓm!")
	elseif nType == 2 then
		Talk(1,"",DBMC_NPC_NAME.."Cã ng­êi ®· ®Õn tr­íc ®µo kho b¸u ®i mÊt råi!");
	elseif nType == 3 then
		CreateNpc("hd_shouhuzhe", "Ng­êi B¶o VÖ Kho B¸u", GetWorldPos());
		local tTaskGroup = AcivityBase.TaskGroup;
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 3, 1);
		tTaskGroup:SetTask(tTaskGroup.Task8, 1);
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe")
		Talk(1,"","Lì tay kÝch ho¹t c¬ quan, bÞ ng­êi b¶o vÖ ph¸t hiÖn!")
	elseif nType == 4 then
		CustomAwardGiveGroup("act_11_normal", 0)
	end		
end

function kill_npc_daobaozei(data)
	if data[1] ~= "§¹o B¶o TÆc" then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup
	local nCount = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 4);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 4, nCount + 1);
	if nCount + 1 >= 4 then
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 2, 0);
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
	end
	CustomAwardGiveGroup("act_11_normal", 0);
end

function kill_npc_baozangshouhuzhe(data)
	if data[1] ~= "Ng­êi B¶o VÖ Kho B¸u" then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup;
	tTaskGroup:SetTaskBit(tTaskGroup.Task7, 3, 0);
	isolate_disable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe");
	gf_AddItemEx2({2, 1, 30940, 1}, "Tµi S¶n §¹o B¶o TÆc", "§¹o Mé Mª Thµnh", "Sù kiÖn Tµng B¶o §å", 0, 1);
	Msg2Player(format("Tiªu diÖt %s (%d/%d)", "Ng­êi B¶o VÖ Kho B¸u", 1, 1).."(Hoµn thµnh)");
	local msg = format("Chóc mõng %s nhËn ®­îc %s", GetName(), "Tµi S¶n §¹o B¶o TÆc");
	Msg2Global(msg)
	AddGlobalNews(msg, 1)
end

function handle_on_item_treasure(nItemIndex)
	if CustomAwardCheckCondition("act_11_ib") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup;
	tTaskGroup:SetTask(tTaskGroup.Task5, tTaskGroup:GetTask(tTaskGroup.Task5) + 1);
	CustomAwardGiveGroup("act_11_ib", 0)
end

function treasure_accumulative_award()
	local tTaskGroup = AcivityBase.TaskGroup;
	local times = tTaskGroup:GetTask(tTaskGroup.Task5);
	local tStatus = {"Ch­a l·nh nhËn", "§· l·nh nhËn"}
	local msg = DBMC_NPC_NAME..format("HiÖn t¹i sè lÇn dïng Tµi S¶n §¹o B¶o TÆc lµ <color=green>%d<color>, %s muèn nhËn phÇn th­ëng g×??", times, gf_GetPlayerSexName());
	msg = msg.."(sau khi nhËn xong phÇn th­ëng tÝch lòy mét l­ît sÏ tù ®éng reset)"
	local tSay = {}
	for i = 1, getn(g_Dbmc_tAward) do
		local nStatus = tTaskGroup:GetTaskBit(tTaskGroup.Task6, i) + 1;
		if g_Dbmc_tAward[i][1] == "item" then
			tinsert(tSay, format("Dïng %d lÇn nhËn ®­îc %s*%d (%s)/#treasure_accumulative_award_cb(%d)", g_Dbmc_tAward[i][2], g_Dbmc_tAward[i][3], g_Dbmc_tAward[i][4][4], tStatus[nStatus], i));
		else
			tinsert(tSay, format("Dïng %d lÇn nhËn ®­îc %s (%s)/#treasure_accumulative_award_cb(%d)", g_Dbmc_tAward[i][2], g_Dbmc_tAward[i][3], tStatus[nStatus], i));
		end
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing")
	Say(msg, getn(tSay), tSay);
end

function treasure_accumulative_award_cb(nIndex)
	local tTaskGroup = AcivityBase.TaskGroup;
	local times = tTaskGroup:GetTask(tTaskGroup.Task5);
	local nStatus = tTaskGroup:GetTaskBit(tTaskGroup.Task6, nIndex);
	if nStatus ~= 0 then
		Talk(1,"",DBMC_NPC_NAME.."Kh«ng thÓ nhËn l¹i phÇn th­ëng!");
		return 0;
	end
	local tAward = g_Dbmc_tAward[nIndex];
	if times < tAward[2] then
		Talk(1,"",DBMC_NPC_NAME..format("Sè lÇn dïng ®¹t <color=red>%d<color> lÇn míi ®­îc nhËn th­ëng", tAward[2]));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, DBMC_NPC_NAME) ~= 1 then
		return 0;
	end
	tTaskGroup:SetTaskBit(tTaskGroup.Task6, nIndex, 1);
	if tAward[1] == "item" then
		gf_AddItemEx2(tAward[4], tAward[3], "§¹o B¶o Mª Thµnh", "Th­ëng tÝch lòy Tµi S¶n §¹o B¶o TÆc", 0, 1);
	else
		gf_Modify("Exp", 100000000);
	end
	--È«²¿ÁìÈ¡ÍêÁË¾ÍÖØÖÃ
	local nSize = getn(g_Dbmc_tAward);
	local nMaxTimes = g_Dbmc_tAward[nSize][2];
	if times < nMaxTimes then
		return 0;
	end
	local bflag = 1;
	for i = 1, nSize do
		if tTaskGroup:GetTaskBit(tTaskGroup.Task6, i) ~= 1 then
			bflag = 0
			break
		end
	end
	if bflag ~= 0 then
		tTaskGroup:SetTask(tTaskGroup.Task5, times - nMaxTimes);
		tTaskGroup:SetTask(tTaskGroup.Task6, 0);
		Msg2Player("§· reset phÇn th­ëng tÝch lòy");
	end
end