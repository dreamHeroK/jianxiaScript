Include("\\script\\lib\\globalfunctions.lua");

tItem = {
	[200130832] = {
		--pet id,pet name
		{40, "Thó C­ng Gi¸o Chóng Tinh §µn (Thñy)"},
		{43, "Thó C­ng Gi¸o Chóng Tinh §µn (Thæ)"},
	},
	[200130833] = {
		{41, "Thó C­ng Gi¸o Chóng NguyÖt §µn (Thñy)"},
		{44, "Thó C­ng Gi¸o Chóng NguyÖt §µn (Thæ)"},
	},
	[200130834] = {
		{42, "Thó C­ng Gi¸o Chóng ThÇn §µn (Thñy)"},
		{45, "Thó C­ng Gi¸o Chóng ThÇn §µn (Thæ)"},
	},
}

function OnUse(ItemIdx)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	
	local g,d,p = GetItemInfoByIndex(ItemIdx)
	local id = p+d*100000+g*100000*1000
	local t = tItem[id]
	if t then
    	local tSay = {}
    	local szTitle = format("H·y chän b¹n ®ång hµnh cÇn:")
    	for i, tt in t do
    		tinsert(tSay, format("%s/#add_pet(%d, %d, \'%s\')", tt[2], ItemIdx, tt[1], tt[2]))
    	end
    	tinsert(tSay, format("%s/nothing", "T¹i h¹ chØ xem qua th«i"))
    	Say(szTitle, getn(tSay), tSay)
	end
end

function add_pet(ItemIdx,id,name)
	if GetPetCount() >= 5 then
		Talk(1, "", "B¹n ®ång hµnh ®· ®ñ 5")
		return
	end
	if DelItemByIndex(ItemIdx, 1)== 1 then
		AddPet(id)
		Msg2Player(format("Chóc mõng, nhËn ®­îc %s",name))
	end
end