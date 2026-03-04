Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

function OnUse(nItemIndex)
    local nMonth = tonumber(date("%m"))
    if KsgTask:Get(TASKID_TUIQUA_VOLAM_VERSION) ~= nMonth then
        KsgItem:DeleteAll(2, 1, 50016) -- xãa toµn bé tói quµ vµo cuèi th¸ng, tr¸nh tÝch tr÷
        KsgTask:Set(TASKID_TUIQUA_VOLAM_VERSION, nMonth)
        return KsgNpc:Talk("Tói quµ nµy ®· hÕt h¹n. Kh«ng thÓ sö dông.")
    end

    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end

    local nExp = 5e6
    local nStatus = 4
    if KsgPlayer:IsVipAccount() then
        nStatus = 1
    end

    local szQuality = "%s më Tói Quµ Vâ L©m nhËn ®­îc %d %s, thËt may m¾n"
    local szHighQuality = "%s më Tói Quµ Vâ L©m bÊt ngê ph¸t hiÖn ra %d %s. Qu¶ lµ hång vËn ®­¬ng ®Çu!"
    local szHighestQuality = "%s cÇm %d %s tõ Tói Quµ Vâ L©m chËm r·i cÊt vµo tói, giang hå ai nÊy ®Òu ghen tÞ!"
    local tbAwardLuck = {

        { nPhongHoa = 1, nRate = 30 },
        { nPhongHoa = 2, nRate = 15 },
        { nPhongHoa = 3, nRate = 8 },
        { nPhongHoa = 4, nRate = 4 },
        { nPhongHoa = 5, nRate = 2 },
        { nPhongHoa = 10, nRate = 1 },

        { tbProp = { 0, EQUIP_TYPE_SUB_BOOK, 224 }, nStatus = nStatus, nRate = 0.005, nQuality = szQuality }, -- Tiªu dao mËt tÞch
        { tbProp = { 0, 112, 78 }, nStatus = nStatus, nRate = 0.05 }, -- L¨ng 3 Vi bé
        { tbProp = { 2, 1, 1000 }, nStatus = nStatus, nRate = 0.25, nExpiredTime = 7 * 24 * 3600 }, -- Bµn Long BÝch
        { tbProp = { 2, 1, 30424 }, nStatus = nStatus, nRate = 0.1 }, -- c­êng hãa quyÓn 12
        { tbProp = { 2, 1, 30425 }, nStatus = nStatus, nRate = 0.1 }, -- c­êng hãa quyÓn 13
        { tbProp = { 2, 1, 30426 }, nStatus = nStatus, nRate = 0.1 }, -- c­êng hãa quyÓn 14
        { tbProp = { 2, 1, 30427 }, nStatus = nStatus, nRate = 0.1 }, -- c­êng hãa quyÓn 15
        { tbProp = { 2, 1, 30998 }, nStatus = nStatus, nRate = 2 }, -- Tói b¶o th¹ch cÊp 1
        { tbProp = { 2, 1, 30999 }, nStatus = nStatus, nRate = 0.5 }, -- Tói b¶o th¹ch cÊp 2
        { tbProp = { 2, 1, 31000 }, nStatus = nStatus, nRate = 0.1 }, -- Tói b¶o th¹ch cÊp 3
        { tbProp = { 2, 1, 30428, }, nStatus = nStatus, nRate = 1 }, -- Ma §ao Th¹ch CÊp 1
        { tbProp = { 2, 1, 30429, }, nStatus = nStatus, nRate = 0.5 }, -- Ma §ao Th¹ch CÊp 2
        { tbProp = { 2, 1, 30430, }, nStatus = nStatus, nRate = 0.05 }, -- Ma §ao Th¹ch CÊp 3
        { tbProp = { 2, 95, 2084 }, nStatus = nStatus, nStack = 1, nRate = 0.5 }, --Hµo HiÖp LÖnh
        { tbProp = { 2, 1, 30913 }, nStatus = nStatus, nRate = 0.05 }, -- §ång tÕ chi nguyÖn
        { tbProp = { 2, 1, 31386 }, nStatus = nStatus, nRate = 1 }, -- M¶nh thó c­ìi
        { tbProp = { 2, 1, random(31383, 31385) }, nStatus = nStatus, nRate = 0.1, nStack = 3 }, -- M¶nh kx 6
        { tbProp = { 2, 1, 1067 }, nStatus = nStatus, nRate = 0.05, nExpiredTime = 7 * 24 * 3600 }, -- ®Þnh hån nhá
        { tbProp = { 2, 1, 1113 }, nStatus = nStatus, nRate = 0.001, nExpiredTime = 7 * 24 * 3600, nQuality = szHighQuality }, -- ®Þnh hån lín

        { tbProp = { 2, 0, 554 }, nStatus = nStatus, nExpiredTime = 7 * 24 * 3600, nRate = 0.5 }, -- Tu Ch©n YQ
        { tbProp = { 2, 1, 30269 }, nStatus = nStatus, nExpiredTime = 7 * 24 * 3600, nRate = 0.5 }, -- C©y tø linh

        { tbProp = { 2, 1, 30367 }, nStatus = 4, nRate = 1 }, -- Tói tiÒn
        { tbProp = { 2, 1, 1009 }, nStatus = nStatus, nRate = 0.5 }, -- Thiªn th¹ch tinh th¹ch
        { tbProp = { 2, 1, 1068 }, nStatus = nStatus, nExpiredTime = 7 * 24 * 3600, nRate = 0.1 }, -- Thiªn th¹ch linh th¹ch

        { tbProp = { 2, 1, 3206 }, nStatus = nStatus, nExpiredTime = 30 * 24 * 3600, nRate = 0.01 }, -- Vâ L©m B¶o §iÓn

        { tbProp = { 2, 1, 31118 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- §«n Hoµng HuyÒn ThuyÕt
        { tbProp = { 2, 1, 31119 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- §«n Hoµng Hæ Ph¸ch
        { tbProp = { 2, 1, 31120 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- §«n Hoµng HuyÒn Tinh
        { tbProp = { 2, 1, 31121 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- §«n Hoµng M· N·o

        { tbProp = { 2, 1, 30847 }, nStatus = nStatus, nRate = 0.02, nStack = 1 }, -- Håi Tiªn §¬n

        { tbProp = { 2, 1, 30521 }, nStatus = nStatus, nRate = 2 }, -- TÈy t©m th¹ch 1
        { tbProp = { 2, 1, 30522 }, nStatus = nStatus, nRate = 0.5 }, -- TÈy t©m th¹ch 2
        { tbProp = { 2, 1, 30523 }, nStatus = nStatus, nRate = 0.1 }, -- TÈy t©m th¹ch 3

        { tbProp = { 2, 1, 30527 }, nStatus = nStatus, nRate = 2 }, -- LuyÖn L« th¹ch 1
        { tbProp = { 2, 1, 30528 }, nStatus = nStatus, nRate = 0.5 }, -- LuyÖn L« th¹ch 2
        { tbProp = { 2, 1, 30529 }, nStatus = nStatus, nRate = 0.1 }, -- LuyÖn L« th¹ch 3

        { tbProp = { 2, 1, 30533 }, nStatus = nStatus, nRate = 2 }, -- ThiÕt tinh cÊp 1
        { tbProp = { 2, 1, 30534 }, nStatus = nStatus, nRate = 0.5 }, -- ThiÕt tinh cÊp 2
        { tbProp = { 2, 1, 30535 }, nStatus = nStatus, nRate = 0.2 }, -- ThiÕt tinh cÊp 3
        { tbProp = { 0, 107, random(51, 66) }, nStatus = nStatus, nRate = 0.05 }, -- mËt tÞch ngÉu nhiªn
        { tbProp = { 2, 1, 50027 }, nStatus = nStatus, nRate = 0.005, nQuality = szQuality }, -- R­¬ng TrÊn Ph¸i
    }

    local tbVipAward = {
        { tbProp = { 2, 1, 30370 }, nStatus = nStatus, nRate = 0.01, nQuality = szHighestQuality, nStack = 1 }, -- Thiªn M«n Kim LÖnh
        { tbProp = { 2, 95, 204 }, nStatus = nStatus, nRate = 0.01, nQuality = szHighestQuality, nStack = 1 }, -- Thiªn Cang LÖnh
        { tbProp = { 2, 1, random(31397, 31399) }, nStatus = nStatus, nRate = 0.05, nQuality = szHighQuality, nStack = 3 }, -- M¶nh kx 7
        { tbProp = { 2, 1, 50028 }, nStatus = nStatus, nRate = 0.001, nQuality = szHighQuality }, -- Cæ Phæ- Tói Tµn QuyÓn
        { tbProp = { 2, 1, 31505 }, nStatus = nStatus, nRate = 0.005, nQuality = szHighestQuality }, -- Bao ®¸ quý cÊp 7
        { tbProp = { 2, 1, 31410 }, nStatus = nStatus, nRate = 0.005, nQuality = szHighestQuality }, -- Tói s¸ch kü n¨ng thó c­ng cÊp 6
    }

    tbAwardLuck = gf_MergeTable(tbAwardLuck, tbVipAward)
    if KsgPlayer:IsVipAccount() then
        nStatus = 1
    end

    local nRate = 0
    for k, v in tbAwardLuck do
        nRate = nRate + v.nRate
    end

    KsgLog:Print("Rate Tói Quµ HiÖn lµ  " .. nRate)

    local tbAdditionAward = {

    }
    if CanModifyExp(nExp) ~= 1 then
        if KsgLib:IsRate(50) then
            tinsert(tbAdditionAward, { nRepute = 10 })
        else
            tinsert(tbAdditionAward, { nFactionPoint = 10 })
        end
    end
    if 1 == KsgItem:DeleteByIndex(nItemIndex) then
        if CanModifyExp(nExp) == 1 then
            KsgPlayer:BigAddExp(nExp)
        end
        KsgAward:Give(tbAwardLuck, 'Tói quµ Vâ L©m 2-May m¾n')
        if getn(tbAdditionAward) > 0 then
            KsgAward:Give(tbAdditionAward, 'Tói quµ Vâ L©m 2-Th­ëng Thªm')
        end
    end
end
