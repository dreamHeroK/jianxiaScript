--第三套师门外装包
--by 
--2020/04/06

Include("\\script\\item\\coat_pack_head.lua");

tTab =
{
	{"峨眉第三套师门外装包", 2, 111, 77, 835, 3, "峨眉派", 15*24*60*60},
	{"丐帮第三套师门外装包", 2, 111, 78, 837, 4, "丐帮", 15*24*60*60},
	{"武当第三套师门外装包", 2, 111, 79, 841, 2, "武当派", 15*24*60*60},
	{"翠烟第三套师门外装包", 2, 111, 80, 847, 10, "翠烟门", 15*24*60*60},
	{"杨门第三套师门外装包", 2, 111, 81, 849, 6, "杨门", 15*24*60*60},
	{"少林第三套师门外装包", 2, 111, 82, 853, 1, "少林派", 15*24*60*60},
	{"明教第三套师门外装包", 2, 111, 83, 857, 9, "明教", 15*24*60*60},
	{"五毒第三套师门外装包", 2, 111, 84, 861, 7, "五毒教", 15*24*60*60},
	{"唐门第三套师门外装包", 2, 111, 85, 865, 5, "唐门", 15*24*60*60},
	{"昆仑第三套师门外装包", 2, 111, 86, 869, 8, "昆仑派", 15*24*60*60},

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
	local nFaction = tTab[nTabIndex][6]
	local szFacName = tTab[nTabIndex][7]
	local nExpired = tTab[nTabIndex][8]
	open_pack_item(nItemIndex, nGeneration, nFaction, szFacName, nExpired)
end
