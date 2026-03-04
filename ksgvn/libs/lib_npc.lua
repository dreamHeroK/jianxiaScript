KsgNpc = KsgNpc or {}

function KsgNpc:Talk(szMsg, bMsgToPlayer, szCallback)
    szCallback = szCallback or ''
    Talk(1, szCallback, szMsg)
    if bMsgToPlayer then
        KsgPlayer:Msg(szMsg)
    end
end

function KsgNpc:FormalTalk(szNpcName, szMsg, bMsgToPlayer, szCallback)
    szMsg = szNpcName .. KsgPlayer:GetSexName() .. " " .. szMsg
    KsgNpc:Talk(szMsg, bMsgToPlayer, szCallback)
end

function KsgNpc:SayDialog(tMenuOptions)
    local szMsg, szSelect = "", ""
    local nOptionCount = getn(tMenuOptions)

    if nOptionCount < 2 then
        return
    end

    if nOptionCount > 2 then
        for i = 2, nOptionCount - 1 do
            szSelect = szSelect .. format("%q", tMenuOptions[i]) .. ","
        end
        szSelect = szSelect .. format("%q", tMenuOptions[nOptionCount])
        szMsg = "Say(" .. format("%q", tMenuOptions[1]) .. "," .. (nOptionCount - 1) .. "," .. szSelect .. ")"
    elseif nOptionCount == 2 then
        szSelect = format("%q", tMenuOptions[nOptionCount])
        szMsg = "Say(" .. format("%q", tMenuOptions[1]) .. ",1" .. "," .. szSelect .. ")"
    end

    dostring(szMsg)
end

function KsgNpc:PageSay(tbSay, nStart, nPerPage)
    if not tbSay then
        return
    end
    nPerPage = nPerPage or PAGESAY_SELECT_OPTION_PER_PAGE
    g_tbPageSay = g_tbPageSay or {}
    g_tbPageSay[GetName()] = tbSay
    function _PageSay(nStartDialogNum, nEveryPage)
        if not nStartDialogNum then
            nStartDialogNum = 2
        end
        if not nEveryPage then
            nEveryPage = PAGESAY_SELECT_OPTION_PER_PAGE
        end
        local nCount = getn(g_tbPageSay[GetName()])
        local nLen = nEveryPage
        if nStartDialogNum + nEveryPage - 1 > nCount then
            nLen = nCount - nStartDialogNum + 1
        end
        local tbCurrentlyShow = {}
        tinsert(tbCurrentlyShow, 1, "\nKÕt thóc ®èi tho¹i/no")
        if nStartDialogNum ~= 2 then
            tinsert(tbCurrentlyShow, 1, format("%s/#_PageSay(2,%d)", "Trë l¹i", nEveryPage))
        end
        if nStartDialogNum + nEveryPage - 1 < nCount then
            tinsert(tbCurrentlyShow, 1, format("%s/#_PageSay(%d,%d)", "Trang kÕ", nStartDialogNum + nEveryPage, nEveryPage))
        end
        if nStartDialogNum ~= 2 then
            tinsert(tbCurrentlyShow, 1, format("%s/#_PageSay(%d,%d)", "Trang tr­íc", nStartDialogNum - nEveryPage, nEveryPage))
        end
        for i = 1, nLen do
            tinsert(tbCurrentlyShow, 1, format(g_tbPageSay[GetName()][nStartDialogNum + nLen - i], nStartDialogNum + nLen - i))
        end
        Say(g_tbPageSay[GetName()][1], getn(tbCurrentlyShow), tbCurrentlyShow)
    end
    _PageSay(nStart, nPerPage)
end
