function main()

  Say("<color=green>连珠仙子胧月<color>：据说，释迦牟尼了悟的那棵菩提树，前生是一个爱他的女子......无花。无论你要做何事，我都助你。",
		2,
		"打开商店/#show_equip_shop(1)",
		"结束对话/no")


end;
function no()
end

g_tEquipShop = {
	[1] = {112, "侠义令商店-月"},
};

function show_equip_shop(nIdx)
	if not g_tEquipShop[nIdx] then return end

	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", g_tEquipShop[nIdx][1], g_tEquipShop[nIdx][2]));
end

