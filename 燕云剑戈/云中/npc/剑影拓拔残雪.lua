function main()

  Say("<color=green>剑影拓拔残雪<color>：我拓拔残雪只效力于世间最强的太英雄。你可是那个人?",
		2,
		"打开商店/#show_equip_shop(1)",
		"结束对话/no")


end;
function no()
end

g_tEquipShop = {
	[1] = {111, "侠义令商店-雪"},
};

function show_equip_shop(nIdx)
	if not g_tEquipShop[nIdx] then return end

	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", g_tEquipShop[nIdx][1], g_tEquipShop[nIdx][2]));
end