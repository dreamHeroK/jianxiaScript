function OnUse(nItem)
	Say(format("§ång ý më ngay %s kh«ng?", GetItemName(nItem)), 2, format("Më ngay/#OnUseQianDaoBox(%d)", nItem), "T¹i h¹ chØ xem qua th«i/nothing");
end

function OnUseQianDaoBox(nItem)
	local nP = GetItemParticular(nItem);
	local tBox = {
		[30957] = "QiandaoGift1",
		[30958] = "QiandaoGift2",
		[30959] = "QiandaoGift3",
		[30960] = "QiandaoGift4",
	}
	local szAward = tBox[nP];
	if CustomAwardCheckCondition(szAward) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		CustomAwardGiveGroup(szAward, 0);
	end
end