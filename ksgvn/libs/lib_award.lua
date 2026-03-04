Include("\\script\\ksgvn\\award_types\\award_exp.lua")
Include("\\script\\ksgvn\\award_types\\award_gold.lua")
Include("\\script\\ksgvn\\award_types\\award_pet.lua")
Include("\\script\\ksgvn\\award_types\\award_phonghoa.lua")
Include("\\script\\ksgvn\\award_types\\award_popur.lua")
Include("\\script\\ksgvn\\award_types\\award_popur2.lua")
Include("\\script\\ksgvn\\award_types\\award_repute.lua")
Include("\\script\\ksgvn\\award_types\\award_honor.lua")
Include("\\script\\ksgvn\\award_types\\award_energy.lua")
Include("\\script\\ksgvn\\award_types\\award_faction_point.lua")
Include("\\script\\ksgvn\\award_types\\award_battle_point.lua")
Include("\\script\\ksgvn\\award_types\\award_chan_khi.lua")
Include("\\script\\ksgvn\\award_types\\award_item.lua")
Include("\\script\\ksgvn\\award_types\\award_func.lua")
Include("\\script\\ksgvn\\award_types\\award_custom.lua")
Include("\\script\\ksgvn\\award_types\\award_collection_coin.lua")
Include("\\script\\ksgvn\\award_types\\award_meridian_level.lua")
Include("\\script\\ksgvn\\award_types\\award_reborn.lua")
Include("\\script\\ksgvn\\award_types\\award_reborn_custom.lua")

KsgAward = KsgAward or {}
KsgAward.TYPES = {}

function KsgAward:RegType(szKey, pClass)
    KsgAward.TYPES[szKey] = pClass
end

function KsgAward:GiveByRandom(tbItem, tbLogTitle, nAwardCount)
    if not tbItem then
        return
    end
    local nRateTotal = 10000000
    local nRandom = random(1, nRateTotal)
    local nStep = 0
    for i = 1, getn(tbItem) do
        nStep = nStep + floor(tbItem[i].nRate * nRateTotal / 100);
        if (nRandom <= nStep) then
            return self:Give(tbItem[i], tbLogTitle, nAwardCount)
        end
    end
end

function KsgAward:Give(tbItem, szLogTitle, nAwardCount)
    if not tbItem then
        return
    end
    nAwardCount = nAwardCount or 1
    if type(tbItem[1]) == "table" then
        if tbItem[1].nRate then
            for _ = 1, nAwardCount do
                self:GiveByRandom(tbItem, szLogTitle, 1)
            end
            return 1
        else
            for i = 1, getn(tbItem) do
                self:Give(tbItem[i], szLogTitle, nAwardCount)
            end
            return 1
        end
    else
        for k, v in self.TYPES do
            if tbItem[k] then
                v:Give(tbItem, szLogTitle, nAwardCount)
                return 1
            end
        end
    end
end

-- Registers

KsgAward:RegType(AwardExp.szKey, AwardExp)
KsgAward:RegType(AwardGold.szKey, AwardGold)
KsgAward:RegType(AwardPet.szKey, AwardPet)
KsgAward:RegType(AwardPhongHoa.szKey, AwardPhongHoa)
KsgAward:RegType(AwardPopur.szKey, AwardPopur)
KsgAward:RegType(AwardPopur2.szKey, AwardPopur2)
KsgAward:RegType(AwardRepute.szKey, AwardRepute)
KsgAward:RegType(AwardHonor.szKey, AwardHonor)
KsgAward:RegType(AwardEnergy.szKey, AwardEnergy)
KsgAward:RegType(AwardFactionPoint.szKey, AwardFactionPoint)
KsgAward:RegType(AwardBattlePoint.szKey, AwardBattlePoint)
KsgAward:RegType(AwardChanKhi.szKey, AwardChanKhi)
KsgAward:RegType(AwardItem.szKey, AwardItem)
KsgAward:RegType(AwardFunc.szKey, AwardFunc)
KsgAward:RegType(AwardCustom.szKey, AwardCustom)
KsgAward:RegType(AwardCollectionCoin.szKey, AwardCollectionCoin)
KsgAward:RegType(AwardMeridianLevel.szKey, AwardMeridianLevel)
KsgAward:RegType(AwardReborn.szKey, AwardReborn)
KsgAward:RegType(AwardRebornCustom.szKey, AwardRebornCustom)

function KsgAward:SuperFactionBook(nCount, szLogTitle, nStatus, nQuality)
    nQuality = nQuality or 0
    local nRoute = KsgPlayer:GetRoute()
    local nBookId = g_tbFactionBook_Super[nRoute]
    if not nBookId then
        return
    end
    local tbAward = {
        tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, nBookId }, nStatus = nStatus or 1, nQuality = nQuality, nStack = nCount or 1
    }
    self:Give(tbAward, szLogTitle)
end

function KsgAward:AddKimXa(nItemLevel, nUpgradeLevel, nType, nStatus, szLogTitle)
    if not KsgLib:HasEnoughBagRoom(3, 3 * 100) then
        return
    end
    if not KsgLib:IsInRange(nItemLevel, 1, 8) then
        print("[KsgAward] NhËn kim xµ level kh«ng hîp lÖ " .. nItemLevel)
        return
    end
    nType = nType or 0
    local nDetailedId
    if nItemLevel < 3 then
        nDetailedId = nItemLevel
    end
    if nItemLevel == 3 then
        nDetailedId = random(3, 9)
    end
    if nItemLevel == 4 then
        nDetailedId = 26
    end
    if nItemLevel == 5 then
        nDetailedId = 29
    end
    if nItemLevel == 6 then
        nDetailedId = 32
    end
    if nItemLevel == 7 then
        nDetailedId = 35
    end 
    if nItemLevel == 8 then
        nDetailedId = 38
    end
    nStatus = nStatus or 4
    local nFeed = 0
    if KsgPlayer:IsGM() and nStatus == 4 then
        nFeed = 1000000
    end
    if KsgLib:GetServerId() == 100 then
        nFeed = 1000000
    end
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_CAPE, nDetailedId + nType }, nLevel = nUpgradeLevel, nStatus = nStatus, nFeed = nFeed },
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BADGE, nDetailedId + nType }, nLevel = nUpgradeLevel, nStatus = nStatus, nFeed = nFeed },
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_FOOT, nDetailedId + nType }, nLevel = nUpgradeLevel, nStatus = nStatus, nFeed = nFeed },
    }
    self:Give(tbAward, szLogTitle or "NhËn Kim Xµ cÊp " .. nItemLevel)
end

function KsgAward:ReceiveGem(nLevel, nAmount, nStatus)
    nLevel = nLevel or 1
    if nLevel < 1 or nLevel > 8 then
        return
    end
    nStatus = nStatus or 4
    nAmount = nAmount or 1
    if not KsgLib:HasEnoughBagRoom(floor(nAmount / 100), nAmount) then
        return
    end
    local tbAward = {}
    tinsert(tbAward, { tbProp = { 2, 22, 100 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- HuyÕt TrÝch Th¹ch
    tinsert(tbAward, { tbProp = { 2, 22, 200 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- NguyÖt B¹ch Th¹ch
    tinsert(tbAward, { tbProp = { 2, 22, 300 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- Hæ Ph¸ch Th¹ch
    tinsert(tbAward, { tbProp = { 2, 22, 400 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- H¾c DiÖu Th¹ch
    self:Give(tbAward, "NhËn §¸ Kh¶m")
end

function KsgAward:SetChienCuong(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return
    end
    nStatus = nStatus or 4
    local nRoute = KsgPlayer:GetRoute()
    nLevel = nLevel or 0

    if not g_tbEquipSet_ChienCuong[nRoute] then
        return KsgNpc:Talk("Ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn th­ëng!")
    end
    if nRoute > 30 then
        KsgItem:AddSuit(g_tbEquipSet_ChienCuong[nRoute].nEquipStartId, nLevel, 'NhËn bé chiÕn cuång', nStatus)
        KsgItem:AddWeaponByRoute(g_tbEquipSet_ChienCuong[nRoute].nWeaponId, nStatus, nLevel, 'NhËn bé chiÕn cuång')
    else
        KsgItem:AddSuitByRoute(g_tbEquipSet_ChienCuong[nRoute].nEquipStartId, nLevel, 'NhËn bé chiÕn cuång', nStatus)
        KsgItem:AddWeaponByBodyIndex(g_tbEquipSet_ChienCuong[nRoute].nWeaponId, nStatus, nLevel, 'NhËn bé chiÕn cuång')
    end
end

function KsgAward:SetDieuDuong(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return
    end
    nStatus = nStatus or 4
    local nRoute = KsgPlayer:GetRoute()
    nLevel = nLevel or 0

    if not g_tbEquipSet_DieuDuong[nRoute] then
        return KsgNpc:Talk("Ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn th­ëng!")
    end
    KsgItem:AddSuitByRoute(g_tbEquipSet_DieuDuong[nRoute].nEquipStartId, nLevel, 'NhËn bé diÖu d­¬ng', nStatus)
    KsgItem:AddWeaponByRoute(g_tbEquipSet_DieuDuong[nRoute].nWeaponId, nStatus, nLevel, 'NhËn bé diÖu d­¬ng')
    KsgItem:AddJewelry(3190, 5, "NhËn bé diÖu d­¬ng")
end

function KsgAward:MenuKimXaTuChon(nLevel, nUpgradeLevel, bCanClose)
    nUpgradeLevel = nUpgradeLevel or 0
    local tSay = {
        "Chän <color=yellow>1 bé trang bÞ Kim xµ d­íi ®©y<color>, h·y suy nghÜ kü tr­íc khi chän!<enter><color=red>(L­u ý: NÕu rêi trß ch¬i trong khi chän sÏ mÊt phÇn th­ëng nµy)",
    }
    for nType, szName in g_tbKimXaCfg[nLevel] do
        tinsert(tSay, format("Ta muèn nhËn bé %s/#KsgAward:AddKimXa(%d, %d, %d)", szName, nLevel, nUpgradeLevel, nType))
    end
    if bCanClose then
        tinsert("\n§ãng/no")
    end
    KsgNpc:SayDialog(tSay)
end

function KsgAward:SetVanSuc(nLevel, nAmount, nStatus)
    nLevel = nLevel or 1
    nAmount = nAmount or 1
    nStatus = nStatus or 4
    if not KsgLib:HasEnoughBagRoom(nAmount) then
        return
    end
    if nLevel < 1 or nLevel > 4 then
        return
    end
    local nStart, nEnd = 31068, 31072
    if nLevel == 2 then
        nStart, nEnd = 31073, 31077
    end
    if nLevel == 3 then
        nStart, nEnd = 31261, 31265
    end
    if nLevel == 4 then
        nStart, nEnd = 31405, 31409
    end
    local tbAward = { }
    for i = nStart, nEnd do
        tinsert(tbAward, {
            { tbProp = { 2, 1, i }, nStack = nAmount, nStatus = nStatus }
        })
    end
    self:Give(tbAward, 'NhËn V¨n Søc Lv' .. nLevel)
end

function KsgAward:ThuongHaiChau(nLevel, nAmount, nStatus)
    nAmount = nAmount or 1
    nStatus = nStatus or 4
    local nPStart = 219
    if nStatus == 4 then
        nPStart = 208
    end
    if not KsgLib:HasEnoughBagRoom(floor(nAmount / 100)) then
        return
    end
    if nLevel < 1 or nLevel > 7 then
        return
    end
    self:Give({ tbProp = { 2, 102, nPStart + nLevel - 1 }, nStack = nAmount, nStatus = nStatus }, 'NhËn Th­¬ng H¶i Di Ch©u Lv' .. nLevel)

end

function KsgAward:TuiQua(nAmount, nNoLimit)
    local nVersion, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return
    end
    if KsgLib:GetServerId() >= 100 then
        return
    end
    nAmount = nAmount or 1
    if not KsgLib:HasEnoughBagRoom(1, 0, nil) then
        return
    end
    local nMonth = tonumber(date("%m"))
    if KsgTask:Get(TASKID_TUIQUA_VOLAM_VERSION) ~= nMonth then
        KsgItem:DeleteAll(2, 1, 50016) -- xãa toµn bé tói quµ vµo cuèi th¸ng, tr¸nh tÝch tr÷
        KsgTask:Set(TASKID_TUIQUA_VOLAM_VERSION, nMonth)
    end

    if nNoLimit then
        local tbAward = {
            { tbProp = { 2, 1, 50016 }, nStack = nAmount },
        }
        return self:Give(tbAward, 'NhËn Tói Quµ Vâ L©m')
    end

    local nLimit = TUIQUA_DAILY_MAX
    local nWeek = tonumber(date("%w"))
    if (nWeek == 6 or nWeek == 0) then
        nLimit = nLimit * TUIQUA_WEEKEND_LIMIT_RATE
    end

    if KsgPlayer:IsVipAccount() then
        nLimit = nLimit * TUIQUA_VIP_BONUS_RATE
    end

    local nCurDayCount = KsgTask:Get(TASKID_TUIQUA_VOLAM_NUM)
    if nAmount <= 0 or nCurDayCount > nLimit then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 50016 }, nStack = nAmount },
    }
    KsgTask:Modify(TASKID_TUIQUA_VOLAM_NUM, nAmount)
    self:Give(tbAward, 'NhËn Tói Quµ Vâ L©m 2')
    KsgPlayer:Msg(format("H«m nay cßn cã thÓ nhËn %d/%d Tói Quµ Vâ L©m", nLimit - nCurDayCount - nAmount, nLimit))
end

function KsgAward:DropEventBox(nAmount)
    nAmount = nAmount or 1
    local tbAward = {
        { tbProp = { 2, 1, 50263 }, nStack = nAmount },
    }
    self:Give(tbAward, 'NhËn Hép Quµ Sù KiÖn')
end 
