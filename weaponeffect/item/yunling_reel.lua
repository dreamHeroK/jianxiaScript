
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)

	local G, D, P, EL, EI =  gf_GetCoatEffect(nGenre, nDetail, nParticular)

--	Msg2Player(format("%d-%d-%d-%d-%d-%d-%d-%d", nGenre, nDetail, nParticular,G, D, P, EL, EI));
	if DelItem(nGenre, nDetail, nParticular, 1) == 1 then
		gf_AddEffectScroll(G, D, P, 1, 1, EL, EI)
	end
end