-- Update dame cho TYLL
Import("\\script\\lib\\globalfunctions.lua")
g_tInfo = {
    [PackItemId(2, 20, 1)] = 50,
    [PackItemId(2, 20, 2)] = 75,
    [PackItemId(2, 20, 3)] = 100,
    [PackItemId(2, 20, 4)] = 125,
    [PackItemId(2, 20, 5)] = 150,
    [PackItemId(2, 20, 6)] = 300,
    [PackItemId(2, 20, 7)] = 350,
    [PackItemId(2, 20, 8)] = 400,
    [PackItemId(2, 20, 9)] = 450,
    [PackItemId(2, 20, 10)] = 500,
    [PackItemId(2, 20, 11)] = 550,
    [PackItemId(2, 20, 12)] = 800,
    [PackItemId(2, 20, 13)] = 850,
    [PackItemId(2, 20, 14)] = 900,
    [PackItemId(2, 20, 15)] = 950,
    [PackItemId(2, 20, 16)] = 1000,
    [PackItemId(2, 20, 17)] = 1050,
    [PackItemId(2, 20, 18)] = 1500,
    [PackItemId(2, 20, 19)] = 1550,
    [PackItemId(2, 20, 20)] = 1600,
    [PackItemId(2, 20, 21)] = 1650,
    [PackItemId(2, 20, 22)] = 1700,
    [PackItemId(2, 20, 23)] = 1800,
    [PackItemId(2, 20, 24)] = 2400,
}
g_nStateID = 2 * 12345 + 20 * 100;

function OnEquip(nItemIndex)
    local nG, nD, nP = GetItemInfoByIndex(nItemIndex);
    local nDame = g_tInfo[PackItemId(nG, nD, nP)];
    gf_SetTaskByte(1538, 1, 0);	
    if not nDame then
        return 0;
    end

    CastState("state_damage_point", nDame, -1, 1, g_nStateID)
    return 1;
end

function OnUnEquip(nItemIndex)
    RemoveState(g_nStateID)
    return 0;
end

function OnUse()
gf_SetTaskByte(1538, 1, 0);	
end

function CanEquip()
end
