--天使之殇物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用2个"..szBookName.."可以兑换<color=red>神级灵石<color>, 您需要兑换什么呢？",
		24,
		"◆使用1个"..szBookName.." 换【(雪)天使之恋】终级材料/cbwmadw",
		"◆使用1个"..szBookName.." 换【(花)天使之吻】终级材料/cbwmadw1",
		"◆使用1个"..szBookName.." 换 400【藏剑金令】/cbwmadw2",
		"◆使用1个"..szBookName.." 换 10【紫水晶】终级材料/cbwmadw3",
		"盔:◆10个"..szBookName.." 换 施展速度『神级◆灵石』/xuan_lingshi1",
		"   ◆10个"..szBookName.." 换 承伤减半『神级◆灵石』/xuan_lingshi2",
		"   ◆10个"..szBookName.." 换 耐久回复『神级◆灵石』/xuan_lingshi3",
		"铠:◆10个"..szBookName.." 换 承伤减半『神级◆灵石』/xuan_lingshi4",
		"   ◆10个"..szBookName.." 换 外攻百分『神级◆灵石』/xuan_lingshi5",
		"   ◆10个"..szBookName.." 换 内攻百分『神级◆灵石』/xuan_lingshi6",
		"   ◆10个"..szBookName.." 换 耐久回复『神级◆灵石』/xuan_lingshi7",
		"甲:◆10个"..szBookName.." 换 承伤减半『神级◆灵石』/xuan_lingshi8",
		"   ◆10个"..szBookName.." 换 生命回复『神级◆灵石』/xuan_lingshi9",
		"   ◆10个"..szBookName.." 换 耐久回复『神级◆灵石』/xuan_lingshi10",
		"兵:◆10个"..szBookName.." 换 外攻百分『神级◆灵石』/xuan_lingshi11",
		"   ◆10个"..szBookName.." 换 内攻百分『神级◆灵石』/xuan_lingshi12",
		"   ◆10个"..szBookName.." 换 削敌外防『神级◆灵石』/xuan_lingshi13",
		"   ◆10个"..szBookName.." 换 削敌内防『神级◆灵石』/xuan_lingshi14",
		"   ◆10个"..szBookName.." 换 耐久回复『神级◆灵石』/xuan_lingshi15",
		"◆30个"..szBookName.."换【头:神级灵石3件套】/xuan_lingshi16",
		"◆40个"..szBookName.."换【衣:神级灵石4件套】/xuan_lingshi19",
		"◆30个"..szBookName.."换【装:神级灵石3件套】/xuan_lingshi23",
		"◆50个"..szBookName.."换【武:神级灵石5件套】/xuan_lingshi26",
		"◆不 换 了/no_use"
        )
end


function no_use()
end	
function cbwmadw()
	if DelItem(2,95,60005,1) == 1 then
		AddItem(2,95,60000,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw1()
	if DelItem(2,95,60005,1) == 1 then
		AddItem(2,95,60001,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw2()
	if DelItem(2,95,60005,1) == 1 then
		AddItem(2,1,1139,400)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwmadw3()
	if DelItem(2,95,60005,1) == 1 then
		AddItem(2,95,60007,10)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end


function xuan_lingshi1()
	
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16145,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi2()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16146,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi3()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16147,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi4()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16148,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi5()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16149,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi6()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16150,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi7()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16151,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi8()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16152,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi9()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16153,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi10()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16154,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi11()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16155,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi12()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16156,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi13()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16157,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi14()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16158,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi15()
	if DelItem(2,95,60005,10) == 1 then
		AddLingShi(16159,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function xuan_lingshi16()
	
	if DelItem(2,95,60005,30) == 1 then
		AddLingShi(16145,0,7)
		AddLingShi(16146,0,7)
		AddLingShi(16147,0,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end


function xuan_lingshi19()
	if DelItem(2,95,60005,40) == 1 then
		AddLingShi(16148,1,7)
		AddLingShi(16149,1,7)
		AddLingShi(16150,1,7)
		AddLingShi(16151,1,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end



function xuan_lingshi23()
	if DelItem(2,95,60005,30) == 1 then
		AddLingShi(16152,3,7)
		AddLingShi(16153,3,7)
		AddLingShi(16154,3,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end



function xuan_lingshi26()
	if DelItem(2,95,60005,50) == 1 then
		AddLingShi(16155,2,7)
		AddLingShi(16156,2,7)
		AddLingShi(16157,2,7)
		AddLingShi(16158,2,7)
		AddLingShi(16159,2,7)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end




