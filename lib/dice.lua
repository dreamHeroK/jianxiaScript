Import("\\script\\lib\\globalfunctions.lua")

function roll_item(szCallBackScript, szCallBackFun, tbItem)
	if (type(szCallBackScript) ~= "string" or type(szCallBackFun) ~= "string" or
		type(tbItem) ~= "table" or getn(tbItem) < 3) then
	
		return
	end
	
	--roll(1,100) time 300s 
	local nDiceId = ApplyItemDice(1, 100, 300, szCallBackScript, szCallBackFun, GetTeamSize());
	if (nDiceId == nil) then
		return
	end
	
	AddDiceItemInfo(nDiceId, tbItem[1],tbItem[2],tbItem[3],tbItem[4] or 1,tbItem[5] or 1,tbItem[6] or -1,tbItem[7] or -1,tbItem[8] or -1,tbItem[9] or -1,tbItem[10] or -1,tbItem[11] or -1)
	
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		RollItem(nDiceId)
	end
	PlayerIndex = nPlayerOld
	
	return nDiceId;
end

function check_roll_state(dwID)
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("检查商品属性！")
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwID)
		if n == 0 then
			local szMsg = GetName().."拾取了"..szItem
			gf_Msg2Team(szMsg)
		elseif n == 1 then
			Msg2Player("背包空间不足，无法拾取"..szItem..")
		end
	elseif nState == 2 then
		Msg2Player("背包里没存放东西")
	end
end

function show_roll_info(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."投出了"..value[2].."点" .. szItem
		if value[3] == 0 then
			str = value[1].."发射了" .. szItem
		elseif value[3] == 1 then
			str = str.."(贪婪)"
			if value[4] == 1 then
				str = str.."——拾取了"..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."(贪婪)"
			if value[4] == 1 then
				str = str.."——拾取了"..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("所有玩家都放弃了"..szItem.."")
	elseif nSize ~= getn(t) then
		Msg2Player("其他玩家由于超时，算着放弃了"..szItem.."")
	end
end