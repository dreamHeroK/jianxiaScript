Include("\\script\\online_activites\\201506cn\\head.lua")

tItemCfg = {
	[pack_item_id(2,1,30872)] = 2,--·½ôÕ×ÓÀñºÐ
	[pack_item_id(2,1,30873)] = 3,--Ô²ôÕ×ÓÀñºÐ
}

function OnUse(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nAwardIndex = tItemCfg[pack_item_id(g,d,p)]
	if not nAwardIndex then
		return 0;
	end
	if check_player_condition()~= 1 then
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	
	local tAward = g_t201506cn.tMainAward[nAwardIndex]
	if get_task(nAwardIndex-1) >= tAward.nMaxCnt then
		Talk(1, "", "Sè lÇn sö dông ®· ®¹t giíi h¹n")
		return
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0
	end
	gf_EventGiveAllAward(tAward.tAll, "Ho¹t ®éng §oan Ngä", "1506cn")
	gf_EventGiveRandAward(tAward.tRand, 10000, 1, "Ho¹t ®éng §oan Ngä", "1506cn")

	add_task(nAwardIndex-1)
end