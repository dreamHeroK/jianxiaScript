-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 购买券释放脚本
-- 文件名：guajianbuy_item.lua
-- Edited by 
-- 2020/07/20 AM 05:52
-- ======================================================
Include("\\script\\lib\\awardtemplet.lua")

tTab =
{
	{2,95,3719, "简清外装购买券", 1, {item = {{gdp={2,95,3718,1,1}, name = "简清外装包"},},}, {1,100,1000}, "这张购买凭证，可用于购买1个<color=yellow>简清外装包<color>",},
	{2,95,4839, "荷风竹露购买券", 1, {item = {{gdp={2,95,4838,1,1}, name = "荷风竹露外装包"},},}, {1,100,1000}, "这张购买凭证，可用于购买1个<color=yellow>荷风竹露外装包<color>",},
	{2,95,5562, "柳梢云雾购买券", 1, {item = {{gdp={2,95,5561,1,1}, name = "柳梢云雾外装包"},},}, {1,100,1000}, "这张购买凭证，可用于购买1个<color=yellow>柳梢云雾外装包<color>",},
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

	style = tTab[nTabIndex][5]
	exchange = tTab[nTabIndex][6]
	dialog = tTab[nTabIndex][8] or ""
	room = tTab[nTabIndex][7] or ""
	UsePackToItem(PlayerIndex, nItemIndex, style, exchange, dialog, room)
end


function UsePackToItem(nPlayerIndex, nItemIndex, style, exchange, dialog, room)
	if style == 1 then
		local szMsg = ""
		local nCount = 0
		if room[3] ~= nil and room[3] ~= "" then
			nCount		= room[3]
		end
		if nCount > 0 then
			szMsg = "或选择兑换<color=yellow>1000<color>点千变点券"
		end
		local szTitle = dialog..szMsg.."。您确定要购买吗？"
		local tbOpt = {}
			tinsert(tbOpt, {"是的，我要购买", open_pack_item, {nPlayerIndex, nItemIndex, style, exchange, room, 1}})
			if nCount > 0 then
				tinsert(tbOpt, {"算了，我还是换成点券吧", open_pack_item, {nPlayerIndex, nItemIndex, style, exchange, room, 2}})
			end
			tinsert(tbOpt, {"结束对话", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function open_pack_item(nPlayerIndex, nItemIndex, style, exchange, room, nType)
	PlayerIndex = nPlayerIndex
	local sItemName, g, d, p = get_item_info(nItemIndex)
	if style == 1 then
		local nFreeRoom		= GetFreeItemRoom()
		local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight()
		local nCount		= 0
		if room[3] ~= nil and room[3] ~= "" then
			nCount		= room[3]
		end
		-- 负重
		if nFreeWeight < room[2] then
			local szTalk = {"您的背包负重不足{"..nCurNeedWeight.."}，不能打开{"..sItemName.."}！",}
			TalkEx("", szTalk)
			return 0
		end
		-- 空间
		if nFreeRoom < room[1] then
			local szTalk = {"您的背包空间不足{"..nCurNeedRoom.."}，不能打开{"..sItemName.."}！",}
			TalkEx("", szTalk)
			return 0
		end

		if (DelItem(g, d, p, 1) == 1) then
			if nType == 1 then
				tbAwardTemplet:Give(exchange, "外装券购买", "使用"..sItemName)
			elseif nType == 2 then
				EarnCollectionCoin(nCount)
			end
		end
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

-- 退出对话，不做任何操作
function cancel_dialog()
end