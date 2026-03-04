--灵石镶嵌脚本
--by vivi
--08/11/2007

function OnUse()
	BesetItem()
end




function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and ( detail ~= 154 or detail ~= 153 or detail ~= 152 or detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"",npc_name.."先把装备放到托盘里。强化材料放在背包里面。");
		return 0;
	end
	
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --锁定判断
		Talk(1,"","装备锁定无法放入");
		return 0;
	end	
	
	
	return 1;
end











function OnEquip()--镶嵌开始
return 0	
end

function OnUnEquip()--镶嵌关闭
return 0;
end