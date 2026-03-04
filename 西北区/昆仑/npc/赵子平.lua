-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC赵子平Script
-- By StarryNight
-- 2007/06/13 PM 3:01

-- 太多太多的话，都来不及说，还是上个厕所好了。

-- ======================================================

function main()
	--一般情况下的对话
	local t_dia_sel = {
		"<color=green>赵子平<color>：阁下可知昆仑派金丹有夺天地造化之功？炼丹炉房乃是由我掌管着。",
		"<color=green>赵子平<color>：我迟早会把昆仑派的炼丹法门学全的！",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
	
end;

function goto_zys()
	NewWorld(6073, 1586, 3222);
	SetFightState(1);
	SetCampToPlayer("camp_enemy");
end
