Import("\\script\\ksgvn\\lib.lua")

_g_tbCoPho = {
    50030,
    50031,
    50040,
    50050,
    50060,
    50070,
    50071,
    50080,
    50090,
    50091,
    50100,
    50110,
    50120,
    50130,
    50140,
    50150,
    50160,
    50170,
    50180,
    50190,
    50200,
    50210,
    50220,
    50230,
    50240,
}

function OnUse(nItemIdx)
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    local nItemId = KsgLib:RandomTableValue(_g_tbCoPho)
    local tbAward = {
        { tbProp = {GENRE_ITEM_OTHER, ITEM_OD_MYSTERY, nItemId}, nStatus = 1 },
    }
    if DelItemByIndex(nItemIdx, 1) == 1 then
        KsgAward:Give(tbAward, "Tói Cæ Phæ Tµn QuyÓn")
    end
end
