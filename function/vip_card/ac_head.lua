Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
----------------------------------------------------------------------------------------------------------isolate begin
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 0,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ð§ >0:Ä£¿éÓÐÐ§£¬ÊýÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "activity_card",
    szViewName 			= "ThÎ ho¹t ®éng",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
function finish_task(nTaskIndex, szTaskName, nPoint)
	if ac_IsActivate() ~= 1 then return 0 end
	local nOldValue = ac_GetEventTag(nTaskIndex);
	if nOldValue ~= 0 then return 0; end
	
	ac_SetEventTag(nTaskIndex);
	ac_ModifyDayValue(nPoint);
	ac_ModifyMonthValue(nPoint);
	
	Msg2Player(format("Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô [%s] cña ThÎ Ho¹t §éng, nhËn ®­îc [%d] ®iÓm tÝch lòy.", szTaskName, nPoint))
end
function handle_elem(tEvent, data, para)
	if ac_IsActivate() ~= 1 then return 0 end
	local nTaskIndex = para[getn(para)]
	finish_task(nTaskIndex, tEvent[4][1], tEvent[4][2])
end
function handle_elem_ib_cost(tEvent, data, para)
	if ac_IsActivate() ~= 1 then return 0 end
	local nTaskIndex = para[getn(para)]
	local nOldValue = ac_GetEventTag(nTaskIndex);
	if nOldValue ~= 0 then return 0; end
	
	local nMaxCnt = tEvent[4][3]
	local nTotalCnt = ac_AddUseItemCount(nUseCnt)
	if nTotalCnt >= nMaxCnt then
		finish_task(nTaskIndex, tEvent[4][1], tEvent[4][2])
	end
end
function handle_on_item_talk_jndsj(nIndex)--½õÄÒ´óÊÂ¼þ¶Ô»°
	ac_MainDialog(nIndex)
end
t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {task_name, nAwardPoint, MaxUseCount}}
	{"event_player_login", {}, 								handle_elem,	{"§¨ng nhËp trß ch¬i", 1},  },
	{"event_player_daily_online_minute", {60}, 				handle_elem,	{"Online 60 phót", 5},  },
	{"event_mission_stage_finish", {"liangshan", 4}, 		handle_elem,	{"Hoµn thµnh ¶i 4 L­¬ng S¬n B¹c", 6},  },
	{"event_mission_stage_finish", {"liangshan", 8}, 		handle_elem,	{"Hoµn thµnh ¶i 8 L­¬ng S¬n B¹c", 15},  },
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 	handle_elem,	{"Hoµn thµnh ¶i 4 V¹n KiÕm Gia", 6},  },
	{"event_mission_stage_finish", {"dixuangong", 4}, 		handle_elem,	{"Hoµn thµnh ¶i 4 §Þa HuyÒn Cung", 6},  },
	{"event_mission_stage_finish", {"dixuangong", 7}, 		handle_elem,	{"Hoµn thµnh ¶i 7 §Þa HuyÒn Cung", 15},  },
	{"event_mission_stage_finish", {"taiyi", 3}, 			handle_elem,	{"Hoµn thµnh ¶i 3 Th¸i NhÊt Th¸p", 6},  },
	{"event_mission_stage_finish", {"taiyi", 6}, 			handle_elem,	{"Hoµn thµnh ¶i 6 Th¸i NhÊt Th¸p", 15},  },
	{"event_mission_stage_finish", {"herotaiyi", 3}, 		handle_elem,	{"Hoµn thµnh ¶i 3 Th¸i NhÊt Th¸p - Anh hïng ", 8},  },
	{"event_mission_stage_finish", {"herotaiyi", 6}, 		handle_elem,	{"Hoµn thµnh ¶i 6 Th¸i NhÊt Th¸p - Anh hïng", 20},  },
	{"event_mission_award", {"newbattle", -1, -1, 4}, 		handle_elem,	{"L·nh th­ëng chiÕn tr­êng Nh¹n M«n Quan", 10},  },
	{"event_mission_award", {"newbattle", -1, -1, 3}, 		handle_elem,	{"L·nh th­ëng chiÕn tr­êng B¶o VÖ Thµnh Tr×", 8},  },
	{"event_mission_award", {"newbattle", -1, -1, 2}, 		handle_elem,	{"L·nh th­ëng chiÕn tr­êng L­¬ng Thùc", 8} },
	{"event_mission_award", {"newbattle", -1, -1, 1}, 		handle_elem,	{"L·nh th­ëng chiÕn tr­êng Th«n Trang", 8},  },
	{"event_mission_task_award", {"pvp","yunbiao", -1}, 	handle_elem,	{"Hoµn thµnh 1 lÇn vËn tiªu", 10},  },
	{"event_mission_task_award", {"pvp","duobiao", -1}, 	handle_elem,	{"Hoµn thµnh 1 lÇn c­íp tiªu", 10},  },
	{"event_mission_task_award", {"pvp","baozang", -1}, 	handle_elem,	{"Hoµn thµnh nhiÖm vô ®µo Kho B¸u", 10},  },
	{"event_mission_task_award", {"pvp","toujingshu", -1}, 	handle_elem,	{"Hoµn thµnh nhiÖm vô trém Kinh Th­", 10},  },
	{"event_mission_task_award", {"pvp","shangjin", -1}, 	handle_elem,	{"L·nh th­ëng Th­ëng Vµng Thî S¨n", 10},  },
	{"event_ib_cost", 		{PackItemId(2,1,30692)}, 		handle_elem_ib_cost,	{"Sö dông 20 b¶o r­¬ng §¹i Héi Tû Vâ", 10, 20},  },
	{TeamEvent("event_mission_task_award"), {"pvp","killboss", -1}, 	handle_elem,	{"Tiªu diÖt BOSS thÕ giíi/thÕ lùc 3 phe", 15},  },
	{"event_mission_task_award", {"pvp","plant", -1}, 		handle_elem,	{"Hoµn thµnh 1 lÇn nhiÖm vô BÝ Qu¶", 10},  },
	{"event_mission_task_award", {"pvp","touguoshi", -1}, 	handle_elem,	{"Hoµn thµnh 1 lÇn nhiÖm vô trém qu¶", 10},  },
	{"event_mission_award", {"kfbattle",-1, -1, -1}, 		handle_elem,	{"L·nh th­ëng 1 lÇn chiÕn tr­êng liªn server", 20},  },
}
t_cfg = t_isolate_user_batch_watch_list

function on_init()
	local nMaxTaskCount = 31*getn(AC_EVENT_TASKGROUP);
	local nTaskList = getn(t_cfg);
	if nTaskList > nMaxTaskCount then 
		error(format("getn(%s) %d > %d", "t_isolate_user_batch_watch_list", nTaskList, nMaxTaskCount)) 
	end
end
function on_event_player_login(nExchangeComing)
	if ac_IsActivate() ~= 1 then --ÉÐÎ´¼¤»î»î¶¯¿¨ ËùÓÐ·¢ËÍµ½¸ÃÄ£¿éµÄevent¶¼²»ÒªÔÚÕâ¸öÍæ¼ÒÉíÉÏ´¥·¢
		isolate_disable_event_dispatch(PlayerIndex)
	end
end
function on_event_daily_clear(nCurDate, nLastDate)
	SetTask(TASK_ACTIVITY_CARD_DAY, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	SetTask(TASK_ACTIVITY_CARD_ONLINE, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	for _, v in AC_EVENT_TASKGROUP do
		SetTask(v, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	end
end

function on_add_watches()
	isolate_watch_item_talk(2, 1, 30045, "handle_on_item_talk_jndsj")--½õÄÒ´óÊÂ¼þ¶Ô»°
end
----------------------------------------------------------------------------------------------------------isolate end

AC_DAILY_AWARD = {
	--{¹±Ï×Öµ£¬¾­Ñé£¬ÒøÈ¯£¬½ð±Ò}
	{24, 5000000, 10, 21},
	{60, 12000000, 20, 33},
	{100, 20000000, 40, 45},
	{150, 30000000, 60, 56},
	{200, 40000000, 80, 68},
	{250, 50000000, 100, 79},
};

AC_MONTH_AWARD = {
	--{¹±Ï×Öµ£¬ËµÃ÷ÄÚÈÝ£¬µÀ¾ß»òº¯Êý×Ö·û´®£¬ÊýÁ¿£¬¿Õ¼ä}
	{1400, "ThiÕt tinh cÊp 4", {2, 1, 30612}, 20, 1},
	{2100, "Hu©n ch­¬ng anh hïng", {2, 1, 30499}, 100, 1},
	{2800, "Qu©n C«ng Huy Hoµng", {2, 1, 9977}, 4, 1},
	{3600, "b¸nh Ýt B¸c B¶o", {2, 1, 1125}, 20, 1},
	{4800, "Tinh Hoa UÈn Linh CÊp 6", {2, 1, 30668}, 3, 1},
	{5600, "B¶o Th¹ch cÊp 3,4,5", "ac_Gem345()", 3, 3},
};

AC_LOG = "ThÎ ho¹t ®éng";
AC_DayValueMax = 250 --Ã¿ÈÕ¹±Ï×ÖµÉÏÏÞ

--ÊÂ¼þ±ê¼Ç×é
AC_EVENT_TASKGROUP = {
	TASK_ACTIVITY_CARD_TASK1,
	TASK_ACTIVITY_CARD_TASK2,
};

function ac_GetCardSeq()
	return tonumber(date("%Y%m"));
end

function ac_IsActivate()
	if GetTask(TASK_ACTIVITY_CARD_SEQ) == ac_GetCardSeq() then
		return 1;
	end
	return 0;
end


--Ã¿ÈÕ¹±Ï×Öµ
function ac_GetDayValue()
	return gf_GetMyTaskByte(TASK_ACTIVITY_CARD_DAY, 1, 2);
end

function ac_ModifyDayValue(nValue)
	if ac_IsActivate() ~= 1 then return end;
	local nTaskValue = ac_GetDayValue();
	nValue = min((nValue or 0), AC_DayValueMax - nTaskValue);
	if nValue <= 0 then return 0; end
	gf_SetMyTaskByte(TASK_ACTIVITY_CARD_DAY, 1, 2, nTaskValue + nValue, TASK_ACCESS_CODE_ACTIVITY_CARD);
	if nValue > 0 then
		Msg2Player(format("[ThÎ ho¹t ®éng] nhËn ®­îc %d ®iÓm cèng hiÕn mçi ngµy!", nValue));
	else
		Msg2Player(format("[ThÎ ho¹t ®éng] tiªu hao %d ®iÓm cèng hiÕn mçi ngµy!", nValue));
	end
end

--¼ÇÂ¼±ÈÎä±¦ÏäÊ¹ÓÃ´ÎÊý
function ac_GetUseItemCount()
	return gf_GetTaskByte(TASK_ACTIVITY_CARD_DAY, 3);
end

function ac_AddUseItemCount(nUseCnt)
	local nNew = ac_GetUseItemCount() + nUseCnt
	gf_SetTaskByte(TASK_ACTIVITY_CARD_DAY, 3, nNew, TASK_ACCESS_CODE_ACTIVITY_CARD);
	return nNew
end

--Ã¿ÈÕÁì½±±ê¼Ç
function ac_GetDayTag()
	return gf_GetTaskByte(TASK_ACTIVITY_CARD_DAY, 4);
end

function ac_SetDayTag()
	gf_SetTaskByte(TASK_ACTIVITY_CARD_DAY, 4, 1, TASK_ACCESS_CODE_ACTIVITY_CARD);
end

function ac_GetDailyAward(nIndex)
	if nIndex <= 0 or nIndex > getn(AC_DAILY_AWARD) then
		return 0;
	end
	if ac_GetDayTag() ~= 0 then
		return 0;
	end
	if ac_GetDayValue() < AC_DAILY_AWARD[nIndex][1] then
		Talk(1,"","§iÓm cèng hiÕn mçi ngµy kh«ng ®ñ, kh«ng thÓ l·nh th­ëng!");
		return 0;
	end
	ac_SetDayTag();
	--ac_ModifyDayValue(AC_DAILY_AWARD[nIndex][1]);
	gf_ModifyExp(AC_DAILY_AWARD[nIndex][2]);
	--ModifyYinJuan(AC_DAILY_AWARD[nIndex][3], 1);
	Earn(10000*AC_DAILY_AWARD[nIndex][4]);
	return 1;
end

--Ã¿ÔÂ¹±Ï×Öµ
function ac_GetMonthValue()
	return GetTask(TASK_ACTIVITY_CARD_MONTH);
end

function ac_ModifyMonthValue(nValue)
	if ac_IsActivate() ~= 1 then return end;
	if not nValue or nValue == 0 then return end;
	local nTaskValue = ac_GetMonthValue();
	SetTask(TASK_ACTIVITY_CARD_MONTH, nTaskValue + nValue, TASK_ACCESS_CODE_ACTIVITY_CARD);
	if nValue > 0 then
		Msg2Player(format("[ThÎ ho¹t ®éng] nhËn ®­îc %d ®iÓm cèng hiÕn mçi th¸ng!", nValue));
	else
		Msg2Player(format("[ThÎ ho¹t ®éng] tiªu hao %d ®iÓm cèng hiÕn mçi th¸ng!", nValue));
	end
end

--ÔÂ¹±Ï×½±Àø
function ac_GetMonthTag(nIndex)
	return gf_GetTaskBit(TASK_ACTIVITY_CARD_AWARD, nIndex);
end

function ac_SetMonthTag(nIndex)
	gf_SetTaskBit(TASK_ACTIVITY_CARD_AWARD, nIndex, 1, TASK_ACCESS_CODE_ACTIVITY_CARD);
end

function ac_GetMonthAward(nIndex)
	if nIndex <= 0 or nIndex > 31 then return 0; end
	if ac_GetMonthTag(nIndex) ~= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(AC_MONTH_AWARD[nIndex][5], 10, " ") ~= 1 then
		return 0;
	end
	if ac_GetMonthValue() < AC_MONTH_AWARD[nIndex][1] then
		Talk(1,"","§iÓm cèng hiÕn mçi th¸ng kh«ng ®ñ, kh«ng thÓ l·nh th­ëng!");
		return 0;
	end
	ac_SetMonthTag(nIndex);
	local nType = type(AC_MONTH_AWARD[nIndex][3]);
	if nType == "table" then
		local t = AC_MONTH_AWARD[nIndex][3];
		local num = AC_MONTH_AWARD[nIndex][4];
		gf_AddItemEx2({t[1], t[2], t[3], num}, GetItemName(t[1], t[2], t[3]), 
			AC_LOG, AC_LOG, 0, 1);
	elseif nType == "string" then
		for i = 1, AC_MONTH_AWARD[nIndex][4] do
			dostring(AC_MONTH_AWARD[nIndex][3]);
		end
	else
		error("type mismatch");
	end
	return 1;
end

--¼¤»î»î¶¯¿¨
function ac_ActivateCard()
	if GetLevel() < 80 and gf_GetPlayerRebornCount() <= 0 then
		Talk(1,"",format("§¼ng cÊp nh©n vËt kh«ng ®ñ cÊp %d, kh«ng thÓ kÝch ho¹t %s", 80, "ThÎ ho¹t ®éng"));
		return 0;
	end
	if ac_IsActivate() ~= 0 then
		Talk(1,"","B¹n ®· kÝch ho¹t thÎ ho¹t ®éng råi!");
		return 0;
	end
	if GetItemCount(2, 1, 30903) < 1 then
		Talk(1,"",format("Trong tói hµnh trang kh«ng cã bÊt kú thÎ ho¹t ®éng nµo! H·y ®i <color=gold>%s<color> mua.", "Th­¬ng Thµnh"));
		return 0;
	end
	if DelItem(2, 1, 30903, 1) ~= 1 then
		return 0;
	end
	SetTask(TASK_ACTIVITY_CARD_SEQ, ac_GetCardSeq(), TASK_ACCESS_CODE_ACTIVITY_CARD);
	SetTask(TASK_ACTIVITY_CARD_MONTH, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	SetTask(TASK_ACTIVITY_CARD_AWARD, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	isolate_enable_event_dispatch(PlayerIndex) --É¾³ý¸ÃÍæ¼ÒËùÓÐµÄeventÅÉ·¢ºÚÃûµ¥
	Talk(1,"","B¹n ®· kÝch ho¹t thµnh c«ng thÎ ho¹t ®éng!");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function ac_GetEventTag(nType)
	local nIndex = ceil(nType / 31);
	local nBit = mod(nType, 31);
	if nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP) then 
		error("nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP)"); 
	end
	return gf_GetTaskBit(AC_EVENT_TASKGROUP[nIndex], nBit);
end

function ac_SetEventTag(nType)
	local nIndex = ceil(nType / 31);
	local nBit = mod(nType, 31);
	if nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP) then 
		error("nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP)"); 
	end
	return gf_SetTaskBit(AC_EVENT_TASKGROUP[nIndex], nBit, 1, TASK_ACCESS_CODE_ACTIVITY_CARD);
end

function ac_MainDialog(nIndex)
	local msg = format("<color=gold>%s<color>:", AC_LOG);
	local tSay = {};
	if ac_IsActivate() ~= 1 then
		msg = msg.."ThÎ ho¹t ®éng th¸ng nµy vÉn ch­a kÝch ho¹t!"
		tinsert(tSay, "\n kÝch ho¹t thÎ ho¹t ®éng/ac_ActivateCard");
	else
		local nYear = tonumber(date("%Y"));
		local nMonth = tonumber(date("%m"));
		local nDay = tonumber(date("%d"));
		local tMonth = {31,28,31,30,31,30,31,31,30,31,30,31}		
		if mod(nYear, 400) == 0 or (mod(nYear, 4) == 0 and mod(nYear, 100) ~= 0) then
			tMonth[2] = 29;
		end
		msg = msg..format("ThÎ ho¹t ®éng ®· kÝch ho¹t, thêi gian cã hiÖu lùc cßn l¹i <color=green>%d<color> ngµy", tMonth[nMonth] - nDay + 1);
		tinsert(tSay,	"Xem nhiÖm vô hµng ngµy/ac_DailyTaskList");
		tinsert(tSay,	"PhÇn th­ëng ®iÓm cèng hiÕn ngµy/ac_DailyAward");
		tinsert(tSay,	"PhÇn th­ëng ®iÓm cèng hiÕn th¸ng/ac_MonthAward");
		tinsert(tSay,	"TiÖm Ng©n PhiÕu/ac_IBShop");
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(msg, getn(tSay), tSay);
end

function ac_DailyTaskList()
	local tSay = {};
	tSay.msg = format("<color=gold>%s<color>:", AC_LOG);
	tSay.msg = tSay.msg..format("%s nhËn ®­îc ®iÓm cèng hiÕn th«ng qua tham gia c¸c ho¹t ®éng, cèng hiÕn ngµy mçi ngµy nhËn ®­îc nhiÒu nhÊt %d ®iÓm, ®iÓm cèng hiÕn th¸ng kh«ng tèi ®a.", 
		gf_GetPlayerSexName(), AC_DayValueMax)
	tSay.sel = {};
	local szResult = {"Ch­a hoµn thµnh", "§· hoµn thµnh"};
	for i = 1, getn(AC_TASK_LIST) do
		tinsert(tSay.sel, {
			format("%s (%d ®iÓm cèng hiÕn) (%s)", AC_TASK_LIST[i][1], AC_TASK_LIST[i][2], szResult[ac_GetEventTag(i) + 1]),
			 "ac_DailyTaskList"});
	end
	tinsert(tSay.sel, {"\n Ph¶n håi", "ac_MainDialog"});
	tinsert(tSay.sel, {"Ra khái", "nothing"});
	temp_Talk(tSay);
end

function ac_DailyAward()
	local tSay = {};
	tSay.msg = format("<color=gold>%s<color>:", AC_LOG)
	tSay.msg = tSay.msg..format("§iÓm cèng hiÕn ngµy hiÖn t¹i lµ <color=green>%d<color>, %s muèn l·nh nhËn phÇn th­ëng g×.", ac_GetDayValue(), gf_GetPlayerSexName());
	if ac_GetDayTag() ~= 0 then
		tSay.msg = tSay.msg.."<color=red> H«m nay ®· l·nh nhËn phÇn th­ëng, mçi ngµy chØ l·nh 1 lÇn.<color>";
	end
	tSay.sel = {};
	for i = 1, getn(AC_DAILY_AWARD) do
		tinsert(tSay.sel, {
			format("%dEXP, %d ®iÓm phiÕu b¹c, %d vµng#%d ®iÓm cèng hiÕn#", 
				AC_DAILY_AWARD[i][2], AC_DAILY_AWARD[i][3], AC_DAILY_AWARD[i][4], AC_DAILY_AWARD[i][1]),
			 format("#ac_GetDailyAward(%d)", i)});
	end
	tinsert(tSay.sel, {"\n Ph¶n håi", "ac_MainDialog"});
	tinsert(tSay.sel, {"Ra khái", "nothing"});
	temp_Talk(tSay);
end

function ac_MonthAward()
	local tSay = {};
	tSay.msg = format("<color=gold>%s<color>:", AC_LOG)
	tSay.msg = tSay.msg..format("§iÓm cèng hiÕn th¸ng hiÖn t¹i lµ <color=green>%d<color>, %s muèn l·nh nhËn phÇn th­ëng g×", ac_GetMonthValue(), gf_GetPlayerSexName());
	tSay.sel = {};
	local szResult = {"Ch­a l·nh nhËn", "§· l·nh nhËn"};
	for i = 1, getn(AC_MONTH_AWARD) do
		tinsert(tSay.sel, {
			format("%s*%d (%d ®iÓm cèng hiÕn)#%s#", 
				AC_MONTH_AWARD[i][2], AC_MONTH_AWARD[i][4], AC_MONTH_AWARD[i][1], szResult[ac_GetMonthTag(i) + 1]),
			 format("#ac_GetMonthAward(%d)", i)});
	end
	tinsert(tSay.sel, {"\n Ph¶n håi", "ac_MainDialog"});
	tinsert(tSay.sel, {"Ra khái", "nothing"});
	temp_Talk(tSay);
end

function ac_IBShop()
	SendScript2VM("\\script\\equip_shop\\equip_shop_head.lua", "show_equip_shop(3033)");
end

function ac_Gem345()
	local tGem345 = {
		{1,15, "HuyÕtTrÝchTh¹ch Lv3", {2,22,103,1},nil,nil,nil,nil},
		{1,15, "NguyÖtB¹chTh¹ch Lv3", {2,22,203,1},nil,nil,nil,nil},
		{1,15, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303,1},nil,nil,nil,nil},
		{1,15, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403,1},nil,nil,nil,nil},
		{1,9, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,1},nil,nil,nil,nil},
		{1,9, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,1},nil,nil,nil,nil},
		{1,9, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,1},nil,nil,nil,nil},
		{1,9, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,1},nil,nil,nil,nil},
		{1,1, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
		{1,1, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
		{1,1, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
		{1,1, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(tGem345, 100, 1, AC_LOG, AC_LOG);
end