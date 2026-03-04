-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 武当派NPC张午阳Script
-- By StarryNight
-- 2006/02/09 PM 15:19
-- ===================================================
function main()
	local t_dia_sel = {
		"<color=green>张午阳<color>：凡事不成规矩，无以论方圆。关手武当的一些事宜你尽可发问。",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;