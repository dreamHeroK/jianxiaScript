-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 激活码相关礼包释放脚本
-- 文件名：cdkey_item.lua
-- Edited by 
-- 2021/04/15 PM 20:19
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua");

tTab =
{
	{2,95,1298, "天下无双-剑", "打开后获得：", "称号[重出江湖·天下无双]×30天"},
	{2,95,1299, "天下无双-侠", "打开后获得：", ""},
	{2,95,1300, "天下无双-情", "打开后获得：", ""},
	{2,95,1301, "天下无双-缘", "消耗5个和氏璧打开后获得：", "[剑侠币]×2000, [逍遥币]×2000, [逍遥玉]×100"},
}

g_tbItem = {
	[1] = {
		nlevelname = "天下无双-剑", 
		room = {6, 300}, 
		level = 1, 
		need = 0, 
		item = {
			{gdp={2,95,1432,1,4}, name = "[+13]侠士装备箱", nExpired = 7*24*60*60},
			{gdp={0,200,39,1,4}, name = "神行秘本"},
			{gdp={2,0,398,2,4}, name = "般若树种"},
			{gdp={2,0,552,5,4}, name = "小人参果"},
			{gdp={2,0,554,5,4}, name = "修真要诀"},
			{gdp={2,95,1299,1,4}, name = "天下无双-侠", nExpired = 7*24*60*60},
		}, 
	},
	[2] = {
		nlevelname = "天下无双-侠", 
		room = {4, 100}, 
		level = 80, 
		need = 0, 
		item = {
			{gdp={2,0,1050,1,4}, name = "储物箱金钥匙", nExpired = 7*24*60*60},
			{gdp={2,0,553,5,4}, name = "大人参果"},
			{gdp={2,95,585,5,4}, name = "大修真要诀"},
			{gdp={2,95,1300,1,4}, name = "天下无双-情", nExpired = 7*24*60*60},
		}, 
	},
	[3] = {
		nlevelname = "天下无双-情", 
		room = {6, 200}, 
		level = 90, 
		need = 0, 
		item = {
			{gdp={2,1,9998,1,4}, name = "大军功章"},
			{gdp={2,95,55,10,4}, name = "神器"},
			{gdp={2,95,558,3,4}, name = "6级灵石原石"},
			{gdp={2,201,1,5,4}, name = "星辰碎片"},
			{gdp={0,200,40,1,4}, name = "神行宝典", nExpired = 30*24*60*60},
			{gdp={2,95,1301,1,4}, name = "天下无双-缘", nExpired = 30*24*60*60},
		}, 
	},
	[4] = {
		nlevelname = "天下无双-缘", 
		room = {5, 600}, 
		level = 90, 
		need = {"和氏璧",2,1,1001,5}, 
		item = {
			{gdp={2,95,55,20,4}, name = "神器"},
			{gdp={2,1,1009,10,4}, name = "陨铁精石"},
			{gdp={2,95,559,1,4}, name = "7级灵石原石"},
			{gdp={2,201,1,10,4}, name = "星辰碎片"},
			{gdp={2,101,14,1,4}, name = "强化精石[13级]", nExpired = 30*24*60*60},
			{gdp={0,105,15,1,4,-1,-1,-1,-1,-1,-1}, nExpired = 30*24*60*60, name = "翻羽[30天]"},
		}, 
	},
}

function OnUse(idx)
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

	local g_szName = tTab[nTabIndex][4]
	local g_szItemName = "<color=green>"..g_szName.."<color>："
	local g_szDesc = tTab[nTabIndex][5]
	local g_szSupReward = tTab[nTabIndex][6]

	local selTab = {};
	local szAwardTlt, szAwardStr = getAwardStr(nTabIndex)
	local szTitle = format("%s%s<color=red>请注意你得背包空间<color>\n<color=green>%s, %s<color>。", g_szItemName, g_szDesc, szAwardStr, g_szSupReward)
	tinsert(selTab, format("◆ 我要打开[%s]/#getValueAward(%d, %d)", szAwardTlt, nItemIndex, nTabIndex));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local szgetName = g_tbItem[nType].nlevelname
	local g_szItemName = "<color=green>"..szgetName.."<color>："
	local tbRoom = g_tbItem[nType].room
	local nLevel = g_tbItem[nType].level    
	local tbNeed = g_tbItem[nType].need
	local tbAward = g_tbItem[nType].item
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute()

	if GetLevel() < nLevel then
		Talk(1,"","<color=green>"..g_szItemName.."<color>：请历练到<color=yellow>"..nLevel.."<color>级再来打开!");
		return
	end;

	if nRouteFlag ~= 1 then
		Talk(1,"", "<color=green>"..g_szItemName.."<color>：侠士还没加入任何流派，不能开启"..szgetName.."。");
		return
	end;
	
	if tbNeed ~= 0 then
		if GetItemCount(tbNeed[2],tbNeed[3],tbNeed[4]) < tbNeed[5] then
			Talk(1,"","<color=green>"..g_szItemName.."<color>：开启["..sItemName.."]需要<color=yellow>"..tbNeed[5].."个"..tbNeed[1].."<color>。");
			return
		end	
	end

	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end

	if DelItem(nGenre, nDetail, nParticular, 1) == 1 then
		if tbNeed ~= 0 then
			DelItem(tbNeed[2],tbNeed[3],tbNeed[4], tbNeed[5])
		end
		for i = 1, getn(tbAward) do
			local tbItem = tbAward[i]["gdp"]
			local tbName = tbAward[i]["name"]
			local nExpired = tbAward[i]["nExpired"]
			if type(nExpired) == "number" then
				for j=1,tbItem[4] do
					if tbItem[5] ~= nil then
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
					else
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
					end
					if nRet == 1 then
						-- 设置物品有效时间
						if type(nExpired)=="number" then
							SetItemExpireTime(nItemIdx, nExpired)
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
		if nType == 1 then
			gf_AddTitle(3, 53, 1, 30)
		end
		if nType == 4 then
			gf_Modify("Money",20000000)
			EarnXYB(2000);
			EarnXYY(100);
		end
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

function nothing()
end;