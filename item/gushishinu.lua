-- 梏矢石砮
-- 增加现有任一势力声望

Include("\\script\\lib\\popularity.lua");

tTab =
{
	{2, 111, 25, "梏矢石砮(蓝)", 10},
	{2, 111, 26, "梏矢石砮(橙)", 20},
	{2, 111, 27, "梏矢石砮(赤)", 40},
	{2, 111, 28, "梏矢石砮(金)", 80},
}

function OnUse(nItemIndex)
	local _, G, D, P = get_item_info(nItemIndex)
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
	local val = tTab[nTabIndex][5]
	do_receive_camp_july(nItemIndex, val)
end


function do_receive_camp_july(nItemIndex, val)
	local _, G, D, P = get_item_info(nItemIndex)
	for i = 0, getn(tbPop) do
		local nPopId, strPopName = tbPop[i][1], tbPop[i][2]
		if GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
			AddPop(i,val)
			tPop = 1
		end
	end
	if tPop == 1 then
		DelItem(G, D, P, 1)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function no()
end
