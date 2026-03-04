Include("\\script\\lib\\globalfunctions.lua");

--训练宠物
function OnUse(nIdx)
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("你没有小貂或者没有召唤出来。");
		return
	end;
	if GetFightState() ~= 0 then
		Msg2Player("你当前在战斗状态，不能训练宠物。");
		return
	end
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil) or (ItemGen ~= 2 or ItemDetail ~= 20) then
		Msg2Player("在你的背包里没有看到小貂食物。");
		return
	end

	StartTrainPet(nPetItemIndex);
end
