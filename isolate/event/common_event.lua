
--蕴灵：取出外装
function OnEnhanceCollectionPop(nPart, nEnchantLevel, nItemLevel )
	FireEvent("event_equip_operation","yunling", nEnchantLevel, nPart, 0)
	return 1
end
--蕴灵：使用道具
function OnEnhanceEmbroidery(nPart, nEmbroideryLv)
	FireEvent("event_equip_operation","yunling", nEmbroideryLv, nPart, 0)
	return 1
 end 