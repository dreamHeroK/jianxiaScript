
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(9990000)
		Msg2Player("你打开黄金大红包获得999金");
		WriteLog("[礼金]:"..GetName().."打开黄金大红包");
	end;
end;