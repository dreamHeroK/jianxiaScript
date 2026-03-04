-- 2019³ÆºÅ½Å±¾(ÈýÓ¢³ÆºÅ,Ê®É±³ÆºÅ,°ÙÆÆ³ÆºÅ,Ç§¾ü³ÆºÅ,ÍòÓÂ³ÆºÅ,ÎÞË«³ÆºÅ)

Include("\\script\\lib\\title.lua");

tTab =
{
	{2, 95, 240, "ÈýÓ¢³ÆºÅ", 31, 1, 1, 7},
	{2, 95, 241, "Ê®É±³ÆºÅ", 31, 2, 1, 7},
	{2, 95, 242, "°ÙÆÆ³ÆºÅ", 31, 3, 1, 7},
	{2, 95, 243, "Ç§¾ü³ÆºÅ", 31, 4, 1, 7},
	{2, 95, 244, "ÍòÓÂ³ÆºÅ", 31, 5, 1, 7},
	{2, 95, 245, "ÎÞË«³ÆºÅ", 31, 6, 1, 7},
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
