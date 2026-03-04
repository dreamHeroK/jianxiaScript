
Include("\\script\\lib\\awardtemplet.lua");

NPC_NAME = "<color=green>容错补偿包<color>："


tbAwardList = {
	[1] = { -- 容错补偿
		[1] = {
			nlevelname = "鸿影流光剑", 
			room = {1, 10}, 
			time = {20200920, 20200921}, 
			item = {
			{gdp={0, 105, 208, 1, 1,-1,-1,-1,-1,-1,-1}, name = "鸿影流光剑"},
			}, 
		},
	},
}

function OnUse(nItemIndex)
	local selTab = {};
	local tbRechargeTable = {1,};
	local szAwardTlt, szAwardStr, nValidTime, nStartingTime, nEndTime = getAwardStr(1, tbRechargeTable[1])
	local szTitle = format("%s打开可获得%s，礼包有效时间（%d-%d）请在有效期内尽快开启。你确定要打开吗？\n<color=red>请注意你得背包空间<color>。", NPC_NAME, szAwardStr, nStartingTime, nEndTime)
	if nValidTime == 1 then
		tinsert(selTab, format("◆ 领取[%s]/#getValueAward(%d, %d, %d)", szAwardTlt, nItemIndex, 1, tbRechargeTable[1]));
	else
		tinsert(selTab, format("◆ 已经过期了，我要删掉它/#delAwardItem(%d)", nItemIndex));
	end
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType, nLevel)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local szgetName = tbAwardList[nType][nLevel].nlevelname
	local tbRoom = tbAwardList[nType][nLevel].room
	local tbAward = tbAwardList[nType][nLevel].item
	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end
	if DelItem(G, D, P, 1) == 1 then
		for i = 1, getn(tbAward) do
			local tbItem = tbAward[i]["gdp"]
			local tbExpired = tbAward[i]["nExpired"]
			local tbName = tbAward[i]["name"]
			for j=1,tbItem[4] do
				if tbItem[5] ~= nil then
					local nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
				else
					local nRet, nIndex = AddItem(tbItem[1],tbItem[2],tbItem[3],1,tbItem[5])
				end
				if nRet == 1 then
					-- 设置物品有效时间
					if tbExpired ~= "" then
						SetItemExpireTime(nIndex, tbExpired)
					end
				end
				Msg2Player("您获得了["..tbName.."]×1");
			end
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
	local szAwardTitle = tbAwardList[nType][nLevel].nlevelname
	local tbValidTime = tbAwardList[nType][nLevel].time
	local nValidTime = 0
	local tbAward = tbAwardList[nType][nLevel].item
	local szAwardName = tbAward[1].name;
	local szAwardNum = tbAward[1].gdp[4];
	local szAwardDesc = "["..szAwardName.."]×"..szAwardNum;
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s %s", szAwardDesc, "["..tbAward[i].name.."]×"..tbAward[i].gdp[4]);
	end
	if nDate >= tbValidTime[1] and nDate <= tbValidTime[2] then
		nValidTime = 1
	else
		nValidTime = 0
	end
	return szAwardTitle, szAwardDesc, nValidTime, tbValidTime[1], tbValidTime[2];
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function nothing()
end;