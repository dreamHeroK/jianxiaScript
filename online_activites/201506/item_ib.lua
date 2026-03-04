Include("\\script\\online_activites\\201506\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201506_ID) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	if VET_201506_Item1UseTime()<VET_201506_GetItem1MaxUseTime() then
		Talk(1,"",format("Sˆ dÙng ÆÒ %d %s vµ %d %s mÌi Æ≠Óc dÔng!", 2000, "B∂o ßÂ S¨ C p", 2000, "B› MÀt Tµng B∂o ßÂ"));
		return 0
	end
	if VET_201506_Item2UseTime()<VET_201506_GetItem2MaxUseTime() then
		Talk(1,"",format("Sˆ dÙng ÆÒ %d %s vµ %d %s mÌi Æ≠Óc dÔng!", 2000, "B∂o ßÂ S¨ C p", 2000, "B› MÀt Tµng B∂o ßÂ"));
		return 0
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end