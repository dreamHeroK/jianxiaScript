--天罡令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		2,
		"◆100个换【天罡令】1个, 确定要使用吗？/cbwmadw",
		"◆不 换 了/no_use"
        )
end

function no_use()
end	
function cbwmadw()
	if DelItem(2,1,30499,100) == 1 then
		AddItem(2,95,204,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
