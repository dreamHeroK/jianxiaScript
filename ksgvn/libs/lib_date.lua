KsgDate = KsgDate or {}

function KsgDate:DayInSecond(nDay)
    nDay = nDay or 1
    return nDay * 24 * 3600
end

function KsgDate:DateDiff(nFromTime, nToTime)
    local nDiffTime = nToTime - nFromTime
    local nDay = floor(nDiffTime / 86400)
    nDiffTime = mod(nDiffTime, 86400)
    local nHour = floor(nDiffTime / 3600)
    nDiffTime = mod(nDiffTime, 3600)
    local nMin = floor(nDiffTime / 60)
    return nDay, nHour, nMin
end

-- Parse date number yyyyMMdd to d, m, y
function KsgDate:Parse(nDate)
    local v = tonumber(nDate)
    local d = mod(v, 100)
    v = floor(v / 100)
    local m = mod(v, 100)
    v = floor(v / 100)
    local y = mod(v, 10000)
    return d, m, y
end

-- Parse date number yyyyMMdd to d/mm/yyyy
function KsgDate:ToString(nDate)
    local nDay, nMonth, nYear = self:Parse(nDate)
    return format("%02d/%02d/%d", nDay, nMonth, nYear) --dd/mm/yyyy
end


function KsgDate:Today(bWithTime, bWithSeconds)
    local szFormat = "%Y%m%d"
    if bWithTime then
        szFormat = szFormat .. "%H%M"
        if bWithSeconds then
            szFormat = szFormat .. "%S"
        end
    end
    return tonumber(date(szFormat))
end

function KsgDate:CurrentTestDay()
    return abs(tf_GetDayDiff(KsgLib:GetSrvCfg("tbTimeTest").nStartDate, KsgDate:Today()) or 1)
end

function KsgDate:CurrentRunningDay()
    local tbTimeOpen = KsgLib:GetSrvCfg("tbTimeOpen")
    if not tbTimeOpen then
        return 0
    end
    local diffTime = GetTime() - MkTime(tbTimeOpen.nYear, tbTimeOpen.nMonth, tbTimeOpen.nDay, tbTimeOpen.nHour, 0, 0)
    return floor(diffTime / (24 * 3600)) + 1
end

function KsgDate:TestRemainingDays()
    local nRemainingDay = abs(tf_GetDayDiff(KsgLib:GetSrvCfg("tbTimeTest").nStartDate, KsgLib:GetSrvCfg("tbTimeTest").nEndDate) or 0) - KsgDate:CurrentTestDay()
    if nRemainingDay < 0 then
        nRemainingDay = 0
    end
    return nRemainingDay
end

function KsgDate:GetDaysInMonth(nMonth, nYear)
    nYear = tonumber(nYear) or tonumber(date("%Y"))
    nMonth = tonumber(nMonth) or tonumber(date("%m"))
    local tbDaysInMonth = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
    local dayInMonth = tbDaysInMonth[nMonth]

    -- check for leap year
    if (nMonth == 2) then
        if (mod(nYear, 4) == 0) then
            if (mod(nYear, 100) == 0) then
                if (mod(nYear, 400) == 0) then
                    dayInMonth = 29
                end
            else
                dayInMonth = 29
            end
        end
    end

    return dayInMonth
end