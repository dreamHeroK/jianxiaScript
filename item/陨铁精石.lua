--陨铁精石物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."集齐一定陨铁精石可兑换神秘物品【强化精石】, 您需要兑换什么呢？",
		9,
		"◆100个换    1个强化精石[7级], 确定要使用吗？/cbwm1",	
		"◆200个换    1个强化精石[8级], 确定要使用吗？/cbwm2",	
		"\n◆300个换    1个强化精石[9级], 确定要使用吗？/cbwm3",
		"◆400个换    1个强化精石[10级], 确定要使用吗？/cbwm4",
		"◆500个换    1个强化精石[11级], 确定要使用吗？/cbwm5",
		"\n◆600个换    1个强化精石[12级], 确定要使用吗？/cbwm6",
		"◆700个换    1个强化精石[13级], 确定要使用吗？/cbwm7",
		"◆800个换    1个强化精石[14级], 确定要使用吗？/cbwm8",					
		"◆不了/no_use"
        )
end

function no_use()
end	
function cbwm1()
	if DelItem(2,1,1009,100) == 1 then
		AddItem(2,101,8,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm2()
	if DelItem(2,1,1009,200) == 1 then
		AddItem(2,101,9,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm3()
	if DelItem(2,1,1009,300) == 1 then
		AddItem(2,101,10,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm4()
	if DelItem(2,1,1009,400) == 1 then
		AddItem(2,101,11,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm5()
	if DelItem(2,1,1009,500) == 1 then
		AddItem(2,101,12,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm6()
	if DelItem(2,1,1009,600) == 1 then
		AddItem(2,101,13,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm7()
	if DelItem(2,1,1009,700) == 1 then
		AddItem(2,101,14,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm8()
	if DelItem(2,1,1009,800) == 1 then
		AddItem(2,101,15,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end