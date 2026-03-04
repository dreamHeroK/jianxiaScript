--耀阳碎片物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以5：1兑换洪荒碎片, 您需要兑换什么呢？",
		4,
		"\n◆100个换20个洪荒碎片, 确定要使用吗？/cbwm1",		
		"\n◆1000个换200个洪荒碎片, 确定要使用吗？/cbwm2",
		"\n◆100个换500个皓月碎片, 确定要使用吗？/cbwm3",						
		"\n◆不了/no_use"
        )
end

function no_use()
end	
function cbwmadw3()
	if DelItem(2,95,741,2000) == 1 then
		AddItem(2,95,204,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm1()
	if DelItem(2,95,741,100) == 1 then
		AddItem(2,95,1506,20)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm2()
	if DelItem(2,95,741,1000) == 1 then
		AddItem(2,95,1506,200)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm3()
	if DelItem(2,95,741,100) == 1 then
		AddItem(2,95,740,500)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm4()
	if DelItem(2,95,741,400) == 1 then
		AddItem(2,1,1263,10)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm5()
	if DelItem(2,95,741,800) == 1 then
		AddItem(2,1,1264,10)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end