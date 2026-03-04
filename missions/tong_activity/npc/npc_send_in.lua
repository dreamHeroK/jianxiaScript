Include("\\script\\missions\\tong_activity\\head.lua")
Import("\\script\\missions\\tong_activity\\tong_activity_value.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\lib\\message.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

g_NpcName = "<color=green>Sø Gi¶ Ho¹t §éng Bang<color>:";
g_MyFileName = "\\script\\missions\\tong_activity\\npc_send_in.lua";

g_tbNeedItem = {2,111,149,1}
g_nMaxMissionsCount = 30; --µ¥¸öGS×î´óÄÜ¿ªÆôµÄ°ï»á»î¶¯ÊýÁ¿

function get_my_tong_map_id()
	--return tTongValues[enumTongValue_ActivityMapId];
	return TongActivity_GetTongValue(enumTongValue_ActivityMapId);
end

function check_mission_time()
	local nWeek = tonumber(date("%w"));
	local nTime	= tonumber(date("%H%M"))
	if (nWeek == 1 and nTime < 200) or (nWeek == 0 and nTime > 2200) then		
		return 0;
	end
	
	return 1;
end

function get_mission_opened()
	if TongActivity_GetTongValue(enumTongValue_ActivityOpenTime) > 0 then	
		return 1;
	else
		return 0;
	end
end

function time_str_to_num(v)
	local nDate = floor(v / 10000);
	local nTime = mod(v, 10000);
	local nH = floor(nTime / 100);
	local nM = mod(nTime, 100);
	
	return nDate, nH * 60 + nM;
end

--function is_mission_can_enter()
--	local v = TongActivity_GetTongValue(enumTongValue_ActivityOpenTime);
--	if v > 0 then
--		local nDate, nTime = time_str_to_num(v);
--		local nNowDate, nNowTime = time_str_to_num(tonumber(date("%d%H%M")));
--		if (nNowDate == nDate) and ((nNowTime - nTime) < 30) then
--			return 1; --30·ÖÖÓÄÚ¿ÉÒÔÔÊÐí½øÈë¸±±¾
--		end
--	end	
--	
--	return 0;
--end
--
function is_player_can_enter()
	local v1 = TongActivity_GetTongValue(enumTongValue_ActivityOpenTime);
	local v2 = GetTask(TASKID_TONG_JOIN_ACTIVITY_TIME);
	if (v1 > 0) and (v2 == 0) then
		return 1;
	end
	
	if (v1 > 0) and (v2 > 0) then
		local nDate1, nTime1 = time_str_to_num(v1);
		local nDate2, nTime2 = time_str_to_num(v2);	
		
		if (nDate2 == nDate1) and ((nTime2 - nTime1) < 60) then
			return 1; --¸±±¾ÒÑ¾­¿ªÆô£¬²¢ÇÒÍæ¼ÒÉÏ´Î½øÈë¸±±¾Ê±¼ä¾àÀë¸±±¾¿ªÆôÊ±²»³¬¹ý60·ÖÖÓ£¬¿ÉÒÔÔÊÐí½øÈë
		end
	end	
	
	return 0;
end

function is_mission_can_enter()
	local nMapID = TongActivity_GetTongValue(enumTongValue_ActivityMapId);
	if nMapID == 0 then
		return 0;
	end
	local nMissionMapID = mf_GetMissionV(tbTongActivity.missionID, tbTongActivity.mv6, nMapID);
	if nMissionMapID ~= nMapID then
		return 0;
	end
	
	return 1;
end

--function is_player_can_enter()
--	if GetTask(TASKID_TONG_JOIN_ACTIVITY_TIME) ~= 0 then
--		return 0;
--	end
--	
--	return 1;
--end

function do_open_activity()
	local nNow = tonumber(date("%d%H%M"));
	local nIsOpen = get_mission_opened();

	if nIsOpen == 1 then
		--¸±±¾ÒÑ¾­¿ªÆô£¬Ö±½Ó½øÈë
		enter_mission();
	else		
		--¸±±¾Ã»ÓÐ¿ªÆô£¬´´½¨²¢½øÈë
		
		--¼ì²é·þÎñÆ÷ÉÏµÄ¸±±¾¿ªÆôÊýÁ¿ÊÇ·ñÌ«¶à
		local tMapId = gf_GetDataTable(GetSameMaps(tbTongActivity.realMapID));
		if getn(tMapId) > g_nMaxMissionsCount then
			Talk(1,"", g_NpcName .. "Server ®ang bËn, ®¹i hiÖp ®îi sau h·y ®Õn.");
			return 0;
		end
		 
		--¿Û³ýµÀ¾ß  --²»ÒªÃÅÆ±ÁË
		-- if DelItem(g_tbNeedItem[1], g_tbNeedItem[2], g_tbNeedItem[3], g_tbNeedItem[4]) ~= 1 then
		-- 	Talk(1,"", g_NpcName .. "ËµºÃµÄ°ï»áÕÙ¼¯ÁîÄØ£¿");
		-- 	return 0;
		-- end
		
		nMapID = tbTongActivity:Create();
		TongActivity_SetTongValue(enumTongValue_ActivityOpenTime, nNow);
		TongActivity_SetTongValue(enumTongValue_ActivityMapId, nMapID);
		SetTask(TASKID_TONG_ACTIVITY_MAP,nMapID)
		AddRuntimeStat(54, 1, 0, 1) --¿ªÆô´ÎÊýÍ³¼Æ
		tbTongActivity:Enter(nMapID,1);
		
		-- ds_TONG_DATA:AddStatValue(1, 4, 1); --Êý¾ÝÂñµã£º¼ÇÂ¼¿ªÆô°ï»á»î¶¯
		
		SendTongMessage("D­¬ng Ch©u Gia C¸t CÇm ®· më ®­êng ®Õn khu vùc ho¹t ®éng bang, tham dù ®Ó nhËn th­ëng.");
		--¼ÓÈÕÖ¾
		WriteLog(format("[%s] [role:%s(acc:%s)] [tong:%s] [duty:%d] [Më ho¹t ®éng bang %d]",
				"TongActivity", GetName(), GetAccount(), GetTongName(), GetTongDuty(), nNow ));
	end
end

function enter_mission()
	local nMapID = 0;
	local nIsOpen = get_mission_opened();
	if nIsOpen == 1 then
		if is_mission_can_enter() ~= 1 then
			Talk(1,"", g_NpcName .. "Con ®­êng phÝa tr­íc ®· háng, kh«ng thÓ ®i. §¹i hiÖp h·y t×m bang chñ hái xem ho¹t ®éng ®· më ch­a."); --³¬Ê±ÁË
			return 0;
		end
		if is_player_can_enter() ~= 1 then
			--±¾ÖÜÒÑ¾­²Î¼Ó¹ý»î¶¯
			Talk(1,"", g_NpcName .. "Ta nhí ra råi! Ng­¬i ®· ®i qua 1 lÇn, mçi tuÇn ta chØ cho ®i 1 lÇn, ®õng tham lam qu¸.");
			return 0;
		end
		 
		local tMapId = gf_GetDataTable(GetSameMaps(tbTongActivity.realMapID));
		local nMyTongMapId = get_my_tong_map_id();
		for i = 1,getn(tMapId) do
			if tMapId[i] == nMyTongMapId then
				nMapID = tMapId[i];
				break;
			end
		end
	else
		Talk(1,"", g_NpcName .. "H·y nhê Qu¶n Sù ®Õn më ho¹t ®éng, ta míi cã thÓ ®­a ng­¬i vµo.");
		return 0;
	end

	if nMapID == 0 then
		Talk(1,"", g_NpcName .. "Ho¹t ®éng lçi kh«ng thÓ tham gia.");
		return 0;
	end
		
	local nNow = tonumber(date("%d%H%M"));
	SetTask(TASKID_TONG_JOIN_ACTIVITY_TIME, nNow);


	if tGtTask:check_cur_task(561) == 1 then
		SetTask(TASKID_TONG_ACTIVITY_ENTER,1);
	end
	SetTask(TASKID_TONG_ACTIVITY_MAP,nMapID)
	tbTongActivity:Enter(nMapID,1);	
	
	WriteLog(format("[%s] [role:%s(acc:%s)] [tong:%s] [duty:%d] [Vµo khu vùc ho¹t ®éng bang %d]",
			"TongActivity", GetName(), GetAccount(), GetTongName(), GetTongDuty(), nNow ));	
end

function ready_to_open_activity()
	try_to_open_activity();
end

function prepare_to_enter_mission()
	enter_mission();
end

function try_to_open_activity()
	local szTip1 = "§©y lµ giao dÞch lín, h·y gäi Qu¶n Sù Bang cña c¸c ng­¬i ®Õn.";
	local szTip2 = "22:00 chñ nhËt ®Õn 2:00 ngµy h«m sau ta sÏ nghØ ng¬i, ®õng lµm phiÒn.";
	-- local szTip3 = "ÕâÊÂÎÒ¿É×ö²»ÁËÖ÷£¬ÄãµÃÏÈ¸úÖî¸ðÆå±¨±¸Ò»Éù£¬Ëû¾ÍÔÚÎäÁÖÃË¡£ÄÃ×ÅËû¸øµÄ°ï»áÕÙ¼¯ÁîÎÒ²ÅÄÜ´øÄã½øÈ¥¡£";
	local szTip4 = "TuÇn nµy ®· më, kh«ng cÇn ®Õn n÷a.";
	local szTip5 = "Quü bang thÊp h¬n 280000, kh«ng thÓ më ho¹t ®éng bang.";
	
	-- local nMoney = GetTongMoney();
	local nDutyID = GetTongDuty();
	local tbValidDutyID = {DUTY_ID_KING, DUTY_ID_QUEEN, DUTY_ID_GENERAL};
	local bValid = 0;

	if nTongLv == 0 then
		Talk(1,"",g_NpcName.."CÊp bang kh«ng ®ñ.");
		return 0;		
	end

	for _, id in tbValidDutyID do
		if id == nDutyID then
			bValid = 1;
			break
		end
	end

	if bValid == 0 then
		Talk(1,"",g_NpcName.. szTip1);
		return 0;		
	end

	local nType ,_ = GetTongTotem()
	if nType < 3 then
		Talk(1, "", g_NpcName .. "Ph¶i cã §å §»ng Bang cÊp 3 trë lªn míi cã thÓ më ho¹t ®éng bang.");
		return 0;
	end

	if check_mission_time() ~= 1 then
		Talk(1,"",g_NpcName.. szTip2);
		return 0;		
	end		
	-- ²»ÒªÃÅÆ±ÁË
	-- local nCount = GetItemCount(g_tbNeedItem[1], g_tbNeedItem[2], g_tbNeedItem[3]);
	-- if (nCount == nil) or (nCount < 1) then
	-- 	Talk(1, "", g_NpcName .. szTip3);
	-- 	return 0;
	-- end
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 604800 then
		Say("Thêi gian vµo bang ch­a ®ñ 7 ngµy, kh«ng thÓ tham gia!", 0)
		return
	end
	
	if get_mission_opened() == 1 then
		Talk(1, "", g_NpcName .. szTip4);
		return 0;
	end
	if tGtTask:check_cur_task(561) == 1 then
		SetTask(TASKID_TONG_ACTIVITY_ENTER,1);
	end
	do_open_activity();
end

function not_ready_to_open_activity()
	suTalk("main", g_NpcName .. "Sau khi chuÈn bÞ xong h·y ®Õn t×m ta.");
end

function open_activity()
	local szContent = "H·y triÖu tËp bang chóng ®Õn ®©y, n¬i nµy chØ tån t¹i 1 giê, ®õng ®i l¹c ®Êy. VÉn ch­a chuÈn bÞ xong?";
	local tMsg = {		
		"Ng­êi trong bang ®Òu ®· chuÈn bÞ xong./ready_to_open_activity",
		"Ch­a chuÈn bÞ xong/not_ready_to_open_activity",
		"Rêi khái/nothing",
	}
	
	suSay(g_NpcName .. szContent,
		getn(tMsg),
		tMsg);	
end

function go_somewhere()
	local strMsg = {
		"Suþt! Nhá tiÕng nµo! Ng­¬i muèn ai còng biÕt sao! Ta nghe ca ca Gia C¸t Kú nãi c¸c ng­¬i muèn ®Õn L©m Gian TuyÕt Nguyªn?\nN¬i ®ã lµ vïng ®Êt phong thñy.\nTrong thêi gian quy ®Þnh tiªu diÖt c¸c ®éng vËt g©y rèi sÏ nhËn ®­îc phÇn th­ëng phong phó.\nChi tiÕt ta kh«ng râ nh­ng nghe nãi CÇu T­ëng cña Cè y Héi biÕt nhiÒu th«ng tin, h·y ®Õn t×m hiÓu."
	};
	local tMsg = {
		"BiÕt råi!/nothing",
	};
	suSay(g_NpcName .. strMsg[1], 
		getn(tMsg),
		tMsg);
end

function about_qiujiang()
	local strMsg = {
		"CÇu Êy lµ kÎ nhót nh¸t th«i. nh­ng mµ ®èi víi nh÷ng th«ng tin vÒ cña b¸u vËt l¹ th× rÊt quan t©m, nªn kÎ tinh minh Cè Hy míi gäi nã vµo Cè y Héi ®Êy. H«m ®ã CÇu Êy véi v· ch¹y ra víi vÎ kinh khñng nh÷ng l¹i víi mét chót ®¸ng tiÕc, Anh t«i thÊy nã th× biÕt cã viÖc. Nã gi¶i thÝch l©u còng kh«ng cho râ l¾m, chØ biÕt lµ cã mét qu¸i vËt lín lo, nÕu cã thÓ ®¸nh b¹i qu¸i ®ã, ch¾c ch¾n cã thÓ nhËn ®­îc c¶u c¶i lín.",
	}
	suTalk("main", g_NpcName .. strMsg[1]);
end

function test_only()
	TongActivity_SetTongValue(enumTongValue_ActivityOpenTime, 0);
	SetTask(TASKID_TONG_JOIN_ACTIVITY_TIME, 0);
	SetTask(TASKID_TONG_GET_ACTIVITY_AWARD, 0);

	--¼ì²é±³°ü¿Õ¼ä	
	if gf_JudgeRoomWeight(2, 100, "") ~= 1 then
		return 
	end

	--¸ø°ï»áÕÙ¼¯Áî
	-- local nCount = GetItemCount(g_tbNeedItem[1], g_tbNeedItem[2], g_tbNeedItem[3]);
	-- if nCount == nil or nCount < 1 then
	-- 	gf_AddItemEx(g_tbNeedItem, "°ï»áÕÙ¼¯Áî", 1);
	-- end	

	--¸øÐíÔ¸É°
	local tSpecialItem = {2, 95, 231};
	local nSpecialCount = 100;
	nCount = GetItemCount(gf_UnPack(tSpecialItem));
	if nCount == nil or nCount < nSpecialCount then
		gf_AddItemEx(tSpecialItem, "C¸t ¦íc NguyÖn", nSpecialCount);
	end
end

function main()
	if IsTongMember() == 0 then
		Talk(1,"",g_NpcName.."§¹i hiÖp gia nhËp bang ph¸i råi h·y ®Õn.");
		return 0;
	end
	
	if GetLevel() < 70 then
		Talk(1,"",g_NpcName.."§¹i hiÖp ®¹t cÊp 70 h·y ®Õn.");
		return 0;
	end
	
	local tMsg = {		
		"Ta muèn më ho¹t ®éng bang/open_activity",
		"Ta muèn vµo khu vùc ho¹t ®éng/prepare_to_enter_mission",
		"TiÓu ca, nghe nãi ng­¬i cã thÓ ®­a chóng ta ®Õn.../go_somewhere",
		"CÇu T­ëng cña Cè y Héi lµ ng­êi thÕ nµo?/about_qiujiang",
		"Rêi khái/nothing",
	}

	if g_isDebug == 1 then
		tinsert(tMsg, getn(tMsg), "****Thö nghiÖm riªng: Xãa biÕn l­îng*****/test_only");
	end
	
	Say(g_NpcName .. "Xin dõng b­íc, h×nh nh­ kh¸ch quan thiÕu t¹i h¹ 212 l­îng 5 tiÒn vµng.",
		getn(tMsg),
		tMsg);	
end