--配置项 Begin

--查询消耗耐久
AUTO_MOVE_QUERY_COST = 20;

--配置项 End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0, "您至少需要"..AUTO_MOVE_QUERY_COST.."点耐久的“神行秘本”或“神行宝典”才能寻人"
	end

	return 1, ""

end


function QueryTargetPlayerPos(nItemIdxShenXing)

	if (nItemIdxShenXing <= 0) then
		return
	end

	if (AbradeItem(nItemIdxShenXing, AUTO_MOVE_QUERY_COST) <= 0) then
		Say("你的神行宝典或者秘本耐久度已经为0，将被删除！", 0)
		DelItemByIndex(nItemIdxShenXing, 0)					-- 耐久为0要删除掉物品
	end

	Msg2Player("传送成功，你的耐久度还剩"..AUTO_MOVE_QUERY_COST.."点")

end