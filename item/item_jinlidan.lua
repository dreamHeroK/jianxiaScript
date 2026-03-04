function OnUse(nItem)
	local nValue = 50;
	local nCur, nMax = ModifyEnergy(0, 1);
	if nCur >= nMax then
		Talk(1,"","T¹m thêi kh«ng cÇn dïng Tinh Lùc §¬n");
		return 0;
	end
	local nActually = min((nMax - nCur), 50)
	Say(format("Dïng Tinh Lùc §¬n sÏ nhËn ®­îc %d ®iÓm tinh lùc, quyÕt ®Þnh dïng ngay kh«ng?", nActually), 2, format("Dïng ngay/#OnUseJinglidan(%d, %d)", nItem, nActually), "T¹i h¹ chØ xem qua th«i/nothing")
end

function OnUseJinglidan(nItem, nValue)
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	ModifyEnergy(nValue, 1);
end