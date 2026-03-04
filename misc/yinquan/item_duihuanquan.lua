-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 银券释放脚本
-- 文件名：guajianbuy_item.lua
-- Edited by 
-- 2020/07/20 AM 05:52
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{2,95,1911, "100银券兑换券", 100,},
	{2,95,1912, "500银券兑换券", 500,},
	{2,95,1913, "1000银券兑换券", 1000,},
	{2,95,1914, "2000银券兑换券", 2000,},
	{2,95,1915, "5000银券兑换券", 5000,},
	{2,95,1916, "10000银券兑换券", 10000,},
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
	local nItemNum = GetItemCount(G, D, P);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上的["..sItemName.."]不够"))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_yinquan(PlayerIndex, nItemIndex, exchange, 1)
	else
		g_AskClientNumberEx(1, nItemNum, "你要兑换几张？", {_do_change_yinquan, {PlayerIndex, nItemIndex, exchange}})
	end
end

function _do_change_yinquan(nPlayerIndex, nItemIndex, exchange, nCount)
	PlayerIndex = nPlayerIndex
	local sItemName, g, d, p = get_item_info(nItemIndex)
	local nValue = exchange * nCount
	if (DelItem(g, d, p, nCount) == 1) then
		gf_ModifyYinQuan(nValue)
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","兑换银券失败。")
		return
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end