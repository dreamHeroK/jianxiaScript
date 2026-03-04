Import("\\script\\task\\global_task\\gtask_data.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\faction\\faction_head.lua")


NFT_NEED_REBORN 						= 8		--×ªÉúµÈ¼¶ÒªÇó
NFT_DAILY_LIMIT_FINISH_COUNT 			= 40	--Ã¿ÈÕ×î´óÍê³É´ÎÊý
NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT 	= 20	--Ã¿ÈÕÃâ·Ñ¶à±¶½±Àø´ÎÊý
NFT_FINISH_AWARD_FREE_MULTI 			= 2 	--Ãâ·Ñ¶à±¶½±Àø±¶ÂÊ
NFT_FINISH_AWARD_PAY_MULTI 				= 2 	--¸¶·Ñ¶à±¶½±Àø±¶ÂÊ ±¶ÂÊ¼ä³ËËã


TASKID_NFT_CUR_TASK 					= 3600	--¼ÇÂ¼µ±Ç°½ÓÈ¡µÄÊ¦ÃÅÈÎÎñID
TASKID_NFT_TOTAL_FINISH_COUNT 			= 3604  --¼ÇÂ¼ÀÛ¼ÆÍê³É´ÎÊý£¬´¥·¢ÀÛ¼Æ´ÎÊý½±ÀøºóÇå0

TASKID_NFT_DAILY_FINISH_COUNT 			= 3601	--ÈÕÇå£º¼ÇÂ¼Ã¿ÈÕÍê³É´ÎÊý
TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT = 3602	--ÈÕÇå£º¼ÇÂ¼Ã¿ÈÕÃâ·ÑË«±¶Íê³É´ÎÊý
TASKID_DC_NFT_PAY_FINISH_COUNT 			= 3638	--ÈÕÇå£º¼ÇÂ¼Ã¿ÈÕ¸¶·ÑË«±¶Íê³É´ÎÊý

G_T_NFT_TASK_INFO = {
	[1] = { --Ñ°Îï
		[1] = 800, --¸ÅÂÊ
		[2] = {692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709},		
	},
	[2] = { --É±¹Ö
		[1] = 200,
		[2] = {679,680,681,682,683,684,685,686,687,688,689,690,691},
	},
}

NFT_N_FINISH_PAY_EXTRA_AWARD_PRESTIGE 	= 1700 	--Ë«±¶Íê³É ±Ø¸øµÄÊ¦ÃÅÍþÍû
NFT_T_FINISH_PAY_EXTRA_AWARD_RAND 		= {		--Ë«±¶Íê³É Ëæ»ú½±Àø
	--[i] = {{g,d,p,n,nBind}, ¸ÅÂÊÒò×Óy(×î´ó10000)},
		[1] = {{2, 1, 31499, 4}, 100},
}

NFT_N_EXTRA_AWAD_NEED_DAILY_FINISH_COUNT = 10 	--Ã¿ÈÕ½øÐÐn´Î´¥·¢¶îÍâ½±Àø
NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT = 100 	--ÀÛ¼ÆÍê³Én´Î´¥·¢¶îÍâ½±Àø

NFT_T_FINISH_PAY_ITEM_COST 				= {2, 1, 31500, 1} 		--Ë«±¶Íê³ÉÏûºÄµÀ¾ß
NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD 	= {2, 1, 31499, 1, 4}	--Ã¿ÈÕÃ¿10¸öÈÎÎñÔÚÍê³ÉÊ±µÄ¶îÍâ½±Àø
NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD 	= {2, 1, 31499, 1, 4}	--ÀÛ¼ÆÃ¿Íê³É100¸öÈÎÎñÊ±µÄ¶îÍâ½±Àø
NFT_N_REFRESH_TASK_MONEY_COST 			= 100					--Ë¢ÐÂÈÎÎñÓÎÏ·±ÒÏûºÄ µ¥Î»:½ð

T_NFT_RUNTIME = {
	["finish_free"] = {105,1},
	["finish_pay"] 	= {105,2},
	["dailyfinish_all"] = {
		[10] = {105,3},
		[20] = {105,4},
		[30] = {105,5},
		[40] = {105,6},
	},
	["dailyfinish_pay"] = {
		[ 1] = {105,7},
		[10] = {105,8},
		[20] = {105,9},
	},
}
	
function nft_talk(nFaction)
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>ChuyÓn sinh %d cÊp %d<color> trë lªn míi ®­îc tham dù", NFT_NEED_REBORN, 1))
		return
	end
	
	if nFaction and nFaction ~= GetPlayerFaction() then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Kh«ng cïng s­ m«n, kh«ng thÓ nhËn nhiÖm vô tõ chç ta.")
		return
	end
	local selTab = {
				"NhËn nhiÖm vô/nft_get_task",
				"Hoµn thµnh nhiÖm vô/nft_finish_task",
				"Bá qua nhiÖm vô/nft_close_task",
				" trë l¹i/main_new",
				"KÕt thóc ®èi tho¹i/nothing",
			}
	Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("TiÕn ®é NhiÖm Vô S­ M«n Míi: <color=yellow>%d/%d<color>. Sè lÇn nhËn th­ëng x%d: <color=yellow>%d/%d<color>. Th­ëng tiÕn ®é: <color=yellow>%d/%d<color>",
			GetTask(TASKID_NFT_DAILY_FINISH_COUNT),
			NFT_DAILY_LIMIT_FINISH_COUNT,
			NFT_FINISH_AWARD_FREE_MULTI,
			GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT),
			NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT,
			GetTask(TASKID_NFT_TOTAL_FINISH_COUNT),
			NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT
			),
		getn(selTab),
		selTab);
end

function nft_get_task()
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>ChuyÓn sinh %d cÊp %d<color> trë lªn míi ®­îc tham dù", NFT_NEED_REBORN, 1))
		return
	end
	if GetTask(TASKID_NFT_DAILY_FINISH_COUNT) >= NFT_DAILY_LIMIT_FINISH_COUNT then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."H«m nay ®· hoµn thµnh sè lÇn tèi ®a, ngµy mai h·y quay l¹i!")
		return
	end
	if GetTask(TASKID_NFT_CUR_TASK) > 0 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."§· nhËn nhiÖm vô, h·y hoµn thµnh hoÆc tõ bá tr­íc.")
		return
	end

	local nTaskID = nft_get_random_task()
	print("nft_get_random_task nTaskID = "..nTaskID)
	local nRet =  OpenGTask(nTaskID)
	if nRet == 3 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."NhiÖm vô ®· nhËn ®¹t tèi ®a, h·y s¾p xÕp l¹i tr­íc.")
		return
	elseif nRet ~= 1 then
		return
	end

	Talk(1,"",format("§· nhËn nhiÖm vô <color=yellow>%s<color>", gt_GetTaskName(nTaskID)))
	SetTask(TASKID_NFT_CUR_TASK, nTaskID)
end

function nft_get_random_task()
	local tTemp, nIdx = gf_RandRate(G_T_NFT_TASK_INFO)
	return tTemp[2][random(1, getn(tTemp[2]))]
end

function nft_finish_task()
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>ChuyÓn sinh %d cÊp %d<color> trë lªn míi ®­îc tham dù", NFT_NEED_REBORN, 1))
		return
	end
	if GetTask(TASKID_NFT_DAILY_FINISH_COUNT) >= NFT_DAILY_LIMIT_FINISH_COUNT then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."H«m nay ®· hoµn thµnh sè lÇn tèi ®a, ngµy mai h·y quay l¹i!")
		return
	end

	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	if nTaskID <= 0 then
		Talk(1,"nft_talk",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch­a nhËn nhiÖm vô.")
		return
	end

	if gt_IsTaskCanFinish(nTaskID) ~= 1 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch­a ®¹t ®iÒu kiÖn hoµn thµnh.")
		return
	end

	local selTab = {
			"Hoµn Thµnh Th­êng/#nft_finish_task_by_type(1,1)",
			"Hoµn Thµnh x2/#nft_finish_task_by_type(2)",
			" trë l¹i/nft_talk",
			"KÕt thóc ®èi tho¹i/nothing",
		}
	Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("\nHoµn Thµnh Th­êng ®­îc nhËn tÊt c¶ phÇn th­ëng nhiÖm vô\n<color=yellow>Hoµn Thµnh x2<color> cã thÓ dïng ®¹o cô nhËn th­ëng <color=yellow>x%d<color>, cã c¬ héi nhËn <color=yellow>th­ëng thªm<color>.\nH·y chän c¸ch hoµn thµnh:",NFT_FINISH_AWARD_PAY_MULTI),getn(selTab),selTab);
end

function nft_finish_task_by_type(nType, bConfirm)
	--nType : 1ÆÕÍ¨, 2¸¶·Ñ
	if not nType then
		return
	end

	if bConfirm ~= 1 and nType == 2 then
		local selTab = {
			"§ång ý/#nft_finish_task_by_type(2,1)",
			" trë l¹i/nft_finish_task",
			"KÕt thóc ®èi tho¹i/nothing",
		}
		Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("Hoµn Thµnh x2 cÇn tèn: <color=red>%s x%d<color>", 
				GetItemName(NFT_T_FINISH_PAY_ITEM_COST[1], NFT_T_FINISH_PAY_ITEM_COST[2], NFT_T_FINISH_PAY_ITEM_COST[3]),
				NFT_T_FINISH_PAY_ITEM_COST[4]),
			getn(selTab),
			selTab);
		return
	end

	local nExtraAwardCount = 1
	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	local bFreeMulti = 0

	if GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT) < NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT then
		nExtraAwardCount = nExtraAwardCount * NFT_FINISH_AWARD_FREE_MULTI
		bFreeMulti = 1
		--gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	end

	if nType == 2 then
		nExtraAwardCount = nExtraAwardCount * NFT_FINISH_AWARD_PAY_MULTI
	end

	if nft_chk_multi_room_weight(nTaskID, nExtraAwardCount) ~= 1 then
		return
	end

	if nType == 2 and nft_chk_pay_finish_item_count() ~= 1 then
		Talk(1,"", format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("%s kh«ng ®ñ %d", 
				GetItemName(NFT_T_FINISH_PAY_ITEM_COST[1],NFT_T_FINISH_PAY_ITEM_COST[2],NFT_T_FINISH_PAY_ITEM_COST[3]),
				NFT_T_FINISH_PAY_ITEM_COST[4]) )
		return
	end
	
	gf_SetLogCaption("NFT_FINISH_TASK")

	if FinishGTask(nTaskID) ~= 1 then
		return
	end
	gf_ModifyTask(TASKID_NFT_DAILY_FINISH_COUNT, 1)
	gf_ModifyTask(TASKID_NFT_TOTAL_FINISH_COUNT, 1)
	SetTask(TASKID_NFT_CUR_TASK, 0)

	--Âñµã
	local tRtInfo = T_NFT_RUNTIME["dailyfinish_all"][GetTask(TASKID_NFT_DAILY_FINISH_COUNT)]
	if tRtInfo then
		AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
	end

	if nType == 1 then
		--Âñµã
		tRtInfo = T_NFT_RUNTIME["finish_free"]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
	elseif nType == 2 then
		--Ë«±¶Íê³ÉÏûºÄµÀ¾ß
		if nft_pay_finish_cost() ~= 1 then
			return
		end
		gf_ModifyTask(TASKID_DC_NFT_PAY_FINISH_COUNT, 1)

		--Âñµã
		tRtInfo = T_NFT_RUNTIME["finish_pay"]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
		tRtInfo = T_NFT_RUNTIME["dailyfinish_pay"][GetTask(TASKID_DC_NFT_PAY_FINISH_COUNT)]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
	end
	
	--¶à±¶½±Àø
	if bFreeMulti == 1 then
		gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	end

	if nExtraAwardCount > 1 then
		for _=1, nExtraAwardCount -1 do
			tGtTask:DoPrize(nTaskID)
		end
	end

	--¸¶·Ñ¶îÍâ½±Àø
	if nType == 2 then
		gf_SetLogCaption("NFT_FINISH_PAY_EXTRA_AWARD")

		--¹Ì¶¨½±Àø
		--gf_Modify("ShiMenWeiWang", NFT_N_FINISH_PAY_EXTRA_AWARD_PRESTIGE)

		--¸¶·Ñ¶îÍâËæ»ú½±Àø
		local tAwardInfo = gf_RandRate(NFT_T_FINISH_PAY_EXTRA_AWARD_RAND, 10000, 2)
		if tAwardInfo and getn(tAwardInfo) > 0 then
			gf_AddItemEx(tAwardInfo[1])
		end
	end

	--ÀÛ¼Æ½±Àø
	gf_SetLogCaption("NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD")
	local nFinishCount = GetTask(TASKID_NFT_DAILY_FINISH_COUNT)
	if nFinishCount ~= 0 and mod(nFinishCount, NFT_N_EXTRA_AWAD_NEED_DAILY_FINISH_COUNT) == 0 then
		gf_AddItemEx(NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD)
	end

	FireEvent("event_mission_task_award", "ksgsystem", "nvsumon_new", nFinishCount)

	gf_SetLogCaption("NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD")
	nFinishCount = GetTask(TASKID_NFT_TOTAL_FINISH_COUNT)
	if nFinishCount ~= 0 and mod(nFinishCount, NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT) == 0 then
		gf_AddItemEx(NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD)
		SetTask(TASKID_NFT_TOTAL_FINISH_COUNT, 0)
	end

	gf_SetLogCaption("");
	AddRuntimeStat(105, nSubId, 0, 1); --Âñµã

	nft_talk()
end

function nft_close_task(bConfirm)
	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	if nTaskID <= 0 then
		Talk(1,"nft_talk",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch­a nhËn nhiÖm vô.")
		return
	end

	if bConfirm ~= 1 then
		local szTalk = format("Muèn bá qua? (Tèn <color=red>%d Vµng<color>, hñy nhiÖm vô hiÖn t¹i vµ nhËn ngÉu nhiªn 1 nhiÖm vô S­ M«n míi)",NFT_N_REFRESH_TASK_MONEY_COST)
		if gt_IsTaskCanFinish(nTaskID) == 1 then
			szTalk = "§· hoµn thµnh nhiÖm vô, "..szTalk
		end

		local selTab = {
			"§ång ý/#nft_close_task(1)",
			" trë l¹i/nft_talk",
			"KÕt thóc ®èi tho¹i/nothing",
		}
		Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..szTalk,
				getn(selTab),
				selTab);
		return
	end

	if Pay(NFT_N_REFRESH_TASK_MONEY_COST*10000) ~= 1 then
		Talk(1,"",format("<color=green>Vµng trong tói <color>kh«ng ®ñ %d<color=red>",NFT_N_REFRESH_TASK_MONEY_COST) )
		return
	end

	ClearGTask(nTaskID)
	SetTask(TASKID_NFT_CUR_TASK, 0)

	-- gf_ModifyTask(TASKID_NFT_DAILY_FINISH_COUNT, 1)
	-- if GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT) < NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT then
	-- 	--Ìø¹ýÒ²¿Û³ýÃâ·ÑË«±¶½±Àø´ÎÊý
	-- 	gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	-- end

	nft_get_task()
end

function nft_chk_multi_room_weight(nGTaskID, nMulti)
	if not nGTaskID or nGTaskID <= 0 then
		return 0
	end
	nMulti = nMulti or 1
	local nRoomWeight = tGtNpcInfo[nGTaskID]["data"][7];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1])*nMulti, tonumber(strArray[2])*nMulti, "") ~= 1 then
			Msg2Player("Kh«ng gian hµnh trang kh«ng ®ñ")
			return 0
		end
	end

	return 1
end

function nft_pay_finish_cost()
	return gf_DelItem(
		NFT_T_FINISH_PAY_ITEM_COST[1],
		NFT_T_FINISH_PAY_ITEM_COST[2], 
		NFT_T_FINISH_PAY_ITEM_COST[3], 
		NFT_T_FINISH_PAY_ITEM_COST[4])
end

function nft_chk_pay_finish_item_count()
	return GetItemCount(NFT_T_FINISH_PAY_ITEM_COST[1],
		NFT_T_FINISH_PAY_ITEM_COST[2], 
		NFT_T_FINISH_PAY_ITEM_COST[3]) >= NFT_T_FINISH_PAY_ITEM_COST[4] and 1 or 0
end