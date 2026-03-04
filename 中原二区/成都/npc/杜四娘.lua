--生产技能戒子材料制作
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>х T?Nng<color>: ";

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	local tSay = {
		format("\nTi謒 Linh у Gi韎 Ch?#show_equip_shop(%d)", 3044),
		--format("\n豪侠装备商店/#show_equip_shop(%d)", 3045),
		--format("\n高级材料商店/#show_equip_shop(%d)", 3043),
		"\nT玦 ch?xem xem th玦/nothing",
	}		
	Say(DSN_NPC..format("%s c?th?gi髉 頲 g?kh玭g?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
