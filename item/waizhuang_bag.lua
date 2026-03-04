--飞絮青冥外装包、铁意凌风外装包、红绡金麟外装包
--by 
--2020/04/06

Include("\\script\\item\\coat_pack_head.lua");

tTab =
{
	{"飞絮青冥外装包", 2, 93, 64, 684},
	{"铁意凌风外装包", 2, 93, 65, 688},
	{"红绡金麟外装包", 2, 93, 66, 692},
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == nGenre and value[3] == nDetail and value[4] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	local nGeneration = tTab[nTabIndex][5]
	local nFaction = 0
	local nFacName = ""
	local nExpired = ""
	open_pack_item(nItemIndex, nGeneration, nFaction, szFacName, nExpired)
end
