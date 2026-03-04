Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")

EXCHANGE_NEED_NUM = 1000;
IS_BIND = 0;
T_RUNTIME_STATE_KEY = {
	[gf_PackItemGDP(2, 1, 31385)] = {93, 1},
	[gf_PackItemGDP(2, 1, 31384)] = {93, 2},
	[gf_PackItemGDP(2, 1, 31383)] = {93, 3},
	[gf_PackItemGDP(2, 1, 31397)] = {95, 1},
	[gf_PackItemGDP(2, 1, 31398)] = {95, 2},
	[gf_PackItemGDP(2, 1, 31399)] = {95, 3},
}

GOLDED_SNAKE_EQUIP = {
	--6¼¶½ðÉß
	[gf_PackItemGDP(2, 1, 31385)] = 
	{
	    {0,	152, 32, 1, 1, -1, -1, -1, -1, -1, -1},
		{0,	152, 33, 1, 1, -1, -1, -1, -1, -1, -1},
		{0,	152, 34, 1, 1, -1, -1, -1, -1, -1, -1},
	},
	[gf_PackItemGDP(2, 1, 31384)] = 
	{
	    {0,	153, 32, 1, 1, -1, -1, -1, -1, -1, -1},
	    {0,	153, 33, 1, 1, -1, -1, -1, -1, -1, -1},
	    {0,	153, 34, 1, 1, -1, -1, -1, -1, -1, -1},
	},
	[gf_PackItemGDP(2, 1, 31383)] = 
	{
	    {0,	154, 32, 1, 1, -1, -1, -1, -1, -1, -1},
	    {0,	154, 33, 1, 1, -1, -1, -1, -1, -1, -1},
	    {0,	154, 34, 1, 1, -1, -1, -1, -1, -1, -1},
	},

	--7¼¶½ðÉß
	[gf_PackItemGDP(2, 1, 31397)] = 
	{
	    {0,	154, 35, 1, 1, -1, -1, -1, -1, -1, -1},
		{0,	154, 36, 1, 1, -1, -1, -1, -1, -1, -1},
		{0,	154, 37, 1, 1, -1, -1, -1, -1, -1, -1},
	},
	[gf_PackItemGDP(2, 1, 31398)] = 
	{
	    {0,	153, 35, 1, 1, -1, -1, -1, -1, -1, -1},
	    {0,	153, 36, 1, 1, -1, -1, -1, -1, -1, -1},
	    {0,	153, 37, 1, 1, -1, -1, -1, -1, -1, -1},
	},
	[gf_PackItemGDP(2, 1, 31399)] = 
	{
	    {0,	152, 35, 1, 1, -1, -1, -1, -1, -1, -1},
		{0,	152, 36, 1, 1, -1, -1, -1, -1, -1, -1},
		{0,	152, 37, 1, 1, -1, -1, -1, -1, -1, -1},
	},
}

function OnUse(nItemIdx)
	local nItemIdx = tonumber(nItemIdx);
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(nGenre,nDetail,nParticular);

	if not GOLDED_SNAKE_EQUIP[nGDP] then
		return 0;
	end

	local szItemName = GetItemName(nItemIdx);
	local tEquipInfo = GOLDED_SNAKE_EQUIP[nGDP];

	if GetItemCount(nGenre, nDetail, nParticular) < EXCHANGE_NEED_NUM then
		Talk(1,"",format("<color=yellow>%s<color> kh«ng ®ñ <color=red>%d<color>", szItemName, EXCHANGE_NEED_NUM) )
		return 0;
	end

	if gf_Judge_Room_Weight(1, 100," ") ~= 1 then
		return 0;
	end

	local tbSay = {};
	local isBind = GetItemSpecialAttr(nItemIdx,"BIND")
	--local isBind = IS_BIND;
	tbSay.msg = format("%s nghÜ kü muèn ®æi trang bÞ nµo ch­a?", gf_GetPlayerSexName());
	tbSay.sel = {};
	for i = 1, getn(tEquipInfo) do
		local v = tEquipInfo[i];
		local szItemName = GetItemName(v[1], v[2], v[3]);
		tinsert(tbSay.sel, {szItemName, format("#ExchangeJS('%s', %d, %d, %d)", szItemName, nGDP, i, isBind)});
	end
	tinsert(tbSay.sel, {"Ra khái","nothing"});
	temp_Talk(tbSay);
end

function ExchangeJS(szItemName, nGDP, nIndex, isBind)
	Say(format("B¹n ch¾c ch¾n muèn ®æi <color=gold>%s<color> kh«ng?", szItemName), 2,
		format("§ång ý/#ExchangeJS_sure('%s', %d, %d, %d)", szItemName, nGDP, nIndex, isBind), "Hñy bá/nothing");
end

function ExchangeJS_sure(szItemName, nGDP, nIndex, isBind)
	if not GOLDED_SNAKE_EQUIP[nGDP] then
		return 0;
	end

	if gf_Judge_Room_Weight(1, 100) ~= 1 then
		return 0;
	end

	local nG, nD, nP = gf_UnpackItemGDP(nGDP);
	local tEquipInfo = GOLDED_SNAKE_EQUIP[nGDP];

	if DelItem(nG, nD, nP, EXCHANGE_NEED_NUM) ~= 1 then
		return 0;
	end

	if isBind == 1 then 
		tEquipInfo[nIndex][5] = 4
	else
		tEquipInfo[nIndex][5] = 1
	end
	gf_AddItemEx2(tEquipInfo[nIndex], szItemName, "GoldenSnakeEquipPiece", "ExchangeGSPieceforEquip", 0, 1);
	if T_RUNTIME_STATE_KEY[nGDP] then
		local tStateKey = T_RUNTIME_STATE_KEY[nGDP];
		AddRuntimeStat(tStateKey[1], tStateKey[2], 0, 1);
	end
end