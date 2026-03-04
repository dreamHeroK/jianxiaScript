
Include("\\script\\lib\\awardtemplet.lua");

TSK_BIT_NEW = 444 			--标记玩家累计活跃度领奖

NPC_NAME = "<color=green>归来新手礼包<color>："

tbAwardList = {
	[1] = { -- 新手等级奖励
		[10] = {nlevelname = "领取10级新手奖励  ", taskbyte = 1, item = {{gdp={1,0,2,50,4}, name = "金创散"}, {gdp={1,0,7,50,4}, name = "小还丹"}, {gdp={1,0,12,50,4}, name = "清心散"}, {gdp={0,105,10110,1,4,-1,-1,-1,-1,-1,-1}, nExpired = 3*24*60*60, name = "仙游剑"},{gdp={0,200,39,2,4}, nExpired = 3*24*60*60, name = "神行秘本"}, {gdp={2,1,1013,2,4}, name = "蓬莱仙丹"}, {gdp={2,1,1000,1,4}, name = "磐龙璧"}, }, },
		[20] = {nlevelname = "领取20级新手奖励  ", taskbyte = 2, item = {{gdp={1,0,3,50,4}, name = "止血散"}, {gdp={1,0,8,50,4}, name = "还阳丹"}, {gdp={1,0,13,50,4}, name = "益气散"}, {gdp={2,1,270,3,4}, name = "白驹丸"}, {gdp={2,0,137,1,4}, name = "洗髓灵丹"}, }, },
		[30] = {nlevelname = "领取30级新手奖励  ", taskbyte = 3, item = {{gdp={1,0,4,50,4}, name = "白云散"}, {gdp={1,0,9,50,4}, name = "大还丹"}, {gdp={1,0,14,50,4}, name = "玉林散"}, {gdp={1,0,32,10,4}, name = "九转回魂丹"}, {gdp={2,1,1007,3,4}, name = "大白驹丸"}, {gdp={2,95,2025,10,4}, name = "消解散"}, }, },
		[40] = {nlevelname = "领取40级新手奖励  ", taskbyte = 4, item = { {gdp={2,1,343,1,4}, name = "神农丹"}, {gdp={2,0,398,5,4}, name = "小般若树种"},{gdp={2,0,504,5,4}, name = "般若树种"},{gdp={2,95,585,5,4}, name = "大修真要诀"},{gdp={2,0,553,5,4}, name = "大人参果"},}, },
		[50] = {nlevelname = "领取50级新手奖励  ", taskbyte = 5, item = {{gdp={2,95,769,10,4}, name = "辉星碎片"}, {gdp={2,1,343,1,4}, name = "神农丹"}, {gdp={2,95,247,1,4}, name = "千变梵天券"}, {gdp={0,200,40,1,4}, nExpired = 7*24*60*60, name = "神行宝典"}, }, },
		[60] = {nlevelname = "领取60级新手奖励  ", taskbyte = 6, item = {{gdp={1,0,6,50,4}, name = "黑玉断续膏"}, {gdp={1,0,16,50,4}, name = "生生造化散"}, {gdp={1,0,11,50,4}, name = "万物归元丹"}, {gdp={2,1,1008,5,4}, name = "白驹仙丹"}, {gdp={0,105,9,1,4,-1,-1,-1,-1,-1,-1}, name = "赤兔"},{gdp={2,95,247,1,4}, name = "千变梵天券"}, {gdp={2,97,305,1,4}, name = "活动储物箱金钥匙"}, }, },
		[70] = {nlevelname = "领取70级新手奖励  ", taskbyte = 7, item = {{gdp={2,95,247,1,4}, name = "千变梵天券"}, {gdp={2,1,9998,5,4}, name = "大军功章"}, {gdp={2,1,9977,5,4}, name = "辉煌军功章"}, {gdp={2,2,8,50,4}, name = "陨铁"}, {gdp={2,2,7,50,4}, name = "陨铁碎片"}, {gdp={2,0,31,5,4}, name = "藏剑英雄帖"}, {gdp={2,95,769,30,4}, name = "辉星碎片"}, }, },
		[80] = {nlevelname = "领取80级新手奖励  ", taskbyte = 8, item = {{gdp={2,1,149,4,4}, name = "金犀"},{gdp={2,1,533,4,4}, name = "精炼金犀"},{gdp={2,0,556,5,4}, name = "替身符"},{gdp={2,95,740,20,4}, name = "皓月碎片"}, {gdp={2,95,769,100,4}, name = "辉星碎片"}, }, },
		[85] = {nlevelname = "领取85级新手奖励  ", taskbyte = 9, item = {{gdp={2,1,504,1,4}, name = "女娲精石"},{gdp={2,1,1009,20,4}, name = "陨铁精石"},{gdp={2,95,740,200,4}, name = "皓月碎片"}, {gdp={2,95,247,1,4}, name = "千变梵天券"}, {gdp={0,200,40,1,4}, nExpired = 7*24*60*60, name = "神行宝典"}, }, },
	},
}

function OnUse(nItemIndex)
	local selTab = {};
	local tMsg = {
		[0] = "未领取", 
		[1] = "已领取",
	}
	local nExtVal = GetLevel();
	local tbRechargeTable = {10, 20, 30, 40, 50, 60, 70, 80,85,};
	local szTitle = format("%s您当前的等级为：<color=yellow>%d<color>。\n当侠士的等级达到一定级别就可以领取该档新手奖励。", NPC_NAME, nExtVal)
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getAwardStr(1, tbRechargeTable[i])
		local nTaskByte = tbAwardList[1][tbRechargeTable[i]].taskbyte
		local msg = tMsg[gf_GetTaskBit(TSK_BIT_NEW, nTaskByte)] or tMsg[1];
		tinsert(selTab, format("◆ %s（%s）/#getValueAward(%d, %d)", szAwardTlt, msg, 1, tbRechargeTable[i]));
	end
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nType, nLevel)
	local nTaskByte = tbAwardList[nType][nLevel].taskbyte
	local szgetName = tbAwardList[nType][nLevel].nlevelname
	local tbAward = tbAwardList[nType][nLevel].item
	local ngetTag = gf_GetTaskBit(TSK_BIT_NEW, nTaskByte)
	local nExtVal = GetLevel();
	local nMonthVal = GetTask(IB_cost_month_quota)
	if gf_Judge_Room_Weight(10, 100, " ") ~= 1 then
		return
	end
	if ngetTag == 1 then
		Talk(1,"",format("%s您已经领取%s", NPC_NAME, szgetName));
		return
	end
	if nType == 1 then
		if nExtVal < nLevel  then
			Talk(1,"",format("%s您的等级不足%d级，不能领取%s", NPC_NAME, nLevel, szgetName));
			return
		end
	end
	for i = 1, getn(tbAward) do
		local tbItem = tbAward[i].gdp
		for j=1,tbItem[4] do
			local nRet, nItemIdx = 0;
			if tbItem[5] ~= nil then
				nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
			else
				nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
			end
			if nRet == 1 then
				-- 设置物品有效时间
				if tbAward[i].nExpired ~= nil then
					SetItemExpireTime(nItemIdx, tbAward[i].nExpired)
				end
			end
		end
		if tbAward[i].name == nil then
			local szItemName = GetItemName(tbItem[1], tbItem[2], tbItem[3])
			Msg2Player("您获得了["..szItemName.."]×"..tbItem[4]);
		else
			Msg2Player("您获得了["..tbAward[i].name.."]×"..tbItem[4]);
		end
	end
	SetTask(TSK_BIT_NEW, SetBit(GetTask(TSK_BIT_NEW), nTaskByte, 1, 0));
end

--获取奖励列表
function getAwardStr(nType, nLevel)
	local szAwardTitle = tbAwardList[nType][nLevel].nlevelname
	local tbAward = tbAwardList[nType][nLevel].item
	local szAwardName = tbAward[1].name;
	local szAwardNum = tbAward[1].gdp[4];
	local szAwardDesc = "["..szAwardName.."]×"..szAwardNum;
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s %s", szAwardDesc, "["..tbAward[i].name.."]×"..tbAward[i].gdp[4]);
	end
	return szAwardTitle, szAwardDesc;
end

function nothing()
end;