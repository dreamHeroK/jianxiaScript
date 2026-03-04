--贡献礼盒脚本
Include("\\script\\online\\spring2021\\head.lua")

tTab = {
	{"每日贡献礼盒", 2, 95, 5975, 1},
	{"贡献礼盒壹", 2, 95, 5976, 2},
	{"贡献礼盒贰", 2, 95, 5977, 3},
	{"贡献礼盒叁", 2, 95, 5978, 4},
	{"贡献礼盒肆", 2, 95, 5979, 5},
	{"贡献礼盒伍", 2, 95, 5980, 6},
	{"贡献至尊礼盒", 2, 95, 5981, 7},
}


g_tbItem = {
	[1] = {
		nlevelname = "每日贡献礼盒", 
		room = {5, 100}, 
		item = {
			{gdp={2,96,176,2,4}, name = "师门真卷残页"},
			{gdp={2,201,1,1,4}, name = "星辰碎片"},
			{gdp={2,0,554,5,4}, name = "修真要诀"},
			{gdp={2,0,553,1,4}, name = "大人参果"},
			{gdp={2,95,5983,1,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
	[2] = {
		nlevelname = "贡献礼盒壹", 
		room = {5, 100}, 
		item = {
			{gdp={2,2,7,20,4}, name = "陨铁碎片"},
			{gdp={2,2,8,20,4}, name = "陨铁"},
			{gdp={2,1,1009,5,4}, name = "陨铁精石"},
			{gdp={2,95,55,5,4}, name = "神器"},
			{gdp={2,95,5983,1,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
	[3] = {
		nlevelname = "贡献礼盒贰", 
		room = {7, 100}, 
		item = {
			{gdp={2,95,617,1,4}, name = "师门真卷包裹"},
			{gdp={2,2,7,20,4}, name = "陨铁碎片"},
			{gdp={2,2,8,20,4}, name = "陨铁"},
			{gdp={2,1,1009,10,4}, name = "陨铁精石"},
			{gdp={2,95,55,10,4}, name = "神器"},
			{gdp={2,95,5983,2,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
	[4] = {
		nlevelname = "贡献礼盒叁", 
		room = {8, 100}, 
		item = {
			{gdp={2,1,1067,1,4}, name = "小定魂陨铁神石"},
			{gdp={2,2,7,30,4}, name = "陨铁碎片"},
			{gdp={2,2,8,30,4}, name = "陨铁"},
			{gdp={2,1,1009,15,4}, name = "陨铁精石"},
			{gdp={2,95,55,15,4}, name = "神器"},
			{gdp={2,95,5983,3,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
	[5] = {
		nlevelname = "贡献礼盒肆", 
		room = {9, 100}, 
		item = {
			{gdp={2,1,1113,1,4}, name = "定魂陨铁神石"},
			{gdp={2,2,7,40,4}, name = "陨铁碎片"},
			{gdp={2,2,8,40,4}, name = "陨铁"},
			{gdp={2,1,1009,20,4}, name = "陨铁精石"},
			{gdp={2,95,55,20,4}, name = "神器"},
			{gdp={2,95,5983,4,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
	[6] = {
		nlevelname = "贡献礼盒伍", 
		room = {11, 100}, 
		item = {
			{gdp={2,1,1067,1,4}, name = "小定魂陨铁神石"},
			{gdp={2,1,1113,1,4}, name = "定魂陨铁神石"},
			{gdp={2,2,7,50,4}, name = "陨铁碎片"},
			{gdp={2,2,8,50,4}, name = "陨铁"},
			{gdp={2,1,1009,25,4}, name = "陨铁精石"},
			{gdp={2,95,55,25,4}, name = "神器"},
			{gdp={2,95,5983,5,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
	[7] = {
		nlevelname = "贡献至尊礼盒", 
		room = {10, 600}, 
		item = {
			{gdp={2,95,5983,5,4}, nTime = SP_END, name = "新春福袋"},
		}, 
	},
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	if sp_IsOpen() ~= 1 then
--		delAwardItem(nItemIndex)
		return 0;
	end
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == nGenre and value[3] == nDetail and value[4] == nParticular then
			nTabIndex = index
			break
		end
	end
	if nTabIndex == 0 then
		return
	end
	local nAllDevote = GetTask(TASK_YEARS_DEVOTE)
	local g_szPacketName = tTab[nTabIndex][1]
	local g_szItemName = "<color=green>"..g_szPacketName.."<color>："
	local nType = tTab[nTabIndex][5]
	local g_szExtraInfo = ""
	if nType == 7 then
		if nAllDevote >= 50000 then
			g_szExtraInfo = "[82级武器(110灵气)]×1, [强化精石（14级）]×1, "
		elseif nAllDevote >= 20000 and nAllDevote < 50000 then
			g_szExtraInfo = "[82级武器(100灵气)]×1, [强化精石（13级）]×1, "
		end
	end
	local selTab = {};
	local szAwardTlt, szAwardStr = getAwardStr(nType)
	local szTitle = format("%s这是上交年夜饭食材获得的奖励，打开可获得：<color=red>请注意你得背包空间<color>\n<color=green>%s%s<color>。", g_szItemName, g_szExtraInfo, szAwardStr)
	tinsert(selTab, format("◆ 我要打开[%s]/#getValueAward(%d, %d)", szAwardTlt, nItemIndex, nType));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local szgetName = g_tbItem[nType].nlevelname
	local tbRoom = g_tbItem[nType].room
	local tbAward = g_tbItem[nType].item
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute()

	if nRouteFlag ~= 1 then
		Talk(1,"", "侠士还没加入任何流派，不能开启"..sItemName.."。");
		return
	end;

	if nRoute == 9 or nRoute == 21 then
		Talk(1,"","琴蛊职业当前为展示职业，不能开启"..sItemName.."。");
		return
	end;

	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end

	if DelItem(G, D, P, 1) == 1 then
		for i = 1, getn(tbAward) do
			local tbItem = tbAward[i]["gdp"]
			local tbName = tbAward[i]["name"]
			local nTime = tbAward[i]["nTime"]
			if type(nTime) == "table" then
				for j=1,tbItem[4] do
					if tbItem[5] ~= nil then
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
					else
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
					end
					if nRet == 1 then
						-- 设置物品有效时间
						if type(nTime)=="table" then
							gf_SetItemExpireTime(nItemIdx, gf_UnPack(nTime));
						end
					end
				end
			else
				-- 添加物品
				if tbItem[5] ~= nil then
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
				else
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
				end
			end
			Msg2Player("您获得了["..tbName.."]×"..tbItem[4]);
		end
		-- 82级灵气武器
		if nType == 7 then
			local nAllDevote = GetTask(TASK_YEARS_DEVOTE)
			if nAllDevote < 20000 then
				return
			end
			local nLingQi = 100;
			local szStone = "";
			if nAllDevote >= 50000 then
				nLingQi = 110;
				nStone = 15;
				szStone = "强化精石（14级）";
			elseif nAllDevote >= 20000 and nAllDevote < 50000 then
				nLingQi = 100;
				nStone = 14;
				szStone = "强化精石（13级）";
			end
			local t_LQ_82Weapon = {
				[2] ={"漏景", {0,3,65}},
				[3] ={"目犍连杖", {0,8,98}},
				[4] ={"神龟", {0,0,15}},
				[6] ={"夸父", {0,1,54}},
				[8] ={"画影", {0,2,37}},
				[11] ={"神龟", {0,0,15}},
				[12] ={"玉柱", {0,5,41}},
				[14] ={"画影", {0,2,37}},
				[15] ={"酸与", {0,9,87}},
				[17] ={"九龙钻戟", {0,6,109}},
				[18] ={"猿啼", {0,4,120}},
				[20] ={"碧水", {0,7,13}},
				[23] ={"画影", {0,2,37}},
				[29] ={"弥心", {0,13,13}},
				[30] ={"龙吟赤霄", {0,12,13}},
			};
			local szName = t_LQ_82Weapon[nRoute][1];
			local nID2 = t_LQ_82Weapon[nRoute][2][2];
			local nID3 = t_LQ_82Weapon[nRoute][2][3];
			local nRet,nItemIdx = AddItem(0,nID2,nID3,1,1,0,0,0,0,0,0,0,0,nLingQi);
			SetItemMaxLingQi(nItemIdx, nLingQi);
			SetEquipCanChouQu(nItemIdx,1);
			Msg2Player("您获得了["..szName.."]×1")
			gf_AddItemEx({2, 101, nStone, 1, 1},szStone);
			Msg2Global("恭喜["..GetName().."]在开启<贡献至尊礼盒>时，获得["..szName.."]×1, ["..szStone.."]×1");
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
function getAwardStr(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local szAwardTitle = g_tbItem[nType].nlevelname
	local tbAward = g_tbItem[nType].item
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