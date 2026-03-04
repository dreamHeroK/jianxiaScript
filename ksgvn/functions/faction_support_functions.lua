Import("\\script\\ksgvn\\lib.lua")

function factionSupport_IsTodayReceived()
    local today = tonumber(date('%d'))
    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_FACTION_SUPPORT) == today then
        return 1
    end
    return nil
end

function factionSupport_SetLimit()
    if KsgPlayer:IsAdmin() then
        return
    end
    local nDate = tonumber(date('%d'))
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_FACTION_SUPPORT, nDate)
    KsgNpc:Talk("Hç trî m«n ph¸i mçi ngµy chØ ®­îc nhËn 1 lÇn, xin h·y gi÷ g×n cÈn thËn, ®õng ®Ó l·ng phÝ!")
end

function factionSupport_TLT()
    if not KsgLib:HasEnoughBagRoom(2, 1) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 3, 4 }, nStatus = 4, nStack = 99 },
        { tbProp = { 2, 3, 12 }, nStatus = 4, nStack = 99 },
    }
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_DuongMon()
    if not KsgLib:HasEnoughBagRoom(11, 1) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 3, 6 }, nStatus = 4, nStack = 999 }
    }
    for i = 1, 9 do
        tinsert(tbItemSupport, {
            tbProp = { 2, 11, i }, nStatus = 4, nStack = 2000
        })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_NgaMiKiem()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    KsgAward:Give({ tbProp = { 2, 3, 7 }, nStatus = 4, nStack = 200 })
    factionSupport_SetLimit()
end

g_tbHorseAttribute = {
    { "T¨ng sinh lùc 4000 ®iÓm", 4000, 2, 486 },
    { "Ngo¹i c«ng t¨ng 4 %", 1500, 1, 261 },
    { "Ngo¹i c«ng t¨ng 8 %", 4, 2, 261 },
    { "T¨ng tèc ®é xuÊt chiªu 6 %", 1, 1, 24 },
    { "T¨ng tèc ®é xuÊt chiªu 9 %", 1, 2, 24 },
    { "Hç trî mËt tÞch t¨ng thªm 4 %", 1, 1, 564 },
    { "Hç trî mËt tÞch t¨ng thªm 5 %", 1, 2, 564 },
    { "T¨ng sinh lùc 1000 ®iÓm", 100, 1, 486 },
    { "Néi phßng, ngo¹i phßng t¨ng 98 ®iÓm", 1500, 5, 420 },
    { "Néi lùc tiªu hao 15 %", 1000, 2, 443 },
    { "X¸c suÊt gi¶m nöa thä th­¬ng 10 %", 900, 1, 302 },
    { "Kh¸ng tÊt c¶ 10 ®iÓm", 990, 2, 329 },
    { "Lùc tÊn c«ng D­¬ng Gia B«n Lang Th­¬ng t¨ng 15 %", 1, 1, 323 },
    { "Lùc tÊn c«ng D­¬ng Gia To¸i Kim TiÔn t¨ng 15 %", 1, 1, 325 },
}

function factionSupport_DGT()
    if not KsgLib:HasEnoughBagRoom(1, 10) then
        return
    end

    if BigGetItemCount(0, 105, 38) == 0 then
        local nRand = gf_GetRandItemByTable(g_tbHorseAttribute, 10000, 1)
        KsgAward:Give({ tbProp = { 0, 105, 38 }, nStatus = 4, tbParam = { 1, 306, 6, 404, g_tbHorseAttribute[nRand][3], g_tbHorseAttribute[nRand][4] } })
        factionSupport_SetLimit()
    end
end

function factionSupport_DGC()
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 15, 10 }, nStack = 2000, nStatus = 4 }
    }

    if BigGetItemCount(0, 105, 38) == 0 then
        local nRand = gf_GetRandItemByTable(g_tbHorseAttribute, 10000, 1)
        tinsert(tbItemSupport, { tbProp = { 0, 105, 38 }, nStatus = 4, tbParam = { 1, 306, 6, 404, g_tbHorseAttribute[nRand][3], g_tbHorseAttribute[nRand][4] } })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_HiepDoc()
    if not KsgLib:HasEnoughBagRoom(5, 100) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 1, 6, 34 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 46 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 84 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 153 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 154 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 150 }, nStack = 2, nStatus = 4 },
    }
    if KsgLib:GetSrvCfg("bOpenTestCard") == 1 then
        tinsert(tbItemSupport, { tbProp = { 1, 6, 150 }, nStack = 30, nStatus = 4 })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_TaDoc()
    if not KsgLib:HasEnoughBagRoom(32, 1) then
        return
    end
    local tbItemSupport = {}
    for i = 1, 31 do
        tinsert(tbItemSupport, {
            tbProp = { 2, 17, i }, nStatus = 4, nStack = 200
        })
    end
    if BigGetItemCount(2, 0, 1063) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 0, 1063 }, nStatus = 4
        })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_CLKT()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    local tbItemSupport = {}
    if BigGetItemCount(2, 20, 100) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 20, 100 }, nStatus = 4
        })
    end
    if BigGetItemCount(2, 201, 21) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 201, 21 }, nStatus = 4
        })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_ThuyYenLinhNu()
    local tbSay = {
        g_szTitle .. "Thao t¸c TiÓu §iªu",
        "NhËn TiÓu §iªu/factionSupport_NhanTieuDieu",
        "Nu«i TiÓu §iªu/factionSupport_NuoiTieuDieu",
        "HuÊn luyÖn TiÓu §iªu/factionSupport_HuanLuyenTieuDieu",
        "Trë l¹i/no",
    }
    KsgNpc:SayDialog(tbSay)
end

function factionSupport_NhanTieuDieu()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    KsgAward:Give({ tbProp = { 2, 20, random(1, 5) }, nStatus = 4 })
    factionSupport_SetLimit()
end

function factionSupport_NuoiTieuDieu()
    if not KsgLib:HasEnoughBagRoom(11, 1) then
        return
    end
    local tbItemSupport = {}
    for i = 6, 12 do
        if i == 11 then
            tinsert(tbItemSupport, { tbProp = { 2, 97, i }, nStatus = 4 })
        else
            tinsert(tbItemSupport, { tbProp = { 2, 97, i }, nStatus = 4, nStack = 100 })
        end
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_HuanLuyenTieuDieu()
    local nPetItemIndex = GetPlayerEquipIndex(12)
    if (nPetItemIndex == nil or nPetItemIndex <= 0) then
        return KsgPlayer:Msg("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!")
    end
    local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex)
    if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil) or (ItemGen ~= 2 or ItemDetail ~= 20)
    then
        return KsgPlayer:Msg("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!")
    end

    for _ = 1, 84 do
        LevelUpPet(nPetItemIndex)
    end
    factionSupport_SetLimit()
end