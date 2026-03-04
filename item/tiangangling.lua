Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{2, 95, 674, "地玄金令", 5000},
	{2, 95, 204, "天罡令", 20000},
	{2, 95, 1949, "高级天罡令", 22000},
}

function OnUse(idx)
	do return end
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
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
	local nCurYinQuan = ModifyYinJuan(0, 1)
	local szTitle = format("使用%s可以兑换%d银券，你当前银券有：%d。确定要兑换吗？", tTab[nTabIndex][4], val, nCurYinQuan)
	tinsert(selTab, format("兑换银券/#change_yiqnaun(%d, %d)", nItemIndex, val));
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function change_yiqnaun(nItem, val)
	local sItemName, G, D, P = get_item_info(nItem)
	if DelItem(G, D, P,1) == 1 then
    		ModifyYinJuan(val, 1);
	else
		WriteLog("Change Error:\t"..GetName().." got 银券失败！");
		return
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function nothing()
end
