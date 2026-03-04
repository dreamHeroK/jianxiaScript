--天罡令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		5,
		"\n◆1个换★混沌★紫玉碎片 5个/cbwmadw",
		"\n◆1个换★混沌★绿玉1个 /cbwmadw3",
		"\n◆1个换【天骄令】500个 /cbwmadw1",
		"\n◆1个换【天卦石】1个/cbwmadw2",
		--"◆1个换（十方镇恶称号）1年/cbwm16",
		--"◆1个换（似水年华称号）1年/cbwm17",
		--"◆1个换（势如破竹称号）1年/cbwm18",
		--"◆1个换（探花及第称号）1年/cbwm19",
		--"\n◆1个换（天下第一锤称号）1年/cbwm20",
		--"◆1个换（天下第一刀称号）1年/cbwm21",
		--"◆1个换（天下第一棍称号）1年/cbwm22",
		--"◆1个换（天下第一剑称号）1年/cbwm23",
		--"\n◆1个换（天下第一枪称号）1年/cbwm24",
		--"◆1个换（天下第一掌称号）1年/cbwm25",
		--"◆1个换（天下一飞刀称号）1年/cbwm26",
		--"◆1个换（天下一袖箭称号）1年/cbwm27",
		--"◆1个换（唯我独尊称号）1年/cbwm28",
		--"◆1个换（卧龙凤雏称号）1年/cbwm29",
		--"◆1个换（御赐状元称号）1年/cbwm30",
		--"◆1个换（众星捧月称号）1年/cbwm31",
		--"◆1个换（助攻王称号）1年/cbwm32",
		"\n◆不 换 了/no_use"
        )
end

function no_use()
end	
function cbwmadw()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,60002,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw1()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,97,236,500)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw2()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,0,1084,1)
		Msg2Player("兑换成功，天卦石 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().." 兑换天卦石1个");
	end
end
function cbwmadw3()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,60005,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end


function cbwm16()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40116,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm17()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40117,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm18()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40118,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm19()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40119,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm20()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40120,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm21()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40121,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm22()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40122,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm23()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40123,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm24()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40124,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm25()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40125,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm26()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40126,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm27()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40127,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm28()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40128,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm29()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40129,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm30()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40130,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm31()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40131,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm32()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,40132,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end