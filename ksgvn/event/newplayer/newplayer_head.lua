Include("\\script\\ksgvn\\event\\newplayer\\newplayer_award.lua")

_g_tbAward_Giftcode_NewPlayer = {
    { nFunc = "KsgItem:AddOrnClothByBody(231)", },
    { tbProp = { 0, 112, 158 }, nStack = 1, nStatus = 4 }, -- L¨ng Ba Vi Bé toµn tËp
    { tbProp = { 0, 102, 30037 }, nStack = 1, nStatus = 4 }, -- Thiªn §Þa Giíi
    { tbProp = { 0, 102, 30038 }, nStack = 1, nStatus = 4 }, -- NhËt NguyÖt Giíi
}

g_tbNewPlayerGift_Daily = {
    { tbProp = { 2, 1, 50016 }, nStack = 10, nStatus = 4 }, -- Tói Quµ Vâ L©m
    { tbProp = { 2, 0, 554 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Tu Ch©n YÕu QuyÕt
    { tbProp = { 2, 0, 504 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C©y b¸t nh· nhá
    { tbProp = { 2, 0, 398 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C©y b¸t nh· lín
    { tbProp = { 2, 1, 30269 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C©y tø linh
    { tbProp = { 2, 97, 236 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Thiªn Kiªu LÖnh
    { tbProp = { 2, 1, 30154 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- N÷ Oa B¶o H¹p
    { tbProp = { 2, 1, 30191 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Ng«i Sao May M¾n
}

g_tbNewPlayerGift_Daily_VIP = {
    { tbProp = { 2, 1, 50016 }, nStack = 20, nStatus = 4 }, -- Tói Quµ Vâ L©m
    { tbProp = { 2, 0, 554 }, nStack = 4, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Tu Ch©n YÕu QuyÕt
    { tbProp = { 2, 0, 504 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C©y b¸t nh· nhá
    { tbProp = { 2, 0, 398 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C©y b¸t nh· lín
    { tbProp = { 2, 1, 30269 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C©y tø linh
    { tbProp = { 2, 1, 30087 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Tói h¹t gièng
    { tbProp = { 2, 97, 236 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Thiªn Kiªu LÖnh
    { tbProp = { 2, 1, 30154 }, nStack = 10, nStatus = 4, nExpiredTime = 24 * 3600 }, -- N÷ Oa B¶o H¹p
    { tbProp = { 2, 1, 30191 }, nStack = 4, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Ng«i Sao May M¾n
}

g_tbNewPlayerGift_Weekly = {
    { tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 }, -- Thiªn Cang LÖnh
    { tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 }, -- Thiªn M«n Kim LÖnh
    { nPopur2 = 100 }, -- §iÓm LÞch luyÖn
    { nPhongHoa = 100 }, -- §iÓm Phong Hoa
}

g_tbNewPlayerGift_Weekly_VIP = {
    { tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 }, -- Thiªn Cang LÖnh
    { tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 }, -- Thiªn M«n Kim LÖnh
    { tbProp = { 2, 1, 31122 }, nStack = 1, nStatus = 4 }, -- Linh KhÝ Rùc Rì
    { tbProp = { 2, 1, 31386 }, nStack = 100, nStatus = 4 }, -- M¶nh Thó C­ìi
    { nPopur2 = 200 }, -- §iÓm LÞch luyÖn
    { nPhongHoa = 200 }, -- §iÓm Phong Hoa
}

g_tbNewPlayer_AwardSupportReborn = {
    [1] = {
        nAwardLevel = 890,
        tbAwardBonus = { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = 2 },
        tbCondition = {
            nBigLevel = 73,
            nRepute = 3000,
            nFactionPoint = 4000,
            nHonor = 50000,
        },
        tbAward = {
            { nRebornCustom = 890, szCallback = "NewPlayerAward_Mach2" },
            { nFunc = "NewPlayerAward:ChienCuong()" },
            { tbProp = { 0, 102, 8844 }, nStatus = 4, nStack = 1 }, -- Huy Hoµng QuËt Khëi
            { tbProp = { 0, 102, 8845 }, nStatus = 4, nStack = 1 }, -- Vinh Dù QuËt Khëi,
            { tbProp = { 0, 152, 9 }, nStatus = 4, nStack = 1 }, -- Kx ©m chÕ
            { tbProp = { 0, 153, 9 }, nStatus = 4, nStack = 1 }, -- Kx ©m chÕ
            { tbProp = { 0, 154, 9 }, nStatus = 4, nStack = 1 }, -- Kx ©m chÕ
            { tbProp = { 0, 112, 158 }, nStatus = 4, nStack = 1 }, -- L¨ng ba vi bé toµn tËp
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- HiÖp NghÜa Chi Chøng
            { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R­¬ng YQ
            { nFunc = "NewPlayerAward:SetVanSuc(1)" },
            { nFunc = "NewPlayerAward:ThuongHaiChau(1, 7)" },
            { tbProp = { 2, 1, 30945 }, nStatus = 4, nStack = 1 }, -- LÖnh Bµi Hµo HiÖp ¸o
            { tbProp = { 2, 1, 30944 }, nStatus = 4, nStack = 1 }, -- LÖnh Bµi Hµo HiÖp Nãn
            { tbProp = { 2, 1, 30946 }, nStatus = 4, nStack = 1 }, -- LÖnh Bµi Hµo HiÖp QuÇn
        }
    },
    [2] = {
        nAwardLevel = 990,
        tbAwardBonus = { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = 5 },
        tbCondition = {
            nBigLevel = 892,
            nRepute = 6000,
            nFactionPoint = 6000,
            nHonor = 150000,
        },
        tbAward = {
            { nReborn = 990 },
            { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R­¬ng YQ
            { nFunc = "NewPlayerAward:Gem(1, 8)" },
            { nFunc = "NewPlayerAward:Gem(2, 8)" },
            { nFunc = "NewPlayerAward:Gem(3, 6)" },
            { nFunc = "NewPlayerAward:Gem(4, 4)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- HiÖp NghÜa Chi Chøng
            { nMeridianLevel = 3 },
            { nChanKhi = 100000 },
        }
    },
    [3] = {
        nAwardLevel = 1090,
        tbAwardBonus = { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = 10 },
        tbCondition = {
            nBigLevel = 992,
            tbItems = {
                { tbProp = { 2, 1, 30814 }, nCount = 2 }, -- Phôc sinh ®¬n
            },
        },
        tbAward = {
            { nReborn = 1090 },
            { nFunc = "NewPlayerAward:Gem(3, 6)" },
            { nFunc = "NewPlayerAward:Gem(4, 6)" },
            { nFunc = "NewPlayerAward:Gem(5, 4)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- HiÖp NghÜa Chi Chøng
            { nMeridianLevel = 4 },
            { nChanKhi = 100000 },
        }
    },
    [4] = {
        nAwardLevel = 1095,
        tbCondition = {
            nBigLevel = 1095,
            tbItems = {
                { tbProp = { 2, 1, 30814 }, nCount = 5 }, -- Phôc sinh ®¬n
            },
        },
        tbAward = {
            { tbProp = { 2, 1, 31313 }, nStatus = 4, nStack = 1 }, -- LÖnh bµi S¸t Tinh (Nãn)
            { tbProp = { 2, 1, 31261 }, nStatus = 4, nStack = 1 }, -- Kh¾c b¶n hoµn mü cÊp 3 (Nãn)
        }
    },
    [5] = {
        nAwardLevel = 1096,
        tbCondition = {
            nBigLevel = 1096,
        },
        tbAward = {
            { tbProp = { 2, 1, 31314 }, nStatus = 4, nStack = 1 }, -- LÖnh bµi S¸t Tinh (¸o)
            { tbProp = { 2, 1, 31262 }, nStatus = 4, nStack = 1 }, -- Kh¾c b¶n hoµn mü cÊp 3 (¸o)
        }
    },
    [6] = {
        nAwardLevel = 1098,
        tbCondition = {
            nBigLevel = 1098,
            tbItems = {
                { tbProp = { 2, 95, 204 }, nCount = 5 }, -- Thiªn Cang LÖnh
                { tbProp = { 2, 1, 30370 }, nCount = 5 }, -- Thiªn M«n Kim LÖnh
            }
        },
        tbAward = {
            { tbProp = { 2, 1, 31315 }, nStatus = 4, nStack = 1 }, -- LÖnh bµi S¸t Tinh (QuÇn)
            { tbProp = { 2, 1, 31263 }, nStatus = 4, nStack = 1 }, -- Kh¾c b¶n hoµn mü cÊp 3 (QuÇn)
        },
    },
    [7] = {
        nAwardLevel = 1099,
        tbCondition = {
            nBigLevel = 1099,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 10000 }, -- Xu
            }
        },
        tbAward = {
            { nFunc = "NewPlayerAward:ActiveHoaCanh()" },
            { nFunc = "NewPlayerAward:VSCTRandom()" },
            { tbProp = { 2, 1, 31264 }, nStatus = 4, nStack = 1 }, -- Kh¾c b¶n Hoµn Mü cÊp 3 (NhÉn)
            { tbProp = { 2, 1, 31265 }, nStatus = 4, nStack = 1 }, -- Kh¾c b¶n Hoµn Mü cÊp 3 (Ngäc Béi)
        },
    },
}

g_szNpcName = "<color=green>T©n Thñ LÖnh<color>: "