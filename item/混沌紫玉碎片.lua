--天罡令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		5,
		"◆1个换【天罡令】10个/cbwmadw",
		--"◆1个换【东皇玄铁】400个/cbwmadw10",
		"◆5个换★混沌★紫玉1个/cbwmadw7",

		"◆5个换★混沌★金玉1个/cbwmadw8",
		"◆5个换★混沌★绿玉1个/cbwmadw11",

		--"\n◆100个换[+15]永久侠士装备4件套/cbwmadw9",
		--"\n◆80个换7级阳灵石【天之乾】套12个/cbwmadw12",
		--"◆40个换6级阴灵石【地之坤】套12个/cbwmadw13",



		--"◆1个换【三英称号】，全属性30有效时间7天/cbwmadw4",
		--"◆1个换【十杀称号】，全属性50有效时间7天/cbwmadw5",
		--"◆1个换【百破称号】，全属性80有效时间7天/cbwmadw6",
		--"◆1个换【千军称号】，全属性100有效时间7天/cbwmadw1",
		--"◆2个换【万勇称号】，全属性120有效时间7天/cbwmadw2",
		--"◆3个换【无双称号】，全属性150有效时间7天/cbwmadw3",
		"\n不 换 了/no_use"
        )
end

function no_use()
end	
function cbwmadw()
	if DelItem(2,95,60002,1) == 1 then
		AddItem(2,95,204,10)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw4()
	if DelItem(2,95,60002,1) == 1 then
		AddItem(2,95,240,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw5()
	if DelItem(2,95,60002,1) == 1 then
		AddItem(2,95,241,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw6()
	if DelItem(2,95,60002,1) == 1 then
		AddItem(2,95,242,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
	end
end	
function cbwmadw7()
	if DelItem(2,95,60002,5) == 1 then
		AddItem(2,95,60000,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
else
Talk(1,"","您并没有5个★混沌★紫玉碎片。")


	end
end
function cbwmadw8()
	if DelItem(2,95,60002,5) == 1 then
		AddItem(2,95,60001,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
else
Talk(1,"","您并没有5个★混沌★紫玉碎片。")


	end
end
function cbwmadw1()
	if DelItem(2,95,60002,1) == 1 then
		AddItem(2,95,243,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw2()
	if DelItem(2,95,60002,2) == 1 then
		AddItem(2,95,244,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw3()
	if DelItem(2,95,60002,3) == 1 then
		AddItem(2,95,245,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw9()
	if DelItem(2,95,60002,100) == 1 then
		AddItem(2,95,60006,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
		AddLocalNews("恭喜玩家:"..GetName().." 兑换永久侠士宝箱1个，可开启永久[+15]侠士装备整套。从此走在无敌之路。");


	end
end
function cbwmadw10()
	if DelItem(2,95,60002,1) == 1 then
		AddItem(2,114,171,400)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw11()
	if DelItem(2,95,60002,5) == 1 then
		AddItem(2,95,60005,1)
		Msg2Player("你已兑换成功，你变强更进一步！")
else
Talk(1,"","您并没有5个★混沌★紫玉碎片。")


	end
end

function cbwmadw12()
	if DelItem(2,95,60002,80) == 1 then
		AddLingShi(2525,0,7)
		AddLingShi(2526,0,7)
		AddLingShi(2528,0,7)
		AddLingShi(2525,1,7)
		AddLingShi(2526,1,7)
		AddLingShi(2527,1,7)
		AddLingShi(2525,3,7)
		AddLingShi(2526,3,7)
		AddLingShi(2527,3,7)
		AddLingShi(2527,2,7)
		AddLingShi(2529,2,7)
		AddLingShi(2530,2,7)
		Msg2Player("你已兑换成功，可制做【天之乾八卦套】！")


	end
end
function cbwmadw13()
	if DelItem(2,95,60002,40) == 1 then
		AddLingShi(2525,0,6)
		AddLingShi(2526,0,6)
		AddLingShi(2528,0,6)
		AddLingShi(2525,1,6)
		AddLingShi(2526,1,6)
		AddLingShi(2527,1,6)
		AddLingShi(2525,3,6)
		AddLingShi(2526,3,6)
		AddLingShi(2527,3,6)
		AddLingShi(2527,2,6)
		AddLingShi(2529,2,6)
		AddLingShi(2530,2,6)
		Msg2Player("你已兑换成功，可制做【地之坤八卦套】！")


	end
end
