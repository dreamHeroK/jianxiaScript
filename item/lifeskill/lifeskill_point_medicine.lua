
tTab =
{
	{2, 111, 104, "祝余草露", 1, },
	{2, 111, 105, "游龙精露", 2, },
}

function OnUse(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == G and value[2] == D and value[3] == P then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	style = tTab[nTabIndex][5]
	UsePackToItem(nItemIndex, style)
end


function UsePackToItem(nItemIndex, style)
	local sItemName, g, d, p = get_item_info(nItemIndex)
	if style == 1 then
	elseif style == 2 then
		local nCur, nMax = ModifyEnergy(0,1);
		if nCur == nMax then
			Talk(1,"", "当前无需增加精力。")
			return 0
		end
		if (DelItem(g, d, p, 1) == 1) then
			local nCanGive = nMax - nCur;
			ModifyEnergy(min(nCanGive, 100), 1);
		end
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end