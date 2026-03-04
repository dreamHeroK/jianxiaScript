-- °ï»áÊ³Îï(Î÷¾©Ñ©Àæ,ÎäÀÉ´¶±ý,ß¥Èâ·Û¸þ,ÌÇ³´°åÀõ,ÃÛ¼åÏãÒ©,ÉÕÈâ¸É¸¬)
-- Ôö¼ÓÒ»ÖÖÊÆÁ¦ÉùÍû

Include("\\script\\lib\\popularity.lua");

tTab =
{
	{2, 111, 130, "Î÷¾©Ñ©Àæ", 150, 6},
	{2, 111, 131, "ÎäÀÉ´¶±ý", 150, 7},
	{2, 111, 132, "ß¥Èâ·Û¸þ", 150, 8},
	{2, 111, 133, "ÌÇ³´°åÀõ", 150, 9},
	{2, 111, 134, "ÃÛ¼åÏãÒ©", 150, 10},
	{2, 111, 135, "ÉÕÈâ¸É¸¬", 150, 12},
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
	local pop = tTab[nTabIndex][6]
	do_receive_camp_july(nItemIndex, val, pop)
end


function do_receive_camp_july(nItemIndex, val, pop)
	local _, G, D, P = get_item_info(nItemIndex)
	local nPopId, strPopName = tbPop[pop][1], tbPop[pop][2]
	if GetTask(nPopId) >= 40001 then
		Talk(1, "", "ÄúµÄ"..strPopName.."ÒÑ´ïµ½¡¾ÍòÈË¾´Ñö¡¿£¬ÒÑÎÞ·¨Ôö¼Ó¸ÃÊÆÁ¦ÉùÍû¡£")
		return 0
	end
	if GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
		AddPop(pop,val)
		tPop = 1
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
