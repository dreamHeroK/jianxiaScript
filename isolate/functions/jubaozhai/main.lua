Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua")

Import("\\script\\ksgvn\\lib.lua")

gJbz_Period	= EVENT_TUBAOTRAI_VERSION; --µÚ¼¸ÆÚ

t_isolate_base_cfg = {
  nPriority 			= 1,
  szEngName 			= "jbz",
  szViewName 			= "Tô B¶o Trai",
  nTalkBeginDate 	= EVENT_TUBAOTRAI_START_DATE,
  nBeginDate 			= EVENT_TUBAOTRAI_START_DATE,
  nEndDate 				= EVENT_TUBAOTRAI_END_DATE,
}

NPC_NAME = "<color=green>Chñ Th­¬ng Héi<color>:"

TASK_JBZ_PERIOD = 3404;
TASK_JBZ_FLAG = 3405; --1,2byteÀÛ¼Æ´ÎÊý£¬3byteÀÛ¼Æ½±ÀøÁìÈ¡±ê¼Ç£¬4byteÔÂ¿¨ÁìÈ¡ÐüÊ¯±ê¼Ç

JBZ_ACC_TABLE = {
	{100, "Qu©n C«ng Huy Hoµng", {2,1,9977,2}, 30},
	-- {100, "ÕÆÃÅÃÜÐÅ", {2,1,31060,1,4}, 0},
	{500, format("Tói §¸ Quý CÊp 5*%d", 1), {2,1,31024,1}, 0},
	{1000, "Qu©n C«ng Huy Hoµng", {2,1,9977,4}, 30},
	{2000, format("Tói §¸ Quý CÊp 6*%d", 2), {2,1,31123,2}, 0},
	{3000, format("Bao ®¸ quý cÊp 7*%d", 1), {2,1,31505,1}, 0},
	{5000, "Th­¬ng H¶i Ch©u cÊp 5 (ch­a gi¸m ®Þnh)", {2,102,223,1}, 0},
	{8000, format("Tói Trang BÞ Kim Xµ CÊp 7 x%d",1), {2,1,31400,1}, 	0 	},
	{10000, "Th­¬ng H¶i Ch©u cÊp 6 (ch­a gi¸m ®Þnh)", {2,102,224,1}, 0},
	{20000, "Tói Háa Phông *2", {2,1,50020,2}, 0},
	{30000, "Cæ Phæ-Tói Tµn QuyÓn *5", {2,1,50028,5}, 0},
}

function handle_xuanshi_event(tEvent, data, para)
	--gf_PrintTable(tEvent)
	--gf_PrintTable(data)
	--gf_PrintTable(para)
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30997, 1}, "HuyÒn Th¹ch", "Tô B¶o Trai", "Hoµn thµnh nhiÖm vô nhËn HuyÒn Th¹ch", 0, 1);
end

t_isolate_user_batch_watch_list = {
	{"event_mission_task_award", {"liangshan","1chuyan", -1}, handle_xuanshi_event,	{"Hoµn thµnh nhiÖm vô khiªu chiÕn L­¬ng S¬n-S¬"},  },
	{"event_mission_task_award", {"liangshan","2zhongyong", -1}, handle_xuanshi_event,	{"Hoµn thµnh nhiÖm vô khiªu chiÕn L­¬ng S¬n-Trung Dòng"},  },
	{"event_mission_task_award", {"wanjianzhong","1daily_pass", -1}, handle_xuanshi_event,	{"Hoµn thµnh nhiÖm vô V¹n KiÕm Tròng h»ng ngµy"},  },
	{"event_mission_task_award", {"wanjianzhong","2daily_fanpai", -1}, handle_xuanshi_event,	{"Hoµn thµnh nhiÖm vô V¹n KiÕm Tròng h»ng ngµy"},  },
	{"event_mission_task_award", {"dixuangong","2dapo", -1}, handle_xuanshi_event,	{"Hoµn thµnh nhiÖm vô ®¹i ph¸ §Þa HuyÒn Cung"},  },
}

function on_init_ok()
	isolate_enable_event_dispatch(-1)
end

function on_add_watches()
	isolate_watch_npc_talk("Chñ th­¬ng héi", 350, "handle_npc_talk_main")
	isolate_watch_npc_talk("Chñ th­¬ng héi", 300, "handle_npc_talk_main")
	isolate_watch_npc_talk("Chñ th­¬ng héi", 100, "handle_npc_talk_main")
end

function handle_npc_talk_main()
	if GetTask(TASK_JBZ_PERIOD) ~= gJbz_Period then
		SetTask(TASK_JBZ_PERIOD, gJbz_Period, TASK_ACCESS_CODE_JBZ);
		SetTask(TASK_JBZ_FLAG, 0, TASK_ACCESS_CODE_JBZ);
	end
	local msg = "GÇn ®©y c¸c Chñ Th­¬ng Héi nhËn ®­îc lêi mêi cña mét ng­êi thÇn bÝ ®Õn TuyÒn Ch©u, kh«ng l©u sau trong giang hå cã tin ®ån: Chñ Th­¬ng Héi ë kh¾p n¬i ®· lËp mét tæ chøc cã tªn 'Tô B¶o Trai', ®ång thêi thu thËp mét l­îng lín vËt phÈm trong V¹n KiÕm Tròng, §Þa HuyÒn Cung vµ L­¬ng S¬n cã tªn lµ 'HuyÒn Th¹ch', tiÕc lµ b¶n tÝnh cña th­¬ng nh©n còng keo kiÖt, c¸c ®¹i hiÖp nhËn ®­îc vËt phÈm g× trong Tô B¶o Trai th× ph¶i xem c¬ duyªn cña m×nh.";
	local tSay = {
		format("Më Tô B¶o Trai (Kú %d)/open_jbz", gJbz_Period),
		"NhËn th­ëng tÝch lòy Tô B¶o Trai/get_acc_award",
		"ThÎ th¸ng nhËn HuyÒn Th¹ch/get_vipvard_award",
		"\nT«i chØ xem xem th«i/nothing"
	}
	Say(NPC_NAME..msg, getn(tSay), tSay);
end

function open_jbz()
	SendScript2Client("Open[[JbzBox]]");	
end

function get_acc_award()
	local msg = "Dïng rót may m¾n ®¹t sè lÇn nhÊt ®Þnh th× ®¹i hiÖp sÏ nhËn ®­îc phÇn th­ëng thªm";
	local nTimes = gf_GetMyTaskByte(TASK_JBZ_FLAG, 1, 2);
	msg = msg..format("(%s sè lÇn rót may m¾n hiÖn t¹i lµ <color=green>%d<color>)", gf_GetPlayerSexName(), nTimes);
	local tStatus = {"Ch­a nhËn", "§· nhËn"};
	local tSay = {};
	for i = 1, getn(JBZ_ACC_TABLE) do
		local v = JBZ_ACC_TABLE[i];
		local n = gf_GetTaskBit(TASK_JBZ_FLAG, 16 + i) + 1;
		tinsert(tSay, format("TÝch lòy rót may m¾n %d lÇn ®­îc nhËn %s(%s)/#get_acc_award_deal(%d)", v[1], v[2], tStatus[n], i));
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(NPC_NAME..msg, getn(tSay), tSay);
end

function get_acc_award_deal(index)
	local t = JBZ_ACC_TABLE[index];
	local nTimes = gf_GetMyTaskByte(TASK_JBZ_FLAG, 1, 2);
	local n = gf_GetTaskBit(TASK_JBZ_FLAG, 16 + index);
	if nTimes < t[1] then
		Talk(1,"",NPC_NAME..format("Sè lÇn tÝch lòy rót may m¾n ch­a ®¹t %d/%d", nTimes, t[1]));
		return 0;
	end
	if n ~= 0 then
		Talk(1,"",NPC_NAME.."B¹n ®· nhËn phÇn th­ëng nµy råi");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, NPC_NAME) ~= 1 then
		return 0;
	end
	gf_SetTaskBit(TASK_JBZ_FLAG, 16 + index, 1, TASK_ACCESS_CODE_JBZ);
	gf_AddItemEx2(t[3], GetItemName(t[3][1], t[3][2], t[3][3]), "Tô B¶o Trai", "Th­ëng tÝch lòy", t[4] * 24 * 3600, 1);
	local bFlag = nil
	local nCount = getn(JBZ_ACC_TABLE);
	for i = 1, nCount do
		if gf_GetTaskBit(TASK_JBZ_FLAG, 16 + i) ~= 1 then
			bFlag = 1;
		end
	end
	if not bFlag then
		gf_SetMyTaskByte(TASK_JBZ_FLAG, 1, 2, nTimes - JBZ_ACC_TABLE[nCount][1], TASK_ACCESS_CODE_JBZ);
		gf_SetTaskByte(TASK_JBZ_FLAG, 3, 0, TASK_ACCESS_CODE_JBZ);
		Msg2Player("§· reset sè lÇn th­ëng tÝch lòy may m¾n");
	end
end

function get_vipvard_award()
	if gf_GetTaskByte(TASK_JBZ_FLAG, 4) ~= 0 then
		Talk(1,"",NPC_NAME.."Mçi ®ît ho¹t ®éng chØ ®­îc nhËn 1 lÇn");
		return 0;
	end
	if IsActivatedVipCard() ~= 1 then
		Talk(1,"",NPC_NAME.."Sau khi kÝch ho¹t thÎ th¸ng míi ®­îc nhËn HuyÒn Th¹ch");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, NPC_NAME) ~= 1 then
		return 0;
	end
	gf_SetTaskByte(TASK_JBZ_FLAG, 4, 1, TASK_ACCESS_CODE_JBZ)
	gf_AddItemEx2({2, 1, 30997, 10}, "HuyÒn Th¹ch", "Tô B¶o Trai", "KÝch ho¹t thÎ th¸ng nhËn HuyÒn Th¹ch", 0, 1);
end
