-- 龙战苍穹声望礼包
-- 选择会宁府、麒麟斋、兵部或剑盟任一势力声望

Include("\\script\\lib\\popularity.lua");

tPop = {9,10,11,12}

tTab =
{
	{2, 95, 2074, "龙战苍穹声望大礼包", 1000},
	{2, 95, 2075, "龙战苍穹声望中礼包", 625},
	{2, 95, 2076, "龙战苍穹声望小礼包", 250},
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
	local selTab = {};
	local szTitle = ""
	szTitle = format("使用一个%s可以获得%d点势力声望：您要领取哪种势力声望？", sItemName, val)
	for i = 1, getn(tPop) do
		local tCell = tPop[i];
		local nPopId, strPopName = tbPop[tCell][1], tbPop[tCell][2]
		if GetTask(nPopId) >= 1 then
			tinsert(selTab, format("%s/#do_receive_camp_july(%d, %d, %d)", strPopName, nItemIndex, i, val));
		end
	end
	tinsert(selTab,"我再想想/no");
	Say(szTitle, getn(selTab), selTab)
end


function do_receive_camp_july(nItemIndex, nIndex, val)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local tCell = tPop[nIndex];
	local nPopId, strPopName = tbPop[tCell][1], tbPop[tCell][2]
	if GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
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
