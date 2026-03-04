function main(sel)
	local nMapID = GetWorldPos()
	if nMapID == 6073 then
		return 0;
	end
	Msg2Player("皇陵密室陷阱重重,如果不小心会触发它们最好不要接近.")
	NewWorld(nMapID, 1600 ,3230);
end;