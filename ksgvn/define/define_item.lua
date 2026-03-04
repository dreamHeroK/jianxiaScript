Import("\\script\\ksgvn\\constants.lua")

BOOK_PHU_LUC_MIN = 2
BOOK_PHU_LUC_MAX = 4

TUIQUA_DAILY_MAX = 100
TUIQUA_WEEKEND_NUM_BONUS = 1
TUIQUA_WEEKEND_LIMIT_RATE = 2
TUIQUA_VIP_BONUS_RATE = 1.25

g_tbFaction_LenhBaiSuMon = {
    [ROUTE_THIEULAM] = 205,
    [FACTION_VODANG] = 206,
    [FACTION_NGAMI] = 207,
    [FACTION_CAIBANG] = 208,
    [FACTION_DUONGMON] = 209,
    [FACTION_DUONGGIA] = 350,
    [FACTION_NGUDOC] = 390,
    [FACTION_CONLON] = 50000,
    [FACTION_MINHGIAO] = 50001,
    [FACTION_THUYYEN] = 50002,
}

g_tbFactionBook_Basic = {
    [ROUTE_THIEULAM_DAO] = 1,
    [ROUTE_THIEULAM_QUYEN] = 3, -- TLD
    [ROUTE_THIEULAM_TRUONG] = 5, -- TLT
    [ROUTE_DUONGMON_AMKHI] = 7, -- DM
    [ROUTE_NGAMI_KIEM] = 9, -- NMK
    [ROUTE_NGAMI_DAN] = 11, -- NMD
    [ROUTE_CAIBANG_QUYEN] = 13, -- CBQ
    [ROUTE_CAIBANG_BONG] = 15, -- CBB
    [ROUTE_VODANG_KIEM] = 17, -- VDK
    [ROUTE_VODANG_BUT] = 19, -- VDB
    [ROUTE_DUONGGIA_THUONG] = 21, -- DGT
    [ROUTE_DUONGGIA_CUNG] = 23, -- DGC
    [ROUTE_NGUDOC_HIEP] = 25, -- Hiep Doc
    [ROUTE_NGUDOC_TA] = 27, -- Ta Doc
    [ROUTE_CONLON_THIENSU] = 180, -- Con lon thien su
    [ROUTE_MINHGIAO_THANHCHIEN] = 182, -- Mg thanh chien
    [ROUTE_MINHGIAO_TRANBINH] = 184, -- Mg Tran Binh
    [ROUTE_MINHGIAO_HUYETNHAN] = 186, -- Mg Huyet nhan
    [ROUTE_THUYYEN_VUTIEN] = 188, -- Thuy Yen Vu Tien
    [ROUTE_THUYYEN_LINHNU] = 190, -- Thuy Yen Linh Nu
    [ROUTE_DUONGMON_NHAMHIEP] = 228, --  nham hiep
    [ROUTE_CONLON_KIEMTON] = 232, -- kiem ton
}

g_tbFactionBook_Advanced = {
    [ROUTE_THIEULAM_DAO] = 166,
    [ROUTE_THIEULAM_QUYEN] = 167, -- TLD
    [ROUTE_THIEULAM_TRUONG] = 168, -- TLT
    [ROUTE_DUONGMON_AMKHI] = 169, -- DM
    [ROUTE_NGAMI_KIEM] = 170, -- NMK
    [ROUTE_NGAMI_DAN] = 171, -- NMD
    [ROUTE_CAIBANG_QUYEN] = 172, -- CBQ
    [ROUTE_CAIBANG_BONG] = 173, -- CBB
    [ROUTE_VODANG_KIEM] = 174, -- VDK
    [ROUTE_VODANG_BUT] = 175, -- VDB
    [ROUTE_DUONGGIA_THUONG] = 176, -- DGT
    [ROUTE_DUONGGIA_CUNG] = 177, -- DGC
    [ROUTE_NGUDOC_HIEP] = 178, -- Hiep Doc
    [ROUTE_NGUDOC_TA] = 179, -- Ta Doc
    [ROUTE_CONLON_THIENSU] = 198, -- Con lon thien su
    [ROUTE_MINHGIAO_THANHCHIEN] = 199, -- Mg thanh chien
    [ROUTE_MINHGIAO_TRANBINH] = 200, -- Mg Tran Binh
    [ROUTE_MINHGIAO_HUYETNHAN] = 201, -- Mg Huyet nhan
    [ROUTE_THUYYEN_VUTIEN] = 202, -- Thuy Yen Vu Tien
    [ROUTE_THUYYEN_LINHNU] = 203, -- Thuy Yen Linh Nu
    [ROUTE_DUONGMON_NHAMHIEP] = 230, -- Nham hiep
    [ROUTE_CONLON_KIEMTON] = 234, -- kiem ton
}

g_tbFactionBook_High = {
    [ROUTE_THIEULAM_DAO] = 204,
    [ROUTE_THIEULAM_QUYEN] = 205, -- TLD
    [ROUTE_THIEULAM_TRUONG] = 206, -- TLT
    [ROUTE_DUONGMON_AMKHI] = 207, -- DM
    [ROUTE_NGAMI_KIEM] = 208, -- NMK
    [ROUTE_NGAMI_DAN] = 209, -- NMD
    [ROUTE_CAIBANG_QUYEN] = 210, -- CBQ
    [ROUTE_CAIBANG_BONG] = 211, -- CBB
    [ROUTE_VODANG_KIEM] = 212, -- VDK
    [ROUTE_VODANG_BUT] = 213, -- VDB
    [ROUTE_DUONGGIA_THUONG] = 214, -- DGT
    [ROUTE_DUONGGIA_CUNG] = 215, -- DGC
    [ROUTE_NGUDOC_HIEP] = 216, -- Hiep Doc
    [ROUTE_NGUDOC_TA] = 217, -- Ta Doc
    [ROUTE_CONLON_THIENSU] = 218, -- Con lon thien su
    [ROUTE_MINHGIAO_THANHCHIEN] = 219, -- Mg thanh chien
    [ROUTE_MINHGIAO_TRANBINH] = 220, -- Mg Tran Binh
    [ROUTE_MINHGIAO_HUYETNHAN] = 221, -- Mg Huyet nhan
    [ROUTE_THUYYEN_VUTIEN] = 222, -- Thuy Yen Vu Tien
    [ROUTE_THUYYEN_LINHNU] = 223, -- Thuy Yen Linh Nu
    [ROUTE_DUONGMON_NHAMHIEP] = 231, -- Nham hiep
    [ROUTE_CONLON_KIEMTON] = 235, -- kiem ton
}

g_tbFactionBook_High_VIP = {
    [ROUTE_THIEULAM_DAO] = 30001,
    [ROUTE_THIEULAM_QUYEN] = 30002, -- TLD
    [ROUTE_THIEULAM_TRUONG] = 30003, -- TLT
    [ROUTE_DUONGMON_AMKHI] = 30004, -- DM
    [ROUTE_NGAMI_KIEM] = 30005, -- NMK
    [ROUTE_NGAMI_DAN] = 30006, -- NMD
    [ROUTE_CAIBANG_QUYEN] = 30007, -- CBQ
    [ROUTE_CAIBANG_BONG] = 30008, -- CBB
    [ROUTE_VODANG_KIEM] = 30009, -- VDK
    [ROUTE_VODANG_BUT] = 30010, -- VDB
    [ROUTE_DUONGGIA_THUONG] = 30011, -- DGT
    [ROUTE_DUONGGIA_CUNG] = 30012, -- DGC
    [ROUTE_NGUDOC_HIEP] = 30013, -- Hiep Doc
    [ROUTE_NGUDOC_TA] = 30014, -- Ta Doc
    [ROUTE_CONLON_THIENSU] = 30015, -- Con lon thien su
    [ROUTE_MINHGIAO_THANHCHIEN] = 30035, -- Mg thanh chien
    [ROUTE_MINHGIAO_TRANBINH] = 30036, -- Mg Tran Binh
    [ROUTE_MINHGIAO_HUYETNHAN] = 30037, -- Mg Huyet nhan
    [ROUTE_THUYYEN_VUTIEN] = 30016, -- Thuy Yen Vu Tien
    [ROUTE_THUYYEN_LINHNU] = 30017, -- Thuy Yen Linh Nu
    [ROUTE_DUONGMON_NHAMHIEP] = 30041, -- Nham hiep
    [ROUTE_CONLON_KIEMTON] = 30043, -- kiem ton
}


g_tbFactionBook_Super = {
    [ROUTE_THIEULAM_DAO] = 30018,
    [ROUTE_THIEULAM_QUYEN] = 30019, -- TLD
    [ROUTE_THIEULAM_TRUONG] = 30020, -- TLT
    [ROUTE_DUONGMON_AMKHI] = 30021, -- DM
    [ROUTE_NGAMI_KIEM] = 30022, -- NMK
    [ROUTE_NGAMI_DAN] = 30023, -- NMD
    [ROUTE_CAIBANG_QUYEN] = 30024, -- CBQ
    [ROUTE_CAIBANG_BONG] = 30025, -- CBB
    [ROUTE_VODANG_KIEM] = 30026, -- VDK
    [ROUTE_VODANG_BUT] = 30027, -- VDB
    [ROUTE_DUONGGIA_THUONG] = 30028, -- DGT
    [ROUTE_DUONGGIA_CUNG] = 30029, -- DGC
    [ROUTE_NGUDOC_HIEP] = 30030, -- Hiep Doc
    [ROUTE_NGUDOC_TA] = 30031, -- Ta Doc
    [ROUTE_CONLON_THIENSU] = 30032, -- Con lon thien su
    [ROUTE_THUYYEN_VUTIEN] = 30033, -- Thuy Yen Vu Tien
    [ROUTE_THUYYEN_LINHNU] = 30034, -- Thuy Yen Linh Nu
    [ROUTE_MINHGIAO_THANHCHIEN] = 30038, -- Mg thanh chien
    [ROUTE_MINHGIAO_TRANBINH] = 30039, -- Mg Tran Binh
    [ROUTE_MINHGIAO_HUYETNHAN] = 30040, -- Mg Huyet nhan
    [ROUTE_DUONGMON_NHAMHIEP] = 30042, -- nham hiep
    [ROUTE_CONLON_KIEMTON] = 30044, -- kiem ton
}

g_tbFactionBook_Secret = {
    [ROUTE_THIEULAM_DAO] = 30045,
    [ROUTE_THIEULAM_QUYEN] = 30046, -- TLD
    [ROUTE_THIEULAM_TRUONG] = 30047, -- TLT
    [ROUTE_DUONGMON_AMKHI] = 30048, -- DM
    [ROUTE_NGAMI_KIEM] = 30049, -- NMK
    [ROUTE_NGAMI_DAN] = 30050, -- NMD
    [ROUTE_CAIBANG_QUYEN] = 30051, -- CBQ
    [ROUTE_CAIBANG_BONG] = 30052, -- CBB
    [ROUTE_VODANG_KIEM] = 30053, -- VDK
    [ROUTE_VODANG_BUT] = 30054, -- VDB
    [ROUTE_DUONGGIA_THUONG] = 30055, -- DGT
    [ROUTE_DUONGGIA_CUNG] = 30056, -- DGC
    [ROUTE_NGUDOC_HIEP] = 30057, -- Hiep Doc
    [ROUTE_NGUDOC_TA] = 30058, -- Ta Doc
    [ROUTE_CONLON_THIENSU] = 30059, -- Con lon thien su
    [ROUTE_THUYYEN_VUTIEN] = 30060, -- Thuy Yen Vu Tien
    [ROUTE_THUYYEN_LINHNU] = 30061, -- Thuy Yen Linh Nu
    [ROUTE_MINHGIAO_THANHCHIEN] = 30062, -- Mg thanh chien
    [ROUTE_MINHGIAO_TRANBINH] = 30063, -- Mg Tran Binh
    [ROUTE_MINHGIAO_HUYETNHAN] = 30064, -- Mg Huyet nhan
    [ROUTE_DUONGMON_NHAMHIEP] = 30065, -- nham hiep
    [ROUTE_CONLON_KIEMTON] = 30066, -- kiem ton
}

g_tbFactionBook_Master = { -- trÊn ph¸i
    [ROUTE_THIEULAM_DAO] = 101,
    [ROUTE_THIEULAM_QUYEN] = 102,
    [ROUTE_THIEULAM_TRUONG] = 103,
    [ROUTE_DUONGMON_AMKHI] = 104,
    [ROUTE_NGAMI_KIEM] = 105,
    [ROUTE_NGAMI_DAN] = 106,
    [ROUTE_CAIBANG_QUYEN] = 107,
    [ROUTE_CAIBANG_BONG] = 108,
    [ROUTE_VODANG_KIEM] = 109,
    [ROUTE_VODANG_BUT] = 110,
    [ROUTE_DUONGGIA_THUONG] = 111,
    [ROUTE_DUONGGIA_CUNG] = 112,
    [ROUTE_NGUDOC_HIEP] = 113,
    [ROUTE_NGUDOC_TA] = 114,
    [ROUTE_CONLON_THIENSU] = 192,
    [ROUTE_MINHGIAO_THANHCHIEN] = 193,
    [ROUTE_MINHGIAO_TRANBINH] = 194,
    [ROUTE_MINHGIAO_HUYETNHAN] = 195,
    [ROUTE_THUYYEN_VUTIEN] = 196,
    [ROUTE_THUYYEN_LINHNU] = 197,
    [ROUTE_DUONGMON_NHAMHIEP] = 236,
    [ROUTE_CONLON_KIEMTON] = 237,
}

g_tbEquipSet_DieuDuong = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 3128, nWeaponId = 8992 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 3132, nWeaponId = 8994 },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 3130, nWeaponId = 8993 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 3134, nWeaponId = 8995 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 3138, nWeaponId = 8996 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 3140, nWeaponId = 8997 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 3142, nWeaponId = 8998 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 3146, nWeaponId = 8999 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 3150, nWeaponId = 9000 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 3154, nWeaponId = 9001 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 3158, nWeaponId = 9002 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 3162, nWeaponId = 9003 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 3166, nWeaponId = 9004 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 3170, nWeaponId = 9005 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 3174, nWeaponId = 9006 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 3176, nWeaponId = 9007 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 3180, nWeaponId = 9008 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 3184, nWeaponId = 9009 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 3188, nWeaponId = 9010 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 3190, nWeaponId = 9011 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 32117, nWeaponId = 32118 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 32121, nWeaponId = 32117 },
}

g_tbEquipSet_ChienCuong = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 30143, nWeaponId = 30143 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 30147, nWeaponId = 30147 },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 30145, nWeaponId = 30145 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 30149, nWeaponId = 30149 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 30153, nWeaponId = 30153 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 30155, nWeaponId = 30155 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 30157, nWeaponId = 30157 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 30161, nWeaponId = 30161 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 30165, nWeaponId = 30165 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 30169, nWeaponId = 30169 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 30173, nWeaponId = 30173 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 30177, nWeaponId = 30177 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 30181, nWeaponId = 30181 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 30185, nWeaponId = 30185 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 30189, nWeaponId = 30189 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 30191, nWeaponId = 30191 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 30195, nWeaponId = 30195 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 30199, nWeaponId = 30199 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 30203, nWeaponId = 30203 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 30205, nWeaponId = 30205 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 32169, nWeaponId = 32217 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 32170, nWeaponId = 32218 },
}
g_tbEquipSet_LietVu = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 22270, nWeaponId = 22270, nRingStartId = 8092 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 22272, nWeaponId = 22272, nRingStartId = 8094  },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 30145, nWeaponId = 30145, nRingStartId = 8094 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 30149, nWeaponId = 30149, nRingStartId = 8094 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 30153, nWeaponId = 30153, nRingStartId = 8094 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 30155, nWeaponId = 30155, nRingStartId = 8094 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 30157, nWeaponId = 30157, nRingStartId = 8094 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 30161, nWeaponId = 30161, nRingStartId = 8094 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 30165, nWeaponId = 30165, nRingStartId = 8094 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 30169, nWeaponId = 30169, nRingStartId = 8094 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 30173, nWeaponId = 30173, nRingStartId = 8094 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 30177, nWeaponId = 30177, nRingStartId = 8094 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 30181, nWeaponId = 30181, nRingStartId = 8094 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 30185, nWeaponId = 30185, nRingStartId = 8094 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 30189, nWeaponId = 30189, nRingStartId = 8094 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 30191, nWeaponId = 30191, nRingStartId = 8094 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 30195, nWeaponId = 30195, nRingStartId = 8094 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 30199, nWeaponId = 30199, nRingStartId = 8094 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 30203, nWeaponId = 30203, nRingStartId = 8094 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 30205, nWeaponId = 30205, nRingStartId = 8094 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 32169, nWeaponId = 32217, nRingStartId = 8094 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 32170, nWeaponId = 32218, nRingStartId = 8094 },
}

g_tbYeuQuyet_Basic = {
    [ROUTE_THIEULAM_DAO] = { 1, 10 },
    [ROUTE_THIEULAM_TRUONG] = { 21, 31 },
    [ROUTE_THIEULAM_QUYEN] = { 11, 20 },
    [ROUTE_DUONGMON_AMKHI] = { 32, 46 },
    [ROUTE_NGAMI_KIEM] = { 47, 59 },
    [ROUTE_NGAMI_DAN] = { 60, 70 },
    [ROUTE_CAIBANG_QUYEN] = { 71, 79 },
    [ROUTE_CAIBANG_BONG] = { 80, 88 },
    [ROUTE_VODANG_KIEM] = { 89, 108 },
    [ROUTE_VODANG_BUT] = { 109, 119 },
    [ROUTE_DUONGGIA_THUONG] = { 120, 130 },
    [ROUTE_DUONGGIA_CUNG] = { 131, 141 },
    [ROUTE_NGUDOC_HIEP] = { 142, 154 },
    [ROUTE_NGUDOC_TA] = { 155, 168 },
    [ROUTE_CONLON_THIENSU] = { 169, 182 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { 183, 194 },
    [ROUTE_MINHGIAO_TRANBINH] = { 195, 206 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { 207, 218 },
    [ROUTE_THUYYEN_VUTIEN] = { 219, 229 },
    [ROUTE_THUYYEN_LINHNU] = { 230, 240 },
    [ROUTE_DUONGMON_NHAMHIEP] = { 382, 391 },
    [ROUTE_CONLON_KIEMTON] = { 392, 402 },
}

KIMXA_TYPE_KHANGTATCA = 0
KIMXA_TYPE_NGOAICONG = 1
KIMXA_TYPE_NOICONG = 2

g_tbKimXaCfg = {
    [4] = {
        [KIMXA_TYPE_KHANGTATCA] = "Du HiÖp (Kh¸ng tÊt c¶)",
        [KIMXA_TYPE_NGOAICONG] = "ThiÕt HuyÕt (Ngo¹i c«ng)",
        [DAME_TYPE_NOICONG] = "V©n Du (Néi c«ng)",
    },
    [5] = {
        [KIMXA_TYPE_KHANGTATCA] = "HiÖp Cèt (Kh¸ng tÊt c¶)",
        [KIMXA_TYPE_NGOAICONG] = "Qñy Phï (Ngo¹i c«ng)",
        [DAME_TYPE_NOICONG] = "§»ng V©n (Néi c«ng)",
    },
    [6] = {
        [KIMXA_TYPE_KHANGTATCA] = "Hoan Linh (Kh¸ng tÊt c¶)",
        [KIMXA_TYPE_NGOAICONG] = "§»ng Giao (Ngo¹i c«ng)",
        [DAME_TYPE_NOICONG] = "Khëi Ph­îng (Néi c«ng)",
    },
    [7] = {
        [KIMXA_TYPE_KHANGTATCA] = "S¸t Lang (Kh¸ng tÊt c¶)",
        [KIMXA_TYPE_NGOAICONG] = "NhuÖ Nha (Ngo¹i c«ng)",
        [DAME_TYPE_NOICONG] = "Méng S¸t (Néi c«ng)",
    },
}

ITEMPACK_TYPE_ORN = "fashion_orn"
ITEMPACK_TYPE_ORN_CLOTH = "fashion_orn_cloth"
ITEMPACK_TYPE_HORSE = "fashion_horse"
ITEMPACK_TYPE_COAT = "fashion_coat"
ITEMPACK_TYPE_ITEM = "item"

g_tbItemPackCfg = {
    [PackItemId(2, 1, 50018)] = {
        tbIds = { 387, 391, 395, 399, 403, 407, 411, 415, 419, 423, 427, 431 },
        szType = ITEMPACK_TYPE_ORN,
    },
    [PackItemId(2, 1, 50019)] = {
        tbIds = { 211, 212, 213, 214, 215, 216, 217, 218, },
        szType = ITEMPACK_TYPE_HORSE,
    },
    [PackItemId(2, 1, 50020)] = { -- Tói Háa Phông Linh
        tbItem = {
            { tbProp = { 2, 1, 30769 }, nStack = 1, nRate = 90 },
            { tbProp = { 2, 1, 30769 }, nStack = 2, nRate = 9 },
            { tbProp = { 2, 1, 30769 }, nStack = 3, nRate = 1 },
        },
        szType = ITEMPACK_TYPE_ITEM,
    },

    [PackItemId(2, 1, 50268)] = { nId = 1105, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50269)] = { nId = 1109, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50270)] = { nId = 1113, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50271)] = { nId = 1117, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50272)] = { nId = 1121, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50273)] = { nId = 1125, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50274)] = { nId = 1129, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50275)] = { nId = 1133, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50276)] = { nId = 1137, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50277)] = { nId = 1141, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50278)] = { nId = 1145, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50279)] = { nId = 1149, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50280)] = { nId = 1153, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50281)] = { nId = 1157, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50282)] = { nId = 1161, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50283)] = { nId = 1165, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50284)] = { nId = 1169, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50285)] = { nId = 1173, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50286)] = { nId = 1177, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50287)] = { nId = 1181, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50288)] = { nId = 1185, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50289)] = { nId = 1189, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50290)] = { nId = 1193, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50291)] = { nId = 1197, szType = ITEMPACK_TYPE_COAT, },
    [PackItemId(2, 1, 50292)] = { nId = 1201, szType = ITEMPACK_TYPE_COAT, },

    [PackItemId(2, 1, 50293)] = { nId = 375, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50294)] = { nId = 387, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50295)] = { nId = 391, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50296)] = { nId = 395, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50297)] = { nId = 399, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50298)] = { nId = 403, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50299)] = { nId = 407, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50300)] = { nId = 411, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50301)] = { nId = 415, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50302)] = { nId = 419, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50303)] = { nId = 423, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50304)] = { nId = 427, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50305)] = { nId = 431, szType = ITEMPACK_TYPE_ORN, },

    [PackItemId(2, 1, 50306)] = { nId = 267, szType = ITEMPACK_TYPE_ORN_CLOTH, }, -- T­¬ng Nhu DÜ M¹t
    [PackItemId(2, 1, 50307)] = { nId = 435, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50308)] = { nId = 439, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50309)] = { nId = 443, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50310)] = { nId = 327, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50311)] = { nId = 331, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50312)] = { nId = 335, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50313)] = { nId = 339, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50314)] = { nId = 343, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50315)] = { nId = 347, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50316)] = { nId = 351, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50317)] = { nId = 355, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50318)] = { nId = 359, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50319)] = { nId = 363, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50320)] = { nId = 367, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50321)] = { nId = 371, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50322)] = { nId = 379, szType = ITEMPACK_TYPE_ORN_CLOTH, },
    [PackItemId(2, 1, 50323)] = { nId = 447, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50324)] = { nId = 451, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50325)] = { nId = 455, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50326)] = { nId = 459, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50327)] = { nId = 463, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50328)] = { nId = 467, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50329)] = { nId = 471, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50330)] = { nId = 475, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50331)] = { nId = 479, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50332)] = { nId = 483, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50333)] = { nId = 487, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50334)] = { nId = 491, szType = ITEMPACK_TYPE_ORN, },
    [PackItemId(2, 1, 50335)] = { nId = 495, szType = ITEMPACK_TYPE_ORN, },
}

g_tbKinhNghiemDonCfg = {
    [PackItemId(2, 1, 50250)] = 100e6,
    [PackItemId(2, 1, 50251)] = 500e6,
    [PackItemId(2, 1, 50252)] = 1e9,
    [PackItemId(2, 1, 50253)] = 2e9,
}
