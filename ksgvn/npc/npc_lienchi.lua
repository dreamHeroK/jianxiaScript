Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\event\\newplayer\\newplayer.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

g_szNpcName = "<color=green>Liªn Chi<color>: "

_g_tbCompensationList = {
    "NMKRoBot2020",
    "CS1RoBot2021",
    "oCFiTiªu§×nhHiªn",
    "oCFiCËuBÐBótCh×i",
    "RebLux",
    "oCFiNgäaLong",
    "TLQRoBot2019",
    "B¾c§¹iThiÕuGia",
    "iHNxAlineLidda",
    "iHPzzzDatKyii",
    "NMKzzSokboy",
    "MrSokboy"
}

_g_tbCompensationBug5Doc = {
    "ZzChuyªnTrémChãz"
}

function main()
    if KsgLib:IsTestServer() then
        return KsgNpc:Talk("C¸c h¹ ®Õn ®©y cã viÖc g× kh«ng?")
    end
    local tMenuOptions = {
        "§¹i hiÖp t×m ta cã viÖc g× kh«ng?",
        format("Sù kiÖn %s/monthlyEvent_OnNpcTalk", g_monthlyEvent_Name),
    }
    if KsgTask:GetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER) ~= 1 then
        tinsert(tMenuOptions, "Ta ®Õn nhËn th­ëng Ngäa Hæ Tµng Long/newplayer_ActiveGiftCode")
    end
    if KsgDate:Today() <= EVENT_SPEND_COIN_END_DATE and KsgDate:Today() >= EVENT_SPEND_COIN_START_DATE then
        tinsert(tMenuOptions, format("Ta ®Õn nhËn th­ëng Tiªu PhÝ/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_AWARD_SPEND_MONEY))
    end
    if KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationList) and KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_HONOR_19_07) ~= 1 and KsgDate:Today() <= 20200722 then
        tinsert(tMenuOptions, "Ta ®Õn nhËn ®Òn bï HiÖp Lé ngµy 19-07/_lienChi_DenBuHiepLo")
    end
    if KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationBug5Doc) and KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_5DOC) ~= 1 and KsgDate:Today() <= 20200729 then
        tinsert(tMenuOptions, "NhËn ®Òn bï/_lienChi_DenBuBug5Doc")
    end
    tinsert(tMenuOptions, "\nTa chØ tiÖn ghÐ qua/no")
    KsgNpc:SayDialog(tMenuOptions)
end

function _lienChi_DenBuHiepLo()
    if not KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationList) then
        return KsgNpc:Talk("C¸c h¹ kh«ng cã trong danh s¸ch nhËn ®Òn bï")
    end
    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_HONOR_19_07) == 1 then
        return KsgNpc:Talk("C¸c h¹ ®· nhËn phÇn quµ ®Òn bï nµy råi!")
    end
    KsgAward:Give({ nHonor = 50000 }, "§Òn bï HiÖp Lé 19-07")
    KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_HONOR_19_07, 1)
    KsgNpc:Talk("Thµnh c«ng, nhËn ®­îc quµ ®Òn bï <color=gold>50.000<color> ®iÓm c«ng tr¹ng.")
end

function _lienChi_DenBuBug5Doc()
    if not KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationBug5Doc) then
        return KsgNpc:Talk("C¸c h¹ kh«ng cã trong danh s¸ch nhËn ®Òn bï")
    end
    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_5DOC) == 1 then
        return KsgNpc:Talk("C¸c h¹ ®· nhËn phÇn quµ ®Òn bï nµy råi!")
    end
    KsgAward:Give({ nHonor = 500e3, nExp = 10e9 }, "§Òn bï sù cè bug ngò ®éc")
    KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_5DOC, 1)
end

