-- ÊØËê×°ÀñºÐ
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tBox = {
    {
        {0,108,905,1,5},
        {0,108,906,1,5},
        {0,108,907,1,5},
        {0,108,908,1,5},
    },
    {
        {0,109,905,1,5},
        {0,109,906,1,5},
        {0,109,907,1,5},
        {0,109,908,1,5},
    },
    {
        {0,110,905,1,5},
        {0,110,906,1,5},
        {0,110,907,1,5},
        {0,110,908,1,5},
    }
}

function OnUse(nItemIndex)
    if gf_JudgeRoomWeight(3, 100) ~= 1 then
        Talk(1,"","Hµnh trang kh«ng ®ñ chç, kh«ng thÓ më!")
        return 
    end
    local sex = GetBody()
    if DelItemByIndex(nItemIndex, 1) == 1 then
        for i = 1, getn(tBox) do
            local item = tBox[i][sex]
            AddItem(item[1],item[2],item[3],item[4],item[5])
        end
    end
end