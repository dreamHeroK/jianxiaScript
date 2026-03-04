-- ÐÜÃ¨³èÎïºÐ×Ó
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function OnUse(nItemIndex)
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","Hµnh trang kh«ng ®ñ chç, kh«ng thÓ më!")
        return 
    end
    local nP = GetItemParticular(nItemIndex)
    local nTime = -1
    if nP == 31323 then
        nTime = 604800
    end
    if DelItemByIndex(nItemIndex , 1) == 1 then
        local cnt,idx = AddItem(0, 105, 150, 1, 3, -1, -1, -1, -1, -1, -1)
        if nTime ~= -1 then
            SetItemExpireTime(idx, nTime)
        end
    end
end