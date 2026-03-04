-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 在线时间相关礼包释放脚本
-- 文件名：online_award.lua
-- Edited by 
-- 2020/06/02 AM 11:52
-- ======================================================
Include("\\script\\lib\\awardtemplet.lua")

tTab =
{
	{2,111,62, "甲字在线礼包", {nExp = 30000, item = {{gdp={1, 0, 21, 3, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 3, 4}, name = "大日炎阳散"}, {gdp={2,1,3508,1,4}, name = "千里传音符纸"}, {gdp={2,0,504,1,4}, name = "小般若树种"},},},},
	{2,111,63, "乙字在线礼包", {nExp = 80000, item = {{gdp={2,1,3508,2,4}, name = "千里传音符纸"}, {gdp={2,1,270,1,4}, name = "白驹丸"}, {gdp={2,1,343,1,4}, name = "神农丹"}, {gdp={2,0,504,2,4}, name = "小般若树种"},},},},
	{2,111,64, "丙字在线礼包", {nExp = 150000, item = {{gdp={2,1,3508,3,4}, name = "千里传音符纸"}, {gdp={2,0,398,1,4}, name = "般若树种"},},},},
	{2,111,65, "丁字在线礼包", {nExp = 300000, item = {{gdp={2,1,3508,4,4}, name = "千里传音符纸"}, {gdp={2,0,398,2,4}, name = "般若树种"}, {gdp={2,0,31,1,4}, name = "藏剑英雄帖"},},},},
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
	exchange = tTab[nTabIndex][5]
	open_pack_item(PlayerIndex, nItemIndex, exchange)
end

function open_pack_item(nPlayerIndex, nItemIndex, exchange)
	PlayerIndex = nPlayerIndex
	local sItemName, g, d, p = get_item_info(nItemIndex)
	if (DelItem(g, d, p, 1) == 1) then
		tbAwardTemplet:Give(exchange, "获得经验奖励", "释放"..sItemName)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end