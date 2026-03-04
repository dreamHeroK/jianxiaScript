--侠义令包裹
function OnUse(nItemIdx)
	local szBookName = GetItemName(nItemIdx) -- 取名称
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能使用"..szBookName)
		return
	end
	Say(""..szBookName.."确定要使用吗？",
		2,
		"开启/yes_use",
		"结束对话/no_use"
		)

end
function no_use()
end	
function yes_use()
	if DelItem(2,95,18336,1) == 1 then
AddItem(0,154,1,1,1,random(1,1),random(5002,5027),random(1,1),random(5028,5042),random(1,1),random(5043,5047),0,random(1,15));

end
end