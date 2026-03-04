-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 五毒教NPC西图Script
-- By StarryNight
-- 2006/02/09 PM 15:19
-- ===================================================
function main()
	local t_dia_sel = {
		"<color=green>西图<color>：这汉人的书果然难懂，还是找勾册问一下吧……",
		"<color=green>西图<color>：这汉人的书果然难懂，还是找勾册问一下吧……"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;
