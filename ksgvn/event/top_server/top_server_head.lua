Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\top_server\\top_award.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua")
g_szNpcName = "<color=green>§¹i sø ®ua Top<color>: "

MAX_CONTRIBUTE_POINT_PER_DAY = 100

TOP_BANG_MEMBER_AWARD_REQUIRE_JOIN_DAY = 2
TOP_BANG_LEADER_AWARD_REQUIRE_ASSIGN_DAY = 7
TOP_BANG_AWARD_TYPE_MEMBER = 1
TOP_BANG_AWARD_TYPE_LEADER = 2
TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL = 90
TOP_BANG_AWARD_REQUIRE_LEVEL = 790
TOP_BANG_CONTRIBUTE_POINT_MIN = 150000

FILENAME_TOP_BANG = "top_bang.txt"
FILENAME_TOP_REBORN = "top_reborn.txt"
FILENAME_TOP_ROUTE = "top_route.txt"
FILENAME_TOP_HONOR1 = "top_honor1.txt"
FILENAME_TOP_HONOR2 = "top_honor2.txt"

g_tbTopBangMaterialCfg = {
    [1] = {
        szDesc = "1 ®iÓm cèng hiÕn: tiªu hao 1.000.000 kinh nghiÖm, 1 xu",
        nPoint = 1,
        tbCondition = {
            tbItems = {
                { szName = "Xu", tbProp = { 2, 1, 30230 }, nCount = 1 }
            },
            nExp = 1e6,
        }
    },
    [2] = {
        szDesc = "10 ®iÓm cèng hiÕn: tiªu hao 10.000.000 kinh nghiÖm, 10 xu",
        nPoint = 10,
        tbCondition = {
            tbItems = {
                { szName = "Xu", tbProp = { 2, 1, 30230 }, nCount = 10 },
            },
            nExp = 10e6,
        }
    },
    [3] = {
        szDesc = "100 ®iÓm cèng hiÕn: tiªu hao 100.000.000 kinh nghiÖm, 100 xu",
        nPoint = 100,
        tbCondition = {
            tbItems = {
                { szName = "Xu", tbProp = { 2, 1, 30230 }, nCount = 100 },
            },
            nExp = 100e6,
        }
    },
}

g_tbTopBangAwardCfg = {
    Member = {
        [1] = {
            { nFunc = "TopAward:ThuongHaiChau(7, 1, 4)" },
            { tbProp = { 2, 1, 1113 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600 }, -- §¹i §Þnh Hån
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 4000 }, -- HiÖp NghÜa Chi chøng
            { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 180 }, -- §ång TÕ Chi NguyÖn
            { tbProp = { 0, 105, 164 }, nStatus = 4 }, -- Háa Hå
            { nFunc = "TopAward:Gem(6, 4)" }, -- §¸ quý cÊp 6
        },
        [2] = {
            { nFunc = "TopAward:ThuongHaiChau(7, 1, 4)" },
            { tbProp = { 2, 1, 1113 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600 },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 3000 },
            { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 120 },
            { tbProp = { 0, 105, 164 }, nStatus = 4 }, -- Háa Hå
            { nFunc = "TopAward:Gem(6, 2)" }, -- §¸ quý cÊp 6
        },
        [3] = {
            { nFunc = "TopAward:ThuongHaiChau(7, 1, 4)" },
            { tbProp = { 2, 1, 1113 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600 },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 1500 },
            { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 80 },
            { tbProp = { 0, 105, 164 }, nStatus = 4 }, -- Háa Hå
            { nFunc = "TopAward:Gem(6, 1)" }, -- §¸ quý cÊp 6
        },
    },
    Leader = {
        [1] = {
            { nFunc = "TopAward:UyHoTuong()" },
            { nFunc = "TopAward:SuperFactionBook(7, 'TopBang_Leader1')" },
            { nFunc = "TopAward:Gem(7, 1)" }, -- §¸ quý cÊp 7
            { tbProp = { 0, 105, 10116 }, nStatus = 4 }, -- Hæ Hoµng Kim C¸t T­êng
        },
        [2] = {
            { nFunc = "TopAward:ThanhLongTuong(10)" },
            { nFunc = "TopAward:Gem(7, 1)" }, -- §¸ quý cÊp 7
            { nFunc = "TopAward:SuperFactionBook(5, 'TopBang_Leader2')" },
            { tbProp = { 0, 105, 30029 }, nStatus = 4 }, -- B¸o §en B¶o B¶o
        },
        [3] = {
            { nFunc = "TopAward:ThanhLongTuong(0)" },
            { nFunc = "TopAward:Gem(7, 1)" }, -- §¸ quý cÊp 7
            { tbProp = { 0, 105, 30029 }, nStatus = 4 }, -- B¸o §en B¶o B¶o
        },
    }
}

g_tbTop3RebornCfg = {
    Condition = {
        nBigLevel = 1099,
    },
    Award = {
        { tbProp = { 2, 1, 1009 }, nStack = 200, nStatus = 4 }, -- Thiªn Th¹ch Tinh Th¹ch
        { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 500 }, -- §ång TÕ Chi NguyÖn
        { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 5000 }, -- HiÖp NghÜa Chi Chøng
        { tbProp = { 2, 1, 50028 }, nStatus = 4, nStack = 10 }, -- Cæ phæ-Tói Tµn QuyÓn
        { nFunc = "TopAward:SuperFactionBook(2, 'Top3FactionReborn')" },
        { tbProp = { 2, 102, 214 }, nStatus = 4, nStack = 5, }, -- Th­¬ng H¶i Di Ch©u 7 (khãa)
    }
}

g_tbTop1FactionCfg = {
    Condition = {
        nBigLevel = 1096,
        nFactionPoint = 30000,
        nRepute = 30000,
        nHonor = 4600000,
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 10000 }
        },
    },
    Award = {
        { tbProp = { 2, 1, 50022 }, nStatus = 4, nStack = 1 }, -- S¸t Tinh LÖnh-Tr¸c ViÖt (Nãn)
        { tbProp = { 2, 1, 50023 }, nStatus = 4, nStack = 1 }, -- S¸t Tinh LÖnh-Tr¸c ViÖt (¸o)
        { tbProp = { 2, 1, 50024 }, nStatus = 4, nStack = 1 }, -- S¸t Tinh LÖnh Tr¸c ViÖt(QuÇn)
        { tbProp = { 2, 1, 50025 }, nStatus = 4, nStack = 1 }, -- S¸t Tinh LÖnh-Tr¸c ViÖt (Vò khÝ)
        { tbProp = { 2, 1, 1009 }, nStack = 100, nStatus = 4 }, -- Thiªn Th¹ch Tinh Th¹ch
        { tbProp = { 2, 1, 30974 }, nStatus = 4, nStack = 2, }, -- Ngäc Béi Hµo HiÖp V« H¹
        { tbProp = { 2, 1, 31400 }, nStatus = 4, nStack = 3, }, -- Tói Kim Xµ 7
        { tbProp = { 0, 105, 205 }, nStatus = 4 }, -- ChiÕn Lang
        { nFunc = "TopAward:SuperFactionBook(2, 'Top1Faction')" },
        --{ nFunc = "TopAward:KimXaTuChon(7)" }, -- Kx 7 tu chon
        { nFunc = "TopAward:Gem(7, 2)" },
    }
}

g_tbTopHonor1Cfg = {
    Condition = {
        nBigLevel = 1096,
        nBattleRank = 6,
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 20000 }
        },
        nHonor = 6600000,
    },
    Award = {
        { nFunc = "TopAward:UyHoSoai()" }, -- Uy hæ so¸i
        { tbProp = { 2, 1, 31295 }, nStatus = 4, nStack = 80 }, -- Uy Hæ Tinh Hoa
        { tbProp = { 2, 1, 31307 }, nStatus = 4, nQuality = "%s ®· nhËn phÇn th­ëng ®¹t 6.600.000 c«ng tr¹ng: %d %s" }, -- Chiªu Yªu Kú
        { nFunc = "TopAward:Gem(8, 1)" },
        { tbProp = { 2, 1, 50267 }, nStatus = 4, nStack = 3 }, -- ThÎ trang søc Linh Lung
        { nPhongHoa = 30000 }, -- §iÓm Phong Hoa
    }
}

g_tbTopHonor2Cfg = {
    Condition = {
        nBigLevel = 1096,
        nBattleRank = 5,
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 10000 },
        },
        nHonor = 5400000,
    },
    Award = {
        { nFunc = "TopAward:UyHoTuong()" },
        { tbProp = { 2, 1, 31295 }, nStatus = 4, nStack = 40 }, -- Uy Hæ Tinh Hoa
        { tbProp = { 2, 1, 31307 }, nStatus = 4, nQuality = "%s ®· nhËn phÇn th­ëng ®¹t 5.400.000 c«ng tr¹ng: %d %s" }, -- Chiªu Yªu Kú
        { nFunc = "TopAward:Gem(7, 2)" },
        { tbProp = { 2, 1, 50267 }, nStatus = 4, nStack = 2 }, -- ThÎ trang søc Linh Lung
        { nPhongHoa = 20000 }, -- §iÓm Phong Hoa
    }
}

g_tbNewPlayerLevelAward = {
    {
        nRequireLevel = 790,
        nTaskBit = 1,
        tbCondition = {
            nBigLevel = 790,
        },
        tbAward = {
            { nFunc = "TopAward:ThuongHaiChau(3, 7, 4)" },
            { tbProp = { 0, 152, 9 }, nStatus = 4, nStack = 1 }, -- Kx ©m chÕ
            { tbProp = { 0, 153, 9 }, nStatus = 4, nStack = 1 }, -- Kx ©m chÕ
            { tbProp = { 0, 154, 9 }, nStatus = 4, nStack = 1 }, -- Kx ©m chÕ
            { nFunc = "TopAward:SetVanSuc(1)" },
            { nFunc = "TopAward:SuperFactionBook()" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 4000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R­¬ng YQ
            { tbProp = { 0, 102, 8844 }, nStatus = 4, nStack = 1 }, -- Huy Hoµng QuËt Khëi
            { tbProp = { 0, 102, 8845 }, nStatus = 4, nStack = 1 }, -- Vinh Dù QuËt Khëi,
            { nFunc = "TopAward:Gem(3, 12)" },
            { tbProp = { 0, 155, 8 }, nStatus = 4, nStack = 1 }, -- TÝn vËt bang cÊp 8
        }
    },
    {
        nRequireLevel = 890,
        nTaskBit = 2,
        tbCondition = {
            nBigLevel = 890,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 1000 }, -- Xu
            },
        },
        tbAward = {
            { nChanKhi = 80000 },
            { tbProp = { 2, 1, 1009 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 3 }, -- Thiªn Th¹ch Tinh Th¹ch
            { tbProp = { 2, 1, 30368 }, nStatus = 4, nStack = 100 }, -- Cæ Linh Th¹ch
            { tbProp = { 2, 1, 30497 }, nStatus = 4, nStack = 1000 }, -- Ma Tinh
            { tbProp = { 2, 1, 30612 }, nStatus = 4, nStack = 50 }, -- ThiÕt Tinh 4
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- HiÖp NghÜa Chi Chøng
            { nFunc = "TopAward:Gem(4, 4)" },
            { tbProp = { 2, 1, 30847 }, nStatus = 4, nStack = 20 }, -- Håi Tiªn §¬n
            { tbProp = { 2, 1, 30944 }, nStatus = 4, nStack = 1 }, -- Nãn Hµo HiÖp V« H¹
            { tbProp = { 2, 1, 30945 }, nStatus = 4, nStack = 1 }, -- ¸o Hµo HiÖp V« H¹
            { tbProp = { 2, 1, 30946 }, nStatus = 4, nStack = 1 }, -- QuÇn Hµo HiÖp V« H¹
        }
    },

    {
        nRequireLevel = 891,
        nTaskBit = 3,
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 1000 }, -- Xu
            },
        },
        tbAward = {
            { nChanKhi = 100000 },
            { tbProp = { 2, 1, 1009 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 6 }, -- Thiªn Th¹ch Tinh Th¹ch
            { tbProp = { 2, 1, 1001 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 1 }, -- Hßa ThÞ BÝch
            { tbProp = { 2, 1, 30612 }, nStatus = 4, nStack = 50 }, -- ThiÕt Tinh 4
            { nFunc = "TopAward:Gem(5, 4)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 20 }, -- §ång TÕ Chi NguyÖn
            { tbProp = { 2, 1, 30668 }, nStatus = 4, nStack = 16 }, -- Tinh Hoa UÈn Linh 6
            { tbProp = { 2, 1, 30847 }, nStatus = 4, nStack = 50 }, -- Håi Tiªn §¬n
            { nFunc = "TopAward:SuperFactionBook()" },
            { tbProp = { 2, 1, 30973 }, nStatus = 4, nStack = 1 }, -- Vò KhÝ Hµo HiÖp V« H¹
        }
    },


    {
        nRequireLevel = 892,
        nTaskBit = 4,
        tbCondition = {
            nBigLevel = 892,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 2000 }, -- Xu
            },
        },
        tbAward = {
            { nChanKhi = 100000 },
            { tbProp = { 2, 1, 1009 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 9 }, -- Thiªn Th¹ch Tinh Th¹ch
            { tbProp = { 2, 1, 30814 }, nStatus = 4, nStack = 2 }, -- Phôc Sinh §¬n
            { tbProp = { 2, 1, 30368 }, nStatus = 4, nStack = 100 }, -- Cæ Linh Th¹ch
            { tbProp = { 2, 1, 30369 }, nStatus = 4, nStack = 100 }, -- Cæ Linh Ngäc
            { nFunc = "TopAward:Gem(6, 1)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 200 }, -- §ång TÕ Chi NguyÖn
            { tbProp = { 2, 1, 30668 }, nStatus = 4, nStack = 16 }, -- Tinh Hoa UÈn Linh 6
            { tbProp = { 2, 1, 30847 }, nStatus = 4, nStack = 50 }, -- Håi Tiªn §¬n
            { nFunc = "TopAward:SetVanSuc(2)" },
        }
    },

    {
        nRequireLevel = 990,
        nTaskBit = 5,
        tbCondition = {
            nBigLevel = 990,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 5000 }, -- Xu
            },
        },
        tbAward = {
            { nChanKhi = 100000 },
            { tbProp = { 2, 1, 1113 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 1 }, -- §¹i §Þnh Hån
            { tbProp = { 2, 1, 30814 }, nStatus = 4, nStack = 2 }, -- Phôc Sinh §¬n
            { tbProp = { 2, 1, 1009 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 12 }, -- Thiªn Th¹ch Tinh Th¹ch
            { tbProp = { 2, 95, 204 }, nStatus = 4, nStack = 5 }, -- Thiªn Cang LÖnh
            { tbProp = { 2, 1, 30370 }, nStatus = 4, nStack = 5 }, -- Thiªn M«n Kim LÖnh
            { tbProp = { 2, 1, 1001 }, nStatus = 4, nExpiredTime = 7 * 24 * 3600, nStack = 2 }, -- Hßa ThÞ BÝch
            { tbProp = { 2, 1, 31168, }, nStatus = 4, nStack = 1 }, -- H¾c B¹ch Kú
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 4000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 30847 }, nStatus = 4, nStack = 80 }, -- Håi Tiªn §¬n
            { nFunc = "TopAward:Gem(6, 2)" },
            { nFunc = "TopAward:VKAmHuyet()" },
        }
    },
    {
        nRequireLevel = 991,
        nTaskBit = 6,
        tbCondition = {
            nBigLevel = 991,
        },
        tbAward = {
            { nChanKhi = 100000 },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 3000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 30913 }, nStatus = 4, nStack = 400 }, -- §ång TÕ Chi NguyÖn
            { tbProp = { 2, 1, 30847 }, nStatus = 4, nStack = 50 }, -- Håi Tiªn §¬n
            { tbProp = { 2, 1, 31168 }, nStatus = 4, nStack = 1 }, -- H¾c B¹ch Kú
            { nFunc = "TopAward:ManhKx7Random(50)" }, -- M¶nh Kim Xµ 7 NgÉu Nhiªn
            { nFunc = "TopAward:ThuongHaiChau(5, 2, 4)" },
            { nFunc = "TopAward:Gem(6, 2)" },
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 2 }, -- Linh Ph¸ch §¬n
        }
    },
    {
        nRequireLevel = 992,
        nTaskBit = 7,
        tbCondition = {
            nBigLevel = 992,
        },
        tbAward = {
            { nChanKhi = 100000 },
            { nFunc = "TopAward:Gem(6, 2)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 4000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 30847 }, nStatus = 4, nStack = 50 }, -- Håi Tiªn §¬n
            { nFunc = "TopAward:ThuongHaiChau(5, 3, 4)" },
            { nFunc = "TopAward:ManhKx7Random(100)" }, -- M¶nh Kim Xµ 7 NgÉu Nhiªn
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 2 }, -- Linh Ph¸ch §¬n
        }
    },
    {
        nRequireLevel = 1090,
        nTaskBit = 8,
        tbCondition = {
            nBigLevel = 1090,
            tbItems = {
                { tbProp = { 2, 95, 204 }, nCount = 5 }, -- Thiªn Cang LÖnh
                { tbProp = { 2, 1, 30370 }, nCount = 5 }, -- Thiªn M«n Kim LÖnh
            }
        },
        tbAward = {
            { tbProp = { 2, 1, 31307 }, nStatus = 4, nStack = 1 }, -- Chiªu Yªu Kú
            { nFunc = "TopAward:ThuongHaiChau(6, 2, 4)" },
            { nFunc = "TopAward:ManhKx7Random(200)" }, -- M¶nh Kim Xµ 7 NgÉu Nhiªn
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 4 }, -- Linh Ph¸ch §¬n
            { nFunc = "TopAward:SetVanSuc(3)" },
        }
    },
    {
        nRequireLevel = 1091,
        nTaskBit = 9,
        tbCondition = {
            nBigLevel = 1091,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 5000 }, -- Xu
            },
        },
        tbAward = {
            { nFunc = "TopAward:ThuongHaiChau(7, 1, 4)" },
            { nFunc = "TopAward:ManhKx7Random(300)" }, -- M¶nh Kim Xµ 7 NgÉu Nhiªn
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 6 }, -- Linh Ph¸ch §¬n
        }
    },
    {
        nRequireLevel = 1092,
        nTaskBit = 10,
        tbCondition = {
            nBigLevel = 1092,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 5000 }, -- Xu
            },
        },
        tbAward = {
            { nFunc = "TopAward:ThuongHaiChau(7, 1, 4)" },
            { nFunc = "TopAward:ManhKx7Random(400)" }, -- M¶nh Kim Xµ 7 NgÉu Nhiªn
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 8 }, -- Linh Ph¸ch §¬n
        }
    },
    {
        nRequireLevel = 1094,
        nTaskBit = 11,
        tbCondition = {
            nBigLevel = 1094,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 5000 }, -- Xu
            },
        },
        tbAward = {
            { nFunc = "TopAward:Gem(7, 1)" },
            { tbProp = { 2, 1, 50028 }, nStatus = 4, nStack = 1 }, -- Cæ phæ - tói tµn quyÓn
            { nFunc = "TopAward:ThuongHaiChau(7, 2, 4)" },
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 10 }, -- Linh Ph¸ch §¬n
        }
    },
    {
        nRequireLevel = 1096,
        nTaskBit = 12,
        tbCondition = {
            nBigLevel = 1096,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 10000 }, -- Xu
            },
        },
        tbAward = {
            { tbProp = { 2, 1, 31239 }, nStatus = 4, nStack = 20 }, -- Linh Ph¸ch §¬n
            { tbProp = { 2, 1, 50028 }, nStatus = 4, nStack = 2 }, -- Cæ phæ - tói tµn quyÓn
            { nFunc = "TopAward:Gem(7, 1)" },
            { nFunc = "TopAward:ThuongHaiChau(7, 3, 4)" },
        }
    },

}