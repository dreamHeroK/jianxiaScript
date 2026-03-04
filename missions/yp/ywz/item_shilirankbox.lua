Import("\\script\\missions\\yp\\ywz\\define.lua")

function OnUse(nItem)
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông");
		return 0;
	end
	if CustomAwardCheckCondition("SLYWZ_SLPMBX") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("SLYWZ_SLPMBX", 0);
end