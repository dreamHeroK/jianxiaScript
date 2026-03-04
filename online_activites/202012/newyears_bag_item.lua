Include("\\script\\lib\\globalfunctions.lua")

--活动时间
CH_START = {2021, 01, 16, 0, 0, 0};
CH_END  = {2021, 01, 22, 23, 59, 0};

TSK_YEARS_BEGIN_DATE = 2391;      --共聚江湖称号领取开始时间 
TSK_YEARS_END_DATE = 2394;        --共聚江湖称号领取结束时间

g_nYearsDays = 7;              --经验持续时间：天

function ch_IsOpen()
	return gf_CheckDuration(CH_START, CH_END);
end

g_szItemName = "<color=green>共聚江湖礼盒<color>："
g_szPacketName = "共聚江湖礼盒";	--包的名字
g_tbItem = {
	[1] = { -- 共聚江湖礼盒
		[1] = {
			nlevelname = "共聚江湖礼盒", 
			room = {10, 600}, 
			item = {
				{gdp={2,1,9977,1,4}, name = "辉煌军功章", nExpired = 2*24*60*60},
				{gdp={2,95,246,5,4}, name = "千变梵星券"},
				{gdp={2,1,9978,1,4}, name = "投诚表", nExpired = 2*24*60*60},
				{gdp={2,0,137,1,4}, name = "洗髓灵丹", nExpired = 2*24*60*60},
				{gdp={2,97,127,1,4}, name = "降龙邀请函", nExpired = 3*24*60*60},
			}, 
		},
	},
}

function OnUse(nItemIndex)
	local selTab = {};
	local tbRechargeTable = {1,};
	local szAwardTlt, szAwardStr = getAwardStr(1, tbRechargeTable[1])
	local szTitle = format("%s恭贺群侠共聚降龙江湖，开启礼盒获得“共聚江湖”称号（亮出称号每分钟都可获得经验奖励）并可获得丰厚的礼物。礼物有：<color=red>请注意你得背包空间<color>\n<color=green>%s<color>，<color=yellow>女侠额外获得[外装兑换券]×1，[稀有坐骑装备兑换券]×1<color>。", g_szItemName, szAwardStr)
	tinsert(selTab, format("◆ 我要开启[%s]/#getValueAward(%d, %d, %d)", szAwardTlt, nItemIndex, 1, tbRechargeTable[1]));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType, nLevel)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local szgetName = g_tbItem[nType][nLevel].nlevelname
	local tbRoom = g_tbItem[nType][nLevel].room
	local tbAward = g_tbItem[nType][nLevel].item
	local nFac = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nSex = GetSex();
	local nRouteFlag = gf_IsPlayerRoute()

	if ch_IsOpen() ~= 1 then
		Talk(1,"",format("<color=green>共聚江湖礼盒<color>： 活动已结束，无法领取奖励了。"));
		return 0;
	end

	if gf_CheckBaseCondition(72) ~= 1 then
		return 0;
	end

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
		if nSex == 2 then
			gf_AddItemEx2({2,97,122,1,4}, "外装兑换券", "共聚江湖礼盒", "开启共聚江湖礼盒", 7 * 24 * 3600, 1);
			gf_AddItemEx2({2,114,112,1,4}, "稀有坐骑装备兑换券", "共聚江湖礼盒", "开启共聚江湖礼盒", 7 * 24 * 3600, 1);
		end
		local nDate = tonumber(date("%Y%m%d"));
		if IsTitleExist(3,8) <= 0 then
			gf_AddTitle(3, 8, 2, 20210122)
			SetTask(TSK_YEARS_BEGIN_DATE,nDate);
			local nEndDate = tf_GetResultDate(GetTask(TSK_YEARS_BEGIN_DATE),g_nYearsDays-1);
			SetTask(TSK_YEARS_END_DATE,nEndDate);	
		end	
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		DoFireworks(832, 3);
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