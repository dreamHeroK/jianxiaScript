Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
-- Task 2660
szLogTitle = "EVENT KIM XA LIEN SERVER"
nMAXPOINT = 50000

tbBang = {
		taiviemdo9x  = {[8] = {"oAPiBo0mBo0mB52",1}},
		hklbthanhlong  = {[7] = {"zIngoclinhcocoIz",2}},
		giaosi1 = {[4] = {"SHPediXeDap",3}},
		caothanhhaihcm  = {[7] = {"1028zNhokQuay",4}},
		honghoatientu2007  = {[3] = {"iStttSiThoTrang",5}},
		truongthanhhung1976  = {[63] = {"ThienQuangVuong",6}},
		ccc4990  = {[16] = {"zzMotConChuot",7}},
		thuanlong0503  = {[12] = {"xxTHUANLONGxx",8}},
		maisang1618  = {[09] = {"zzzSANGzzz",9}},
		thttsk40  = {[22] = {"thienkiem1",10}},
	}
	
	
tbNguyenLieuNop = {
	[1] = {1, {item={{gdp={2,2,8,5}, name="Thiªn Th¹ch"}}, nGold = 10000}, "05 Thiªn Th¹ch + 01 vµng (1 ®iÓm)"},
	[2] = {3, {item={{gdp={2,2,7,1}, name="M¶nh Thiªn Th¹ch"}}, nGold = 10000}, "01 M¶nh Thiªn Th¹ch + 01 vµng (3 ®iÓm)"},
	[3] = {30, {item={{gdp={2,1,1009,1}, name="Thiªn Th¹ch Tinh Th¹ch"}}}, "01 Thiªn Th¹ch Tinh Th¹ch (30 ®iÓm)"},
	[4] = {900, {item={{gdp={2,1,1068,1}, name="Thiªn Th¹ch Linh Th¹ch"}}}, "01 Thiªn Th¹ch Linh Th¹ch (900 ®iÓm)"},
	[5] = {1000, {item={{gdp={2,1,1067,1}, name="§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch"}}}, "01 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch (1,000 ®iÓm)"},
	[6] = {1200, {item={{gdp={2,1,1113,1}, name="§¹i §Þnh Hån"}}}, "01 §¹i §Þnh Hån (1,200 ®iÓm)"},
	[7] = {1, {item={{gdp={2,1,30390,1}, name="M¶nh Thiªn Cang"}}, nGold = 10000}, "01 M¶nh Thiªn Cang + 01 Vµng (1 ®iÓm)"},
	[8] = {700, {item={{gdp={2,95,204,1}, name="Thiªn Cang LÖnh"}}}, "01 Thiªn Cang LÖnh (700 ®iÓm)"},
	[9] = {600, {item={{gdp={2,1,30370,1}, name="Thiªn M«n Kim LÖnh"}}}, "01 Thiªn M«n Kim LÖnh (600 ®iÓm)"},
	[10] = {3, {item={{gdp={2,1,30410,1}, name="M¶nh Thiªn M«n"}}, nGold = 10000}, "01 M¶nh Thiªn M«n + 01 Vµng (3 ®iÓm)"},
	[11] = {160, {item={{gdp={0,112,78,1}, name="L¨ng Ba Vi Bé"}, {gdp={2,1,199,1}, name = "§¹i Ng©n PhiÕu"}}}, "01 L¨ng Ba Vi Bé + 01 §¹i Ng©n PhiÕu (160 ®iÓm)"},
	[12] = {80, {item={{gdp={2,1,30164,39}, name="Nh·n"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Nh·n + 19 xu vËt phÈm (80 ®iÓm)"},
	[13] = {80, {item={{gdp={2,1,30165,39}, name="Ch«m Ch«m"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Ch«m Ch«m + 19 xu vËt phÈm (80 ®iÓm)"},
	[14] = {80, {item={{gdp={2,1,30166,39}, name="Cam"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Cam + 19 xu vËt phÈm (80 ®iÓm)"},
	[15] = {80, {item={{gdp={2,1,30167,39}, name="Dõa"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Dõa + 19 xu vËt phÈm (80 ®iÓm)"},
	[16] = {80, {item={{gdp={2,1,30168,39}, name="M¨ng Côt"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 M¨ng Côt + 19 xu vËt phÈm (80 ®iÓm)"},
	[17] = {80, {item={{gdp={2,1,30169,39}, name="B­ëi"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 B­ëi + 19 xu vËt phÈm (80 ®iÓm)"},
	[18] = {80, {item={{gdp={2,1,30170,39}, name="D©u"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 D©u + 19 xu vËt phÈm (80 ®iÓm)"},
	[19] = {80, {item={{gdp={2,1,30171,39}, name="Chuèi"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Chuèi + 19 xu vËt phÈm (80 ®iÓm)"},
	[20] = {80, {item={{gdp={2,1,30172,39}, name="Xoµi"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Xoµi + 19 xu vËt phÈm (80 ®iÓm)"},
	[21] = {80, {item={{gdp={2,1,30173,39}, name="§µo"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 §µo + 19 xu vËt phÈm (80 ®iÓm)"},
	[22] = {80, {item={{gdp={2,1,30174,39}, name="MËn"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 MËn + 19 xu vËt phÈm (80 ®iÓm)"},
	[23] = {80, {item={{gdp={2,1,30175,39}, name="V¶i"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 V¶i + 19 xu vËt phÈm (80 ®iÓm)"},
	[24] = {80, {item={{gdp={2,1,30176,39}, name="T¸o"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 T¸o + 19 xu vËt phÈm (80 ®iÓm)"},
	[25] = {80, {item={{gdp={2,1,30177,39}, name="B¬"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 B¬ + 19 xu vËt phÈm (80 ®iÓm)"},
	[26] = {80, {item={{gdp={2,1,30178,39}, name="§u §ñ"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 §u §ñ + 19 xu vËt phÈm (80 ®iÓm)"},
	[27] = {80, {item={{gdp={2,1,30179,39}, name="M·ng CÇu"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 M·ng CÇu + 19 xu vËt phÈm (80 ®iÓm)"},
	[28] = {80, {item={{gdp={2,1,30180,39}, name="Khãm"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Khãm + 19 xu vËt phÈm (80 ®iÓm)"},
	[29] = {80, {item={{gdp={2,1,30181,39}, name="Lª"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Lª + 19 xu vËt phÈm (80 ®iÓm)"},
	[30] = {80, {item={{gdp={2,1,30182,39}, name="Bßn Bon"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 Bßn Bon + 19 xu vËt phÈm (80 ®iÓm)"},
	[31] = {80, {item={{gdp={2,1,30183,39}, name="KhÕ"}, {gdp={2,1,30230,19}, name = "Xu VËt PhÈm"}}}, "39 KhÕ + 19 xu vËt phÈm (80 ®iÓm)"},
	[32] = {6, {item={{gdp={2,1,149,1}, name="B¨ng Th¹ch"}}}, "01 B¨ng Th¹ch (6 ®iÓm)"},
	[33] = {60, {item={{gdp={2,1,30130,1}, name="Phi Yªn Th¹ch"}}}, "01 Phi Yªn Th¹ch (60 ®iÓm)"},
	[34] = {100, {item={{gdp={2,0,1084,1}, name="Thiªn Qu¸i Th¹ch"}}}, "01 Thiªn Qu¸i Th¹ch (100 ®iÓm)"},
	[35] = {15, {item={{gdp={2,1,30346,1}, name="M¶nh B¹ch Kim"}, {gdp={2,1,30230,1}, name="Xu VËt PhÈm"}}}, "01 M¶nh B¹ch Kim + 01 xu vËt phÈm (15 ®iÓm)"},
	[36] = {30, {item={{gdp={2,1,30342,1}, name="Kim R­¬ng"}}}, "01 Kim R­¬ng (30 ®iÓm)"},
	[37] = {150, {item={{gdp={2,1,30343,1}, name="B¹ch Kim R­¬ng"}}}, "01 B¹ch Kim R­¬ng (150 ®iÓm)"},
	[38] = {1350, {item={{gdp={2,1,30344,1}, name="ThÇn Tµi B¶o R­¬ng"}}}, "01 ThÇn Tµi B¶o R­¬ng (1,350 ®iÓm)"},
	[39] = {1500, {item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n"}}}, "01 ChuyÓn Sinh §¬n (1,500 ®iÓm)"},
	[40] = {1000, {item={{gdp={2,1,1006,1}, name="Cöu Thiªn V« Cùc §¬n"}, {gdp={2,1,199,1}, name = "§¹i Ng©n PhiÕu"}}}, "01 Cöu Thiªn V« Cùc §¬n + 01 §¹i Ng©n PhiÕu (1,000 ®iÓm)"},
	[41] = {200, {item={{gdp={2,1,30230,10}, name="Xu VËt PhÈm"}}, nExp = 100000000}, "100.000.000 ®iÓm kinh nghiÖm + 10 xu vËt phÈm (200 ®iÓm)"},
}

tbKimXaTuongQuan = {
	[1] = {
		[1] = {
			[1] = {item={{gdp={0,153,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Tèng T­íng Qu©n"}}},
			[2] = {item={{gdp={0,153,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Tèng T­íng Qu©n"}}},
			[3] = {item={{gdp={0,153,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Tèng T­íng Qu©n"}}},
			[4] = {item={{gdp={0,153,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Tèng T­íng Qu©n"}}},
		},
		[2] = {
			[1] = {item={{gdp={0,152,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng T­íng Qu©n"}}},
			[2] = {item={{gdp={0,152,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng T­íng Qu©n"}}},
			[3] = {item={{gdp={0,152,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng T­íng Qu©n"}}},
			[4] = {item={{gdp={0,152,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng T­íng Qu©n"}}},
		},
		[3] = {
			[1] = {item={{gdp={0,154,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng T­íng Qu©n"}}},
			[2] = {item={{gdp={0,154,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng T­íng Qu©n"}}},
			[3] = {item={{gdp={0,154,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng T­íng Qu©n"}}},
			[4] = {item={{gdp={0,154,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng T­íng Qu©n"}}},
		},
	},
	[2] = {
		[1] = {
			[1] = {item={{gdp={0,153,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Liªu T­íng Qu©n"}}},
			[2] = {item={{gdp={0,153,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Liªu T­íng Qu©n"}}},
			[3] = {item={{gdp={0,153,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Liªu T­íng Qu©n"}}},
			[4] = {item={{gdp={0,153,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Liªu T­íng Qu©n"}}},
		},
		[2] = {
			[1] = {item={{gdp={0,152,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Liªu T­íng Qu©n"}}},
			[2] = {item={{gdp={0,152,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Liªu T­íng Qu©n"}}},
			[3] = {item={{gdp={0,152,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Liªu T­íng Qu©n"}}},
			[4] = {item={{gdp={0,152,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Liªu T­íng Qu©n"}}},
		},
		[3] = {
			[1] = {item={{gdp={0,154,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Liªu T­íng Qu©n"}}},
			[2] = {item={{gdp={0,154,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Liªu T­íng Qu©n"}}},
			[3] = {item={{gdp={0,154,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Liªu T­íng Qu©n"}}},
			[4] = {item={{gdp={0,154,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Liªu T­íng Qu©n"}}},
		},
	},
}

tbThoTrang = {item={{gdp={0,105,30038,1,1,-1,-1,-1,-1,-1,-1,-1}, name="NguyÖt L­îng Thè"}}}
tbQuanCongHH = {item={{gdp={2,1,9977,9}, name="Qu©n C«ng Huy Hoµng", nExpired=7*24*3600}}}

tbKimXa3sao = {
	[1] = {item={{gdp={0,152,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Háa V©n"}}},
	[2] = {item={{gdp={0,152,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Kim ChÕ ngò hµnh"}}},
	[3] = {item={{gdp={0,152,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Méc ChÕ ngò hµnh"}}},
	[4] = {item={{gdp={0,152,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Thñy ChÕ ngò hµnh"}}},
	[5] = {item={{gdp={0,152,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Háa ChÕ ngò hµnh"}}},
	[6] = {item={{gdp={0,152,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Thæ ChÕ ngò hµnh"}}},
	[7] = {item={{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng ¢m ChÕ ngò hµnh"}}},
	[8] = {item={{gdp={0,153,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Ngäc ChÕ"}}},
	[9] = {item={{gdp={0,153,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Kim ChÕ ngò hµnh"}}},
	[10] = {item={{gdp={0,153,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Méc ChÕ ngò hµnh"}}},
	[11] = {item={{gdp={0,153,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Thñy ChÕ ngò hµnh"}}},
	[12] = {item={{gdp={0,153,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Háa ChÕ ngò hµnh"}}},
	[13] = {item={{gdp={0,153,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Thæ ChÕ ngò hµnh"}}},
	[14] = {item={{gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng ¢m ChÕ ngò hµnh"}}},
	[15] = {item={{gdp={0,154,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Bè ChÕ Cao §ång Ngoa"}}},
	[16] = {item={{gdp={0,154,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Kim ChÕ ngò hµnh"}}},
	[17] = {item={{gdp={0,154,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Méc ChÕ ngò hµnh"}}},
	[18] = {item={{gdp={0,154,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Thñy ChÕ ngò hµnh"}}},
	[19] = {item={{gdp={0,154,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Háa ChÕ ngò hµnh"}}},
	[20] = {item={{gdp={0,154,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Thæ ChÕ ngò hµnh"}}},
	[21] = {item={{gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi ¢m ChÕ ngò hµnh"}}},
}

tbTop100AwardRate = {
	[1] = {[1] = 	tbKimXa3sao[1], nRate = 7},
	[2] = {[1] = 	tbKimXa3sao[2], nRate = 5},
	[3] = {[1] = 	tbKimXa3sao[3], nRate = 5},
	[4] = {[1] = 	tbKimXa3sao[4], nRate = 5},
	[5] = {[1] = 	tbKimXa3sao[5], nRate = 5},
	[6] = {[1] = 	tbKimXa3sao[6], nRate = 5},
	[7] = {[1] = 	tbKimXa3sao[7], nRate = 1},
	[8] = {[1] = 	tbKimXa3sao[8], nRate = 7},
	[9] = {[1] = 	tbKimXa3sao[9], nRate = 5},
	[10] = {[1] = 	tbKimXa3sao[10], nRate = 5},
	[11] = {[1] = 	tbKimXa3sao[11], nRate = 5},
	[12] = {[1] = 	tbKimXa3sao[12], nRate = 5},
	[13] = {[1] = 	tbKimXa3sao[13], nRate = 5},
	[14] = {[1] = 	tbKimXa3sao[14], nRate = 1.5},
	[15] = {[1] = 	tbKimXa3sao[15], nRate = 7},
	[16] = {[1] = 	tbKimXa3sao[16], nRate = 5},
	[17] = {[1] = 	tbKimXa3sao[17], nRate = 5},
	[18] = {[1] = 	tbKimXa3sao[18], nRate = 5},
	[19] = {[1] = 	tbKimXa3sao[19], nRate = 5},
	[20] = {[1] = 	tbKimXa3sao[20], nRate = 5},
	[21] = {[1] = 	tbKimXa3sao[21], nRate = 1.5},
}

tbDefaultAward = {item={{gdp={2,1,30536,66}, name="TÈy T©m Th¹ch Kho¸ng"},{gdp={2,1,30537,66}, name="LuyÖn L« ThiÕt Kho¸ng"}}}

tbTopNguyenLieu = {
	[1] = {item={{gdp={2,1,30490,10}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}},
	[2] = {item={{gdp={2,1,30490,8}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}},
	[3] = {item={{gdp={2,1,30490,6}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}},
	[4] = {item={{gdp={2,1,30490,2}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}},
}

tbTopAwardItem = {
	[1] = {{item={{gdp={2,1,30523,30}, name="CÊp 3 TÈy T©m Th¹ch"}, {gdp={2,1,30529,30}, name="CÊp 3 LuyÖn L« ThiÕt"}, {gdp={2,1,30535,30}, name="ThiÕt Tinh cÊp 3"}}}, 3},
	[2] = {{item={{gdp={2,1,30523,20}, name="CÊp 3 TÈy T©m Th¹ch"}, {gdp={2,1,30529,20}, name="CÊp 3 LuyÖn L« ThiÕt"}}}, 1},
}

tbPhanThuongCaNhan = {
	[1] = {item={{gdp={2,1,30340,999}, name = "Méc R­¬ng"}}, nExp = 50000000},
	[2] = {nDanhvong =2000, nSumon = 2000},
	[3] = {nChankhi = 10000},
	[4] = {item={{gdp={2,1,30536,150}, name = "TÈy T©m Th¹ch Kho¸ng"}}},
	[5] = {item={{gdp={2,1,30537,150}, name = "LuyÖn L« ThiÕt Kho¸ng"}}},
	[6] = {nQuancong = 15000},
	[7] = {item={{gdp={2,1,30071,200}, name = "Nh©n S©m V¹n N¨m"}}},
	[8] = {item={{gdp={2,1,30132,6000}, name = "Vâ L©m B¶o H¹p"}}},
	[9] = {item={{gdp={2,1,30133,3}, name = "Ch×a Khãa Vµng	"}}},
	[10] = {item={{gdp={2,1,9998,6}, name = "Qu©n C«ng §¹i", nExpired = 30*24*3600}}},
	[11] = {item={{gdp={2,1,30497,400}, name = "Ma Tinh"}, {gdp={2,1,30554,100}, name = "B¨ng Tinh Th¹ch"}}},
	[12] = {item={{gdp={2,1,9977,9}, name = "Qu©n C«ng Huy Hoµng", nExpired = 30*24*3600}}},
	[13] = {fn="TrangBiKimXa3Sao(10)"},
	[14] = {item={{gdp={2,1,30535,80}, name = "ThiÕt tinh cÊp 3"}}},
	[15] = {item={{gdp={2,1,30529,68}, name = "CÊp 3 LuyÖn L« ThiÕt"}}},
	[16] = {item={{gdp={2,1,30523,79}, name = "CÊp 3 TÈy T©m Th¹ch"}}},
	[17] = {item={{gdp={2,1,30133,20}, name = "Ch×a Khãa Vµng	"}}},
	[18] = {fn="TrangBiKimXaAmChe()"},
	[19] = {fn="MatTichMonPhai20_Menu()"},
	[20] = {item={{gdp={0,102,8844,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Huy Hoµng QuËt Khëi"}, {gdp={0,102,8845,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Vinh Dù QuËt Khëi"}}},
}

tbDieuKienNhanThuong = {
	[1] = {150, {item={{gdp={2,1,30230,1}, name = "Xu VËt PhÈm"}}}, "50.000.000 ®iÓm kinh nghiÖm + 999 Méc R­¬ng",2,250},
	[2] = {200, {item={{gdp={2,1,30230,20}, name = "Xu VËt PhÈm"}}}, "2.000 danh väng + 2.000 s­ m«n",0,250},
	[3] = {300, {item={{gdp={2,1,30230,30}, name = "Xu VËt PhÈm"}}}, "10.000 ®iÓm ch©n khÝ",0,250},
	[4] = {500, {item={{gdp={2,1,30230,10}, name = "Xu VËt PhÈm"}}}, "150 TÈy T©m Kho¸ng Th¹ch",2,250},
	[5] = {1000, {item={{gdp={2,1,30230,10}, name = "Xu VËt PhÈm"}}}, "150 LuyÖn L« Kho¸ng Th¹ch",2,250},
	[6] = {1500, {item={{gdp={2,1,30230,50}, name = "Xu VËt PhÈm"}}}, "15.000 ®iÓm c«ng tr¹ng",0,250},
	[7] = {2000, {item={{gdp={2,1,30230,20}, name = "Xu VËt PhÈm"}}}, "200 Nh©n S©m V¹n N¨m",3,250},
	[8] = {2500, {item={{gdp={2,1,30230,6}, name = "Xu VËt PhÈm"}}}, "6.000 vâ l©m b¶o h¹p",7,250},
	[9] = {3000, {item={{gdp={2,1,30230,300}, name = "Xu VËt PhÈm"}}}, "03 Ch×a Khãa Vµng",4,250},
	[10] = {3500, {item={{gdp={2,1,30230,60}, name = "Xu VËt PhÈm"}}}, "06 Qu©n C«ng §¹i",7,250},
	[11] = {4000, {item={{gdp={2,1,30230,400}, name = "Xu VËt PhÈm"}}}, "400 Ma Tinh + 100 B¨ng Tinh Th¹ch",3,250},
	[12] = {5000, {item={{gdp={2,1,30230,800}, name = "Xu VËt PhÈm"}}}, "09 Qu©n C«ng Huy Hoµng (h¹n sö dông 30 ngµy)",10,250},
	[13] = {6000, {item={{gdp={2,1,30490,2}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "10 Kim Xµ cÊp 3 sao ngÉu nhiªn",11,250},
	[14] = {8000, {item={{gdp={2,1,30490,2}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "80 ThiÕt Tinh CÊp 3",8,250},
	[15] = {10000, {item={{gdp={2,1,30490,5}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "68 LuyÖn L« ThiÕt CÊp 3",2,250},
	[16] = {12000, {item={{gdp={2,1,30490,5}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "79 TÈy T©m Th¹ch CÊp 3",2,250},
	[17] = {15000, {item={{gdp={2,1,30490,6}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "20 Ch×a Khãa Vµng",20,250},
	[18] = {20000, {item={{gdp={2,1,30490,3}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "04 bé Kim Xµ Ngò hµnh ¢m ChÕ (¸o choµng , giµy , huy ch­¬ng)",12,250},
	[19] = {30000, {item={{gdp={2,1,30490,8}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "01 M©t TÞch m«n ph¸i 70 cao cÊp ®Æc biÖt",2,250},
	[20] = {50000, {item={{gdp={2,1,30490,10}, name = "Hoµng Kim §¹i Ng©n PhiÕu"}}}, "01 CÆp Huy Hoµng - Vinh Dù QuËt Khëi",3,250},
}

tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[25] = {0,107,219,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[26] = {0,107,220,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[27] = {0,107,221,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		[31] = {0,107,231,2,"Mª Tumg Ch©n QuyÓn"},
		[32] = {0,107,225,2,"Thiªn Phong Ch©n QuyÓn"},
	}
	
szNpcName = "<color=green>La Sa<color>: "

function EventKimXaLienServer_Menu()
	local nDate = tonumber(date("%y%m%d"))
	local tbSay = {}
	tinsert(tbSay, "§¨ng ký tham gia Kim Xµ Nguyªn So¸i/EventKimXaLienServer_DangKy")
	tinsert(tbSay, "Tham dù cuéc ®ua bang héi nhËn Kim Xµ Nguyªn So¸i/EventKimXaLienServer_Vote_Menu")
	tinsert(tbSay, "Xem ®iÓm tÝch lòy b¶n th©n/EventKimXaLienServer_XemDiem")
	tinsert(tbSay, "Xem ®iÓm tÝch lòy c¸c bang héi tham gia/EventKimXaLienServer_XemDiemBang")
	tinsert(tbSay, "NhËn th­ëng mèc tÝch lòy b¶n th©n/EventKimXaLienServer_Award_Menu")
--	tinsert(tbSay, "NhËn th­ëng Kim Xµ Nguyªn So¸i/")
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNpcName.."§oµn kÕt lµ søc m¹nh, trang bÞ Kim Xµ ta muèn dµnh cho nh÷ng bang héi thùc sù ®oµn kÕt.", getn(tbSay), tbSay)
end


function EventKimXaLienServer_DangKy()
	local tbMaterial = {item={{gdp={2,1,30490,3}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}}
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local nTongLevel = IsTongMember()
	local szRole = GetName()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbMaterial)
	if nCheck ~= 1 then
		return 0
	end
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng cÇn ®¨ng ký thªm lÇn n÷a.")
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®¨ng ký thµnh c«ng vµo cuéc ®ua giµnh Kim Xa Nguyªn So¸i, h·y b¸o tin cho c¸c thµnh viªn bang héi.")
	gf_WriteLogEx(szLogTitle, "nhËn", 1, "§¨ng ký thµnh c«ng")
end


function EventKimXaLienServer_Vote_Menu()
	local tbSay = {}
	tbSay[0] = szNpcName.."H·y chän bang héi c¸c h¹ muèn ñng hé."
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	if getn(LIB_txtData.tbTextData) == 0 then
		Talk(1,"",szNpcName.."HiÖn t¹i ch­a cã bang héi nµo ®¨ng ký tranh gi¶i, c¸c h¹ h·y tÝch lòy tµi vËt chê cuéc ®ua b¾t ®Çu.")
		return 0
	end
	for i=1, getn(LIB_txtData.tbTextData) do
		tinsert(tbSay, format(LIB_txtData.tbTextData[i][1].."/#EventKimXaLienServer_Vote(\"%s\")",LIB_txtData.tbTextData[i][2]))
	end
	gf_PageSay(tbSay, 1, 6)
end


function EventKimXaLienServer_Vote(szAccount)
	local tbSay = {}
	tbSay[0] = szNpcName.."C¸c h¹ muèn dïng thø g× ®Ó ñng hé bang héi m×nh chän?"
	for i=1, getn(tbNguyenLieuNop) do
		if LIB_Award:CheckMaterial(tbNguyenLieuNop[i][2], 0) == 1 then
			tinsert(tbSay, format(tbNguyenLieuNop[i][3] .. "/#EventKimXaLienServer_Vote_Done(\"%s\",%d)",(szAccount or ""),i))
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function EventKimXaLienServer_Vote_Done(szAccount,nIndex)
	if  IsPlayerDeath() ~= 0 then
		return 0
	end
	if tbNguyenLieuNop[nIndex] == nil then
		return 0
	end
	local nPoint = tbNguyenLieuNop[nIndex][1]
	local tbAward = {task={{TSK_KIMXA_ALLSERVER_POINT, nPoint , "§iÓm tÝch lòy"}}}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieuNop[nIndex][2])
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieuNop[nIndex][2])
	LIB_Award:Award(tbAward)
	-- Cong diem bang
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szAccount == LIB_txtData.tbTextData[i][2] then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		return 0
	end
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + nPoint
	LIB_txtData:SaveMultiColumn()
	gf_WriteLogEx(szLogTitle, "nhËn", 1, "ñng hé "..tbNguyenLieuNop[nIndex][3])
	EventKimXaLienServer_Vote(szAccount)
end


function EventKimXaLienServer_XemDiem()
	local nPoint = GetTask(TSK_KIMXA_ALLSERVER_POINT)
	Talk(1,"","Ng­¬i ®ang cã trong tay <color=yellow>".. nPoint  .." ®iÓm tÝch lòy<color>, hay mau chãng ®æi phÇn th­ëng.")
end


function EventKimXaLienServer_XemDiemBang()
	local tbData = {}
	tinsert(tbData,szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
		end
		tbData[nIndex] = tbData[nIndex] .. "<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." ®iÓm<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function EventKimXaLienServer_Award_Menu()
	local tbSay = {}
	local nAwardIndex = GetTask(TSK_KIMXA_ALLSERVER_AWARD)
	local nPoint = GetTask(TSK_KIMXA_ALLSERVER_POINT)
	tbSay[0] = szNpcName.."§©y lµ danh s¸ch c¸c phÇn th­ëng t­¬ng øng víi sè ®iÓm <color=red>"..nPoint.."<color> cña c¸c h¹. H·y nhanh chãng nhËn th­ëng."
	for i=1,getn(tbDieuKienNhanThuong) do
		if nAwardIndex < i and tbDieuKienNhanThuong[i][1] <= nPoint then
			tinsert(tbSay, tbDieuKienNhanThuong[i][3].."/#EventKimXaLienServer_Award_Done("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function EventKimXaLienServer_Award_Done(nIndex)
	local nAwardIndex = GetTask(TSK_KIMXA_ALLSERVER_AWARD)
	if nAwardIndex >= nIndex then
--		DelItem(2,1,30230,GetItemCount(2,1,30230))
--		Pay(GetCash())
-- 		Exit
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi!!!!!")
		return 0
	end
	if gf_Judge_Room_Weight(tbDieuKienNhanThuong[nIndex][4], tbDieuKienNhanThuong[nIndex][5]) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbDieuKienNhanThuong[nIndex][2])
	if nCheck == 0 then
		return 0
	end
	
	if (nAwardIndex + 1) < nIndex then
		Talk(1,"",szNpcName.."C¸c phÇn th­ëng tr­íc c¸c h¹ ch­a nhËn, hay lµ nhËn cho xong hÕt ®· nhÐ.")
		return 0
	end
--	local nPoint = GetTask(TSK_KIMXA_ALLSERVER_POINT)
	if nIndex ~= 13 and nIndex ~= 18 and nIndex ~= 19 then
		LIB_Award:PayMaterial(tbDieuKienNhanThuong[nIndex][2])
		SetTask(TSK_KIMXA_ALLSERVER_AWARD,nIndex)
	end
	LIB_Award:Award(tbPhanThuongCaNhan[nIndex])
	gf_WriteLogEx(szLogTitle, "nhËn", 1, tbDieuKienNhanThuong[nIndex][1].." ®iÓm: "..tbDieuKienNhanThuong[nIndex][3])
end


function TrangBiKimXa3Sao(nQty)
	LIB_Award:PayMaterial(tbDieuKienNhanThuong[13][2])
	SetTask(TSK_KIMXA_ALLSERVER_AWARD,13)
	for i=1,nQty do
		LIB_Award:AwardByRate(tbTop100AwardRate)
	end
	gf_WriteLogEx(szLogTitle, "nhËn", 1, tbDieuKienNhanThuong[13][1].." ®iÓm: "..tbDieuKienNhanThuong[13][3])
end


function MatTichMonPhai20_Menu()
	local tbSay = {}
	tbSay[0] = szNpcName.."Ta cã rÊt nhiÒu mËt tÞch, nh­ng ng­¬i h·y chän mËt tÞch nµo ng­¬i thÝch."
	for i=1, getn(tbMatTich) do
		if tbMatTich[i] ~= nil then
			tinsert(tbSay, tbMatTich[i][5].."/#EventKimXaLienServer_MatTichMonPhai20_Done("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function MatTichMonPhai20_Done(nIndex)
	LIB_Award:PayMaterial(tbDieuKienNhanThuong[19][2])
	SetTask(TSK_KIMXA_ALLSERVER_AWARD,19)
	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx(szLogTitle, "nhËn", 1, tbDieuKienNhanThuong[19][1].." ®iÓm: "..tbDieuKienNhanThuong[19][3])
end


function TrangBiKimXaAmChe()
	LIB_Award:PayMaterial(tbDieuKienNhanThuong[18][2])
	SetTask(TSK_KIMXA_ALLSERVER_AWARD,18)
	for i=1,4 do
		LIB_Award:Award(tbKimXa3sao[7])
		LIB_Award:Award(tbKimXa3sao[14])
		LIB_Award:Award(tbKimXa3sao[21])
	end
	gf_WriteLogEx(szLogTitle, "nhËn", 1, tbDieuKienNhanThuong[18][1].." ®iÓm: "..tbDieuKienNhanThuong[18][3])
end


function EventKimXaLienServer_NhanThuong_Form()
	local szAcc = GetAccount()
	local szName =  GetName()
	local nServerID = GetGlbValue(1023)
	if tbBang[szAcc] == nil then
		Talk(1,"",szNpcName.."Tµi kho¶n c¸c h¹ kh«ng ph¶i tµi kho¶n ®· ®¨ng ký ®ua top.")
		return 0
	end
	if tbBang[szAcc][nServerID] == nil then
		Talk(1,"",szNpcName.."Bang héi ®¹t gi¶i kh«ng ë Server nµy.")
		return 0
	end
	if tbBang[szAcc][nServerID][1] ~= szName then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ph¶i ng­êi ®· ®¨ng ký ®ua top.")
		return 0
	end
	if gf_Judge_Room_Weight(30, 500) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nCheck = 0
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank > 10 then
		Talk(1,"",szNpcName.."PhÇn th­ëng nµy kh«ng dµnh cho c¸c h¹.")
		return 0
	end
--	if nRank < 4 then
--		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[nRank])
--	elseif nRank >= 4 and nRank <= 10 then
--		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[4])
--	end
--	if nCheck == 0 then
--		return 0
--	end
	local tbSay = {}
	if nRank <= 10 then
		tinsert(tbSay, "NhËn th­ëng vËt phÈm/EventKimXaLienServer_NhanThuongTrangBi_Form")
	end
	if nRank <= 2 then
		tinsert(tbSay, "NhËn th­ëng mËt tÞch siªu cÊp/MatTichMonPhai20_Menu")
	end
	tinsert(tbSay, "Ta cÇn suy nghÜ thªm/gf_DoNothing")
	Say("Bang héi c¸c h¹ ®· rÊt xuÊt s¾c trong cuéc ®ua, h·y mau nhËn th­ëng",getn(tbSay), tbSay)
end


function EventKimXaLienServer_NhanThuongTrangBi_Form()
	local szAcc = GetAccount()
	local szName =  GetName()
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank <= 3 then
		tinsert(tbSay, "Ta lÊy bé trang bÞ Nam Tiªu ChuÈn/#EventKimXaLienServer_NhanThuong(1)")
		tinsert(tbSay, "Ta lÊy bé trang bÞ Nam Kh«i Ng«/#EventKimXaLienServer_NhanThuong(2)")
		tinsert(tbSay, "Ta lÊy bé trang bÞ N÷ Gîi C¶m/#EventKimXaLienServer_NhanThuong(3)")
		tinsert(tbSay, "Ta lÊy bé trang bÞ KiÒu N÷/#EventKimXaLienServer_NhanThuong(4)")
	elseif nRank > 3 and nRank <= 10 then
		tinsert(tbSay, "NhËn phÇn th­ëng/#EventKimXaLienServer_NhanThuong(0)")
	end
	tinsert(tbSay, "Ta cÇn suy nghÜ thªm/gf_DoNothing")
	Say("H·y chän kiÓu h×nh c¸c h¹ thÝch cho phÇn th­ëng Kim Xµ Nguyªn So¸i",getn(tbSay), tbSay)
end

function EventKimXaLienServer_NhanThuong(nBody)
	local szAcc = GetAccount()
	local szName =  GetName()
	local nServerID = GetGlbValue(1023)
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	if tbBang[szAcc] == nil then
		Talk(1,"",szNpcName.."Tµi kho¶n c¸c h¹ kh«ng ph¶i tµi kho¶n ®· ®¨ng ký ®ua top.")
		return 0
	end
	if tbBang[szAcc][nServerID] == nil then
		Talk(1,"",szNpcName.."Bang héi ®¹t gi¶i kh«ng ë Server nµy.")
		return 0
	end
	if tbBang[szAcc][nServerID][1] ~= szName then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ph¶i ng­êi ®· ®¨ng ký ®ua top.")
		return 0
	end
	if gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT,1) ~= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi, h·y kiÓm tra l¹i.")
		return 0
	end
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank < 4 then
		if gf_Judge_Room_Weight(30, 500) == 0 then
			Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
			return 0
		end
	else
		if gf_Judge_Room_Weight(42, 500) == 0 then
			Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
			return 0
		end
	end
	local nCheck = 0
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank < 4 then
		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[nRank])
	elseif nRank >= 4 and nRank <= 10 then
		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[4])
	end
	if nCheck == 0 then
		return 0
	end
	
	--================ Trao thuong
	if nRank < 4 then
		LIB_Award:PayMaterial(tbTopNguyenLieu[nRank])
	elseif nRank >= 4 and nRank <= 10 then
		LIB_Award:PayMaterial(tbTopNguyenLieu[4])
	end
	gf_SetTaskByte(TSK_KIMXA_ALLSERVER_POINT,1,1)
	if nRank <= 2 then
		gf_SetTaskByte(TSK_KIMXA_ALLSERVER_POINT,2, tbTopAwardItem [nRank][2])
	end
	if nRank == 1 then
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
		LIB_Award:Award(tbTopAwardItem [nRank][1])
	elseif nRank == 2 then
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
		LIB_Award:Award(tbTopAwardItem [nRank][1])
	elseif nRank == 3 then
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
	elseif nRank >3 and nRank <= 10 then
		TrangBiKimXa3Sao(40)
	end
end


function EventKimXaLienServer_MatTichMonPhai20_Done(nIndex)
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	if gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 1) ~= 1 then
		Talk(1,"", szNpcName.."H·y nhËn phÇn th­ëng vËt phÈm tr­íc, xong råi quay l¹i ®©y.")
		return 0
	end
	if gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2) <= 0 then
		Talk(1,"", szNpcName.."C¸c h¹ kh«ng cã phÇn th­ëng nµy, hoÆc ®· nhËn hÕt.")
		return 0
	end
	gf_SetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2, gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2) - 1)

	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx(szLogTitle, "nhËn", 1, tbDieuKienNhanThuong[19][1].." ®iÓm: "..tbDieuKienNhanThuong[19][3])
	Talk(1,"","C¸c h¹ ®· nhËn 1 mËt tÞch siªu cÊp, cã thÓ nhËn tiÕp "..gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2).." quyÓn")
end


tbTrangBiKimXa_NguyenSoai = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,153,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,153,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,153,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng Nguyªn So¸i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,152,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,152,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,152,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Tèng Nguyªn So¸i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,154,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,154,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,154,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Tèng Nguyªn So¸i"}}},
			},
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,153,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,153,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,153,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu Nguyªn So¸i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,152,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,152,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,152,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu Nguyªn So¸i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
				[2] = {item={{gdp={0,154,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
				[3] = {item={{gdp={0,154,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
				[4] = {item={{gdp={0,154,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu Nguyªn So¸i"}}},
			},
	},
}
