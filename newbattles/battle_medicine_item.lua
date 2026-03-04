Include("\\script\\newbattles\\functions.lua");
function OnUse(nItemIdx)
	local nCurMapID = GetWorldPos();
	if BT_GetData(PT_BATTLE_TYPE) == 0 and nCurMapID ~= 606 then
		Msg2Player("专门的战场药品只能在战场使用");
		return 0;
	end;
	if abs(BT_GetData(PT_CURRANK)) < get_medicine_rank(nItemIdx) then
		Msg2Player("您的军衔太低，无法使用这种药品");
		return 0;
	end;
	return 1;
end;

function get_medicine_rank(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tBattleMed do
		if v[2] == nGenre and v[3] == nDetail and v[4] == nParticular then
			return tBattleMed[i][7];
		end;
	end;
	for i,v in tPKMed do
		if v[2] == nGenre and v[3] == nDetail and v[4] == nParticular then
			return tPKMed[i][7];
		end;	
	end;
	return 0;
end;