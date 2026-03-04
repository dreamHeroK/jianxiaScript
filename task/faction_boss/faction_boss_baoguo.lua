-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 门派boss随身包裹释放脚本
-- 文件名：faction_boss_baoguo.lua
-- Edited by 
-- 2020/09/23 AM 20:20
-- ======================================================
Include("\\script\\task\\faction_boss\\faction_boss_define.lua");

tTab =	{
	{2, 1, 958, "青书的随身包裹"},
	{2, 1, 959, "玄真的随身包裹"},
	{2, 1, 960, "杨延德的随身包裹"},
	{2, 1, 961, "唐喜的随身包裹"},
	{2, 1, 962, "黄正一的随身包裹"},
	{2, 1, 963, "古墨的随身包裹"},
	{2, 1, 964, "慧明的随身包裹"},
}

tAward = {
	{1, 1000, "般若树种", {2,0,398,1,1}, 0},
	{1, 1000, "神器", {2,95,55,1,1}, 0},
	{1, 1500, "灵石宝箱", {2,95,5435,1,1}, 0},
	{1, 1000, "大人参果", {2, 0, 552, 1, 1}, 0},
	{1, 1000, "修真要诀", {2, 0, 554, 1, 1}, 0},
	{1, 500, "凌波微步残本", {2,95,146,1}, 0},
	{1, 600, "陨铁碎片", {2,2,7,10}, 0},
	{1, 1000, "陨铁", {2,2,8,5}, 0},
	{1, 600, "陨铁精石", {2,1,1009,1}, 0},
	{1, 500, "军功章", {2,1,9999,1}, 0},
	{1, 200, "大军功章", {2,1,9998,1}, 0},
	{1, 50, "辉煌军功章", {2,1,9977,1}, 0},
	{1, 1000, "金钱袋", {2,95,662,10}, 0},
	{31, 100, "vaf_GiveFactionBook70()", ""},
	{31, 50, "vaf_GiveWenLingLevel1()", ""},
}

-- 默认使用的函数
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
	UsePackToItem(PlayerIndex, nItemIndex)
end;

function UsePackToItem(nPlayerIndex, nItemIndex)
	local sItemName = get_item_info(nItemIndex)
	local nFac = GetPlayerFaction();
	local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
	local nRoute = GetPlayerRoute();
	local nRouteFlag = 0
	if nRoute > 0 then
		for _, ckRoute in tbRouteTable do
			if ckRoute == nRoute then
				nRouteFlag		= 1;	-- Route标识
			end
		end
	end
	if nRouteFlag ~= 1 then
		Talk(1,"", "侠士还没加入任何流派，不能打开"..sItemName.."。");
		return
	end;
	local szTitle = "您确定要打开"..sItemName.."吗？"
	local tbOpt = {}
		tinsert(tbOpt, {"是的", open_pack_item, {nPlayerIndex, nItemIndex}})
		tinsert(tbOpt, {"取消", cancel_dialog})
	CreateNewSayEx(szTitle, tbOpt)
end

function open_pack_item(nPlayerIndex, nItemIndex)
	PlayerIndex = nPlayerIndex
	local sItemName, g, d, p = get_item_info(nItemIndex)
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then
		return 0
	end
	if (DelItem(g, d, p, 1) == 1) then
		local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
		gf_AddItemEx2(tAward[nIndex][4], tAward[nIndex][3], sItemName, "获得奖励", 0, 1);
		if tAward[nIndex][5] == 1 then
			Msg2SubWorld(format("[%s]打开%s获得了%d个%s", GetName(), sItemName, tonumber(tAward[nIndex][4][4]), tAward[nIndex][3]))
		end
		local nTempRND = random(1, 100)
		if nTempRND <= 90 then
			Earn(50000)
			ModifyExp(1000000)
		else
			Earn(100000)
			ModifyExp(2000000)
		end
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

-- 退出对话
function cancel_dialog()
end;