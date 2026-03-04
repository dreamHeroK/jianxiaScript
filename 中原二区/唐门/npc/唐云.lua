Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local t_dia_sel = {
		"<color=green>唐云<color>：天海这孩子，最近看我眼神怪怪的，只怕有些问题。",
		"<color=green>唐云<color>：暗器房和火器房明争暗斗，管也不是，不管也不是，真是叫我机关房好生为难。",
		"<color=green>唐云<color>：有我唐云在，外人想要踏进唐门，那是比登天还难。",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
