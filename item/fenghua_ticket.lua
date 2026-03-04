Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\function\\ornament\\ornament.lua")

FH_EACH_POINT = 1

--·ç»ª»ý·Ö¾í	2, 1, 31004
function OnUse(nItemIdx)
	local nCnt = GetItemCount(2, 1, 31004)
	AskClientForNumber("doUse", 0, nCnt, "CÇn dïng bao nhiªu?");
end
function doUse(nNum)
	if nNum <= 0 then
		return
	end

	if DelItem(2,1,31004,nNum) ~= 1 then
		Talk(1,"","Sö dông thÊt b¹i")
		return
	end

	ornament_add_score(nNum*FH_EACH_POINT)
	Msg2Player(format("NhËn ®­îc %d ®iÓm Phong Hoa!",nNum*FH_EACH_POINT))
end