Include("\\script\\isolate\\functions\\armory\\item\\armory_box_nb.lua")

g_tMagicAttribute.tMagicInfo = {
	[1] = { -- 头 衣服 裤子 首饰
		{10, 10, 10, 10, {"力量增加,根骨增加,提高五行攻击属性", {819, 2}, {819, 2}, {855, 2}, {1174, 2},{1762, 1},{2560, 5}}},
		{10, 10, 10, 10, {"力量增加,洞察增加,提高五行攻击属性", {820, 2}, {820, 2}, {856, 2}, {1175, 2},{1763, 1},{2561, 5}}},
		{20, 20, 20, 20, {"力量增加,身法增加,提高五行攻击属性", {821, 2}, {821, 2}, {857, 2}, {1176, 2},{1764, 1},{2562, 5}}},
		{15, 15, 15, 15, {"内功增加,洞察增加,提高五行攻击属性", {822, 2}, {822, 2}, {858, 2}, {1177, 2},{1765, 1},{2563, 5}}},
		{10, 10, 10, 10, {"内功增加,身法增加,提高五行攻击属性", {823, 2}, {823, 2}, {859, 2}, {1178, 2},{1766, 1},{2564, 5}}},
		{10, 10, 10, 10, {"内功增加,根骨增加,提高五行攻击属性", {824, 2}, {824, 2}, {860, 2}, {1179, 2},{1767, 1},{2565, 5}}},
		{15, 15, 15, 15, {"洞察增加,身法增加,提高五行攻击属性", {825, 2}, {825, 2}, {861, 2}, {1180, 2},{1768, 1},{2566, 5}}},
		{5, 5, 5, 5,     {"洞察增加,根骨增加,提高五行攻击属性", {826, 2}, {826, 2}, {862, 2}, {1181, 2},{1769, 1},{2567, 5}}},
		{5, 5, 5, 5,     {"身法增加,根骨增加,提高五行攻击属性", {827, 2}, {827, 2}, {863, 2}, {1182, 2},{1770, 1},{2568, 5}}},
	},
	[2] = {
		{5, 5, 5, 5, {"所有攻击附带五行金属性,天命点数增加", {779, 2}, {779, 2}, {779, 2}, {1183, 2},{1771, 1},{2569, 5}}},
		{5, 5, 5, 5, {"所有攻击附带五行木属性,天命点数增加", {780, 2}, {780, 2}, {780, 2}, {1184, 2},{1772, 1},{2570, 5}}},
		{5, 5, 5, 5, {"所有攻击附带五行水属性,天命点数增加", {781, 2}, {781, 2}, {781, 2}, {1185, 2},{1773, 1},{2571, 5}}},
		{5, 5, 5, 5, {"所有攻击附带五行火属性,天命点数增加", {782, 2}, {782, 2}, {782, 2}, {1186, 2},{1774, 1},{2572, 5}}},
		{5, 5, 5, 5, {"所有攻击附带五行土属性,天命点数增加", {783, 2}, {783, 2}, {783, 2}, {1187, 2},{1775, 1},{2573, 5}}},
		{5, 5, 5, 5, {"增加金抗性,天命点数增加",             {784, 2}, {784, 2}, {784, 2}, {1188, 2},{1776, 1},{2574, 5}}},
		{5, 5, 5, 5, {"增加木抗性,天命点数增加",             {785, 2}, {785, 2}, {785, 2}, {1189, 2},{1777, 1},{2575, 5}}},
		{5, 5, 5, 5, {"增加水抗性,天命点数增加",             {786, 2}, {786, 2}, {786, 2}, {1190, 2},{1778, 1},{2576, 5}}},
		{5, 5, 5, 5, {"增加火抗性,天命点数增加",             {787, 2}, {787, 2}, {787, 2}, {1191, 2},{1779, 1},{2577, 5}}},
		{5, 5, 5, 5, {"增加土抗性,天命点数增加",             {788, 2}, {788, 2}, {788, 2}, {1192, 2},{1780, 1},{2578, 5}}},
		{10, 10, 10, 10, {"伤害增加,天命点数增加",           {790, 2}, {790, 2}, {790, 2}, {1194, 2},{1782, 1},{2579, 5}}},
		{10, 10, 10, 10, {"内攻提高,天命点数增加",           {790, 2}, {790, 2}, {790, 2}, {1195, 2},{1783, 1},{2580, 5}}},
		{5, 5, 5, 5, {"内攻提高,天命点数增加",           {795, 2}, {795, 2}, {795, 2}, {1198, 2},{1786, 1},{2581, 5}}},
	},
	[3] = {
		[1] = {1, 1, 1, 1, {"生命上限提高,内力上限提高,增加五行全抗性", {798, 2}, {799, 2}, {800, 2}, {1199, 2},{1787, 1},{2582, 5}}},
	},
};

g_tRouteArmory = {
	{1, {"师门专用6级头部纹饰", 0, 116, 6000, "纹饰-头"}},
	{1, {"师门专用6级上衣纹饰", 0, 113, 6000, "纹饰-衣"}},
	{1, {"师门专用6级下装纹饰", 0, 114, 6000, "纹饰-装"}},
	{1, {"师门专用6级首饰纹饰", 0, 115, 6000, "纹饰-首饰"}},
	{1, {"师门专用6级首饰纹饰", 0, 117, 6001, "纹饰-首饰2"}},
}

function Confirm(nSel)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	g_tPlayerData[GetName()] = {};

	local szTitle = format("<color=green>[%s]<color>: 确认是否兑换1个%s品质的师门纹饰。注意：师门纹饰的属性会随着纹饰的品质提升而增加。\n\n", tItem[1], g_tStringTable.tQuality[tItem[7]]);
	local tMenu = {
		"兑换1个指定的师门纹饰/#Award(" .. nSel .. ", 1)",
		-- "兑换品质为4的V╪ S鴆/#Award("..nSel..")",
		"我再考虑一下/nothing",
	};
	Say(szTitle, getn(tMenu), tMenu);

	return 1;
end

function Award(nSel, bRoute)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end

	g_tPlayerData[GetName()] = g_tPlayerData[GetName()] or {};
	if not g_tPlayerData[GetName()].bConfirm or 1 ~= g_tPlayerData[GetName()].bConfirm then
		MakeArmory(nSel, nil, bRoute);
		return 0;
	end

	local tData			= g_tPlayerData[GetName()];
	local tArmory			= {};
	local tMagicAttribute	= {};

	if not tData.nArmory or not tData.nSeries then
		return 0;
	end
	bRoute = tData.bRoute;
	
	if not bRoute then
		if not g_tArmory[tData.nArmory] or not g_tArmory[tData.nArmory][tItem[5]] or not g_tArmory[tData.nArmory][tItem[5]][tData.nSeries] then
			return 0;
		end
	else
		if not g_tRouteArmory[tData.nArmory] then
			return 0;
		end
	end

	if not bRoute then
		tArmory = g_tArmory[tData.nArmory][tItem[5]][tData.nSeries][2];
	else
		local tTempArmory = g_tRouteArmory[tData.nArmory][2];       
		tArmory = {tTempArmory[1], tTempArmory[2], tTempArmory[3], tTempArmory[4] + tonumber(GetPlayerRoute()) * 10}
	end

	for k, v in g_tMagicAttribute.tMagicInfo do
		if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
			return 0;
		end
		tMagicAttribute[k] = v[tData.tMagicAttribute[k]][5][1 + tItem[5]];
	end

	if 1 ~= DelItem(tItem[2], tItem[3], tItem[4], 1) then
		return 0;
	end
	
	gf_SetLogCaption(g_szLogCaption);
	local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, 1, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1, tItem[6]}, tArmory[1]);
	SetArmoryQuality(nIdx, tItem[7]);

	nothing();

	return 1;
end

function MakeArmory(nSel, nStep, bRoute)
	if not nStep then
		g_tPlayerData[GetName()] = {};
		nStep = 1;
	end
	bRoute = bRoute or g_tPlayerData[GetName()].bRoute;
	if 1 == nStep and not bRoute then
		MakeArmory_Armory(nSel, nStep);
	elseif 2 == nStep and not bRoute then
		MakeArmory_Series(nSel, nStep);
	elseif 1 == nStep and bRoute then
		MakeArmory(nSel, nStep + 1, bRoute);
	elseif 2 == nStep and bRoute then
		MakeArmory_Route(nSel, nStep);
	elseif 3 == nStep then
		MakeArmory_MagicAttribute(nSel, nStep, 1);
	elseif 4 == nStep then
		MakeArmory_MagicAttribute(nSel, nStep, 2);
	elseif 5 == nStep then
		MakeArmory_MagicAttribute(nSel, nStep, 3);
	elseif 6 == nStep then
		MakeArmory_Confirm(nSel, nStep);
	elseif 7 == nStep then
		Award(nSel);
	else
		Confirm(nSel);
	end

	return 1;
end

function MakeArmory_Confirm(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];
	if not tItem then
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	if not tData then
		return 0;
	end
	if not nValue then
		local szMsg = format("<color=green>[%s]<color>: 是否确认\n", tItem[1]);

		if tData.bRoute then
			if not tData.nArmory or not g_tRouteArmory[tData.nArmory] then
				return 0;
			end
		else
			if not tData.nArmory or not g_tStringTable.tArmoryEx[tData.nArmory] then
				return 0;
			end
		end
		if tData.bRoute then
			local tArmory = g_tRouteArmory[tData.nArmory][2];
			local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4] + tonumber(GetPlayerRoute()) * 10);
			szMsg = szMsg .. format("\t\t%s\n", szItemName);
		else
			szMsg = szMsg..format("\t\t%s\n", g_tStringTable.tArmoryEx[tData.nArmory]);
		end

		if not tData.bRoute then
			if not tData.nSeries or not g_tStringTable.tSeries[tData.nSeries] then
				return 0;
			end
			szMsg = szMsg..format("\t\t系列 - %s\n", g_tStringTable.tSeries[tData.nSeries]);
		end

		for k, v in g_tMagicAttribute.tMagicInfo do
			if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
				return 0;
			end
			szMsg = szMsg..format("\t\t属性 - %s\n", v[tData.tMagicAttribute[k]][5][1]);
		end

		local tMenu = {
			format("\n确认	/#MakeArmory_Confirm(%d,%d,%d)", nSel, nStep, 1),
			format("\n返回	/#MakeArmory(%d, %d)", nSel, nStep - 1),
			"取消	/nothing",
		};

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end

	if 1 == nValue then
		g_tPlayerData[GetName()].bConfirm = 1;
		MakeArmory(nSel, nStep + 1);
	end

	return 1;
end
function MakeArmory_Route(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if not nValue then
		local szMsg = format("<color=green>[%s]<color>: 纹饰部位分为于纹饰-衣服、纹饰-下装、纹饰-首饰、纹饰-头部、纹饰-首饰2\n\n", tItem[1]);
		local tMenu = {
			format("\n返回	/#Confirm(%d)", nSel),
			"取消	/nothing",
		};
		for k, v in g_tRouteArmory do
			tinsert(tMenu, getn(tMenu) - 1, format("@ %s%s /#MakeArmory_Route(%d, %d, %d)", v[2][5], gf_GetRouteName(), nSel, nStep, k));
		end

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end
	g_tPlayerData[GetName()].nArmory = nValue;
	g_tPlayerData[GetName()].nSeries = 1;
	g_tPlayerData[GetName()].bRoute = 1;
	MakeArmory(nSel, nStep + 1);

	return 1;
end
