-- VNG event ®ua top server
-- Created by TuanNA5
-- Modify by PhucBDB 14/12/2011
-- Modify by DoanDVP 10/07/2014

Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");

TOP_START_DATE = 20200318
TOP_END_DATE  = 20200518
TSK_TOP_TRANSLIFE1 = 1	--Top 1 hÖ ph¸i, sö dông task TSK_TOP_AWARD (Bit 1)
TSK_TOP_HORNOR = 2
TSK_TOP_1MIL_HORNOR = 3	--Top 1 ®¹t 3t5 c«ng tr¹ng + Top 3 ®¹t 2t8 c«ng tr¹ng, , sö dông task TSK_TOP_AWARD (Bit 3)
TSK_TOP_TRANSLIFE3 = 3
TOP_CREATED_ROLE = 1324490626
TOP_SERVER_ID = 128
szLOGSERVERNAME = "SAT HO"

-- Qui ®Þnh gia trÞ ®iÓm danh väng , s­ m«n , qu©n c«ng , top Level nhËn th­ëng theo ®¼ng cÊp
tb_topserver_award_limit = {				
				[76] = {  3000,   4000,   50000,     0},
				[77] = {  3000,   4000,   50000,     1},
				[78] = {  4000,   5000,   55000,     2},
				[79] = {  5000,   5000,   55000,     3},
				[80] = {  6000,   5000,   55000,     4},
				[81] = {  7000,   6000,   55000,     5},
				[82] = {  8000,   7000,   60000,     6},
				[83] = {  9000,   8000,   60000,     7},
--				[84] = {10000,   9000,   70000,   	 8},
--				[85] = {10000, 10000,   80000,    9},				
				[86] = {10000, 10000,   80000,    8},
				[87] = {10000, 10000,   80000,    9},
				[88] = {10000, 10000,   80000,    10},
				[89] = {10000, 10000,   80000,    11},
--				[90] = {10000, 10000,   80000,    14},
				[91] = {11000, 11000,   85000,    12},
				[92] = {11000, 11000,   90000,    13},
				[93] = {11000, 11000,   95000,    14},
				[94] = {12000, 12000,   120000,    15},
--				[98] = {16000, 16000,   160000,    19},
				[99] = {14000, 14000,   140000,    16},
--				[192] = {22000, 22000, 220000, 21},
--				[292] = {25000, 25000, 250000, 22},
--				[396] = {25000, 25000, 250000, 23},
};
-- Danh s¸ch ID Skill 55
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[22] = 0,
				[23] = 1030,
				[24] = 0,
				[25] = 1065,
				[26] = 1093,
				[27] = 1143,
				[28] = 0,
				[29] = 1176,
				[30] = 1229,
				[31] = 1882,
				[32] = 1896,
}
-- Danh s¸ch ID Skill trÊn ph¸i
tFactionSkillInfo =
{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[24] = 0,
		[25] = 1066,
		[26] = 1094,
		[27] = 1144,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
		[31] = 1883,
		[32] = 1897,
}

--Trang bÞ chiÕn cuång
tbTrangBiChienCuong = {
	[100] = {
		[1] = {
			[2] = {item={{gdp={0,100,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn §Þa Bµo"}}},
			[4] = {item={{gdp={0,100,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phæ TÕ Bµo"}}},
			[3] = {item={{gdp={0,100,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn T«n Bµo"}}},
			[6] = {item={{gdp={0,100,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
			[11] = {item={{gdp={0,100,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Y"}}},
			[12] = {item={{gdp={0,100,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Y"}}},
			[14] = {item={{gdp={0,100,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Bµo"}}},
			[15] = {item={{gdp={0,100,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
			[17] = {item={{gdp={0,100,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
			[18] = {item={{gdp={0,100,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
			[20] = {item={{gdp={0,100,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Y"}}},
			[21] = {item={{gdp={0,100,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Y"}}},
			[23] = {item={{gdp={0,100,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong L«i Bµo"}}},
			[25] = {item={{gdp={0,100,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Y"}}},
			[26] = {item={{gdp={0,100,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
			[27] = {item={{gdp={0,100,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Bµo"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Bµo"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,100,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn §Þa Bµo"}}},
			[4] = {item={{gdp={0,100,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phæ TÕ Bµo"}}},
			[3] = {item={{gdp={0,100,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn T«n Bµo"}}},
			[6] = {item={{gdp={0,100,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
			[11] = {item={{gdp={0,100,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Y"}}},
			[12] = {item={{gdp={0,100,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Y"}}},
			[14] = {item={{gdp={0,100,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Bµo"}}},
			[15] = {item={{gdp={0,100,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
			[17] = {item={{gdp={0,100,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
			[18] = {item={{gdp={0,100,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
			[20] = {item={{gdp={0,100,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Y"}}},
			[21] = {item={{gdp={0,100,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Y"}}},
			[23] = {item={{gdp={0,100,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong L«i Bµo"}}},
			[25] = {item={{gdp={0,100,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Y"}}},
			[26] = {item={{gdp={0,100,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
			[27] = {item={{gdp={0,100,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Bµo"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Bµo"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,100,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
			[8] = {item={{gdp={0,100,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bå T¸t Y"}}},
			[9] = {item={{gdp={0,100,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång L­u ThñyY"}}},
			[11] = {item={{gdp={0,100,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Y"}}},
			[12] = {item={{gdp={0,100,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Y"}}},
			[14] = {item={{gdp={0,100,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Bµo"}}},
			[15] = {item={{gdp={0,100,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
			[17] = {item={{gdp={0,100,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
			[18] = {item={{gdp={0,100,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
			[20] = {item={{gdp={0,100,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Y"}}},
			[21] = {item={{gdp={0,100,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Y"}}},
			[25] = {item={{gdp={0,100,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Y"}}},
			[26] = {item={{gdp={0,100,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
			[27] = {item={{gdp={0,100,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
			[29] = {item={{gdp={0,100,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh N÷  Y"}}},
			[30] = {item={{gdp={0,100,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh Linh Y"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Bµo"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Bµo"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,100,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
			[8] = {item={{gdp={0,100,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bå T¸t Y"}}},
			[9] = {item={{gdp={0,100,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång L­u ThñyY"}}},
			[11] = {item={{gdp={0,100,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Y"}}},
			[12] = {item={{gdp={0,100,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Y"}}},
			[14] = {item={{gdp={0,100,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Bµo"}}},
			[15] = {item={{gdp={0,100,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
			[17] = {item={{gdp={0,100,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
			[18] = {item={{gdp={0,100,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
			[20] = {item={{gdp={0,100,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Y"}}},
			[21] = {item={{gdp={0,100,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Y"}}},
			[25] = {item={{gdp={0,100,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Y"}}},
			[26] = {item={{gdp={0,100,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
			[27] = {item={{gdp={0,100,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
			[29] = {item={{gdp={0,100,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh N÷  Y"}}},
			[30] = {item={{gdp={0,100,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh Linh Y"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Bµo"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Bµo"}}},
		}
	},
	
	[101] = {
		[1] = {
			[2] = {item={{gdp={0,101,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn §Þa Trang"}}},
			[4] = {item={{gdp={0,101,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phæ TÕ Trang"}}},
			[3] = {item={{gdp={0,101,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn T«n Trang"}}},
			[6] = {item={{gdp={0,101,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
			[11] = {item={{gdp={0,101,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Trang"}}},
			[12] = {item={{gdp={0,101,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
			[14] = {item={{gdp={0,101,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Trang"}}},
			[15] = {item={{gdp={0,101,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
			[17] = {item={{gdp={0,101,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
			[20] = {item={{gdp={0,101,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Trang"}}},
			[21] = {item={{gdp={0,101,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Trang"}}},
			[23] = {item={{gdp={0,101,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong L«i Trang"}}},
			[25] = {item={{gdp={0,101,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
			[26] = {item={{gdp={0,101,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Trang"}}},
			[27] = {item={{gdp={0,101,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Trang"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,101,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn §Þa Trang"}}},
			[4] = {item={{gdp={0,101,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phæ TÕ Trang"}}},
			[3] = {item={{gdp={0,101,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn T«n Trang"}}},
			[6] = {item={{gdp={0,101,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
			[11] = {item={{gdp={0,101,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Trang"}}},
			[12] = {item={{gdp={0,101,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
			[14] = {item={{gdp={0,101,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Trang"}}},
			[15] = {item={{gdp={0,101,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
			[17] = {item={{gdp={0,101,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
			[20] = {item={{gdp={0,101,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Trang"}}},
			[21] = {item={{gdp={0,101,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Trang"}}},
			[23] = {item={{gdp={0,101,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong L«i Trang"}}},
			[25] = {item={{gdp={0,101,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
			[26] = {item={{gdp={0,101,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Trang"}}},
			[27] = {item={{gdp={0,101,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Trang"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,101,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
			[8] = {item={{gdp={0,101,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bå T¸t Khè"}}},
			[9] = {item={{gdp={0,101,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång L­u ThñyKhè"}}},
			[11] = {item={{gdp={0,101,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Trang"}}},
			[12] = {item={{gdp={0,101,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
			[14] = {item={{gdp={0,101,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Trang"}}},
			[15] = {item={{gdp={0,101,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
			[17] = {item={{gdp={0,101,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
			[20] = {item={{gdp={0,101,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Trang"}}},
			[21] = {item={{gdp={0,101,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Trang"}}},
			[25] = {item={{gdp={0,101,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
			[26] = {item={{gdp={0,101,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Trang"}}},
			[27] = {item={{gdp={0,101,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
			[29] = {item={{gdp={0,101,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh N÷  Khè"}}},
			[30] = {item={{gdp={0,101,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh Linh Khè"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Trang"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,101,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
			[8] = {item={{gdp={0,101,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bå T¸t Khè"}}},
			[9] = {item={{gdp={0,101,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång L­u ThñyKhè"}}},
			[11] = {item={{gdp={0,101,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du Trang"}}},
			[12] = {item={{gdp={0,101,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
			[14] = {item={{gdp={0,101,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Trang"}}},
			[15] = {item={{gdp={0,101,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
			[17] = {item={{gdp={0,101,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
			[20] = {item={{gdp={0,101,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n Trang"}}},
			[21] = {item={{gdp={0,101,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m Trang"}}},
			[25] = {item={{gdp={0,101,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
			[26] = {item={{gdp={0,101,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Trang"}}},
			[27] = {item={{gdp={0,101,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
			[29] = {item={{gdp={0,101,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh N÷  Khè"}}},
			[30] = {item={{gdp={0,101,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh Linh Khè"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Trang"}}},
		},
	},
	
	[103] = {
		[1] = {
			[2] = {item={{gdp={0,103,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn §Þa M¹o"}}},
			[4] = {item={{gdp={0,103,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phæ TÕ M¹o"}}},
			[3] = {item={{gdp={0,103,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn T«n M¹o"}}},
			[6] = {item={{gdp={0,103,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
			[11] = {item={{gdp={0,103,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du C©n"}}},
			[12] = {item={{gdp={0,103,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
			[14] = {item={{gdp={0,103,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
			[15] = {item={{gdp={0,103,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
			[18] = {item={{gdp={0,103,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
			[20] = {item={{gdp={0,103,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n C©n"}}},
			[21] = {item={{gdp={0,103,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m C©n"}}},
			[23] = {item={{gdp={0,103,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong L«i Qu¸n"}}},
			[25] = {item={{gdp={0,103,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
			[26] = {item={{gdp={0,103,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
			[27] = {item={{gdp={0,103,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Qu¸n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Qu¸n"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,103,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn §Þa M¹o"}}},
			[4] = {item={{gdp={0,103,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phæ TÕ M¹o"}}},
			[3] = {item={{gdp={0,103,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn T«n M¹o"}}},
			[6] = {item={{gdp={0,103,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
			[11] = {item={{gdp={0,103,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du C©n"}}},
			[12] = {item={{gdp={0,103,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
			[14] = {item={{gdp={0,103,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
			[15] = {item={{gdp={0,103,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
			[18] = {item={{gdp={0,103,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
			[20] = {item={{gdp={0,103,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n C©n"}}},
			[21] = {item={{gdp={0,103,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m C©n"}}},
			[23] = {item={{gdp={0,103,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong L«i Qu¸n"}}},
			[25] = {item={{gdp={0,103,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
			[26] = {item={{gdp={0,103,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
			[27] = {item={{gdp={0,103,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Qu¸n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Qu¸n"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,103,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
			[8] = {item={{gdp={0,103,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bå T¸t Tr©m"}}},
			[9] = {item={{gdp={0,103,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång L­u Thñy Tr©m"}}},
			[11] = {item={{gdp={0,103,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du C©n"}}},
			[12] = {item={{gdp={0,103,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
			[14] = {item={{gdp={0,103,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
			[15] = {item={{gdp={0,103,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
			[18] = {item={{gdp={0,103,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
			[20] = {item={{gdp={0,103,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n C©n"}}},
			[21] = {item={{gdp={0,103,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m C©n"}}},
			[25] = {item={{gdp={0,103,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
			[26] = {item={{gdp={0,103,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
			[27] = {item={{gdp={0,103,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
			[29] = {item={{gdp={0,103,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh N÷  Tr©m"}}},
			[30] = {item={{gdp={0,103,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh Linh Tr©m"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Qu¸n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Qu¸n"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,103,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
			[8] = {item={{gdp={0,103,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bå T¸t Tr©m"}}},
			[9] = {item={{gdp={0,103,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång L­u Thñy Tr©m"}}},
			[11] = {item={{gdp={0,103,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn Du C©n"}}},
			[12] = {item={{gdp={0,103,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
			[14] = {item={{gdp={0,103,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
			[15] = {item={{gdp={0,103,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
			[17] = {item={{gdp={0,103,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
			[18] = {item={{gdp={0,103,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
			[20] = {item={{gdp={0,103,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Minh T«n C©n"}}},
			[21] = {item={{gdp={0,103,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Cæ T©m C©n"}}},
			[25] = {item={{gdp={0,103,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
			[26] = {item={{gdp={0,103,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
			[27] = {item={{gdp={0,103,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
			[29] = {item={{gdp={0,103,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh N÷  Tr©m"}}},
			[30] = {item={{gdp={0,103,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh Linh Tr©m"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Qu¸n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma Qu¸n"}}},
		},
	},
}

tbVuKhiChienCuong = {
	[1] = {
		[2] = {item={{gdp={0,3,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång B¨ng Thiªn §ao"}}},
		[3] = {item={{gdp={0,8,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThiÒn §Þnh Tr­îng"}}},
		[4] = {item={{gdp={0,0,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh ChiÕn Thñ"}}},
		[6] = {item={{gdp={0,1,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
		[11] = {item={{gdp={0,0,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
		[12] = {item={{gdp={0,5,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Cùc C«n"}}},
		[14] = {item={{gdp={0,2,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
		[15] = {item={{gdp={0,9,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
		[17] = {item={{gdp={0,6,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
		[18] = {item={{gdp={0,4,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
		[20] = {item={{gdp={0,7,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
		[21] = {item={{gdp={0,11,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
		[23] = {item={{gdp={0,2,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Ph¹t KiÕm"}}},
		[25] = {item={{gdp={0,3,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Chóc Dung §ao"}}},
		[26] = {item={{gdp={0,9,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
		[27] = {item={{gdp={0,11,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Chñy"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma KiÕm"}}},
	},
	[2] = {
		[2] = {item={{gdp={0,3,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång B¨ng Thiªn §ao"}}},
		[3] = {item={{gdp={0,8,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThiÒn §Þnh Tr­îng"}}},
		[4] = {item={{gdp={0,0,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th¸nh ChiÕn Thñ"}}},
		[6] = {item={{gdp={0,1,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
		[11] = {item={{gdp={0,0,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
		[12] = {item={{gdp={0,5,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Cùc C«n"}}},
		[14] = {item={{gdp={0,2,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
		[15] = {item={{gdp={0,9,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
		[17] = {item={{gdp={0,6,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
		[18] = {item={{gdp={0,4,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
		[20] = {item={{gdp={0,7,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
		[21] = {item={{gdp={0,11,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
		[23] = {item={{gdp={0,2,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Thiªn Ph¹t KiÕm"}}},
		[25] = {item={{gdp={0,3,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Chóc Dung §ao"}}},
		[26] = {item={{gdp={0,9,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
		[27] = {item={{gdp={0,11,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Chñy"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma KiÕm"}}},

	},
	[3] = {
		[6] = {item={{gdp={0,1,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
		[8] = {item={{gdp={0,2,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång PhËt Quang KiÕm"}}},
		[9] = {item={{gdp={0,10,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Hé Bang CÇm"}}},
		[11] = {item={{gdp={0,0,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
		[12] = {item={{gdp={0,5,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Cùc C«n"}}},
		[14] = {item={{gdp={0,2,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
		[15] = {item={{gdp={0,9,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
		[17] = {item={{gdp={0,6,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
		[18] = {item={{gdp={0,4,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
		[20] = {item={{gdp={0,7,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
		[21] = {item={{gdp={0,11,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
		[25] = {item={{gdp={0,3,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Chóc Dung §ao"}}},
		[26] = {item={{gdp={0,9,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
		[27] = {item={{gdp={0,11,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
		[29] = {item={{gdp={0,13,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong Linh PhiÕn"}}},
		[30] = {item={{gdp={0,12,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Kh«ng Minh §Þch"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Chñy"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma KiÕm"}}},
	},
	[4] = {
		[6] = {item={{gdp={0,1,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
		[8] = {item={{gdp={0,2,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång PhËt Quang KiÕm"}}},
		[9] = {item={{gdp={0,10,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Hé Bang CÇm"}}},
		[11] = {item={{gdp={0,0,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
		[12] = {item={{gdp={0,5,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång V« Cùc C«n"}}},
		[14] = {item={{gdp={0,2,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
		[15] = {item={{gdp={0,9,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
		[17] = {item={{gdp={0,6,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
		[18] = {item={{gdp={0,4,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
		[20] = {item={{gdp={0,7,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
		[21] = {item={{gdp={0,11,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
		[25] = {item={{gdp={0,3,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Chóc Dung §ao"}}},
		[26] = {item={{gdp={0,9,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
		[27] = {item={{gdp={0,11,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
		[29] = {item={{gdp={0,13,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Phong Linh PhiÕn"}}},
		[30] = {item={{gdp={0,12,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Kh«ng Minh §Þch"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Bµn V©n Chñy"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="ChiÕn Cuång Tr¶m Ma KiÕm"}}},
	},
}

tb_topserver_book45_1 = {
			[2] =  {"Kim Cang Phôc Ma T©m Ph¸p", {0,107,2,1}},
			[3] =  {"V« TrÇn T©m Ph¸p", {0,107,6,1}},
			[4] =  {"TiÒm Long T©m Ph¸p", {0,107,4,1}},
			[14] =  {"HuyÒn ¶nh T©m Ph¸p", {0,107,18,1}},
			[15] =  {"Qu©n Tö T©m Ph¸p", {0,107,20,1}},
			[8] =  {"Nh­ ý T©m Ph¸p", {0,107,10,1}},
			[9] =  {"BÝch H¶i T©m Ph¸p", {0,107,12,1}},
			[11] =  {"Hçn §én T©m Ph¸p", {0,107,14,1}},
			[12] =  {"Quý Thiªn T©m Ph¸p", {0,107,16,1}},
			[6] =  {"Thiªn La T©m Ph¸p", {0,107,8,1}},
			[17] =  {"TrÊn Qu©n T©m Ph¸p", {0,107,22,1}},
			[18] =  {"Xuyªn V©n T©m Ph¸p", {0,107,24,1}},
			[20] = {"U Minh T©m Ph¸p", {0,107,26,1}},
			[21] = {"Linh Cæ T©m Ph¸p", {0,107,28,1}},
			[23] = {"Kinh Phong T©m Ph¸p", {0,107,181,1}},
			[29] = {"Tóy Méng T©m Ph¸p", {0,107,189,1}},
			[30] = {"Phån Hoa T©m Ph¸p", {0,107,194,1}},
			[31] =  {"Thiªn La T©m Ph¸p", {0,107,8,1}},
			[32] = {"Kinh Phong T©m Ph¸p", {0,107,181,1}},
}

tb_topserver_book45_2 = {
			[2] =  {"Kim Cang Phôc Ma kinh", {0,107,1,1}}, 
			[3] =  {"V« TrÇn MËt tÞch", {0,107,5,1}}, 
			[4] =  {"TiÒm Long MËt tÞch", {0,107,3,1}}, 
			[14] =  {"HuyÒn ¶nh MËt tÞch", {0,107,17,1}}, 
			[15] =  {"Qu©n Tö MËt tÞch", {0,107,19,1}}, 
			[8] =  {"Nh­ ý MËt TÞch", {0,107,9,1}}, 
			[9] =  {"BÝch H¶i Phæ", {0,107,11,1}}, 
			[11] =  {"Hçn §én MËt tÞch", {0,107,13,1}}, 
			[12] =  {"Quý Thiªn MËt tÞch", {0,107,15,1}}, 
			[6] =  {"Thiªn La MËt TÞch", {0,107,7,1}}, 
			[17] =  {"TrÊn Qu©n MËt tÞch", {0,107,21,1}}, 
			[18] =  {"Xuyªn V©n MËt tÞch", {0,107,23,1}}, 
			[20] = {"U Minh Quû Lôc", {0,107,25,1}}, 
			[21] = {"Linh Cæ MËt tÞch", {0,107,27,1}}, 
			[23] = {"Kinh Phong MËt tÞch", {0,107,180,1}}, 
			[29] = {"Tóy Méng  MËt tÞch", {0,107,188,1}}, 
			[30] = {"Phån Hoa MËt tÞch", {0,107,190,1}}, 
			[31] =  {"Thiªn La MËt TÞch", {0,107,7,1}}, 
			[32] = {"Kinh Phong MËt tÞch", {0,107,180,1}},
}
tb_topserver_book70_1 ={
			[2] = {"Kim Cang B¸t Nh· Kinh", {0,107,166,1}},
			[3] = {"V« TrÇn Bå §Ò Kinh",{0,107,168,1}},
			[4] = {"TiÒm Long TÞch DiÖt Kinh",{0,107,167,1}},
			[6] = {"Thiªn La Liªn Ch©u Lôc",{0,107,169,1}},
			[8] = {"Nh­ ý Kim §Ønh MËt TÞch",{0,107,170,1}},
			[9] = {"BÝch H¶i TuyÖt ¢m Phæ",{0,107,171,1}},
			[11] = {"Hçn §én TrÊn Nh¹c MËt TÞch"	,{0,107,172,1}},
			[12] = {"Quü Thiªn Du Long MËt TÞch",{0,107,173,1}},
			[14] = {"HuyÔn ¶nh Mª Tung MËt TÞch",{0,107,174,1}},
			[15] = {"Qu©n Tö TiÖt Phong MËt TÞch",{0,107,175,1}},
			[17] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,{0,107,176,1}},
			[18] = {"Xuyªn V©n L¹c Hång MËt TÞch",{0,107,177,1}},
			[20] = {"U Minh Phong Ma Lôc",{0,107,178,1}},
			[21] = {"Linh Cæ HuyÔn Tµ Lôc",{0,107,179,1}},
			[23] = {"Cöu Thiªn Phong L«i QuyÓn",{0,107,198,1}},
			[29] = {"Hång TrÇn Tóy Méng Phæ",{0,107,202,1}},
			[30] = {"Phong Hoa Thiªn DiÖp QuyÓn",{0,107,203,1}},
			[31] = {"Thiªn La Liªn Ch©u Lôc",{0,107,230,1}},
			[32] = {"Cöu Thiªn Phong L«i QuyÓn",{0,107,234,1}},
}

tb_topserver_yue = {
				[2] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[3] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[4] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[6] = {"Tói bÝ kiÕp §­êng M«n", {2, 0, 608, 1, 4}},
				[8] = {"Tói bÝ kiÕp Nga My", {2, 0, 609, 1, 4}},
				[9] = {"Tói bÝ kiÕp Nga My", {2, 0, 609, 1, 4}},
				[11] = {"Tói bÝ kiÕp C¸i Bang", {2, 0, 610, 1, 4}},
				[12] = {"Tói bÝ kiÕp C¸i Bang", {2, 0, 610, 1, 4}},
				[14] = {"Tói bÝ kiÕp Vâ §ang", {2, 0, 611, 1, 4}},
				[15] = {"Tói bÝ kiÕp Vâ §ang", {2, 0, 611, 1, 4}},
				[17] = {"Tói bÝ kiÕp D­¬ng M«n", {2, 0, 612, 1, 4}},
				[18] = {"Tói bÝ kiÕp D­¬ng M«n", {2, 0, 612, 1, 4}},
				[20] = {"Tói bÝ kiÕp Ngò §éc", {2, 0, 613, 1, 4}},
				[21] = {"Tói bÝ kiÕp Ngò §éc", {2, 0, 613, 1, 4}}
};

tb_topserver_jew = {
				[1] = {"Tµng KiÕm Kim Ên", 10, {0, 102, 40,1,1,-1,-1,-1,-1,-1,-1}},
				[2] = {"Tµng KiÕm Kú Th¹ch", 10, {0, 102, 39,1,1,-1,-1,-1,-1,-1,-1}},				
				[3] = {"Tµng KiÕm B¶o Ch©u", 80, {0, 102, 38,1,1,-1,-1,-1,-1,-1,-1}},				
};

tb_topserver_book_high = {
				[2] = {"DÞch C©n Kinh-th­îng", {2, 1, 916, 1}},
				[4] = {"Nh­ Lai ThÇn Ch­ëng-th­îng", {2, 1, 919, 1}},
				[3] = {"TÈy Tñy Kinh-th­îng", {2, 1, 922, 1}},
				[6] = {"HÊp Tinh TrËn-th­îng", {2, 1, 925, 1}},
				[8] = {"V¹n T­íng ThÇn C«ng-th­îng", {2, 1, 928, 1}},
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-th­îng", {2, 1, 931, 1}},
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-th­îng", {2, 1, 934, 1}},
				[12] = {"§¶ CÈu C«n TrËn-th­îng", {2, 1, 937, 1}},
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-th­îng", {2, 1, 940, 1}},
				[15] = {"Th¸i Cùc ThÇn C«ng-th­îng", {2, 1, 943, 1}},
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-th­îng", {2, 1, 946, 1}},
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-th­îng", {2, 1, 949, 1}},
				[20] = {"V« Thiªn Ma C«ng-th­îng", {2, 1, 955, 1}},
				[21] = {"V« ¶nh Ma Cæ-th­îng", {2, 1, 952, 1}},
};

tb_topserver_book_med = {
				[2] = {"DÞch C©n Kinh-trung", {2, 1, 917, 1}},			
				[4] = {"Nh­ Lai ThÇn Ch­ëng-trung", {2, 1, 920, 1}},			
				[3] = {"TÈy Tñy Kinh-trung", {2, 1, 923, 1}},			
				[6] = {"HÊp Tinh TrËn-trung", {2, 1, 926, 1}},			
				[8] = {"V¹n T­íng ThÇn C«ng-trung", {2, 1, 929, 1}},			
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-trung", {2, 1, 932, 1}},			
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-trung", {2, 1, 935, 1}},			
				[12] = {"§¶ CÈu C«n TrËn-trung", {2, 1, 938, 1}},			
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-trung", {2, 1, 941, 1}},			
				[15] = {"Th¸i Cùc ThÇn C«ng-trung", {2, 1, 944, 1}},			
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-trung", {2, 1, 947, 1}},			
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-trung", {2, 1, 950, 1}},			
				[20] = {"V« Thiªn Ma C«ng-trung", {2, 1, 956, 1}}, 
				[21] = {"V« ¶nh Ma Cæ-trung", {2, 1, 953, 1}},
};

tb_topserver_book_low = {
				[2] = {"DÞch C©n Kinh-h¹ ", {2, 1, 918, 1}},		
				[4] = {"Nh­ Lai ThÇn Ch­ëng-h¹ ", {2, 1, 921, 1}},		
				[3] = {"TÈy Tñy Kinh-h¹ ", {2, 1, 924, 1}},		
				[6] = {"HÊp Tinh TrËn-h¹ ", {2, 1, 927, 1}},		
				[8] = {"V¹n T­íng ThÇn C«ng-h¹ ", {2, 1, 930, 1}},		
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-h¹ ", {2, 1, 933, 1}},		
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ", {2, 1, 936, 1}},		
				[12] = {"§¶ CÈu C«n TrËn-h¹ ", {2, 1, 939, 1}},		
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-h¹ ", {2, 1, 942, 1}},		
				[15] = {"Th¸i Cùc ThÇn C«ng-h¹ ", {2, 1, 945, 1}},		
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-h¹ ", {2, 1, 948, 1}},		
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-h¹ ", {2, 1, 951, 1}},		
				[20] = {"V« Thiªn Ma C«ng-h¹ ", {2, 1, 957, 1}},
				[21] = {"V« ¶nh Ma Cæ-h¹ ", {2, 1, 954, 1}},
};

tb_golden_book_all = {
				[2] = {"DÞch C©n Kinh", {0, 112, 101, 1}},		
				[4] = {"Nh­ Lai ThÇn Ch­ëng", {0, 112, 102, 1}},		
				[3] = {"TÈy Tñy Kinh", {0, 112, 103, 1}},		
				[6] = {"HÊp Tinh TrËn", {0, 112, 104, 1}},		
				[8] = {"V¹n T­íng ThÇn C«ng", {0, 112, 105, 1}},		
				[9] = {"Thiªn ¢m TrÊn Hån Khóc", {0, 112, 106, 1}},		
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng", {0, 112, 107, 1}},		
				[12] = {"§¶ CÈu C«n TrËn", {0, 112, 108, 1}},		
				[14] = {"V« Th­îng Th¸i Cùc KiÕm", {0, 112, 109, 1}},		
				[15] = {"Th¸i Cùc ThÇn C«ng", {0, 112, 110, 1}},		
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng", {0, 112, 111, 1}},		
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn", {0, 112, 112, 1}},		
				[20] = {"V« Thiªn Ma C«ng", {0, 112, 113, 1}},		
				[21] = {"V« ¶nh Ma Cæ", {0, 112, 114, 1}},
				[23] = {"Phong L«i Ch©u", {0,112,192,1}},
				[29] = {"Phông Minh Phæ", {0,112,196,1}},
				[30] = {"Hoa Tiªn T©m Kinh", {0,112,197,1}},	
				[31] = {"HÊp Tinh TrËn", {0, 112, 104, 1}},
				[32] = {"Phong L«i Ch©u", {0,112,192,1}},				
}

tbMatTich70caocap  =
{	
		[2] =  {item={{gdp={0, 107, 204,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Kim Cang B¸t Nh· Ch©n QuyÓn"}}}, 
		[3] =  {item={{gdp={0, 107, 206,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="V« TrÇn Bå §Ò Ch©n QuyÓn"}}},
		[4] =  {item={{gdp={0, 107, 205,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}},
		[6] =  {item={{gdp={0, 107, 207,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[8] =  {item={{gdp={0, 107, 208,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}},
		[9] =  {item={{gdp={0, 107, 209,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}},
		[14] =  {item={{gdp={0, 107, 212,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}},
		[15] =  {item={{gdp={0, 107, 213,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu©n Tö §íi Phong Ch©n QuyÓn"}}},		
		[11] =  {item={{gdp={0, 107, 210,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}},
		[12] =  {item={{gdp={0, 107, 211,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Quú Thiªn Du Long Ch©n QuyÓn"}}},		
		[17] =  {item={{gdp={0, 107, 214,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}},
		[18] =  {item={{gdp={0, 107, 215,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}},
		[20] =  {item={{gdp={0, 107, 216,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}},
		[21] =  {item={{gdp={0, 107, 217,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}},
		[23] =  {item={{gdp={0, 107, 218,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},
		[29] =  {item={{gdp={0, 107, 222,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[30] =  {item={{gdp={0, 107, 223,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},		
		[31] =  {item={{gdp={0, 107, 231,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[32] =  {item={{gdp={0, 107, 235,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},		
}

local tbVukhiVietYen = {
		--[2] = {"ViÖt Yªn Phi Tinh §ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
		--[2] = {"ViÖt Yªn Phi Tinh C«n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		[3] =  {"ViÖt Yªn Phi Tinh Tr­îng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[4] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[14] =  {"ViÖt Yªn Tr¶m NguyÖt KiÕm", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[15] =  {"ViÖt Yªn Tr¶m NguyÖt Bót", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[8] =  {"ViÖt Yªn Phi Tinh KiÕm", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[9] =  {"ViÖt Yªn Phi Tinh CÇm", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[11] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[12] =  {"ViÖt Yªn Tr¶m NguyÖt C«n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[6] =  {"ViÖt Yªn Phi Tinh Ch©m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[17] =  {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[18] =  {"ViÖt Yªn Tr¶m NguyÖt Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[20] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[21] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
}

-- 1 item, 2 command, 3 table
-- must identify this table below the sub table
tb_topserver_award_item = {				
				[76] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 1000000, 0}},
				[77] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 2000000, 0}},
				[78] = {{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0}, {2, "Earn(%d)", 3000000, 0}},
				[79] = {{1, "Vâ L©m Cao Thñ", {2,1,1040,1,4}, 60*24*60*60}, {2, "Earn(%d)", 4000000, 0}},
				[80] = {{2, "AddItem(2,1,30164+mod(random(0,1000),%d),100)",20, 0}, {2, "Earn(%d)", 10000000, 0}},
				[81] = {{2,"NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "Méc R­¬ng", {2,1,30340,999,4}, 0}},
				[82] = {{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0},{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "N÷ Oa Tinh Th¹ch", {2,1,504,2,4}, 30*24*60*60}},
				[83] = {{3, tb_golden_book_all, 0, 0}, {2, "Earn(%d)", 10000000, 0}},
--				[84] = {{3, tb_topserver_book_med, 0, 0}, {1, "Thiªn Th¹ch Linh Th¹ch", {2,1,1068,1,4}, 30*24*60*60}},
--				[85] = {{3, tb_topserver_book_low, 0, 0}, {1, "M¶nh B¹ch Kim", {2,1,30346,1,1}, 0}},
				[86] = {{1, "Qu©n C«ng Ch­¬ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "Tñ ¸o", {2,1,1070,1,4}, 30*24*60*60}},
				[87] = {{1, "Nh©n S©m V¹n N¨m", {2,1,30071,5,1}, 30*24*60*60},{1, "Qu©n C«ng Ch­¬ng", {2,1,9999,5,1}, 0}},
				[88] = {{1, "Qu©n C«ng Ch­¬ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "Qu©n C«ng §¹i", {2,1,9998,1,1}, 30*24*60*60}},
				[89] = {{1, "Qu©n C«ng §¹i", {2,1,9998,5,1}, 30*24*60*60}},
--				[90] = {{1, "N÷ Oa Tinh Th¹ch", {2,1,504,4,4}, 30*24*60*60}},
				[91] = {{1, "Qu©n C«ng Huy Hoµng", {2,1,9977,3,1}, 30*24*60*60}},
				[92] = {{1, "Qu©n C«ng Huy Hoµng", {2,1,9977,6,1}, 30*24*60*60}},
				[93] = {{1, "Thiªn Th¹ch Linh Th¹ch", {2,1,1068,2,4}, 30*24*60*60}},
				[94] = {{1, "Qu©n C«ng Huy Hoµng", {2,1,9977,8,1}, 30*24*60*60}},
--				[98] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}},
				[99] = {{1, "§¹i §Þnh Hån", {2,1,1113,1}, 30*24*60*60},{1, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067,1}, 30*24*60*60}},
--				[192] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {1, "Th¸i DÞch Hçn Nguyªn C«ng §å", {2,0,1082,100,1}, 0}, {1, "L¨ng Ba Vi Bé", {0,112,78,1,1}, 0}},
--				[292] = {{3, tbMatTich70caocap, 0, 0}, {1, "Th¸i DÞch Hçn Nguyªn C«ng §å", {2,0,1082,100,1}, 0}, {3, tbVukhiVietYen, 0, 0}},
--				[396] = {{1, "§¹i §Þnh Hån", {2,1,1113,1}, 30*24*60*60}, {1, "ChuyÓn Sinh §¬n", {2,1,30345,1,4}, 60*24*60*60}},
};

tbTuVienChien = {
	[2] = {"Tö Viªn ChiÕn",{0,102,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Tö Viªn ChiÕn",{0,102,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Tö Viªn ChiÕn",{0,102,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Tö Viªn ChiÕn",{0,102,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Tö Viªn ChiÕn",{0,102,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Tö Viªn ChiÕn",{0,102,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Tö Viªn ChiÕn",{0,102,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Tö Viªn ChiÕn",{0,102,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Tö Viªn ChiÕn",{0,102,8867,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Tö Viªn ChiÕn",{0,102,8869,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Tö Viªn ChiÕn",{0,102,8871,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Tö Viªn ChiÕn",{0,102,8873,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Tö Viªn ChiÕn",{0,102,8875,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Tö Viªn ChiÕn",{0,102,8877,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienDau = {
	[2] = {"Tö Viªn §Êu",{0,102,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Tö Viªn §Êu",{0,102,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Tö Viªn §Êu",{0,102,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Tö Viªn §Êu",{0,102,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Tö Viªn §Êu",{0,102,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Tö Viªn §Êu",{0,102,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Tö Viªn §Êu",{0,102,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Tö Viªn §Êu",{0,102,8866,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Tö Viªn §Êu",{0,102,8868,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Tö Viªn §Êu",{0,102,8870,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Tö Viªn §Êu",{0,102,8872,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Tö Viªn §Êu",{0,102,8874,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Tö Viªn §Êu",{0,102,8876,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Tö Viªn §Êu",{0,102,8878,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienVuKhi = {
	[2] = {{"Tö Quang To¸i Vò §ao",{0,3,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, {"Tö Quang To¸i Vò C«n",{0,5,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
	[3] = {"Tö Quang Cöu Nh­ Tr­îng",{0,8,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Tö Quang H¹o Nhiªn Thñ",{0,0,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Tö Quang V« H×nh Ch©m",{0,1,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Tö Quang Tö Tinh KiÕm",{0,2,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Tö Quang Phông Hoµng CÇm",{0,10,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Tö Quang Ngò Nh¹c Thñ",{0,0,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Tö Quang Ph¸ Thiªn C«n",{0,5,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Tö Quang Hång Qu©n KiÕm",{0,2,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Tö Quang Sinh Tö Bót",{0,9,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Tö Quang Ph¸ Qu©n Th­¬ng",{0,6,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Tö Quang Khai Thiªn Cung",{0,4,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Tö Quang ¢m D­¬ng NhÉn",{0,7,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Tö Quang U Minh Tr¶o",{0,11,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienChien = {
	[2] = {"Hiªn Viªn ChiÕn",{0,102,8801,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hiªn Viªn ChiÕn",{0,102,8803,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hiªn Viªn ChiÕn",{0,102,8805,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hiªn Viªn ChiÕn",{0,102,8807,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hiªn Viªn ChiÕn",{0,102,8809,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hiªn Viªn ChiÕn",{0,102,8811,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hiªn Viªn ChiÕn",{0,102,8813,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hiªn Viªn ChiÕn",{0,102,8815,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hiªn Viªn ChiÕn",{0,102,8817,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hiªn Viªn ChiÕn",{0,102,8819,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hiªn Viªn ChiÕn",{0,102,8821,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hiªn Viªn ChiÕn",{0,102,8823,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hiªn Viªn ChiÕn",{0,102,8825,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hiªn Viªn ChiÕn",{0,102,8827,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienDau = {
	[2] = {"Hiªn Viªn §Êu",{0,102,8802,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hiªn Viªn §Êu",{0,102,8804,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hiªn Viªn §Êu",{0,102,8806,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hiªn Viªn §Êu",{0,102,8808,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hiªn Viªn §Êu",{0,102,8810,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hiªn Viªn §Êu",{0,102,8812,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hiªn Viªn §Êu",{0,102,8814,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hiªn Viªn §Êu",{0,102,8816,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hiªn Viªn §Êu",{0,102,8818,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hiªn Viªn §Êu",{0,102,8820,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hiªn Viªn §Êu",{0,102,8822,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hiªn Viªn §Êu",{0,102,8824,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hiªn Viªn §Êu",{0,102,8826,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hiªn Viªn §Êu",{0,102,8828,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienVuKhi = {
	[2] = {{"Hiªn Viªn To¸i Vò §ao",{0,3,8801,1,1,-1,-1,-1,-1,-1,-1,-1,14}}, {"Hiªn Viªn To¸i Vò C«n",{0,5,8802,1,1,-1,-1,-1,-1,-1,-1,-1,14}}},
	[3] = {"Hiªn Viªn Cöu Nh­ Tr­îng",{0,8,8803,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[4] = {"Hiªn Viªn H¹o Nhiªn Thñ",{0,0,8804,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[6] = {"Hiªn Viªn V« H×nh Ch©m",{0,1,8805,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[8] = {"Hiªn Viªn Tö Tinh KiÕm",{0,2,8806,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[9] = {"Hiªn Viªn Phông Hoµng CÇm",{0,10,8807,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[11] = {"Hiªn Viªn Ngò Nh¹c Thñ",{0,0,8808,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[12] = {"Hiªn Viªn Ph¸ Thiªn C«n",{0,5,8809,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[14] = {"Hiªn Viªn Hång Qu©n KiÕm",{0,2,8810,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[15] = {"Hiªn Viªn Sinh Tö Bót",{0,9,8811,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[17] = {"Hiªn Viªn Ph¸ Qu©n Th­¬ng",{0,6,8812,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[18] = {"Hiªn Viªn Khai Thiªn Cung",{0,4,8813,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[20] = {"Hiªn Viªn ¢m D­¬ng NhÉn",{0,7,8814,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[21] = {"Hiªn Viªn U Minh Tr¶o",{0,11,8815,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
}

tbVuKhiHaoNguyet = {
	[2] = {"H¹o NguyÖt-§é N¹n T«n Gi¶ PhËt §ao",{0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"H¹o NguyÖt-§é KiÕp T«n Gi¶ PhËt Thñ",{0,8,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"H¹o NguyÖt-§é ¸ch T«n Gi¶ PhËt Tr­îng",{0,0,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Ch©m",{0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"H¹o NguyÖt-PhËt V©n Th¸nh C« Liªn KiÕm",{0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"H¹o NguyÖt-PhËt TrÇn Th¸nh C« CÇm",{0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"H¹o NguyÖt-Trôc Phông Thiªn C¸i Thñ",{0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"H¹o NguyÖt-Du Long §Þa KhÊt C«n",{0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"H¹o NguyÖt-V« Cùc Thiªn T«n Tóc KiÕm",{0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bót",{0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"H¹o NguyÖt-C¶m Thiªn §Êu Hån Th­¬ng",{0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Cung",{0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"H¹o NguyÖt-Quû Xóc Tµ ThÇn §ao",{0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"H¹o NguyÖt-Vu Cèt §éc V­¬ng Tr¶o",{0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}
-- Qu©n C«ng §¹i	2	1	9998
-- Qu©n C«ng Huy Hoµng	2	1	9977
tbDieuKienUuDai = {
	[1] = {nLevel = 88, tbitem = {2,1,504,1, "N÷ Oa Tinh Th¹ch"}, nBit = 9, name= "Thiªn Chi Tµng KiÕm B¶o Ch©u", nSlot = 7, nWeight = 100},
	[2] = {nLevel = 89, tbitem = {2,1,504,2, "N÷ Oa Tinh Th¹ch"}, nBit = 10, name= "Thiªn Chi Tµng KiÕm Kú Th¹ch", nSlot = 7, nWeight = 100},
	[3] = {nLevel = 90, tbitem = {2,1,504,3, "N÷ Oa Tinh Th¹ch"}, nBit = 11, name= "Thiªn Chi Tµng KiÕm Kim Ên", nSlot  = 7, nWeight  = 100},
	[4] = {nLevel = 91, tbitem = {2,1,504,5, "N÷ Oa Tinh Th¹ch"}, nBit = 12, name= "§«ng Ph­¬ng Long Ch©u", nSlot  = 7, nWeight  = 100},
	[5] = {nLevel = 92, tbitem = {2,1,504,1, "N÷ Oa Tinh Th¹ch"}, nBit = 13, name= "1000 Tr¸i c©y ngÉu nhiªn", nSlot  = 7, nWeight  = 100},
	[6] = {nLevel = 93, tbitem = {2,1,504,1, "N÷ Oa Tinh Th¹ch"}, nBit = 14, name= "1000 Tr¸i c©y ngÉu nhiªn", nSlot  = 7, nWeight  = 100},
	[7] = {nLevel = 94, tbitem = {2,1,504,4, "N÷ Oa Tinh Th¹ch"}, nBit = 15, name= "500 Cæ Linh Th¹ch , 1000 Cæ Linh Ngäc", nSlot  = 7, nWeight  = 100},
	[8] = {nLevel = 96, tbitem = {2,1,504,9, "N÷ Oa Tinh Th¹ch"}, nBit = 16, name= "1200 Cæ Linh Th¹ch , 2000 Cæ Linh Ngäc", nSlot  = 7, nWeight  = 100},
}

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
tb7KimXaHoanLang = {
	item = {
		{gdp={0,152,35,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="TÊt ¶nh Phi Phong"},
		{gdp={0,153,35,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="TÊt ¶nh Ch­¬ng"},
		{gdp={0,154,35,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="TÊt ¶nh Ngoa"},
	}
}
tb7KimXaDangGiao = {
	item = {
		{gdp={0,152,36,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="NhuÖ Nha Phi Phong"},
		{gdp={0,153,36,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="NhuÖ Nha Ch­¬ng"},
		{gdp={0,154,36,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="NhuÖ Nha Ngoa"},
	}
}
tb7KimXaKhoiPhuong = {
	item = {
		{gdp={0,152,37,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Méng S¸t Phi Phong"},
		{gdp={0,153,37,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Méng S¸t Ch­¬ng"},
		{gdp={0,154,37,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Méng S¸t Ngoa"},
	}
}
--*********
tbKimXaHoanLang = {
	item = {
		{gdp={0,152,32,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="HiÖp Cèt Phi Phong"},
		{gdp={0,153,32,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="HiÖp Cèt Ch­¬ng"},
		{gdp={0,154,32,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="HiÖp Cèt Ngoa"},
	}
}
tbKimXaDangGiao = {
	item = {
		{gdp={0,152,33,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Quû Phï Phi Phong"},
		{gdp={0,153,33,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Quû Phï Ch­¬ng"},
		{gdp={0,154,33,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Quû Phï Ngoa"},
	}
}
tbKimXaKhoiPhuong = {
	item = {
		{gdp={0,152,34,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="§»ng V©n Phi Phong"},
		{gdp={0,153,34,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="§»ng V©n Ch­¬ng"},
		{gdp={0,154,34,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="§»ng V©n Ngoa"},
	}
}
tbKimXaVanDu = {
	item = {
		{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="Huy Ch­¬ng V©n Du"},
		{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="¸o Choµng V©n Du"},
		{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="§¹o Hµi V©n Du"},
	}
}
	
tbKimXaThietHuyet = {
	item = {
		{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="Huy Ch­¬ng ThiÕt HuyÕt"},
		{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="¸o Choµng ThiÕt HuyÕt"},
		{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="§¹o Hµi ThiÕt HuyÕt"},
	}
}
	
tbKimXaDuHiep = {
	item = {
		{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="Huy Ch­¬ng Du HiÖp"},
		{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="¸o Choµng Du HiÖp"},
		{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="§¹o Hµi Du HiÖp"},
	}
}
tbKimXaVanDu7 = {
	item = {
		{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Huy Ch­¬ng V©n Du"},
		{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="¸o Choµng V©n Du"},
		{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="§¹o Hµi V©n Du"},
	}
}
	
tbKimXaThietHuyet7 = {
	item = {
		{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Huy Ch­¬ng ThiÕt HuyÕt"},
		{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="¸o Choµng ThiÕt HuyÕt"},
		{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="§¹o Hµi ThiÕt HuyÕt"},
	}
}
	
tbKimXaDuHiep7 = {
	item = {
		{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Huy Ch­¬ng Du HiÖp"},
		{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="¸o Choµng Du HiÖp"},
		{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="§¹o Hµi Du HiÖp"},
	}
}		

tbTrangBiKimXa_TuongQuan = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
				[2] = {item={{gdp={0,153,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
				[3] = {item={{gdp={0,153,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
				[4] = {item={{gdp={0,153,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Tèng T­íng Qu©n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
				[2] = {item={{gdp={0,152,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
				[3] = {item={{gdp={0,152,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
				[4] = {item={{gdp={0,152,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Tèng T­íng Qu©n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
				[2] = {item={{gdp={0,154,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
				[3] = {item={{gdp={0,154,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
				[4] = {item={{gdp={0,154,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Tèng T­íng Qu©n"}}},
			}
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
				[2] = {item={{gdp={0,153,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
				[3] = {item={{gdp={0,153,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
				[4] = {item={{gdp={0,153,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch­¬ng Liªu T­íng Qu©n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
				[2] = {item={{gdp={0,152,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
				[3] = {item={{gdp={0,152,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
				[4] = {item={{gdp={0,152,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o choµng Liªu T­íng Qu©n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
				[2] = {item={{gdp={0,154,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
				[3] = {item={{gdp={0,154,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
				[4] = {item={{gdp={0,154,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn hµi Liªu T­íng Qu©n"}}},
			}
	},
}
tb_translife_cloth_PS_DuaTop = {
										[1] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}	
-- Check ®iÒu kiÖn nhËn th­ëng theo Level
function TopCheckLevel()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nAwardLevel = 0;
	local nLevel = GetLevel() + nChuyenSinh*100;
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nTaskVal = gf_GetTaskByte(TSK_TOP_LEVEL,1)
	for i = 396, 76, -1 do
		if type(tb_topserver_award_limit[i])=="table" and nLevel >= i and nRep >= tb_topserver_award_limit[i][1] and nFaction >= tb_topserver_award_limit[i][2] and nHor >= tb_topserver_award_limit[i][3] and nTaskVal >=  tb_topserver_award_limit[i][4] then
			nAwardLevel = i;
			break;
		end
	end
	return nAwardLevel;
end

-- Check level skill trÊn ph¸i
function TopCheckSkill(tb_Skill_ID, nSkillLevel)
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end

tb_Faction_Name = {	
	[1] = {"shaolin","ThiÕu L©m"},
	[2] = {"wudang","Vâ §ang"},
	[3] = {"emei","Nga My"},
	[4] = {"gaibang","C¸i Bang"},
	[5] = {"tangmen","§­êng M«n"},
	[6] = {"yangmen","D­¬ng M«n"},
	[7] = {"wudu","Ngò §éc"},
}

tb_Route_Name = {	
	[1] = "",
	[2] = "ThiÕu L©m Tôc Gia",
	[3] = "ThiÕu L©m ThiÒn T«ng",
	[4] = "ThiÕu L©m Vâ T«ng",
	[5] = "",
	[6] = "§­êng M«n Ch©m",
	[7] = "",
	[8] = "Nga My PhËt Gia",
	[9] = "Nga My Tôc Gia",
	[10] = "",
	[11] = "C¸i Bang TÜnh Y",
	[12] = "C¸i Bang ¤ Y",
	[13] = "",
	[14] = "Vâ §ang §¹o Gia",
	[15] = "Vâ §ang Tôc Gia",
	[16] = "",
	[17] = "D­¬ng M«n Th­¬ng Kþ",
	[18] = "D­¬ng M«n Cung Kþ",
	[19] = "",
	[20] = "Ngò §éc Tµ HiÖp",
	[21] = "Ngò §éc Cæ S­",
	[22] = "",
	[23] = "C«n L«n Thiªn S­",
	[24] = "",
	[25] = "Minh Gi¸o Th¸nh ChiÕn",
	[26] = "Minh Gi¸o TrËn Binh",
	[27] = "Minh Gi¸o HuyÕt Nh©n",
	[28] = "",
	[29] = "Thóy Yªn Vò Tiªn",
	[30] = "Thóy Yªn Linh N÷",
	[31] = "§­êng M«n NhËm HiÖp",
	[32] = "C«n L«n KiÕm T«n",
	
	
}

tb_Nation_Name = {	
	[1] = "Tèng",
	[2] = "Liªu",
}

-- Check Max Skill 55
function CheckMaxSkill55()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end;


-- NhËn th­ëng Viªm §Õ
function GiveAwardVD(nLv)
	local VD =
	{
		{0,103,8000,"Viªm §Õ Kh«i"},
		{0,100,8000,"Viªm §Õ Gi¸p"},
		{0,101,8000,"Viªm §Õ Trang"},
	}
	local nBody = GetBody()
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Nhan Thuong Server moi","nhËn")
	end
end

-- Nh©n th­ëng Nguyªn So¸i theo kiÓu h×nh
function GiveAwardNguyenSoai(nLv)
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbNguyenSoaiTong) do
			local nItemLevel = nLv
			if tbNguyenSoaiTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiTong[i][1],tbNguyenSoaiTong[i][2],tbNguyenSoaiTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiTong[i][4],"Nhan Thuong Server moi","nhËn")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbNguyenSoaiLieu) do
			local nItemLevel = nLv
			if tbNguyenSoaiLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiLieu[i][1],tbNguyenSoaiLieu[i][2],tbNguyenSoaiLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiLieu[i][4],"Nhan Thuong Server moi","nhËn")
		end
	end
end

-- Nh©n th­ëng Thiªn Chi T­íng Qu©n  theo kiÓu h×nh
function GiveAwardTCTQ(nLv)
	local tbTCTQTong = {
		{0,100,3015,"Tèng T­íng Qu©n ChiÕn Bµo"},
		{0,101,3015,"Tèng T­íng Qu©n ChiÕn Bµo"},
		{0,103,3015,"Tèng T­íng Qu©n ChiÕn Bµo"},
		{0,102,3031,"Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
		{0,102,3035,"Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
		{0,102,3039,"Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
	}
	local tbTCTQLieu = {
		{0,100,3019,"Liªu T­íng Qu©n ChiÕn Bµo"},
		{0,101,3019,"Liªu T­íng Qu©n ChiÕn Bµo"},
		{0,103,3019,"Liªu T­íng Qu©n ChiÕn Bµo"},
		{0,102,3043,"Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
		{0,102,3047,"Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
		{0,102,3051,"Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
	}
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbTCTQTong) do
			local nItemLevel = nLv
			if tbTCTQTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQTong[i][1],tbTCTQTong[i][2],tbTCTQTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQTong[i][4],"Nhan Thuong Server moi","nhËn")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbTCTQLieu) do
			local nItemLevel = nLv
			if tbTCTQLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQLieu[i][1],tbTCTQLieu[i][2],tbTCTQLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQLieu[i][4],"Nhan Thuong Server moi","nhËn")
		end
	end
end


-- Nh©n th­ëng Thiªn Chi Tµng KiÕm theo kiÓu h×nh
function GiveAwardTCTK(nAwardOrder)
	local tbBodyRatio = {1, 4, 7, 10}
	local tbTCTK = {
		[4] = {0,103,30000,"Thiªn Chi Tµng KiÕm Tö Kim M·o"},
		[5] = {0,100,30000,"Thiªn Chi Tµng KiÕm Kim Lò Th­êng"},
		[6] = {0,101,30000,"Thiªn Chi Tµng KiÕm ¤ Kim Phôc"},
		[7] = {0,102,30000,"Thiªn Chi Tµng KiÕm B¶o Ch©u"},
		[8] = {0,102,30001,"Thiªn Chi Tµng KiÕm Kú Th¹ch"},
		[9] = {0,102,30002,"Thiªn Chi Tµng KiÕm Kim Ên"},
	}
	local nBody = GetBody()
	if tbTCTK[nAwardOrder][2] ~= 102 then
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+nBody, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	else
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+tbBodyRatio[nBody], 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	end
end


function NhanVKTuVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbTuVienVuKhi[2][1][2], tbTuVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	else
		gf_AddItemEx2(tbTuVienVuKhi[2][2][2], tbTuVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	end
end

function NhanVKHienVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbHienVienVuKhi[2][1][2], tbHienVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	else
		gf_AddItemEx2(tbHienVienVuKhi[2][2][2], tbHienVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
	end
end

function TraoThienChiViemDe(nItemLevel)
	local tbTCVD_Body1 = {
			item = {
				{gdp = {0,103,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTCVD_Body2 = {
			item = {
				{gdp = {0,103,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTCVD_Body3 = {
			item = {
				{gdp = {0,103,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTCVD_Body4 = {
			item = {
				{gdp = {0,103,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Kh«i"},
				{gdp = {0,100,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Gi¸p"},
				{gdp = {0,101,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbAwardSet = {
		[1] = tbTCVD_Body1,
		[2] = tbTCVD_Body2,
		[3] = tbTCVD_Body3,
		[4] = tbTCVD_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByBody(tbAwardSet)
end


function TraoThienChiTuongQuan(nItemLevel)
	local tbTongTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3040,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3037,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3041,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Viªm §Õ Trang"},
			}}
	local tbTongTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3038,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3042,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3039,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3043,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Tèng T­íng Qu©n LÖnh Phï"},
			}}
	
	local tbLieuTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3048,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3045,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3049,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3046,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3050,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,3047,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,3051,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,3055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn Chi Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTCTQ_Body1,
		[2] = tbTongTCTQ_Body2,
		[3] = tbTongTCTQ_Body3,
		[4] = tbTongTCTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTCTQ_Body1,
		[2] = tbLieuTCTQ_Body2,
		[3] = tbLieuTCTQ_Body3,
		[4] = tbLieuTCTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoBachKimViemDe(nItemLevel)
	local tbBachKimViemDe_Body1 = {
			item = {
				{gdp = {0,103,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbBachKimViemDe_Body2 = {
			item = {
				{gdp = {0,103,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbBachKimViemDe_Body3 = {
			item = {
				{gdp = {0,103,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbBachKimViemDe_Body4 = {
			item = {
				{gdp = {0,103,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Kh«i"},
				{gdp = {0,100,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Gi¸p"},
				{gdp = {0,101,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B¹ch Kim Viªm §Õ Trang"},
			}}
	local tbAwardSet = {
		[1] = tbBachKimViemDe_Body1,
		[2] = tbBachKimViemDe_Body2,
		[3] = tbBachKimViemDe_Body3,
		[4] = tbBachKimViemDe_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByBody(tbAwardSet)
end

function TraoNguyenSoai(nItemLevel)
	local tbTongNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2301,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2305,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2501,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2505,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}
	local tbTongNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2302,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2306,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2502,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2506,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}
	local tbTongNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2303,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2307,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2503,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2507,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}
	local tbTongNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2304,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2308,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2504,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Phï"},
				{gdp = {0,102,2508,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng So¸i Kú"},
			}}		
	
	local tbLieuNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2311,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2315,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2511,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2515,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
	local tbLieuNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2312,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2316,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2512,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2516,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
	local tbLieuNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2313,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2317,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2513,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2517,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
	local tbLieuNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu  Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,100,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,101,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Nguyªn So¸i ChiÕn Bµo"},
				{gdp = {0,102,2314,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i Hæ Phï"},
				{gdp = {0,102,2318,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Nguyªn So¸i LÖnh Kú"},
				{gdp = {0,102,2514,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Phï"},
				{gdp = {0,102,2518,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu So¸i Kú"},
			}}
					
	local tbTongAwardSet = {
		[1] = tbTongNguyenSoai_Body1,
		[2] = tbTongNguyenSoai_Body2,
		[3] = tbTongNguyenSoai_Body3,
		[4] = tbTongNguyenSoai_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNguyenSoai_Body1,
		[2] = tbLieuNguyenSoai_Body2,
		[3] = tbLieuNguyenSoai_Body3,
		[4] = tbLieuNguyenSoai_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngNguyenSoai(nItemLevel)
	local tbTongTUNS_Body1 = {
			item = {
				{gdp = {0,103,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongTUNS_Body2 = {
			item = {
				{gdp = {0,103,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongTUNS_Body3 = {
			item = {
				{gdp = {0,103,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongTUNS_Body4 = {
			item = {
				{gdp = {0,103,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Th­¬ng ¦ng So¸i Kú"},
			}}
			
	local tbLieuTUNS_Body1 = {
			item = {
				{gdp = {0,103,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30112,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbLieuTUNS_Body2 = {
			item = {
				{gdp = {0,103,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30113,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbLieuTUNS_Body3 = {
			item = {
				{gdp = {0,103,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30114,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbLieuTUNS_Body4 = {
			item = {
				{gdp = {0,103,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Kh«i"},
				{gdp = {0,100,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Gi¸p"},
				{gdp = {0,101,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Th­¬ng ¦ng So¸i Trang"},
				{gdp = {0,102,30103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Hæ"},
				{gdp = {0,102,30107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i LÖnh"},
				{gdp = {0,102,30111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Phï"},
				{gdp = {0,102,30115,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Th­¬ng ¦ng So¸i Kú"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTUNS_Body1,
		[2] = tbTongTUNS_Body2,
		[3] = tbTongTUNS_Body3,
		[4] = tbTongTUNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUNS_Body1,
		[2] = tbLieuTUNS_Body2,
		[3] = tbLieuTUNS_Body3,
		[4] = tbLieuTUNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngTuongQuan(nItemLevel)
	local tbTongTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30056,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30060,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30057,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30061,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30058,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30062,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30059,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30063,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Tèng T­íng Qu©n LÖnh Phï"},
			}}	
			
	local tbLieuTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Kh«i"},
				{gdp = {0,100,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Gi¸p"},
				{gdp = {0,101,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n ChiÕn Trang"},
				{gdp = {0,102,30091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th­¬ng ¦ng Liªu T­íng Qu©n LÖnh Phï"},
			}}		
	local tbTongAwardSet = {
		[1] = tbTongTUTQ_Body1,
		[2] = tbTongTUTQ_Body2,
		[3] = tbTongTUTQ_Body3,
		[4] = tbTongTUTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUTQ_Body1,
		[2] = tbLieuTUTQ_Body2,
		[3] = tbLieuTUTQ_Body3,
		[4] = tbLieuTUTQ_Body4,
	}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngDoThong(nGenre)
	local szItemName = "Th­¬ng ¦ng §« Thèng "
	local nID = 30028
	local szPhe = "Tèng "
	if GetTask(701) < 0 then
		nID = 30040
		szPhe = "Liªu "
	end
	if nGenre == 100 then
		szItemName = szPhe .. szItemName .. "Gi¸p"
	elseif nGenre == 101 then
		szItemName = szPhe .. szItemName .. "Trang"
	elseif nGenre == 103 then
		szItemName = szPhe .. szItemName .. "Kh«i"
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
end


function TraoThuongUngTienPhong(nType)
	local szItemName = "Th­¬ng ¦ng Tiªn Phong "
	local nID = 30043
	local szPhe = "Tèng "
	if GetTask(701) < 0 then
		nID = 30079
		szPhe = "Liªu "
	end
	
	if nType == 1 then
		szItemName = szPhe .. szItemName .. "Kú"
	else
		szItemName = szPhe .. szItemName .. "Phï"
		nID = nID + 4
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,102,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
end


function TraoNguLongTuongQuan_TrangBi(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Tèng Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Kh«i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Gi¸p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Liªu Ngù Long T­íng Qu©n Trang"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan_TrangSuc()
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Tèng Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Bµi"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Kú"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Liªu Ngù Long T­íng Qu©n LÖnh Phï"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoMatTich70CaoCap(nQty)
	local tbMatTich = {
		[2] =  {item={{gdp={0, 107, 204,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Kim Cang B¸t Nh· Ch©n QuyÓn"}}}, 
		[3] =  {item={{gdp={0, 107, 206,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="V« TrÇn Bå §Ò Ch©n QuyÓn"}}},
		[4] =  {item={{gdp={0, 107, 205,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="TiÒm Long Tóc DiÖt Ch©n QuyÓn"}}},
		[6] =  {item={{gdp={0, 107, 207,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn La Liªn Ch©u Ch©n QuyÓn"}}},
		[8] =  {item={{gdp={0, 107, 208,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Nh­ ý Kim §Ønh Ch©n QuyÓn"}}},
		[9] =  {item={{gdp={0, 107, 209,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"}}},
		[14] =  {item={{gdp={0, 107, 212,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"}}},
		[15] =  {item={{gdp={0, 107, 213,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu©n Tö §íi Phong Ch©n QuyÓn"}}},		
		[11] =  {item={{gdp={0, 107, 210,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hçn §én TrÊn Nh¹c Ch©n QuyÓn"}}},
		[12] =  {item={{gdp={0, 107, 211,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Quú Thiªn Du Long Ch©n QuyÓn"}}},		
		[17] =  {item={{gdp={0, 107, 214,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"}}},
		[18] =  {item={{gdp={0, 107, 215,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Xuyªn V©n L¹c Hång Ch©n QuyÓn"}}},
		[20] =  {item={{gdp={0, 107, 216,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="HuyÒn Minh Phong Ma Ch©n QuyÓn"}}},
		[21] =  {item={{gdp={0, 107, 217,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Linh Cæ HuyÒn Tµ Ch©n QuyÓn"}}},
		[23] =  {item={{gdp={0, 107, 218,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Cöu Thiªn Phong L«i Ch©n QuyÓn"}}},
		[29] =  {item={{gdp={0, 107, 222,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[30] =  {item={{gdp={0, 107, 223,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},
		[31] =  {item={{gdp={0, 107, 231,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hång TrÇn Tóy Méng Ch©n QuyÓn"}}},
		[32] =  {item={{gdp={0, 107, 235,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Phong Hoa Thiªn DiÖp Ch©n QuyÓn"}}},	
	}
	
	local tbMatTich_GN = {
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
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		[31] = {0,107,231,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[32] = {0,107,235,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	
	local nRoute = GetPlayerRoute()
	for i = 1, nQty do 
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich_GN[nRoute][1], tbMatTich_GN[nRoute][2], tbMatTich_GN[nRoute][3], 1)
		if tbMatTich_GN[nRoute][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
	
	gf_WriteLogEx("Nhan Thuong Dua Top"..szLOGSERVERNAME, "nhËn", nQty, "MËt tÞch siªu cÊp")
	Msg2Player("B¹n nhËn ®­îc "..nQty.." mËt tÞch siªu cÊp")

end


function ThuongVuKhi_ThuyYenLinhNu()
	local nOpLevel1, nOpID1 = IDOption_Random()
	local nOpLevel2, nOpID2 = IDOption_Random()
	if nOpID1 == nOpID2 then
		local tbRate = {[1]={[1] = 6, nRate=80}, [2]={[1] = 7, nRate=20},}
		nOpID2 = 50
		nOpLevel2 = LIB_Award:GetValueByRate(tbRate)
	end

	local tbAward = {item={{gdp={0,12,12,1,1,3,252,nOpLevel1,nOpID1,nOpLevel2,nOpID2,-1, 0}, name = "Minh B¨ng"}}}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward)
end

			
function IDOption_Random()
	local tbOptionIDList = {
		[1] = {[1] = {49, {
						[1] = {[1] = 6, nRate=50}, 
						[2] = {[1] = 7, nRate=50},
				}}, nRate = 10.12},
		
		[2] = {[1] = {268, {
					[1]={[1] = 3, nRate=60}, 
					[2]={[1] = 4, nRate=34},
					[3]={[1] = 5, nRate=5},
					[4]={[1] = 6, nRate=1},
				}}, nRate = 1.62},
		[3] = {[1] = {53, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[4] = {[1] = {54, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[5] = {[1] = {63, {
					[1]={[1] = 5, nRate=50}, 
					[2]={[1] = 6, nRate=50},
				}}, nRate = 10.12},
		[6] = {[1] = {390, {
					[1]={[1] = 2, nRate=70}, 
					[2]={[1] = 3, nRate=25},
					[3]={[1] = 4,nRate=5},
				}}, nRate = 1.11},
		[7] = {[1] = {85, {
					[1]={[1] = 4, nRate=60}, 
					[2]={[1] = 5, nRate=30},
					[3]={[1] = 6,nRate=10},
				}}, nRate = 4.11},
		[8] = {[1] = {94, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},	
		[9] = {[1] = {96, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[10] = {[1] = {97, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[11] = {[1] = {95, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[12] = {[1] = {102, {
					[1]={[1] = 6, nRate=80}, 
					[2]={[1] = 7, nRate=20},
				}}, nRate = 8.11},
		[13] = {[1] = {111, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 8.11},
	}
	local tbOptionTemp = LIB_Award:GetValueByRate(tbOptionIDList)
	local nOptionID = tbOptionTemp[1]
	local nOptionLevel = LIB_Award:GetValueByRate(tbOptionTemp[2])
	return nOptionLevel, nOptionID
end


function NhanRuongYeuQuyet(nThoihan)
	local tbRuongYeuQuyet = {
		[2] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m", nExpired = nThoihan}}},
		[4] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m", nExpired = nThoihan}}},
		[3] = {item={{gdp={2,0,607,1}, name="Tói bÝ kiÕp ThiÕu L©m", nExpired = nThoihan}}},
		[6] = {item={{gdp={2,0,608,1}, name="Tói bÝ kiÕp §­êng M«n", nExpired = nThoihan}}},
		[8] = {item={{gdp={2,0,609,1}, name="Tói bÝ kiÕp Nga My", nExpired = nThoihan}}},
		[9] = {item={{gdp={2,0,609,1}, name="Tói bÝ kiÕp Nga My", nExpired = nThoihan}}},
		[11] = {item={{gdp={2,0,610,1}, name="Tói bÝ kiÕp C¸i Bang", nExpired = nThoihan}}},
		[12] = {item={{gdp={2,0,610,1}, name="Tói bÝ kiÕp C¸i Bang", nExpired = nThoihan}}},
		[14] = {item={{gdp={2,0,611,1}, name="Tói bÝ kiÕp Vâ §ang", nExpired = nThoihan}}},
		[15] = {item={{gdp={2,0,611,1}, name="Tói bÝ kiÕp Vâ §ang", nExpired = nThoihan}}},
		[17] = {item={{gdp={2,0,612,1}, name="Tói bÝ kiÕp D­¬ng M«n", nExpired = nThoihan}}},
		[18] = {item={{gdp={2,0,612,1}, name="Tói bÝ kiÕp D­¬ng M«n", nExpired = nThoihan}}},
		[20] = {item={{gdp={2,0,613,1}, name="Tói bÝ kiÕp Ngò §éc", nExpired = nThoihan}}},
		[21] = {item={{gdp={2,0,613,1}, name="Tói bÝ kiÕp Ngò §éc", nExpired = nThoihan}}},
		[23] = {fn="NhanBiKipConLon()"},
		[29] = {fn="NhanBiKipThuyYen()"},
		[30] = {fn="NhanBiKipThuyYen()"},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
--	for i=1,5 do
		LIB_Award:AwardByRoute(tbRuongYeuQuyet)
--	end
end


function NhanBiKipConLon()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	local tbBiKipConLon = {
		[1] = { [1] = { item = { { gdp = { 2, 6, 169, 1 }, name = "BÝ kiÕp L«i TÕ" } } }, nRate = 7.15 },
		[2] = { [1] = { item = { { gdp = { 2, 6, 170, 1 }, name = "BÝ kiÕp Phong TÕ" } } }, nRate = 7.15 },
		[3] = { [1] = { item = { { gdp = { 2, 6, 171, 1 }, name = "BÝ kiÕp Thiªn l«i phï" } } }, nRate = 7.15 },
		[4] = { [1] = { item = { { gdp = { 2, 6, 172, 1 }, name = "BÝ kiÕp B¨ng Phong QuyÕt" } } }, nRate = 7.15 },
		[5] = { [1] = { item = { { gdp = { 2, 6, 173, 1 }, name = "BÝ kiÕp Ngù Phong QuyÕt" } } }, nRate = 7.14 },
		[6] = { [1] = { item = { { gdp = { 2, 6, 174, 1 }, name = "BÝ KiÕp Cuång L«i Phï" } } }, nRate = 7.14 },
		[7] = { [1] = { item = { { gdp = { 2, 6, 175, 1 }, name = "BÝ KiÕp D­¬ng Sa QuyÕt" } } }, nRate = 7.14 },
		[8] = { [1] = { item = { { gdp = { 2, 6, 176, 1 }, name = "BÝ KiÕp Oanh L«i Phï" } } }, nRate = 7.14 },
		[9] = { [1] = { item = { { gdp = { 2, 6, 177, 1 }, name = "BÝ KiÕp Canh Phong QuyÕt" } } }, nRate = 7.14 },
		[10] = { [1] = { item = { { gdp = { 2, 6, 178, 1 }, name = "BÝ KiÕp B¹o L«i Phï" } } }, nRate = 7.14 },
		[11] = { [1] = { item = { { gdp = { 2, 6, 179, 1 }, name = "BÝ KiÕp Tiªu phong t¸n quyÕt" } } }, nRate = 7.14 },
		[12] = { [1] = { item = { { gdp = { 2, 6, 180, 1 }, name = "BÝ KiÕp Ngò L«i chÝnh ph¸p phï" } } }, nRate = 7.14 },
		[13] = { [1] = { item = { { gdp = { 2, 6, 181, 1 }, name = "BÝ KiÕp V¹n L«i To¸i Tinh phï" } } }, nRate = 7.14 },
		[14] = { [1] = { item = { { gdp = { 2, 6, 182, 1 }, name = "BÝ KiÕp HuyÒn Phong triÒn quyÕt" } } }, nRate = 7.14 },
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipConLon)
	end
end


function NhanBiKipThuyYen()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0
	end
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "YÕu quyÕt Khëi Vò"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "YÕu quyÕt Linh Miªu VËn"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "YÕu quyÕt Vò V©n T©m Ph¸p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "YÕu quyÕt MÞ Hoa"}}}, nRate = 4.55},
		[5] = {[1] = {item={{gdp={2,6,223,1}, name = "YÕu quyÕt §o¹n V©n"}}}, nRate = 4.55},
		[6] = {[1] = {item={{gdp={2,6,224,1}, name = "YÕu quyÕt Thu NguyÖt Vò"}}}, nRate = 4.55},
		[7] = {[1] = {item={{gdp={2,6,225,1}, name = "YÕu quyÕt Thiªn L¹i T©m Kinh"}}}, nRate = 4.54},
		[8] = {[1] = {item={{gdp={2,6,226,1}, name = "YÕu quyÕt §iÖp Uyªn"}}}, nRate = 4.54},
		[9] = {[1] = {item={{gdp={2,6,227,1}, name = "YÕu quyÕt Thiªn Háa DiÖm D­¬ng"}}}, nRate = 4.54},
		[10] = {[1] = {item={{gdp={2,6,228,1}, name = "§¹p V©n X¶o Bé QuyÕt YÕu"}}}, nRate = 4.54},
		[11] = {[1] = {item={{gdp={2,6,229,1}, name = "YÕu quyÕt Méng Xµ"}}}, nRate = 4.54},
		[12] = {[1] = {item={{gdp={2,6,230,1}, name = "YÕu quyÕt L¹c Hoa QuyÕt"}}}, nRate = 4.55},
		[13] = {[1] = {item={{gdp={2,6,231,1}, name = "YÕu quyÕt §µo Hoa Ch­¬ng"}}}, nRate = 4.55},
		[14] = {[1] = {item={{gdp={2,6,232,1}, name = "YÕu quyÕt B¸ch Hoa T©m Kinh"}}}, nRate = 4.55},
		[15] = {[1] = {item={{gdp={2,6,233,1}, name = "YÕu quyÕt Táa T©m QuyÕt"}}}, nRate = 4.55},
		[16] = {[1] = {item={{gdp={2,6,234,1}, name = "YÕu quyÕt Hoµn ThÇn ThuËt"}}}, nRate = 4.55},
		[17] = {[1] = {item={{gdp={2,6,235,1}, name = "YÕu quyÕt Linh §éng QuyÕt"}}}, nRate = 4.55},
		[18] = {[1] = {item={{gdp={2,6,236,1}, name = "YÕu quyÕt Mª X¶o QuyÕt"}}}, nRate = 4.54},
		[19] = {[1] = {item={{gdp={2,6,237,1}, name = "YÕu quyÕt Tiªn L­ H­¬ng"}}}, nRate = 4.54},
		[20] = {[1] = {item={{gdp={2,6,238,1}, name = "YÕu quyÕt B¸ch §iÖp Nghªnh H­¬ng QuyÕt"}}}, nRate = 4.54},
		[21] = {[1] = {item={{gdp={2,6,239,1}, name = "YÕu quyÕt §iÖp LuyÕn Hoa"}}}, nRate = 4.54},
		[22] = {[1] = {item={{gdp={2,6,240,1}, name = "YÕu quyÕt Ngäc Long Xuyªn NguyÖt"}}}, nRate = 4.54},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipThuyYen)
	end
end


function TraoMatTichCaoCap20(nQty,nRoute)

	local tbMatTich = {
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
		[25] = {0,107,219,2,"Håi Phong Tr¶m NhËt Ch©n QuyÓn"},
		[26] = {0,107,220,2,"Phô Kú Hµnh TrËn Ch©n QuyÓn"},
		[27] = {0,107,221,1,"Ng­ng HuyÕt Phong Hån Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		[31] = {0,107,231,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[32] = {0,107,235,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		if tbMatTich[nIndex][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
end
function TraoMatTichCaoCap20_loaithuong(nQty,nRoute)

	local tbMatTich = {
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
		[25] = {0,107,219,2,"Håi Phong Tr¶m NhËt Ch©n QuyÓn"},
		[26] = {0,107,220,2,"Phô Kú Hµnh TrËn Ch©n QuyÓn"},
		[27] = {0,107,221,1,"Ng­ng HuyÕt Phong Hån Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		[31] = {0,107,231,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[32] = {0,107,235,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
--		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		gf_AddItemEx2({tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1},"mËt tÞch","DUA TOP","nhËn mËt tÞch")
	end
end


function TraoTrangBiKimXaNguyenSoai()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
end

function TraoTrangBiKimXaTuongQuan()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][3][nBody])
end

function TraoTrangBiChienCuong()
	local nBody = GetBody()

	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[103][nBody])
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[100][nBody])
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[101][nBody])
	LIB_Award:AwardByRoute(tbVuKhiChienCuong[nBody])
end


function TraoLoiHoNguyenSoai(nItemLevel)
	local tbTongLHNS_Body1 = {
			item = {
				{gdp = {0,103,30219,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30219,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30219,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30169,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30173,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30177,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30181,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body2 = {
			item = {
				{gdp = {0,103,30220,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30220,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30220,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30170,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30174,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30178,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30182,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body3 = {
			item = {
				{gdp = {0,103,30221,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30221,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30221,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30171,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30175,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30179,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30183,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body4 = {
			item = {
				{gdp = {0,103,30222,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30222,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30222,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30172,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30176,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30180,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30184,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
			
	local tbLieuLHNS_Body1 = {
			item = {
				{gdp = {0,103,30231,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30231,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30231,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30205,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30213,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30217,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body2 = {
			item = {
				{gdp = {0,103,30232,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30232,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30232,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30206,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30214,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30218,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body3 = {
			item = {
				{gdp = {0,103,30233,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30233,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30233,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30211,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30215,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30219,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body4 = {
			item = {
				{gdp = {0,103,30234,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30234,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30234,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30212,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30216,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30220,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHNS_Body1,
		[2] = tbTongLHNS_Body2,
		[3] = tbTongLHNS_Body3,
		[4] = tbTongLHNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHNS_Body1,
		[2] = tbLieuLHNS_Body2,
		[3] = tbLieuLHNS_Body3,
		[4] = tbLieuLHNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoLoiHoTuongQuan(nItemLevel)
	local tbTongLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30215,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30215,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30215,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30157,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30161,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30165,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30216,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30216,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30216,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30158,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30162,1,4,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30166,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				
			}}
	local tbTongLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30217,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30217,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30217,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30159,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30163,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30167,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbTongLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30218,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30218,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30218,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30160,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30164,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30168,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
			
	local tbLieuLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30227,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30227,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30227,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30193,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30197,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30201,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30228,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30228,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30228,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30194,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30198,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30202,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30229,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30229,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30229,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30195,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30199,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30203,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbLieuLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30230,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30230,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30230,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30196,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30200,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30204,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHTQ_Body1,
		[2] = tbTongLHTQ_Body2,
		[3] = tbTongLHTQ_Body3,
		[4] = tbTongLHTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHTQ_Body1,
		[2] = tbLieuLHTQ_Body2,
		[3] = tbLieuLHTQ_Body3,
		[4] = tbLieuLHTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end

function AddTrangBiHoaPhungTuongQuan(nLevel,bIsHaveWeapon)

local VET_HOAPHUNG_CLOTH = {
	[2] = {
	    [1] = {{0, 100, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 100, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 100, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 100, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 100, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 100, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 100, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 100, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 100, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 100, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 100, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 100, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 100, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 100, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 100, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 100, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 100, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 100, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 100, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 100, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 100, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 100, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 100, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 100, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 100, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 100, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 100, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 100, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 100, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 100, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 100, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 100, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 100, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 100, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 100, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 100, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 100, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 100, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 100, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 100, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 100, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 100, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 100, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 100, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 100, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 100, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 100, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 100, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 100, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 100, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 100, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 100, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 100, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 100, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 100, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 100, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 100, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 100, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 100, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 100, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 100, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 100, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 100, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 100, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[3] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[32] = {
		[1] = {{0, 100, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[2] = {{0, 100, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
}

local VET_HOAPHUNG_CAP = {
	[2] = {
	    [1] = {{0, 103, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 103, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 103, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 103, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 103, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 103, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 103, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 103, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 103, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 103, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 103, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 103, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 103, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 103, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 103, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 103, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 103, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 103, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 103, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 103, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 103, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 103, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 103, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 103, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 103, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 103, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 103, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 103, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 103, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 103, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 103, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 103, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 103, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 103, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 103, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 103, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 103, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 103, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 103, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 103, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 103, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 103, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 103, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 103, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 103, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 103, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 103, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 103, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 103, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 103, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 103, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 103, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 103, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 103, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 103, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 103, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 103, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 103, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 103, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 103, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 103, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 103, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 103, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 103, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[3] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[32] = {
		[1] = {{0, 103, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[2] = {{0, 103, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
}  

local VET_HOAPHUNG_SHOE = {
	[2] = {
	    [1] = {{0, 101, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 101, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 101, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 101, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 101, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 101, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 101, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 101, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 101, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 101, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 101, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 101, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 101, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 101, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 101, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 101, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 101, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 101, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 101, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 101, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 101, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 101, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 101, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 101, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 101, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 101, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 101, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 101, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 101, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 101, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 101, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 101, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 101, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 101, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 101, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 101, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 101, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 101, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 101, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 101, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 101, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 101, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 101, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 101, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 101, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 101, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 101, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 101, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[3] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[32] = {
		[1] = {{0, 101, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[2] = {{0, 101, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
}

local VET_HOAPHUNG_WEAPON = {
	[2] = {
	   [1] = {{0, 3, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 3, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 8, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 8, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 0, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 0, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 1, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 1, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 1, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 1, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 2, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 2, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 10, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 10, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 0, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 0, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 0, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 0, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 5, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 5, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 5, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 5, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 2, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 2, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 2, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 2, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 9, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 9, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 9, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 9, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 6, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 6, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30567, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 6, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30568, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 6, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30569, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 4, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 4, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 4, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 4, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 7, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 7, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 7, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 7, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 11, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 11, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 11, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 11, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 2, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 2, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 3, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 3, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 3, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 3, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 9, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 9, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 9, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 9, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 11, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 11, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 11, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 11, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 13, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 13, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 12, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 12, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
}

local VET_HOAPHUNG_PHU = {
	[2] = {
	    [1] = {{0, 102, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30804, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30805, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30806, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30807, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30808, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30809, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30810, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30811, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30812, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30813, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30814, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30815, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30816, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30817, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30818, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30819, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30820, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30821, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30822, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30823, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30824, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30825, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30826, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30827, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30828, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30829, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30830, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30831, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30832, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30833, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30834, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30835, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30836, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30837, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30838, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30839, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30840, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30841, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30842, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30843, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30844, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30845, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30846, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30847, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30848, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30849, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30850, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30851, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30852, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30853, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30854, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30855, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30856, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30857, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30858, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30859, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30860, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30861, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30862, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30863, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30864, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30865, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30866, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30867, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31516, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31530, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31516, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31530, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_KY = {
	[2] = {
	    [1] = {{0, 102, 30292, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30740, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30293, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30741, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30294, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30742, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30295, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30743, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30296, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30744, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30297, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30745, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30298, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30746, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30299, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30747, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30300, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30748, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30301, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30749, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30302, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30750, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30303, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30751, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30304, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30752, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30305, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30753, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30306, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30754, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30307, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30755, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30308, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30756, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30309, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30757, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30310, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30758, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30759, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30760, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30761, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30762, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30763, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30764, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30765, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30766, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30767, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30768, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30769, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30770, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30771, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30772, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30773, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30774, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30775, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30776, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30777, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30778, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30779, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30780, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30781, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30782, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30783, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30784, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30785, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30786, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30787, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30788, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30789, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30790, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30791, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30792, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30793, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30794, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30795, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30796, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30797, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30798, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30799, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30800, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30801, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30802, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30803, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31515, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31529, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31515, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31529, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_BAI = {
	[2] = {
	    [1] = {{0, 102, 30228, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30676, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30229, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30677, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30230, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30678, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30231, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30679, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30232, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30680, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30233, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30681, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30234, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30682, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30235, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30683, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30236, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30684, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30237, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30685, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30238, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30686, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30239, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30687, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30240, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30688, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30241, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30689, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30242, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30690, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30243, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30691, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30244, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30692, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30245, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30693, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30246, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30694, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30247, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30695, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30248, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30696, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30249, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30697, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30250, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30698, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30251, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30699, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30252, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30700, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30253, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30701, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30254, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30702, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30255, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30703, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30256, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30704, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30257, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30705, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30258, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30706, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30259, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30707, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30260, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30708, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30261, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30709, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30262, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30710, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30263, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30711, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30264, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30712, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30265, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30713, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30266, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30714, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30267, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30715, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30268, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30716, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30269, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30717, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30270, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30718, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30271, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30719, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30272, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30720, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30273, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30721, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30274, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30722, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30275, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30723, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30276, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30724, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30277, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30725, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30278, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30726, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30279, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30727, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30280, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30728, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30281, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30729, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30282, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30730, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30283, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30731, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30284, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30732, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30285, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30733, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30286, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30734, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30287, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30735, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30288, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30736, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30289, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30737, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30290, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30738, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30291, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30739, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31514, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31528, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31514, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31528, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nQuanHam = GetTask(704)

	if nQuanHam < 0 then

		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		--trang bÞ Liªu 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
--		end
	else

		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		--trang bÞ Tèng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
--		end
	end
end

function AddTrangBiHoaPhungNguyenSoai(nLevel,bIsHaveWeapon)
local VET_HOAPHUNG_CAP = {
	[2] = {
	    [1] = {{0, 103, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 103, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 103, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 103, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 103, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 103, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 103, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 103, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 103, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 103, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 103, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 103, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 103, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 103, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 103, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 103, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 103, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 103, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 103, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 103, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 103, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 103, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 103, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 103, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 103, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 103, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 103, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 103, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 103, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 103, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 103, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 103, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 103, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 103, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 103, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 103, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 103, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 103, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 103, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 103, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 103, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 103, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 103, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 103, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 103, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 103, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 103, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 103, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 103, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 103, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 103, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 103, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 103, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 103, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 103, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 103, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 103, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 103, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 103, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 103, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 103, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 103, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 103, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 103, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 103, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 103, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_CLOTH = {
	[2] = {
	   [1] = {{0, 100, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 100, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 100, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 100, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 100, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 100, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 100, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 100, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 100, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 100, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 100, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 100, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 100, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 100, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 100, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 100, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 100, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 100, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 100, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 100, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 100, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 100, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 100, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 100, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 100, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 100, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 100, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 100, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 100, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 100, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 100, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 100, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 100, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 100, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 100, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 100, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 100, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 100, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 100, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 100, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 100, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 100, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 100, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 100, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 100, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 100, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 100, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 100, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 100, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 100, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 100, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 100, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 100, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 100, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 100, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 100, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 100, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 100, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 100, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 100, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 100, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 100, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 100, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 100, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 100, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 100, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_SHOE = {
	[2] = {
	   [1] = {{0, 101, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 101, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 101, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 101, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 101, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 101, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 101, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 101, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 101, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 101, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 101, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 101, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 101, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 101, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 101, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 101, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 101, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 101, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 101, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 101, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 101, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 101, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 101, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 101, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 101, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 101, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 101, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 101, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 101, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 101, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 101, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 101, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 101, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 101, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 101, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 101, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 101, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 101, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 101, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 101, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 101, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 101, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 101, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 101, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 101, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 101, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 101, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 101, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 101, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 101, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_HIEUPHU = {
	[2] = {
	   [1] = {{0, 102, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30868, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30869, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30870, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30871, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30872, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30873, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30874, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30875, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30876, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30877, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30878, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30879, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30880, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30881, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30882, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30883, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30884, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30885, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30886, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30887, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30888, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30889, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30890, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30891, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30892, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30893, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30894, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30895, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30896, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30897, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30898, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30899, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30900, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30901, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30902, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30903, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30904, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30905, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30906, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30907, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30908, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30909, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30910, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30911, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30912, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30913, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30914, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30915, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30916, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30917, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30918, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30919, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30920, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30921, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30922, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30923, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30924, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30925, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30926, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30927, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30928, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30929, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30930, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30931, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31517, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31531, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31517, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31531, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_LENHKY = {
	[2] = {
	   [1] = {{0, 102, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30996, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30997, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30998, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30999, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31000, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31001, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31002, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31003, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31004, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31005, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31006, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31007, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31008, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31009, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31010, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31011, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31012, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31013, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31014, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30567, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31015, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30568, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31016, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30569, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31017, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31018, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31019, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31020, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31021, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31022, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31023, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31024, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31025, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31026, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31027, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31028, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31029, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31030, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31031, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31032, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31033, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31034, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31035, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31036, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31037, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31038, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31039, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31040, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31041, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31042, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31043, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31044, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31045, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31046, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31047, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31048, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31049, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31050, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31051, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31052, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31053, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31054, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31055, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31056, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31057, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31058, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31059, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31519, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31533, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31519, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31533, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_HIEUKY = {
	[2] = {
	   [1] = {{0, 102, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31060, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31061, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31062, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31063, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31064, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31065, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31066, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31067, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31068, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31069, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31070, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31071, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31072, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31073, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31074, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31075, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31076, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31077, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31078, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31079, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31080, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31081, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31082, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31083, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31084, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31085, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31086, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31087, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31088, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31089, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31090, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31091, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31092, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31093, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31094, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31095, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31096, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31097, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31098, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30651, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31099, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30652, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31100, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30653, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31101, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30654, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31102, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30655, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31103, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30656, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31104, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30657, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31105, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30658, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31106, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30659, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31107, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30660, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31108, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30661, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31109, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30662, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31110, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30663, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31111, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30664, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31112, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30665, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31113, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30666, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31114, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30667, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31115, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30668, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31116, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30669, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31117, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30670, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31118, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30671, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31119, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30672, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31120, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30673, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31121, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30674, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31122, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30675, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31123, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31520, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31534, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31520, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31534, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_HOPHU = {
	[2] = {
	   [1] = {{0, 102, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30932, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 102, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30933, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30934, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 102, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30935, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30936, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30937, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30938, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 102, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30939, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 102, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30940, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 102, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30941, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30942, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30943, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 102, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30944, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 102, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30945, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 102, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30946, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 102, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30947, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 102, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30948, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 102, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30949, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30950, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 102, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30951, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 102, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30952, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 102, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30953, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30954, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 102, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30955, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 102, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30956, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 102, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30957, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30958, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 102, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30959, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 102, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30960, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 102, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30961, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30962, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 102, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30963, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 102, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30964, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 102, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30965, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30966, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 102, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30967, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 102, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30968, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 102, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30969, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30970, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 102, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30971, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 102, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30972, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 102, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30973, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30974, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 102, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30975, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 102, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30976, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 102, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30977, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30978, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 102, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30979, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30980, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 102, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30981, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 102, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30982, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 102, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30983, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30984, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 102, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30985, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 102, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30986, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 102, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30987, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30988, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30989, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30990, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30991, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30992, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 102, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30993, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 102, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30994, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 102, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30995, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
	[31] = {
		[1] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31518, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31532, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[2] = {{0, 102, 31518, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31532, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
}

local VET_HOAPHUNG_WEAPON = {
	[2] = {
	   [1] = {{0, 3, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
		[2] = {{0, 3, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang"},
	},
	[3] = {
		[1] = {{0, 8, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
		[2] = {{0, 8, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang"},
	},
	[4] = {
		[1] = {{0, 0, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 0, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
	[6] = {
		[1] = {{0, 1, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[2] = {{0, 1, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[3] = {{0, 1, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
		[4] = {{0, 1, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang"},
	},
	[8] = {
		[3] = {{0, 2, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
		[4] = {{0, 2, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30651, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn"},
	},
	[9] = {
		[3] = {{0, 10, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30652, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
		[4] = {{0, 10, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30653, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn"},
	},
	[11] = {
		[1] = {{0, 0, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30654, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[2] = {{0, 0, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30655, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[3] = {{0, 0, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30656, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
		[4] = {{0, 0, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30657, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang"},
	},
	[12] = {
		[1] = {{0, 5, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30658, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[2] = {{0, 5, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30659, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[3] = {{0, 5, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30660, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
		[4] = {{0, 5, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30661, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Du Long §Þa KhÊt Trang"},
	},
	[14] = {
		[1] = {{0, 2, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30662, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[2] = {{0, 2, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30663, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[3] = {{0, 2, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30664, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
		[4] = {{0, 2, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30665, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-V« Cùc Thiªn T«n Trang"},
	},
	[15] = {
		[1] = {{0, 9, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30666, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[2] = {{0, 9, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30667, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[3] = {{0, 9, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30668, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
		[4] = {{0, 9, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30669, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang"},
	},
	[17] = {
		[1] = {{0, 6, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30670, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[2] = {{0, 6, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30671, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[3] = {{0, 6, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30672, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
		[4] = {{0, 6, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30673, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang"},
	},
	[18] = {
		[1] = {{0, 4, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30674, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[2] = {{0, 4, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30675, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[3] = {{0, 4, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30676, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
		[4] = {{0, 4, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30677, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang"},
	},
	[20] = {
		[1] = {{0, 7, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30678, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[2] = {{0, 7, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30679, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[3] = {{0, 7, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30680, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
		[4] = {{0, 7, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30681, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang"},
	},
	[21] = {
		[1] = {{0, 11, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30682, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[2] = {{0, 11, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30683, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[3] = {{0, 11, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30684, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
		[4] = {{0, 11, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30685, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang"},
	},
	[23] = {
		[1] = {{0, 2, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30686, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
		[2] = {{0, 2, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30687, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang"},
	},
	[25] = {
		[1] = {{0, 3, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30688, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[2] = {{0, 3, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30689, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[3] = {{0, 3, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30690, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
		[4] = {{0, 3, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Nhôc HuyÕt Cuång ChiÕn Trang"},
	},
	[26] = {
		[1] = {{0, 9, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30692, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[2] = {{0, 9, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30693, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[3] = {{0, 9, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30694, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
		[4] = {{0, 9, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30695, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Cöu Thiªn Quû Phï Trang"},
	},
	[27] = {
		[1] = {{0, 11, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30696, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[2] = {{0, 11, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30697, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[3] = {{0, 11, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30698, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
		[4] = {{0, 11, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30699, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Ma ¶nh ThÇn T«ng Trang"},
	},
	[29] = {
		[3] = {{0, 13, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30700, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
		[4] = {{0, 13, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30701, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn"},
	},
	[30] = {
		[3] = {{0, 12, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30702, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
		[4] = {{0, 12, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30703, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-Phi H¹ Tiªn Tö"},
	},
}


	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUPHU[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HOPHU[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_LENHKY[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUKY[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);

		--trang bÞ Liªu 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][2], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUPHU[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HOPHU[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_LENHKY[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUKY[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
		--trang bÞ Tèng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][1], "Bé Trang bÞ Háa Phông Nguyªn So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ háa phông", 0, 1);
--		end
	end
end
function GiveJue()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
		[31]	={382,391},
		[32]	={392,402},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		Talk(1,"","H·y gia nhËp m«n ph¸i sau ®ã quay l¹i t×m ta nhËn yÕu quyÕt")
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "QuyÕt YÕu");
	end
end 

function AddTrangBiThanhLongTuongQuan(nLevel,bIsHaveWeapon)
local VET_THANHLONG_CLOTH = {
	[2] = {
	    {{0, 100, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 100, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 100, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 100, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 100, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 100, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 100, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 100, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 100, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 100, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 100, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 100, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 100, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 100, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 100, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 100, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 100, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 100, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 100, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 100, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 100, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 100, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_CAP = {
	[2] = {
	    {{0, 103, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 103, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 103, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 103, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 103, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 103, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 103, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 103, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 103, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 103, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 103, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 103, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 103, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 103, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 103, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 103, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 103, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 103, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 103, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 103, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 103, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 103, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
}  

local VET_THANHLONG_SHOE = {
	[2] = {
	    {{0, 101, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 101, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 101, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 101, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 101, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 101, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 101, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 101, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 101, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 101, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 101, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 101, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 101, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 101, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 101, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 101, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 101, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 101, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 101, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 101, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 101, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 101, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_PHU = {
	[2] = {
	    {{0, 102, 31172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31314, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31317, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31318, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31319, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31320, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31321, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31322, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31323, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31324, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31325, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31326, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31327, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31328, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31329, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31330, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31331, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31332, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31333, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31495, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31509, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31523, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31537, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_KY = {
	[2] = {
	    {{0, 102, 31152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31294, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31295, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31296, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31297, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31298, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31299, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31300, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31301, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31302, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31303, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31304, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31305, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31306, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31307, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31308, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31309, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31310, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31311, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31312, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31313, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31494, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31508, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31522, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31536, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_BAI = {
	[2] = {
	    {{0, 102, 31132, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31274, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31133, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31275, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31134, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31276, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31135, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31277, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31136, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31278, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31137, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31279, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31138, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31280, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31139, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31281, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31140, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31282, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31141, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31283, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31142, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31284, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31285, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31286, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31287, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31288, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31289, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31290, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31291, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31292, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31293, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31493, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31507, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31521, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31535, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
}

	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		--trang bÞ Liªu 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
		--trang bÞ Tèng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Thanh Long", 0, 1);
--		end
	end
end

function AddTrangBiThanhLongNguyenSoai(nLevel,bIsHaveWeapon)
local VET_THANHLONG_CLOTH = {
	[2] = {
	    {{0, 100, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 100, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 100, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 100, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 100, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 100, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 100, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 100, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 100, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 100, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 100, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 100, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 100, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 100, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 100, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 100, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 100, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 100, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long TSo¸i"},
	},
	[29] = {
		{{0, 100, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 100, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[31] = {
		{{0, 100, 32158, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32160, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 100, 32166, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32168, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
}

local VET_THANHLONG_CAP = {
	[2] = {
	    {{0, 103, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 103, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 103, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 103, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 103, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 103, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 103, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 103, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 103, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 103, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 103, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 103, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 103, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 103, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 103, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 103, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 103, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 103, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[29] = {
		{{0, 103, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 103, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[31] = {
		{{0, 103, 32158, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32160, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 103, 32166, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32168, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
}  

local VET_THANHLONG_SHOE = {
	[2] = {
	    {{0, 101, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 101, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 101, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 101, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 101, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 101, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 101, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 101, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 101, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 101, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 101, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 101, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 101, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 101, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 101, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 101, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 101, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 101, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[29] = {
		{{0, 101, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 101, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[31] = {
		{{0, 101, 32158, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32160, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 101, 32166, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32168, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So¸i"},
	},
}

local VET_THANHLONG_HIEUPHU = {
	[2] = {
	    {{0, 102, 31192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31334, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 102, 31193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31335, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 102, 31194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31336, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 102, 31195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31337, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 102, 31196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31338, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 102, 31197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31339, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 102, 31198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31340, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 102, 31199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31341, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 102, 31200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31342, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 102, 31201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31343, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 102, 31202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31344, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 102, 31203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31345, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 102, 31204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31346, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 102, 31205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31347, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 102, 31206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31348, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 102, 31207, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31349, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 102, 31208, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31350, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 102, 31209, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31351, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[29] = {
		{{0, 102, 31210, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31352, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 102, 31211, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31353, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long TSo¸i"},
	},
	[31] = {
		{{0, 102, 31496, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31510, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 102, 31524, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31538, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long TSo¸i"},
	},
}
local VET_THANHLONG_PHU = {
	[2] = {
	    {{0, 102, 31212, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31354, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 102, 31213, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31355, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 102, 31214, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31356, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 102, 31215, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31357, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 102, 31216, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31358, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 102, 31217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31359, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 102, 31218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31360, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 102, 31219, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31361, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 102, 31220, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31362, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 102, 31221, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31363, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 102, 31222, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31364, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 102, 31223, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31365, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 102, 31224, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31366, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 102, 31225, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31367, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 102, 31226, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31368, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 102, 31227, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31369, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 102, 31228, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31370, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 102, 31229, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31371, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[29] = {
		{{0, 102, 31230, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31372, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 102, 31231, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31373, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[31] = {
		{{0, 102, 31497, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31511, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 102, 31525, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31539, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
}
local VET_THANHLONG_KY = {
	[2] = {
	    {{0, 102, 31232, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31374, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 102, 31233, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31375, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 102, 31234, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31376, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 102, 31235, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31377, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 102, 31236, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31378, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 102, 31237, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31379, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 102, 31238, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31380, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 102, 31239, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31381, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 102, 31240, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31382, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 102, 31241, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31383, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 102, 31242, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31384, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 102, 31243, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31385, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 102, 31244, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31386, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 102, 31245, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31387, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 102, 31246, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31388, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 102, 31247, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31389, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 102, 31248, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31390, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 102, 31249, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31391, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[29] = {
		{{0, 102, 31250, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31392, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 102, 31251, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31393, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[31] = {
		{{0, 102, 31498, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31512, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 102, 31526, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31540, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
}

local VET_THANHLONG_BAI = {
	[2] = {
	    {{0, 102, 31252, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31394, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[3] = {
		{{0, 102, 31253, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31395, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[4] = {
		{{0, 102, 31254, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31396, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[6] = {
		{{0, 102, 31255, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31397, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[8] = {
		{{0, 102, 31256, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31398, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[9] = {
		{{0, 102, 31257, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31399, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[11] = {
		{{0, 102, 31258, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31400, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[12] = {
		{{0, 102, 31259, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31401, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[14] = {
		{{0, 102, 31260, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31402, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[15] = {
		{{0, 102, 31261, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31403, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[17] = {
		{{0, 102, 31262, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31404, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[18] = {
		{{0, 102, 31263, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31405, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[20] = {
		{{0, 102, 31264, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31406, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[21] = {
		{{0, 102, 31265, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31407, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[23] = {
		{{0, 102, 31266, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31408, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[25] = {
		{{0, 102, 31267, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31409, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[26] = {
		{{0, 102, 31268, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31410, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[27] = {
		{{0, 102, 31269, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31411, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[29] = {
		{{0, 102, 31270, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31412, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[30] = {
		{{0, 102, 31271, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31413, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[31] = {
		{{0, 102, 31499, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31513, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
	[32] = {
		{{0, 102, 31527, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31541, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So¸i"},
	},
}

	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_HIEUPHU[nRoute][1][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		--trang bÞ Liªu 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][2], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_HIEUPHU[nRoute][1][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
		--trang bÞ Tèng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][1], "Bé Trang bÞ Thanh Long So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ thanh long", 0, 1);
--		end
	end
end
--=================Trang bÞ Uy Hæ
function AddTrangBiUyHoTuongQuan(nLevel,bIsHaveWeapon)
local VET_UYHO_CAP = {
	[2] = {
	    {{0, 103, 32171, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32215, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[3] = {
		{{0, 103, 32172, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32216, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[4] = {
		{{0, 103, 32173, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[6] = {
		{{0, 103, 32174, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[8] = {
		{{0, 103, 32175, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32219, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[9] = {
		{{0, 103, 32176, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32220, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[11] = {
		{{0, 103, 32177, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32221, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[12] = {
		{{0, 103, 32178, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32222, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[14] = {
		{{0, 103, 32179, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32223, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[15] = {
		{{0, 103, 32180, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32224, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[17] = {
		{{0, 103, 32181, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32225, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[18] = {
		{{0, 103, 32182, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32226, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[20] = {
		{{0, 103, 32183, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32227, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[21] = {
		{{0, 103, 32184, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32228, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[23] = {
		{{0, 103, 32185, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32229, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[25] = {
		{{0, 103, 32186, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32230, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[26] = {
		{{0, 103, 32187, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32231, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[27] = {
		{{0, 103, 32188, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32232, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[29] = {
		{{0, 103, 32189, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32233, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[30] = {
		{{0, 103, 32190, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32234, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[31] = {
		{{0, 103, 32191, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32235, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[32] = {
		{{0, 103, 32192, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32236, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
}  
local VET_UYHO_CLOTH = {
	[2] = {
	    {{0, 100, 32171, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32215, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[3] = {
		{{0, 100, 32172, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32216, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[4] = {
		{{0, 100, 32173, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[6] = {
		{{0, 100, 32174, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[8] = {
		{{0, 100, 32175, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32219, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[9] = {
		{{0, 100, 32176, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32220, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[11] = {
		{{0, 100, 32177, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32221, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[12] = {
		{{0, 100, 32178, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32222, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[14] = {
		{{0, 100, 32179, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32223, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[15] = {
		{{0, 100, 32180, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32224, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[17] = {
		{{0, 100, 32181, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32225, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[18] = {
		{{0, 100, 32182, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32226, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[20] = {
		{{0, 100, 32183, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32227, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[21] = {
		{{0, 100, 32184, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32228, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[23] = {
		{{0, 100, 32185, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32229, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[25] = {
		{{0, 100, 32186, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32230, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[26] = {
		{{0, 100, 32187, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32231, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[27] = {
		{{0, 100, 32188, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32232, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[29] = {
		{{0, 100, 32189, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32233, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[30] = {
		{{0, 100, 32190, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32234, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[31] = {
		{{0, 100, 32191, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32235, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[32] = {
		{{0, 100, 32192, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32236, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
}
local VET_UYHO_SHOE = {
	[2] = {
	    {{0, 101, 32171, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32215, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[3] = {
		{{0, 101, 32172, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32216, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[4] = {
		{{0, 101, 32173, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[6] = {
		{{0, 101, 32174, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[8] = {
		{{0, 101, 32175, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32219, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[9] = {
		{{0, 101, 32176, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32220, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[11] = {
		{{0, 101, 32177, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32221, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[12] = {
		{{0, 101, 32178, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32222, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[14] = {
		{{0, 101, 32179, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32223, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[15] = {
		{{0, 101, 32180, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32224, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[17] = {
		{{0, 101, 32181, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32225, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[18] = {
		{{0, 101, 32182, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32226, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[20] = {
		{{0, 101, 32183, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32227, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[21] = {
		{{0, 101, 32184, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32228, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[23] = {
		{{0, 101, 32185, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32229, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[25] = {
		{{0, 101, 32186, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32230, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[26] = {
		{{0, 101, 32187, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32231, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[27] = {
		{{0, 101, 32188, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32232, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[29] = {
		{{0, 101, 32189, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32233, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[30] = {
		{{0, 101, 32190, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32234, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[31] = {
		{{0, 101, 32191, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32235, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
	[32] = {
		{{0, 101, 32192, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32236, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ T­íng Qu©n"},
	},
}

local VET_UYHO_BAI = {
	[2] = {
	    {{0, 102, 31542, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31696, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31543, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31697, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31544, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31698, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31545, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31699, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31546, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31700, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31547, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31701, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31548, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31702, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31549, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31703, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31550, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31704, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31551, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31705, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31552, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31706, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31553, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31707, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31554, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31708, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31555, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31709, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31556, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31710, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31557, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31711, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31558, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31712, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31559, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31713, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31560, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31714, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31561, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31715, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31562, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31716, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31563, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31717, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
}
local VET_UYHO_KY = {
	[2] = {
	    {{0, 102, 31564, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31718, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31565, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31719, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31566, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31720, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31567, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31721, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31568, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31722, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31569, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31723, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31570, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31724, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31571, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31725, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31572, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31726, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31573, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31727, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31574, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31728, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31575, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31729, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31576, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31730, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31577, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31731, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31578, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31732, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31579, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31733, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31580, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31734, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31581, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31735, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31582, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31736, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31583, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31737, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31584, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31738, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31585, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31739, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
}
local VET_UYHO_PHU = {
	[2] = {
	    {{0, 102, 31586, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31740, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31587, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31741, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31588, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31742, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31589, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31743, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31590, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31744, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31591, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31745, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31592, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31746, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31593, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31747, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31594, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31748, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31595, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31749, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31596, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31750, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31597, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31751, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31598, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31752, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31599, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31753, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31600, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31754, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31601, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31755, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31602, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31756, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31603, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31757, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31604, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31758, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31605, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31759, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31606, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31760, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31607, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31761, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ T­íng Qu©n"},
	},
}
	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		--trang bÞ Liªu 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][2], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		--trang bÞ Tèng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][1], "Bé Trang bÞ Uy Hæ T­íng Qu©n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
--		end
	end
end

function AddTrangBiUyHoNguyenSoai(nLevel,bIsHaveWeapon)
local VET_UYHO_CAP = {
	[2] = {
	    {{0, 103, 32193, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32237, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 103, 32194, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32238, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 103, 32195, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32239, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 103, 32196, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32240, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 103, 32197, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32241, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 103, 32198, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32242, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 103, 32199, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32243, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 103, 32200, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32244, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 103, 32201, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32245, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 103, 32202, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32246, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 103, 32203, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32247, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 103, 32204, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32248, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 103, 32205, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32249, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 103, 32206, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32250, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 103, 32207, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32251, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 103, 32208, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32252, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 103, 32209, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32253, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 103, 32210, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32254, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 103, 32211, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32255, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 103, 32212, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32256, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 103, 32213, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32257, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 103, 32214, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32258, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
} 
local VET_UYHO_CLOTH = {
	[2] = {
	    {{0, 100, 32193, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32237, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 100, 32194, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32238, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 100, 32195, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32239, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 100, 32196, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32240, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 100, 32197, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32241, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 100, 32198, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32242, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 100, 32199, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32243, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 100, 32200, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32244, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 100, 32201, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32245, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 100, 32202, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32246, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 100, 32203, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32247, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 100, 32204, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32248, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 100, 32205, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32249, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 100, 32206, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32250, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 100, 32207, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32251, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 100, 32208, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32252, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 100, 32209, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32253, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 100, 32210, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32254, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 100, 32211, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32255, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 100, 32212, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32256, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 100, 32213, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32257, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 100, 32214, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32258, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
}

 

local VET_UYHO_SHOE = {
	[2] = {
	    {{0, 101, 32193, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32237, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 101, 32194, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32238, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 101, 32195, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32239, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 101, 32196, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32240, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 101, 32197, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32241, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 101, 32198, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32242, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 101, 32199, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32243, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 101, 32200, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32244, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 101, 32201, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32245, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 101, 32202, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32246, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 101, 32203, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32247, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 101, 32204, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32248, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 101, 32205, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32249, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 101, 32206, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32250, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 101, 32207, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32251, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 101, 32208, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32252, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 101, 32209, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32253, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 101, 32210, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32254, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 101, 32211, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32255, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 101, 32212, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32256, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 101, 32213, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32257, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 101, 32214, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32258, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy Hæ So¸i"},
	},
}

local VET_UYHO_HIEUPHU = {
	[2] = {
	    {{0, 102, 31608, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31762, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 102, 31609, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31763, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 102, 31610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31764, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 102, 31611, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31765, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 102, 31612, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31766, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 102, 31613, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31767, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 102, 31614, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31768, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 102, 31615, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31769, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 102, 31616, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31770, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 102, 31617, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31771, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 102, 31618, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31772, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 102, 31619, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31773, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 102, 31620, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31774, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 102, 31621, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31775, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 102, 31622, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31776, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 102, 31623, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31777, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 102, 31624, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31778, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 102, 31625, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31779, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 102, 31626, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31780, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 102, 31627, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31781, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 102, 31628, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31782, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 102, 31629, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31783, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
}
local VET_UYHO_PHU = {
	[2] = {
	    {{0, 102, 31630, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31784, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 102, 31631, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31785, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 102, 31632, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31786, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 102, 31633, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31787, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 102, 31634, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31788, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 102, 31635, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31789, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 102, 31636, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31790, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 102, 31637, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31791, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 102, 31638, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31792, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 102, 31639, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31793, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 102, 31640, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31794, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 102, 31641, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31795, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 102, 31642, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31796, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 102, 31643, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31797, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 102, 31644, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31798, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 102, 31645, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31799, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 102, 31646, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31800, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 102, 31647, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31801, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 102, 31648, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31802, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 102, 31649, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31803, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 102, 31650, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31804, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 102, 31651, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31805, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
}
local VET_UYHO_KY = {
	[2] = {
	    {{0, 102, 31652, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31806, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 102, 31653, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31807, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 102, 31654, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31808, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 102, 31655, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31809, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 102, 31656, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31810, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 102, 31657, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31811, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 102, 31658, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31812, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 102, 31659, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31813, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 102, 31660, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31814, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 102, 31661, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31815, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 102, 31662, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31816, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 102, 31663, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31817, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 102, 31664, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31818, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 102, 31665, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31819, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 102, 31666, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31820, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 102, 31667, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31821, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 102, 31668, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31822, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 102, 31669, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31823, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 102, 31670, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31824, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 102, 31671, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31825, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 102, 31672, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31826, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 102, 31673, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31827, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
}

local VET_UYHO_BAI = {
	[2] = {
	    {{0, 102, 31674, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31828, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[3] = {
		{{0, 102, 31675, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31829, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[4] = {
		{{0, 102, 31676, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31830, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[6] = {
		{{0, 102, 31677, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31831, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[8] = {
		{{0, 102, 31678, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31832, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[9] = {
		{{0, 102, 31679, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31833, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[11] = {
		{{0, 102, 31680, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31834, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[12] = {
		{{0, 102, 31681, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31835, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[14] = {
		{{0, 102, 31682, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31836, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[15] = {
		{{0, 102, 31683, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31837, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[17] = {
		{{0, 102, 31684, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31838, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[18] = {
		{{0, 102, 31685, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31839, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[20] = {
		{{0, 102, 31686, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31840, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[21] = {
		{{0, 102, 31687, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31841, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[23] = {
		{{0, 102, 31688, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31842, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[25] = {
		{{0, 102, 31689, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31843, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[26] = {
		{{0, 102, 31690, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31844, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[27] = {
		{{0, 102, 31691, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31845, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[29] = {
		{{0, 102, 31692, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31846, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[30] = {
		{{0, 102, 31693, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31847, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[31] = {
		{{0, 102, 31694, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31848, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
	[32] = {
		{{0, 102, 31695, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31849, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy Hæ So¸i"},
	},
}

	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_HIEUPHU[nRoute][1][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		--trang bÞ Liªu 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][2], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		gf_AddItemEx2(VET_UYHO_HIEUPHU[nRoute][1][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
		--trang bÞ Tèng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][1], "Bé Trang bÞ Uy Hæ So¸i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "NhËn trang bÞ Uy Hæ", 0, 1);
--		end
	end
end