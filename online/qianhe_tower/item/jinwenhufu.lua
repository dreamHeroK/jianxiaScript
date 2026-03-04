Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	if qht_check_condition(1) ~= 1 then
		return 0;
	end
	--金文虎符商店使用task
	show_equip_shop(3024);
end