function main()

  Say("<color=green>狂侠沈风<color>：先问过我的大刀。",
		2,
		"打开商店/#show_equip_shop(1)",
		"结束对话/no")


end;
function no()
end

g_tEquipShop = {
	[1] = {109, "侠义令商店-风"},
};

function show_equip_shop(nIdx)
	if not g_tEquipShop[nIdx] then return end

	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", g_tEquipShop[nIdx][1], g_tEquipShop[nIdx][2]));
end