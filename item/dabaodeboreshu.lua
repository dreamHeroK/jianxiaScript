
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(2,0,398,100)
		Msg2Player("Äã»ñµÃÁË100¿Å°ãÈôÊ÷");
		
	end;
end;