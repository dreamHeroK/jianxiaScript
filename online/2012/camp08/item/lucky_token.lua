Include("\\script\\lib\\globalfunctions.lua")

--прткаНеф
function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local tAward = {
        	{2, 2000, 400000, 1},
        	{2, 2000, 1000000, 1},
		{3, 3000, 10000, 1},
		{3, 3000, 50000, 1},
		{1, 5000, "прткрЬ╠р" ,{2,95,198,1,1},0},
		{1, 2000, "пртк╫П╠р" ,{2,95,197,1,1},0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "прткаНеф", "©╙фТпрткаНеф")
end
