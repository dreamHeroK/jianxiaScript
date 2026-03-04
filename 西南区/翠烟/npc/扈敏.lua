-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 翠烟门NPC扈敏Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

-- ======================================================

function main(bTag)
	local t_dialog = {
		"<color=green>扈敏<color>：翠烟门风光旖旎，景色迷人，是个练习舞蹈，喂养小貂的好地方。",
		"<color=green>扈敏<color>：翠烟门风光旖旎，景色迷人，是个练习舞蹈，喂养小貂的好地方。",
		}
	Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		
