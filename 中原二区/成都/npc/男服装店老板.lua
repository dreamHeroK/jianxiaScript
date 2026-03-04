
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 服装店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	i=random(1,3)
	if (i == 1) then
		Sale(42)
	elseif (i == 2) then
		Sale(42)
	else
		Sale(42)
	end
end;
