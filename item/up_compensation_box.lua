
Include("\\script\\lib\\awardtemplet.lua");

NPC_NAME = "<color=green>归来回档补偿礼包<color>："

tFactionReal70 = 
{
	[2] = {"金刚般若真卷", 0, 107, 204,}, 
	[4] = {"潜龙寂灭真卷", 0, 107, 205,}, 
	[3] = {"无尘菩提真卷", 0, 107, 206,}, 
	[6] = {"天罗连珠真卷", 0, 107, 207,}, 
	[8] = {"如意金顶真卷", 0, 107, 208,}, 
	[11] = {"混沌镇岳真卷", 0, 107, 210,}, 
	[12] = {"揆天游龙真卷", 0, 107, 211,}, 
	[14] = {"幻影迷踪真卷", 0, 107, 212,}, 
	[15] = {"君子截风真卷", 0, 107, 213,}, 
	[17] = {"镇军飞龙枪真卷", 0, 107, 214,}, 
	[18] = {"穿云落虹真卷", 0, 107, 215,}, 
	[20] = {"幽冥封魔真卷", 0, 107, 216,}, 
	[23] = {"九天风雷真卷", 0, 107, 218,}, 
	[29] = {"红尘醉梦真卷", 0, 107, 222,}, 
	[30] = {"风花千叶真卷", 0, 107, 223,}, 

};

tFactionBook70 = 
{
	[2] = {"金刚般若经", 0, 107, 166,}, 
	[4] = {"潜龙寂灭经", 0, 107, 167,}, 
	[3] = {"无尘菩提经", 0, 107, 168,}, 
	[6] = {"天罗连珠录", 0, 107, 169,}, 
	[8] = {"如意金顶秘籍", 0, 107, 170,}, 
	[11] = {"混沌镇岳秘籍", 0, 107, 172,}, 
	[12] = {"揆天游龙秘籍", 0, 107, 173,}, 
	[14] = {"幻影迷踪秘籍", 0, 107, 174,}, 
	[15] = {"君子截风秘籍", 0, 107, 175,}, 
	[17] = {"镇军飞龙枪谱", 0, 107, 176,}, 
	[18] = {"穿云落虹秘籍", 0, 107, 177,}, 
	[20] = {"幽冥封魔录", 0, 107, 178,}, 
	[23] = {"九天风雷诀", 0, 107, 198,}, 
	[29] = {"红尘醉梦谱", 0, 107, 202,}, 
	[30] = {"风花千叶谱", 0, 107, 203,}, 
};

g_szItemName = "<color=green>归来回档补偿礼包<color>："
g_szPacketName = "归来服回档补偿礼包";	--包的名字
g_tbItem = {
	[1] = { -- 归来服维护礼包
		[1] = {
			nlevelname = "归来服回档补偿礼包（80级以上）", 
			room = {4, 10}, 
			item = {
				{gdp={2,95,741,100, 4}, name = "耀阳碎片"},
				{gdp={2,95,585,10, 4}, name = "大修真要诀"},
				{gdp={0,112,224,1, 4}, name = "逍遥秘籍"},
				{gdp={2,1,1009,25,4}, name = "陨铁精石"},
			}, 
		},
		[2] = {
			nlevelname = "归来服回档补偿礼包（80级以下）", 
			room = {4, 10}, 
			item = {
				{gdp={2,95,740,50, 4}, name = "皓月碎片"},
				{gdp={2,95,585,5, 4}, name = "大修真要诀"},
				{gdp={0,112,78,1, 4}, name = "凌波微步"},
				{gdp={2,2,8,50,4}, name = "陨铁"},
			}, 
		},
	},
}

function OnUse(nItemIndex)
	local selTab = {};
	local nLevel = GetLevel()
	local tbLevel = 0
	local tbBook = ""
	if nLevel < 80 then
		tbLevel = 2
		tbBook = "[70级流派秘籍]×1"
	elseif nLevel >= 80 then
		tbLevel = 1
		tbBook = "[70级流派真卷]×1"
	end
	local szAwardTlt, szAwardStr = getAwardStr(1, tbLevel)
	local szTitle = format("%s9月9日归来服回档补偿礼包，打开可获得%s, %s。\n<color=red>礼包分两个等级，80级以上及以下<color>", g_szItemName, szAwardStr, tbBook)
	tinsert(selTab, format("◆ 我要打开[%s]/#getValueAward(%d, %d, %d)", szAwardTlt, nItemIndex, 1, tbLevel));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType, nLevel)
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
		Talk(1,"","侠士还没加入任何流派，不能打开<color=yellow>回档补偿礼包<color>。");
		return
	end;
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local szgetName = g_tbItem[nType][nLevel].nlevelname
	local tbRoom = g_tbItem[nType][nLevel].room
	local tbAward = g_tbItem[nType][nLevel].item
	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end
	if DelItem(G, D, P, 1) == 1 then
		for i = 1, getn(tbAward) do
			local tbItem = tbAward[i]["gdp"]
			local tbName = tbAward[i]["name"]
			for j=1,tbItem[4] do
				if tbItem[5] ~= nil then
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
				else
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
				end
			end
			Msg2Player("您获得了["..tbName.."]×"..tbItem[4].."");
		end
		local nRoute = GetPlayerRoute();
		if nLevel == 1 then
			local tbBook = tFactionReal70[nRoute]
			local nRet, nIndex = AddItem(tbBook[2],tbBook[3],tbBook[4],1,4) 
			Msg2Player("您获得了["..tbBook[1].."]×1");
		elseif nLevel == 2 then
			local tbBook = tFactionBook70[nRoute]
			local nRet, nIndex = AddItem(tbBook[2],tbBook[3],tbBook[4],1,4) 
			Msg2Player("您获得了["..tbBook[1].."]×1");
		end
	end
end

function delAwardItem(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	if DelItem(G, D, P, 1) == 1 then
		Msg2Player(sItemName.."已过期，已被系统删除");
	end
end

--获取奖励列表
function getAwardStr(nType, nLevel)
	local nDate = tonumber(date("%Y%m%d"));
	local szAwardTitle = g_tbItem[nType][nLevel].nlevelname
	local tbAward = g_tbItem[nType][nLevel].item
	local szAwardName = tbAward[1].name;
	local szAwardNum = tbAward[1].gdp[4];
	local szAwardDesc = "["..szAwardName.."]×"..szAwardNum;
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s, %s", szAwardDesc, "["..tbAward[i].name.."]×"..tbAward[i].gdp[4]);
	end
	return szAwardTitle, szAwardDesc;
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function nothing()
end;
