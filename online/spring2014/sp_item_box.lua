--ÄêÊÞ±¦Ïä
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\function\\ornament\\ornament.lua")

function OnUse(nItem)
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	gf_ModifyExp(600000);
	ornament_add_score(10);
	Msg2Player("B¹n nhËn ®­îc 10 ®iÓm Phong Hoa!")
	if SP_TASK_GROUP:GetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4) == 15 then
		SP_TASK_GROUP:SetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4, 0);
		Add_ShiMenZhenJuan_High();
	else
		local tAward = {
			-- {1, 200, "1¼¶Ç§»Ã¿Ì°å", {2, 1, 30406, 1, 4}, 0},
			-- {1, 200, "2¼¶Ç§»Ã¿Ì°å", {2, 1, 30407, 1, 4}, 0},
			-- {1, 100, "3¼¶Ç§»Ã¿Ì°å", {2, 1, 30408, 1, 4}, 0},
			{1, 700, "C©y B¸t Nh· nhá", {2, 0, 504, 1, 4}, 0},
			{1, 200, "C©y B¸t Nh·", {2, 0, 398, 1, 4}, 0},
			{1, 300, "LuyÖn L« ThiÕt Kho¸ng", {2, 1, 30537, 1, 4}, 0},
			{1, 300, "TÈy T©m Th¹ch Kho¸ng", {2, 1, 30536, 1, 4}, 0},
			-- {1, 600, "1¼¶Ï´ÐÄÊ¯", {2, 1, 30521, 1, 4}, 0},
			-- {1, 600, "1¼¶Á¶Â¯Ìú", {2, 1, 30527, 1, 4}, 0},
			-- {1, 200, "2¼¶Ï´ÐÄÊ¯", {2, 1, 30522, 1, 4}, 0},
			-- {1, 200, "2¼¶Á¶Â¯Ìú", {2, 1, 30528, 1, 4}, 0},
			{1, 600, "Thiªn th¹ch", {2, 2, 8, 1, 4}, 0},
			{1, 1500, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 1, 4}, 0},
			{1, 1000, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1, 4}, 0},
			{1, 700, "TiÓu Lôc ThÇn Hoµn", {2, 1, 30309, 1, 4}, 0},
			{1, 700, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1, 4}, 0},
			{1, 300, "B¹ch C©u Hoµn", {2, 1, 270, 1, 4}, 0},
			{1, 300, "Tam Thanh hoµn", {2, 1, 1097, 1, 4}, 0},
			{1, 300, "Lôc ThÇn hoµn", {2, 1, 1064, 1, 4}, 0},
			{1, 295, "ThÇn N«ng §¬n", {2, 1, 343, 1, 4}, 0},
			{1, 600, "§¹i Nh©n s©m", {2, 0, 553, 1, 4}, 0},
			{1, 500, "M¶nh Thiªn th¹ch", {2, 2, 7, 1, 4}, 0},
			-- {1, 100, "×Ï¹âÃÜ±¦", {2, 0, 761, 1, 4}, 0},
			-- {1, 100, "×Ï¹âÁî", {2, 0, 763, 1, 4}, 0},
			{1, 200, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1, 4}, 0},
			{1, 100, "Qu©n C«ng §¹i", {2, 1, 9998, 1, 4}, 0},
			-- {31, 500, "ModifyYinJuan(10,1)", 1},
			-- {31, 500, "ModifyYinJuan(100,1)", 1},
			-- {31, 300, "ModifyYinJuan(1000,1)", 1},
			{1, 10, "L¨ng Ba Vi Bé", {0, 112, 78, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
			{31,10, "Add_ShiMenZhenJuan()", 1},
			-- {31, 500, "Add_WuXing_Equip()", 1},
			{1, 200, "Th¸i NhÊt §ång QuyÓn", 	{2,	1,	31066, 1, 4}, 0},
			{1, 64, "Th¸i NhÊt ThiÕt QuyÓn", 	{2,	1,	31067, 1, 4}, 0},
			{31, 1, "Add_Normal_Haoxia_Equip()", 1},
			{1, 10, "Ngäc Tóy", 		 {2, 1,	2001, 1, 4}, 0},
			{1, 100, "Thiªn Tinh Th¹ch", 	{2, 1, 31191, 1, 4}, 0},
			{1, 10, "Thiªn Th¹ch Tinh Th¹ch", 	{2, 1, 1009, 1, 4}, 0},
			{1, 500, "Th¶o Ph¹t Lªnh ", 		 {2, 1, 30915, 1, 4}, 0},
			{1, 500, "§ång TÕ Chi NguyÖn", 	{2, 1, 30913, 1, 4}, 0},
		};
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "Ho¹t ®éng §¸nh Niªn Thó")
	end
end

function Add_Normal_Haoxia_Equip()
	local tItem = {
		{0,103,30568,1,"Hµo HiÖp §Çu"},
		{0,100,30568,1,"Hµo HiÖp y"},
		{0,101,30568,1,"Hµo HiÖp Trang"},
	}
	local rand = random(1, getn(tItem))
	gf_AddItemEx2({tItem[rand][1],tItem[rand][2],tItem[rand][3],tItem[rand][4],4}, tItem[rand][5], "Event TÕt Kingsoft", "Ho¹t ®éng §¸nh Niªn Thó", 0, 1);
end
function Add_ShiMenZhenJuan()
	local tBook = {
		[2] = {0, 107, 204, 1, "Kim Cang B¸t Nh· Ch©n QuyÓn "},
		[3] = {0, 107, 206, 1, "V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[4] = {0, 107, 205, 1, "TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[6] = {0, 107, 207, 1, "Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0, 107, 208, 1, "Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0, 107, 209, 1, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0, 107, 210, 1, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0, 107, 211, 1, "Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0, 107, 212, 1, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0, 107, 213, 1, "Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0, 107, 214, 1, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0, 107, 215, 1, "Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0, 107, 216, 1, "HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0, 107, 217, 1, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0, 107, 218, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn"},

		[25] = {0, 107, 219, 1, "Håi Phong Tr¶m NhËt Ch©n QuyÓn"},
		[26] = {0, 107, 220, 1, "Phô Kú Hµnh TrËn Ch©n QuyÓn"},
		[27] = {0, 107, 221, 1, "Ng­ng HuyÕt Phong Hån Ch©n QuyÓn"},

		[29] = {0, 107, 222, 1, "Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0, 107, 223, 1, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},	
		[31] = {0, 107, 231, 1, "Mª Tung Ch©n QuyÓn"},
		[32] = {0, 107, 235, 1, "Thiªn Phong Ch©n QuyÓn"},	
	}
	local nRoute = GetPlayerRoute();
	if tBook[nRoute] then
		gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3],tBook[nRoute][4],4}, tBook[nRoute][5], "Event TÕt Kingsoft", "Ho¹t ®éng §¸nh Niªn Thó", 0, 1);
	end
end


function Add_ShiMenZhenJuan_High()

	local tBook = {
		[2] = {0, 107, 30001, 1, "Kim Cang B¸t Nh· Ch©n QuyÓn (Cao cÊp)"},
		[3] = {0, 107, 30003, 1, "V« TrÇn Bå §Ò Ch©n QuyÓn (Cao cÊp)"},
		[4] = {0, 107, 30002, 1, "TiÒm Long Tóc DiÖt Ch©n QuyÓn (Cao cÊp)"},
		[6] = {0, 107, 30004, 1, "Thiªn La Liªn Ch©u Ch©n QuyÓn (Cao cÊp)"},
		[8] = {0, 107, 30005, 1, "Nh­ ý Kim §Ønh Ch©n QuyÓn (Cao cÊp)"},
		[9] = {0, 107, 30006, 1, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn (Cao cÊp)"},
		[11] = {0, 107, 30007, 1, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn (Cao cÊp)"},
		[12] = {0, 107, 30008, 1, "Quú Thiªn Du Long Ch©n QuyÓn (Cao cÊp)"},
		[14] = {0, 107, 30009, 1, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn (Cao cÊp)"},
		[15] = {0, 107, 30010, 1, "Qu©n Tö §íi Phong Ch©n QuyÓn (Cao cÊp)"},
		[17] = {0, 107, 30011, 1, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn (Cao cÊp)"},
		[18] = {0, 107, 30012, 1, "Xuyªn V©n L¹c Hång Ch©n QuyÓn (Cao cÊp)"},
		[20] = {0, 107, 30013, 1, "HuyÒn Minh Phong Ma Ch©n QuyÓn (Cao cÊp)"},
		[21] = {0, 107, 30014, 1, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn (Cao cÊp)"},
		[23] = {0, 107, 30015, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn (Cao cÊp)"},

		[25] = {0, 107, 30035, 1, "Håi Phong Tr¶m NhËt Ch©n QuyÓn (Cao CÊp)"},
		[26] = {0, 107, 30036, 1, "Phô Kú Hµnh TrËn Ch©n QuyÓn (Cao CÊp)"},
		[27] = {0, 107, 30037, 1, "Ng­ng HuyÕt Phong Hån Ch©n QuyÓn (Cao CÊp)"},

		[29] = {0, 107, 30016, 1, "Hång TrÇn Tóy Méng Ch©n QuyÓn (Cao cÊp)"},
		[30] = {0, 107, 30017, 1, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn (Cao cÊp)"},	
		[31] = {0, 107, 30041, 1, "Mª Tung Ch©n QuyÓn (Cao cÊp)"},
		[32] = {0, 107, 30043, 1, "Thiªn Phong Ch©n QuyÓn (Cao cÊp)"},	
	}
	local nRoute = GetPlayerRoute();
	if tBook[nRoute] then
		gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3],tBook[nRoute][4],4}, tBook[nRoute][5], "Event TÕt Kingsoft", "Ho¹t ®éng §¸nh Niªn Thó", 0, 1);
	end
end

function Add_WuXing_Equip()
	local tEquip = {
		{1, 12, "¸o Choµng T¹o Bè",	 {0, 152, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "¸o Choµng CÈm §o¹n",	 {0, 152, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "¸o Choµng Háa V©n",	 {0, 152, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Giµy V¶i Th«",		 {0, 154, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Tinh TrÝ Bè Hµi",	 {0, 154, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Bè ChÕ Cao §ång Ngoa",{0, 154, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch­¬ng §ång ChÕ",	 {0, 153, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch­¬ng ThiÕt ChÕ",	 {0, 153, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch­¬ng Ngäc ChÕ",	 {0, 153, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tEquip, gf_SumRandBase(tEquip), 1, "Event TÕt Kingsoft", "Ho¹t ®éng §¸nh Niªn Thó");
end