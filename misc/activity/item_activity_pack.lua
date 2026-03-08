-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 活跃度相关礼包释放脚本
-- 文件名：online_award.lua
-- Edited by 
-- 2020/06/02 AM 11:52
-- ======================================================
Include("\\script\\lib\\awardtemplet.lua")

--活动开启时间
SP_START_TIME = {2021,02,06,0,0,0};
SP_STOP_TIME = {2029,02,19,23,59,0};

tTab =
{
	{2,95,1276, "活跃度小礼包", {nExp = 2000000, item = {{gdp={2, 95, 197, 1, 4}, name = "幸运金币"} },}, {4,10},},
	{2,95,1277, "四等活跃度礼包", {nExp = 5000000, item = {{gdp={2, 95, 197, 10, 4}, name = "幸运金币"}},}, {2,10},},
	{2,95,1278, "三等活跃度礼包", {nExp = 10000000, item = {{gdp={2,1,1008,1,4}, name = "白驹仙丹"},},}, {2,10},},
	{2,95,1279, "二等活跃度礼包", {nExp = 20000000,item = {{gdp={2,1,1008,1,4}, name = "白驹仙丹"}, },}, {2,10},},
	{2,95,1280, "一等活跃度礼包", {nExp = 20000000,item = {{gdp={2,1,1008,2,4}, name = "白驹仙丹"},{gdp={2, 95, 247, 3, 4}, name = "千变梵天券"},{gdp={2,95,559,1, 4}, name = "7级灵石"},},}, {5,10},},
	{2,95,1838, "欢乐活跃包", {nExp = 100000, item = {{gdp={2,95,197,2,4}, nTime = SP_STOP_TIME, name = "幸运金币"}, },}, {1,10},},
	{2,95,1839, "高级活跃包", {nExp = 200000, item = {{gdp={2,95,197,5,4}, nTime = SP_STOP_TIME, name = "幸运金币"}, },}, {1,10},},
	{2,95,1840, "钻石活跃包", {nExp = 500000, item = {{gdp={2,95,197,10,4}, nTime = SP_STOP_TIME, name = "幸运金币"}, },}, {1,10},},
	{2,95,1841, "至尊活跃包", {nExp = 1000000, item = {{gdp={2,95,197,20,4}, nTime = SP_STOP_TIME, name = "幸运金币"}, },}, {1,10},},
}

function sp_IsOpen()
	return gf_CheckDuration(SP_START_TIME, SP_STOP_TIME);
end

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
	room = tTab[nTabIndex][6]
	open_pack_item(PlayerIndex, nItemIndex, exchange, room)
end

function open_pack_item(nPlayerIndex, nItemIndex, exchange, room)
	PlayerIndex = nPlayerIndex
	local sItemName, g, d, p = get_item_info(nItemIndex)
	if gf_Judge_Room_Weight(room[1], room[2], "") ~= 1 then
		return
	end
	if (DelItem(g, d, p, 1) == 1) then
		if p == 1276 then
			local nSex = GetSex();
	--		if nSex == 1 then
	--			if sp_IsOpen() == 1 then
	--				local nRet, nItemIdx = gf_AddItemEx({2,0,352,3, 4},"玫瑰花种");
	--				gf_SetItemExpireTime(nItemIdx, gf_UnPack(SP_STOP_TIME));
	--			end	
	--		end
			if nSex == 2 then
				gf_AddItemEx({2,95,247,1,4},"千变梵天券");
			end
		end
		tbAwardTemplet:Give(exchange, "获得活跃度奖励", "释放"..sItemName)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end