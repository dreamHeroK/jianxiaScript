Import("\\script\\isolate\\functions\\tong_title\\head.lua")

function OnUse(nItem)
	Say(format("X¸c ®Þnh sö dông %s kh«ng?", GetItemName(nItem)), 
		2, format("§ång ý/#UseBglp(%d)", nItem), "T¹i h¹ chØ xem qua th«i/nohitng");	
end

function UseBglp(nItem)
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	add_tong_gxd(100)
	Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm ®é cèng hiÕn bang héi", 100));
end