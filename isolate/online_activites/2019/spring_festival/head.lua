
SF2019_BEGIN_DATE = {
    year = 2021,
    month = 2,
    day = 1,
}
SF2019_END_DATE = {
    year = 2021,
    month = 2,
    day = 28,
}

SF2019_FULL_BEGIN_DATE = SF2019_BEGIN_DATE.year*10000 + SF2019_BEGIN_DATE.month * 100 + SF2019_BEGIN_DATE.day
SF2019_FULL_END_DATE = SF2019_END_DATE.year*10000 + SF2019_END_DATE.month * 100 + SF2019_END_DATE.day



SF2019_ACT_NAME = "N╩ m韎 m鮪g xu﹏"
SF_LOG_KEY_WORD = "Ho箃 ng T誸  L辌h 2021"
SF2019_TASKGROUP = {4,19}
NM2019_MaxUseFirework = 4
ZZ2019_MaxUseZZ = 10
NYF2019_DATE = 20210226
QRJ2019_DATE = 20210214
--情人节任务链gtask中的任务id, 必须按顺序配
QRJ_GTASKID_TABLE = {
    [1] = {586,587,588,589}, --male
    [2] = {590,591,592,593}, --female
}

SF2019_TICKET_BEGIN_DATE = 20210218
SF2019_TICKET_END_DATE = 20210228

SF2019_DEBUG = 0

function sf2019_check_ticket_award_date()
    if SF2019_DEBUG == 1 then return 1 end
    local nCurDate = tonumber(date("%Y%m%d"))
    if nCurDate < SF2019_TICKET_BEGIN_DATE then
        return 0
    end
    if nCurDate > SF2019_TICKET_END_DATE then
        return 2
    end
    return 1
end

function sf2019_check_main_date()
    if SF2019_DEBUG == 1 then return 1 end
    local nCurDate = tonumber(date("%Y%m%d"))
    if nCurDate < SF2019_FULL_BEGIN_DATE or nCurDate > SF2019_FULL_END_DATE then
        return 0
    end
    return 1
end

function sf2019_check_qrj_date()
    if SF2019_DEBUG == 1 then return 1 end
    local nCurDate = tonumber(date("%Y%m%d"))
    if nCurDate < QRJ2019_DATE or nCurDate > QRJ2019_DATE then
        return 0
    end
    return 1
end

function sf2019_check_nyf_date()
    if SF2019_DEBUG == 1 then return 1 end
    local nCurDate = tonumber(date("%Y%m%d"))
    if nCurDate ~= NYF2019_DATE then
        return 0
    end
    return 1
end

function sf2019_rest_time(...)
    local nArgSize = getn(arg);
    if nArgSize < 1 then
        return 0
    end
	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
    local nTimePassed = floor(nThatTime - nCurTime)/2;
    return nTimePassed*2
end