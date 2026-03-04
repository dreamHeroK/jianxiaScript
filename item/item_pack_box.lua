--¸÷ÖÖ°ü°ü
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tLv1KeBan = {
	{ "Kh¾c B¶n Vì CÊp 1 (§Çu)", 2, 1, 31068, },
    { "Kh¾c B¶n Vì CÊp 1 (¸o)", 2, 1, 31069, },
    { "Kh¾c B¶n Vì CÊp 1 (QuÇn)", 2, 1, 31070, },
    { "Kh¾c B¶n Vì CÊp 1 (NhÉn)", 2, 1, 31071, },
    { "Kh¾c B¶n Vì CÊp 1 (Ngäc Béi)", 2, 1, 31072, },
}
tLv2KeBan = {
    { "Kh¾c B¶n Vì CÊp 2 (§Çu)", 2, 1, 31078,  },
    { "Kh¾c B¶n Vì CÊp 2 (¸o)", 2, 1, 31079, },
    { "Kh¾c B¶n Vì CÊp 2 (QuÇn)", 2, 1, 31080, },
    { "Kh¾c B¶n Vì CÊp 2 (NhÉn)", 2, 1, 31081, },
    { "Kh¾c B¶n Vì CÊp 2 (Ngäc Béi)", 2, 1, 31082, },
}
tLv5PetBook = {
    {"Ch©n KhÝ Hé ThÓ CÊp 5", 2, 150, 67},
    {"Ých Thä Diªn D­¬ng CÊp 5", 2, 150, 68},
    {"C­êng Th©n B¸ ThÓ CÊp 5", 2, 150, 69},
    {"¢m Phong Thùc Cèt CÊp 5", 2, 150, 70},
    {"HuyÒn Vò V« Song CÊp 5", 2, 150, 71},
    {"V« Hµnh V« T­¬ng CÊp 5", 2, 150, 72},
    {"Kim Linh Phô ThÓ CÊp 5", 2, 150, 73},
    {"Méc Linh Phô ThÓ CÊp 5", 2, 150, 74},
    {"Thuû Linh Phô ThÓ CÊp 5", 2, 150, 75},
    {"Ho¶ Linh Phô ThÓ CÊp 5", 2, 150, 76},
    {"Thæ Linh Phô ThÓ CÊp 5", 2, 150, 77},
    {"Ph¸ Kh«ng Tr¶m ¶nh CÊp 5", 2, 150, 78},
    {"S¸t Th­¬ng Gia N©ng CÊp 5", 2, 150, 79},
    {"Khinh Linh TÊn TËt CÊp 5", 2, 150, 80},
    {"V« H×nh Chi Cæ CÊp 5", 2, 150, 81},
    {"Linh Quang NhÊt ThiÓm CÊp 1", 2, 150, 82},
    {"Ng­ng ThÇn QuyÕt CÊp 1", 2, 150, 83},
    {"Kinh §µo QuyÕt CÊp 1", 2, 150, 84},
    {"Nguyªn Thñy B¹o Né CÊp 1", 2, 150, 85},
    {"ThiÕt Bè Sam CÊp 1", 2, 150, 86},

}
g_tBoxPack = { -- °ü°ü
    [200131202] = { "Tói kh¾c b¶n cÊp 1", "Kh¾c b¶n cÊp 1", tLv1KeBan, 1, 4},
    [200131203] = { "Tói kh¾c b¶n cÊp 2", "Kh¾c b¶n cÊp 2", tLv2KeBan, 1, 4},
    [200131201] = { "Tói s¸ch kü n¨ng lv5", "S¸ch Kü N¨ng Thó C­ng CÊp 5", tLv5PetBook, 1, 4},
}

function OnUse(idx)
	local nItemIndex	= tonumber(idx);
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	local nId = PackItemId(nG, nD, nP)
	local tItem		= g_tBoxPack[nId];

	if not tItem then
		return 0;
	end
	
	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end
	
	if 1 ~= DelItemByIndex(nItemIndex, 1) then
		return 0;
	end
	
	local tList = tItem[3]
	local t = tList[random(1, getn(tList))]
	AddItem(t[2], t[3], t[4], tItem[4], tItem[5])
end