Include("\\script\\lib\\globalfunctions.lua");

g_szItemName = "<color=green>双“蛋”特惠礼包<color>："
g_szPacketName = "双“蛋”特惠礼包";	--包的名字 2,95,2057
g_tbItem = {
	[1] = { -- 双“蛋”特惠礼包
		[1] = {
			nlevelname = "双“蛋”特惠礼包", 
			room = {4, 400}, 
			item = {
				{gdp={2,95,52,500,1}, name = "藏宝箱钥匙"},
				{gdp={2,94,11,5,1}, name = "盛世银宝箱"},
				{gdp={2,94,10,50,1}, name = "盛世铜宝箱"},
				{gdp={2,95,5365,1,1}, name = "冰凉大雪球"},
			}, 
		},
	},
}

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

function OnUse(nItemIndex)
	local selTab = {};
	local tbRechargeTable = {1,};
	local szAwardTlt, szAwardStr = getAwardStr(1, tbRechargeTable[1])
	local szTitle = format("%s这是双“蛋”节日豪礼的大礼包，打开礼包即可获得：<color=red>请注意你得背包空间<color>\n<color=green>%s, [师门高级秘籍]×1<color>", g_szItemName, szAwardStr)
	tinsert(selTab, format("◆ 我要开启[%s]/#getValueAward(%d, %d, %d)", szAwardTlt, nItemIndex, 1, tbRechargeTable[1]));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType, nLevel)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local szgetName = g_tbItem[nType][nLevel].nlevelname
	local tbRoom = g_tbItem[nType][nLevel].room
	local tbAward = g_tbItem[nType][nLevel].item
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute()

	if nRouteFlag ~= 1 then
		Talk(1,"", "侠士还没加入任何流派，不能开启"..g_szPacketName.."。");
		return
	end;
	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end
	if DelItem(G, D, P, 1) == 1 then
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
		-- 70师门秘籍
		local tbBook = tFactionBook70[nRoute]
		gf_AddItemEx({tbBook[2],tbBook[3],tbBook[4],1,1})
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