-- rename_card
Import("\\script\\function\\rename\\rename_npc.lua")

function OnUse(nItemIdx)
    _rename_card_AskUse(nItemIdx)
end

function _rename_card_AskUse(nItemIdx, bSure)
    if RENAME_SWITCH ~= 1 then
        return KsgNpc:Talk("改名系统关闭")
    end
    if CheckSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD) == 1 then
        return KsgNpc:Talk("你正在使用<color=gold>改名卡<color>，但是在使用前，你可以改名字！")
    end
    if not bSure then
        local tbSay = {
            "使用<color=gold>改名卡<color>后，你将需要等待<color=red>1周<color>才能再次更改角色名或帮会名，你确定要使用吗？<enter><color=green>（使用后无法撤销）<color>",
            format("同意/#_rename_card_AskUse(%d, 1)", nItemIdx),
            "退出/nothing",
        }
        return KsgNpc:SayDialog(tbSay)
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD, 0)
        WriteLog(format("[RENAME] [使用改名卡] [账户:%s, 角色:%s]", GetAccount(), GetName()))
  --      NewWorld(200, 1469, 2752)
    end
    -- 这里应该添加统计部分
end


