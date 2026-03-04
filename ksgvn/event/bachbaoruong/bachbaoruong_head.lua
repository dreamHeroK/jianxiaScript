Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong_award.lua")

MAX_OPEN_BOX_COUNT = 5000

g_szNpcName = g_szNpcName or "<color=yellow>B¸ch B¶o R­¬ng: <color>"

_g_tbExchangeBox = {
    [1] = {
        szDesc = "Sö dông 666 xu ®Ó më r­¬ng",
        tbCondition = {
            tbItems = {
                { szName = "Xu", tbProp = { 2, 1, 30230 }, nCount = 666 }
            },
        }
    },
    [2] = {
        szDesc = "Sö dông 1288 vµng ®Ó më r­¬ng",
        tbCondition = {
            nGold = 1288
        }
    },
}

_g_tbBoxPos = {
    { 304, 1532, 2892 },
    { 304, 1543, 2897 },
    { 304, 1533, 2913 },
    { 304, 1540, 2998 },
    { 304, 1551, 2997 },
    { 304, 1551, 3014 },
    { 304, 1541, 3015 },
    { 304, 1505, 2980 },
    { 304, 1494, 2980 },
    { 304, 1493, 2994 },
    { 108, 1416, 3159 },
    { 108, 1429, 3166 },
    { 108, 1420, 3179 },
    { 108, 1500, 3155 },
    { 108, 1508, 3146 },
    { 108, 1510, 3162 },
    { 108, 1489, 2961 },
    { 108, 1500, 2974 },
    { 108, 1487, 2979 },
    { 108, 1491, 2971 },
}
_g_tbBoxPosLocal = {
    { 350, 1394, 2977 },
    { 350, 1434, 2935 },
    { 100, 1477, 2908 },
    { 100, 1393, 2917 },
    { 200, 1413, 2835 },
    { 200, 1303, 2766 },
    { 300, 1813, 3559 },
    { 300, 1700, 3460 },
    { 500, 1690, 3100 },
    { 500, 1758, 3111 },
    { 150, 1654, 3111 },
    { 150, 1659, 3143 },
    { 400, 1471, 3053 },
    { 400, 1551, 2942 },
}

BOX_AWARD_EXP = 300e6

_g_tbBoxAward = {
    { nExp = 300e6, nRate = 4 },
    { nExp = 200e6, nRate = 5 },
    { nExp = 150e6, nRate = 12 },
    { nExp = 100e6, nRate = 12 },
    { tbProp = { 2, 1, 9977 }, nStatus = 1, nStack = 1, nExpiredTime = 7 * 24 * 3600, nRate = 4 }, -- Qu©n c«ng huy hoµng
    { tbProp = { 2, 1, 9977 }, nStatus = 1, nStack = 2, nExpiredTime = 7 * 24 * 3600, nRate = 1 },
    { tbProp = { 2, 1, 31119 }, nStatus = 1, nStack = 1, nRate = 1 }, -- §«n Hoµng Hæ Ph¸ch
    { tbProp = { 2, 1, 31121 }, nStatus = 1, nStack = 1, nRate = 1 }, -- §«n Hoµng M· N·o
    { tbProp = { 2, 1, 31120 }, nStatus = 1, nStack = 1, nRate = 1 }, -- §«n Hoµng HuyÒn Tinh
    { tbProp = { 2, 1, 31000 }, nStatus = 1, nStack = 1, nRate = 5 }, -- Tói ®¸ quý cÊp 3
    { tbProp = { 2, 1, 31001 }, nStatus = 1, nStack = 1, nRate = 2 }, -- Tói ®¸ quý cÊp 4
    { tbProp = { 2, 1, 31024 }, nStatus = 1, nStack = 1, nRate = 1 }, -- Tói ®¸ quý cÊp 5
    { tbProp = { 2, 1, 31123 }, nStatus = 1, nStack = 1, nRate = 0.5 }, -- Bao ®¸ quý cÊp 6
    { tbProp = { 2, 1, 31256 }, nStatus = 1, nStack = 1, nRate = 0.15, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Th«n nguyÖt lÖnh
    { tbProp = { 2, 1, 31400 }, nStatus = 1, nStack = 1, nRate = 0.005, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Tói trang bÞ dµnh riªng Kx7
    { tbProp = { 2, 1, 31307 }, nStatus = 1, nStack = 1, nRate = 0.01, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Chiªu Yªu Kú
    { tbProp = { 2, 102, 222 }, nStatus = 1, nStack = 1, nRate = 1.5 }, -- Th­¬ng H¶i Di Ch©u 4
    { tbProp = { 2, 102, 223 }, nStatus = 1, nStack = 1, nRate = 0.75 }, -- Th­¬ng H¶i Di Ch©u 5
    { tbProp = { 2, 102, 224 }, nStatus = 1, nStack = 1, nRate = 0.25 }, -- Th­¬ng H¶i Di Ch©u 6
    { tbProp = { 2, 102, 225 }, nStatus = 1, nStack = 1, nRate = 0.07, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Th­¬ng H¶i Di Ch©u 7
    { nFunc = "BbrAward:RandomVanSuc(2)", nRate = 0.5 }, -- Kh¾c b¶n hoµn mü cÊp 2
    { tbProp = { 2, 1, 30974 }, nStatus = 1, nStack = 1, nRate = 0.7 }, -- Ngäc Béi Hµo HiÖp V« H¹
    { tbProp = { 2, 1, 31317 }, nStatus = 1, nStack = 1, nRate = 0.075, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- LÖnh Bµi Trang Søc S¸t Tinh
    { tbProp = { 2, 1, 31316 }, nStatus = 1, nStack = 1, nRate = 0.025, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- LÖnh Bµi Vò KhÝ S¸t Tinh
    { tbProp = { 2, 1, 50020 }, nStatus = 1, nStack = 1, nRate = 0.7, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Tói Háa Phông Linh
    { tbProp = { 2, 1, 50265 }, nStatus = 1, nStack = 1, nRate = 0.025 }, -- ThÎ Täa Kþ TruyÒn ThuyÕt
    {  tbProp = { 2, 97, 379 }, nStatus = 1, nStack = 1, nRate = 0.5 }, -- Tinh DiÖu
    {  tbProp = { 2, 97, 378 }, nStatus = 1, nStack = 1, nRate = 0.2 }, -- NguyÖt Hån
    { nFunc = "BbrAward:SuperFactionBook()", nRate = 1 },
    { nFunc = "BbrAward:GiveRandomWeapon(7)", nRate = 10 }, -- Vò khÝ cÊp 76 ngÉu nhiªn
    { nFunc = "BbrAward:GiveRandomWeapon(8)", nRate = 10 }, -- Vò khÝ cÊp 86 ngÉu nhiªn
    { nFunc = "BbrAward:GiveRandomWeapon(9)", nRate = 17 }, -- Vò khÝ cÊp 96 ngÉu nhiªn
    { nFunc = "BbrAward:VKAmHuyet()", nRate = 0.04 }, -- Vò khÝ Èm HuyÕt
    { nFunc = "BbrAward:GiveRandomBookPet(6)", nRate = 7 }, -- S¸ch kü n¨ng thó nu«i Level 6 ngÉu nhiªn
}

_g_tbAccumulateAward = {
    [100] = {
        { tbProp = { 2, 97, 379 }, nStatus = 1, nStack = 20 }, -- Tinh DiÖu
    },
    [200] = {
        { tbProp = { 2, 97, 379 }, nStatus = 1, nStack = 30 }, -- Tinh DiÖu
    },
    [500] = {
        { tbProp = { 2, 102, 224 }, nStatus = 1, nStack = 2 }, -- Th­¬ng H¶i Di Ch©u 6
        { tbProp = { 2, 97, 379 }, nStatus = 1, nStack = 50 }, -- Tinh DiÖu
    },
    [1000] = {
        { tbProp = { 2, 102, 224 }, nStatus = 1, nStack = 4 }, -- Th­¬ng H¶i Di Ch©u 6
        { tbProp = { 2, 97, 379 }, nStatus = 1, nStack = 100 }, -- Tinh DiÖu
    },
    [1500] = {
        { tbProp = { 2, 102, 225 }, nStatus = 1, nStack = 1, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Th­¬ng H¶i Di Ch©u 7
        { tbProp = { 2, 97, 378 }, nStatus = 1, nStack = 20 }, -- NguyÖt Hån
    },
    [2000] = {
        { tbProp = { 2, 102, 225 }, nStatus = 1, nStack = 2, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Th­¬ng H¶i Di Ch©u 7
        { tbProp = { 2, 97, 378 }, nStatus = 1, nStack = 30 }, -- NguyÖt Hån
    },
    [5000] = {
        { tbProp = { 2, 102, 225 }, nStatus = 1, nStack = 5, nQuality = "%s ®· nhËn ®­îc %d %s tõ B¸ch B¶o R­¬ng" }, -- Th­¬ng H¶i Di Ch©u 7
        { tbProp = { 2, 97, 378 }, nStatus = 1, nStack = 50 }, -- NguyÖt Hån
    },
}

_g_tbWeapon = {
    [WEAPON_TYPE_BAOTAY] = 14,
    [WEAPON_TYPE_CHAM] = 53,
    [WEAPON_TYPE_KIEM] = 36,
    [WEAPON_TYPE_DAO] = 64,
    [WEAPON_TYPE_CUNG] = 119,
    [WEAPON_TYPE_CON] = 40,
    [WEAPON_TYPE_THUONG] = 108,
    [WEAPON_TYPE_SONGDAO] = 12,
    [WEAPON_TYPE_TRUONG] = 97,
    [WEAPON_TYPE_BUT] = 86,
    [WEAPON_TYPE_DAN] = 75,
    [WEAPON_TYPE_TRAO] = 12,
    [WEAPON_TYPE_LINHNU] = 12,
    [WEAPON_TYPE_VUTIEN] = 12,
}

_g_tbWeaponAttribute = {
    [7] = {
        {
            nAttributeId = 285,
            nRate = 1.1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50,
            nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252,
            nRate = 0.4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 85 },
                { nLevel = 5, nRate = 12 },
                { nLevel = 6, nRate = 3 },
            }
        },
        {
            nAttributeId = 268,
            nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390,
            nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    },
    [8] = {
        {
            nAttributeId = 285,
            nRate = 0.8,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49, nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50, nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 25 },
                { nLevel = 5, nRate = 5 },
            }
        },
        {
            nAttributeId = 268, nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    },
    [9] = {
        {
            nAttributeId = 285, nRate = 0.8,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49, nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50, nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 25 },
                { nLevel = 5, nRate = 5 },
            }
        },
        {
            nAttributeId = 268, nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    }
}

_g_tbPetBookRates = {
    [6] = {
        { nBookId = 87, nRate = 5.4 },
        { nBookId = 88, nRate = 6.4 },
        { nBookId = 89, nRate = 6.4 },
        { nBookId = 90, nRate = 6.4 },
        { nBookId = 91, nRate = 6 },
        { nBookId = 92, nRate = 6 },
        { nBookId = 93, nRate = 5 },
        { nBookId = 94, nRate = 5 },
        { nBookId = 95, nRate = 5 },
        { nBookId = 96, nRate = 5 },
        { nBookId = 97, nRate = 5 },
        { nBookId = 98, nRate = 5 },
        { nBookId = 99, nRate = 5 },
        { nBookId = 100, nRate = 5 },
        { nBookId = 101, nRate = 5 },
        { nBookId = 102, nRate = 5 },
        { nBookId = 103, nRate = 5.4 },
        { nBookId = 104, nRate = 5 },
        { nBookId = 105, nRate = 1.5 },
        { nBookId = 106, nRate = 1.5 },
    }
}
