
Include("\\script\\lib\\awardtemplet.lua");

tTab = {
	{"太虚八卦盘-乾",2,1,469,1, {item = {{gdp={2,1,2002,1,4}, name = "月华"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-乾<color>兑换1个<color=yellow>月华<color>"},
	{"太虚八卦盘-坤",2,1,470,1, {item = {{gdp={2,1,2002,1,4}, name = "月华"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-坤<color>兑换1个<color=yellow>月华<color>"},
	{"太虚八卦盘-坎",2,1,471,1, {item = {{gdp={2,1,2002,1,4}, name = "月华"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-坎<color>兑换1个<color=yellow>月华<color>"},
	{"太虚八卦盘-兑",2,1,472,1, {item = {{gdp={2,1,2002,1,4}, name = "月华"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-兑<color>兑换1个<color=yellow>月华<color>"},
	{"太虚八卦盘-离",2,1,473,1, {item = {{gdp={2,1,2002,1,4}, name = "月华"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-离<color>兑换1个<color=yellow>月华<color>"},
	{"太虚八卦盘-震",2,1,474,1, {item = {{gdp={2,1,3219,1,4}, name = "月华之精"},{gdp={2,95,550,1,4}, name = "神木八卦"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-震<color>兑换1个<color=yellow>月华之精<color>或者1个<color=yellow>神木八卦<color>"},
	{"太虚八卦盘-艮",2,1,475,1, {item = {{gdp={2,1,2002,1,4}, name = "月华"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-艮<color>兑换1个<color=yellow>月华<color>"},
	{"太虚八卦盘-巽",2,1,476,1, {item = {{gdp={2,1,3219,1,4}, name = "月华之精"},{gdp={2,95,551,1,4}, name = "紫金八卦"},},}, {1,100}, "可以使用1个<color=yellow>太虚八卦盘-巽<color>兑换1个<color=yellow>月华之精<color>或者1个<color=yellow>紫金八卦<color>"},
};

function OnUse(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == G and value[3] == D and value[4] == P then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	name = tTab[nTabIndex][1]
	g_name = "<color=green>"..name.."<color>："
	g_dialog = tTab[nTabIndex][8]
	g_exchange = tTab[nTabIndex][6].item
	local selTab = {};
	local szTitle = format("%s%s<color=red>(请注意兑换后物品均绑定)<color>。", g_name, g_dialog)
	for i = 1, getn(g_exchange) do
		local n_gdp = g_exchange[i].gdp
		local n_name = g_exchange[i].name
		tinsert(selTab, format("◆ 我要兑换%s/#getValueAward(%d,%d,%d,%d,%d,%d,%d)", n_name, nItemIndex, nTabIndex, n_gdp[1], n_gdp[2], n_gdp[3], n_gdp[4], n_gdp[5] ));
	end
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nTabIndex, nG, nD, nP, nM, nL)
	local sItemName, g, d, p = get_item_info(nItemIndex)
	local nNeed = tTab[nTabIndex][5]
	local tbRoom = tTab[nTabIndex][7]

	-- 空间
	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end
	-- 需要数量
	if GetItemCount(g, d, p) < nNeed then
		local szTalk = {"您的{"..sItemName.."}数量不足，请检查后再来！",}
		TalkEx("", szTalk)
		return 0
	end

	if (DelItem(g, d, p, nNeed) == 1) then
		gf_AddItemEx({nG, nD, nP, nM, nL});
	end

end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end

function nothing()
end

