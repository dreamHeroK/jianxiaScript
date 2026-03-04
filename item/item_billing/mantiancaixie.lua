Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","当前地图无法使用！");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(871, 1);
	end;
end;