
function OnUse(nItenIdx)
	local nAddExp = 400000000
	local nNeedItem = 1
	if CanModifyExp(nAddExp) ~= 1 then
		Talk(1,"", "Hi÷n kh´ng th” nhÀn kinh nghi÷m")
		return
	end
	
	if DelItemByIndex(nItenIdx, nNeedItem) == 1 then
		ModifyExp(nAddExp)
		Msg2Player(format("ChÛc mıng Æ∑ dÔng %d %s, nhÀn Æ≠Óc %d kinh nghi÷m", 1, "TÛi Kinh Nghi÷m V≠Ót ∂i", nAddExp))
		return 1
	end
end
