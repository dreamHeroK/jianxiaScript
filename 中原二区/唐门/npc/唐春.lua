

function main()

	local t_dia_sel = {
		"<color=green>唐春<color>：你去机关房找唐云主管问问，看看这些化骨粉到底怎么用比较好。",
		"<color=green>唐春<color>：你去机关房找唐云主管问问，看看这些化骨粉到底怎么用比较好。"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;

