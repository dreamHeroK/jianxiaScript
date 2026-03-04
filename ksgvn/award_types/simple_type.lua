SimpleType = {}
SimpleType.szKey = ""
SimpleType.pFun = nil
SimpleType.isValid = function(nAmount)
    return nAmount > 0
end

function SimpleType:new(szKey)
    local tb = {}
    for k, v in SimpleType do
        tb[k] = v
    end
    tb.szKey = szKey
    return tb
end

function SimpleType:Give(tbItem, szLogTitle, nAwardCount)
    local var = tbItem[self.szKey]
    if not var then
        return
    end
    if type(var) == "string" then
        local amount = (nAwardCount or 1) * (tbItem.nCount or 1)
        for _ = 1, amount do
            if self.szKey == "nAwardGroup" then
                CustomAwardGiveGroup(var, 0)
            end
            if self.szKey == "nFunc" then
                dostring(var)
            end
        end
        self:WriteLog(amount, szLogTitle)
        return
    end

    local nAmount = var * (nAwardCount or 1) * (tbItem.nCount or 1)

    if type(self.pFun) == "string" and self.isValid(nAmount) == 1 then
        dostring(format(self.pFun, nAmount))
        self:Msg2Player(nAmount)
        self:WriteLog(nAmount, szLogTitle)
        return
    end
    if type(self.pFun) == "function" and self.isValid(nAmount) == 1 then
        self.pFun(nAmount)
        self:Msg2Player(nAmount)
        self:WriteLog(nAmount, szLogTitle)
        return
    end

end

function SimpleType:Msg2Player(nAmount)
    if self.szMsgFormat then
        KsgPlayer:Msg(format(self.szMsgFormat, nAmount))
    end
end

function SimpleType:WriteLog(nAmount, szLogTitle)
    if szLogTitle then
        local szName = self.szKey or ""
        WriteLog("[AWARD_TEMPLATE] " .. szLogTitle .. "\t" .. KsgPlayer:GetAccount() .. "\t" .. KsgPlayer:GetName() .. "\t" .. szName .. " Amount: " .. nAmount)
    end
end