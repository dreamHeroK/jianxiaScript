-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 江湖豪侠礼包释放脚本
-- 文件名：jianghuhaoxialibao.lua
-- Edited by 
-- 2021/04/15 PM 23:10
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua");

tTab =
{
	{2,95,1303, "江湖豪侠礼包", "只有未转生才可使用，消耗3个和氏璧开启后获得：", "直接提升至82级"},
	{2,95,1304, "江湖豪侠礼包-真", "只有未转生才可使用，消耗6个和氏璧开启后获得：", "（服用后可从85级速升到96级）"},
	{2,95,1305, "江湖豪侠礼包-极", "只有未转生才可使用，消耗15个和氏璧开启后获得：", "（服用后可直接获得1转并提升等级至1转85级）"},
}

g_tbItem = {
	[1] = {
		nlevelname = "江湖豪侠礼包", 
		room = {5, 200}, 
		level = {10, 85}, 
		tolevel = 85, 
		condition = 1, -- 转生;
		need = {"和氏璧",2,1,1001,3}, 
		item = {
			{gdp={2,95,1465,1,4}, name = "[+12]侠客装备箱", nExpired = 7*24*60*60},
			{gdp={1, 0, 21, 5, 4}, name = "奔星却月丹"}, 
			{gdp={1, 0, 26, 5, 4}, name = "大日炎阳散"}, 
			{gdp={2, 1, 270, 5, 4}, name = "白驹丸"}, 
		}, 
	},
	[2] = {
		nlevelname = "江湖豪侠礼包-真", 
		room = {5, 200}, 
		level = {85, 96}, 
		tolevel = 0, 
		condition = 1, -- 转生;
		need = {"和氏璧",2,1,1001,6}, 
		item = {
			{gdp={2,95,1466,1,4}, name = "[+13]侠客装备箱", nExpired = 7*24*60*60},
			{gdp={1, 0, 21, 5, 4}, name = "奔星却月丹"}, 
			{gdp={1, 0, 26, 5, 4}, name = "大日炎阳散"}, 
			{gdp={2,1,1007,5,4}, name = "大白驹丸"},
			{gdp={2,95,1363,1,4}, name = "九阳正气丹", nExpired = 7*24*60*60},
		}, 
	},
	[3] = {
		nlevelname = "江湖豪侠礼包-极", 
		room = {5, 200}, 
		level = {96, 99}, 
		tolevel = 0, 
		condition = 1, -- 转生;
		need = {"和氏璧",2,1,1001,15}, 
		item = {
			{gdp={2, 95, 1473,1,4}, name = "[+12]侠义装备箱", nExpired = 30*24*60*60},
			{gdp={1, 0, 21, 5, 4}, name = "奔星却月丹"}, 
			{gdp={1, 0, 26, 5, 4}, name = "大日炎阳散"}, 
			{gdp={2,1,1008,5,4}, name = "白驹仙丹"},
			{gdp={2,95,1379,1,4}, name = "菩提转生丹", nExpired = 7*24*60*60},
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
	local tbLevel = g_tbItem[nType].level    
	local nToLevel = g_tbItem[nType].tolevel    
	local nCondition = g_tbItem[nType].condition
	local tbNeed = g_tbItem[nType].need
	local tbAward = g_tbItem[nType].item
	local nRoute = GetPlayerRoute();
	local nReborn = gf_GetPlayerRebornCount()
	local nRouteFlag = gf_IsPlayerRoute()

	if GetLevel() < tbLevel[1] then
		Talk(1,"","<color=green>"..g_szItemName.."<color>：请历练到<color=yellow>"..tbLevel[1].."<color>级再来打开!");
		return
	end;

	if GetLevel() > tbLevel[2] then
		Talk(1,"","<color=green>"..g_szItemName.."<color>：你的等级已经大于<color=yellow>"..tbLevel[2].."<color>级了，这个已经不能用了。");
		return
	end;

	if nReborn >= nCondition then -- 转生
		Talk(1,"","<color=green>"..g_szItemName.."<color>：未转生的侠士才可使用，你已经用不着这个了。");
		return
	end;

	if nRouteFlag ~= 1 then
		Talk(1,"", "<color=green>"..g_szItemName.."<color>：侠士还没加入任何流派，不能开启"..sItemName.."。");
		return
	end;
	
	if GetItemCount(tbNeed[2],tbNeed[3],tbNeed[4]) < tbNeed[5] then
		Talk(1,"","<color=green>"..g_szItemName.."<color>：开启["..sItemName.."]需要<color=yellow>"..tbNeed[5].."个"..tbNeed[1].."<color>。");
		return
	end;

	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end

	if DelItem(nGenre, nDetail, nParticular, 1) == 1 and DelItem(tbNeed[2],tbNeed[3],tbNeed[4], tbNeed[5]) == 1 then
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
		if nToLevel > 0 then
			SetLevel(nToLevel, 0)				--设置等级
			Msg2Player("您的等级已提升到"..nToLevel.."级,请退出客户端重新登陆。")
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