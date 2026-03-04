Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");




LIB_Award.szLogTitle = "TRANG BI HAO HIEP VO HA"
LIB_Award.szLogAction = "nhËn"

tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25] = 1, [26] = 1, [27] = 1, [29] = 1, [30] = 1,}

tbHaoHiepVoHaNguyenLieu = {
	[1] = {item={{gdp={2,95,204,20}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,20}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,31122,10}, name="Linh KhÝ Rùc Rì"}, {gdp={2,1,1006,4}, name="Cöu Thiªn V« Cùc §¬n"}, {gdp={0,102,31126,1}, name="Hµo HiÖp Giíi"}}},
	[2] = {item={{gdp={2,95,204,20}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,20}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,31122,10}, name="Linh KhÝ Rùc Rì"}, {gdp={2,1,1006,4}, name="Cöu Thiªn V« Cùc §¬n"}, {gdp={0,102,31127,1}, name="Hµo HiÖp Béi"}}},
	[3] = {item={{gdp={2,95,204,20}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,20}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,31122,20}, name="Linh KhÝ Rùc Rì"}, {gdp={2,1,1006,4}, name="Cöu Thiªn V« Cùc §¬n"}, {gdp={0,102,30037,1}, name="Thiªn §Þa Giíi"}}},
	[4] = {item={{gdp={2,95,204,20}, name="Thiªn Cang LÖnh"}, {gdp={2,1,30370,20}, name="Thiªn M«n Kim LÖnh"}, {gdp={2,1,31122,20}, name="Linh KhÝ Rùc Rì"}, {gdp={2,1,1006,4}, name="Cöu Thiªn V« Cùc §¬n"}, {gdp={0,102,30038,1}, name="NhËt NguyÖt Giíi"}}},
}

function TrangBiHaoHiepVoHa_Form()
	local nDate = tonumber(date("%Y%m%d"))
	local szTitle = "C¸c h¹ muèn ®æi Trang bÞ nµo ? :\n"
	local tbSay = {}
	tinsert(tbSay, "§æi Hµo HiÖp V« H¹ LÖnh (trang søc)/LenhbaiHaoHiepVoHa")
	tinsert(tbSay, "§æi trang bÞ V« Cùc - Minh Tinh/TrangBiVoCucMinhTinh")

	tinsert(tbSay, "Ta ch­a muèn n©ng cÊp/gf_DoNothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function TrangBiVoCucMinhTinh()
	local szTitle = "§æi NhÉn V« hoÆc Cùc Minh Tinh cÇn:\n- : 20 Thiªn Cang LÖnh + 20 Thiªn M«n Kim LÖnh + 20 Linh KhÝ Rùc Rì + 4 Cöu Thiªn V« Cùc §¬n  + 1 Thiªn §Þa Giíi hoÆc 1 NhËt NguyÖt Giíi\n"
	local tbSay = {
		"X¸c nhËn ®æi V« Cùc/#XacNhanDoiHHVH(3)",
		"X¸c nhËn ®æi Minh Tinh/#XacNhanDoiHHVH(4)",
		"Ta ®Õn xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end

function LenhbaiHaoHiepVoHa()
	local szTitle = "§æi Hµo HiÖp V« h¹ lÖnh bµi (Trang søc) cÇn:\n- : 20 Thiªn Cang LÖnh + 20 Thiªn M«n Kim LÖnh + 10 Linh KhÝ Rùc Rì  + 4 Cöu Thiªn V« Cùc §¬n + 1 Hµo HiÖp giíi hoÆc 1 Hµo HiÖp Béi\n"
	local tbSay = {
		"Sö dông Hµo HiÖp Giíi/#XacNhanDoiHHVH(1)",
		"Sö dông Hµo HiÖp Béi/#XacNhanDoiHHVH(2)",
		"Ta ®Õn xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end

function XacNhanDoiHHVH(nOption)
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i, kh«ng thÓ ®æi Hµo HiÖp V« H¹ LÖnh Bµi.")
		return 0
	end
	if tbHaoHiepVoHaNguyenLieu[nOption] == nil then
		print("NGUYEN LIEU KHONG DUNG")
		return 0
	end
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", "Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbHaoHiepVoHaNguyenLieu[nOption])
	if nCheck ~= 1 then
		--Talk(1,"", "C¸c h¹ ®· ®em ®ñ vËt phÈm yªu cÇu ch­a ?")
		return 0
	end
	LIB_Award:PayMaterial(tbHaoHiepVoHaNguyenLieu[nOption])
	if nOption == 1 then
		gf_AddItemEx2({2,1,30974, 1}, "Hµo HiÖp V« H¹ LÖnh Bµi(trang søc) ", EVENT_LOG_TITLE , "nhËn")
	elseif nOption == 2 then
		gf_AddItemEx2({2,1,30974, 1}, "Hµo HiÖp V« H¹ LÖnh Bµi(trang søc) ", EVENT_LOG_TITLE , "nhËn")
	elseif nOption == 3 then
		gf_AddItemEx2({0,102,31130, 1, 4, -1, -1, -1, -1, -1, -1}, "NhÉn V« Cùc ", EVENT_LOG_TITLE , "nhËn")
	elseif nOption == 4 then
		gf_AddItemEx2({0,102,31131, 1, 4, -1, -1, -1, -1, -1, -1}, "Minh Tinh Chi Giíi ", EVENT_LOG_TITLE , "nhËn")
	end
end
