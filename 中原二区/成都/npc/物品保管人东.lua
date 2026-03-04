-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 物品保管人脚本
-- Edited by 葫芦娃救爷爷
-- ======================================================
Include("\\script\\global\\路人_物品保管人.lua");

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	main_new();
end;
