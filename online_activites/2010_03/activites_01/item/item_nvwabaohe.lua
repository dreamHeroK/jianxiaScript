--=============================================
--create by baiyun 2010.2.24
--describe:Ô½ÄÏ°æ2010Äê3ÔÂ»î¶¯1 Å®æ´±¦ºÐ½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--»î¶¯Í·ÎÄ¼þ
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Import("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")
TASKID_NVWA_BOX_USECOUNT = 3537

function OnUse(nItemIdx)
    --    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
    --        return 0;
    --    end
    if GetTask(2711) == 0 then	--TSK_TRANS_POINT_ALLOW = 2711 --l­u gi¸ trÞ b¶o l­u, ko cho phÐp tham gia chiÕn tr­êng
        if GetTask(701) > 0 then
            Talk(1, "", "H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã míi cã thÓ sö dông N÷ Oa B¶o H¹p!");
            return 0;
        elseif GetTask(701) < 0 then
            Talk(1, "", "H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã míi cã thÓ sö dông N÷ Oa B¶o H¹p!");
            return 0;
        else
            Talk(1, "", "H·y tham gia Tèng Liªu vµ chän Phe tr­íc míi cã thÓ sö dông N÷ Oa B¶o H¹p!");
            return 0;
        end
    end
    local nDate = tonumber(date("%y%m%d"))

    --	if nDate > 161231 then
    --		Talk(1,"","N÷ Oa b¶o h¹p ®· hÕt h¹n sö dông!")
    --		do	return	end
    --	end

    if GetLevel() < 73 then
        Talk(1, "", "§¼ng cÊp 73 trë lªn míi sö dông ®­îc vËt phÈm nµy.")
        return
    end
    if GetPlayerRoute() == 0 then
        Talk(1, "", "Gia nhËp m«n ph¸i míi sö dông ®­îc vËt phÈm nµy.")
        return
    end
    if gf_Judge_Room_Weight(9, 100) ~= 1 then
        Talk(1, "", "Kh«ng gian hµnh trang kh«ng ®ñ");
        return
    end
    --   if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local nLastGetDate = GetTask(VET_201003_01_TASK_GET_BAOHE_DATE);
    --    if nDate > 100704 then
    --		return
    --    end    
    if nLastGetDate ~= nDate then
        SetTask(VET_201003_01_TASK_GET_BAOHE_DATE, nDate)
        --        SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, 0);	--chuyÓn qua reset bªn vng_task_control.lua
        --        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, 0);               
    end

    local nUse = 100
    local nWeek = tonumber(date("%w"))
    -- VIP ®c dïng 200
    if IsActivatedVipCard() == 1 then
        nUse = 200
    end
    if nDate >= 151012 and nDate <= 151031 then
        if nWeek == 5 or nWeek == 6 or nWeek == 0 then
            nUse = 200
        end
    end

    --local nNation = GetGlbValue(GLB_TSK_SERVER_ID)


    --	if nWeek == 2 or nWeek == 3 then
    --		nUse = 64
    --	elseif nWeek == 4 or nWeek == 5 then
    --		nUse = 88
    --	end
    --    if nDate <= 100905 then
    --    		nUse = 64
    --    end
    --    if nDate >= 100909 and nDate <= 100912 then
    --    		nUse = 128
    --    end
    if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= nUse then
        Talk(1, "", "B¹n ®· sö dông tèi ®a sè N÷ Oa B¶o H¹p trong ngµy, kh«ng thÓ sö dông thªm!")
        return
    end
    
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) + 1)
        --    	  if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and mod(GetTask(TASK_VNG_PET), 100) >= 2 then
        --    	  	Pet_AddGP(1)
        --    	  end

        -- NhiÖm vô chuyÓn sinh 5
        if GetTask(TRANSLIFE_MISSION_ID) == 34 and GetTask(TRANSLIFE_TASK_5_2) < 2000 then
            SetTask(TRANSLIFE_TASK_5_2, GetTask(TRANSLIFE_TASK_5_2) + 1)
            if GetTask(TRANSLIFE_TASK_5_2) == 2000 then
                TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh sö dông 2000 N÷ Oa B¶o H¹p")
            end
        end

        --	  gf_EventGiveCustomAward(1, nExp, 0, "Nu Oa Bao Hap")
        --   	  gf_EventGiveRandAward(VET_201003_01_NVWABAOHE_AWARD_LIST, 100, 3, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[9][1]);
        --- §iÓm VËn May
        --	  	local nExp = 1000000
        --		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
        --		local nExpVM = (nPointVM - 100)/100*nExp
        --		ModifyExp(nExpVM)
        --		if nExpVM > 0 then
        --			Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
        --		else
        --			Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
        --		end   	
        -----------
        --        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 400 then
        --    	  		gf_AddItemEx2({2,1,30130,1}, "Phi Yªn Th¹ch", VET_201003_01_STR_LOG_TITLE, "nhËn Phi Yªn Th¹ch" )
        --    	  		Msg2Player("B¹n nhËn ®­îc 1 Phi Yªn Th¹ch")
        --    	  end
        --		gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ N÷ Oa")		
        --		VietWaBaoHe(); --thªm nguyªn liÖu event hµng th¸ng
        Use_Award_NuOa() --phÇn th­ëng khi sö dông N÷ Oa
        gf_WriteLogEx("SO LAN SU DUNG NU OA 12/2016", "NhËn thµnh c«ng", 1, "Sö dông n÷ oa b¶o h¹p")
        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == nUse or GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 then
            Use_Award_NuOa_100()
            gf_WriteLogEx("SO LAN SU DUNG NU OA 12/2016", "NhËn thµnh c«ng", 1, "Sö dông n÷ oa lÇn thø 100")
        end
        ----------- Chuçi nhiÖm vô ChuyÓn Sinh 6
        local nCS6_BH = floor(GetTask(TSK_CS6_GET1TIME) / 1000)
        local nCS6_BH_Num = mod(GetTask(TSK_CS6_GET1TIME), 1000)
        if mod(nCS6_BH, 10000) < 1000 and GetTask(TSK_CS6_TULINH) < 2 then
            nCS6_BH = (nCS6_BH + 1) * 1000 + nCS6_BH_Num
            SetTask(TSK_CS6_GET1TIME, nCS6_BH)
        end
        --nhiÖm vô lµm giµu
        if CFG_NhiemVuLamGiau == 1 then
            if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= 5 and gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 1) == 0 then
                gf_SetTaskBit(TSK_LAMGIAU, 1, 1, 0)
                TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Sö dông 05 n÷ oa b¶o h¹p.")
            end
        end

        FireEvent("event_mission_task_award", "ksgsystem", "nuoabaohap", GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT))
        KsgPlayer:Msg(format("§· sö dông %d/%d N÷ Oa B¶o H¹p trong ngµy.", GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT), nUse))
        
        FireEvent("event_cost_item", 2,1,30154,1);

       if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and nDate <= 130120 then
            gf_AddItemEx2({ 2, 1, 30030, 50 }, "TiÓu Nh­ Y1", "NIEN THU NHU Y", "hoµn thµnh 100 N÷ oa ")
        end
        local used = GetTask(TASKID_NVWA_BOX_USECOUNT)
        --cdkey
        SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemNvWa()");
        SetTask(TASKID_NVWA_BOX_USECOUNT, used + 1)
        if used + 1 >= 100 then
            SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2214)");
        end
    end
end
