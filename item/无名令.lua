--无名令物品脚本
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say("使用"..szBookName.."可以兑换各种物品, 您需要兑换什么呢？",
		7,
		"\n◆10个换 秘籍兑换券 10个/cbwmadw",
		"\n◆100个换 秘籍兑换券 100个/cbwmadw1",
		"\n◆200个换 高级徽章箱 1个 /cbwmadw2",
		"\n◆200个换 高级披风箱 1个/cbwmadw3",
		"\n◆200个换 高级五行天仪箱 1个/cbwmadw4",
		"\n◆200个换 天使☆镇魂玉 1个/cbwmadw5",
		"\n◆不 换 了/no_use"
        )
end

function no_use()
end	
function cbwmadw()
	if DelItem(2,95,1511,10) == 1 then
		AddItem(2,95,2085,10)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw1()
	if DelItem(2,95,1511,100) == 1 then
		AddItem(2,95,2085,100)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmadw2()
	if DelItem(2,95,1511,100) == 1 then
		AddItem(2,103,150,1)
		Msg2Player("兑换成功，高级☆徽章箱 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().."使用无名令兑换高级☆徽章箱1个");
	end
end
function cbwmadw3()
	if DelItem(2,95,1511,100) == 1 then
		AddItem(2,103,151,1)
		Msg2Player("兑换成功，高级☆披风箱 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().."使用无名令兑换高级☆披风箱1个");
	end
end


function cbwmadw4()
	if DelItem(2,95,1511,100) == 1 then
		AddItem(2,103,152,1)
		Msg2Player("兑换成功，高级☆五行天仪箱 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().."使用无名令兑换高级☆五行天仪箱1个");
	end
end

function cbwmadw5()
	if DelItem(2,95,1511,100) == 1 then
		AddItem(2,103,153,1)
		Msg2Player("兑换成功，天使☆镇魂玉 x 1 ！")
		AddLocalNews("恭喜玩家:"..GetName().."使用无名令兑换天使☆镇魂玉1个");
	end
end

