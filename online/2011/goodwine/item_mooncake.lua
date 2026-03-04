-- 特制月饼
-- 增加一种势力声望

Include("\\script\\lib\\popularity.lua");

tTab =
{
	{2, 95, 893, "武林盟特制月饼", 50, 4},
	{2, 95, 894, "六扇门特制月饼", 50, 1},
	{2, 95, 895, "镖局联盟特制月饼", 50, 2},
	{2, 95, 896, "商会联盟特制月饼", 50, 3},
	{2, 95, 897, "枢密院特制月饼", 100, 0},
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
	local pop = tTab[nTabIndex][6]
	do_receive_camp_july(nItemIndex, val, pop)
end


function do_receive_camp_july(nItemIndex, val, pop)
	local _, G, D, P = get_item_info(nItemIndex)
	local nPopId, strPopName = tbPop[pop][1], tbPop[pop][2]
	if GetTask(nPopId) >= 40001 then
		Talk(1, "", "您的"..strPopName.."已达到【万人敬仰】，已无法增加该势力声望。")
		return 0
	end
	if GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
		AddPop(pop,val)
		tPop = 1
	end
	if tPop == 1 then
		DelItem(G, D, P, 1)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function no()
end
