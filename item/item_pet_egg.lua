Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")
tCfg = {
	--[item_id] = {pet_id,name}
	[200130970] = {38, "B¸ V­¬ng Ng¹c"},
}
function OnUse(nItem)
	local g,d,p = GetItemInfoByIndex(nItem)
	local nId = PackItemId(g,d,p)
	local t = tCfg[nId]
	if not t then return end
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("Sè l­îng b¹n ®ång hµnh hiÖn t¹i v­ît qu¸ 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1)==1 then
		AddPet(t[1])
		Talk(1,"",format("NhËn ®­îc 1 ®ång hµnh %s", t[2]))
	end
end