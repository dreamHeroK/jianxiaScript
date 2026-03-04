Import("\\script\\ksgvn\\constants.lua")

GLB_VALUE_SERVER_ID = 1023

g_tbServerCfg = {
    [1] = {
        szName = "B¹ch Hæ",
        tbTimeOpen = { nHour = 10, nDay = 25, nMonth = 5, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200525, nEndDate = 20200725, nGetTongAwardDate = 20200727 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [2] = {
        szName = "Thanh Long",
        tbTimeOpen = { nHour = 10, nDay = 12, nMonth = 7, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200712, nEndDate = 20200912, nGetTongAwardDate = 20200914 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [3] = {
        szName = "Phi ¦ng",
        tbTimeOpen = { nHour = 10, nDay = 20, nMonth = 8, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200820, nEndDate = 20201020, nGetTongAwardDate = 20201022 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [4] = {
        szName = "Tµng Long",
        tbTimeOpen = { nHour = 10, nDay = 8, nMonth = 11, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20201108, nEndDate = 20210108, nGetTongAwardDate = 20210110 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [5] = {
        szName = "Phi Long", -- Tµng Long gép víi Phi ¦ng
        tbTimeOpen = { nHour = 10, nDay = 8, nMonth = 11, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20201108, nEndDate = 20210108, nGetTongAwardDate = 20210110 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [6] = {
        szName = "Ngäa Hæ",
        tbTimeOpen = { nHour = 10, nDay = 14, nMonth = 1, nYear = 2021, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20210114, nEndDate = 20210226, nGetTongAwardDate = 20210228 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [7] = {
        szName = "Long Hæ M«n",-- Phi Long gép víi Ngäa Hæ
        tbTimeOpen = { nHour = 10, nDay = 14, nMonth = 1, nYear = 2021, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20210114, nEndDate = 20210226, nGetTongAwardDate = 20210228 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [100] = {
        szName = "Thö nghiÖm",
        tbTimeOpen = { nHour = 10, nDay = 17, nMonth = 12, nYear = 2020, },
        tbTimeTest = { nStartDate = 20201217, nEndDate = 20231211 },
        tbTimeTop = { nStartDate = 20200525, nEndDate = 20230725, nGetTongAwardDate = 20230727 },

        bOpenTestCard = 1,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [150] = {
        szName = "Liªn §Êu",
        tbTimeOpen = { nHour = 10, nDay = 10, nMonth = 5, nYear = 2020, },
        tbTimeTest = { nStartDate = 20080808, nEndDate = 20080808 },
        tbTimeTop = { nStartDate = 20080808, nEndDate = 20080808, nGetTongAwardDate = 20080808 },

        bOpenTestCard = 1,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 1,

        bOpenTop = 1,
    },
}

g_tbServerDefaultCfg = {
    szName = "Vâ L©m 2",
    tbTimeOpen = { nHour = 10, nDay = 10, nMonth = 5, nYear = 2020, },
    tbTimeTest = { nStartDate = 20080808, nEndDate = 20080808 },
    tbTimeTop = { nStartDate = 20080808, nEndDate = 20080808, nGetTongAwardDate = 20080808 },

    bOpenTestCard = 0,
    bOpenNewPlayerCard = 0,
    bOpenAdminCard = 0,
    bOpenGMCard = 0,

    bOpenTop = 0,
}

g_tbLoginCfg = {
    [1] = {
        bCondition = 'bOpenTestCard',
        tbProp = { 2, 1, 50001 },
        szRequireRule = 'player',
        szMsg = "C¸c h¹ nhËn ®­îc <color=yellow>1 ThÎ Tr¶i NghiÖm<color>, dïng ®Ó tr¶i nghiÖm tÝnh n¨ng cña volam2.zing.vn, xin kiÓm tra t¹i hµnh trang! Chóc b¹n ch¬i game vui vÎ!"
    },
    [2] = {
        bCondition = 'bOpenNewPlayerCard',
        tbProp = { 2, 1, 50002 },
        szRequireRule = 'player',
        szMsg = "C¸c h¹ nhËn ®­îc <color=yellow>1 T©n Thñ LÖnh<color> cña volam2.zing.vn, xin kiÓm tra t¹i hµnh trang!"
    },
    [3] = {
        bCondition = 'bOpenGMCard',
        tbProp = { 2, 1, 50004 },
        szRequireRule = 'gm',
        szMsg = "B¹n lµ GM cña volam2.zing.vn, <color=yellow>nhËn ®­îc thÎ hç trî<color>!"
    },
    [4] = {
        bCondition = 'bOpenAdminCard',
        tbProp = { 2, 1, 50003 },
        szRequireRule = 'admin',
        szMsg = "B¹n lµ Admin, nhËn ®­îc <color=yellow>thÎ qu¶n lý server<color>!"
    },
}