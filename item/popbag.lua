-- 化境天成声望礼包,后蜀声望礼包,战中原声望礼包
-- 化境天成声望礼包可选择大理寺、神仙府、故衣会任一势力声望
-- 后蜀声望礼包礼包可选择获得后蜀力声望
-- 战中原声望礼包礼包可选择获得战中原声望

Include("\\script\\lib\\popularity.lua");

tPop = {
	[1] = {13,14,15},
	[2] = {16},
	[3] = {17},
}

tTab =
{
	{2, 102, 192, "化境天成声望礼包", 1000, 1},
	{2, 102, 193, "后蜀声望礼包", 1000, 2},
	{2, 102, 194, "战中原声望礼包", 1000, 3},
}

function OnUse(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
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
	local selTab = {};
	local szTitle = ""
	if pop == 1 then
		szTitle = format("使用一个%s可以获得%d点势力声望：您要领取哪种势力声望？", sItemName, val)
		for i = 1, getn(tPop[pop]) do
			local tCell = tPop[pop][i];
			local _, strPopName = tbPop[tCell][1], tbPop[tCell][2]
			tinsert(selTab, format("%s/#do_receive_camp_july(%d, %d, %d, %d)", strPopName, nItemIndex, i, val, pop));
		end
		tinsert(selTab,"我再想想/no");
		Say(szTitle, getn(selTab), selTab)
	else
		local tCell = tPop[pop][1];
		local _, strPopName = tbPop[tCell][1], tbPop[tCell][2]
		do_receive_camp_july(nItemIndex, 1, val, pop)
	end
end


function do_receive_camp_july(nItemIndex, nIndex, val, pop)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local tCell = tPop[pop][nIndex];
	local nPopId, strPopName = tbPop[tCell][1], tbPop[tCell][2]
	if GetTask(nPopId) <= 0 then
		OpenPop(tCell)
		if DelItem(G, D, P, 1) == 1 then
			AddPop(tCell,val)
		end
	elseif GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
		if DelItem(G, D, P, 1) == 1 then
			AddPop(tCell,val)
		end
	elseif GetTask(nPopId) >= 40001 then
		Talk(1, "#OnUse("..nItemIndex..")", "您的"..strPopName.."已达到【万人敬仰】，已无法增加该势力声望。")
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
