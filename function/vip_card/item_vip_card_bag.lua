Include("\\script\\function\\vip_card\\config.lua")

function OnUse(nItemIndex)
	return on_use_real(nItemIndex)
end

function on_use_real(nItemIndex, bConfirm)
	do return Talk(1,"", "ThÎ th¸ng ®· ngõng ho¹t ®éng. H·y mua §¹i HiÖp LÖnh t¹i Ngù C¸c") end
	if is_in_valid_date(1) ~= 1 then
		return 0
	end
	local szCardName = GetVipCardName(CUR_VIP_CARD_INDEX)
	if IsActivatedVipCard(CUR_VIP_CARD_INDEX) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>%s", szCardName, "TÝnh n¨ng t¹m ®ãng"))
		return 0
	end
	local g,d,p,time = GetVipCardTime(CUR_VIP_CARD_INDEX)
	if BigGetItemCount(g,d,p) > 0 then
		Talk(1,"",format("<color=green>%s:<color>%s", szCardName, "§· cã ThÎ VIP nµy, kh«ng thÓ më l¹i"))
		return 0
	end
	
	if GetVipCardIndex() == CUR_VIP_CARD_INDEX then
		Talk(1,"",format("<color=green>%s:<color>%s", szCardName, "§· kÝch ho¹t ThÎ VIP nµy, kh«ng thÓ më tiÕp"))
		return 0
	end
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 100) or GetFreeItemRoom() < 1 then
		Say("Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ", 0)
		return 0
	end
	
	local nExpritedays = 30
	if not bConfirm then
		local name = GetItemName(nItemIndex)
		local szMsg = format("Më %s sÏ nhËn ®­¬c %d <color=yellow>%s (%d ngµy)<color>. Muèn më?", name, 1, szCardName, nExpritedays)
		Say(szMsg,
			2,
			format("%s/#on_use_real(%d, 1)","Më", nItemIndex),
			format("%s/nothing","Ra khái"))
		return 0
	end
	if time > 0 then
		if DelItemByIndex(nItemIndex, 1) == 1 then
			local nRet, nIndex = AddItem(g,d,p,1,100*nExpritedays*24*3600+1)
			return 1
		end
	end
	return 0
end
