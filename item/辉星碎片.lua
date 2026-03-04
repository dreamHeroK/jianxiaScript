--辉星碎片物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."5：1换皓月碎片, 您需要兑换什么呢？",
		3,
		"\n◆100辉星碎片换20皓月碎片, 确定要换吗？/cbwmadw1",
		"\n◆1000辉星碎片换200皓月碎片, 确定要换吗？/cbwmadw3",
		"\n◆不了/no_use"
        )
end

function no_use()
end	
function cbwmadw1()
	if DelItem(2,95,769,100) == 1 then
		AddItem(2,95,740,20) 
		Msg2Player("你已兑换成功！")


	end
end

function cbwmadw3()
	if DelItem(2,95,769,1000) == 1 then
		AddItem(2,95,740,200)
		Msg2Player("你已兑换成功！")


	end
end
