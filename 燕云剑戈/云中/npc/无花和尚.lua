function main()

  Say("<color=green>无花和尚<color>：心若无花，何故惹尘，既已入地狱，何不度众生。",
		2,
		"打开商店/#show_equip_shop(1)",
		"结束对话/no")


end;
function no()
end

g_tEquipShop = {
	[1] = {110, "侠义令商店-花"},
--	[1] = {44, "剑网2紫光阁商店(戒指及武器)"},
	
};

function show_equip_shop(nIdx)
	if not g_tEquipShop[nIdx] then return end

	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", g_tEquipShop[nIdx][1], g_tEquipShop[nIdx][2]));
end