-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC尤榕Script
-- By StarryNight
-- 2006/02/09 PM 15:03
-- ==================================================

function main()

	local t_dia_sel = {
		"<color=green>尤榕<color>：总算又有进帐了，今晚一定好好的赌他一把！",
		"<color=green>尤榕<color>：总算又有进帐了，今晚一定好好的赌他一把！"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;
