Include("\\script\\missions\\yp\\slymg\\head.lua")

function OnUse(nItem)
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	mg_ModifyScore(10);
end