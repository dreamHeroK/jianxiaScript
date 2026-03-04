Import("\\script\\ksgvn\\lib.lua")

FAIR_LV_MAX = 3 --VN:»¯¾³µÈ¼¶ÉÏÏÞ
FAIR_LV_ROUND = 3 --VN:Éý¼¶»¯¾³ÐèÒª¼¤»îËùÓÐÐÇËÞµÄÂ×´Î
FAIR_STAR_NUM = 10 --VN:Ã¿ÂÖÓÐ¶àÉÙ¿ÅÐÇÐÇ
FAIR_STAR_LV_MAX = (FAIR_STAR_NUM * FAIR_LV_ROUND * FAIR_LV_MAX) --VN:»¯¾³ÐÇÐÇµÈ¼¶ÉÏÏÞ
g_tFairBaseNeedLingpo = { -- ÁéÆÇµ¤ÏûºÄ»ù×¼
    2, 4, 6--10,20,30
}
g_tFairBaseNeedHuixian = { -- »ØÏÉµ¤ÏûºÄ»ù×¼
    5, 10, 15
}
TASKID_FAIR_UP_FLAG = 3511
TASKID_FAIR_VALUE = 3510

function fair_Recall(nConfirm)
    local nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua = fair_GetRecallCount()
    if nTotalHoiTienDan == 0 then
        return KsgNpc:Talk("C¸c h¹ ch­a hãa c¶nh, kh«ng thÓ nhËn ®Òn bï.")
    end
    if not KsgLib:HasEnoughBagRoom(7) then
        return
    end
    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    if not nConfirm then
        local tSay = {
            format("§¹i hiÖp ®· hãa c¶nh %d m¹ch, nhËn ®­îc <color=gold>%d Håi Tiªn §¬n<color> vµ <color=gold>%d Linh Ph¸ch §¬n<color> ®Òn bï, ®¹i hiÖp muèn nhËn ngay kh«ng?", nFairLv, nTotalHoiTienDan, nTotalLinhPhachDan),
            format("Ta muèn nhËn /#fair_Recall(1)"),
            "\nT¹m ch­a muèn nhËn/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    SetTask(TASKID_FAIR_VALUE, 0)
    SetTask(TASKID_FAIR_UP_FLAG, 0)
    KsgAward:Give({
        { tbProp = { 2, 1, 31239 }, nStack = nTotalLinhPhachDan, nStatus = 4 },
        { tbProp = { 2, 1, 30847 }, nStack = nTotalHoiTienDan, nStatus = 4 },
        { tbProp = { 2, 1, 50016 }, nStack = nTotalTuiQua, nStatus = 4 },
    }, "§Òn bï ®ãng Hãa C¶nh")
    KsgNpc:Talk(format("NhËn ®Òn bï thµnh c«ng, thu l¹i ®­îc <color=gold>%d Håi Tiªn §¬n<color> vµ <color=gold>%d Linh Ph¸ch §¬n<color>."))
end

function fair_GetRecallCount()
    if GetTask(TASKID_FAIR_UP_FLAG) == 0 then
        return 0, 0, 0
    end
    local nTotalLinhPhachDan = 0
    local nTotalHoiTienDan = 0
    local nTotalTuiQua = 0

    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    local nMaxFairLv = FAIR_LV_MAX * 30
    for i = 1, nMaxFairLv do
        if nFairLv >= i then
            local nFair = floor(i / (FAIR_LV_ROUND * FAIR_STAR_NUM))
            local nRound = mod(floor(i / FAIR_STAR_NUM), FAIR_LV_ROUND) + 1
            local nNeedLingpo = g_tFairBaseNeedLingpo[nRound] + nFair
            local nNeedHuixian = g_tFairBaseNeedHuixian[nRound] + nFair
            nTotalHoiTienDan = nTotalHoiTienDan + nNeedHuixian
            nTotalLinhPhachDan = nTotalLinhPhachDan + nNeedLingpo
            nTotalTuiQua = nTotalTuiQua + 10
        end
    end
    return nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua
end