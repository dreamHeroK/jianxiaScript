Import("\\script\\ksgvn\\lib.lua")
g_szNpcName = "<color=green>Cao Nh©n ë Èn<color>: "

function main()
    local tSay = {
        g_szNpcName .. _cn_CurrentIntimatePointMsg(),
        --"Ta muèn tÆng l·o chót quµ/_cn_NotOpenYet",
        --"TiÖm néi c«ng giang hå/_cn_NotOpenYet",
        format("TiÖm YÕu QuyÕt thÊt truyÒn/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_YEUQUYET_CAOCAP),
        format("TiÖm Cæ phæ/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_COPHO),
        --"Häc thö néi c«ng giang hå/_cn_NotOpenYet",
        --"LuyÖn l¹i néi c«ng giang hå/_cn_NotOpenYet",
        --"Th¨ng cÊp nhanh néi c«ng tuyÖt thÕ/_cn_NotOpenYet",
        "\nTa chØ tiÖn ®­êng ghÐ qua/no"
    }

    KsgNpc:SayDialog(tSay)
end

function _cn_NotOpenYet()
    return KsgNpc:Talk(format("L·o phu ®ang bËn, xin %s khi kh¸c h·y quay l¹i...", KsgPlayer:GetSexName()))
end

function _cn_GetCurrentIntimatePoint()
    return KsgTask:Get(TASKID_INTIMATE_POINT)
end

function _cn_CurrentIntimatePointMsg()
    local nCurPoint = _cn_GetCurrentIntimatePoint()
    local szHaoCam = "Ng­¬i lµ ai ? Tõ ®©u ®Õn? <enter>H¶o c¶m hiÖn t¹i: <color=yellow>V« vÞ<color>"
    local szSexName = KsgPlayer:GetSexName()
    if nCurPoint > 500 then
        szHaoCam = format("VÞ %s nµy, sao l¹i ®Õn ®©y n÷a råi <enter>H¶o c¶m hiÖn t¹i: <color=yellow>Cã chót Ên t­îng<color>", szSexName())
    end
    if nCurPoint > 2000 then
        szHaoCam = format("A... %s l¹i tíi th¨m l·o giµ nµy sao, cã g× xin h·y chØ gi¸o.<enter>H¶o c¶m hiÖn t¹i: <color=yellow>Quý<color>", szSexName())
    end
    if nCurPoint > 3000 then
        szHaoCam = format("Hahaha... gÆp l¹i %s thËt lµ mõng, h«m nay c¸c h¹ thÕ nµo? L·o giµ ta mét m×nh trªn C«n L«n S¬n nµy thËt lµ buån ch¸n....<enter>H¶o c¶m hiÖn t¹i: <color=yellow>ThÝch<color>", szSexName())
    end
    if nCurPoint > 5000 then
        szHaoCam = format("%s %s ®· tíi råi sao, giang hå ngµy cµng hiÓm ¸c, xin h·y cÈn träng gi÷ m×nh! Ta rÊt lo l¾ng cho %s<enter>H¶o c¶m hiÖn t¹i: <color=yellow>B»ng H÷u<color>", KsgPlayer:GetName(), szSexName(), szSexName())
    end
    if nCurPoint >= 8000 then
        szHaoCam = format("%s %s l¹i ®Õn th¨m ta µ? Qu¶ lµ h¶o b»ng h÷u, ha ha....! Giang hå ngµy cµng hiÓm ¸c, xin h·y cÈn träng gi÷ m×nh! <enter>H¶o c¶m hiÖn t¹i: <color=yellow>ChÝ H÷u<color>", KsgPlayer:GetName(), szSexName())
    end
    return szHaoCam
end
