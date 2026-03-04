--小包五彩神石
Import("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  		Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
  		return 0;
	end
	if DelItem(2,1,30901,1) == 1 then
		AddItem(2,1,30900,10);
	end
end