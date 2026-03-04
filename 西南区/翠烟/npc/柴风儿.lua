

function main()
	local t_dia_sel = {
		"<color=green>柴风儿<color>：我想做自由自在的风，像风一样无声无息地吹过，像风一样在这个世间任意穿梭。",
		"<color=green>柴风儿<color>：我想做自由自在的风，像风一样无声无息地吹过，像风一样在这个世间任意穿梭。"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
