-- 击杀小怪获得经验提高类称号脚本

tTab =
{
	{2, 111, 20, "一箭双雕", 69, 1},
	{2, 111, 21, "二龙吐翠", 69, 2},
	{2, 111, 22, "三秋隔日", 69, 3},
	{2, 111, 23, "四海之志", 69, 4},
	{2, 111, 24, "五湖放舟", 69, 5},
}               
                
function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
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
	do_receive_title(nTabIndex)
end

function do_receive_title(nTabIndex)
	local nExist = 0
	for index, value in tTab do
		if IsTitleExist(tTab[index][5], tTab[index][6]) > 0 then
			nExist = index
			break
		end
	end
	
	if nTabIndex <= nExist then
		Say("领取称号失败！", 0)
	elseif DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		-- 删掉低等级的声望称号
		for index, value in tTab do
			RemoveTitle(value[5], value[6])
		end
		local nGenre = tTab[nTabIndex][5]
		local nDetail = tTab[nTabIndex][6]
		AddTitle(nGenre, nDetail)
		SetCurTitle(nGenre, nDetail)
		Msg2Player("你获得了永久["..tTab[nTabIndex][4].."]称号！")
	end
end
