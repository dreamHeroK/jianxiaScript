--add by lizhi
-- 前3列是物品类别,第4位是时间,第5位是速度 / 100 = 多少倍
-- 注意，初始化操作移动到 \script\global\autoexec.lua 中！
tItemInfo =
{
	{2, 1, 1064, 480, 1, "六神丸"},
	{2, 1, 1065, 480, 2, "强效六神丸"},
	{2, 1, 1066, 480, 3, "六神仙丹"},
}

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nTabIndex = 0
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break;
		end
	end

	if nTabIndex == 0 then
		return
	end
	
	SetTaskTemp(25, nTabIndex)
	if GetReputation() < 3000 then
		Say("您的声望不足3000，不能使用"..tItemInfo[nTabIndex][6], 0)
		return
	end
	local UseLiushen = {
		"使用一个"..tItemInfo[nTabIndex][6].."可以获得8小时"..tItemInfo[nTabIndex][6].."时间。离线托管状态下，您将可以获得声望",
		"您确实要使用"..tItemInfo[nTabIndex][6].."吗？",
		"使用"..tItemInfo[nTabIndex][6].."/UseLiushen",
		"我再想想/no"
	}
	Say(UseLiushen[1]..UseLiushen[2],2,UseLiushen[3],UseLiushen[4])
end

function UseLiushen()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_ls_cb", 1, tonumber(nHave), "使用多少个"..tItemInfo[nTabIndex][6].."?")
end

function use_ls_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatLiushen(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("你获得了"..tItemInfo[nTabIndex][6].."的效果，拥有"..tItemInfo[nTabIndex][6].."时间"..nRet.."分钟")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemLiuShen()");
			end
		end
	end
end

function no_say()

end
