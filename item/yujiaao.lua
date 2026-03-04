-- Óæ¼Ò°ÁÀñºÐ
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tBox = {
    {
        {0,119,323,1,4},
        {0,119,324,1,4},
        {0,119,325,1,4},
        {0,119,326,1,4},
    },
    {
        {0,120,323,1,4},
        {0,120,324,1,4},
        {0,120,325,1,4},
        {0,120,326,1,4},
    },
    {
        {0,121,323,1,4},
        {0,121,324,1,4},
        {0,121,325,1,4},
        {0,121,326,1,4},
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