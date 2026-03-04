-- Rename Callback
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\function\\rename\\rename_head.lua")

g_szInfoHeader = "<color=green>提示信息<color>: "

function RenameQuerySubmitedNameCallBack(nResult, szOldName, szNewName, nType)
    if nResult == 0 and nType == RENAME_TYPE_TONG then
        KsgNpc:Talk(g_szInfoHeader .. "更改公会名称失败，不能更改！")
        return 0
    end
    local tSay = {}
    if _g_tbTypeNames[nType] then
        --更改公会名称
        if IsTongMaster() ~= 1 and nType == RENAME_TYPE_TONG then
            --公会会长可以更改
            KsgNpc:Talk(g_szInfoHeader .. "只有公会会长可以申请更改公会名称！")
            return 0
        end
        local szTypeName = _g_tbTypeNames[nType]
        --更改昵称
        if szNewName == "" then
            tSay = {
                format(g_szInfoHeader .. "更改%s的名称必须是%d-%d个字符，不得包含非法字符。你确定要更改%s吗？", szTypeName, RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, szTypeName),
                format("我决定更改%s。请帮我！/#request_rename(%d)", szTypeName, nType),
                "\n我要再考虑一下。/no",
            }
            KsgNpc:SayDialog(tSay)
        else
            tSay = {
                g_szInfoHeader .. format("你确定将%s更改为<color=yellow>%s<color>吗？是否需要更改或取消？", szTypeName, szNewName),
                format("我决定更改%s。/#request_rename(%d)", szTypeName, nType),
                format("取消更改%s。/#cancel_rename(%d)", szTypeName, nType),
                "\n退出。/no",
            }
            KsgNpc:SayDialog(tSay)
        end
    else
        WriteLog("[RENAME] [更改名称错误]: RenameQuerySubmitedNameCallBack 参数nType错误: " .. tostring(nType))
    end
end

function RenameSumbitCallBack(nResult, szOldName, szNewName, nType)
    if nResult <= 0 then
        KsgNpc:Talk(g_szInfoHeader .. "更改名称失败，不符合规则，请重试！")
        return 0
    end
    local nTime = tonumber(date("%Y%m%d%H%M%S"))
    if szNewName == "" then
        Say(g_szInfoHeader .. "操作取消，名称未更改成功！", 0)
        WriteLog(format("[RENAME] 取消更改名称, 时间: %d, 账户: %s, 角色: %s", nTime, GetAccount(), GetName()))
        return 0
    end
    if _g_tbTypeNames[nType] then
        local szType = _g_tbTypeNames[nType]
        Say(g_szInfoHeader .. format("你已成功将%s更改为<color=yellow>%s<color>！请不要将此信息透露给他人。操作记录将保留30天。", szType, szNewName), 0)
        local szCurrentName = GetName()
        if nType == RENAME_TYPE_TONG then
            szCurrentName = GetTongName()
        end
        WriteLog(format("[RENAME] 更改%s的名称成功, 时间: %d, 账户: %s, 角色: %s, 原名称: %s, 新名称: %s", szType, nTime, GetAccount(), GetName(), szCurrentName, szNewName))
    else
        WriteLog("[RENAME] [更改名称错误]: RenameSumbitCallBack 参数nType错误: " .. tostring(nType))
    end
end

function request_rename(nType)
    if nType == RENAME_TYPE_PLAYER then
        AskClientForString("submit_name_p", "", RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, "输入新角色名称")
    elseif nType == RENAME_TYPE_TONG then
        AskClientForString("submit_name_t", "", RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, "输入新公会名称")
    end
end

function submit_name_p(szNewName)
    RenameSubmit(szNewName, RENAME_TYPE_PLAYER)
end

function submit_name_t(szNewName)
    RenameSubmit(szNewName, RENAME_TYPE_TONG)
end

function cancel_rename(nType)
    RenameSubmit("", nType)
end
