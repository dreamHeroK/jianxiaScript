
Import("\\script\\lib\\globalfunctions.lua");

function OnUse(nIndex)
    local tItem = {
        {0,	120, 279, 1, 4},
        {0,	120, 280, 1, 4},
        {0,	120, 281, 1, 4},
        {0,	120, 282, 1, 4},
    }
    local nSex = GetBody()
    if DelItemByIndex(nIndex, 1) == 1 then
        gf_AddItemEx(tItem[nSex], "KhØ Trém Chuèi")
    end
end