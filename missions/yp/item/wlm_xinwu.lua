Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("Sö dông nhËn ®­îc<color=yellow>5 ®iÓm<color>danh väng thÕ lùc#cã sö dông kh«ng#",
		2,
		"\n§óng/confirm_use",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

function confirm_use()
	local nCount = GetItemCount(tPVPItemInfo[5][2],tPVPItemInfo[5][3],tPVPItemInfo[5][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"Sö dông bao nhiªu?")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[5][2],tPVPItemInfo[5][3],tPVPItemInfo[5][4]);
	if nNum < nCount then
		Talk(1,"","VËt phÈm trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	if DelItem(tPVPItemInfo[5][2],tPVPItemInfo[5][3],tPVPItemInfo[5][4],nCount) == 1 then
		yp_setValue(5,5*nCount);
	end
end