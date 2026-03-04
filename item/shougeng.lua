--收耕

function OnUse()
	local n = GetWorldPos()
	if n == 713 or n == 718 or n == 723 then
		OpenNewGatherWindow()
	else
		Msg2Player("此收集工具无法在此处使用。")
	end
end