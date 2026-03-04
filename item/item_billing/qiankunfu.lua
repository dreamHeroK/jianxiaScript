-- 乾坤符

tQKF = {2, 0, 555}

tItem = {
--	{2, 0, 1084, "天卦石"}, 
	{0, 102, 8801, "轩辕战"}, 
	{0, 102, 8802, "轩辕斗"}, 
	{0, 102, 8803, "轩辕战"}, 
	{0, 102, 8804, "轩辕斗"}, 
	{0, 102, 8805, "轩辕战"}, 
	{0, 102, 8806, "轩辕斗"}, 
	{0, 102, 8807, "轩辕战"}, 
	{0, 102, 8808, "轩辕斗"}, 
	{0, 102, 8809, "轩辕战"}, 
	{0, 102, 8810, "轩辕斗"}, 
	{0, 102, 8811, "轩辕战"}, 
	{0, 102, 8812, "轩辕斗"}, 
	{0, 102, 8813, "轩辕战"}, 
	{0, 102, 8814, "轩辕斗"}, 
	{0, 102, 8815, "轩辕战"}, 
	{0, 102, 8816, "轩辕斗"}, 
	{0, 102, 8817, "轩辕战"}, 
	{0, 102, 8818, "轩辕斗"}, 
	{0, 102, 8819, "轩辕战"}, 
	{0, 102, 8820, "轩辕斗"}, 
	{0, 102, 8821, "轩辕战"}, 
	{0, 102, 8822, "轩辕斗"}, 
	{0, 102, 8823, "轩辕战"}, 
	{0, 102, 8824, "轩辕斗"}, 
	{0, 102, 8825, "轩辕战"}, 
	{0, 102, 8826, "轩辕斗"}, 
	{0, 102, 8827, "轩辕战"}, 
	{0, 102, 8828, "轩辕斗"}, 
	{0, 102, 8829, "轩辕战"}, 
	{0, 102, 8830, "轩辕斗"}, 
	{0, 102, 8831, "轩辕战"}, 
	{0, 102, 8832, "轩辕斗"}, 
	{0, 102, 8833, "轩辕战"}, 
	{0, 102, 8834, "轩辕斗"}, 
	{0, 102, 8835, "轩辕战"}, 
	{0, 102, 8836, "轩辕斗"}, 
	{0, 102, 8837, "轩辕战"}, 
	{0, 102, 8838, "轩辕斗"}, 
	{0, 102, 8839, "轩辕战"}, 
	{0, 102, 8848, "轩辕斗"}, 
	{0, 102, 42, "嫦娥月舞带"}, 	
	{0, 102, 43, "后羿落日环"}, 	
	{0, 102, 24, "东方龙珠"}, 	
	
	
	
	
}

strTitle = "<color=green>乾坤符<color>："

function OnUse()
	EnterQKBind()
end

function OnItemLock()
	Say("该装备不支持使用乾坤符", 0)
end

function OnBindCheck(nItemIndex, bIsBind)
	
	if bIsBind > 0 then		-- 已经是绑定装备了
		Talk(1,"",format("%s你的装备已绑定，请先解绑。", strTitle));
		return 0
	end
	local nGeren, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local bBIND = GetItemSpecialAttr(nItemIndex,"BIND")
	if bBIND > 0 then
	--	Say("Trang b? n祔 kh玭g th? d飊g V筺 N╪g Ph?.", 0)
		return 0
	end
	local nIndex = CheckInItemList(nGeren, nDetail, nParticular)
	if nIndex == 0 then
		local szMsg = "当前支持<color=yellow>"
		for i = 1, getn(tItem) do
			if tItem[i][5] and tItem[i][5] == 1 then
				szMsg = szMsg..tItem[i][4].." "
			end
		end
		szMsg =  "目前仅开放<color=yellow>轩辕首饰<color>"
		szMsg = szMsg.."可解除交易限制。"
		Say(strTitle..szMsg, 0)
		return 0
	else
		-- 删除乾坤符，一定要记得删除啊啊啊啊
		if DelItem(tQKF[1], tQKF[2], tQKF[3], 1) == 1 then
			local szMsg = tItem[nIndex][4].."已经解除绑定，可以进行交易"
			Say(szMsg, 0)
			return 1
		else
			Msg2Player("程序出错。")
			return 0
		end
	end
end


function CheckInItemList(nGeren, nDetail, nParticular)	
	local isExist = 0
	for index, value in tItem do
		if nGeren == value[1] and nDetail == value[2] and nParticular == value[3] then
			isExist = index
			break
		end
	end
	return isExist
end
