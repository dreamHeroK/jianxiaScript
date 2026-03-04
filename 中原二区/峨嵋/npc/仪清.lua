-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 峨眉派NPC仪清Script
-- By StarryNight
-- 2006/02/09 PM 15:19
-- ===================================================
function main()
	local t_dia_sel = {
		"<color=green>仪清<color>：秉承师尊旨意，通达峨媚精义。",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;