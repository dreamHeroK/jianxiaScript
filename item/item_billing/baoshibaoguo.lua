Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{2,95,5777, "5级宝石包裹", 5},
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
	local szTitle = format("打开可以随机获得一颗"..tTab[nTabIndex][5].."级宝石。确定打开吗？")
	tinsert(selTab,"确定/open_baoshi_box");
	tinsert(selTab,"取消/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function open_baoshi_box()
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		local nbaoshi = {100,200,300,400}
		local nTempRND = random(1, 4)
		local nID3 = nbaoshi[nTempRND] + tTab[nTabIndex][5]
		local name = GetItemName(2,22,nID3)
		local nRet, nItemIdx = 0, 0
		nRet, nItemIdx = AddItem(2,22,nID3,1,1);
		Msg2Player("您获得了["..name.."]×1");
	end
end
