Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua");
Import("\\script\\lib\\val2str.lua")

thisFile = "\\script\\missions\\yp\\pop_ex.lua";

POPID_TXBJ = 3;
POPID_LSM = 4;
POPID_JBZ = 5;

POP_TASK_FLAG = 3412; --ÈÎÎñÍê³É±ê¼Ç

tPopDailyTask = {
	[1] = {{"§o¹t vÒ tiªu kú bÞ mÊt", 358, 1}, {"B¸o b×nh an", 359, 2}, {"Thiªn Hµnh Tiªu Côc-Uy tÝn", 360, 3},},
	[2] = {{"Tiªu diÖt tËn gèc (H­ng Kh¸nh)", 362, 4}, {"Tiªu diÖt tËn gèc (Quúnh KÕt)", 363, 5}, {"Tiªu diÖt tËn gèc (Thiªn Long Tù)", 364, 6},},
	[3] = {{"Mçi ngµy mét ®ãa hoa", 366, 7}, {"Thøc ¨n cña Tr­ TiÓu B¹ch", 367, 8}, {"D¹ yÕn phong phó", 368, 9},},	
}

tPopWeeklyTask = {
	[1] = {{"Thiªn Hµnh Tiªu Côc-§óng hÑn", 361, {10, 13}},},
	[2] = {{"Thiªn lý truy hung", 365, {14, 17}},},
	[3] = {{"C«ng tö næi giËn", 369, {18, 21}},},	
}

function Init()
	--Talk
	AddMisEvent("event_talk_npc", "Thiªn Kh¶i-Tiªu §Çu", 6300, thisFile, "pop_npc_talk1", "Danh väng Thiªn Hµnh Tiªu Côc");
	AddMisEvent("event_talk_npc", "§¹p v©n-Lôc PhiÕn M«n", 6300, thisFile, "pop_npc_talk2", "Danh väng Lôc PhiÕn M«n");
	AddMisEvent("event_talk_npc", "L©m Gia Thµnh-ng­êi giµu", 6300, thisFile, "pop_npc_talk3", "Danh väng Tô B¶o Trai");
	--Clean
	AddMisEvent("event_daily_clean", "Xö lý h»ng ngµy", 0, thisFile, "pop_daily_clean");
	AddMisEvent("event_weekly_clean", "Xö lý h»ng tuÇn", 0, thisFile, "pop_weekly_clean");
	--Task
	AddMisEvent("event_talk_npc", "Hµng xãm Hµn TrÝ Nh­îng",  200, thisFile, "_task_npctalk", "Ta ®Õn lÊy D©y BÇu");
	AddMisEvent("event_talk_npc", "§¹i ChÝ C­êng", 100, thisFile, "_task_npctalk", "Ta ®Õn lÊy Qu¶ V¶i");
	AddMisEvent("event_talk_npc", "Chu UÊt Ly", 300, thisFile, "_task_npctalk", "Ta ®Õn lÊy ThÞt L¹p");
	AddMisEvent("event_talk_npc", "§ång M· Qu¸n", 6400, thisFile, "_task_package", "Hé tèng gãi hµng");
	AddMisEvent("event_talk_npc", "Qu¸ch TÜnh An", 6400, thisFile, "_task_package", "Hé tèng gãi hµng");
	AddMisEvent("event_talk_npc", "Viªn Th«ng §¹i S­", 6400, thisFile, "_task_package", "Hé tèng gãi hµng");
	AddMisEvent("event_talk_npc", "Tiªu Thiªn Hùu", 600, thisFile, "_task_package1", "Hé tèng gãi hµng");
	AddMisEvent("event_talk_npc", "Tiªu s­", 200, thisFile, "_task_talk2bs", "Th«ng b¸o t×nh h×nh tiªu côc");
	--UseItem
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31052), 0, thisFile, "pop_use_item", "LÖnh Kú Tiªu Côc");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31053), 0, thisFile, "pop_use_item", "LÖnh Bµi Lôc PhiÕn M«n");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31054), 0, thisFile, "pop_use_item", "TÝn VËt Tô B¶o Trai");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31055), 0, thisFile, "pop_use_item", "§én KiÕm Tiªu S­");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31056), 0, thisFile, "pop_use_item", "MËt Th­ Lôc PhiÕn M«n");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31057), 0, thisFile, "pop_use_item", "Hµng hãa bÞ mÊt");
end

function pop_npc_talk1(nNpcIndex)
	pop_npc_talk(nNpcIndex, 1);
end

function pop_npc_talk2(nNpcIndex)
	pop_npc_talk(nNpcIndex, 2);
end

function pop_npc_talk3(nNpcIndex)
	pop_npc_talk(nNpcIndex, 3);
end

function pop_npc_talk(nNpcIndex, nIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local nPop = nIndex + 2;
	local tInfo = {
		"G¸nh NhËt NguyÖt, ®eo Tinh ThÇn, t«i  vËn tiªu kh«ng co n¬i  kh«ng thÓ vËn ®Õn.",
		"YÕu quyÕt tu luyÖn khinh c«ng chØ cã ch¨m chØ,kh«ng ngõng cè g¾ng sÏ cã thu ho¹ch.",
		"Quan quan c­ c©u, t¹i h¹ chi ch©u; YÕu ®iÒu thôc n÷, qu©n tö hiªu cÇu .",
	}
	local tIndex2Pop = {"Danh väng Thiªn Hµnh Tiªu Côc", "Danh väng Lôc PhiÕn M«n", "Danh väng Tô B¶o Trai"};
	local tIndex2ShopID = {3074, 3075, 3076};
	local nPopValue = GetPop(nPop);
	if nPopValue < 0 then
		Talk(1,"","H·y hoµn thµnh nhiÖm vô h­íng dÉn danh väng tr­íc råi quay l¹i!");
		return 0;
	end
	local tLevelName = {
		[0] = "S¬ xuÊt mao l­",
		[1] = "Béc lé tµi n¨ng",
		[2] = "Danh tiÕng th­íc khëi",
		[3] = "C«ng danh lín lao",
		[4] = "Cùu phô thÞnh danh",
		[5] = "V¹n ng­êi ng­ìng mé",
	}
	local szMsg = format("(HiÖn t¹i %s lµ <color=green>%s<color> cÊp)", tIndex2Pop[nIndex], tLevelName[GetPopLevel(nPop)]);
	local tSay = {
		format("%s giíi thiÖu/#pop_info_msg(%d, %d)", tIndex2Pop[nIndex], nNpcIndex, nIndex),
		format("NhiÖm vô h»ng ngµy/#pop_daily_task(%d)", nPop),
		format("NhiÖm vô tuÇn hoµn h»ng tuÇn/#pop_weekly_task(%d)", nPop),
		format("Cöa Hµng %s/#show_equip_shop(%d)", tIndex2Pop[nIndex], tIndex2ShopID[nIndex]),
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(format("<color=gold>%s<color>:%s%s", szNpcName, tInfo[nIndex], szMsg), getn(tSay), tSay);
end

function pop_info_msg(nNpcIndex, nIndex)
	local tMsg = {
		"Mét trong nh÷ng tiªu côc lín nhÊt trung nguyªn, khÈu hiÖu uy tÝn thiªn h¹, hµng ®Õn ®óng ngµy, gÇn ®©y ph¸i tæng tiªu ®Çu Thiªn Khëi ®Õn ThÊt L¹c Nhai x©y dùng ph©n côc, ®Ó më réng ph¹m vi kinh doanh.",
		"Bé kho¸i cña quan phñ trung nguyªn lËp thµnh mét tæ chøc, bÒ ngoµi mang träng tr¸ch trõ gian diÖt ¸c, nh­ng thùc tÕ lµ lµm c«ng viÖc th¸m thÝnh t×nh h×nh ®Þch, gi¸m s¸t quan l¹i.",
		"GÇn ®©y míi xuÊt hiÖn tæ chøc, t­¬ng truyÒn lµ do th­¬ng héi ë kh¾p n¬i tËp hîp thµnh, nh­ng kh«ng râ ng­êi l·nh ®¹o lµ ai.",
	}
	Say(format("<color=gold>%s<color>:%s", GetNpcName(nNpcIndex), tMsg[nIndex]), 0);
end

function pop_get_state(nTaskID, nBit)
	if type(nBit) == "number" then
		local nValue = gf_GetTaskBit(POP_TASK_FLAG, nBit);
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
	else 
		local nValue = gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]);
		local szRet = format("(%d/%d)", min(nValue, 10), 10);
		if nValue < 10 then
			if tGtTask:check_cur_task(nTaskID) ~= 1 then
				return szRet.."(§­îc nhËn)";
			else
				if DirectIsTaskFinish(nTaskID) ~= 1 then
					return szRet.."(ch­a hoµn thµnh)";
				else
					return szRet.."(§­îc giao)";
				end
			end
		else
			if tGtTask:check_cur_task(nTaskID) == 1 then
				DirectDeleteTask(nTaskID);
			end
			return szRet.."(TuÇn sau quay l¹i)";
		end
	end
end

function pop_task_talk(nType, tTaskGroup)
	local tTask = tTaskGroup[nType-2];
	local tSay = {};	
	for i = 1, getn(tTask) do
		tinsert(tSay, format("%s%s/#pop_task_talk_do(%d, %s)", 
			tTask[i][1], pop_get_state(tTask[i][2], tTask[i][3]), tTask[i][2], Val2Str(tTask[i][3])));
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	local tInfo = {
		"G¸nh NhËt NguyÖt, ®eo Tinh ThÇn, t«i  vËn tiªu kh«ng co n¬i  kh«ng thÓ vËn ®Õn.",
		"YÕu quyÕt tu luyÖn khinh c«ng chØ cã ch¨m chØ,kh«ng ngõng cè g¾ng sÏ cã thu ho¹ch.",
		"Quan quan c­ c©u, t¹i h¹ chi ch©u; YÕu ®iÒu thôc n÷, qu©n tö hiªu cÇu .",
	}
	Say(format("<color=gold>%s<color>:%s", GetNpcName(GetTargetNpc()), tInfo[nType-2]), getn(tSay), tSay);	
end

function pop_task_talk_do(nTaskID, nBit)
	local nType = type(nBit);
	if nType == "number" then
		if gf_GetTaskBit(POP_TASK_FLAG, nBit) ~= 0 then
			Talk(1,"","§· hoµn thµnh nhiÖm vô nµy! Ngµy mai h·y quay l¹i");
			return 0;
		end
	else
		if gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]) >= 10 then
			Talk(1,"","§· hoµn thµnh nhiÖm vô nµy! TuÇn sau h·y quay l¹i");
			return 0;
		end
	end
	if tGtTask:check_cur_task(nTaskID) == 1 then
		if DirectIsTaskFinish(nTaskID) ~= 1 then
			Talk(1,"","VÉn ch­a hoµn thµnh nhiÖm vô!");
			return 0;
		end
		if DirectFinishGTask(nTaskID, 2) ==  1 then
			if nType == "number" then
				gf_SetTaskBit(POP_TASK_FLAG, nBit, 1);
			else
				gf_SetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2], gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]) + 1)
			end
			if nTaskID == 359 then SetTask(3413, 0) end
			if nTaskID == 360 then for i = 3414, 3416 do SetTask(i, 0) end end
			if nTaskID == 361 then SetTask(3417, 0) end
			SetCurrentNpcSFX(GetTargetNpc(), 907, 2, 0, 18*5);
			Msg2Player("NhiÖm vô hoµn thµnh!");
			local tTaskID2Static = {
				[358] = 1, [359] = 1, [360] = 1, [361] = 4,
				[362] = 2, [363] = 2, [364] = 2, [365] = 5,
				[366] = 3, [367] = 3, [368] = 3, [369] = 6,
			}
			AddRuntimeStat(42, tTaskID2Static[nTaskID], 0, 1);
		else
			DirectDeleteTask(nTaskID);
		end
	else
		DirectGetGTask(nTaskID, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 906, 2, 0, 18*5);
	end
end

function pop_daily_task(nType)
	pop_task_talk(nType, tPopDailyTask);
end
	
function pop_weekly_task(nType)
	pop_task_talk(nType, tPopWeeklyTask);
end

function pop_task_clean(t)
	for _, v in t do
		for _, m in v do
			if tGtTask:check_cur_task(m[2]) ~= 1 then
				if type(m[3]) == "table" then
					gf_SetMyTaskBit(POP_TASK_FLAG, m[3][1], m[3][2], 0);
				else
					gf_SetTaskBit(POP_TASK_FLAG, m[3], 0);
				end
			end
		end
	end
end

function pop_daily_clean()
	local t = {[3] = 348, [4] = 352, [5] = 357,}
	for k, v in t do		
		if IsUsePop(k) == 0 and tGtTask:check_task_isfinish(v) == 1 then
			OpenPop(k);
			AddPop(k, 2000);
		end
	end
	pop_task_clean(tPopDailyTask);
end

function pop_weekly_clean()
	pop_task_clean(tPopWeeklyTask);
end

function _gtask_award(nPopID)
	OpenPop(nPopID);
	AddPop(nPopID, 2000);
	local tName = {"Danh väng Thiªn Hµnh Tiªu Côc", "Danh väng Lôc PhiÕn M«n", "Danh väng Tô B¶o Trai"};
	Msg2Player(format("B¹n nhËn ®­îc %d%s", 2000, tName[nPopID-2]));
end

function _gtask_award1(nPopID)
	AddPop(nPopID, 100);
	local tName = {"Danh väng Thiªn Hµnh Tiªu Côc", "Danh väng Lôc PhiÕn M«n", "Danh väng Tô B¶o Trai"};
	Msg2Player(format("B¹n nhËn ®­îc %d%s", 100, tName[nPopID-2]));
end

function _task_npctalk(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local tP = {
		["Hµng xãm Hµn TrÝ Nh­îng"] = 31049,
		["§¹i ChÝ C­êng"] = 31050,
		["Chu UÊt Ly"] = 31051,
	}
	if tGtTask:check_cur_task(356) ~= 1 and tGtTask:check_cur_task(368) ~= 1 then
		return 0;
	end
	if BigGetItemCount(2, 1, tP[szNpcName]) > 0 then
		return 0;
	end
	AddItem(2, 1, tP[szNpcName], 1);
end

function _task_package(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local tTask = {
		["§ång M· Qu¸n"] = 3414,
		["Qu¸ch TÜnh An"] = 3415,
		["Viªn Th«ng §¹i S­"] = 3416,
	}
	if tGtTask:check_cur_task(360) ~= 1 then
		return 0;
	end
	if GetTask(tTask[szNpcName]) == 1 then
		Talk(1,"",format("%s tói ®· ¸p gi¶i hoµn thµnh", szNpcName));
		return 0;
	end
	if DelItem(2, 1, 31043, 1) ~= 1 then
		return 0;
	end
	SetTask(tTask[szNpcName], 1);
end

function _task_package1(nNpcIndex)
	if tGtTask:check_cur_task(361) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 31044, 1) ~= 1 then
		return 0;
	end
	SetTask(3417, 1);
end

function _task_talk2bs(nNpcIndex)
	if tGtTask:check_cur_task(359) ~= 1 then
		return 0;
	end	
	NpcChat(PIdx2NpcIdx(), "GÇn ®©y t×nh h×nh kinh doanh cña tiªu côc ThÊt L¹c Nhai rÊt tèt, tæng tiªu ®Çu nhê ta chuyÓn lêi cho ng­¬i");
	NpcChat(nNpcIndex, "Tèt, vÊt v¶ råi!");
	SetTask(3413, 1);
end

function pop_use_item(nItemIndex)
	Say(format("QuyÕt ®Þnh dïng <color=gold>%s<color> kh«ng?", GetItemName(nItemIndex)), 
		2, format("\nX¸c nhËn/#pop_use_item_do(%d)", nItemIndex), "\nT«i chØ xem xem th«i/nothing");
end

function pop_use_item_do(nItemIndex)
	local t = {
		[31052] = {POPID_TXBJ, 100, "Danh väng Thiªn Hµnh Tiªu Côc"},
		[31053] = {POPID_LSM, 100, "Danh väng Lôc PhiÕn M«n"},
		[31054] = {POPID_JBZ, 100, "Danh väng Tô B¶o Trai"},
		[31055] = {POPID_TXBJ, 10, "Danh väng Thiªn Hµnh Tiªu Côc"},
		[31056] = {POPID_LSM, 10, "Danh väng Lôc PhiÕn M«n"},   
		[31057] = {POPID_JBZ, 10, "Danh väng Tô B¶o Trai"},   
	}
	local nP = GetItemParticular(nItemIndex);
	local tAward = t[nP];
	if IsUsePop(tAward[1]) ~=1 then
		Talk(1,"",format("H·y më %s råi dïng vËt phÈm nµy", tAward[3]));
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	AddPop(tAward[1], tAward[2]);
	Msg2Player(format("NhËn ®­îc %d ®iÓm %s", tAward[2], tAward[3]));
end