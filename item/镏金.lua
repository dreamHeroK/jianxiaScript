--皓月碎片物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		2,
		"◆50个炼制1个【五色彩染】, 确定要使用吗？/cbwmadw",
		"◆不了/no_use"
        )
end

function no_use()
end	
function cbwmadw()
	if DelItem(2,201,12,50) == 1 then
		AddItem(2,201,13,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
	else
	Talk(1,"","您并没有50个镏金哟！")


	end
end
