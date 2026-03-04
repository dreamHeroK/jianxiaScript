function OnUse(nItem)
	Say(format("§ång ý më %s kh«ng?", GetItemName(nItem)), 
		2, format("X¸c ®Þnh më/#OpenGempag(%d)", nItem), "\nT«i chØ xem xem th«i/nothing");
end

function OpenGempag(nItem)
	local nP = GetItemParticular(nItem);
	local tItem = {
		[30998] = 1,
		[30999] = 2,
		[31000] = 3,
		[31001] = 4,
		[31024] = 5,
		[31123] = 6,
		[31505] = 7,
	}
	local nRet = random(1, 4) * 100 + tItem[nP];
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 22, nRet, 1, 4);
	Msg2Player(format("NhËn ®­îc %s*%d", GetItemName(2, 22, nRet), 1));
end