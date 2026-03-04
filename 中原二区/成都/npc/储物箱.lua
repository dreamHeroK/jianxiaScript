--汴京府功能点
--储物箱
--樊万松 2004.01.14
Include("\\script\\global\\路人_物品保管人.lua");

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	main_new();
end;