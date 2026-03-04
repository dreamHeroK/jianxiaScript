--采药
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local n = GetWorldPos()
	if n == 714 or n == 719 or n == 724 then
		OpenNewGatherWindow()
	else
		Msg2Player("此收集工具无法在此处使用。")
	end
end