
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 少林门派任务香客脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
function main()
	local t_dia_sel = {
		"<color=green>拜山香客<color>：敬佛最重要的是心诚！这碗腊八粥还是我自己吃了吧。",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;