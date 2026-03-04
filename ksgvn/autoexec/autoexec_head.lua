AutoFunctions = {
    m_Functions = {}
}

function AutoFunctions:Add(func, param)
    if (func ~= nil) then
        local tb = {}
        tb.Func = func
        tb.Param = param
        tinsert(self.m_Functions, tb)
    end
end

function AutoFunctions:Run()
    for i = 1, getn(self.m_Functions) do
        local tb = self.m_Functions[i]
        tb.Func(tb.Param)
    end
end
