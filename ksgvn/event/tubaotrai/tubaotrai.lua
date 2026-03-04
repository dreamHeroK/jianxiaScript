Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\tubaotrai\\tubaotrai_head.lua')

function tubaotrai_GiveHuyenThach(tEvent, data, para)
    if GetFreeItemRoom() < 1 then
        return 0
    end
    KsgAward:Give(g_tbTuBaoTrai_TaskAward)
end

function tubaotrai_OnNpcTalk()
    if KsgTask:Get(TASKID_TUBAOTRAI_VERSION) ~= EVENT_TUBAOTRAI_VERSION then
        KsgTask:Set(TASKID_TUBAOTRAI_VERSION, EVENT_TUBAOTRAI_VERSION, TASK_ACCESS_CODE_TUBAOTRAI)
        KsgTask:Set(TASKID_TUBAOTRAI_AWARD, 0, TASK_ACCESS_CODE_TUBAOTRAI)
        KsgTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI)
    end
    local szTitle = g_szTuBaoNpcName .. "GÇn ®©y c¸c Chñ Th­¬ng Héi nhËn ®­îc lêi mêi cña mét ng­êi thÇn bÝ ®Õn TuyÒn Ch©u, kh«ng l©u sau trong giang hå cã tin ®ån: Chñ Th­¬ng Héi ë kh¾p n¬i ®· lËp mét tæ chøc cã tªn 'Tô B¶o Trai', ®ång thêi thu thËp mét l­îng lín vËt phÈm trong V¹n KiÕm Tròng, §Þa HuyÒn Cung vµ L­¬ng S¬n cã tªn lµ 'HuyÒn Th¹ch', tiÕc lµ b¶n tÝnh cña th­¬ng nh©n còng keo kiÖt, c¸c ®¹i hiÖp nhËn ®­îc vËt phÈm g× trong Tô B¶o Trai th× ph¶i xem c¬ duyªn cña m×nh.";
    local tSay = {
        szTitle,
        format("Më Tô B¶o Trai (Kú %d)/tubaotrai_Open", EVENT_TUBAOTRAI_VERSION),
        "NhËn th­ëng tÝch lòy Tô B¶o Trai/tubaotrai_GetAccumulateAward",
        "NhËn HuyÒn Th¹ch (chØ danh phËn §¹i HiÖp)/tubaotrai_VIPGiftHuyenThach",
        "\nTa chØ ®Õn xem th«i/no"
    }
    KsgNpc:SayDialog(tSay)
end

function tubaotrai_Open()
    SendScript2Client("Open[[JbzBox]]")
end

function tubaotrai_VIPGiftHuyenThach()
    if KsgTask:GetBit(TASKID_TUBAOTRAI_AWARD, TASKID_TUBAOTRAI_BIT_VIP_GIFT) == 1 then
        return KsgNpc:Talk(g_szTuBaoNpcName .. "Mçi kú Tô B¶o Trai chØ cã thÓ nhËn HuyÒn Th¹ch 1 lÇn")
    end
    if not KsgPlayer:IsVipAccount() then
        return KsgNpc:Talk(g_szTuBaoNpcName .. "ChØ ng­êi ch¬i cã danh phËn §¹i HiÖp míi cã thÓ nhËn HuyÒn Th¹ch miÔn phÝ.")
    end
    if not KsgLib:HasEnoughBagRoom(1, 10, g_szTuBaoNpcName) then
        return
    end
    KsgTask:SetBit(TASKID_TUBAOTRAI_AWARD, TASKID_TUBAOTRAI_BIT_VIP_GIFT, 1, TASK_ACCESS_CODE_TUBAOTRAI)
    KsgAward:Give(g_tbTuBaoTrai_VIPGift, "Danh phËn §¹i HiÖp nhËn HuyÒn Th¹ch")
end

function tubaotrai_GetAccumulateAward(nIndex)
    local nSpinNum = KsgTask:Get(TASKID_TUBAOTRAI_LOTTERY_NUM)
    local szSpinNum = format("<enter>(Sè lÇn rót th­ëng may m¾n cña ®¹i hiÖp hiÖn t¹i lµ <color=green>%d<color> lÇn)", nSpinNum)
    if nIndex then
        local nStatus = KsgTask:GetBit(TASKID_TUBAOTRAI_AWARD, 2 + nIndex)
        if not g_tbTuBaoTrai_AccumulateAward[nIndex] then
            return KsgNpc:FormalTalk(g_szTuBaoNpcName, "h×nh nh­ chän sai råi, phÇn th­ëng nµy hiÖn kh«ng cã ë chç ta")
        end
        local tbAccumulate = g_tbTuBaoTrai_AccumulateAward[nIndex]
        if nSpinNum < tbAccumulate.nRequireNum then
            return KsgNpc:FormalTalk(g_szTuBaoNpcName, format("ch­a ®¹t ®ñ %d lÇn tÝch lòy rót th­ëng, kh«ng thÓ nhËn phÇn th­ëng mèc nµy %s", tbAccumulate.nRequireNum, szSpinNum))
        end
        if nStatus == 1 then
            return KsgNpc:FormalTalk(g_szTuBaoNpcName, "®· nhËn phÇn th­ëng nµy råi.")
        end
        if not KsgLib:HasEnoughBagRoom(3, 10, g_szTuBaoNpcName) then
            return
        end
        KsgTask:SetBit(TASKID_TUBAOTRAI_AWARD, 2 + nIndex, 1, TASK_ACCESS_CODE_TUBAOTRAI)
        KsgAward:Give(tbAccumulate.tbAward, "NhËn th­ëng mèc Tô B¶o Trai " .. nIndex)
        if tbAccumulate.nRequireNum == EVENT_TUBAOTRAI_MAX_LOTTERY_NUM then
            KsgTask:Set(TASKID_TUBAOTRAI_AWARD, 0, TASK_ACCESS_CODE_TUBAOTRAI)
            KsgTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI)
            KsgPlayer:Msg("Sè lÇn rót th­ëng Tô B¶o Trai ®· ®­îc ®Æt l¹i. §¹i hiÖp cã thÓ tiÕp tôc tÝch lòy rót th­ëng.")
        end
    end
    local szTitle = g_szTuBaoNpcName .. "Rót th­ëng may m¾n ®¹t sè lÇn nhÊt ®Þnh th× ®¹i hiÖp sÏ nhËn ®­îc phÇn th­ëng thªm"
    local tbStatus = { "Ch­a nhËn", "§· nhËn" }
    local tSay = {
        szTitle .. szSpinNum
    }
    for nAwardIndex, tbAccumulate in g_tbTuBaoTrai_AccumulateAward do
        local nStatus = KsgTask:GetBit(TASKID_TUBAOTRAI_AWARD, 2 + nAwardIndex) + 1
        local szStatus = tbStatus[nStatus]
        tinsert(tSay, format("TÝch lòy rót th­ëng %d lÇn nhËn ®­îc %s (%s)/#tubaotrai_GetAccumulateAward(%d)", tbAccumulate.nRequireNum, tbAccumulate.szName, szStatus, nAwardIndex))
    end
    tinsert(tSay, "\nTa chØ xem qua th«i/no")
    KsgNpc:SayDialog(tSay)
end

function tubaotrai_GetAwardInfo(nUseNum)
    for nIndex, tbAccumulate in g_tbTuBaoTrai_AccumulateAward do
        if nUseNum >= tbAccumulate.nRequireNum then
            return nIndex, tbAccumulate
        end
    end
    return 0, nil
end