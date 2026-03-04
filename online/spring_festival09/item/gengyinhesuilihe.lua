--庚寅贺岁礼盒脚本
--by 
--2020/06/18

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nLevel = GetLevel()
	local nExp = nLevel * nLevel * 3

	if DelItemByIndex(nItemIndex,1) == 1 then
		Earn(10000);
		ModifyExp(nExp)
		Msg2Player("您获得了"..nExp.."经验")
	end
end
