--**************************************************************************************************************
-- Global Task
--**************************************************************************************************************
GLB_TSK_SERVER_ID = 1023 -- ServerID
GLB_TASK_NEWRES_SONG = 1024 -- Thêi gian Tèng Nguyªn So¸i kÝch ho¹t x2 Tµi Nguyªn ChiÕn
GLB_TASK_NEWRES_LIAO = 1025 -- Thêi gian Liªu Nguyªn So¸i kÝch ho¹t x2 Tµi Nguyªn ChiÕn
GLB_TASK_SUMMON_SONG = 1034 -- Thêi gian kÝch ho¹t gäi boss phe Tèng
GLB_TASK_SUMMON_LIAO = 1035 -- Thêi gian kÝch ho¹t gäi boss phe Tèng
GLB_TASK_PROMOTION = 1037 --l­u thêi gian khi mua vËt phÈm khuyÕn m·i h»ng ngµy


local nDate = tonumber(date("%y%m%d"))

--- Task translife
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2

--**************************************************************************************************************
-- Temp Task
--**************************************************************************************************************
-- Dù ®o¸n thi ®Êu
--TSK_TMP_SELECT_COUNT = 108 -- Sè ®éi ®· chän
--TSK_TEAM_LIST_1 = 109 -- List team ®· chän 1
--TSK_TEAM_LIST_2 = 110 -- List team ®· chän 2
--TSK_TMP_CHOICE = 117 -- Lo¹i h×nh dù ®o¸n ®· chän

-- Tµi nguyªn chiÕn
TSK_TIME_KICHHOAT_TNC =  2285 --l­u time kÝch ho¹t hç trî ®µo nhanh tµi nguyªn chiÕn
TSK_TMP_NEWRES = 108 -- Thu thËp tµi nguyªn
TSK_TEMP_SONGLIAO_BET = 109 -- Dù ®o¸n Tèng Liªu

TSK_TMP_TRANS_NEILI = 110 -- B¾c §Èu truyÒn c«ng thuËt
TSK_TMP_PRACTICE_NEILI = 117 -- B¾c §Èu d­ìng sinh thuËt
TSK_TMP_NEILI_TYPE_SP = 205 -- Ph©n lo¹i D­ìng Sinh & TruyÒn C«ng ®Æc biÖt

TSK_TMP_BHTA6_VOTE = 118 -- Vote BHTA 5

TSK_TMP_PET_INDEX = 119 -- L­u index cña pet
TSK_TMP_PET_ENEMY_INDEX= 129 -- L­u index pet cña ®èi thñ
TSK_TMP_ENEMY_INDEX= 201 -- L­u index cña ®èi thñ
TSK_TMP_FRUIT_INDEX = 208 -- Mua tr¸i c©y NPC §­êng Minh Thµnh
TSK_TMP_CHUYENDOITRANGBI = 209
--**************************************************************************************************************
-- Task ID
--**************************************************************************************************************
-- TASK BAO HIEM: 2665

-- TASK NEW SERVER
local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
if nServerID == 104 and (nDate >= 160315 and nDate <= 160525) then
    --if nDate >= 151019 and nDate <= 151218 then
    --	TSK_HOATDONGNEWSERVER = 1534
    --	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2157
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
    --	TSK_BONUS_CONLON = 2185
    --else
    --	TSK_HOATDONGNEWSERVER = 2665
    --	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2665
    --	TSK_CONGHIENBANG = 2665
    --	TSK_TOP_LEVEL = 2665
    --	TSK_TOP_AWARD = 2665
    --	TSK_BONUS_CONLON = 2665
end
if nServerID == 128 and (nDate >= 200318 and nDate <= 200518) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 127 and (nDate >= 200101 and nDate <= 200301) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 126 and (nDate >= 191107 and nDate <= 200107) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 125 and (nDate >= 190905 and nDate <= 191105) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 124 and (nDate >= 190711 and nDate <= 190911) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 123 and (nDate >= 190501 and nDate <= 190701) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 122 and (nDate >= 190307 and nDate <= 190507) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 121 and (nDate >= 190101 and nDate <= 190302) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 120 and (nDate >= 181115 and nDate <= 190115) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 119 and (nDate >= 180907 and nDate <= 181109) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 118 and (nDate >= 180713 and nDate <= 180915) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 117 and (nDate >= 180504 and nDate <= 180704) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 116 and (nDate >= 180309 and nDate <= 180511) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 115 and (nDate >= 180101 and nDate <= 180301) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 114 and (nDate >= 171115 and nDate <= 180117) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 113 and (nDate >= 170915 and nDate <= 171117) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 112 and (nDate >= 170712 and nDate <= 170915) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 111 and (nDate >= 170512 and nDate <= 170715) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 110 and (nDate >= 170310 and nDate <= 170512) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 109 and (nDate >= 170101 and nDate <= 170301) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 108 and (nDate >= 161111 and nDate <= 170111) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 106 and (nDate >= 160715 and nDate <= 160919) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 107 and (nDate >= 160805 and nDate <= 161015) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
-- Xãa KhuÊt Nguyªn Béi
--TSK_XOA_KHUATNGUYENBOI = 2188 -- HÕt sö dông --Bit 1: first login; Bit 2: Nhan lai 1 lan mien phi
--TSK_XOA_YEUQUYET = 2188		--ch¹y ®Õn 26/7/2018
-- Kim xµ th¸ng 1
--TSK_KIMXATHANG1 = 2188	-- HÕt sö dông --
--================= Phôc Sinh 3
TSK_PHUCSINH3_SUPPORT =  2715		--1234567890: 0=nhËn ngo¹i trang miÔn phÝ, 9=nhËn Ngäc Béi Kü N¨ng, 8=nhËn KhuÊt Nguyªn Béi
--================= Phôc Sinh 2
--TSK_PHUCSINH2 = 2175	-- ABB
-- A: tr¹ng th¸i nhËn thö th¸ch
-- BB: tæng sè lÇn hoµn thµnh nhiÖm vô
--TSK_PHUCSINH2_COUNT = 2176	-- ABBCDDD
-- A: Sè lÇn hoµn thµnh nv trong ngµy
-- BB: ID nhiÖm vô ®ang nhËn
-- C: tr¹ng th¸i hoµn thµnh nhiÖm vô
-- DDD: bé ®Õm b­íc nhiÖm vô
-- Event trang bÞ Kim Xµ
--TSK_EVENTKIMXA = 2540 -- Expired
TSK_EVENTKIMXA_NHANTHUONG = 2545 -- Expired
--Phôc sinh B¹n §ång Hµnh lÇn 2
TSK_PET_PSLAN2_TASK_1 = 2175 	--a111222333: a (x¸c ®Þnh cã PS); 111 (160 BNN); 222(240 h¹t gièng); 333(320 tø linh)
TSK_PET_PSLAN2_TASK_2 = 2176		--a111222333: a (x¸c ®Þnh nhËn nv PS); 111 (999 ng«i sao); 222 (160 n÷a oa); 333 (600 ph¸o hoa)
-- Event trang bÞ Kim Xµ Liªn Server
--TSK_KIMXA_ALLSERVER_POINT = 2660
--TSK_KIMXA_ALLSERVER_AWARD = 2540

-- Sinh tö v« ng·
--TSK_SINHTUVONGA1 = 2700 -- GAABCCDDD
-- AA: Bé ®Õm phÇn th­ëng 
-- B: Tr¹ng th¸i nhËn hç trî mçi ngµy
-- CC: §iÓm nép mçi ngµy
-- DDD: §iÓm hiÖn cã
--G: x¸c ®Þnh qua nµy reset ®iÓm nép mçi ngµy
--TSK_SINHTUVONGA2 = 2701 -- YYMMDD: ngµy hÕt h¹n
--TSK_SINHTUVONGA3 = 2713 -- AxxxxxxxB; A: tr¹ng th¸i nhËn n.vô; B: nhiÖm vô Cóng TÕ
--TSK_SINHTULAN3A = 2700
--TSK_SINHTULAN3B = 2701
--TSK_SINHTULAN3C = 2713
--TSK_SINHTULAN3A092015 = 2172
--TSK_SINHTULAN3B092015 = 2282
--TSK_SINHTULAN3C092015 = 2430
--nhiÖm vô book15
TSK_Book_CountPoint = 2282			----local nCur_point = TSK_Book_CountPoint ; ®iÓm hiÖn t¹i
TSK_Book_CountMissDaily_1 = 2430	----sè l­îng nhiÖm vô hµng ngµy hoµn thµnh
TSK_Book_CountMissDaily_2 = 2701	----sè l­îng nhiÖm vô hµng ngµy hoµn thµnh
TSK_Book_Lev_Award = 2172	--TSK_Book_Lev_Award = 2172	
--local nCur_Lev_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 2, 1) ; lev s¸ch hiÖn t¹i - l­u trªn task
--local nCur_Award_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 4, 3) ; award s¸ch hiÖn t¹i - l­u trªn task

-- NhiÖm vô ®ång hµnh
TSK_DONGHANH = 2189
-- Byte 1 + Byte2: sè l­îng nhiÖm vô hoµn thµnh; 
-- Byte 3: Lo¹i nhiÖm vô ®ang nhËn; 
-- Bit 25: Tr¹ng th¸i hoµn thµnh nhiÖm vô.
-- Bit 26: Tr¹ng th¸i nhËn th­ëng mçi ngµy
-- Bit 27: Tr¹ng th¸i nhËn th­ëng cuèi
TSK_DONGHANH_COUNT = 2283
-- Byte 1: Sè lÇn nhËn nv ®ång hµnh trong ngµy, reset mçi ngµy
-- Byte 2: Sè lÇn hoµn thµnh cßn l¹i cña nhiÖm vô cã yªu cÇu sè l­îng
-- NhËn hç trî qu©n c«ng
TSK_HOTROQUANCONG = 2284
-- Thu ®æi nguyªn liÖu Qu©n Dông
TSK_THUQUANDUNG = 2187 -- ABCDDE
-- A: PhÇn th­ëng cuèi më réng event
-- B: Sè lÇn nép kem que mçi ngµy
-- C: Sè lÇn nép siro mçi ngµy
-- DD: Sè lÇn nép qu©n dông mçi ngµy
-- E: PhÇn th­ëng cuèi qu©n dông mçi ngµy

-- §æi th­ëng Th¸i H­ HuyÔn C¶nh (daily resset); Byte1: ®æi trang søc; Byte2: ®æi phÇn th­ëng;
TSK_THAIHU_DOITHUONG = 1794
-- 16/4 den 21/4
--TSK_DOINGUYENLIEU = 2743  -- ABBB: A=>0/1: check nhËn th­ëng cuèi; BBB=> sè lÇn ®æi nguyªn liÖu
-- Task nhËn th­ëng CNDSK
--TSK_GIVE_AWARD_CNDSK = 2669
BIT_KARAOKE2011 = 1

-- Task ®æi vËt phÈm event hµng th¸ng
--TSK_GIVE_EVENT_ITEM = 2430	--==> dïng cho nhiÖm vô VBonus 7/2014

-- Task ®¨ng ký Long Hæ Tranh Hïng
--TASK_DANGKY_BHTA9 = 2743			
-- TASK_LHTH = 2283 -- Dïng ®Õn hÕt ngµy 2013-07-03
---- Task nhËn th­ëng Bang Chñ Tinh Anh
--TSK_BANGCHUTINHANH = 2743 -- 1: ®· nhËn; 0: ch­a nhËn

-- Task nép tr¸i c©y nhËn ch©n khÝ
TSK_GETQIBYFRUIT = 2747 -- Byte 1: reset ngµy; Bit 9: nhËn th­ëng nép nhiÒu tr¸i c©y; Bit 10 ®Õn 30: nép mçi lo¹i tr¸i c©y
--Task nhiÖm vô lµm giµu mçi ngµy (ko giíi h¹n thêi gian)						--Task support chuyÓn sinh miÔn phÝ ¦ng Tö vµ Phông Tö							-- Task VBonus: mua vËt phÈm gi¶m gi¸ 
TSK_LAMGIAU = 2693 --bit 1-12
--TSK_DaoRuongCanhTy = 2693	--(06/02/2020 - 13/02/2020)/(21/01/2020 - 27/01/2020)														--TSK_SUPPORT_CHUYENSINH = 2693													
TSK_Type_HHVHtoAMHUYET = 4607 -- chuyen task VNG sang task cuoi cung cua day KS	--sö dông vÞ trÝ thø 6 cho viÖc chän lo¹i trang søc cÇn n©ng cÊp
-- VBonus: §Þnh d¹ng: ABCDmmdd; A, B, C, D: Sè l­îng item ®· mua theo tõng lo¹i; HÕt h¹n 01/8/2013
--TSK_VBONUS_SaleOff = 2282
--TSK_SUPPORT_CHUYENSINH = 2188	--hÕt sö dông
--Bit 1(N÷ oa), 2(Th¸i h­ huyÔn c¶nh), 3(Tµng kiÕm), 4(L­¬ng S¬n), 5(Thñy Lîi), 6(H¹t gièng), 7(B¸t Nh· Nhá), 8(B¸t Nh· Lín), 9(C©y Tø Linh), 10(Nh¹n M«n Rùc Löa), 11(ghÐp Tµng R­¬ng), 12(tr¹ng th¸i nhËn nhiÖm vô), 13(trang th¸i nhËn th­ëng)
-- ChuyÓn sinh
TRANSLIFE_MISSION_ID = 1537
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2
TRANSLIFE_BYTE_FLAG_LEVEL = 3
TRANSLIFE_BYTE_SAVE_LEVEL = 4
--- ChuyÓn sinh 5
-- 80 TMT , 45 LSB , 69 C©y Tø Linh
TRANSLIFE_TASK_5_1 = 2677
-- N÷ Oa B¶o H¹p , §¸nh dÊu tiªu diÖt L·nh H­¬ng L¨ng
TRANSLIFE_TASK_5_2 = 2678

TRANSLIFE_TASK_34 = 2279 -- NhiÖm vô chuyÓn sinh 3,4
-- §¸nh dÊu sè lÇn hoµn thµnh theo hÖ sè 10
TRANSLIFE_TASK_34_FLAG = 2542
TRANSLIFE_BYTE_TASK1 = 1 -- Tµi nguyªn chiÕn
TRANSLIFE_BYTE_TASK2 = 2 -- H¹t gièng
TRANSLIFE_BYTE_TASK3 = 3 -- B¸t nh· nhá
TRANSLIFE_BYTE_TASK4 = 4 -- B¸t nh· lín

TSK_SETQC_NEWSERVER = 2158

TSK_SERVER_ID = 2280 -- §Þnh danh Server ID cho role
TSK_SERVER_ID_CUR = 1
TSK_SERVER_ID_NEW = 2
TSK_SERVER_ID_JUNGONG = 3
TSK_SERVER_ID_TIME = 2281

-- Bang héi tinh anh 
TSK_BHTA6_6E8 = 2665
TSK_BHTA6_2E8 = 2666
TSK_BHTA6_WEEKLYAWARD = 2667
TASK_BHTA6 = 2668
BYTE_BHTA6_GET_TALK = 1
BYTE_BHTA6_GET_TOP10 = 2
TASKID_JYBHZ_USE_HONGBAO = 2702
TASKID_JYBHZ_GET_HONGBAO = 2703

-- Task nhËn th­ëng trång C©y Tø Linh
TSK_AWARD_4SOUL = 2183
TSK_AWARD_4SOUL_DATE = 2182

-- Task sö dông tr¸i c©y
TSK_USEFRUIT_DATE = 2184
TSK_USEFRUIT_EXP = 2177
TSK_USEFRUIT_FLAG_1 = 2178
TSK_USEFRUIT_FLAG_2 = 2179
TSK_USEFRUIT_FLAG_3 = 2180
TSK_USEFRUIT_FLAG_4 = 2181

-- Task ®Òn bï qu©n c«ng
TSK_JUNGONG_PUNISH = 2152
TSK_JUNGONG_PUNISH_DATE = 2153
TSK_JUNGONG_LIMIT = 2155

-- Ng«i Sao May M¾n
TSK_LUCKY_STAR_201011 = 2661

-- Trøng ngÉu nhiªn
--TSK_RANDOMIZE_EGG = 2172

-- Ph¸o hoa CNDSK
FIREWORK_CNDSK_USE = 2493
FIREWORK_CNDSK_TIME = 2494

-- NV STD
KH_QUEST_TSK = 1533
FIREWORK_IDOL_USE = 2495
FIREWORK_IDOL_TIME = 2496

-- §Òn bï qu©n c«ng
--TSK_SET_QUANCONG = 2660

-- Valentine 2011
--TSK_VALENTINE_GET_FLAG_2011 = 2662
--TSK_VALENTINE_USE_FLAG_2011 = 2663
--TSK_VALENTINE_USED_EXP_2011 = 2664
TRIGGER_USER_DEFINE_VALENTINE_2011 = 2517
TRIGGER_TB_DEFINE_VALENTINE_2011 = 1506

-- B¹n §ång Hµnh
TASK_VNG_PET = 2560 -- 2 sè ®Çu l­u cÊp cña pet, c¸c sè sau l­u ®iÓm n©ng cÊp
TASK_VNG_PET_QUEST = 2561 -- Cã chøa ngµy th¸ng ®Ó reset task cña pet
TASK_VNG_PET_TIME = 2562
TASK_VNG_PET_GODPOINT = 1535 -- 2 sè ®Çu l­u sè lÇn hoµn thµnh nhiÖm vô linh lùc, c¸c sè sau l­u ®iÓm linh lùc
TASK_VNG_PET_INFO = 1536 -- L­u sè lÇn nhiÖm vô train pet,  l­u giíi tÝnh pet,  l­u lo¹i pet
BYTE_PET_INFO_TRAIN = 1
BYTE_PET_INFO_SEX = 2
BYTE_PET_INFO_TYPE = 3
TASK_PET_TRAIN_TIME = 1541

TASK_ROSE_WAR = 2157

-- Vâ L©m B¶o H¹p
TSK_VLBH_EXP = 2744		--old: 2674
-- L­u th¸ng reset  th¸ng tuÇn 
TSK_VLBH_MARK = 2745		--old: 2672
-- L­u thêi gian gi·n c¸ch
TSK_VLBH_TIME = 2673
--L­u ®iÓm ch©n khÝ
TSK_VLBH_QI = 2729
--L­u ®iÓm c«ng tr¹ng
TSK_VLBH_QUANCONG = 2756
--Sè lÇn nhËn VLBH trong ngµy & tuÇn
TSK_VLBH_Qty = 2730 -- ®Þnh d¹ng: xxxyyy; xxx: sè lÇn nhËn trong tuÇn; yyy: sè lÇn nhËn trong ngµy
-- L­u thêi gian gi·n c¸ch 2
TSK_VLBH_TIME2 = 2732

-- Niªn thó T12/2010
TSK_NIENTHU20101201_TIME = 2175
TSK_NIENTHU20101201_INFO = 2176

-- B¹n §ång Hµnh chiÕn ®Êu
TASK_PET_FIGHT = 1542 -- Sè ®Çu l­u kÕt qu¶ trËn ®Êu, c¸c sè cßn l¹i l­u index cê thi ®Êu

-- B¹n §ång Hµnh v­ît Th¸i H­
TSK_PET_TAIXU_DATE = 2173  -- Sè ®Çu tiªn chøa tr¹ng th¸i pet trong Th¸i H­, sè thø 2 ghi sè lÇn tham gia miÔn phÝ, sè thø 3 ghi sè lÇn tham gia tr¶ phÝ, 6 ch÷ sè tiÕp theo ghi ngµy th¸ng n¨m tham gia
TSK_PET_TAIXU_POINT = 2174 -- Sè thø 1 tíi thø 3 chøa tÇng lín nhÊt,®· v­ît qua, c¸c sè cßn l¹i chøa ®iÓm v­ît ¶i
TSK_PET_TAIXU_INFO = 2177
-- §¸nh dÊu 
TSK_THAIHU_DAY = 2706

-- Bo sung event thang 8/2010
--EVENT201009_GIVE_CAKE = 2430
--VET_201009_01_TASK_FLAG = 2429
--VET_201009_01_BIT_LIMIT = 1
--VET_201009_01_BIT_METHOD = 2
--VET_201009_01_BIT_METHOD_CONFIRM = 3
--VET_201009_01_BYTE_TYPE = 2
--VET_1000_THANGLONG_TIME = 2428

-- Tµi Nguyªn ChiÕn
TSK_TRANS_POINT_ALLOW = 2711 --l­u gi¸ trÞ b¶o l­u, ko cho phÐp tham gia chiÕn tr­êng
TSK_NEWRES_CALC_DAILY = 2712 -- l­u gi¸ trÞ ®· ®¸nh gi¸ qu©n hµm ®Ó tham gia TNC hµng ngµy
TSK_GET_THUOC_TIME = 2663 --l­u gi¸ trÞ reset ngµy cña lÊy thuèc vµ kick ho¹t x2
TSK_GET_THUOC = 2662 -- LÊy sè cuèi l­u l¹i viÖc ®· nhËn thuèc
TSK_NEWRES_DATE = 2148 -- Thêi gian nhËn nhiÖm vô
TSK_NEWRES_POINT = 2149 -- Sè ®iÓm tÝch lòy ®­îc
TSK_NEWRES_FINISH = 2161 -- Flag hoµn thµnh nhiÖm vô
BYTE_NEWRES_STATE = 1 -- Tr¹ng th¸i cña nhiÖm vô 0: ko cã nhiÖm vô, 1: ®· nhËn nhiÖm vô, 2: ®· hoµn thµnh nhiÖm vô
BYTE_NEWRES_DONE = 2 -- Sè lÇn hoµn thµnh nhiÖm vô trong ngµy
BYTE_NEWRES_DOUBLE_EXP = 3 -- Sè lÇn kÝch ho¹t x2 exp trong ngµy, chØ dµnh cho Nguyªn So¸i

TSK_GET_DHTN = 2164	--TSK_SONGLIAO_BET_1 = 2164 -- Dù ®o¸n Tèng Liªu ®ît 1
TSK_GIVE_DHTN = 2165	--TSK_SONGLIAO_BET_2 = 2165 -- Dù ®o¸n Tèng Liªu ®ît 2

TSK_GET_NEILI_EXP = 2166 -- B¾c §Èu TruyÒn C«ng - nhËn
TSK_GIVE_NEILI_EXP = 2167 -- B¾c §Èu TruyÒn C«ng - cho

TSK_GET_NEILI_EXP_SP = 2679 -- B¾c §Èu TruyÒn C«ng §Æc BiÖt - nhËn
TSK_GIVE_NEILI_EXP_SP = 2680 -- B¾c §Èu TruyÒn C«ng §Æc BiÖt - cho

TSK_PRATICE_NEILI_EXP_TYPE_1 = 2168 -- B¾c §Èu D­ìng Sinh - lo¹i 1
TSK_PRATICE_NEILI_EXP_TYPE_2 = 2169 -- B¾c §Èu D­ìng Sinh - lo¹i 2
TSK_PRATICE_NEILI_EXP_TYPE_3 = 2170 -- B¾c §Èu D­ìng Sinh - lo¹i 3
TSK_PRATICE_NEILI_EXP_TYPE_4 = 2171 -- B¾c §Èu D­ìng Sinh - lo¹i 4

TSK_PRATICE_NEILI_EXP_TYPE_1_SP = 2681 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 1
TSK_PRATICE_NEILI_EXP_TYPE_2_SP = 2682 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 2
TSK_PRATICE_NEILI_EXP_TYPE_3_SP = 2683 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 3
TSK_PRATICE_NEILI_EXP_TYPE_4_SP = 2684 -- B¾c §Èu D­ìng Sinh §Æc BiÖt  - lo¹i 4

TSK_GOLDEN_CARD_CREATE_TIME = 2185
TSK_MASTER_SKILL = 2186

TSK_BUY_GOLDEN_CARD = 2435

-- Task sö dông T©n M·o §¹i Hång Bao
TSK_DAHONGBAO_201101 = 2429
TSK_DAHONGBAO_201101_TIME = 2428

-- Task promotion CSM 5.0
TSK_AWARD_CSM5 = 2670
TSK_AWARD_CSM5_ACTIVE_TIME = 2671
-- Task Quay sè may m¾n
TSK_LUCKY_DRAW = 2705
--TASK_DELL_TUYETCAU = 2668
-- §æi qu©n c«ng huy hoµng b»ng TiÒn LÎ
--TASK_LIMIT_JUNGONG = 2276


--TSK_SELECT_TYPE = 2148 -- Check tõng bit xem ®· dù ®o¸n kÕt qu¶ nµo
--TSK_SILVER_WIN = 2149 -- Sè TiÒn LÎ tÝch lòy ®­îc
--TSK_LIST_16_1 = 2161 -- List 16 ®éi 1
--TSK_LIST_16_2 = 2162 -- List 16 ®éi 2
--TSK_LIST_8_1 = 2163 -- List 8 ®éi 1
--TSK_LIST_8_2 = 2164 -- List 8 ®éi 1

-- Task ghi l¹i sè tiÒn ®· c­îc cho tõng lo¹i h×nh
--TSK_SILVER_BET_1 = 2165
--TSK_SILVER_BET_2 = 2166
--TSK_SILVER_BET_3 = 2167
--TSK_SILVER_BET_4 = 2168
--TSK_SILVER_BET_5 = 2169
--TSK_SILVER_BET_6 = 2170
--TSK_SILVER_BET_7 = 2171
--TSK_SILVER_BET_8 = 2172

-- Task ghi l¹i ®éi ®· chän
--TSK_BET_01 = 2173
--TSK_BET_02 = 2174
--TSK_BET_03 = 2175
--TSK_BET_04 = 2176
--TSK_BET_05 = 2177
--TSK_BET_06 = 2178
--TSK_BET_07 = 2179
--TSK_BET_08 = 2180
--TSK_BET_09 = 2181
--TSK_BET_10 = 2182
--TSK_BET_11 = 2183
--TSK_BET_12 = 2184
--TSK_BET_13 = 2185
--TSK_BET_14 = 2186
--TSK_BET_15 = 2187

--TSK_SILVER_2_EXP = 2188

-- Vinh danh t­íng sÜ
TSK_GLORY = 2277
BYTE_GLORY_DATE =1 -- Ngµy nhËn th­ëng
BYTE_GLORY_COUNT = 2 -- Sè lÇn nhËn th­ëng

-- Thµnh Chñ ®æi hång bao
--TSK_EXCHANGE_HONGBAO = 2278
--BYTE_EXCHANGE_HONGBAO_DATE = 1
--BYTE_EXCHANGE_HONGBAO_SMALL = 2
--BYTE_EXCHANGE_HONGBAO_BIG = 3

-- §æi §Þnh Hån t¹i D¹ Th¶o
--TSK_EXCHANGE_DING7 = 2430

-------------------------------
-- Sè lÇn sö dông bã hoa chiÕn th¾ng trong ho¹t ®éng karaoke
TSK_KARAOKE = 2665
-- Tasktemp l­u nType ng­êi b×nh ®­îc b×nh chän
-- Task Temp l­u lev cña item khi n©ng cÊp Tö quang Viªm §Õ
TSK_TEMP_TQVD = 202
--TSK_KARAOKETEMP =202 

--Sè lÇn sö dông b¸nh trung thu trong ho¹t ®éng  B×nh chän s¸ng t¸c truyÖn tranh
TSK_TRUYENTRANH = 2665

-- L­u tr¹ng th¸i kÝch ho¹t HKLB cña ng­êi ch¬i
TSK_HKLB_FLAG =  2431
BYTE_HKLB_STATUS = 1
BYTE_HKLB_LEVELAWARD = 2

--  Task nhËn th­ëng hµng ngµy
TSK_HKLB_DAILYAWARD =  2434

--  Task nhËn th­ëng ngµy vµng
--TSK_HKLB_GOLDENDAYAWARD = 2538

--  Task ®æi item Cöa hµng Vâ L©m TiÒn Bèi
TSK_HKLB_POINT = 1534
--TSK_HKLB_EXCHANGE = 2539
--TSK_HKLB_REWARD = 2540

-- Task kÝch ho¹t Vâ L©m ChiÕn H÷u
TSK_HKLB_VLCH = 2187

-- Task l­u sè lÇn më r­¬ng trong tÇn l¨ng
--TSK_HKLB_OPENPBOX = 2671

--- Task sè lÇn ®æi kem trong ngµy Even th¸ng 7 
--TKS_KSOCOLA_TIMES = 2675
--  §¸nh dÊu reset ®iÓm qu©n c«ng khi chuyÓn Server
TSK_CHANGE_SERVER = 2676

-- Task ®Òn bï ngµy 30-9-2011
--TSK_DENBU_20110930 = 2700
-- TSK_BKL_BONUS = 2700
-- Task ®Òn bï ngµy 30-9-2011 lÇn 2
--TSK_DENBU2_20110930 = 2701
--TSK_TRAOGIAI_CS1_20120404 = 2701

-- Task trång hoa
--TSK_TRONGHOA = 2704
-- Task l­u ngµy vµ sè lÇn ®æi mËt tÞch trong ngµy
--TSK_MATTICH_HIGHT = 2707
TSK_MATTICH_HIGHT_NEW = 2710
TSK_MATTICH_HIGHT_CHOOSE = 2708
TSK_XOAITEM = 2709

---------------------------------------------------------
-- L­u tr¹ng th¸i kÝch ho¹t BKLB cña ng­êi ch¬i
TSK_BKLB_FLAG =  2714
BYTE_BKLB_BOX = 1
BYTE_BKLB_LEVELAWARD = 2

--  Task nhËn th­ëng hµng ngµy
--TSK_BKLB_DAILYAWARD =  2715

--  Task nhËn th­ëng ngµy vµng
TSK_BKLB_GOLDENDAYAWARD = 2716

--  Task ®æi item Cöa hµng Vâ L©m TiÒn Bèi
TSK_BKLB_POINT = 2717
TSK_BKLB_EXCHANGE = 2718
TSK_BKLB_REWARD = 2719

-- Task kÝch ho¹t Vâ L©m ChiÕn H÷u
TSK_BKLB_VLCH = 2721
-- Task kick ho¹t BKLB + task count
TSK_BKLB_ACTIVE = 2722
TSK_BKLB_COUNT = 2723
TSK_BKLB_START = 2724
--Task xoa trung task HKLB
--TSK_BKLB_HAVETASK = 2725
-- Task ®æi ®iÓm ch©n khÝ h»ng ngµy
TSK_CHANGE_CHANKHI = 2726
-- Task ®¸nh dÊu ®· nép N÷ Oa khi lµm nhiÖm vô Th­¬ng Héi
TSK_CHECK_BAOHAP = 2735
--Task l­u gi¸ trÞ reset ngµy cña B×nh Thiªn H¹
TSK_RESET_DATE = 2736
--Task l­u gi¸ trÞ nhËn item cña B×nh Thiªn H¹
TSK_BTH_EXCHANGE = 2737
--Task l­u gi¸ trÞ nhËn th­ëng Tèng Liªu
TSK_TL_AWARD = 2741
TSK_TL_DATE = 2742
--Task reset mçi ngµy
TSK_EVERY_DATE = 2738
--Task l­u gi¸ trÞ kick ho¹t VIP cña Thá N­íng + Ph¸o Hoa
--TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739		--TSK_ACTIVE_VIP_THONUONG = 2739
TSK_NHIEMVUTHANG4 = 2740		 --TSK_ACTIVE_VIP_PHAOHOA = 2740
--TSK_COUNT_EVERYDAY = 2746
--Chuçi nhiÖm vô ChuyÓn Sinh §¬n
TSK_CSD_COUNT_A = 2753		--300 nv s­ m«n (x) - 30 lÇn th¸i h­ (y) - 81 tµi nguyªn chiÕn (z) - 30 lÇn L­¬ng S¬n (w)		- wwzzyyxxx
TSK_CSD_COUNT_B = 2749		--300 h¹t gièng (x) - 33 lÇn TrÞ An (y) - 33 lÇn Thñy l¬i (z)			- zzyyxxx
TSK_CSD_COUNT_C = 2750		--181 B¸t nh· nhá (x) - 99 b¸t nh· to (y) - 99 c©y tø linh (z)		- zzyyxxx
TSK_CSD_ALLOW = 2751
TSK_CSD = 2752	--®¸nh dÊu ®· nhËn item csd
--Chuçi nhiÖm vô M¶nh Thiªn Th¹ch
TSK_MTT_COUNT = 2754		--150 h¹t gièng (x) - 10 Cóng TÕ (y)	- 10 lÇn Thñy Lîi (z) - 1 nhËn nhiÖm vô (w)- 1 nhËn th­ëng (b)	- bwzzyyxxx
TSK_EVERY_WEEK = 2755	--2 sè cuèi l­u sè tuÇn
--Chuçi nhiÖm vô ChuyÓn Sinh 6
TSK_CS6_COUNTA = 2757	--30 Cóng tÕ (x) - 30 TrÞ An (y) - 150 B¸t nh· nhá (z) - 150 H¹t gièng (w)		- wwwzzzyyxx
TSK_CS6_COUNTB = 2758	--30 Thñy lîi (x) - 30 LuyÖn §¬n (y) - 150 Tø Linh (z) - 160 Ng«i Sao May M¾n (w)		- wwwzzzyyxx
TSK_CS6_COUNTC = 2759	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)		- zzyyxx
TSK_CS6_GET1TIME = 2685		--nhËn item 1 lÇn duy nhÊt sau khi chuyÓn sinh -- 3sè cuèi, 4 sè tiÕp ghi sè N÷ oa
TSK_CS6_TULINH = 2687		--nhËn vµ lµm tiÕp nhiÖm vô chuyÓn sinh 6
TSK_CS6_DaoQuy_XoaQuy = 2688	--AAAABBBB:  AAAA: sè l­îng TiÓu Lam §ao Quû; BBBB: sè l­îng TiÓu Lam Xoa Quû
TSK_CS6_SaMac_TamBao = 2692	-- AAAABBBB: AAAA: sè l­îng Sa M¹c Hµnh Nh©n; BBBB: sè l­îng TÇm B¶o Nh©n
TSK_CS6_KiemTien_DichTien = 2690	-- AAAABBBB: AAAA: sè l­îng KiÕm Tiªn Tö; BBBB: sè l­îng §Þch Tiªn Tö
TSK_CS6_LiLong_HoaHo = 2691	-- AAAABBBB: AAAA: sè l­îng LiÖt Nhan Li Long; BBBB: sè l­îng XÝch LuyÖn Háa Hå
---------------------------------------------------------
-- L­u tr¹ng th¸i ®iÓm may m¾n cña ng­êi ch¬i
TSK_EVENT_PHU_MOI_THANG =  2698
--TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739	
--BYTE_POINT_LUCKY = 1
--BYTE_ACCEPT_LUCKY = 2
--BYTE_TIME_VM =3
-----------------------------------------------------------
TSK_PET_PS_GIAIDOAN_A = 2538	--xxxFFFcddg: x = 160 c©y tø linh, F = 160 c©y b¸t nh· nhá, c = h­íng Phôc Sinh, dd = sè lÇn phôc sinh, g = .....
TSK_PET_PS_GIAIDOAN_B = 2539	--aabbccddeg: g = (1,2,3) chuçi nhiÖm vô), e = x¸c ®Þnh cã PET Phôc Sinh, dd = 30 lÇn Cóng TÕ, cc = 30 lÇn TrÞ An, bb = 30 lÇn Thñy Lîi, aa = 3 lÇn luyÖn ®¬n
---------------------------------------------------------
EXT_POINT_CLTV = 5	--ChÝ T«n V­¬ng LÖnh
--TSK_CTVL_START = 2664  --khai b¸o Task
TSK_CTVL_ALL = 2665		--khai b¸o task: 0987654321: 1:kÝch ho¹t CTVL;	2: ®· x©y dùng bang trong tuÇn	3: ®· nhËn th­ëng BHCT trong tuÇn		4: nhËn th­ëng tæ ®éi trong ngµy		65: check lev nhËn th­ëng PS0 	7: nhËn trang bÞ HN	8: kich ho¹t Bang héi ChÝ T«n		9: nhËn th­ëng PS1 90	0: nhËn th­ëng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: bé ®Õm b­íc nhiÖm vô	4: tr¹ng th¸i hoµn thµnh nhiÖm vô		65: l­u ID nhiÖm vô mçi ngµy ®ang thùc hiÖn	7: sè lÇn hoµn thµnh nhiÖm vô trong ngµy		8: tr¹ng th¸i nhËn thö th¸ch		9: nhËn th­ëng mçi ngµy cña old server

------TASK HAY SU DUNG------
--TSK_CUOCCHIENHOAHONG = 2733	--Task cuéc chiÕn hoa hång (23/04/2015 - 26/04/2015)
--TSK_DUATOPSERVERCANHAN = 2733 --Task §ua top bang héi liªn server (Byte 1,2)(21/01/2015 - 28/02/2015)
--TSK_DENBU_HOAPHUNG = 2733	-- Task ®Òn bï server Háa Phông (byte 3 vµ 4) (24/10/2014 - 5/12/2014)
--TSK_QUAYSOMAYMAN = 2733	-- Task quay sè may m¾n n¨m míi (5/1/2015)
--TSK_NHIEMVUCDKEY = 2540 --Task nhËn th­ëng mçi ngµy nhiÖm vô PVP CD KEY (Byte 1)
--TSK_DUDOAN_BHTA12 = 2540 -- Task dù ®o¸n BHTA12 (05/11/2014 - 28/11/2014) (Byte 2, 3) --hÕt sö dông
--TSK_BAORUONG_TAINGUYEN = 2540	--Task thµnh chñ nhËn th­ëng 25 b¶o r­¬ng (Byte 2)	--hÕt sö dông
--TSK_HOTROKCL = 2540		--Task hç trî nhËn th­ëng KCL (28/1/2015 - 29/1/2015)	(Byte 4)
--TSK_NHIEMVUTRONGCAY = 2540	--Task nhiÖm vô trång c©y (25/4/2015 - 1/5/2015)	(Byte 1,2,3,4)
--TSK_DENBU_TIENPHUNG = 2704  --Task ®Òn bï c«ng tr¹ng Tiªn Phông ngµy 25/04/2015
--TSK_EVENTTHANG8 = 2704	--Task event phô th¸ng 8/2015. hÕt h¹n ngµy 28/08/2015
--TSK_EVENTTHANG9 = 2704	--Task event ngµy 2 th¸ng 9 n¨m 2015, hÕt h¹n ngµy 2/9/2015
--TSK_XOA_TRANGBI_AMHON = 2704	--Task xãa trang bÞ ¢m Hån, hÕt h¹n ngµy 20/9/2015
--TSK_KINHMACH_THANG9 = 2704	--Task event phô Kinh m¹ch ®ång nh©n th¸ng 9 n¨m 2015, hÕt h¹n ngµy 30/9/2015
--TSK_EVENTTHANG9 = 2540	--Task event phô th¸ng 9 n¨m 2015, hÕt h¹n ngµy 30/9/2015
--TSK_KIMXA092015 = 2733	--Task event ®æi trang bÞ kim xµ th¸ng 9 n¨m 2015, hÕt h¹n ngµy 11/10/2015
--TSK_EVENT_NIEMVUI = 2704	--Task event ngµy 2 th¸ng 9 n¨m 2015, hÕt h¹n ngµy 8/10/2015
--TSK_MATTICH_TIEUDAO = 2540	--Task event phô th¸ng 9 n¨m 2015, hÕt h¹n ngµy 30/10/2015 (vÞ trÝ 1,2 : event mËt tÞch tiªu dao)
--TSK_MATTICH_TIEUDAO = 2540	--Task event phô th¸ng 11 n¨m 2015, hÕt h¹n ngµy 30/11/2015 (vÞ trÝ 3,4,5 : event mËt tÞch trao tay) ********
--TSK_MATTICH_TIEUDAO = 2540	--nhËn ®Òn bï chiÕn tr­êng(hÕt h¹n ngµy 20/11/2015, vÞ trÝ thø 7), Task event phô Hallowen, hÕt h¹n ngµy 30/10/2015 (vÞ trÝ 6,7 : event Hallowen)
--TSK_EVENT_CUONGHOAPHU = 2704	--Task event ®æi c­êng hãa phï, hÕt h¹n ngµy 06/11/2015
--TSK_EVENTCHINH_MORONG = 2733	--Bit 1,2,3,4 sö dông nhËn phÇn th­ëng cuèi 
TSK_EVENTCHINH_MORONG = 2540	--Bit 1,2,3,4 sö dông nhËn phÇn th­ëng cuèi 
TSK_VANGDANHTHIENHA_DUATOP = 2733	--A0002 Bit 1,2,3 (th¨ng cÊp t¹i m¸y chñ míi) ; Bit: 4,5,6,7,8 (phÇn th­ëng th¨ng cÊp Minh Gi¸o); Bit: 9,10 (nhËn th­ëng top bang héi: thµnh viªn, bang chñ); Bit: 11 (®¨ng ký nhËn th­ëng top 3 Minh Gi¸o)
TSK_TT_VANGDANHTHIENHA_DUATOP = 2666	--Th¨ng tiÕn t¹i m¸y chñ míi
--TSK_EVENT_112015 = 2704	--event ®æi linh th¹ch(sö dông vÞ trÞ 3-8, hÕt h¹n ngµy 27/11/2015);  event ®æi ®iÓm ch©n khÝ(sö dông vÞ trÝ 1,2 - hÕt h¹n ngµy 30/11/2015)
TSK_DOIVATBAU = 2704 	--A0004--vÞ trÝ 1-8: l­u ®iÓm tÝch lòy ®æi vËt b¸u ngµy 14/2/2017 - 21/02/2017
--TSK_TRAOTHUONG_BHTA15 = 2739 --trao th­ëng BHTA 15 ngµy 22-23/6/2016
--TSK_CUOCCHIENHOAHONG = 2739 --A0001; b×nh chän BHTA21 ngµy 10-15/05/2019;b×nh chän BHTA17 ngµy 11-15/05/2017;  b×nh chän BHTA16 ngµy 27-20/10/2016
--TSK_TRAOTHUONG_BHTA15 = 2739 --A0004 nhËn danh hiÖu 22/4 --A0003 trao th­ëng BHTA 16 ngµy 07-07/12/2016
TSK_HOTRO_QUANCONG = 2739 --A0005: nhËn hç trî qu©n c«ng all server
--§¨ng ký chuyÓn server
--TSK_ChuyenServer = 2739	--më 1 ngµy 15/05/2019
-------------------
--Event online nhËn th­ëng TÕt 2019 (01/02/2019-14/02/2019)--Event online nhËn th­ëng TÕt 2018 (13/02/2018-23/02/2018)
--TSK_Award_2018 = 2739 -- set date online nhËn th­ëng 2020 --A0006: set date online nhËn th­ëng 022018 
TSK_GET_THIETTINH = 2660 --task nhËn thiÕt tinh khi gia nhËp c«n l«n kiÕm 7/2018 (sö dông lu«n)
--TSK_CUONGHOA_VANSUC = 2188	--Ch¹y ®Õn 31/10/2019
-------------------
TSK_CHOOSE_CHOICE = 2664 --task dïng ®Ó ®¸nh dÊu dßng chän ®· chän
--TSK_NOEL_DIEUDUONG = 2725	--event Noel ®æi diÖu d­¬ng
------------------
--TSK_GIAPNGO_1 = 2725	--event ®µo r­¬ng gi¸p ngä: H: nhËn th­ëng kÝch ho¹t CDPB, gggg: sè lÇn kÝch ho¹t ChiÕu D¹ Ph¸p B¶o, Y: nhËn th­ëng kÝch ho¹t TABB, xxxx: sè lÇn kÝch ho¹t TuyÖt Anh BÝ B¶o
--TSK_GIAPNGO_2 = 2666	-- E: nhËn th­ëng cuèi khi ®· nhËn th­ëng 3 lo¹i trªn; H: nhËn th­ëng kÝch ho¹t XTCV, gggg: sè lÇn kÝch ho¹t xich Thè Cæ VËt
--===========Th¨ng TiÕn Phôc Sinh ======
TSK_THANGTIEN_PHUCSINH = 2725	--0987654321: 1:nhËn nv-hoµn thµnh nv; 32:tæng ®iÓm tÝch lòy; 54:®iÓm ®æi trong ngµy; 6:sè lÇn tham gia Th¸i H­; 7: sè lÇn tham gia thá n­íng; 8: sè lÇn tham gia Tèng Liªu; 9: x¸c ®Þnh reset qua ngµy
--=========== TÝch lòy online ==========
IP_ONLINE_TIME = 2536
IP_TIME_START = 2537
--task mua b¸nh ®Æc chÕ (sö dông 2 vÞ trÝ ®Çu)
TSK_BUY_BANHDACCHE = 2743
--=================================
--========= TAI XUAT GIANG HO =======
if nDate >= 140221 and nDate <= 140320 then
    TSK_TAIXUAT_FLAG = 2162
    TSK_TAIXUAT_MISSION1 = 2163
    TSK_TAIXUAT_MISSION2 = 2666
else
    TSK_TAIXUAT_FLAG = 2665
    TSK_TAIXUAT_MISSION1 = 2665
    TSK_TAIXUAT_MISSION2 = 2665
end
--================ 123 Pay ==========
--TSK_123PAY1 = 2664
--TSK_123PAY2 = 2675
--================= NhiÖm vô ®æi trang bÞ Thiªn Chi - B¹ch Kim Viªm §Õ ==============
TSK_TC_BK_VD = 2707		--0987654321: 1-nhËn nv vd2tcvd; 2-nhËn nv tcvd2bkvd
--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
--================= nhiÖm vô VBonus 7/2014
--TSK_nvVBonus = 2430		--==> dïng cho nhiÖm vô VBonus 7/2014
-- funtion reset task t¹i playerloginin.lua
--task trèng: 2664, 2675