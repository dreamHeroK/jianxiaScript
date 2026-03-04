Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\function\\rename\\rename_head.lua")

g_szNpcName = "<color=green>我是大奶<color>: "

function main()
    local tSay = {
        g_szNpcName .. "你是否因为担心被追踪而想要更改你的<color=yellow>角色名或帮会名<color>呢？"
    }
    if RENAME_SWITCH == 1 then
        for nType, szTypeName in pairs(_g_tbTypeNames) do
            tinsert(tSay, format("更改 %s/#request_rename(%d)", szTypeName, nType))
        end
    end
    tinsert(tSay, "\n我只是路过/no")

    KsgNpc:SayDialog(tSay)
end

function request_rename(nType)
    if RENAME_SWITCH ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "为什么不能进行这个操作？")
    end
    if CheckSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD) ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "你没有使用<color=gold>改名卡<color>，请先获得改名卡再来找我！")
    end
    if _g_tbSwitches[nType] and _g_tbSwitches[nType] ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "为什么不能进行这个操作？")
    end
    if nType == RENAME_TYPE_PLAYER then
        request_rename_player()
    elseif nType == RENAME_TYPE_TONG then
        request_rename_tong()
    else
        return KsgNpc:Talk(g_szNpcName .. "为什么不能进行这个操作？")
    end
end

function request_rename_player()
    local isTongMember = IsTongMember() or 0
    local szTong = GetTongName() or ""
    if szTong ~= "" or isTongMember > 0 then
        return KsgNpc:Talk(g_szNpcName .. "你现在有帮会！请先退出帮会再来进行角色名更改！")
    end

    RenameQuerySubmitedName(GetName(), RENAME_TYPE_PLAYER)
end

function request_rename_tong()
    if IsTongMaster() ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "只有帮主才有权力更改帮会名！")
    end
    RenameQuerySubmitedName(GetTongName(), RENAME_TYPE_TONG)
end