--新手上衣包
--by 
--2020/05/12

function OnUse(nItemIndex)	 
	local nBody = GetBody();
	local nID3 = 0;
	if nBody == 1 then
		nID3  = 1
	elseif nBody == 2 then
		nID3  = 19
	elseif nBody == 3 then
		nID3  = 37
	elseif nBody == 4 then
		nID3  = 55
	end

	if DelItemByIndex(nItemIndex,1) == 1 then
		local nRet, nItemIdx = 0, 0
		local name = GetItemName(0,101,nID3)
		nRet, nItemIdx = AddItem(0,101,nID3,1,1,2,12,-1,-1,-1,-1);
		Msg2Player("您获得了["..name.."]×1");
	end
end
