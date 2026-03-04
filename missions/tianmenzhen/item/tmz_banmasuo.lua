--绊马索

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("此物品无法在该地图中使用",0)
		return 0;
	end	
	if GetFightState() == 0 then
		Talk(1,"","在此状态下不能使用该物品");
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(1346,1);
		Msg2Player("陷阱设置。");
	end 
end

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 5060 and nMapID ~= 6027 then
		return 0;
	else
		return 1;
	end
end