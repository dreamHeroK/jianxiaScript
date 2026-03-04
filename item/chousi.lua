--抽丝

function OnUse()
	local n = GetWorldPos()
	if n == 712 or n == 717 or n == 722 then
		OpenNewGatherWindow()
	else
		Msg2Player("此收集工具无法在此处使用。")
	end
end