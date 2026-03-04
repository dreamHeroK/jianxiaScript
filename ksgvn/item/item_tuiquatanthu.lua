Import("\\script\\ksgvn\\lib.lua")

function OnUse(nItemIdx)
    if not KsgLib:HasEnoughBagRoom(10, 500) then
        return
    end
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("C¸c h¹ cÇn gia nhËp m«n ph¸i míi cã thÓ më tói quµ nµy.")
    end

    local tbAward = {
        { nFunc = 'KsgAward:SetDieuDuong(9)' },
        { nFunc = 'KsgAward:SuperFactionBook(1)' },
        { tbProp = { 2, 1, 1006 }, nStatus = 4, nStack = 1 }, -- Cöu Thiªn V« Cùc §¬n
        { tbProp = { 2, 1, 50016 }, nStatus = 4, nStack = 10 }, -- Tói Quµ Vâ L©m
        { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R­¬ng YQ
        { tbProp = { 0, 105, 14 }, tbParam = { 3, 403 }, nStatus = 4 }, -- TuyÖt §Þa 100%
        { nReborn = 790 },
        { nGold = 1 }
    }

    if DelItemByIndex(nItemIdx, 1) == 1 then
        KsgAward:Give(tbAward, "Quµ T©n Thñ")
    end
end
