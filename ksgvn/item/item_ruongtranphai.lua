Import("\\script\\ksgvn\\lib.lua")


function OnUse(nItemIdx)
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("Ch­a gia nhËp m«n ph¸i, kh«ng thÓ më r­¬ng nµy!")
    end
    local nBookId = KsgLib:RandomTableValue(g_tbFactionBook_Master)
    local tbAward = {
        { tbProp = {GENRE_ITEM_EQUIP, EQUIP_TYPE_EXTEND_BOOK, nBookId}, nStatus = 1 },
    }
    if DelItemByIndex(nItemIdx, 1) == 1 then
        KsgAward:Give(tbAward, "R­¬ng TrÊn Ph¸i")
    end
end
