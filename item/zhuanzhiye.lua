Include("\\script\\lib\\globalfunctions.lua")


function OnUse(nItemIndex)
local nMapID,nWx,nWy = GetWorldPos();
	if nMapID >= 300 then
		Talk(1,"","该地图无法使用");
		return 0;
	end;
local nPetItemIndex = GetPlayerEquipIndex(12);--获取副武器位置
	if nPetItemIndex > 0 then
        Talk(1, "", "取下副武器或宠物才可以使用")
		return
	end



 if (DelItem(2,94,4, 1) == 1) then
	local nCurStrength = GetStrength()
	local nCurVitality = GetVitality()
	local nCurDexterity = GetDexterity()
	local nCurEnergy = GetEnergy()
	local nCurObserve = GetObserve()
	SetStrength(1 - nCurStrength)
	SetVitality(1 - nCurVitality)
	SetDexterity(1 - nCurDexterity)
	SetEnergy(1 - nCurEnergy)
	SetObserve(1 - nCurObserve)
	SetPlayerRoute(ID)
	for i = 1, 22 do
       RemoveTitle(23, i)
	   RemoveTitle(24, i)
	   RemoveTitle(25, i)
	   RemoveTitle(26, i)
    end
	
	SaveNow()
	ExitGame();					-- 踢号存盘

end
end

