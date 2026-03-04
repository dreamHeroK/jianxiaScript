--伐木
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local n = GetWorldPos()
	if n == 710 or n == 715 or n == 720 then
		OpenNewGatherWindow()
	else
		Msg2Player("此收集工具无法在此处使用。")
	end
end