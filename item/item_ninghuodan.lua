--Äı»ğµ¤	1	0	30008
--Å­ÆøÖµ¼ÓÂú

_,AT_GGS = GetRealmType();
if 1==AT_GGS then
	Include("\\script\\paycoin_head.lua")
end

function OnUse(nItemIndex)
	if GetPlayerRoute() ~= 25 then
		Talk(1, "", "ChØ khi gia nhËp ph¸i <color=yellow>Minh Gi¸o Th¸nh ChiÕn<color> th× míi ®­îc sö dông Ng­ng Háa §¬n")
		return
	end
	local nCostGold = 0
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then --ÔÚ¿ç·şÇøÊ¹ÓÃ ¿Û3½ğ×Ó
		nCostGold = 3
	end
	
	if nCostGold > 0 and GetCash() < nCostGold then
		Msg2Player(format("§¹i hiÖp kh«ng cã ®ñ %d Vµng trªn ng­êi, kh«ng thÓ sö dông Ng­ng Háa §¬n", nCostGold))
		return
	end
	
	if RestoreGas() == 1 then
		if nCostGold > 0 then
			pc_pay_addtask(nCostGold * 10000)
		end
		--DelItemByIndex(nItemIndex, 1)
		return 1
	else
		Msg2Player("HiÖn ®iÓm Né khİ ®· ®Çy, kh«ng thÓ sö dông Ng­ng Háa §¬n")
	end
end