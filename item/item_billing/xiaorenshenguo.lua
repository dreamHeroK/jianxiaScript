-- 小人参果
-- 4小时内提升秘籍修炼速度2倍，时间可累积。单击投入修为按钮弹出提示框提示
-- lizhi 2006-11-2 11:53

TASK_ID = 2506

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("服用一个小人参果可获得秘籍修炼速度2倍时间4小时，您当前还剩余"..nHour.."小时"..nMin.."分钟大人参果修炼时间，确定要服用吗？",
		2,
		"是的/yes_use",
		"取消/no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,552)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "服用小人参果数量")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 552, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("你使用了小人参果。用2倍速度修练秘籍的时间为"..nHour.."小时"..nMin.."分钟")
	end
end

function no_use()

end
