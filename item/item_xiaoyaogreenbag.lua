-- åÐÒ£Íâ×°(ÂÌÉ«)
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tBox = {
    {
        {0,108,819,1,5},
        {0,108,824,1,5},
        {0,108,408,1,5},
        {0,108,398,1,5},
    },
    {
        {0,109,819,1,5},
        {0,109,824,1,5},
        {0,109,408,1,5},
        {0,109,398,1,5},
    },
    {
        {0,110,819,1,5},
        {0,110,824,1,5},
        {0,110,208,1,5},
        {0,110,198,1,5},
    },
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