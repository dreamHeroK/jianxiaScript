Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")

SYKT_EQUIP = {
    {0,	154, 32, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	154, 33, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	154, 34, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	152, 32, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	152, 33, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	152, 34, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	153, 32, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	153, 33, 1, 1, -1, -1, -1, -1, -1, -1},
    {0,	153, 34, 1, 1, -1, -1, -1, -1, -1, -1},
}

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 100," ") ~= 1 then
		return 0;
	end
	local tbSay = {};
	local isBind = GetItemSpecialAttr(nItem,"BIND")
	tbSay.msg = format("%s NghÜ kü muèn ho¸n ®æi trang bÞ nµo ch­a?", gf_GetPlayerSexName());
	tbSay.sel = {};
	for i = 1, getn(SYKT_EQUIP) do
		local v = SYKT_EQUIP[i];
		local szItemName = GetItemName(v[1], v[2], v[3]);
		tinsert(tbSay.sel, {szItemName, format("#ExchangeTGTY('%s', %d, %d, %d)", szItemName, nItem, i, isBind)});
	end
	tinsert(tbSay.sel, {"Ra khái","nothing"});
	temp_Talk(tbSay);
end

function ExchangeTGTY(szItemName, nItem, nIndex, isBind)
	Say(format("B¹n ch¾c ch¾n muèn ®æi <color=gold>%s<color> kh«ng?", szItemName), 2,
		format("§ång ý/#ExchangeTGTY_sure('%s', %d, %d, %d)", szItemName, nItem, nIndex, isBind), "Hñy bá/nothing")
end

function ExchangeTGTY_sure(szItemName, nItem, nIndex, isBind)
	if gf_Judge_Room_Weight(1, 100) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	if not SYKT_EQUIP[nIndex] then
		return 0;
	end
	if isBind == 1 then 
		SYKT_EQUIP[nIndex][5] = 4
	else
		SYKT_EQUIP[nIndex][5] = 1
	end
	gf_AddItemEx2(SYKT_EQUIP[nIndex], szItemName, "Th«n NguyÖt LÖnh", "Ho¸n ®æi trang bÞ Kim Xµ", 0, 1);
end