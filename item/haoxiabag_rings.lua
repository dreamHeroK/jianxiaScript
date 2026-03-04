-- 豪侠首饰包
-- 能开出随机的豪侠首饰
-- 豪侠戒	{0, 102, 31126},
-- 豪侠佩	{0, 102, 31127},
Import("\\script\\lib\\globalfunctions.lua")

local tRings = {
    {0, 102, 31126, 1, 4, "H祇 Hi謕 Gi韎"},
    {0, 102, 31127, 1, 4, "H祇 Hi謕 B閕"},
}

function OnUse(nItemIdx)
    if gf_JudgeRoomWeight(1,10,"") == 0 then
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0;
    end;
    local randIdx = random(1,getn(%tRings))
    local t = %tRings[randIdx]
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_AddItemEx({t[1],t[2],t[3],t[4],t[5]}, t[6]);
	end;
end;