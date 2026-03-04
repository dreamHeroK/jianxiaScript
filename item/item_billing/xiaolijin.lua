
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(880000);
		Msg2Player("打开小红包获得88个金子");
		WriteLog("[礼金]:"..GetName().."开启小红包获得88个金子");
	end
end;