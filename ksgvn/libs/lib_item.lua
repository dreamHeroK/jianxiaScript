KsgItem = KsgItem or {}

function KsgItem:IsDinhHon(nEquipIDX, nLevel)
    local nFlag = GetItemSpecialAttr(nEquipIDX, "DING" .. nLevel)
    return nFlag == 1 or nil
end

function KsgItem:GetEnhanceLevel(nEquipIDX)
    return GetEquipAttr(nEquipIDX, 2) or 0
end

function KsgItem:GetEnhanceLevel(nEquipIDX)
    return GetEquipAttr(nEquipIDX, 2) or 0
end

function KsgItem:GetPosByDetail(nD)
    local tbItem2Pos = {
        [EQUIP_TYPE_CAP] = EQUIP_POS_CAP,
        [EQUIP_TYPE_BODY] = EQUIP_POS_BODY,
        [EQUIP_TYPE_PANTS] = EQUIP_POS_PANTS,
        [EQUIP_TYPE_RING] = EQUIP_POS_RING1,
        [EQUIP_TYPE_COAT_CAP] = EQUIP_POS_COAT_CAP,
        [EQUIP_TYPE_COAT_CLOTH] = EQUIP_POS_COAT_CLOTH,
        [EQUIP_TYPE_COAT_TROUSERS] = EQUIP_POS_COAT_TROUSERS,
        [EQUIP_TYPE_EXTEND_BOOK] = EQUIP_POS_EXTEND_BOOK,
        [EQUIP_TYPE_HORSE] = EQUIP_POS_HORSE,
        [EQUIP_TYPE_BOOK] = EQUIP_POS_BOOK,
        [EQUIP_TYPE_CAPE] = EQUIP_POS_CAPE,
        [EQUIP_TYPE_BADGE] = EQUIP_POS_BADGE,
        [EQUIP_TYPE_FOOT] = EQUIP_POS_FOOT,
    }
    if not nD then
        return
    end
    if 0 <= nD and 15 >= nD then
        return EQUIP_POS_WEAPON
    end
    return tbItem2Pos[nD]
end

function KsgItem:GetGDPByDetail(nType)
    local nPos = KsgItem:GetPosByDetail(nType)
    local nEquipIdx = GetPlayerEquipIndex(nPos)
    if nEquipIdx ~= 0 then
        return GetItemInfoByIndex(nEquipIdx)
    end
    return -1, -1, -1
end

function KsgItem:GetName(...)
    local nArgSize = getn(arg)
    if nArgSize == 1 then
        local param1 = arg[1]
        if type(param1) == "table" then
            local nG, nD, nP = KsgLib:UnPack(param1)
            if nG == 2 and nD == 1 and nP == 30230 then
                return "Xu"
            end
            return GetItemName(nG, nD, nP) or "Kh«ng râ"
        end
        if type(param1) == "number" then
            return GetItemName(param1) or "Kh«ng râ"
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = KsgLib:UnPack(arg)
        return GetItemName(nG, nD, nP) or "Kh«ng râ"
    end
    return "Kh«ng râ"
end

function KsgItem:Delete(...)
    local nArgSize = getn(arg)
    if nArgSize == 2 then
        local tbItem = arg[1]
        local nCount = arg[2]
        if type(tbItem) == "table" and type(nCount) == "number" then
            local nG, nD, nP = KsgLib:UnPack(tbItem)
            return DelItem(nG, nD, nP, nCount)
        end
    end
    if nArgSize == 4 then
        local nG, nD, nP, nCount = KsgLib:UnPack(arg)
        return DelItem(nG, nD, nP, nCount)
    end
    return nil
end

function KsgItem:DeleteByIndex(nItemIndex, bForceDel)
    local nMode = 1
    if bForceDel then
        nMode = -1
    end
    return DelItemByIndex(nItemIndex, nMode)
end

function KsgItem:Count(...)
    local nArgSize = getn(arg)
    if nArgSize == 1 then
        local tbItem = arg[1]
        if type(tbItem) == "table" then
            local nG, nD, nP = KsgLib:UnPack(tbItem)
            return GetItemCount(nG, nD, nP)
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = KsgLib:UnPack(arg)
        return GetItemCount(nG, nD, nP)
    end
    return 0
end

function KsgItem:CountAll(...)
    local nArgSize = getn(arg)
    if nArgSize == 1 then
        local tbItem = arg[1]
        if type(tbItem) == "table" then
            local nG, nD, nP = KsgLib:UnPack(tbItem)
            return BigGetItemCount(nG, nD, nP)
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = KsgLib:UnPack(arg)
        return BigGetItemCount(nG, nD, nP)
    end
    return 0
end

function KsgItem:DeleteAll(...)
    local nArgSize = getn(arg)
    if nArgSize == 1 then
        local tbItem = arg[1]
        if type(tbItem) == "table" then
            local nG, nD, nP = KsgLib:UnPack(tbItem)
            local nCount = KsgItem:CountAll(nG, nD, nP)
            return BigDelItem(nG, nD, nP, nCount)
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = KsgLib:UnPack(arg)
        local nCount = KsgItem:CountAll(nG, nD, nP)
        return BigDelItem(nG, nD, nP, nCount)
    end
    return nil
end

function KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, nType, szLogTitle)
    nStatus = nStatus or 4
    nLevel = nLevel or 0
    local nBody = KsgPlayer:GetBody()
    local nPosition = nBody - 1
    local nSetId = nStartId + nPosition
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, nType, nSetId }, nStatus = nStatus, nLevel = nLevel },
    }
    KsgAward:Give(tbAward, szLogTitle)
end

function KsgItem:AddOnceByRoute(nStartId, nStatus, nLevel, nType, szLogTitle)
    nStatus = nStatus or 4
    nLevel = nLevel or 0
    local nPosition = KsgPlayer:GetRouteBodyOffset()
    local nSetId = nStartId + nPosition
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, nType, nSetId }, nStatus = nStatus, nLevel = nLevel },
    }
    KsgAward:Give(tbAward, szLogTitle)
end

function KsgItem:AddOnce(nSetId, nStatus, nLevel, nType, szLogTitle)
    nStatus = nStatus or 4
    nLevel = nLevel or 0
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, nType, nSetId }, nStatus = nStatus, nLevel = nLevel },
    }
    KsgAward:Give(tbAward, szLogTitle)
end

--------Normal
function KsgItem:AddCap(nSetId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnce(nSetId, nStatus, nLevel, EQUIP_TYPE_CAP, szLogTitle)
end

function KsgItem:AddCloth(nSetId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnce(nSetId, nStatus, nLevel, EQUIP_TYPE_BODY, szLogTitle)
end

function KsgItem:AddShoe(nSetId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnce(nSetId, nStatus, nLevel, EQUIP_TYPE_PANTS, szLogTitle)
end

function KsgItem:AddSuit(nSetId, nLevel, szLogTitle, nStatus)
    nStatus = nStatus or 4
    KsgItem:AddCap(nSetId, nStatus, nLevel, szLogTitle)
    KsgItem:AddCloth(nSetId, nStatus, nLevel, szLogTitle)
    KsgItem:AddShoe(nSetId, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddSuitByRouteOffset(nStartSetId, nLevel, szLogTitle, nStatus)
    nStatus = nStatus or 4
    local nRouteOffset = KsgItem:RouteOffset()
    local nBodyOffset = KsgPlayer:GetRouteBodyOffset()
    KsgItem:AddSuit(nStartSetId + nRouteOffset + nBodyOffset, nLevel, szLogTitle, nStatus)
end

function KsgItem:AddWeaponByRouteOffset(nStartSetId, nLevel, szLogTitle, nStatus)
    nStatus = nStatus or 4
    local nRouteOffset = KsgItem:RouteOffset()
    local nBodyOffset = KsgPlayer:GetRouteBodyOffset()
    KsgItem:AddWeaponByRoute(nStartSetId + nRouteOffset + nBodyOffset, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddJewelry(nStartRingId, nQuantity, szLogTitle, nStatus)
    nQuantity = nQuantity or 1
    nStatus = nStatus or 4
    if type(nStartRingId) == "table" then
        local tbAward = {}
        for i = 1, getn(nStartRingId) do
            tinsert(tbAward, { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_RING, nStartRingId[i] }, nStatus = nStatus })
        end
        KsgAward:Give(tbAward, szLogTitle or "AddJewelry")
        return
    end
    if type(nStartRingId) == "number" then
        local tbAward = {}
        for i = nStartRingId, nStartRingId + nQuantity - 1 do
            tinsert(tbAward, { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_RING, i }, nStatus = nStatus })
        end
        KsgAward:Give(tbAward, szLogTitle or "AddJewelry")
    end
end

--------Route
function KsgItem:AddCapByRoute(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByRoute(nStartId, nStatus, nLevel, EQUIP_TYPE_CAP, szLogTitle)
end

function KsgItem:AddClothByRoute(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByRoute(nStartId, nStatus, nLevel, EQUIP_TYPE_BODY, szLogTitle)
end

function KsgItem:AddShoeByRoute(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByRoute(nStartId, nStatus, nLevel, EQUIP_TYPE_PANTS, szLogTitle)
end

function KsgItem:AddSuitByRoute(nStartId, nLevel, szLogTitle, nStatus)
    nStatus = nStatus or 4
    KsgItem:AddCapByRoute(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddClothByRoute(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddShoeByRoute(nStartId, nStatus, nLevel, szLogTitle)
end

-- Weapon
function KsgItem:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle)
    nStatus = nStatus or 4
    nLevel = nLevel or 0
    local nWeaponType = KsgPlayer:GetWeaponTypeByRoute()
    if nWeaponType then
        local tbAward = {
            { tbProp = { GENRE_ITEM_EQUIP, nWeaponType, nWeaponId }, nStatus = nStatus, nLevel = nLevel },
        }
        KsgAward:Give(tbAward, szLogTitle)
    end
end

function KsgItem:AddWeaponByRouteIndex(nWeaponSetStartId, nStatus, nLevel, szLogTitle)
    local nWeaponId = nWeaponSetStartId + KsgPlayer:GetRouteIndex() - 1
    KsgItem:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddJewelryByRoute(nStartId, szLogTitle, nStatus)
    nStatus = nStatus or 4
    local nPosition = KsgPlayer:GetRouteBodyOffset()
    local nSetId = nStartId + nPosition
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_RING, nSetId }, nStatus = nStatus },
    }
    KsgAward:Give(tbAward, szLogTitle)
end

--------Body
function KsgItem:AddCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_CAP, szLogTitle)
end

function KsgItem:AddClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_BODY, szLogTitle)
end

function KsgItem:AddShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_PANTS, szLogTitle)
end

function KsgItem:AddCoatCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_COAT_CAP, szLogTitle)
end

function KsgItem:AddCoatClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_COAT_CLOTH, szLogTitle)
end

function KsgItem:AddCoatShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_COAT_TROUSERS, szLogTitle)
end

function KsgItem:AddOrnCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_ORNAMENT_CAP, szLogTitle)
end

function KsgItem:AddOrnClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_ORNAMENT_CLOTH, szLogTitle)
end

function KsgItem:AddOrnShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOnceByBody(nStartId, nStatus, nLevel, EQUIP_TYPE_ORNAMENT_FOOT, szLogTitle)
end

function KsgItem:AddSuitByBody(nStartId, nLevel, szLogTitle, nStatus)
    nStatus = nStatus or 4
    KsgItem:AddCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddCoatByBody(nStartId, nStatus, nLevel, szLogTitle)
    nStatus = nStatus or 4
    KsgItem:AddCoatCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddCoatClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddCoatShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddOrnByBody(nStartId, nStatus, nLevel, szLogTitle)
    nStatus = nStatus or 4
    KsgItem:AddOrnCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOrnClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    KsgItem:AddOrnShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddJewelryByBody(nStartRingId, nQuantity, szLogTitle, nStatus)
    nStartRingId = nStartRingId + nQuantity * (KsgPlayer:GetBody() - 1)
    KsgItem:AddJewelry(nStartRingId, nQuantity, szLogTitle, nStatus)
end

-- Weapon
function KsgItem:AddWeaponByBodyIndex(nWeaponSetStartId, nStatus, nLevel, szLogTitle)
    local nWeaponId = nWeaponSetStartId + KsgPlayer:GetRouteBodyOffset()
    KsgItem:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle)
end

function KsgItem:AddHorse(nHorseId, nStatus, nExpiredTime, szLogTitle)
    nStatus = nStatus or 1
    nExpiredTime = nExpiredTime or 0
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_HORSE, nHorseId }, nStatus = nStatus, nExpiredTime = nExpiredTime },
    }
    KsgAward:Give(tbAward, szLogTitle)
end

function KsgItem:AddBattleSuit_ThanhLong_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ThanhLong.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_ThanhLong.LIEU.SOAI
    end
    KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_ThanhLong_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ThanhLong.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_ThanhLong.LIEU.TUONG
    end
    KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_UyHo_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_UyHo.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_UyHo.LIEU.TUONG
    end
    KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_UyHo_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_UyHo.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_UyHo.LIEU.SOAI
    end
    KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_ChuTuoc_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ChuTuoc.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_ChuTuoc.LIEU.TUONG
    end
    KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_ChuTuoc_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ChuTuoc.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_ChuTuoc.LIEU.SOAI
    end
    KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
end

function KsgItem:AddBattleItemByRoute(tbCfg, nLevel, nGiveType)
    nGiveType = nGiveType or BATTLE_ITEM_TYPE_SUIT_RING_WEAPON
    local nRouteIndex = KsgPlayer:GetRouteIndex()
    local nRoute = KsgPlayer:GetRoute()
    local tbNewFaction = {
        [ROUTE_DUONGMON_NHAMHIEP] = 1,
        [ROUTE_CONLON_KIEMTON] = 2,
    }
    if tbNewFaction[nRoute] and tbCfg.newFactionCfg then
        local nConfigIndex = tbNewFaction[nRoute]
        tbCfg = tbCfg.newFactionCfg
        if nGiveType > 0 then
            local nItemId = tbCfg.clothesCfg[nConfigIndex]
            KsgItem:AddCap(nItemId, 4, nLevel)
            KsgItem:AddCloth(nItemId, 4, nLevel)
            KsgItem:AddShoe(nItemId, 4, nLevel)
        end
        if nGiveType > 1 then
            local ringCfg = tbCfg.ringCfg[nConfigIndex]
            for ringId = ringCfg.nStart, ringCfg.nEnd do
                KsgItem:AddJewelry(ringId)
            end
        end
        if nGiveType > 2 then
            local weaponID = tbCfg.weaponCfg[nConfigIndex]
            KsgItem:AddWeaponByRoute(weaponID, 4, nLevel)
        end
        return
    end
    if nGiveType > 0 then
        for i = 1, getn(tbCfg.clothesCfg) do
            local nItemId = KsgLib:GetValueFromRange(nRouteIndex, tbCfg.clothesCfg[i].nStart, tbCfg.clothesCfg[i].nEnd)
            if nItemId > 0 then
                KsgItem:AddCap(nItemId, 4, nLevel)
                KsgItem:AddCloth(nItemId, 4, nLevel)
                KsgItem:AddShoe(nItemId, 4, nLevel)
            end
        end
    end
    if nGiveType > 1 then
        for i = 1, getn(tbCfg.ringCfg) do
            local nRingId = KsgLib:GetValueFromRange(nRouteIndex, tbCfg.ringCfg[i].nStart, tbCfg.ringCfg[i].nEnd)
            if nRingId > 0 then
                KsgItem:AddJewelry(nRingId)
            end
        end
    end
    if nGiveType > 2 then
        for i = 1, getn(tbCfg.weaponCfg) do
            local nItemId = KsgLib:GetValueFromRange(nRouteIndex, tbCfg.weaponCfg[i].nStart, tbCfg.weaponCfg[i].nEnd)
            if tbCfg.weaponCfg[i].nEndExt then
                nItemId = tbCfg.weaponCfg[i].nEndExt
            end
            if nItemId and nItemId > 0 then
                KsgItem:AddWeaponByRoute(nItemId, 4, nLevel)
            end
        end
    end
end

function KsgItem:RouteOffset(nRoute, bNotIncludeNewFaction)
    nRoute = nRoute or KsgPlayer:GetRoute()
    if bNotIncludeNewFaction and (nRoute == ROUTE_DUONGMON_NHAMHIEP or nRoute == ROUTE_CONLON_KIEMTON) then
        return nil
    end
    return g_tbFactionRoutes_Offset[nRoute]
end

function KsgItem:AddBattleSuit_HoaPhung_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_HoaPhung.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_HoaPhung.LIEU.TUONG
    end
    KsgItem:AddHoaPhungItemByRoute(tbCfg, 3, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_HoaPhung_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_HoaPhung.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_HoaPhung.LIEU.SOAI
    end
    KsgItem:AddHoaPhungItemByRoute(tbCfg, 4, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_ThuongUng_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ThuongUng.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_ThuongUng.LIEU.TUONG
    end
    KsgItem:AddCommonSuit(tbCfg, 3, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_ThuongUng_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ThuongUng.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_ThuongUng.LIEU.SOAI
    end
    KsgItem:AddCommonSuit(tbCfg, 4, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_NguLong_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_NguLong.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_NguLong.LIEU.TUONG
    end
    KsgItem:AddCommonSuit(tbCfg, 3, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_ThienChi_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_ThienChi.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_ThienChi.LIEU.TUONG
    end
    KsgItem:AddCommonSuit(tbCfg, 3, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_LoiHo_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_LoiHo.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_LoiHo.LIEU.TUONG
    end
    KsgItem:AddCommonSuit(tbCfg, 3, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_LoiHo_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_LoiHo.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_LoiHo.LIEU.SOAI
    end
    KsgItem:AddCommonSuit(tbCfg, 4, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_HanVu_Tuong(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_HanVu.TONG.TUONG
    else
        tbCfg = g_tbBattleSuit_HanVu.LIEU.TUONG
    end
    KsgItem:AddSpecialSuit(tbCfg, 3, nLevel, nGiveType)
end

function KsgItem:AddBattleSuit_HanVu_Soai(nLevel, nGiveType)
    nLevel = nLevel or 0
    local tbCfg = {}
    if KsgPlayer:GetHonor(1) >= 0 then
        tbCfg = g_tbBattleSuit_HanVu.TONG.SOAI
    else
        tbCfg = g_tbBattleSuit_HanVu.LIEU.SOAI
    end
    KsgItem:AddSpecialSuit(tbCfg, 4, nLevel, nGiveType)
end

function KsgItem:AddCommonSuit(tbCfg, nRingCount, nLevel, nGiveType)
    nGiveType = nGiveType or BATTLE_ITEM_TYPE_SUIT_RING
    if nGiveType > 0 then
        KsgItem:AddSuitByBody(tbCfg.nSuitId, nLevel)
    end
    if nGiveType > 1 then
        if nRingCount > 0 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId, 1)
        end
        if nRingCount > 1 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId + 4, 1)
        end
        if nRingCount > 2 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId + 8, 1)
        end
        if nRingCount > 3 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId + 12, 1)
        end
    end
end

function KsgItem:AddSpecialSuit(tbCfg, nRingCount, nLevel, nGiveType)
    nGiveType = nGiveType or BATTLE_ITEM_TYPE_SUIT_RING
    if nGiveType > 0 then
        KsgItem:AddSuit(tbCfg.nSuitId, nLevel)
    end
    if nGiveType > 1 then
        if nRingCount > 0 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId, 1)
        end
        if nRingCount > 1 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId + 4, 1)
        end
        if nRingCount > 2 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId + 8, 1)
        end
        if nRingCount > 3 then
            KsgItem:AddJewelryByBody(tbCfg.nRingStartId + 12, 1)
        end
    end
end

function KsgItem:AddHoaPhungItemByRoute(tbCfg, nRingCount, nLevel, nGiveType)
    nGiveType = nGiveType or BATTLE_ITEM_TYPE_SUIT_RING_WEAPON
    if not KsgPlayer:IsJoinedRoute() then
        return
    end
    nLevel = nLevel or 0

    local nRoute = KsgPlayer:GetRoute()
    local nRouteItemOffset = KsgItem:RouteOffset(nRoute, 1)
    if not nRouteItemOffset then
        local tbNewFactionCfg = tbCfg.NEWFACTION[nRoute]
        if nGiveType > 0 then
            KsgItem:AddSuit(tbNewFactionCfg.nStartEquipId, nLevel)
        end
        if nGiveType > 1 then
            KsgItem:AddJewelry(tbNewFactionCfg.nStartRingId, nRingCount, nLevel)
        end
        if nGiveType > 2 then
            KsgItem:AddWeaponByRoute(tbNewFactionCfg.nStartWeaponId, 4, nLevel)
        end
    else
        local nWeaponId = tbCfg.nStartWeaponId + nRouteItemOffset + KsgPlayer:GetRouteBodyOffset()
        local nStartEquipId = tbCfg.nStartEquipId + nRouteItemOffset
        local nStartRingId = tbCfg.nStartRingId + nRouteItemOffset
        if nGiveType > 0 then
            KsgItem:AddSuitByRoute(nStartEquipId, nLevel)
        end
        if nGiveType > 1 then
            if nRingCount > 0 then
                KsgItem:AddJewelryByRoute(nStartRingId, nLevel)
            end
            if nRingCount > 1 then
                KsgItem:AddJewelryByRoute(nStartRingId + 64)
            end
            if nRingCount > 2 then
                KsgItem:AddJewelryByRoute(nStartRingId + 128)
            end
            if nRingCount > 3 then
                KsgItem:AddJewelryByRoute(nStartRingId + 192)
            end
        end
        if nGiveType > 2 then
            KsgItem:AddWeaponByRoute(nWeaponId, 4, nLevel)
        end
    end
end
