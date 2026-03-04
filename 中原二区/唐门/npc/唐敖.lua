Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local t_dia_sel = {
		"<color=green>唐敖<color>：唐门经了江湖数百年历练，却也渐渐名声在外了。",
		"<color=green>唐敖<color>：唐门经了江湖数百年历练，却也渐渐名声在外了。"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
