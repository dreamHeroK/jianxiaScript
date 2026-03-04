--粘贴心得
function OnUse(id)
    local nRet = InsertAddenda(id) -- 粘贴附录
    if nRet == -2 then
        Msg2Player("你的密码被锁了，不能粘贴附录！")
    elseif nRet == -3 then
        Msg2Player("秘籍已满！不能添加！")
    elseif nRet == -4 then
        Msg2Player("规则要求不能同时使用相同的诀要类型！")
    elseif nRet == -5 then
        Msg2Player("非法操作，无法添加诀要！")
    end
end

