BbrAward = {}

function BbrAward:GiveRandomWeapon(nLevel)
    if nLevel < 7 or nLevel > 9 then
        return
    end

    local nWeaponId, nWeaponRoute = KsgLib:RandomTableValue(_g_tbWeapon, 1)
    if not nWeaponId then
        return
    end

    if nLevel > 7 then
        nWeaponId = nWeaponId + abs(nLevel - 7)
    end

    if not _g_tbWeaponAttribute[nLevel] then
        return
    end

    local tbWeaponAttrCfgList = _g_tbWeaponAttribute[nLevel]
    local tbParam = { -1, -1, -1, -1, -1, -1 }
    for i = 1, 6 do
        if mod(i, 2) == 0 then
            local tbWeaponRandomAttr, nAttrCfgIndex = KsgLib:Random(tbWeaponAttrCfgList)
            while not tbWeaponRandomAttr or KsgLib:IsInTable(tbWeaponRandomAttr.nAttributeId, tbParam) do
                tbWeaponRandomAttr, nAttrCfgIndex = KsgLib:Random(tbWeaponAttrCfgList)
            end

            local tbWeaponRandomAttrLevel = KsgLib:Random(tbWeaponRandomAttr.tbLevelCfg)
            tbParam[i] = tbWeaponRandomAttr.nAttributeId
            tbParam[i - 1] = tbWeaponRandomAttrLevel.nLevel
        end
    end
    local tbAward = {
        tbProp = { GENRE_ITEM_EQUIP, nWeaponRoute, nWeaponId }, tbParam = tbParam, nStatus = 1,
    }
    KsgAward:Give(tbAward)
end

function BbrAward:VKAmHuyet(nLevel)
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32164,
        [ROUTE_CONLON_KIEMTON] = 32192,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 1, nLevel, 'NhÀn VÚ Kh› »m Huy’t')
    end
    KsgItem:AddWeaponByRouteIndex(30884, 1, nLevel, 'NhÀn VÚ Kh› »m Huy’t')
end

function BbrAward:SuperFactionBook(nCount, szLogTitle)
    KsgAward:SuperFactionBook(nCount, szLogTitle, 1, "%s Æ∑ nhÀn Æ≠Óc %d %s tı B∏ch B∂o R≠¨ng")
end

function BbrAward:GiveRandomBookPet(nLevel)
    if not _g_tbPetBookRates[nLevel] then
        return
    end

    local tbBookPetCfg = _g_tbPetBookRates[nLevel]
    local tbRandomBookPet = KsgLib:Random(tbBookPetCfg)

    while not tbRandomBookPet do
        tbRandomBookPet = KsgLib:Random(tbBookPetCfg)
    end

    local tbAward = { tbProp = { GENRE_ITEM_OTHER, 150, tbRandomBookPet.nBookId }, nStatus = 1, nStack = 1 }
    KsgAward:Give(tbAward, "B∏ch b∂o r≠¨ng - Th≠Îng may mæn - Pet Book lv " .. nLevel)
end

function BbrAward:RandomVanSuc(nLevel)
    if nLevel < 2 or nLevel > 4 then
        return
    end
    local nStart, nEnd = 31073, 31077 -- Khæc b∂n c p 2
    if nLevel == 3 then
        nStart, nEnd = 31261, 31265
    end
    if nLevel == 4 then
        nStart, nEnd = 31405, 31409
    end
    local tbAward = { tbProp = { 2, 1, random(nStart, nEnd) }, nStatus = 1, nStack = 1 }
    KsgAward:Give(tbAward, "B∏ch b∂o r≠¨ng - Th≠Îng may mæn - Khæc b∂n c p " .. nLevel)
end