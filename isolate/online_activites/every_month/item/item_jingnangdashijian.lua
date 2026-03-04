----------------------------------------------------------------------------------
tExchange = {
    gtNormalExchange:new(), --¶Ò»»1³É¹¦
    gtNormalExchange:new(), --¶Ò»»1Ê§°Ü
    gtNormalExchange:new(), --¶Ò»»2³É¹¦
    gtNormalExchange:new(), --¶Ò»»2Ê§°Ü
    gtNormalExchange:new(), --¶Ò»»3³É¹¦
    gtNormalExchange:new(), --¶Ò»»3Ê§°Ü
    --gtNormalExchange:new(), --¶Ò»»100µÀ¾ßXu
}
_tMaterials = tConfig.tMaterials
_Products = tConfig.tProducts
tExchange[1].tConsume = {
    { _tMaterials[1][1], _tMaterials[1][2][1], _tMaterials[1][2][2], _tMaterials[1][2][3], 10 }, --10²ÄÁÏ1
    { _tMaterials[2][1], _tMaterials[2][2][1], _tMaterials[2][2][2], _tMaterials[2][2][3], 10 }, --10²ÄÁÏ2
    { " Tiªu Dao Ngäc", 2, 1, 30603, 5 },
}
tExchange[1].tAward = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1²úÆ·1
}
tExchange[2].tConsume = tExchange[1].tConsume
tExchange[2].tAward = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1²úÆ·2
}
tExchange[3].tConsume = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1²úÆ·1
    { _tMaterials[3][1], _tMaterials[3][2][1], _tMaterials[3][2][2], _tMaterials[3][2][3], 20 }, --20²ÄÁÏ3
}
tExchange[3].tAward = {
    { _Products[3][1], _Products[3][2][1], _Products[3][2][2], _Products[3][2][3], 1 }, --1²úÆ·3
}
tExchange[4].tConsume = tExchange[3].tConsume
tExchange[4].tAward = {
    { _Products[1][1], _Products[1][2][1], _Products[1][2][2], _Products[1][2][3], 1 }, --1²úÆ·1
}
tExchange[5].tConsume = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1²úÆ·2
    { _tMaterials[3][1], _tMaterials[3][2][1], _tMaterials[3][2][2], _tMaterials[3][2][3], 20 }, --20²ÄÁÏ3
}
tExchange[5].tAward = {
    { _Products[3][1], _Products[3][2][1], _Products[3][2][2], _Products[3][2][3], 1 }, --1²úÆ·3
}
tExchange[6].tConsume = tExchange[5].tConsume
tExchange[6].tAward = {
    { _Products[2][1], _Products[2][2][1], _Products[2][2][2], _Products[2][2][3], 1 }, --1²úÆ·2
}
--tExchange[7].tConsume = {
--	{"´óÒøÆ±", 2, 1, 199, 1},
--}
--tExchange[7].tAward = {
--	{"½ð±Ò", 2, 1, 30230, 100},
--}
_tMaterials = nil
_Products = nil

--½õÄÒ´óÊÂ¼þ
SZ_TITLE_HEAD = "HOAT DONG CHINH THANG 11 NAM 2015"
function handle_on_item_talk_jingnangdashijian(nIndex)
    local _, nStartDate, nEndDate = isolate_get_dates()

    local szTalk = format("%s thêi gian më %s - %s. Chi tiÕt h·y xem trªn trang chñ <color=gold>%s<color>.",
            isolate_view_name(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate), "https://volam2.zing.vn")
    SZ_TITLE_HEAD = format("<color=gold>%s:<color>", GetItemName(nIndex))
    local szTitle = format("%s%s", SZ_TITLE_HEAD, szTalk)
    local tbSay = {}

    if isolate_in_date() == 1 then
        _add_exchange_talk(tbSay, 1)
        _add_exchange_talk(tbSay, 2)
        _add_exchange_talk(tbSay, 3)
        tinsert(tbSay, format("%s/#_final_award_talk(1)", format("NhËn phÇn th­ëng cuèi %s ", tConfig.tProducts[1][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(2)", format("NhËn phÇn th­ëng cuèi %s ", tConfig.tProducts[2][1])))
        tinsert(tbSay, format("%s/#_final_award_talk(3)", format("NhËn phÇn th­ëng cuèi %s ", tConfig.tProducts[3][1])))
        if ENABLE_EXTEND_EVENT == 1 then
            tinsert(tbSay, format("%s/#_extra_final_award_talk(1)", format("NhËn phÇn th­ëng më réng 4000 %s ", tConfig.tProducts[1][1])))
            tinsert(tbSay, format("%s/#_extra_final_award_talk(2)", format("NhËn phÇn th­ëng më réng 4000 %s ", tConfig.tProducts[2][1])))
            tinsert(tbSay, format("%s/#_extra_final_award_talk(3)", format("NhËn phÇn th­ëng më réng 4000 %s ", tConfig.tProducts[3][1])))
            tinsert(tbSay, format("%s/_all_extra_final_award_talk", "NhËn phÇn th­ëng më réng sö dông tèi ®a 4000 c¸i mçi lo¹i"))
		end
    end

    tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))

    Say(szTitle, getn(tbSay), tbSay)
end

function _add_exchange_talk(tSay, nIndex)
    local szWordCont = " b»ng "
    if nIndex == 1 then
        szWordCont = " hoÆc "
    end
    local szWord = format("§æi %s %s %s", tExchange[2 * nIndex - 1]:get_award_desc(), szWordCont, tExchange[2 * nIndex]:get_award_desc())
    tinsert(tSay, format("%s/#_exchange_talk(%d)", szWord, nIndex))
end
function _exchange_talk(nIndex, szWordCont, bConfirm)
    local szWordCont = " b»ng "
    if nIndex == 1 then
        szWordCont = " hoÆc "
    end
    if not bConfirm then
        local tbSay = {}
        local szTitle = format("§æi %s %s %s", tExchange[2 * nIndex - 1]:get_award_desc(), szWordCont, tExchange[2 * nIndex]:get_award_desc())
        szTitle = format("%s%s,%s<color=yellow>%s<color>,%s", SZ_TITLE_HEAD, szTitle, "CÇn tiªu hao", tExchange[2 * nIndex - 1]:get_consume_desc(), "x¸c nhËn kh«ng?")
        tinsert(tbSay, format("%s/#_exchange_talk(%d,1,1)", "X¸c ®Þnh ®æi", nIndex))
        --tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "·µ»Ø", 0))
        tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    local t = tExchange[2 * nIndex - 1]
    local nMax = t:get_max_exchange_cnt()
    if nMax > 0 then
        local szFunc = format("_exchange_confirm_%d", nIndex)
        AskClientForNumber(szFunc, 1, nMax, "§æi bao nhiªu lÇn")
    else
        Talk(1, "", "H×nh nh­ kh«ng ®ñ nguyªn liÖu")
    end
end
function _exchange_confirm(nIndex, nNum)
    gf_WriteLogEx("EventChinhThang12", "§æi vËt phÈm event", nNum, "§æi vËt phÈm event lo¹i " .. nIndex)
    local nSucCnt = 0
    for i = 1, nNum do
        local t = nil
        if random(100) <= 50 then
            --50%³É¹¦ÂÊ
            t = tExchange[2 * nIndex - 1]
        else
            t = tExchange[2 * nIndex]
        end
        if 1 ~= t:do_exchange(1, 1) then
            break
        end
        nSucCnt = nSucCnt + 1
    end

    if nSucCnt > 0 then
        AddRuntimeStat(33, 1, nIndex, nSucCnt)
    end
end
function _exchange_confirm_1(nNum)
    return _exchange_confirm(1, nNum)
end
function _exchange_confirm_2(nNum)
    return _exchange_confirm(2, nNum)
end
function _exchange_confirm_3(nNum)
    return _exchange_confirm(3, nNum)
end

function _final_award_talk(nIndex)
    if nIndex == 3 then
        if gf_Judge_Room_Weight(10, 100, "") ~= 1 then
            return 0
        end
    end
    local t = tConfig.tProducts[nIndex]
    if get_task_bit("task_get_final_award", format("bit_award%d", nIndex)) == 1 then
        Talk(1, "", "§· nhËn phÇn th­ëng nµy råi")
        return
    end
    local nUseCount = get_product_use_count(nIndex)
    local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
    local szTitle = format("%s hiÖn t¹i dïng <color=yellow>%s<color> cã sè l­îng lµ <color=yellow>[%d/%d]<color>", SZ_TITLE_HEAD, t[1], nUseCount, nMaxUseCount
    )
    local tbSay = {}
    if _check_use_cnt(nIndex, 1) == 1 then
        szTitle = format("%s,%s", szTitle, "Cã thÓ chän 1 phÇn th­ëng bªn d­íi")
        local tAward = tConfig.tFinalPrizeSel[nIndex]
        for i = 1, getn(tAward) do
            local szAward = tAward[i]
            tinsert(tbSay, format("%s/#_final_award(%d, %d)", get_award_name(szAward), nIndex, i))
        end
    else
        szTitle = format("%s,%s", szTitle, "T¹m thêi kh«ng thÓ nhËn phÇn th­ëng cuèi")
    end
    --tinsert(tbSay, format("%s/#handle_on_item_talk_jingnangdashijian(%d)", "·µ»Ø", 0))
    tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    Say(szTitle, getn(tbSay), tbSay)
    return
end

function _final_award(nIndex, nAward, bConfirm)
    if get_task_bit("task_get_final_award", format("bit_award%d", nIndex)) == 1 then
        return
    end
    local tAward = tConfig.tFinalPrizeSel[nIndex]
    local szAward = tAward[nAward]
    local r, msg = check_get_award(szAward, 0)
    if not bConfirm then
        local szTitle = format("%s sÏ nhËn phÇn th­ëng[<color=yellow>%s<color><color=red>%s<color>], x¸c ®Þnh nhËn kh«ng? ", SZ_TITLE_HEAD, get_award_desc(szAward), msg)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_final_award(%d, %d, 1)", "NhËn ", nIndex, nAward))
        tinsert(tbSay, format("%s/#_final_award_talk(%d)", "trë l¹i", nIndex))
        tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
        Say(szTitle, getn(tbSay), tbSay)
        return
    end
    if _check_use_cnt(nIndex, 1) == 1 then
        local szTask, szTaskBit = "task_get_final_award", format("bit_award%d", nIndex)
        local nTask = get_task_id(szTask)
        local nTaskBit = get_task_sub_id(szTask, szTaskBit)
        local r = get_award(szAward, nTask, nTaskBit)
        local is_vng_award = check_is_vng_award(szAward)
        if is_vng_award == 0 then
            --vngµÄ½±ÀøÁì½±±êÖ¾ËûÃÇ×Ô¼ºÔÚº¯ÊýÀïÃæÈ¥ÉèÖÃ
            if r == 1 then
                set_task_bit(szTask, szTaskBit, 1)
                Talk(1, "", "NhËn phÇn th­ëng cuèi thµnh c«ng")
                AddRuntimeStat(33, 3, nIndex, 1)
                AddRuntimeStat(33, 4, nIndex * 10 + nAward, 1)
            else
                Talk(1, "", "NhËn phÇn th­ëng cuèi thÊt b¹i")
            end
        end

    end
end
function _check_use_cnt(nIndex, bRelate)
    local nUseCount = get_product_use_count(nIndex)
    local nMaxUseCount = tStaticConfig.tProductsMaxUse[nIndex]
    --if GetBit(GetTask(2765),1) == 1 and GetBit(GetTask(2765),2) == 1 and GetBit(GetTask(2765),3) == 1 then
    --	nMaxUseCount = 4000
    --end
	if ENABLE_EXTEND_EVENT == 1 then
		if GetBit(GetTask(tCheckTask[nIndex][3]), tCheckTask[nIndex][2]) == 1 then
			nMaxUseCount = 4000
		end
	end
    if nUseCount < nMaxUseCount then
        return 0
    end
    if bRelate and bRelate == 1 and nIndex == 3 and (GetBit(GetTask(2765), 1) ~= 1 or GetBit(GetTask(2765), 2) ~= 1) then
        --	if bRelate and bRelate == 1 and nIndex == 3 and (_check_use_cnt(1)~=1 or _check_use_cnt(2)~=1) then
        return 0
    end
    return 1
end

function _extra_final_award_talk(nIndex)
    if gf_Judge_Room_Weight(13, 300, "") ~= 1 then
        return 0
    end
    if GetTask(tCheckTask[nIndex][1]) < 4000 then
        Talk(1, "", format("<color=yellow>%s<color>Sè lÇn dïng ch­a ®ñ 4000 c¸i nªn kh«ng thÓ nhËn th­ëng", tCheckTask[nIndex][5]))
        return 0
    end
    if GetBit(GetTask(tCheckTask[nIndex][4]), tCheckTask[nIndex][2]) == 1 then
        Talk(1, "", format("<color=yellow>%s<color>§¹i hiÖp ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn th­ëng ®­îc n÷a.", tCheckTask[nIndex][5]))
        return 0
    end
    local tbAward = {
        [1] = { item = {

            { gdp = { 2, 1, 31024, 1 }, name = "Tói §¸ Quý CÊp 5" }, --, nExpired = 15*24*60*60},
            { gdp = { 2, 1, 30526, 8 }, name = "TÈy T©m Th¹ch cÊp 6" },
        }, --{gdp={2, 1, 30344, 1}, name="ThÇn Tµi B¶o R­¬ng"},
                nExp = 2000000000,
            --nGold = 50000000,
                nDanhvong = 5000,
                nSumon = 5000,
            --nChankhi = 20000,
        },
        [2] = { item = {

            { gdp = { 2, 1, 31024, 1 }, name = "Tói §¸ Quý CÊp 5" }, --, nExpired = 15*24*60*60},
            { gdp = { 2, 1, 30532, 8 }, name = "LuyÖn L« ThiÕt cÊp 6" },
        }, --{gdp={2, 1, 30344, 1}, name="ThÇn Tµi B¶o R­¬ng"},
                nExp = 2000000000,
                nDanhvong = 5000,
                nSumon = 5000,
            --nChankhi = 20000,
        },
        [3] = { item = {
            { gdp = { 2, 1, 31024, 2 }, name = "Tói §¸ Quý CÊp 5" },
            { gdp = { 2, 1, 30730, 30 }, name = "Kinh M¹ch §ång Nh©n" },
            { gdp = { 2, 1, 31239, 1 }, name = "Linh Ph¸ch §¬n" },
            { gdp = { 2, 1, 30731, 10 }, name = "Kinh M¹ch Ng©n Nh©n" },
            { gdp = { 2, 1, 9977, 5 }, name = "Qu©n C«ng Huy Hoµng", nExpired = 30 * 24 * 60 * 60 },
        },
                nExp = 2000000000,
                nChankhi = 40000,
        },
    }
    SetTask(tCheckTask[nIndex][4], SetBit(GetTask(tCheckTask[nIndex][4]), tCheckTask[nIndex][2], 1));
    LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
    LIB_Award.szLogAction = "NhËn thµnh c«ng lo¹i" .. nIndex
    LIB_Award:Award(tbAward[nIndex])
end

function _all_extra_final_award_talk()
    if gf_Judge_Room_Weight(13, 300, "") ~= 1 then
        Talk(1, "", "Hµnh trang cña §¹i hiÖp kh«ng ®ñ « trèng, kh«ng thÓ nhËn th­ëng!")
        return 0
    end
    if GetBit(GetTask(TSK_EVENTCHINH_MORONG), 1) ~= 1 or GetBit(GetTask(TSK_EVENTCHINH_MORONG), 2) ~= 1 or GetBit(GetTask(TSK_EVENTCHINH_MORONG), 3) ~= 1 then
        Talk(1, "", "§¹i hiÖp ch­a nhËn th­ëng hÕt c¸c phÇn th­ëng më réng event, nªn kh«ng thÓ nhËn th­ëng ®­îc.")
        return 0
    end
    if GetBit(GetTask(TSK_EVENTCHINH_MORONG), 4) == 1 then
        Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi, nªn kh«ng thÓ nhËn th­ëng ®­îc.")
        return 0
    end
    local tbSay = {}
    tinsert(tbSay, "PhÇn th­ëng 1: TÈy T©m Th¹ch 6*8 (Kh«ng khãa), LuyÖn L« ThiÕt 6*8 (Kh«ng khãa), §¹i §Þnh Hån (7 ngµy)/_get_extra_final_award")
    tinsert(tbSay, "PhÇn th­ëng 2: Phôc sinh nhanh ®ång hµnh lÇn 2/_fast_finish_phucsinh_pet_lan2")
    tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    Say("NhËn th­ëng më réng, vui lßng chän mét trong c¸c phÇn th­ëng sau: ", getn(tbSay), tbSay)
end

function _get_extra_final_award()
    tbAward = {
        item = { { gdp = { 2, 1, 30526, 8 }, name = "TÈy T©m Th¹ch cÊp 6" },
                 { gdp = { 2, 1, 30532, 8 }, name = "LuyÖn L« ThiÕt cÊp 6" },
                 { gdp = { 2, 1, 1113, 1 }, name = "§¹i §Þnh Hån", nExpired = 7 * 24 * 60 * 60 },
            --	    {gdp={2, 1, 30344, 3}, name="ThÇn Tµi B¶o R­¬ng"},
        }
    }
    LIB_Award:Award(tbAward)
    LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
    LIB_Award.szLogAction = "NhËn thµnh c«ng sö dông 4000 mçi lo¹i"
    SetTask(TSK_EVENTCHINH_MORONG, SetBit(GetTask(TSK_EVENTCHINH_MORONG), 4, 1))
end

function _fast_finish_phucsinh_pet_lan2()

    --local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
    --if nLan2_GetQuest >= 2 then
    --   return  Talk(1,"", "§¹i hiÖp ®· hoµn thµnh chuçi nhiÖm vô Phôc Sinh lÇn 2 cho B¹n §ång Hµnh!")
    --elseif nLan2_GetQuest < 1 then
    --    Talk(1,"", "§¹i hiÖp ch­a nhËn nhiÖm vô Phôc Sinh lÇn 2 cho B¹n §ång Hµnh !!!!")
    --    return 0
    --end
    local nPSLan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
    local nPSLan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1)/1000000000)
    if nPSLan1 < 1 then
        Talk(1,"", "H·y phôc sinh B¹n §ång Hµnh cña §¹i hiÖp lÇn 1 tr­íc!")
        return 0
    end
    if nPSLan2 >= 1 then
        Talk(1,"", "B¹n ®ång hµnh cña §¹i hiÖp ®· phôc sinh lÇn 2 råi, ®· qu¸ m¹nh råi!")
        return 0
    end

    if GetItemCount(2,1,30370) < 15 then
        Talk(1,"", "§¹i hiÖp kh«ng mang ®ñ 15 Thiªn M«n Kim LÖnh!")
        return 0
    end
    if GetItemCount(2,95,204) < 15 then
        Talk(1,"", "§¹i hiÖp kh«ng mang ®ñ 15 Thiªn Cang LÖnh!")
        return 0
    end

    if DelItem(2,1,30370,15) == 1 and DelItem(2,95,204,15) == 1 then
        VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10)	 --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 1 lµ ®· phôc sinh pet lÇn 2 thµnh c«ng
        VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10)	 --t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 2 lµ hoµn thµnh chuçi nhiÖm vô
        AddTitle(77, 1)	--title phôc sinh b¹n ®ång hµnh lÇn 2
        gf_WriteLogEx("PHUC SINH PET LAN 2", "Hoµn thµnh nhanh PS Pet lÇn 2", 1, "Hoµn thµnh nhanh nv PS Pet lÇn 2")
        Msg2Player("§¹i hiÖp hoµn thµnh nhanh nhiÖm vô Phôc Sinh lÇn 2 cho B¹n §ång Hµnh thµnh c«ng !!!!")
        Talk(1,"", "Chóc mõng, B¹n §ång Hµnh cña §¹i hiÖp ®· Phôc Sinh lÇn 2 thµnh c«ng!")

        LIB_Award.szLogTitle = "PHAN THUONG EVENT MO RONG"
        LIB_Award.szLogAction = "NhËn thµnh c«ng sö dông 4000 mçi lo¹i"
        SetTask(TSK_EVENTCHINH_MORONG, SetBit(GetTask(TSK_EVENTCHINH_MORONG), 4, 1))
    end
end

