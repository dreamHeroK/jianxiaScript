Include("\\script\\online_activites\\201508\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201508_ID) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	if VET_201508_Item1UseTime()<VET_201508_GetItem1MaxUseTime() then
		Talk(1,"",format("Sˆ dÙng ÆÒ %d %s vµ %d %s mÌi Æ≠Óc dÔng!", 2000, "B„ Hoa Sen HÂng", 2000, "B„ Hoa Sen Træng"));
		return 0
	end
	if VET_201508_Item2UseTime()<VET_201508_GetItem2MaxUseTime() then
		Talk(1,"",format("Sˆ dÙng ÆÒ %d %s vµ %d %s mÌi Æ≠Óc dÔng!", 2000, "B„ Hoa Sen HÂng", 2000, "B„ Hoa Sen Træng"));
		return 0
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end