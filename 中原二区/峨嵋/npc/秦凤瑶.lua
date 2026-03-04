-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 峨眉派NPC秦凤瑶Script
-- By StarryNight
-- 2006/02/09 PM 15:19
-- ===================================================
function main()
	local t_dia_sel = {
		"<color=green>秦凤瑶<color>：林师妹自从去了一趟襄阳城，回来后整个人都变了，莫不是有什么心事？",
		"<color=green>秦凤瑶<color>：师傅说，琴为心声。你能否听懂我的心声？",
		"<color=green>秦凤瑶<color>：这只乌衣曲，我已经练了二百遍，这回师父总该不会骂我了吧？"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;