
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(3600000)
		Msg2Player("你打开紫金大红包获得360金");
		WriteLog("[礼金]:"..GetName().."打开紫金大红包");
	end;
end;