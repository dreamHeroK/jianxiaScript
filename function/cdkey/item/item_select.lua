Import("\\script\\lib\\globalfunctions.lua")

S_ITS_LOG_TITLE = "ItemSelect"

T_AWARD_COSET_INFO =
{	
	--×ÔÑ¡4¼¶½ðÉßÌ×
	[gf_PackItemGDP(2,1,31516)] = {
		[1] = {
			[1] = {
				[1] = "Bé V©n Du",
				[2] = {
					{"¸o Choµng V©n Du", {0, 152, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Huy Ch­¬ng V©n Du", {0, 153, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"V©n Du Ngoa", {0, 154, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[2] = {
				[1] = "Bé ThiÕt HuyÕt",
				[2] = {
					{"Huy Ch­¬ng ThiÕt HuyÕt", {0, 153, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"¸o Choµng ThiÕt HuyÕt", {0, 152, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"ThiÕt HuyÕt Ngoa", {0, 154, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[3] = {
				[1] = "Bé Du HiÖp",
				[2] = {
					{"Huy Ch­¬ng Du HiÖp", {0, 153, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"¸o Choµng Du HiÖp", {0, 152, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"ChiÕn Hµi Du HiÖp", {0, 154, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
		},
	},
	--×ÔÑ¡5¼¶½ðÉßÌ×
	[gf_PackItemGDP(2,1,31517)] = {
		[1] = {
			[1] = {
				[1] = "Bé §»ng V©n",
				[2] = {
					{"¸o kho¸c §»ng V©n", {0, 152, 31, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Huy ch­¬ng §»ng V©n", {0, 153, 31, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"§»ng V©n Ngoa", {0, 154, 31, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[2] = {
				[1] = "Bé HiÖp Cèt",
				[2] = {
					{"Huy ch­¬ng HiÖp Cèt", {0, 153, 29, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"¸o kho¸c HiÖp Cèt", {0, 152, 29, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"HiÖp Cèt Ngoa", {0, 154, 29, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[3] = {
				[1] = "Bé Quû Phñ",
				[2] = {
					{"Huy ch­¬ng Qñy Phï", {0, 153, 30, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"¸o kho¸c Qñy Phï", {0, 152, 30, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Qñy Phï ChiÕn Ngoa", {0, 154, 30, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
		},
	},

	--±ä»»¿Ì°å°ü¹ü£¨Í·£©
	[gf_PackItemGDP(2,1,31518)] = {
		[1] = {
			[1] = {
				[1] = "Kh¾c B¶n Hoµn Mü CÊp 3 (§Çu)",
				[2] = {
					{"Kh¾c B¶n Hoµn Mü CÊp 3 (§Çu)", {2, 1, 31261, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thiªn M«n Kim LÖnh",	{2,1,30370,1}},
			{"Thiªn Cang LÖnh",	{2,95,204,1}},
		},
	},
	--±ä»»¿Ì°å°ü¹ü£¨ÉÏ×°£©
	[gf_PackItemGDP(2,1,31519)] = {
		[1] = {
			[1] = {
				[1] = "Kh¾c B¶n Hoµn Mü CÊp 3 (ƒo)",
				[2] = {
					{"Kh¾c B¶n Hoµn Mü CÊp 3 (§Çu)", {2, 1, 31262, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thiªn M«n Kim LÖnh",	{2,1,30370,2}},
			{"Thiªn Cang LÖnh",	{2,95,204,2}},
		},
	},
	--±ä»»¿Ì°å°ü¹ü£¨ÏÂ×°£©
	[gf_PackItemGDP(2,1,31520)] = {
		[1] = {
			[1] = {
				[1] = "Kh¾c B¶n Hoµn Mü CÊp 3 (QuÇn)",
				[2] = {
					{"Kh¾c B¶n Hoµn Mü CÊp 3 (§Çu)", {2, 1, 31263, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thiªn M«n Kim LÖnh",	{2,1,30370,3}},
			{"Thiªn Cang LÖnh",	{2,95,204,3}},
		},
	},
	--±ä»»¿Ì°å°ü¹ü£¨½äÖ¸£©
	[gf_PackItemGDP(2,1,31521)] = {
		[1] = {
			[1] = {
				[1] = "Kh¾c B¶n Hoµn Mü CÊp 3 (NhÉn)",
				[2] = {
					{"Kh¾c B¶n Hoµn Mü CÊp 3 (NhÉn)", {2, 1, 31264, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thiªn M«n Kim LÖnh",	{2,1,30370,3}},
			{"Thiªn Cang LÖnh",	{2,95,204,3}},
		},
	},
	--±ä»»¿Ì°å°ü¹ü£¨Ñü×¹£©
	[gf_PackItemGDP(2,1,31522)] = {
		[1] = {
			[1] = {
				[1] = "Kh¾c B¶n Hoµn Mü CÊp 3 (Ngäc Béi)",
				[2] = {
					{"Kh¾c B¶n Hoµn Mü CÊp 3 (Ngäc Béi)", {2, 1, 31265, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thiªn M«n Kim LÖnh",	{2,1,30370,2}},
			{"Thiªn Cang LÖnh",	{2,95,204,2}},
		},
		--±³°ü¿Õ¼äÅÐ¶Ï
		--[3] = 1,
	},

}

function OnUse(nItemIdx)
	local nItemIdx = tonumber(nItemIdx)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx)
	local nGDP = gf_PackItemGDP(nG, nD, nP)

	if not T_AWARD_COSET_INFO[nGDP] then
		print(format("\n [Error] Missing Config in %s", [[\script\function\cdkey\item\Item_select.lua]]) )
		return 0
	end
	
	local tExchangeInfo = T_AWARD_COSET_INFO[nGDP]
	local szItemName = GetItemName(nItemIdx);
	local szSay = format("%s: H·y chän lo¹i muèn ®æi:\n", szItemName)
	local tSay = {}

	local tCostInfo = tExchangeInfo[2]
	if tCostInfo and getn(tCostInfo) > 0 then
		szSay = format("§æi %s cÇn tèn thªm:\n<color=red>", szSay)
		for i=1, getn(tCostInfo) do
			szSay = format("%s%s * %d\n", 
				szSay,
				GetItemName(tCostInfo[i][2][1],tCostInfo[i][2][2],tCostInfo[i][2][3]),
				tCostInfo[i][2][4])
		end
		szSay = format("%s<color>", szSay)
	end

	local tAwardInfo = tExchangeInfo[1]
	for i=1, getn(tAwardInfo) do
		tinsert(tSay, format("%s/#do_select(%d, %d, %d)", tAwardInfo[i][1], nItemIdx, nGDP, i) )
	end
	tinsert(tSay,"trë l¹i/nothing");

	Say(szSay, getn(tSay), tSay)
end

function do_select(nItemIdx, nGDP, nIndex)
	local tExchangeInfo = T_AWARD_COSET_INFO[nGDP]
	if not tExchangeInfo then
		return
	end

	local tAwardInfo = tExchangeInfo[1]
	if not tAwardInfo or not tAwardInfo[nIndex] then
		return
	end
	local tSelectAwardList = tAwardInfo[nIndex][2]

	if gf_JudgeRoomWeight(tExchangeInfo[3] or getn(tSelectAwardList), 0, "") ~= 1 then return end	

	gf_SetLogCaption(S_ITS_LOG_TITLE)
	local tCostInfo = tExchangeInfo[2]
	if tCostInfo and getn(tCostInfo) > 0 then
		--ÏÈ¼ì²âÊýÁ¿
		for i=1, getn(tCostInfo) do
			local g,d,p,n = tCostInfo[i][2][1],tCostInfo[i][2][2],tCostInfo[i][2][3],tCostInfo[i][2][4]
			if GetItemCount(g,d,p) < n then
				Talk(1,"", format("%s: <color=red> %s trong tói kh«ng ®ñ %d<color>", GetItemName(nItemIdx), GetItemName(g,d,p), n))
				gf_SetLogCaption("")
				return
			end
		end
		--ÔÙÉ¾³ýµÀ¾ß
		for i=1, getn(tCostInfo) do
			local g,d,p,n = tCostInfo[i][2][1],tCostInfo[i][2][2],tCostInfo[i][2][3],tCostInfo[i][2][4]
			if gf_DelItem(g,d,p,n) ~= 1 then
				Talk(1,"", format("%s: <color=red> %s trong tói kh«ng ®ñ %d<color>", GetItemName(nItemIdx), GetItemName(g,d,p), n))
				gf_SetLogCaption("")
				return
			end
		end
	end

	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		gf_SetLogCaption("")
		return
	end

	--¸ø½±Àø
	for i=1, getn(tSelectAwardList) do
		gf_AddItemEx(tSelectAwardList[i][2])
	end

	gf_SetLogCaption("")
end