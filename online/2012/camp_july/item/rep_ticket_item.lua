-- 决战九州声望券
-- 增加六扇门、镖局联盟、商会联盟及武林盟声望50点

Include("\\script\\lib\\popularity.lua");

tPop = {1,2,3,4}

function OnUse(nItemIdx)
	for i = 1, getn(tPop) do
		local tCell = tPop[i];
		local nPopId, strPopName = tbPop[tCell][1], tbPop[tCell][2]
		if GetTask(nPopId) <= 0 then
			Msg2Player("您的"..strPopName.."未开启");	
		elseif GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
			do_receive_camp_july(nItemIdx, i, 50)
		elseif GetTask(nPopId) >= 40001 then
			Msg2Player("您的"..strPopName.."已达到【万人敬仰】，已无法增加该势力声望。");	
		end
	end
end

function do_receive_camp_july(nItemIndex, nIndex, val)
	local tCell = tPop[nIndex];
	local sItemName, G, D, P = get_item_info(nItemIndex)
	if DelItem(G, D, P, 1) == 1 then
		AddPop(tCell,val)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end