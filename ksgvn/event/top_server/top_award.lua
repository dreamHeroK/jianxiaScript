Import("\\script\\ksgvn\\lib.lua")

TopAward = TopAward or {}

function TopAward:Gem(nLevel, nNum)
    KsgAward:ReceiveGem(nLevel, nNum)
end

function TopAward:KimXaTuChon(nLevel, nUpgradeLevel, bCanClose)
    KsgAward:MenuKimXaTuChon(nLevel, nUpgradeLevel, bCanClose)
end

function TopAward:VKAmHuyet(nLevel)
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32164,
        [ROUTE_CONLON_KIEMTON] = 32192,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'NhÀn VÚ Kh› »m Huy’t')
    end
    KsgItem:AddWeaponByRouteIndex(30884, 4, nLevel, 'NhÀn VÚ Kh› »m Huy’t')
end

function TopAward:SuperFactionBook(nCount, szLogTitle)
    KsgAward:SuperFactionBook(nCount, szLogTitle)
end

function TopAward:UyHoSoai(nLevel)
    KsgItem:AddBattleSuit_UyHo_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING)
end

function TopAward:UyHoTuong(nLevel)
    KsgItem:AddBattleSuit_UyHo_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING)
end

function TopAward:ThanhLongTuong(nLevel)
    KsgItem:AddBattleSuit_ThanhLong_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING)
end

function TopAward:ChienCuong(nLevel)
    nLevel = nLevel or 9
    KsgAward:SetChienCuong(nLevel)
end

function TopAward:SetVanSuc(nLevel)
    KsgAward:SetVanSuc(nLevel)
end

function TopAward:ThuongHaiChau(nLevel, nCount, nStatus)
    KsgAward:ThuongHaiChau(nLevel, nCount, nStatus)
end

function TopAward:ManhKx7Random(nCount)
    local tbAward = { tbProp = { 2, 1, random(31397, 31399) }, nStatus = 4, nStack = nCount } -- M∂nh Kim Xµ 7 Ng…u Nhi™n
    KsgAward:Give(tbAward, "Th≠Îng ßua TOP")
end

function TopAward:VanSuc4Random()
    local tbAward = { tbProp = { 2, 1, random(31405, 31409) }, nStatus = 4, nStack = 1 } -- Khæc b∂n hoµn m¸ c p 4
    KsgAward:Give(tbAward, "Th≠Îng ßua TOP")
end
