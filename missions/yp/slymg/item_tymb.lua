Include("\\script\\missions\\yp\\slymg\\head.lua")

DAILY_IB_MAX = 100;
DAILY_FREE_MAX = 6;
TYMB_AWARD_IB = "Bht_Charge";
TYMB_AWARD_FREE = "Bht_Free";
--TYMB_AWARD_FREE1 = "Bht_Free_a";

function OnUse(nItem)
	local tSay = {
		format("sö dông %d thiªn kiªu lÖnh ®Ó më/#OpenTymbIB(%d, %d)", 1, nItem, 1),
		format("sö dông %d ®iÓm tÝch lòy Long Hæ §­êng ®Ó më/#OpenTymbFree(%d, %d)", 40, nItem, 40),
		"\nT«i chØ xem xem th«i/nothing",
	}
	local msg = "B¹n muèn sö dông c¸ch nµo ®Ó më MËt B¶o?"	
	msg = msg..format("<color=green>B¹n hiÖn t¹i cã %d ®iÓm tÝch lòy Long Hæ §­êng<color>", GetTask(TASK_MISSION_BAIHUTANG_SCORE));
	Say(msg, getn(tSay), tSay)
end

function OpenTymbIB(nItem, nNum)
	local nCount = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 1);
	if nCount >= DAILY_IB_MAX then
		Talk(1,"",format("%s gíi h¹n më mçi ngµy ®· ®¹t %d", "Thiªn Kiªu LÖnh", DAILY_IB_MAX));
		return 0;
	end
	if GetItemCount(2, 97, 236) < nNum then
		Talk(1,"",format("trong hµnh trang, sè l­îng cña %s kh«ng ®ñ %d", "Thiªn Kiªu LÖnh", nNum));
		return 0;
	end
	if CustomAwardCheckCondition(TYMB_AWARD_IB) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 or DelItem(2, 97, 236, nNum) ~= 1 then
		return 0;
	end
	FireEvent("event_ib_cost", 2, 97, 236, nNum);
	gf_SetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 1, nCount + 1);
	CustomAwardGiveGroup(TYMB_AWARD_IB, 0);
	AddRuntimeStat(32, 5, 1, 1)
end

function OpenTymbFree(nItem, nNum)
	local nCount = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 2);
	if nCount >= DAILY_FREE_MAX then
		Talk(1,"",format("%s gíi h¹n më mçi ngµy ®· ®¹t %d", "®iÓm tÝch lòy Long Hæ §­êng", DAILY_FREE_MAX));
		return 0;
	end
	local nScore = GetTask(TASK_MISSION_BAIHUTANG_SCORE);
	if nScore < nNum then
		Talk(1,"", format("®iÓm tÝch lòy Long Hæ §­êng kh«ng ®ñ %d kh«ng thÓ më", nNum));
		return 0;
	end
	if CustomAwardCheckCondition(TYMB_AWARD_FREE) ~= 1 then
		return 0;
	end
	--if CustomAwardCheckCondition(TYMB_AWARD_FREE1) ~= 1 then
	--	return 0;
	--end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	mg_ModifyScore(-nNum);
	gf_SetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 2, nCount + 1);
	CustomAwardGiveGroup(TYMB_AWARD_FREE, 1);
	--CustomAwardGiveGroup(TYMB_AWARD_FREE1, 0);
	AddRuntimeStat(32, 5, 0, 1)
end