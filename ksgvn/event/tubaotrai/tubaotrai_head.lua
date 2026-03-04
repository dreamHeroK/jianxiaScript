local szRareMsg = "Chóc mõng %s nhËn th­ëng mèc Tô B¶o Trai thu ®­îc %d %s"

EVENT_TUBAOTRAI_MAX_LOTTERY_NUM = 10000

g_tbTuBaoTrai_AccumulateAward = {
    { nRequireNum = 100, szName = "2 Qu©n C«ng Huy Hoµng", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 2, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    { nRequireNum = 500, szName = "1 Tói §¸ Quý cÊp 5", tbAward = { tbProp = { 2, 1, 31024 }, nStack = 1, nStatus = 1 }, },
    { nRequireNum = 1000, szName = "4 Qu©n C«ng Huy Hoµng", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 4, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    { nRequireNum = 2000, szName = "1 Tói §¸ Quý cÊp 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 1, nStatus = 1 }, },
    { nRequireNum = 3000, szName = "2 Tói §¸ Quý cÊp 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 2, nStatus = 1, }, },
    { nRequireNum = 5000, szName = "1 Tói §¸ Quý cÊp 7", tbAward = { tbProp = { 2, 1, 31505 }, nStack = 1, nStatus = 1, }, },
    { nRequireNum = 8000, szName = "1 Th­¬ng H¶i Ch©u cÊp 7 (ch­a gi¸m ®Þnh)", tbAward = { tbProp = { 2, 102, 224 }, nStatus = 1, nStack = 1, nQuality = szRareMsg }, },
    { nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "1 Tói Trang BÞ Kim Xµ CÊp 7", tbAward = { tbProp = { 2, 1, 31400 }, nStatus = 1, nStack = 1 }, },
    --{ nRequireNum = 20000, szName = "2 Cæ Phæ-Tói Tµn QuyÓn", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 2, nQuality = szRareMsg }, },
    --{ nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "3 Cæ Phæ-Tói Tµn QuyÓn", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 3, nQuality = szRareMsg }, },
}

g_tbTuBaoTrai_TaskAward = {
    tbProp = { 2, 1, 30997 }, nStatus = 4, nStack = 1
}

g_tbTuBaoTrai_VIPGift = {
    tbProp = { 2, 1, 30997 }, nStatus = 4, nStack = 10
}

EVENT_TUBAOTRAI_TYPE_FREE = 1
EVENT_TUBAOTRAI_TYPE_IB = 2

g_tbTuBaoTrai_ItemCost = {
    [EVENT_TUBAOTRAI_TYPE_FREE] = {
        tbItems = {
            { tbProp = { 2, 1, 30997 }, nCount = 1 }
        }
    },
    [EVENT_TUBAOTRAI_TYPE_IB] = {
        tbItems = {
            { tbProp = { 2, 97, 236 }, nCount = 3 }
        }
    }
}

g_szTuBaoNpcName = "<color=green>Chñ Th­¬ng Héi<color>: "