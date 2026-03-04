-- 后蜀篇声望令牌
-- 增加现有后蜀势力声望

Include("\\script\\lib\\popularity.lua");

tTab =
{
	{2, 160, 40, "后蜀篇第一节声望令牌", 10, 6001, "声名鹊起"},
	{2, 160, 41, "后蜀篇第二节声望令牌", 10, 13001, "勋绩卓著"},
	{2, 160, 42, "后蜀篇第三节声望令牌", 10, 24001, "久负盛名"},
	{2, 160, 43, "后蜀篇第四节声望令牌", 10, 40001, "万人敬仰"},
}

function OnUse(nItemIndex)
	local _, G, D, P = get_item_info(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == G and value[2] == D and value[3] == P then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	local val = tTab[nTabIndex][5]
	local nValue = tTab[nTabIndex][6]
	local nName = tTab[nTabIndex][7]
	do_receive_camp_july(nItemIndex, val, nValue, nName)
end


function do_receive_camp_july(nItemIndex, val, nValue, nName)
	local _, G, D, P = get_item_info(nItemIndex)
	local nPopId = tbPop[16][1]
	if GetTask(nPopId) <= 0 then
		OpenPop(16)
		if DelItem(G, D, P, 1) == 1 then
			AddPop(16,val)
		end
	elseif GetTask(nPopId) >= 1 and GetTask(nPopId) < nValue then
		if DelItem(G, D, P, 1) == 1 then
			AddPop(16,val)
		end
	elseif GetTask(nPopId) >= nValue then
		Talk(1, "", "您的后蜀势力声望已达到【"..nName.."】，已无法增加后蜀声望。")
		return 0
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function no()
end
