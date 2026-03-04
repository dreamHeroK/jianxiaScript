Include("\\script\\equip_shop\\equip_shop_head.lua")

function main()
	local tShop = {
		[1] = {
			"店铺物品-女性华丽装备/#show_equip_shop(3055)",
			"店铺装备套装华丽装备/#show_equip_shop(3056)",
			"店铺华丽装备原石/#show_equip_shop(3058)",
			"店铺装备套装华丽装备/#show_equip_shop(3060)",
			"店铺华丽装备原石/#show_equip_shop(3062)",
			"我只是来逛逛/nothing",
		},
		[2] = {
			"店铺物品-女性华丽装备/#show_equip_shop(3055)",
			"店铺装备套装华丽装备/#show_equip_shop(3057)",
			"店铺华丽装备原石/#show_equip_shop(3059)",
			"店铺装备套装华丽装备/#show_equip_shop(3061)",
			"店铺华丽装备原石/#show_equip_shop(3063)",
			"我只是来逛逛/nothing",
		},
	}
	local nSex = GetSex();
	Say("<color=green>华丽装备商店：<color> 我可以为你提供什么帮助吗？", getn(tShop[nSex]), tShop[nSex])
end
