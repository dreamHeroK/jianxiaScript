-- 2019称号脚本(独步天下,名震海内,声名远扬,煮酒江湖)

Include("\\script\\lib\\title.lua");

tTab =
{
	{2, 95, 5359, "独步天下", 3, 75, 2, "20201231"},
	{2, 95, 5360, "名震海内", 3, 76, 2, "20201231"},
	{2, 95, 5361, "声名远扬", 3, 77, 2, "20201231"},
	{2, 95, 5362, "煮酒江湖", 3, 78, 2, "20201231"},
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
	local nGenre, nDetail, nTypeTime, nTime
	nGenre = tTab[nTabIndex][5]
	nDetail = tTab[nTabIndex][6]
	nTypeTime = tTab[nTabIndex][7]
	nTime = tTab[nTabIndex][8]
	do_receive_title(nItemIndex, nGenre, nDetail, nTypeTime, nTime)
end


function do_receive_title(nItemIndex, nGenre, nDetail, nTypeTime, nTime)
	local _, G, D, P = get_item_info(nItemIndex)
	if DelItem(G, D, P, 1) == 1 then
		gf_AddTitle(nGenre, nDetail, nTypeTime, nTime)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end
