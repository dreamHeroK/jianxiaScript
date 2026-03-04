--皓月碎片物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
--	if GetPlayerRoute() == 0 then
--		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
--		return
--	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		4,
		"◆100五色彩染 重铸为【古金石】, 确定要使用吗？/cbwmadw",
		"◆500五色彩染 重铸为【小点睛玉】, 确定要使用吗？/cbwmadw1",
		"◆1000五色彩染 重铸为【点睛玉】, 确定要使用吗？/cbwmadw2",
		"◆不了/no_use"
        )
end

	
function cbwmadw()
	if DelItem(2,201,13,100) == 1 then
		AddItem(2,201,14,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
	else
	Talk(1,"","您并没有100五色彩染哟！")


	end
end


function cbwmadw1()
	if DelItem(2,201,13,500) == 1 then
		AddItem(2,201,16,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
	else
	Talk(1,"","您并没有500五色彩染哟！")


	end
end
function cbwmadw2()
	if DelItem(2,201,13,1000) == 1 then
		AddItem(2,201,15,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
	else
	Talk(1,"","您并没有1000五色彩染哟！")


	end
end


function no_use()
end