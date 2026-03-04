Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tShop = {
		[1] = {3056, 3058, 3060, 3062},
		[2] = {3057, 3059, 3061, 3063},
	}
	local nSex = GetSex();
	if not tShop[nSex] then return end
	local tSay = {
		format("TiÖm Trang BÞ T­íng Qu©n Háa Phông /#show_equip_shop(%d)", tShop[nSex][1]),
		format("TiÖm Háa Phông Nguyªn So¸i/#show_equip_shop(%d)", tShop[nSex][2]),
		format("TiÖm Trang Søc T­íng Qu©n Háa Phông/#show_equip_shop(%d)", tShop[nSex][3]),
		format("TiÖm Trang Søc Háa Phông Nguyªn So¸i/#show_equip_shop(%d)", tShop[nSex][4]),
		"\n rót lui/nothing",
	}
	Say("H·y chän tiÖm ®Ó ®æi:", getn(tSay), tSay);
end