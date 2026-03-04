--挖矿
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local n = GetWorldPos()
	if n == 711 or n == 716 or n == 721 then
		OpenNewGatherWindow()
	else
		Msg2Player("此收集工具无法在此处使用。")
	end
end