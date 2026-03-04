Include("\\script\\lib\\globalfunctions.lua")

--活动时间
CH_START = {2020, 12, 25, 0, 0, 0};
CH_END  = {2021, 1, 3, 0, 0, 0};

TSK_YEARS_BEGIN_DATE = 1357;      --共聚江湖称号领取开始时间 
TSK_YEARS_END_DATE = 1358;        --共聚江湖称号领取结束时间

g_nYearsDays = 7;              --经验持续时间：天

function ch_IsOpen()
	return gf_CheckDuration(CH_START, CH_END);
end

g_szItemName = "<color=green>圣诞快乐礼盒<color>："
g_szPacketName = "圣诞快乐礼盒";	--包的名字
g_tbItem = {
	[1] = { -- 圣诞快乐礼盒
		[1] = {
			nlevelname = "圣诞快乐礼盒", 
			room = {10, 600}, 
			item = {
				{gdp={2,95,247,5,4}, name = "千变梵天券"},
				{gdp={2,0,141,10,4}, name = "消劫散"},
				{gdp={2,1,9978,1,4}, name = "投诚表"},
				{gdp={2,1,9999,1,4}, name = "军功章"},
				{gdp={2,1,9998,1,4}, name = "大军工章"},
				{gdp={2,1,9977,1,4}, name = "辉煌军功章"},
				{gdp={2,95,5520,20,4}, name = "圣诞袜"},
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
	local szTitle = format("%s祝各位侠士节日愉快！开启礼盒获得“圣诞快乐”称号（亮出称号每分钟都可获得经验奖励）并且每日都可领取一次珍贵的礼物。礼物有：<color=red>请注意你得背包空间<color>\n<color=green>%s, [师门高级秘籍]×1<color>。", g_szItemName, szAwardStr)
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
	local nRouteFlag = gf_IsPlayerRoute()

	if ch_IsOpen() ~= 1 then
		Talk(1,"",format("<color=green>圣诞快乐礼盒<color>： 活动已结束，无法领取奖励了。"));
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
		-- 70师门秘籍
		local tbBook = tFactionBook70[nRoute]
		gf_AddItemEx({tbBook[2],tbBook[3],tbBook[4],1,1})
		local nDate = tonumber(date("%Y%m%d"));
		if IsTitleExist(3,8) <= 0 then
			gf_AddTitle(3, 8, 2, 20210103)
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