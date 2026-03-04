Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")

SYKT_EQUIP = {
	{0, 153, 29, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 153, 30, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 153, 31, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 152, 29, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 152, 30, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 152, 31, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 154, 29, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 154, 30, 1, 1, -1, -1, -1, -1, -1, -1},
	{0, 154, 31, 1, 1, -1, -1, -1, -1, -1, -1},
}

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 100," ") ~= 1 then
		return 0;
	end
	local tbSay = {};
	tbSay.msg = format("%s NghÜ kü muèn ho¸n ®æi trang bÞ nµo ch­a?", gf_GetPlayerSexName());
	tbSay.sel = {};
	for i = 1, getn(SYKT_EQUIP) do
		local v = SYKT_EQUIP[i];
		local szItemName = GetItemName(v[1], v[2], v[3]);
		tinsert(tbSay.sel, {szItemName, format("#ExchangeSYKT('%s', %d, %d)", szItemName, nItem, i)});
	end
	tinsert(tbSay.sel, {"Ra khái","nothing"});
	temp_Talk(tbSay);
end

function ExchangeSYKT(szItemName, nItem, nIndex)
	Say(format("B¹n ch¾c ch¾n muèn ®æi <color=gold>%s<color> kh«ng?", szItemName), 2,
		format("§ång ý/#ExchangeSYKT_sure('%s', %d, %d)", szItemName, nItem, nIndex), "Hñy bá/nothing")
end

function ExchangeSYKT_sure(szItemName, nItem, nIndex)
	if gf_Judge_Room_Weight(1, 100) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	if not SYKT_EQUIP[nIndex] then
		return 0;
	end
	gf_AddItemEx2(SYKT_EQUIP[nIndex], szItemName, "Tói trang bÞ Th­îng D­¬ng Khai Th¸i", "Ho¸n ®æi trang bÞ Kim Xµ", 0, 1);
end