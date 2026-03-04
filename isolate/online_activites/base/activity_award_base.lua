--»î¶¯µÄÒ»Ğ©¹²ÓÃ½±Àøº¯Êı
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\ks2vng\\isolate\\online_activites\\base\\activity_award_base_vng.lua")

BOOK1 = {
	[2] = {0, 107, 204, "Kim Cang B¸t Nh· Ch©n QuyÓn "},
	[3] = {0, 107, 206, "V« TrÇn Bå §Ò Ch©n QuyÓn"},
	[4] = {0, 107, 205, "TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
	[6] = {0, 107, 207, "Thiªn La Liªn Ch©u Ch©n QuyÓn"},
	[8] = {0, 107, 208, "Nh­ ı Kim §Ønh Ch©n QuyÓn"},
	[9] = {0, 107, 209, "Bİch H¶i TuyÖt ¢m Ch©n QuyÓn"},
	[11] = {0, 107, 210, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
	[12] = {0, 107, 211, "Quú Thiªn Du Long Ch©n QuyÓn"},
	[14] = {0, 107, 212, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
	[15] = {0, 107, 213, "Qu©n Tö §íi Phong Ch©n QuyÓn"},
	[17] = {0, 107, 214, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
	[18] = {0, 107, 215, "Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
	[20] = {0, 107, 216, "HuyÒn Minh Phong Ma Ch©n QuyÓn"},
	[21] = {0, 107, 217, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
	[23] = {0, 107, 218, "Cöu Thiªn Phong L«i Ch©n QuyÓn"},
	[25] = {0, 107, 219, "Håi Phong Tr¶m NhËt Ch©n QuyÓn"},
	[26] = {0, 107, 220, "Phô Kú Hµnh TrËn Ch©n QuyÓn"},
	[27] = {0, 107, 221, "Ng­ng HuyÕt Phong Hån Ch©n QuyÓn"},
	[29] = {0, 107, 222, "Hång TrÇn Tóy Méng Ch©n QuyÓn"},
	[30] = {0, 107, 223, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},	
	[31] = {0, 107, 231, "Mª Tung Ch©n QuyÓn"},
	[32] = {0, 107, 235, "Thiªn Phong Ch©n QuyÓn"},
}

BOOK2 = {
	[2] = {0, 107, 30001, "Kim Cang B¸t Nh· Ch©n QuyÓn (Cao cÊp)"},
	[3] = {0, 107, 30003, "V« TrÇn Bå §Ò Ch©n QuyÓn (Cao cÊp)"},
	[4] = {0, 107, 30002, "TiÒm Long Tóc DiÖt Ch©n QuyÓn (Cao cÊp)"},
	[6] = {0, 107, 30004, "Thiªn La Liªn Ch©u Ch©n QuyÓn (Cao cÊp)"},
	[8] = {0, 107, 30005, "Nh­ ı Kim §Ønh Ch©n QuyÓn (Cao cÊp)"},
	[9] = {0, 107, 30006, "Bİch H¶i TuyÖt ¢m Ch©n QuyÓn (Cao cÊp)"},
	[11] = {0, 107, 30007, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn (Cao cÊp)"},
	[12] = {0, 107, 30008, "Quú Thiªn Du Long Ch©n QuyÓn (Cao cÊp)"},
	[14] = {0, 107, 30009, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn (Cao cÊp)"},
	[15] = {0, 107, 30010, "Qu©n Tö §íi Phong Ch©n QuyÓn (Cao cÊp)"},
	[17] = {0, 107, 30011, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn (Cao cÊp)"},
	[18] = {0, 107, 30012, "Xuyªn V©n L¹c Hång Ch©n QuyÓn (Cao cÊp)"},
	[20] = {0, 107, 30013, "HuyÒn Minh Phong Ma Ch©n QuyÓn (Cao cÊp)"},
	[21] = {0, 107, 30014, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn (Cao cÊp)"},
	[23] = {0, 107, 30015, "Cöu Thiªn Phong L«i Ch©n QuyÓn (Cao cÊp)"},
	[25] = {0, 107, 30035, "Håi Phong Tr¶m NhËt Ch©n QuyÓn (Cao CÊp)"},
	[26] = {0, 107, 30036, "Phô Kú Hµnh TrËn Ch©n QuyÓn (Cao CÊp)"},
	[27] = {0, 107, 30037, "Ng­ng HuyÕt Phong Hån Ch©n QuyÓn (Cao cÊp)"},
	[29] = {0, 107, 30016, "Hång TrÇn Tóy Méng Ch©n QuyÓn (Cao cÊp)"},
	[30] = {0, 107, 30017, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn (Cao cÊp)"},	
	[31] = {0, 107, 30041, "Mª Tung Ch©n QuyÓn"},
	[32] = {0, 107, 30043, "Thiªn Phong Ch©n QuyÓn"},
}

--¸ß¼¶Õæ¾í
function act_give_gaoji_zhenjuan(nNum, bByRoute,  nBind, nKind)
	if not nNum or nNum <= 0 then
		return 0
	end
	nBind = nBind or 4
	local tGgBook = {
		BOOK1,
		BOOK2,
	}
	if not nKind then
		nKind = 1;
	end
	local tBook = tGgBook[nKind];
	local nIndex = 0
	if bByRoute and bByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30,31,32}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0 end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, nBind}, tBook[nIndex][4], "activity", "70_gaoji_zhenjuan", 0, 1);
	return 1
end

function act_finish_pet_task(nTaskId, nBitIdx)
--	Vet_Complete_Revive_OnePartner_FirstStage(nTaskId, nBitIdx)
	local nRet = Vet_Complete_Revive_OnePartner_SecondStage(nTaskId, nBitIdx)
	return nRet
end
