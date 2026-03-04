
tTab =
{
	{2, 1, 9975, "小军绩牌", 100},
	{2, 1, 9997, "军绩牌", 1000},
}

function OnUse(nItemIdx)
	local nItemIndex = tonumber(nItemIdx)
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
	local val = tTab[nTabIndex][5]
	local selTab = {
				format("确定/#use(%d,%d)",nItemIndex,nTabIndex),
				"取消/no",
				}
	Say("使用可以直接获得<color=yellow>"..val.."<color>战场积分，确定要使用吗？ ",getn(selTab),selTab);
end;

function use(nItemIdx,nTabIndex)
	local val = tTab[nTabIndex][5]
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(707,GetTask(707)+val)
		Msg2Player("您获得了"..val.."点战场积分");
		WriteLog("[战场积分奖励]:"..GetName().."获得"..val.."点战场积分");
	end;
end;

function no()
end;