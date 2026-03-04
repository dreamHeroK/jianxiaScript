
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 少林派玄明脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
function main()
	local t_dia_sel = {
		"<color=green>玄明<color>：戒律院上下恭迎施主，敞堂可以提供一些少林典章供施主查阅！",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;