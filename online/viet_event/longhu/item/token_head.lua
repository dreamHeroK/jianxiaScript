-- Created by TuanNA5

Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

TOKEN_TASK_ID = 2428

tAward ={
	[5] = {"MËt TŞch Tø Linh V« Song",{0,107,165,1},1,1},
	[6] = {"Kú L©n Thó",{0,105,30000,1,1,-1,-1,-1,-1,-1,-1},1,100},
	[7] = {"Trang bŞ Viªm §Õ",{0,100,8000,1,1,-1,-1,-1,-1,-1,-1,0,7},3,300},
	[8] = {"§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch",{2,1,1067,1},1,1},
	[9] = {"§¹i hång bao hoµng kim",{2,1,539,30},1,1},
}

-- tªn ngo¹i trang, G, D, P, sè lÇn chuyÓn sinh + lv mua ®­îc (do chuyÓn sinh tiÕp theo ko bŞ giíi h¹n lv mua nªn ghĞp 2 sè thµnh 1)
t_translife_cloth = 
{
	[1] = {"V¨n Sö ngo¹i trang",0,108,570,290},
	[2] = {"Thiªn ¢m ngo¹i trang",0,108,562,390},
	[3] = {"ThiÕu D­¬ng ngo¹i trang",0,108,566,488},
	[4] = {"Tø Linh ViÖt  ngo¹i trang",0,108,30001,588},
}
-- tªn ngo¹i trang, G, D, P, sè lÇn chuyÓn sinh + lv mua ®­îc (do chuyÓn sinh tiÕp theo ko bŞ giíi h¹n lv mua nªn ghĞp 2 sè thµnh 1)
t_translife_cloth_cs6 = 
{
	[1] = {"V¨n Sö ngo¹i trang",0,108,570,188, 288},
	[2] = {"Thiªn ¢m ngo¹i trang",0,108,562,188, 288},
	[3] = {"ThiÕu D­¬ng ngo¹i trang",0,108,566,188, 288},
	[4] = {"Tø Linh Phôc Sinh ngo¹i trang",0,108,30005,188, 288},	
	[8] = {"T­¬ng KiÕm Hu©n ngo¹i trang",0,108,725,188, 288},
	[9] = {"ThiÕu Niªn Du ngo¹i trang",0,108,721,188, 288},	
	[5] = { --phôc sinh 1
			[1] = {--KiÓu phôc sinh
--					[1] = {{0,108,30005,1,4}, {0,109,30005,1,4}, {0,110,30005,1,4}},	--KiÓu h×nh
--					[2] = {{0,108,30006,1,4}, {0,109,30006,1,4}, {0,110,30006,1,4}},
--					[3] = {{0,108,30007,1,4}, {0,109,30007,1,4}, {0,110,30007,1,4}},
--					[4] = {{0,108,30008,1,4}, {0,109,30008,1,4}, {0,110,30008,1,4}},
					[1] = {{0,108,30005,1,4,5,639,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,5,639,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,5,639,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,5,639,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},		
			[2] = {
--					[1] = {{0,108,30005,1,4}, {0,109,30005,1,4}, {0,110,30005,1,4}},
--					[2] = {{0,108,30006,1,4}, {0,109,30006,1,4}, {0,110,30006,1,4}},
--					[3] = {{0,108,30007,1,4}, {0,109,30007,1,4}, {0,110,30007,1,4}},
--					[4] = {{0,108,30008,1,4}, {0,109,30008,1,4}, {0,110,30008,1,4}},
					[1] = {{0,108,30005,1,4,6,302,6,102}, {0,109,30005,1,4,5,409,6,102}, {0,110,30005,1,4,5,79,5,80,6,102}},
					[2] = {{0,108,30006,1,4,6,302,6,102}, {0,109,30006,1,4,5,409,6,102}, {0,110,30006,1,4,5,79,5,80,6,102}},
					[3] = {{0,108,30007,1,4,6,302,6,102}, {0,109,30007,1,4,5,409,6,102}, {0,110,30007,1,4,5,79,5,80,6,102}},
					[4] = {{0,108,30008,1,4,6,302,6,102}, {0,109,30008,1,4,5,409,6,102}, {0,110,30008,1,4,5,79,5,80,6,102}},
				},
			[3] = {
--					[1] = {{0,108,30005,1,4}, {0,109,30005,1,4}, {0,110,30005,1,4}},
--					[2] = {{0,108,30006,1,4}, {0,109,30006,1,4}, {0,110,30006,1,4}},
--					[3] = {{0,108,30007,1,4}, {0,109,30007,1,4}, {0,110,30007,1,4}},
--					[4] = {{0,108,30008,1,4}, {0,109,30008,1,4}, {0,110,30008,1,4}},
					[1] = {{0,108,30005,1,4,2,13075,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,2,13075,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,2,13075,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,2,13075,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},	
			[4] = {
--					[1] = {{0,108,30005,1,4}, {0,109,30005,1,4}, {0,110,30005,1,4}},
--					[2] = {{0,108,30006,1,4}, {0,109,30006,1,4}, {0,110,30006,1,4}},
--					[3] = {{0,108,30007,1,4}, {0,109,30007,1,4}, {0,110,30007,1,4}},
--					[4] = {{0,108,30008,1,4}, {0,109,30008,1,4}, {0,110,30008,1,4}},
					[1] = {{0,108,30005,1,4,5,27,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,4,292,4,293,6,102}},
					[2] = {{0,108,30006,1,4,5,27,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,4,292,4,293,6,102}},
					[3] = {{0,108,30007,1,4,5,27,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,4,292,4,293,6,102}},
					[4] = {{0,108,30008,1,4,5,27,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,4,292,4,293,6,102}},
				},
		},
	[6] = { --phôc sinh 2
			[1] = {
--					[1] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
--					[2] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
--					[3] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
--					[4] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},
					[1] = {{0,108,30029,1,4,7,639,3,371,7,102}, {0,109,30029,1,4,5,342,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,7,639,3,371,7,102}, {0,109,30030,1,4,5,342,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,7,639,3,371,7,102}, {0,109,30031,1,4,5,342,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,7,639,3,371,7,102}, {0,109,30032,1,4,5,342,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},	
			[4] = {
--					[1] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
--					[2] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
--					[3] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
--					[4] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},
					[1] = {{0,108,30029,1,4,7,27,7,102}, {0,109,30029,1,4,5,342,4,409,7,102}, {0,110,30029,1,4,5,292,5,293,7,102}},
					[2] = {{0,108,30030,1,4,7,27,7,102}, {0,109,30030,1,4,5,342,4,409,7,102}, {0,110,30030,1,4,5,292,5,293,7,102}},
					[3] = {{0,108,30031,1,4,7,27,7,102}, {0,109,30031,1,4,5,342,4,409,7,102}, {0,110,30031,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30032,1,4,7,27,7,102}, {0,109,30032,1,4,5,342,4,409,7,102}, {0,110,30032,1,4,5,292,5,293,7,102}},
				},		
			[3] = {
--					[1] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
--					[2] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
--					[3] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
--					[4] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},
					[1] = {{0,108,30029,1,4,3,13075,7,102}, {0,109,30029,1,4,5,342,2,346,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,3,13075,7,102}, {0,109,30030,1,4,5,342,2,346,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,3,13075,7,102}, {0,109,30031,1,4,5,342,2,346,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,3,13075,7,102}, {0,109,30032,1,4,5,342,2,346,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},											
			[2] = {
--					[1] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
--					[2] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
--					[3] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
--					[4] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},
					[1] = {{0,108,30029,1,4,6,302,7,409,7,102}, {0,109,30029,1,4,5,13219,5,13220,7,102}, {0,110,30029,1,4,4,290,7,250,7,102}},
					[2] = {{0,108,30030,1,4,6,302,7,409,7,102}, {0,109,30030,1,4,5,13219,5,13220,7,102}, {0,110,30030,1,4,4,290,7,250,7,102}},
					[3] = {{0,108,30031,1,4,6,302,7,409,7,102}, {0,109,30031,1,4,5,13219,5,13220,7,102}, {0,110,30031,1,4,4,290,7,250,7,102}},
					[4] = {{0,108,30032,1,4,6,302,7,409,7,102}, {0,109,30032,1,4,5,13219,5,13220,7,102}, {0,110,30032,1,4,4,290,7,250,7,102}},
				},	
		},
	[7] = { --phôc sinh 3
			[1] = {--Long
--					[1] = {{0,108,680,1,4}, {0,109,680,1,4}, {0,110,680,1,4}},
--					[2] = {{0,108,681,1,4}, {0,109,681,1,4}, {0,110,681,1,4}},
--					[3] = {{0,108,682,1,4}, {0,109,682,1,4}, {0,110,682,1,4}},
--					[4] = {{0,108,683,1,4}, {0,109,683,1,4}, {0,110,683,1,4}},
					[1] = {{0,108,680,1,4,1,13714,5,13655}, {0,109,680,1,4,1,13715,5,13658,5,13655}, {0,110,680,1,4,6,13702,1,13716,5,13655}},
					[2] = {{0,108,681,1,4,1,13714,5,13655}, {0,109,681,1,4,1,13715,5,13658,5,13655}, {0,110,681,1,4,6,13702,1,13716,5,13655}},
					[3] = {{0,108,682,1,4,1,13714,5,13655}, {0,109,682,1,4,1,13715,5,13658,5,13655}, {0,110,682,1,4,6,13702,1,13716,5,13655}},
					[4] = {{0,108,683,1,4,1,13714,5,13655}, {0,109,683,1,4,1,13715,5,13658,5,13655}, {0,110,683,1,4,6,13702,1,13716,5,13655}},
				},
			[4] = {--Phông
--					[1] = {{0,108,680,1,4}, {0,109,680,1,4}, {0,110,680,1,4}},
--					[2] = {{0,108,681,1,4}, {0,109,681,1,4}, {0,110,681,1,4}},
--					[3] = {{0,108,682,1,4}, {0,109,682,1,4}, {0,110,682,1,4}},
--					[4] = {{0,108,683,1,4}, {0,109,683,1,4}, {0,110,683,1,4}},
					[1] = {{0,108,680,1,4,7,27,4,13488,5,13655}, {0,109,680,1,4,1,13711,5,13658,5,13655}, {0,110,680,1,4,6,292,1,13716,5,13655}},
					[2] = {{0,108,681,1,4,7,27,4,13488,5,13655}, {0,109,681,1,4,1,13711,5,13658,5,13655}, {0,110,681,1,4,6,292,1,13716,5,13655}},
					[3] = {{0,108,682,1,4,7,27,4,13488,5,13655}, {0,109,682,1,4,1,13711,5,13658,5,13655}, {0,110,682,1,4,6,292,1,13716,5,13655}},
					[4] = {{0,108,683,1,4,7,27,4,13488,5,13655}, {0,109,683,1,4,1,13711,5,13658,5,13655}, {0,110,683,1,4,6,292,1,13716,5,13655}},
				},
			[3] = {--¦ng
--					[1] = {{0,108,680,1,4}, {0,109,680,1,4}, {0,110,680,1,4}},
--					[2] = {{0,108,681,1,4}, {0,109,681,1,4}, {0,110,681,1,4}},
--					[3] = {{0,108,682,1,4}, {0,109,682,1,4}, {0,110,682,1,4}},
--					[4] = {{0,108,683,1,4}, {0,109,683,1,4}, {0,110,683,1,4}},
					[1] = {{0,108,680,1,4,5,13710,5,13655}, {0,109,680,1,4,1,13707,5,13658,5,13655}, {0,110,680,1,4,6,13702,1,13716,5,13655}},
					[2] = {{0,108,681,1,4,5,13710,5,13655}, {0,109,681,1,4,1,13707,5,13658,5,13655}, {0,110,681,1,4,6,13702,1,13716,5,13655}},
					[3] = {{0,108,682,1,4,5,13710,5,13655}, {0,109,682,1,4,1,13707,5,13658,5,13655}, {0,110,682,1,4,6,13702,1,13716,5,13655}},
					[4] = {{0,108,683,1,4,5,13710,5,13655}, {0,109,683,1,4,1,13707,5,13658,5,13655}, {0,110,683,1,4,6,13702,1,13716,5,13655}},
				},											
			[2] = {--Hæ
--					[1] = {{0,108,680,1,4}, {0,109,680,1,4}, {0,110,680,1,4}},
--					[2] = {{0,108,681,1,4}, {0,109,681,1,4}, {0,110,681,1,4}},
--					[3] = {{0,108,682,1,4}, {0,109,682,1,4}, {0,110,682,1,4}},
--					[4] = {{0,108,683,1,4}, {0,109,683,1,4}, {0,110,683,1,4}},
					[1] = {{0,108,680,1,4,4,13243,1,13719,5,13655}, {0,109,680,1,4,1,13717,5,13658,5,13655}, {0,110,680,1,4,1,13718,1,13716,5,13655}},
					[2] = {{0,108,681,1,4,4,13243,1,13719,5,13655}, {0,109,681,1,4,1,13717,5,13658,5,13655}, {0,110,681,1,4,1,13718,1,13716,5,13655}},
					[3] = {{0,108,682,1,4,4,13243,1,13719,5,13655}, {0,109,682,1,4,1,13717,5,13658,5,13655}, {0,110,682,1,4,1,13718,1,13716,5,13655}},
					[4] = {{0,108,683,1,4,4,13243,1,13719,5,13655}, {0,109,683,1,4,1,13717,5,13658,5,13655}, {0,110,683,1,4,1,13718,1,13716,5,13655}},
				},	
		},		
}
t_translife_cloth_cs9 = {
						[1] = {{0,108,901,1,4}, {0,109,901,1,4}, {0,110,901,1,4}},
						[2] = {{0,108,902,1,4}, {0,109,902,1,4}, {0,110,902,1,4}},
						[3] = {{0,108,903,1,4}, {0,109,903,1,4}, {0,110,903,1,4}},
						[4] = {{0,108,904,1,4}, {0,109,904,1,4}, {0,110,904,1,4}},
					}
t_translife_cloth_cs10 = {
						[1] = {{0,108,634,1,4}, {0,109,634,1,4}, {0,110,634,1,4}},
						[2] = {{0,108,635,1,4}, {0,109,635,1,4}, {0,110,635,1,4}},
						[3] = {{0,108,636,1,4}, {0,109,636,1,4}, {0,110,636,1,4}},
						[4] = {{0,108,637,1,4}, {0,109,637,1,4}, {0,110,637,1,4}},
					}					
t_translife_uanlinh_cs_ps = {
						[1] = {--Phôc sinh 1
									[1] = {{0,148,121,1,4,-1,-1,-1,-1,-1,-1}, {0,149,125,1,4,-1,-1,-1,-1,-1,-1}, {0,150,121,1,4,-1,-1,-1,-1,-1,-1}}, --kiÓu phôc sinh
									[4] = {{0,148,122,1,4,-1,-1,-1,-1,-1,-1}, {0,149,126,1,4,-1,-1,-1,-1,-1,-1}, {0,150,122,1,4,-1,-1,-1,-1,-1,-1}},
									[2] = {{0,148,123,1,4,-1,-1,-1,-1,-1,-1}, {0,149,127,1,4,-1,-1,-1,-1,-1,-1}, {0,150,123,1,4,-1,-1,-1,-1,-1,-1}},
									[3] = {{0,148,124,1,4,-1,-1,-1,-1,-1,-1}, {0,149,128,1,4,-1,-1,-1,-1,-1,-1}, {0,150,124,1,4,-1,-1,-1,-1,-1,-1}},
								},
						[2] = {--Phôc sinh 2
									[1] = {{0,148,125,1,4,-1,-1,-1,-1,-1,-1}, {0,149,129,1,4,-1,-1,-1,-1,-1,-1}, {0,150,125,1,4,-1,-1,-1,-1,-1,-1}},
									[4] = {{0,148,126,1,4,-1,-1,-1,-1,-1,-1}, {0,149,130,1,4,-1,-1,-1,-1,-1,-1}, {0,150,126,1,4,-1,-1,-1,-1,-1,-1}},
									[2] = {{0,148,127,1,4,-1,-1,-1,-1,-1,-1}, {0,149,131,1,4,-1,-1,-1,-1,-1,-1}, {0,150,127,1,4,-1,-1,-1,-1,-1,-1}},
									[3] = {{0,148,128,1,4,-1,-1,-1,-1,-1,-1}, {0,149,132,1,4,-1,-1,-1,-1,-1,-1}, {0,150,128,1,4,-1,-1,-1,-1,-1,-1}},
								},		
						[3] = {--Phôc sinh 3
									[1] = {{0,148,129,1,4,-1,-1,-1,-1,-1,-1}, {0,149,133,1,4,-1,-1,-1,-1,-1,-1}, {0,150,129,1,4,-1,-1,-1,-1,-1,-1}},
									[4] = {{0,148,130,1,4,-1,-1,-1,-1,-1,-1}, {0,149,134,1,4,-1,-1,-1,-1,-1,-1}, {0,150,130,1,4,-1,-1,-1,-1,-1,-1}},
									[2] = {{0,148,131,1,4,-1,-1,-1,-1,-1,-1}, {0,149,135,1,4,-1,-1,-1,-1,-1,-1}, {0,150,131,1,4,-1,-1,-1,-1,-1,-1}},
									[3] = {{0,148,132,1,4,-1,-1,-1,-1,-1,-1}, {0,149,136,1,4,-1,-1,-1,-1,-1,-1}, {0,150,132,1,4,-1,-1,-1,-1,-1,-1}},
								},
						[4] = {--Phôc sinh 4
									[1] = {{0,148,133,1,4,-1,-1,-1,-1,-1,-1}, {0,149,137,1,4,-1,-1,-1,-1,-1,-1}, {0,150,133,1,4,-1,-1,-1,-1,-1,-1}},
									[4] = {{0,148,134,1,4,-1,-1,-1,-1,-1,-1}, {0,149,138,1,4,-1,-1,-1,-1,-1,-1}, {0,150,134,1,4,-1,-1,-1,-1,-1,-1}},
									[2] = {{0,148,135,1,4,-1,-1,-1,-1,-1,-1}, {0,149,139,1,4,-1,-1,-1,-1,-1,-1}, {0,150,135,1,4,-1,-1,-1,-1,-1,-1}},
									[3] = {{0,148,136,1,4,-1,-1,-1,-1,-1,-1}, {0,149,140,1,4,-1,-1,-1,-1,-1,-1}, {0,150,136,1,4,-1,-1,-1,-1,-1,-1}},
								},
						[5] = {--Phôc sinh 5
									[1] = {{0,148,137,1,4,-1,-1,-1,-1,-1,-1}, {0,149,141,1,4,-1,-1,-1,-1,-1,-1}, {0,150,137,1,4,-1,-1,-1,-1,-1,-1}},
									[4] = {{0,148,138,1,4,-1,-1,-1,-1,-1,-1}, {0,149,142,1,4,-1,-1,-1,-1,-1,-1}, {0,150,138,1,4,-1,-1,-1,-1,-1,-1}},
									[2] = {{0,148,139,1,4,-1,-1,-1,-1,-1,-1}, {0,149,143,1,4,-1,-1,-1,-1,-1,-1}, {0,150,139,1,4,-1,-1,-1,-1,-1,-1}},
									[3] = {{0,148,140,1,4,-1,-1,-1,-1,-1,-1}, {0,149,144,1,4,-1,-1,-1,-1,-1,-1}, {0,150,140,1,4,-1,-1,-1,-1,-1,-1}},
								},		
					}
				
t_translife_horse = 
{
	[1] = {"Niªn Thó",{0, 105, 33, 1, 1, 3, 403}, 292, 1000000},
	[2] = {"B¹ch Hæ", {0, 105, 30009, 1, 4, -1, -1, -1, -1, -1, -1}, 490, 10000000},
}
t_translife_horse_cs6 = 
{
	[1] = {"B¹ch Hæ", {0, 105, 30009, 1, 4, -1, -1, -1, -1, -1, -1}, 190, 10000000},
	[2] = {"H¾c Hæ", {0, 105, 30011, 1, 4, -1, -1, -1, -1, -1, -1}, 191, 10000000},	
	[3] = {"Ngù KiÕm", {0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1}, 290, 8},	--Phôc Sinh 2 (cs7)
	[4] = {"Ngù KiÕm Phôc Sinh 3", {0, 105, 10108, 1, 4, -1, -1, -1, -1, -1, -1}, 392, 10000000},	--Phôc Sinh 3 (cs8)
	[5] = {"Long M· Phôc Sinh 4", {0, 105, 30056, 1, 4, -1, -1, -1, -1, -1, -1}, 491, 10000000},	--Phôc Sinh 4 (cs9)
	[6] = {"Cöu VÜ TuyÕt Hå Phôc Sinh 5", {0, 105, 163, 1, 4, -1, -1, -1, -1, -1, -1}, 591, 10000000},	--Phôc Sinh 5 (cs10)
}

tSFX ={
	{957,931},
	{955,922},
	{959,927},
	{956,928},
}

tLife = {"Long","Hæ","¦ng","Phông"}
tLife_cs6 = {"Long","Hæ","¦ng","Phông"}

tb_translife_weapon_effect = {			
			"Hµo m«n",
			"PhÇn V©n",
			"§o¹n Giao",			
			"Ph¸ Qu©n",
}

function UseDragonToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt Long Tö Quang/#GetSFX(1)")
	tinsert(tSay, "T¾t Long Tö Quang/CloseSFX")
--	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then
 		tinsert(tSay, "Long Tö Héi lÖnh/#TransferLife(1)")
 	else
 		tinsert(tSay, "Tø Linh Long Tö lÖnh/#TranferTuLinh(1)")
 	end
 	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end

function UseTigerToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt Hæ Tö Quang/#GetSFX(2)")
	tinsert(tSay, "T¾t Hæ Tö Quang/CloseSFX")
--	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then	
		tinsert(tSay, "Hæ Tö Héi lÖnh/#TransferLife(2)")
	else
		tinsert(tSay, "Tø Linh Hæ Tö lÖnh/#TranferTuLinh(2)")
	end	 	
	tinsert(tSay, "§ãng/closedialog")	
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Hæ Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Hæ Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end


function UseFengToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt Phông Tö Quang/#GetSFX(3)")
	tinsert(tSay, "T¾t Phông Tö Quang/CloseSFX")
--	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then			
		tinsert(tSay, "Phông Tö Héi lÖnh/#TransferLife(4)")
 	else
 		tinsert(tSay, "Tø Linh Phông Tö lÖnh/#TranferTuLinh(4)")
 	end	 	
 	tinsert(tSay, "§ãng/closedialog")	
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Phông Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Phông Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end


function UseYingToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "BËt ¦ng Tö Quang/#GetSFX(4)")
	tinsert(tSay, "T¾t ¦ng Tö Quang/CloseSFX")
--	tinsert(tSay, "Kİch ho¹t hiÖu øng Vò Khİ/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then			
 		tinsert(tSay, "¦ng Tö Héi lÖnh/#TransferLife(3)")
 	else
 		tinsert(tSay, "Tø Linh ¦ng Tö lÖnh/#TranferTuLinh(3)")
 	end	 		 		
	tinsert(tSay, "§ãng/closedialog")	
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! ¦ng Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ ¦ng Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)
end

function WeaponEffect(nIndex)
	do return 0 end
	
	BindWeaponEffect(tb_translife_weapon_effect[nIndex],1)	
end

function GetItem(nIndex)
	local nTaskVal = GetTask(TOKEN_TASK_ID)
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate >= 20091007 then
		Say("H¹n nhËn th­ëng ®· kÕt thóc!",0)
		return
	end	
	
	if GetBit(nTaskVal,nIndex) == 1 then
		Say("§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!",0)
		return
	end
	
	if GetExtPoint(4) ~= 2 then
		Say("§¹i hiÖp ch­a ®ñ ®iÒu kiÖn nhËn th­ëng!",0)
		return
	end
	
	if gf_JudgeRoomWeight(tAward[nIndex][3],tAward[nIndex][4],"") == 0 then
		return
	end		
	
	SetTask(TOKEN_TASK_ID,SetBit(nTaskVal,nIndex,1))
	
	if nIndex == 5 or nIndex == 9 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])		
		end	
	elseif nIndex == 6 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			gf_SetItemExpireTime(nItemIdx,2010,03,31,24,0,0)
			WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])		
		end		
	elseif nIndex == 7 then
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0,i,8000+ GetBody(),1,1,-1,-1,-1,-1,-1,-1,0,7},tAward[nIndex][1])
				if Ret == 1 then
					WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])
				end
			end
		end	
	elseif nIndex == 8 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			SetItemExpireTime(nItemIdx,30*24*60*60)
			WriteLogEx("Phan thuong bang chu","nhËn",1,tAward[nIndex][1])		
		end
	else
		return
	end
end

function GetSFX(nIndex)
	if PlayerIndex > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(),tSFX[nIndex][1],1,1)
		SetCurrentNpcSFX(PIdx2NpcIdx(),tSFX[nIndex][2],5,1)	
	end
end

function CloseSFX()
	if PlayerIndex > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,5,1)
	end
end

function GetAward()
	local tSay={
		"NhËn phÇn th­ëng MËt TŞch Tø Linh V« Song/#GetItem(5)",
	 	"NhËn phÇn th­ëng Kú L©n/#GetItem(6)",
	 	"NhËn phÇn th­ëng Viªm §Õ/#GetItem(7)", 
	 	"NhËn phÇn th­ëng §Şnh Hån Thiªn Th¹ch ThÇn Th¹ch/#GetItem(8)",
	 	"NhËn phÇn th­ëng 30 §¹i hång bao hoµng kim/#GetItem(9)", 
	 	"§ãng/closedialog",	
	}
	Say("PhÇn th­ëng dµnh cho Bang chñ cña Bang héi h¹ng nhÊt nh©n khİ. Thêi gian nhËn th­ëng <color=red>01/10/2009 - 24:00 07/10/2009<color>.",getn(tSay),tSay)
end

function TransferLife(szLife)
	local tSay={	 	
	 	"Mua ngo¹i trang chuyÓn sinh (cÇn 200 vËt phÈm Xu, h¹n sö dông 30 ngµy)/buy_translife_cloth",
	 	format("Mua trang bŞ dßng %s Tö/buy_translife_equip",tLife[szLife]),
	 	format("Kİch ho¹t thó c­ìi dßng %s Tö/buy_translife_horse",tLife[szLife]),
	 	format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh dßng %s Tö/translife_cloth",tLife[szLife]),
	 	"Kİch ho¹t chÕ t¹o Vò Khİ Linh Ph¸ch/nothing",
	 	"Kİch ho¹t Kü N¨ng Sèng sau chuyÓn sinh/nothing",
	 	"§ãng/closedialog",	
	}
	Say(format("C¸c chøc n¨ng cña %s Tö Héi:",tLife[szLife]),getn(tSay),tSay)
end

function buy_translife_equip()
	local tSay={
		"NhËn HËu NghÖ L¹c NhËt Hoµn 1 lÇn (yªu cÇu ®¼ng cÊp 86 + h¹n sö dông 30 ngµy + tu luyÖn theo h­íng Long/Hæ/¦ng Tö)/#get_translife_equip(1)",
		"NhËn H»ng Nga HuyÔn ThÇn §¸i 1 lÇn (yªu cÇu ®¼ng cÊp 86 + h¹n sö dông 30 ngµy + tu luyÖn theo h­íng Phông Tö)/#get_translife_equip(2)",
		"NhËn KhuÊt Nguyªn Béi 1 lÇn (yªu cÇu ®¼ng cÊp 92 + h¹n sö dông 30 ngµy)/#get_translife_equip(3)",
		"Mua HËu NghÖ L¹c NhËt Hoµn (cÇn 700 ®iÓm s­ m«n + 700 ®iÓm danh väng + h¹n sö dông 7 ngµy)/#confirm_buy_translife_equip(1)",		
		"Mua H»ng Nga HuyÔn ThÇn §¸i (cÇn 700 ®iÓm s­ m«n + 700 ®iÓm danh väng + h¹n sö dông 7 ngµy)/#confirm_buy_translife_equip(2)",
		"Mua KhuÊt Nguyªn Bé (cÇn 1500 ®iÓm s­ m«n + 1500 ®iÓm danh väng + h¹n sö dông 7 ngµy)/#confirm_buy_translife_equip(3)",		
		"§ãng/closedialog",
	}
	Say("C¸c lo¹i trang søc: ",getn(tSay),tSay)
end

function get_translife_equip(nType)
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if (nType == 3) and (nTransCount < 592) then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if nTransCount < 388 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if GetTaskTrans() == 23 or GetTaskTrans() == 31 or GetTaskTrans() == 37 or GetTaskTrans() == 38  then
		if nType == 1 then
			if BigGetItemCount(0,102,43) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
			end
			if GetTranslifeFaction() == 4 then
				Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Long/Hæ/¦ng Tö míi cã thÓ nhËn trang søc nµy!!")
				return
			end
			gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh","nhËn",30*24*3600,1)	
		elseif nType == 2 then
			if BigGetItemCount(0,102,42) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
			end
			if GetTranslifeFaction() ~= 4 then
				Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Phông Tö míi cã thÓ mua trang søc nµy!!")
				return
			end
			gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh","nhËn",30*24*3600,1)
		elseif nType == 3 then
			if BigGetItemCount(0,102,27) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
			end
			gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh","nhËn",30*24*3600,1)
		end
		SetTaskTrans()
	else
		Talk(1,"","B¹n ®· nhËn trang søc nµy råi hoÆc b¹n ch­a ®ñ ®iÒu kiÖn nhËn!")
		return
	end
end
function confirm_buy_translife_equip(nType)
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nType == 3 and nTransCount < 592 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if nTransCount < 388 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if GetReputation() < 10000 or GetTask(336) < 10000 then
		Talk(1,"","B¹n kh«ng ®ñ 10000 ®iÓm S­ M«n hoÆc 10000 Danh Väng ®Ó mua trang søc nµy!")
		return
	end
	if nType == 1 then
		if GetTranslifeFaction() == 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Long/Hæ/¦ng Tö míi cã thÓ mua trang søc nµy!!")
			return
		end
		if BigGetItemCount(0,102,43) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ mua thªm!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh","nhËn",7*24*3600,1)		
	elseif nType == 2 then
		if GetTranslifeFaction() ~= 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Phông Tö míi cã thÓ mua trang søc nµy!!")
			return
		end
		if BigGetItemCount(0,102,42) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ mua thªm!")
				return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh","nhËn",7*24*3600,1)
	elseif nType == 3 then
		if BigGetItemCount(0,102,27) > 0 then
				Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
				return
		end
		ModifyReputation(-1500,1)
		SetTask(336,GetTask(336) - 1500)
		Msg2Player("B¹n bŞ trõ 1500 ®iÓm s­ m«n!")
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh","nhËn",7*24*3600,1)
	end
end

function buy_translife_horse()
	local tSay={	 	
		"Kú L©n Niªn Thó (cÇn 1 Phiªu Vò + 100 vµng)/#confirm_buy_translife_horse(1)",
		"B¹ch Hæ ThÇn Thó (cÇn 1 Phiªu Vò + 1000 vµng)/#confirm_buy_translife_horse(2)",
		"§ãng/closedialog",
	}
	Say("C¸c thó c­ìi:",getn(tSay),tSay)
end

function confirm_buy_translife_horse(nType)
	
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nTransCount < t_translife_horse[nType][3] then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetCash() <  t_translife_horse[nType][4] then
		Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
		return
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bŞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B¹n ph¶i trang bŞ Phiªu Vò míi cã thÓ ®æi ®­îc!")
		return
	end
	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 and Pay(t_translife_horse[nType][4]) == 1 then	
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse[nType][2],t_translife_horse[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)			
		end
		Msg2Player("B¹n nhËn ®­îc 1 "..t_translife_horse[nType][1]..".")		
	end
end

function buy_translife_cloth()
	local tSay={	 	
		"V¨n Sö ngo¹i trang/#confirm_buy_translife_cloth(1)",
		"Thiªn ¢m ngo¹i trang/#confirm_buy_translife_cloth(2)",
		"ThiÕu D­¬ng ngo¹i trang/#confirm_buy_translife_cloth(3)",
		"Tø Linh ViÖt  ngo¹i trang/#confirm_buy_translife_cloth(4)",
		"Tø Linh ngo¹i trang/nothing",
		"§ãng/closedialog",
	}
	Say("C¸c ngo¹i trang:",getn(tSay),tSay)
end


function confirm_buy_translife_cloth(nType)

	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nTransCount < t_translife_cloth[nType][5] then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetItemCount(2,1,30230) < 200 then
		Say("B¹n kh«ng mang theo ®ñ 200 vËt phÈm Xu!",0)
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if DelItem(2,1,30230,200) == 1 then
		for i = 0, 2 do
			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth[nType][4]  + GetBody() - 1, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, 30*24*3600)
			end
		end
		Msg2Player("B¹n nhËn ®­îc "..t_translife_cloth[nType][1])
		WriteLogEx("Ngoai trang chuyen sinh","mua",	1, t_translife_cloth[nType][1])
	end
end

function translife_cloth()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 100 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 100 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 100 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_cs6()
	local nTransCount = GetPlayerRebornParam(0)	--GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_cs7()
	local nTransCount = GetPlayerRebornParam(0)	--GetTranslifeCount()
	if nTransCount < 1 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local tSay = {
		"Kİch ho¹t M·o ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(6)",
		"Kİch ho¹t Th­îng y  ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(7)",
		"Kİch ho¹t H¹ y ngo¹i trang UÈn Linh theo h­íng tu luyÖn (cÇn 800 vµng)/#translife_cloth_confirm(8)",
		"§ãng/closedialog",
	}
	Say("Chän lo¹i ngo¹i trang muèn kİch ho¹t:",getn(tSay),tSay)
end

function translife_cloth_confirm(nType)
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = GetTranslifeCount()
	local nFaction = GetTranslifeFaction()
	if nPhucSinh < 1 then
		if nTransCount < 1 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	end
	if GetLevel() < 79 then
		Say("B¹n ch­a ®ñ ®¼ng cÊp sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetPlayerRebornParam(0) >= 1 then
		if GetCash()  < 8000000 then
			Talk(1,"","B¹n kh«ng cã ®ñ ng©n l­îng.")
			return
		end		
	else
		if GetCash()  < 1000000 then
			Talk(1,"","B¹n kh«ng cã ®ñ ng©n l­îng.")
			return
		end		
	end	
	if gf_Judge_Room_Weight(1, 100, " ") == 0 then				
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(nType)
	local nItemIdx = GetPlayerEquipIndex(nType)
	local nCanAdd = 0
	local nIdex = 0
	if nG == 0 and nD ==0 and nP ==0 then
		Talk(1,"","Ph¶i mÆc ngo¹i trang trªn ng­êi míi cã thÓ kİch ho¹t thuéc tİnh.")
		return
	end
	for i=1, getn(tb_option_cloth) do 
		if tb_option_cloth[i][1] == nG and tb_option_cloth[i][2] == nD and tb_option_cloth[i][3] == nP then
			nCanAdd = 1			
			break
		end
	end	
	if nCanAdd == 0 then
		Talk(1,"","Ngo¹i trang kh«ng phï hîp. ChØ cã thÓ kİch ho¹t B¸t B¸t ngo¹i trang, Linh Lung ngo¹i trang, T­íng Qu©n ngo¹i trang.")
		return
	end
	local nExpireTime = GetItemExpireTime(nItemIdx) or 30*24*3600
	if nExpireTime <= 0 then
	 	nExpireTime =  30*24*3600
	 end
	UnEquipAtPosition(nType)
		--------------------------------------
	if GetPlayerRebornParam(0) == 1 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs6 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,4, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end
	elseif GetPlayerRebornParam(0) == 2 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs7 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,4, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end	
	elseif GetPlayerRebornParam(0) == 3 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs7 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs8_nhanlai[nType_cs7][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,4, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end		
	else
		--------------------------------------	
		if DelItemByIndex(nItemIdx,-1) and Pay(1000000) == 1 then
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,4, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end
		end
	end
end
function TranferTuLinh(nLife)
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","§¹i hiÖp khæng ph¶i lµ ng­êi h÷u duyªn víi bİ kİp Tø Linh Phôc Sinh.")
		return
	end
	local tSay = {}

	tinsert(tSay, 	"Ta muèn nhËn trang bŞ miÔn phİ/get_TranferTuLinh")
	tinsert(tSay, 	"Ta muèn mua trang bŞ/buy_TranferTuLinh")
	if nPhucSinh == 1 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 1 dßng %s Tö/translife_cloth_cs6",tLife_cs6[nLife]))
	elseif nPhucSinh == 2 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 2 dßng %s Tö/translife_cloth_cs7",tLife_cs6[nLife]))
	elseif nPhucSinh == 3 then
		tinsert(tSay, format("Kİch ho¹t chÕ t¹o ngo¹i trang UÈn Linh Phôc Sinh 3 dßng %s Tö/translife_cloth_cs7",tLife_cs6[nLife]))	
	end
	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)	
end

function get_TranferTuLinh()
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","§¹i hiÖp khæng ph¶i lµ ng­êi h÷u duyªn víi bİ kİp Tø Linh Phôc Sinh.")
		return
	end
	local tSay = {}
	if nPhucSinh == 1 then
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang Tø Linh miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs6_get_translife_cloth")
	end
	if nPhucSinh == 2 then
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang ThÊt TŞch miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs7_get_translife_cloth") --new
	end
	if nPhucSinh == 3 then		
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang ¢m Hån miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs8_get_translife_cloth") --new
	end	
	if nPhucSinh == 4 then		
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang Song §¸n miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs9_get_translife_cloth") --new
	end	
	if nPhucSinh == 5 then		
		tinsert(tSay, "Ta muèn nhËn ngo¹i trang Thanh S­¬ng miÔn phİ 120 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 79)/cs10_get_translife_cloth") --new
	end	
--	tinsert(tSay, "Ta muèn nhËn Ngäc Béi Kü N¨ng 30 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 86)/cs6_get_HNHN")		
--	tinsert(tSay, "Ta muèn nhËn KhuÊt Nguyªn Béi 30 ngµy (1 lÇn duy nhÊt + cÇn ®¼ng cÊp 89)/cs6_get_KNB")	
	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)		
end

function buy_TranferTuLinh()
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","§¹i hiÖp khæng ph¶i lµ ng­êi h÷u duyªn víi bİ kİp Tø Linh Phôc Sinh.")
		return
	end
	local tSay = {}
	if nPhucSinh == 5 then
		tinsert(tSay, "N©ng cÊp Thó C­ìi Phôc Sinh 5 (cÇn H¾c Hæ + 1000 vµng)/#buy_horse(6)")	
	end	
	if nPhucSinh == 4 or nPhucSinh == 5 then
		tinsert(tSay, "N©ng cÊp Thó C­ìi Phôc Sinh 4 (cÇn V¨n Sö ThÊt Qu©n KiÕm + 1000 vµng)/#buy_horse(5)")	
	end	
	if nPhucSinh == 3 or nPhucSinh == 4 or nPhucSinh == 5 then
		tinsert(tSay, "N©ng cÊp Ngù KiÕm Phôc Sinh 3 (cÇn ThiÕu D­¬ng ThÊt Tinh KiÕm + 1000 vµng)/#buy_horse(4)")
	end
	if nPhucSinh == 2 or nPhucSinh == 3 or nPhucSinh == 4 or nPhucSinh == 5 then
		tinsert(tSay, "N©ng cÊp Ngù KiÕm Phôc Sinh 2 (cÇn Phiªu Vò + 8 ®¹i ng©n phiÕu)/#buy_horse(3)")
	end	
	tinsert(tSay, "N©ng cÊp Thó C­ìi ThÇn Thó B¹ch Hæ (cÇn Phiªu Vò + 1000 vµng)/#buy_horse(1)")
	tinsert(tSay, "N©ng cÊp Thó C­ìi ThÇn Thó H¾c Hæ (cÇn Phiªu Vò + 1000 vµng)/#buy_horse(2)")	

	if nPhucSinh == 3 then
		tinsert(tSay, "Ta muèn mua ngo¹i trang T­¬ng KiÕm Hu©n 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(8)")
		tinsert(tSay, "Ta muèn mua ngo¹i trang ThiÕu Niªn Du 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(9)")	
	end			
	tinsert(tSay, "Ta muèn mua HËu NghÖ L¹c NhËt Hoµn 1 lÇn (cÇn ®¼ng cÊp 86 + h¹n sö dông 7 ngµy + tu luyÖn theo h­íng Long/Hæ/¦ng Tö)/#cs6_buy_HNHN(1)")
	tinsert(tSay, "Ta muèn mua H»ng Nga HuyÔn ThÇn §¸i 1 lÇn (cÇn ®¼ng cÊp 86 + h¹n sö dông 7 ngµy + tu luyÖn theo h­íng Phông Tö)/#cs6_buy_HNHN(2)")	
--	tinsert(tSay, "Ta muèn mua ngo¹i trang V¨n Sö 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(1)")
--	tinsert(tSay, "Ta muèn mua ngo¹i trang Thiªn ¢m 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(2)")
--	tinsert(tSay, "Ta muèn mua ngo¹i trang ThiÕu D­¬ng 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(3)")
--	tinsert(tSay, "Ta muèn mua ngo¹i trang Tø Linh 30 ngµy (200 xu VËt phÈm + cÇn ®¼ng cÊp 88)/#cs6_buy_translife_cloth(4)")	
	tinsert(tSay, "Ta muèn mua KhuÊt Nguyªn Béi 30 ngµy (1500 danh väng + 1500 s­ m«n + cÇn ®¼ng cÊp 89)/cs6_buy_KNB")
	
	
	tinsert(tSay, "§ãng/closedialog")
	Say("Cæn cæn tr­êng giang ®«ng thÖ thñy. L·ng hoa ®µo tËn anh hïng. ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng ! Long Tö Héi chiªu hiÒn n¹p sÜ, cao thñ gi÷ Long Tö Ên cã thÓ hiÖu lÖnh: ",getn(tSay),tSay)	
end
function cs6_get_translife_cloth()
	local nType = 5
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nTransCount < 179 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	local nNumberPS = GetPlayerRebornParam(0)
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 6","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
--		gf_AddItemEx2(t_translife_uanlinh_cs_ps[nNumberPS][nTypePS][i], " Bé uÈn linh miÔn phİ ", "Bo uan linh 6","nhËn", 30*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")		
	end
--	if DelItem(2,1,30230,200) == 1 then
--		for i = 0, 2 do
--			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth_cs6[nType][4]  + GetBody() - 1, 1, 1)
--			if nOk == 1 then
--				SetItemStatus(nItemIndex, 0, 1)
--				SetItemExpireTime(nItemIndex, 120*24*3600)
--			end
--		end
--		Msg2Player("B¹n nhËn ®­îc "..t_translife_cloth[nType][1])
--		WriteLogEx("Ngoai trang chuyen sinh 6","nhËn",1, "Bé ngo¹i trang miÔn phİ")
--	end
	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end
function cs7_get_translife_cloth()
	local nType = 6
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	
	if nTransCount < 279 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 2 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	local nNumberPS = GetPlayerRebornParam(0)
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 7","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
--		gf_AddItemEx2(t_translife_uanlinh_cs_ps[nNumberPS][nTypePS][i], " Bé uÈn linh miÔn phİ ", "Bo uan linh 7","nhËn", 30*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end
function cs8_get_translife_cloth()
	local nType = 7
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nTransCount < 379 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(TSK_PHUCSINH3_SUPPORT),10)
	if nNhan >= 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nNumberPS = GetPlayerRebornParam(0)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 8","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
--		gf_AddItemEx2(t_translife_uanlinh_cs_ps[nNumberPS][nTypePS][i], " Bé uÈn linh miÔn phİ ", "Bo uan linh 8","nhËn", 30*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_PHUCSINH3_SUPPORT, GetTask(TSK_PHUCSINH3_SUPPORT) + 1)
end
function cs9_get_translife_cloth()
	local nType = 7
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nTransCount < 479 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(TSK_PHUCSINH3_SUPPORT),10)
	if nNhan >= 2 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nNumberPS = GetPlayerRebornParam(0)
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs9[nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 9","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
		gf_AddItemEx2(t_translife_uanlinh_cs_ps[nNumberPS][nTypePS][i], " Bé uÈn linh miÔn phİ ", "Bo uan linh 9","nhËn", 30*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_PHUCSINH3_SUPPORT, GetTask(TSK_PHUCSINH3_SUPPORT) + 1)
end
function cs10_get_translife_cloth()
--	local nType = 7
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nTransCount < 579 then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	local nNhan = mod(GetTask(TSK_PHUCSINH3_SUPPORT),10)
	if nNhan >= 3 then
		Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nNumberPS = GetPlayerRebornParam(0)
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs10[nKieuHinh][i], " Bé ngo¹i trang miÔn phİ ", "Ngoai trang chuyen sinh 10","nhËn", 120*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
		gf_AddItemEx2(t_translife_uanlinh_cs_ps[nNumberPS][nTypePS][i], " Bé uÈn linh miÔn phİ ", "Bo uan linh 9","nhËn", 30*24*3600, "NhËn trang bŞ miÔn phİ thµnh c«ng")
	end

	SetTask(TSK_PHUCSINH3_SUPPORT, GetTask(TSK_PHUCSINH3_SUPPORT) + 1)
end
function buy_horse(nType)
	local nLevel = GetLevel()
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	
	if nTransCount < t_translife_horse_cs6[nType][3] then
		Say("B¹n ch­a ®ñ cÊp sö dông chøc n¨ng nµy!",0)
		return
	end
	if nType == 1 or nType == 2 or nType == 4 or nType == 5 or nType == 6 then
		if GetCash() <  t_translife_horse_cs6[nType][4] then
			Talk(1,"","B¹n ch­a ®ñ ng©n l­îng ®Ó ®æi!")
			return
		end		
	end
	if nType == 3 then
		if GetItemCount(2,1,199) < t_translife_horse_cs6[nType][4] then
			Talk(1,"","B¹n kh«ng mang ®ñ 8 §¹i ng©n phiÕu")
			return
		end
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bŞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nType == 1 or nType == 2 or nType == 3 then
		if nG ~= 0 or nD ~= 105 or nP ~= 15 then
			Talk(1,"","B¹n ph¶i trang bŞ Phiªu Vò míi cã thÓ ®æi ®­îc!")
			return
		end
	elseif nType == 4 then
		if nG ~= 0 or nD ~= 105 or nP ~= 10107 then
			Talk(1,"","B¹n ph¶i trang bŞ ThiÕu D­¬ng ThÊt Tinh KiÕm míi cã thÓ ®æi ®­îc!")
			return
		end
	elseif nType == 5 then
		if nG ~= 0 or nD ~= 105 or nP ~= 10108 then
			Talk(1,"","B¹n ph¶i trang bŞ V¨n Sö ThÊt Qu©n KiÕm míi cã thÓ ®æi ®­îc!")
			return
		end
	elseif nType == 6 then
		if nG ~= 0 or nD ~= 105 or nP ~= 30011 then
			Talk(1,"","B¹n ph¶i trang bŞ H¾c Hæ míi cã thÓ ®æi ®­îc!")
			return
		end	
	end

	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 then	
		if nType == 1 or nType == 2 or nType == 4 or nType == 5 then
			Pay(t_translife_horse_cs6[nType][4])
		elseif nType == 3 then
			DelItem(2,1,199,8)
		end
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse_cs6[nType][2],t_translife_horse_cs6[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
		end
		Msg2Player("B¹n nhËn ®­îc 1 "..t_translife_horse_cs6[nType][1]..".")	
		WriteLogEx("Ngoai trang Chuyen/Phuc sinh","mua",1, t_translife_horse_cs6[nType][1])		
	end
end
function cs6_get_HNHN()
	do return 0 end
	
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(nPhucSinh..GetLevel())
	local nTransCount_check = tonumber(nPhucSinh..86)
	if nTransCount < nTransCount_check then
			Say("B¹n ch­a ®ñ cÊp 86 ®Ó sö dông chøc n¨ng nµy!",0)
			return
	end	
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end	
	if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
		Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
		return
	end	
	local nNhan = floor(GetTask(2685)/10)
	local nCon = mod(GetTask(2685), 10)
	local nTotal = (nNhan + 1) * 10 + nCon	
	if nPhucSinh == 1 then
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end
		SetTask(TSK_CS6_GET1TIME, nTotal)	
	elseif nPhucSinh == 2 then
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end
		SetTask(TSK_CS6_GET1TIME, nTotal)	
	elseif nPhucSinh == 3 then
		nNhan = floor(GetTask(TSK_PHUCSINH3_SUPPORT)/10)
		nCon = mod(GetTask(TSK_PHUCSINH3_SUPPORT), 10)
		nTotal = (nNhan + 1) * 10 + nCon
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		SetTask(TSK_PHUCSINH3_SUPPORT, nTotal)	
	elseif nPhucSinh == 4 then
		nNhan = floor(GetTask(TSK_PHUCSINH3_SUPPORT)/10)
		nCon = mod(GetTask(TSK_PHUCSINH3_SUPPORT), 10)
		nTotal = (nNhan + 1) * 10 + nCon
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		SetTask(TSK_PHUCSINH3_SUPPORT, nTotal)		
	end
	
	if GetPlayerRebornParam(1) == 4 then	
		gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh","nhËn",30*24*3600,1)
	else
		gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh","nhËn",30*24*3600,1)	
	end	
	WriteLogEx("Ngoai trang chuyen sinh","nhËn",1, "HËu NghÖ H»ng Nga")		
end

function cs6_buy_HNHN(nType)
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nTransCount_check = tonumber(nPhucSinh..86)
	if nTransCount < nTransCount_check then
		Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetCash() < 100000 then
		Talk(1,"","B¹n kh«ng ®ñ 10 vµng ®Ó mua trang bŞ nµy!")
		return
	end
	if GetReputation() < 10000 or GetTask(336) < 10000 then
		Talk(1,"","B¹n kh«ng ®ñ 10000 ®iÓm S­ M«n hoÆc 10000 Danh Väng ®Ó mua trang søc nµy!")
		return
	end	
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if nType == 1 then
		if BigGetItemCount(0,102,43) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		if GetPlayerRebornParam(1) == 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Long/Hæ/¦ng Tö míi cã thÓ mua trang søc nµy!")
			return
		end
		if Pay(100000) ~= 1 then
			return 0
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		Msg2Player("B¹n bŞ trõ 700 ®iÓm s­ m«n!")		
		gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"HËu NghÖ L¹c NhËt Hoµn","Chuyen Sinh 6","mua",7*24*3600,1)	
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "HËu NghÖ L¹c NhËt Hoµn")	
	elseif nType == 2 then
		if BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
			return
		end
		if GetPlayerRebornParam(1) ~= 4 then
			Talk(1,"","ChØ cã ng­êi tu luyÖn theo h­íng Phông Tö míi cã thÓ mua trang søc nµy!")
			return
		end
		if Pay(100000) ~= 1 then
			return 0
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		Msg2Player("B¹n bŞ trõ 700 ®iÓm s­ m«n!")	
		gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H»ng Nga NguyÖt Vò §¸i","Chuyen Sinh 6","mua",7*24*3600,1)
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "H»ng Nga NguyÖt Vò §¸i")		
	end
end

function cs6_get_KNB()
	do return 0 end
	
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(nPhucSinh..GetLevel())
	local nTransCount_check = tonumber(nPhucSinh..89)
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if nTransCount < nTransCount_check then
		Say("B¹n ch­a ®ñ cÊp 89 ®Ó sö dông chøc n¨ng nµy!",0)
		return
	end	
	if BigGetItemCount(0,102,27) > 0 then
		Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
		return
	end	
	local nNhan = floor(GetTask(2685)/100)
	local nCon = mod(GetTask(2685), 100)
	local nTotal = (nNhan + 1) * 100 + nCon	
	if nPhucSinh == 1 then
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end			
		SetTask(TSK_CS6_GET1TIME, nTotal)			
	elseif nPhucSinh == 2 then
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)		
	elseif nPhucSinh == 3 then
		nNhan = floor(GetTask(TSK_PHUCSINH3_SUPPORT)/100)
		nCon = mod(GetTask(TSK_PHUCSINH3_SUPPORT), 100)
		nTotal = (nNhan + 1) * 100 + nCon	
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		SetTask(TSK_PHUCSINH3_SUPPORT, nTotal)			
	elseif nPhucSinh == 4 then
		nNhan = floor(GetTask(TSK_PHUCSINH3_SUPPORT)/100)
		nCon = mod(GetTask(TSK_PHUCSINH3_SUPPORT), 100)
		nTotal = (nNhan + 1) * 100 + nCon	
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","§¹i hiÖp ®· nhËn miÔn phİ 1 lÇn råi nªn kh«ng thÓ nhËn ®­îc n÷a !!!!")
			return	
		end	
		SetTask(TSK_PHUCSINH3_SUPPORT, nTotal)					
	end
	gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Phuc Sinh","nhËn",30*24*3600,1)
	Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Béi h¹n sö dông 30 ngµy")
	WriteLogEx("Ngoai trang chuyen sinh 7","nhËn",1, "KhuÊt Nguyªn Béi")		
end

function cs6_buy_KNB()
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if nPhucSinh == 1 then
		if nTransCount < 189 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 289 then
			Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
			return
		end
	end
	if GetReputation() < 1500 or GetTask(336) < 1500 then
		Talk(1,"","B¹n kh«ng ®ñ 1500 ®iÓm S­ M«n hoÆc 1500 Danh Väng ®Ó mua trang søc nµy!")
		return
	end	
	if BigGetItemCount(0,102,27) > 0 then
		Talk(1,"","C¸c h¹ ®· së h÷u trang søc nµy, kh«ng thÓ nhËn thªm!")
		return
	end
	if GetCash() < 100000 then
		Talk(1,"","B¹n kh«ng ®ñ 10 vµng ®Ó mua trang bŞ nµy!")
		return 0
	end
	if Pay(100000) ~= 1 then
		return 0
	end
	ModifyReputation(-1500,1)
	SetTask(336,GetTask(336) - 1500)
	Msg2Player("B¹n bŞ trõ 1500 ®iÓm s­ m«n!")
	gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"KhuÊt Nguyªn Béi","Chuyen Sinh 6","nhËn",30*24*3600,1)	
	Msg2Player("B¹n nhËn ®­îc KhuÊt Nguyªn Béi h¹n sö dông 30 ngµy")
	WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "KhuÊt Nguyªn Béi")		
end

function cs6_buy_translife_cloth(nType)
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nTransCount_check = tonumber(nPhucSinh..88)
	if nTransCount < nTransCount_check then
		Say("B¹n ch­a ®ñ cÊp 88 ®Ó sö dông chøc n¨ng nµy!",0)
		return
	end
	if GetItemCount(2,1,30230) < 200 then
		Say("B¹n kh«ng mang theo ®ñ 200 vËt phÈm Xu!",0)
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if DelItem(2,1,30230,200) == 1 then
		for i = 0, 2 do
			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth_cs6[nType][4]  + GetBody() - 1, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, 30*24*3600)
			end
		end
		Msg2Player("B¹n nhËn ®­îc "..t_translife_cloth_cs6[nType][1])
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, t_translife_cloth_cs6[nType][1])
	end
end

function nothing()
	Say("B¹n ch­a ®ñ ®iÒu kiÖn sö dông chøc n¨ng nµy!",0)
end

function closedialog()
end