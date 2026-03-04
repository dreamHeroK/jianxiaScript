KsgTask = KsgTask or {}

function KsgTask:Modify(nTaskId, nValue, nAccessCode)
    KsgTask:Set(nTaskId, KsgTask:Get(nTaskId) + nValue, nAccessCode)
end

function KsgTask:GetByte(nTaskId, nByte)
    return GetByte(KsgTask:Get(nTaskId), nByte)
end

function KsgTask:SetByte(nTaskID, nByte, nValue, nAccessCode)
    if not nValue or nValue > 255 then
        print("KsgTask:SetByte nValue > 255 or nil");
    end
    nAccessCode = nAccessCode or 0;
    KsgTask:Set(nTaskID, SetByte(KsgTask:Get(nTaskID), nByte, nValue), nAccessCode);
end

function KsgTask:Set(nTaskId, nValue, nAccessCode)
    nAccessCode = nAccessCode or 0
    SetTask(nTaskId, nValue, nAccessCode)
end

function KsgTask:Get(nTaskId)
    return GetTask(nTaskId)
end

function KsgTask:SetBit(nTaskID, nBit, nValue, nAccessCode)
    if not nValue or nValue > 1 then
        print("ERROR:KsgTask:SetBit nValue > 1 or nil");
    end
    nAccessCode = nAccessCode or 0;
    KsgTask:Set(nTaskID, SetBit(KsgTask:Get(nTaskID), nBit, nValue), nAccessCode);
end;

function KsgTask:GetBit(nTaskID, nBit)
    return GetBit(KsgTask:Get(nTaskID), nBit)
end

function KsgTask:GetPosValue(nTaskId, nStart, nEnd)
    local nTaskValue = KsgTask:Get(nTaskId)
    return KsgLib:GetPosValue(nTaskValue, nStart, nEnd)
end

function KsgTask:SetPosValue(nTaskId, nSetValue, nStart, nEnd, nAccessCode)
    local nTaskValue = KsgTask:Get(nTaskId)
    nTaskValue = KsgLib:SetPosValue(nTaskValue, nSetValue, nStart, nEnd)
    return KsgTask:Set(nTaskId, nTaskValue, nAccessCode)
end