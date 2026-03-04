--天罡令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		5,
		"◆1个换【(风)天使之魂】终级材料5个/cbwmadw",
		"◆1个换【(月)天使之殇】终级材料1个/cbwmadw3",
		"◆1个换【天骄令】500个/cbwmadw1",
		"◆1个换【天卦石】1个/cbwmadw2",
		--"◆1个换（榜眼及第称号）/cbwm0",
		--"◆1个换（兵不血刃称号）/cbwm1",
		--"◆1个换（超神称号）/cbwm2",
		--"◆1个换（辰砂之主称号）/cbwm3",
		--"◆1个换（楚楚动人称号）/cbwm4",
		--"◆1个换（独霸天下称号）/cbwm5",
		--"◆1个换（孤独求败称号）/cbwm6",
		--"◆1个换（花落流年称号）/cbwm7",
		--"◆1个换（极道天骄称号）/cbwm8",
		--"◆1个换（进士出身称号）/cbwm9",
		--"◆1个换（精忠报国称号）/cbwm10",
		--"◆1个换（九洲王者称号）/cbwm11",
		--"1个换（梦称号）/cbwm12",
		--"◆1个换（倾国倾城号）/cbwm13",
		--"◆1个换（倾国倾城2号）/cbwm14",
		--"1个换（人气宝贝称号）/cbwm15",
		"◆不 换 了/no_use"
        )
end

function no_use()
end	
function cbwmadw()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,60002,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw1()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,97,236,500)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw2()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,0,1084,1)
		Msg2Player("兑换成功，天卦石 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().." 兑换天卦石1个");
	end
end

function cbwmadw3()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,60005,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm0()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40100,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm1()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40101,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm2()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40102,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm3()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40103,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm4()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40104,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm5()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40105,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm6()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40106,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm7()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40107,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm8()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40108,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm9()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40109,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm10()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40110,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm11()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40111,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm12()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40112,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm13()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40113,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm14()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40114,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm15()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,40115,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end