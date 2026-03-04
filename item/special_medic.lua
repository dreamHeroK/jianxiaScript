
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");

tTab =
{
	{1, 0, 125, "½µÁú°×ÔÆÉ¢", 1, "½µÁú±Ò", 7},
	{1, 0, 126, "½µÁúÔÆ½õĞø", 1, "½µÁú±Ò", 9},
	{1, 0, 127, "½µÁú¶ÏĞø¸à", 1, "½µÁú±Ò", 10},
	{1, 0, 128, "½µÁú´ó»¹µ¤", 1, "½µÁú±Ò", 7},
	{1, 0, 129, "½µÁú¸´Ê¼µ¤", 1, "½µÁú±Ò", 9},
	{1, 0, 130, "½µÁú¹éÔªµ¤", 1, "½µÁú±Ò", 10},
	{1, 0, 131, "½µÁúÓñÁéÉ¢", 1, "½µÁú±Ò", 10},
	{1, 0, 132, "½µÁúÓñÂ¶Íè", 1, "½µÁú±Ò", 15},
	{1, 0, 133, "½µÁúÔì»¯É¢", 1, "½µÁú±Ò", 20},
	{1, 0, 134, "½µÁú»Ø»êµ¤", 1, "½µÁú±Ò", 35},
	{1, 0, 135, "½µÁúÒİ·ç¸à", 1, "½µÁú±Ò", 0},
	{1, 0, 136, "½µÁúÒİ·çµ¤", 0, "½µÁú±Ò", 0},
	{1, 0, 137, "½µÁúÒİ·çÉ¢", 0, "½µÁú±Ò", 0},
	{1, 0, 138, "½µÁúÒİ·çÍè", 0, "½µÁú±Ò", 0},
	{1, 0, 139, "½µÁúÎŞ¼«µ¤", 2, "½µÁúÓñ", 5},
}

function check_Map()
	local nMapID = GetMissionV(MV_MAPID);
	if (SubWorldIdx2ID(SubWorld) == nMapID) then
		return 1
	end
	return 0
end

function OnUse(idx)
	if (check_Map() == 0) then
		Msg2Player("Ö»ÄÜÔÚ±ÈÎä´ó»á±ÈÈü³¡ÄÚÊ¹ÓÃ¡£")
		return 0;
	end

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
		return 0
	end

	local g_mediname = tTab[nTabIndex][4]
	local g_meditype = tTab[nTabIndex][5]
	local g_medineedname = tTab[nTabIndex][6]
	local g_medineed = tTab[nTabIndex][7]
	
	local nHave = 0
	if g_meditype == 1 then
		nHave = GetXYB()
	elseif g_meditype == 2 then 
		nHave = GetXYY()
	end

	if nHave < g_medineed then
		Talk(1,"","ÄúĞèÒªÓĞ<color=yellow>"..g_medineed.."Ã¶"..g_medineedname.."<color>²Å¿ÉÒÔÊ¹ÓÃ<color=yellow>"..g_mediname.."<color>£¬ÔÙ¼ì²éÒ»ÏÂ°É¡£")
		return 0
	end
	if g_meditype == 1 then
		if PayXYB(g_medineed) ==1 then
			return 1
		end
	elseif g_meditype == 2 then 
		if PayXYY(g_medineed) ==1 then
			return 1
		end
	else
		return 1
	end
end;
