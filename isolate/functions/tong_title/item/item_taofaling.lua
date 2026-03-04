Include("\\script\\isolate\\functions\\tong_title\\head.lua")

--function OnUse(nIdx)
--	do_use(nIdx, 0)
--end

function handle_use_item_taofaling(nIdx)
	return _handle_use_item_taofaling(nIdx, nil)
end

function _handle_use_item_taofaling(nIdx, bConfirm)
	if not bConfirm or bConfirm ~= 1 then
		local szTitle = format("Sau khi sö dông Th¶o Ph¹t cã thÓ t¨ng nhËn ®­îc tèi ®a HiÖp NghÜa Chi Chøng ngµy ®ã :%d, cã hiÖu lùc trong ngµy.", MAX_DAILY_DROP_XYZZ_EXT)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_handle_use_item_taofaling(%d, 1)", "§ång ý dïng", nIdx))
        tinsert(tbSay, format("%s/nothing", "Ra khái"))
        
        Say(szTitle, getn(tbSay), tbSay)
        return 0
	end
	
	if GetTongName() == "" then
		Talk(1, "", "Gia nhËp bang héi míi cã thÓ sö dông")
		return 0
	end
	
	if get_ext_drop() ~= 0 then
		Talk(1, "", "H«m nay ®· sö dông Th¶o Ph¹t LÖnh")
		return 0
	end
	
	local g,d,p,name= 2,1,30915,"Th¶o Ph¹t Lªnh "
	if DelItem(g,d,p, 1) == 1 then
		set_ext_drop(1)
		local szMsg = format("Chóc mõng sö dông thµnh c«ng Th¶o Ph¹t LÖnh, h«m nay nhËn ®­îc HiÖp NghÜa Chi Chøng t¨ng tèi ®a %d", MAX_DAILY_DROP_XYZZ_EXT)
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
		return 1
	else
		Talk(1, "", "Th¶o Ph¹t LÖnh kh«ng ®ñ.")
	end
	return 0
end