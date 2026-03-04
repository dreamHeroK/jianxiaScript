Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{2, 97, 123, "金丝银被坐骑礼包(7天)", 7},
	{2, 97, 124, "金丝银被坐骑礼包(15天)", 15},
	{2, 97, 125, "金丝银被坐骑礼包(30天)", 30},
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
	SetTaskTemp(25, nTabIndex)
	local selTab = {};
	local szTitle = format("打开可以随机获得一只带翅膀的120速金丝银被萌宠坐骑，限时"..tTab[nTabIndex][5].."天。确定开启吗？", NPC_NAME)
	tinsert(selTab,"确定开启/open_horse_box");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function open_horse_box()
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		local nHorse = {1210,1211,1212,1213,}
		local nTempRND = random(1, 4)
		local nID3 = nHorse[nTempRND]
		local name = GetItemName(0,105,nID3)
		local nRet, nItemIdx = 0, 0
		nRet, nItemIdx = AddItem(0,105,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
		if nRet == 1 then
			-- 设置物品有效时间
			SetItemExpireTime(nItemIdx, tTab[nTabIndex][5]*24*60*60)
		end
		Msg2Player("您获得了["..name.."]×1");
	end
end
