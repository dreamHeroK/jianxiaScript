
-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 明教接引人司行方Script
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
Include("\\script\\lib\\transport_head.lua")

function main()
	Say("<color=yellow>司行方：<color>明教圣火，永不熄灭！",
		2,
		"前往明教/togomingjiao",
		"离开/no")
	return
end

function togomingjiao()
	i=random(1,5)
	if i==1 then
		NewWorld(152, 1494 ,2991)
	elseif i==2 then
		NewWorld(152, 1512,3085)
	else  
		NewWorld(152,1689,3288)
	end
	SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
end;

function no()
end;


