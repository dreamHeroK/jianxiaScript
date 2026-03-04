--新手头饰包
--by 
--2020/05/12

function OnUse(nItemIndex)	 
	local nBody = GetBody();
	local nID3 = 0;
	if nBody == 1 then
		nID3  = 2
	elseif nBody == 2 then
		nID3  = 20
	elseif nBody == 3 then
		nID3  = 38
	elseif nBody == 4 then
		nID3  = 56
	end

	if DelItemByIndex(nItemIndex,1) == 1 then
		local nRet, nItemIdx = 0, 0
		local name = GetItemName(0,103,nID3)
		nRet, nItemIdx = AddItem(0,103,nID3,1,1,2,12,-1,-1,-1,-1);
		Msg2Player("您获得了["..name.."]×1");
	end
end
