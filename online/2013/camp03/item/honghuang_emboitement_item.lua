--洪荒诛邪装备包物品脚本
Include("\\script\\lib\\awardtemplet.lua");

function OnUse(nItemIndex)
	local nBody = GetBody();
	local nID3 = 0;
	if nBody == 1 then
		nID3  = 4028
	elseif nBody == 2 then
		nID3  = 4029
	elseif nBody == 3 then
		nID3  = 4030
	elseif nBody == 4 then
		nID3  = 4031
	end

	if DelItemByIndex(nItemIndex,1) == 1 then
		local nRet, nItemIdx = 0, 0
		nRet, nItemIdx = AddItem(0,103,nID3,1,4,-1,-1,-1,-1,-1,-1);
		nRet, nItemIdx = AddItem(0,100,nID3,1,4,-1,-1,-1,-1,-1,-1);
		nRet, nItemIdx = AddItem(0,101,nID3,1,4,-1,-1,-1,-1,-1,-1);
	end

end
