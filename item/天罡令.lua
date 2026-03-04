--天罡令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		9,
		"◆2换1(和氏璧)可兑2000金/zbsp",
		"◆10换1★混沌★紫玉碎片/cbwmadw",
		--"◆200换1（天卦石）/cbwmadw1",
		--"◆100换100（地玄金令）/cbwmadw10",
		"◆1换10（千变梵天券）/cbwmadw7",
		--"◆1换5（真阳璧）/cbwmadw8",
		"\n◆1换100（真卷精华）/cbwmadw9",
		--"◆1换20（粽子）/zongzi",
		--"◆1换20（大白驹丸）/cbwmadw2",
		--"◆1换15（白驹仙丹）/cbwmadw3",
		--"◆1换200（陨铁晶石）/yuntie",
		--"◆1换4000（皓月碎片）/cbwm1",
		--"◆1换2000（耀阳碎片）/cbwm2",
		"◆1换999（洪荒碎片）/cbwm3",
		"\n◆5换1（菩提1转生仙丹）/cbwmadw6",
		"◆10换1（菩提2转生仙丹）/cbwmadw4",
		"◆20换1（菩提3转生仙丹）/cbwmadw5",
		"\n◆不换了/no_use"
        )
end

function no_use()
end	
function cbwm1()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,95,740,4000)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm2()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,95,741,2000)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm3()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,95,1506,999)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function siji()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2, 102, 18303,100)
		Msg2Player("兑换成功，你获得了[100个蕴灵兑换券] x 100 ！")
	end
end
function sanji()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2, 102, 18302,100)
		Msg2Player("兑换成功，你获得了[100个武器光兑换券] x 100 ！")
	end
end
function erji()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2, 102, 18301,100)
		Msg2Player("兑换成功，你获得了[100个称号兑换券] x 100 ！")
	end
end
function yiji()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2, 102,18313,1)
		Msg2Player("兑换成功，你获得了[1个侠义令碎片] x 1 ！")
	end
end
function zongzi()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2, 1, 1125,50)
		Msg2Player("兑换成功，你获得了[粽子] x 5 ！")
	end
end

function yuebinya()
	if DelItem(2,95,204,1) == 1 then
		AddItem(1, 0, 292,4)
		Msg2Player("兑换成功，你获得了[月饼] x 4 ！")
	end
end
function yuntie()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2, 1, 1009,200)
		Msg2Player("兑换成功，你获得了[陨铁晶石] x 200 ！")
	end
end
function zbsp()
	if DelItem(2,95,204,2) == 1 then
		AddItem(2,1,1001,1)
		Msg2Player("兑换成功，你获得了[和氏璧] x 1 ！")
else
Talk(1,"","您并没有2个天罡令。")

	end
end

function tgltcb()
	if DelItem(2,95,204,5) == 1 then
		AddItem(2,1,9978,1)
		Msg2Player("兑换成功，你获得了[投诚表] x 1 ！")
	end
end

function cbwmadw()
	if DelItem(2,95,204,10) == 1 then
		AddItem(2,95,60002,1)
		Msg2Player("兑换成功，你获得了兑换天使玉1个 ！")
		AddLocalNews("恭喜玩家:"..GetName().." 兑换★混沌★紫玉碎片1个");
else
Talk(1,"","您并没有10个天罡令。")

	end
end

function cbwmadw1()
	if DelItem(2,95,204,200) == 1 then
		AddItem(2,0,1084,1)
		Msg2Player("兑换成功，天卦石 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().." 兑换天卦石1个");
	end
end
function cbwmadw2()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,1,1007,20)

	end
end
function cbwmadw3()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,1,1008,15)

	end
end
function cbwmadw4()
	if DelItem(2,95,204,10) == 1 then
		AddItem(2,95,60003,1)
else
Talk(1,"","您并没有10个天罡令。")


	end
end
function cbwmadw5()
	if DelItem(2,95,204,20) == 1 then
		AddItem(2,95,60004,1)
else
Talk(1,"","您并没有20个天罡令。")


	end
end
function cbwmadw6()
	if DelItem(2,95,204,5) == 1 then
		AddItem(2,95,1379,1)

	end
end
function cbwmadw7()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,95,247,10)

	end
end
function cbwmadw8()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,95,1501,5)

	end
end
function cbwmadw9()
	if DelItem(2,95,204,1) == 1 then
		AddItem(2,114,117,100)

	end
end
function cbwmadw10()
	if DelItem(2,95,204,100) == 1 then
		AddItem(2,95,674,100)
else
Talk(1,"","您并没有100个天罡令。")


	end
end

