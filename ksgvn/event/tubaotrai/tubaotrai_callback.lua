Import("\\script\\lib\\globalvalue.lua")
Import('\\script\\ksgvn\\event\\tubaotrai\\tubaotrai.lua')

function tubaotrai_GetAwardTable()
    if g_tbTuBaoTrai_Award then
        return g_tbTuBaoTrai_Award
    end
    local szFile = "\\script\\ksgvn\\event\\tubaotrai\\award.txt"
    local tbFile = new(KTabFile, szFile)
    if not tbFile then
        TabFile_Unload(szFile)
        error(szFile)
    end
    g_tbTuBaoTrai_Award = {}
    local nRow = tbFile:getRow()
    local nCol = tbFile:getCol()
    for i = 3, nRow do
        g_tbTuBaoTrai_Award[i - 2] = {}
        for j = 1, nCol do
            local cell = tbFile:getCell(i, j)
            if j ~= 1 then
                g_tbTuBaoTrai_Award[i - 2][j] = tonumber(cell)
            else
                g_tbTuBaoTrai_Award[i - 2][j] = cell
            end
        end
    end
    TabFile_Unload(szFile)
    return g_tbTuBaoTrai_Award
end

function tubaotrai_GetFreeTable()
    if g_tbTuBaoTrai_FreeAward then
        return g_tbTuBaoTrai_FreeAward
    end
    local tAll = tubaotrai_GetAwardTable()
    g_tbTuBaoTrai_FreeAward = {}
    for i = 1, getn(tAll) do
        g_tbTuBaoTrai_FreeAward[i] = { i, tAll[i][6], tAll[i][10], tAll[i][11] }
    end
    return g_tbTuBaoTrai_FreeAward
end

function tubaotrai_GetIBTable()
    if g_tbTuBaoTrai_IBAward then
        return g_tbTuBaoTrai_IBAward
    end
    local tAll = tubaotrai_GetAwardTable()
    g_tbTuBaoTrai_IBAward = {}
    for i = 1, getn(tAll) do
        g_tbTuBaoTrai_IBAward[i] = { i, tAll[i][12], tAll[i][16], tAll[i][17] }
    end
    return g_tbTuBaoTrai_IBAward
end

function tubaotrai_RandomOne(nLotteryType)
    local tAward = tubaotrai_GetFreeTable()
    if nLotteryType == EVENT_TUBAOTRAI_TYPE_IB then
        tAward = tubaotrai_GetIBTable()
    end
    local nGsGlbIndex = GLV_JBZ_AWARD_USABLE_FREE + nLotteryType - 1
    local nGsGlbCount = GetGlbValue(nGsGlbIndex)
    local nLimitTimes = 1000
    while nLimitTimes > 0 do
        local nRet = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 0)
        if nRet > 0 and nRet <= 28 then
            local bFlag = 1
            if tAward[nRet][4] > 0 then
                if nGsGlbCount < tAward[nRet][4] then
                    bFlag = nil
                else
                    bFlag = 2
                end
            end
            if bFlag then
                if tAward[nRet][3] > 0 then
                    local gvIndex = GLV_JBZ_AWARD_LIMIT_START + 28 * (nLotteryType - 1) + nRet - 1
                    local nGlobalNum = GetGlbValue(gvIndex)
                    if nGlobalNum >= tAward[nRet][3] then
                        tAward[nRet][2] = 0
                    else
                        if bFlag == 1 then
                            SetGlbValue(nGsGlbIndex, nGsGlbCount + 1)
                        elseif bFlag == 2 then
                            SetGlbValue(nGsGlbIndex, 0)
                        end
                        SetGlbValue(gvIndex, nGlobalNum + 1)
                        return nRet
                    end
                else
                    if bFlag == 1 then
                        SetGlbValue(nGsGlbIndex, nGsGlbCount + 1)
                    elseif bFlag == 2 then
                        SetGlbValue(nGsGlbIndex, 0)
                    end
                    return nRet
                end
            end
        end
        nLimitTimes = nLimitTimes - 1
    end
    return 0
end

function tubaotrai_CheckCondition()
    if not KsgLib:HasEnoughBagRoom(2, 10) then
        return 0
    end
    local nSpinNum = KsgTask:Get(TASKID_TUBAOTRAI_LOTTERY_NUM)
    if nSpinNum >= EVENT_TUBAOTRAI_MAX_LOTTERY_NUM then
        KsgNpc:Talk("Sè lÇn rót th­ëng Tô B¶o Trai ®· ®¹t tèi ®a. H·y nhËn th­ëng tÝch lòy ®Ó ®Æt l¹i sè lÇn rót th­ëng.")
        return 0
    end
    return 1
end

function tubaotrai_GiveAward(nLotteryType, nLotteryCount)
    if tubaotrai_CheckCondition() ~= 1 then
        StartJbzBox(0, 0)
        return 0
    end
    local nIndex = GetTask(TASKID_TUBAOTRAI_LOTTERY)
    local tAll = tubaotrai_GetAwardTable()
    if nIndex == 0 then
        StartJbzBox(0, 0)
        WriteLog(format("[jbz][Error][Account:%s][Name:%s]  tubaotrai_GiveAward(%d, %d) Without Random award!", GetAccount(), GetName(), nLotteryType, nLotteryCount))
        return 0
    end
    if not tAll or getn(tAll) ~= 28 then
        StartJbzBox(0, 0)
        error("award table is nil or table size ~= 28")
    end
    local tCell = tAll[nIndex]
    if not tCell or getn(tCell) < 15 then
        StartJbzBox(0, 0)
        error("award cell is nil or col ~= 15")
    end
    local nG, nD, nP = tCell[2], tCell[3], tCell[4]
    local nNum = tCell[5]
    local nStatusFree = tCell[8]
    local nStatus = tCell[14]
    local nExpiredDayFree = tCell[7]
    local nExpiredDay = tCell[13]
    local nGlobalMsgFree = tCell[9]
    local nGlobalMsg = tCell[15]
    local nQuality = 0
    if nLotteryType == EVENT_TUBAOTRAI_TYPE_FREE then
        if nGlobalMsgFree == 1 then
            nQuality = "Chóc mõng %s trong Tô B¶o Trai rót ®­îc phÇn th­ëng %d %s"
        end
        local tbAward = {
            tbProp = { nG, nD, nP }, nStack = nNum, nStatus = nStatusFree, nExpiredTime = nExpiredDayFree * 24 * 3600, nQuality = nQuality
        }
        KsgAward:Give(tbAward, "Tô B¶o Trai - Free")
        AddRuntimeStat(35, 3, nIndex, 1)
    elseif nLotteryType == EVENT_TUBAOTRAI_TYPE_IB then
        if nGlobalMsg == 1 then
            nQuality = "Chóc mõng %s trong Tô B¶o Trai rót ®­îc phÇn th­ëng %d %s"
        end
        local tbAward = {
            tbProp = { nG, nD, nP }, nStack = nNum, nStatus = nStatus, nExpiredTime = nExpiredDay * 24 * 3600, nQuality = nQuality
        }
        KsgAward:Give(tbAward, "Tô B¶o Trai - Free")
        KsgTask:Modify(TASKID_TUBAOTRAI_LOTTERY_NUM, 1, TASK_ACCESS_CODE_TUBAOTRAI)
        AddRuntimeStat(35, 4, nIndex, 1)
    end
    tubaotrai_Clean()
    if nLotteryCount > 0 and tubaotrai_StartLottery(nLotteryType, nLotteryCount) ~= 0 then
        return 1
    end
    StartJbzBox(0, 0)
end

function tubaotrai_StartLottery(nLotteryType, nLotteryCount)
    if tubaotrai_CheckCondition() ~= 1 then
        StartJbzBox(0, 0)
        return 0
    end
    local tbCondition = g_tbTuBaoTrai_ItemCost[nLotteryType]
    if not KsgLib:CheckMaterial(tbCondition) then
        StartJbzBox(0, 0)
        return 0
    end
    local nRet = tubaotrai_RandomOne(nLotteryType)
    if nRet <= 0 or nRet > 28 then
        WriteLog(format("[jbz][Error][Name:%s] tubaotrai_RandomOne (%d, %d) nRet = %d", GetName(), nLotteryType, nLotteryCount, nRet))
        StartJbzBox(0, 0)
        return 0
    end
    if not KsgLib:PayMaterial(tbCondition) then
        StartJbzBox(0, 0)
        return 0
    end
    SetTask(TASKID_TUBAOTRAI_LOTTERY, nRet, TASK_ACCESS_CODE_TUBAOTRAI)
    FireEvent("event_task_award","jubaozhai", nLotteryType);
    StartJbzBox(nLotteryType, nLotteryCount)
    AddRuntimeStat(35, nLotteryType, 0, 1)
    return 1
end

function tubaotrai_Clean()
    KsgTask:Set(TASKID_TUBAOTRAI_LOTTERY, 0, TASK_ACCESS_CODE_TUBAOTRAI)
end

tubaotrai_GetAwardTable()