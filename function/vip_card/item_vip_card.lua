Include("\\script\\function\\vip_card\\config.lua")

function OnUse(nItemIndex)
	return on_use_real(nItemIndex)
end

function on_use_real(nItemIndex, bConfirm)
	if IsActivatedVipCard(CUR_VIP_CARD_INDEX) ~= 1 then
		Talk(1,"",format("%s", "Danh phËn §¹i HiÖp t¹m ch­a më"))
		return 0
	end
	
	local szCardName = GetVipCardName(CUR_VIP_CARD_INDEX)
	local g,d,p,time = GetVipCardTime(CUR_VIP_CARD_INDEX)
	local nG, nD, nP = GetItemInfoByIndex(nItemIndex)
	local szMsg = ""
	local szTime = ""
	local name = GetItemName(nItemIndex)
	if 1==is_in_valid_date(0) then
		szTime = format(" %s: <color=yellow>%s<color>\n %s: Tõ <color=yellow>%s ®Õn %s<color>\n %s"
			, "ThÎ danh phËn VIP", szCardName, "H¹n dïng kÝch ho¹t", show_date(CUR_VIP_CARD_START_DATE), show_date(CUR_VIP_CARD_END_DATE), "Sau khi dïng T©n Thñ LÖnh hoÆc CÈm Nang §¹i Sù KiÖn kÝch ho¹t sÏ nhËn ®­îc1 th¸ng danh phËn §¹i HiÖp")
	end
	if nG==g and nD==d and nP==p and szTime ~= "" then
		szMsg = format("<color=green>%s:<color>\n%s.",name, szTime)
	else
		szMsg = format("<color=green>%s:<color>%s\n\n%s.",name, "ThÎ danh phËn kh«ng hîp lÖ", szTime)
	end
	Talk(1, "", szMsg)
	return 1
end