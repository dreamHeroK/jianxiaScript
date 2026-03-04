
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 少林门派任务伙工头脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
function main()
	local t_dia_sel = {
		"<color=green>伙工头<color>：这里有啥好看的，离远点……",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;