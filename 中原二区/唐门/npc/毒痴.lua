--和毒痴对话
--created by lizhi
--2005-8-25 18:50

function main()
	local t_dia_sel = {
		"<color=green>毒痴<color>：毒可解，便可吃。",
		"<color=green>毒痴<color>：毒可解，便可吃。"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end