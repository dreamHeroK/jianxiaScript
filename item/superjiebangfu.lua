Import("\\script\\lib\\globalfunctions.lua")


T_SUPER_JIEBANG_SUPPORT_EQUIP = {
	--[gf_PackItemGDP(g, d, p)] = {nMoneyCost(gold), {{nG1,nD1,nP1,nCount1}, {nG2,nD2,nP2,nCount2},...}, ...},
	[gf_PackItemGDP(0,152,35)] = {100,	{{2, 1, 31403, 1}, },	},
	[gf_PackItemGDP(0,153,35)] = {200,	{{2, 1, 31403, 2}, },	},
	[gf_PackItemGDP(0,154,35)] = {300,	{{2, 1, 31403, 3}, },	},
	[gf_PackItemGDP(0,152,34)] = {0,	{{2, 1, 31403, 3}, },	},
	[gf_PackItemGDP(0,153,34)] = {100,	{				   },	},
	[gf_PackItemGDP(0,154,34)] = {								},

}


--³¬¼¶½â°ó·ûÎïÆ·½Å±¾
--³¬¼¶½â°ó·û	2,1,31403
function OnUse(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: %s gióp më khãa trang bÞ kh«ng thÓ giao dÞch.",
		GetItemName(nItemIdx), GetItemName(nItemIdx))
	szTitle = format("%s\n%s",szTitle, "Xin chó ý:<color=red>gi¶i khãa trang bÞ sÏ xãa ®¸ quý kh¶m trªn trang bÞ.<color>")
	tinsert(tbSay, format("Ta muèn gi¶i khãa/#_OnUse_confirm(%d)", nItemIdx))
	tinsert(tbSay, format("Tra xem trang bÞ cã thÓ gi¶i khãa/#_view_detail(%d)", nItemIdx))
	tinsert(tbSay, "Ra khái/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _view_detail(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: gi¶i khãa trang bÞ kh¸c nhau cÇn tiªu hao vµng vµ sè l­îng vËt phÈm kh¸c nhau. HiÖn t¹i c¸c trang bÞ sau cã thÓ gi¶i khãa: \nBé trang bÞ s­ m«n 4, Bé trang bÞ s­ m«n 5, Trang bÞ Tinh Kh¾c, \nTrang bÞ Thiªn NghÜa, Trang bÞ H¹o NguyÖt, Trang bÞ Cöu Ch©u, \nTrang bÞ DiÖu D­¬ng, trang bÞ Vâ L©m Minh Chñ, Thiªn §Þa NhËt NguyÖt giíi chØ.",
		GetItemName(nItemIdx))

	tinsert(tbSay, format("trë l¹i/#OnUse(%d)", nItemIdx))
	tinsert(tbSay, "Ra khái/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OnUse_confirm(nItemIdx)
	SendScript2Client("Open([[CommonEnhanceItem]], 13);");
end

function UnBind(nItemIdx)
	if GetItemStatus(nItemIdx, 1) ~= 1 then
		return 0
	end

	if not T_SUPER_JIEBANG_SUPPORT_EQUIP then
		Talk(1, "", "VËt phÈm ch­a thÓ më khãa b»ng c¸ch nµy");  
		return 0
	end

	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(nG, nD, nP);
	local tInfo = T_SUPER_JIEBANG_SUPPORT_EQUIP[nGDP] or nil;

	if not tInfo then
		Talk(1, "", "VËt phÈm ch­a thÓ më khãa b»ng c¸ch nµy");  
		return 0
	end

	local nMoneyCost = tInfo[1] or 0;
	local tItemCost = tInfo[2] or nil;
	local szTitleHead = format("Më khãa <color=yellow>%s<color> cÇn tèn:", GetItemName(nItemIdx));
	local szTitle = "";

	if nMoneyCost and nMoneyCost > 0 then
		szTitle = format("\n<color=yellow>%d Vµng<color>", nMoneyCost);
	end

	local tItem, g, d, p, n, szItemName;
	if tItemCost and getn(tItemCost) > 0 then
		for i=1, getn(tItemCost) do
			tItem = tItemCost[i];
			g = tonumber(tItem[1]) or nil;
			d = tonumber(tItem[2]) or nil;
			p = tonumber(tItem[3]) or nil;
			n = tonumber(tItem[4]) or 0;
			if g >= 0 and d >= 0 and p>=0 and n > 0 then
				szItemName = GetItemName(g, d, p);
				szTitle = szTitle..format("\n<color=yellow>%s x%d<color>", szItemName, n);
			end
		end
	end
	if szTitle and szTitle ~= "" then
		szTitle = szTitleHead..szTitle;
	else
		szTitle = format("Muèn më khãa <color=yellow>%s<color> chø?", GetItemName(nItemIdx));
	end

	Say(szTitle, 2, format("§ång ý/#_UnBind_confirm(%d)", nItemIdx), "Hñy bá/nothing");

	return 1
end

function _UnBind_confirm(nItemIdx)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(nG, nD, nP);
	local tInfo = T_SUPER_JIEBANG_SUPPORT_EQUIP[nGDP] or nil;

	if not tInfo then
		return 0
	end

	local nMoneyCost = tInfo[1] or 0;
	local tItemCost = tInfo[2] or nil;

	if nMoneyCost and nMoneyCost > 0 then
		if (GetCash() or 0) < nMoneyCost*10000 then
			Talk(1, "", format("C¸c h¹ mang theo kh«ng ®ñ %d vµng", nMoneyCost)); 
			return 0 
		end
	end

	local tItem, g, d, p, n, szItemName;

	if tItemCost and getn(tItemCost) > 0 then
		for i=1, getn(tItemCost) do
			tItem = tItemCost[i];
			g = tonumber(tItem[1]) or nil;
			d = tonumber(tItem[2]) or nil;
			p = tonumber(tItem[3]) or nil;
			n = tonumber(tItem[4]) or 0;
			if g >= 0 and d >= 0 and p>=0 and n > 0 then
				if (GetItemCount(g, d, p) or 0) < n then
					Talk(1,"",format("%s kh«ng ®ñ %d", GetItemName(g, d, p) or "", n))
					return 0
				end
			end
		end
	end
	
	gf_SetLogCaption("SuperUnbindItem");
	if tItemCost and getn(tItemCost) > 0 then
		for i=1, getn(tItemCost) do
			tItem = tItemCost[i];
			g = tonumber(tItem[1]) or nil;
			d = tonumber(tItem[2]) or nil;
			p = tonumber(tItem[3]) or nil;
			n = tonumber(tItem[4]) or 0;
			if g >= 0 and d >= 0 and p>=0 and n > 0 then
				if gf_DelItem(g, d, p, n) ~= 1 then
					Talk(1,"","Sè liÖu b¸o lçi, xin liªn hÖ nhµ cung cÊp!");
					WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][CostItem][Faild][ItemName: %s(%d,%d,%d,%d) ]",
								GetName(), GetAccount(), GetItemName(g,d,p), g,d,p,n ));
					gf_SetLogCaption("");
					return 0
				end
			end
		end
	end
	gf_SetLogCaption("");


	if nMoneyCost > 0 and Pay(nMoneyCost*10000) ~= 1 then
		Talk(1,"","Sè liÖu b¸o lçi, xin liªn hÖ nhµ cung cÊp!");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][CostMoney][Faild][nMoney: %d(gold)]",
					GetName(), GetAccount(), nMoneyCost ));
		return 0
	end
	
	SetItemStatus(nItemIdx, 5, 1);	--//Ôö¼Ó×°±¸ºó°ó¶¨ÊôÐÔ
	SetItemStatus(nItemIdx, 1, 0);	--//È¥³ý°ó¶¨ÊôÐÔ
	ClearGemSocket(nItemIdx);		--//Çå³ý×°±¸ÉÏµÄ±¦Ê¯
	SyncItem2Client(nItemIdx);

	local bEquipBind = GetItemStatus(nItemIdx, 5);
	local bBind = GetItemStatus(nItemIdx, 1);
	if bEquipBind == 1 and bBind == 0 then
		Talk(1,"","Thao t¸c thµnh c«ng");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][Result][Success][bEquipBind=%d, bBind=%d]",
					GetName(), GetAccount(), bEquipBind, bBind ));
		return 1;
	else
		Talk(1,"","Thao t¸c thÊt b¹i, vui lßng liªn hÖ CSKH");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][Result][Faild][bEquipBind=%d, bBind=%d]",
					GetName(), GetAccount(), bEquipBind, bBind ));
		return 0;
	end
end

function no()
end