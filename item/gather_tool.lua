
tTab =
{
	{0, 200, 41, "采集工具包", 500},
	{0, 200, 42, "高级采集工具包", 4500},
	{0, 200, 43, "超级采集工具包", 9000},
}

tMap =
{
	[1] = {710, 715, 720},
	[2] = {712, 717, 722},
	[3] = {713, 718, 723},
	[4] = {714, 719, 724},
	[5] = {711, 716, 721},
	[6] = {712, 717, 722},
	[7] = {710, 715, 720},
}


function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	do_gather_tool(nTabIndex)
end

function do_gather_tool(nTabIndex)
	local n = GetWorldPos()
	local fat = 0
	for i = 710, 724 do
		if n == i then
			fat = 1
		end
	end
	if fat == 1 then
		OpenNewGatherWindow()
	else
		Msg2Player("此收集工具无法在此处使用。")
	end


end