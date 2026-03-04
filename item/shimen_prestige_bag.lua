Import("\\script\\lib\\globalfunctions.lua")

--gdp£º

TASKID_DAILY_SPB_USE_COUNT 		= 3606	--ÈÕÇå£º¼ÇÂ¼Ã¿ÈÕÊ¹ÓÃ´ÎÊý

N_SPB_DAILY_USE_COUNT_LIMIT 	= 16	--Ã¿ÈÕÊ¹ÓÃÉÏÏÞ
N_SPB_FACTION_PRESTIGE_PER_BAG 	= 3400	--Ã¿°üÊ¦ÃÅÍþÍû


function OnUse(nItemIdx)
	if GetTask(TASKID_NFT_FACTION_PRESTIGE) + N_SPB_FACTION_PRESTIGE_PER_BAG > G_N_FACTION_PRESTIGE_MAX then
		Talk(1,"","Danh Väng S­ M«n ®· hoÆc s¾p ®¹t møc tèi ®a, kh«ng thÓ ®æi n÷a.")
		return
	end

	if GetTask(TASKID_DAILY_SPB_USE_COUNT) >= N_SPB_DAILY_USE_COUNT_LIMIT then
		Talk(1,"","§· hÕt l­ît ®æi h«m nay, ngµy mai thö l¹i sau.")
		return
	end

	gf_SetLogCaption("OPEN_PRESTIGE_BAG")

	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		Talk(1,"",format("§¹o cô bÞ lçi"))
		return
	end

	gf_ModifyTask(TASKID_DAILY_SPB_USE_COUNT, 1)
	gf_Modify("ShiMenWeiWang", N_SPB_FACTION_PRESTIGE_PER_BAG)
	gf_SetLogCaption("")
end

function nothing()
end