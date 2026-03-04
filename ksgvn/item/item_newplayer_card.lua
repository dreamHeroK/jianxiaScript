-- Lib Core
Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\gm.lua")

-- Events
Import("\\script\\ksgvn\\event\\newplayer\\newplayer.lua")

-- Others
Import("\\script\\function\\vip_card\\vc_head.lua")
Import("\\script\\function\\cdkey\\ck_head.lua")

g_szTitle = "<color=green>T©n Thñ LÖnh: <color>"

_g_tbAccountNeedFix = {

}

DENBU_END_DATE = 20201205
DENBU_TASK_ID = TASKID_COMPENSATION_BIT_TL0412

MERGE_SERVER_AWARD_DATE = 20210305
MERGE_SERVER_TASK_BIT = TASKID_COMPENSATION_BIT_MERGE_SERVER4
MERGE_SERVER_ID = 7

_g_tbBattleHonor = {
    [1] = {
        szName = "Kh«ng dïng Qu©n C«ng Ch­¬ng",
        tbCondition = {
            nBigLevel = 891,
        },
        tbAward = {
            { nHonor = 2500 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 },
        }
    },
    [2] = {
        szName = "Dïng Qu©n C«ng Ch­¬ng",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 9999 }, nCount = 1 }
            }
        },
        tbAward = {
            { nHonor = 5000, },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 2 },
        }
    },
    [3] = {
        szName = "Dïng Qu©n C«ng Ch­¬ng (®¹i)",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 9998 }, nCount = 1 }
            }
        },
        tbAward = {
            { nHonor = 12500 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 5 },
        }
    },
    [4] = {
        szName = "Dïng Qu©n C«ng Ch­¬ng Huy Hoµng",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 9977 }, nCount = 1 }
            }
        },
        tbAward = {
            { nHonor = 25000 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 10 },
        }
    },
    [5] = {
        szName = "Dïng Qu©n C«ng Ch­¬ng Vinh Dù",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 30642 }, nCount = 1 }
            },
        },
        tbAward = {
            { nHonor = 35000 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 14 },
        }
    },
}

function OnUse(nItemIndex)
    local nRemainTime = GetVipCardRemainTime()
    local szAccState = format("B¹n lµ <color=yellow>§¹i HiÖp Vâ L©m (Cßn %d ngµy)<color>", ceil(nRemainTime / (24 * 3600)))
    if (nRemainTime <= 0) then
        szAccState = "HiÖn b¹n <color=red>ch­a kÝch ho¹t danh phËn §¹i HiÖp Vâ L©m<color>"
    end
    local szHead = g_szTitle .. format("Chµo mõng ®Õn víi <color=fire> Vâ L©m TruyÒn Kú 2<color>. <color=yellow>Sè ngµy më m¸y chñ: %d ngµy. <color>%s, h·y chän chøc n¨ng hç trî d­íi ®©y:", KsgDate:CurrentRunningDay(), szAccState)
    local tSay = {
        szHead
    }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "Ta muèn gia nhËp m«n ph¸i vµ häc kü n¨ng/kgm_ChangeRoute")
    else
        if vc_IsVipCardOpen() ~= 0 then
            tinsert(tSay, 2, vc_GetMainTitle())
        end
        -- TODO Add stub here
        if KsgTask:GetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER) ~= 1 and GetExtPoint(EXTPOINT_GIFTCODE_NEWPLAYER) >= 1 then
            tinsert(tSay, "NhËn th­ëng Giftcode Ngäa Hæ Tµng Long/newplayer_ActiveGiftCode")
        end
        if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT) ~= 1 then
            tinsert(tSay, "NhËn phÇn th­ëng ngµy/newplayer_GetDailyGift")
        end
        local wDay = tonumber(date("%w"))
        if wDay == 6 or wDay == 0 then
            if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT) ~= 1 then
                tinsert(tSay, "NhËn phÇn th­ëng tuÇn/newplayer_GetWeeklyGift")
            end
        end
        local nToday = KsgDate:Today()
        if nToday <= DENBU_END_DATE and KsgTask:GetBit(TASKID_COMPENSATION, DENBU_TASK_ID) ~= 1 then
            tinsert(tSay, "NhËn ®Òn bï Tèng Liªu ngµy 04-12/_denbu_BaoTri")
        end

        if nToday <= MERGE_SERVER_AWARD_DATE and KsgTask:GetBit(TASKID_COMPENSATION, MERGE_SERVER_TASK_BIT) ~= 1 and KsgLib:GetServerId() == MERGE_SERVER_ID then
            tinsert(tSay, "NhËn quµ gép m¸y chñ/_denbu_GopServer")
        end

        --if newplayer_HasRebornAward() then
        --    tinsert(tSay, "NhËn th­ëng cÊp vµ hç trî lªn chuyÓn sinh 8, 9, 10/newplayer_ShowSupportRebornAward")
        --end
        tinsert(tSay, "KÝch ho¹t linh ph¸ch Vò khÝ/weaponEffect_Show")
        tinsert(tSay, "Ho¹t ®éng Code/handle_npc_talk_huodongdashi")
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó (h«m nay ch­a nhËn)/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "NhËn ¸m KhÝ vµ C¬ Quan (h«m nay ch­a nhËn)/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "NhËn X¸ Lîi Kim §¬n (h«m nay ch­a nhËn)/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "NhËn ChiÕn M·/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "NhËn ChiÕn M· vµ Tô TiÔn (h«m nay ch­a nhËn)/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "NhËn Phong Thi Phï (h«m nay ch­a nhËn)/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "NhËn Cæ (h«m nay ch­a nhËn)/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "Hç trî nu«i TiÓu §iªu (h«m nay ch­a nhËn)/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "NhËn Linh KiÕm vµ Lß LuyÖn KiÕm/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "\nKÕt thóc ®èi tho¹i/no")
    KsgNpc:SayDialog(tSay)
end

function _denbu_BaoTri(nType)
    if not nType then
        local tSay = {
            g_szTitle .. "H·y chän h×nh thøc nhËn ®Òn bï:",
        }
        for nIndex, tbCfg in _g_tbBattleHonor do
            tinsert(tSay, format("NhËn ®Òn bï - %s/#_denbu_BaoTri(%d)", tbCfg.szName, nIndex))
        end
        tinsert(tSay, "\nT¹m ch­a muèn nhËn/no")
        return KsgNpc:SayDialog(tSay)
    end
    if not nType or not _g_tbBattleHonor[nType] then
        return KsgNpc:Talk(g_szTitle .. "Kh«ng cã lùa chän nµy.")
    end
    local tbCfg = _g_tbBattleHonor[nType]

    --if not KsgLib:IsInTable(KsgPlayer:GetAccount(), _g_tbAccountNeedFix) then
    --    return KsgNpc:Talk(g_szTitle .. "C¸c h¹ kh«ng n»m trong danh s¸ch nhËn ®Òn bï.")
    --end

    if KsgDate:Today() > DENBU_END_DATE then
        return KsgNpc:Talk(g_szTitle .. "§· qu¸ thêi h¹n nhËn ®Òn bï")
    end

    if KsgTask:GetBit(TASKID_COMPENSATION, DENBU_TASK_ID) == 1 then
        return KsgNpc:Talk(g_szTitle .. "C¸c h¹ ®· nhËn quµ ®Òn bï nµy råi.")
    end

    if not KsgLib:HasEnoughBagRoom(5) then
        return
    end

    if KsgLib:PayMaterial(tbCfg.tbCondition) then
        KsgTask:SetBit(TASKID_COMPENSATION, DENBU_TASK_ID, 1)
        KsgAward:Give(tbCfg.tbAward, "NhËn ®Òn bï b¶o tr×")
        return KsgNpc:Talk(g_szTitle .. format("C¸c h¹ ®· nhËn thµnh c«ng quµ ®Òn bï, h×nh thøc nhËn: <color=gold>%s<color>.", tbCfg.szName))
    end
end

function _denbu_GopServer()
    if KsgLib:GetServerId() ~= MERGE_SERVER_ID then
        return KsgNpc:Talk(g_szTitle .. "C¸c h¹ kh«ng n»m trong danh s¸ch nhËn quµ.")
    end

    if KsgPlayer:GetBigLevel() < 992 then
        return KsgNpc:Talk(g_szTitle .. "Nh©n vËt ®¹t chuyÓn sinh 9 cÊp 92 trë lªn míi cã thÓ nhËn th­ëng")
    end

    if KsgDate:Today() > MERGE_SERVER_AWARD_DATE then
        return KsgNpc:Talk(g_szTitle .. "§· qu¸ thêi h¹n nhËn phÇn quµ nµy")
    end

    if KsgTask:GetBit(TASKID_COMPENSATION, MERGE_SERVER_TASK_BIT) == 1 then
        return KsgNpc:Talk(g_szTitle .. "C¸c h¹ ®· nhËn phÇn quµ nµy råi.")
    end

    KsgTask:SetBit(TASKID_COMPENSATION, MERGE_SERVER_TASK_BIT, 1)
    KsgAward:Give({ tbProp = { 2, 1, 50256 }, nStatus = 4, }, "NhËn quµ gép server")
    return KsgNpc:Talk(g_szTitle .. "NhËn thµnh c«ng quµ gép m¸y chñ.")
end
