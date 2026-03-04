--天罡令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		22,
		"◆1个(雪)天使之恋换天使之殇(月), 确定要使用吗？/cbwmadw",
		"◆1个(花)天使之吻换天使之殇(月), 确定要使用吗？/cbwmadw1",
		"注:◆〖头〗施展速度7级/xuan_lingshi1",
		"   ◆〖头〗承受减半7级/xuan_lingshi2",
		"   ◆〖头〗全属性7级/xuan_lingshi22",
		"   ◆〖头〗耐久回复7级/xuan_lingshi18",
		"注:◆〖衣〗承受减半7级/xuan_lingshi3",
		"   ◆〖衣〗全属性7级/xuan_lingshi23",
		"   ◆〖衣〗外攻百分比7级/xuan_lingshi20",
		"   ◆〖衣〗内攻百分比7级/xuan_lingshi21",
		"   ◆〖衣〗耐久回复7级/xuan_lingshi17",
		"注:◆〖装〗承受减半7级/xuan_lingshi5",
		"   ◆〖装〗全属性7级/xuan_lingshi6",
		"   ◆〖装〗生命上限7级/xuan_lingshi7",
		"   ◆〖装〗耐久回复7级/xuan_lingshi19",
		"注◆〖武〗外攻百分比7级/xuan_lingshi9",
		"   ◆〖武〗内攻百分比7级/xuan_lingshi10",
		"   ◆〖武〗削内防7级/xuan_lingshi11",
		"   ◆〖武〗削外防7级/xuan_lingshi12",
		"   ◆〖武〗伤害7级/xuan_lingshi15",
		"   ◆〖武〗耐久回复7级/xuan_lingshi16",
		"◆不 换 了/no_use"
        )
end


function no_use()
end	
function cbwmadw()
	if DelItem(2,95,60000,1) == 1 then
		AddItem(2,95,60005,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw1()
	if DelItem(2,95,60001,1) == 1 then
		AddItem(2,95,60005,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function xuan_lingshi1()
	
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(371,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi2()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(365,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi3()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(365,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi4()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(355,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi5()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(365,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi6()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(367,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi7()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(79,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi8()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(80,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi9()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(368,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi10()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(369,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi11()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(383,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi12()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(382,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi13()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(362,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi14()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(370,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi15()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(372,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi16()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(43,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi17()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(112,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi18()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(113,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi19()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(114,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi20()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(18,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi21()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(19,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi22()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(367,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi23()
	if DelItem(2,95,60005,1) == 1 then
		AddLingShi(367,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
