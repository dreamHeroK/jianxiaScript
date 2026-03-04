Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong.lua')

function main()
    local nToday = KsgDate:Today()
    if nToday > EVENT_BACHBAORUONG_END_DATE then
        return KsgNpc:Talk(g_szNpcName .. "Sù kiÖn B¸ch B¶o R­¬ng ®· kÕt thóc! Kh«ng thÓ më b¶o r­¬ng.")
    end
    local nNpcIndex = GetTargetNpc()
    local szNpcName = GetNpcName(nNpcIndex)

    if szNpcName == "B¸ch B¶o R­¬ng" then
        if GetPKFlag() == 0 or GetFightState() == 0 then
            return KsgNpc:Talk(g_szNpcName .. "PK ë d¹ng luyÖn c«ng, kh«ng thÓ tiÕn hµnh më b¶o r­¬ng.")
        end
    end

    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szNpcName .. "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ më b¶o r­¬ng.")
    end

    local nCurOpenedBox = KsgTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 1, 4)
    if nCurOpenedBox >= MAX_OPEN_BOX_COUNT then
        return KsgNpc:FormalTalk(g_szNpcName, format("®· më r­¬ng %d lÇn råi, kh«ng thÓ më thªm n÷a.", MAX_OPEN_BOX_COUNT))
    end

    local tbSay = { g_szNpcName .. format("H·y chän c¸c c¸ch sau ®Ó më r­¬ng:<enter>HiÖn t¹i c¸c h¹ ®· më <color=gold>%d/%d<color> b¶o r­¬ng", nCurOpenedBox, MAX_OPEN_BOX_COUNT), }
    for nIndex, tbExchangeCfg in _g_tbExchangeBox do
        tinsert(tbSay, tbExchangeCfg.szDesc .. "/#_bachbaoruong_OpenBox(" .. nIndex .. ")")
    end
    tinsert(tbSay, "\nKÕt thóc ®èi tho¹i/no")
    KsgNpc:SayDialog(tbSay)
end
