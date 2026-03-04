
szMainNpcName = "<color=green>CÈm Nang §¹i Sù KiÖn:<color>"

T_WE_ITEM2TIME = {
    [1] = {{2,1,31507,  1}, 7},
    [2] = {{2,1,30230,200}, 7},
    [3] = {{2,1,30230,600}, 30},
}

function WECheckWeapon()
    local g,d,p = GetPlayerEquipInfo(2)
    if g == 0 and d == 0 and p == 0 then
        return 0
    end
    return 1
end

function WECheckIfImposed() -- ÒÑ¾­¸½¼ÓµÄÔÌÁé
    local szEffectSoulName = GetBindedWeaponEffectName();
    if szEffectSoulName ~= "" then                                          --ÊÇ·ñÒÑ¾­¸½¼ÓÁéÆÇ
        return 0;
    end
    return 1
end

function WEfMainDialog()
    if WECheckWeapon() ~= 1 then
        Talk(1,"",format("%s Ch­a trang bÞ vò khÝ, kh«ng thÓ thao t¸c!", szMainNpcName))
        return
    end
    
    if WECheckIfImposed() ~= 1 then
        local szTitle = format("%s Vò KhÝ ®· UÈn Linh råi, tiÕp tôc thao t¸c sÏ thay thÕ hiÖu qu¶ ®ang cã, ®ång ý?", szMainNpcName)    
        local tbSay = {
            "TiÕp tôc!/WEDoAddEffect",
            "Hñy bá/nothing"
        }
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    WEDoAddEffect()
    
end

function WEDoAddEffect()
    local szTitle = format("%s H·y chän lo¹i UÈn Linh muèn ®æi:", szMainNpcName)    
    local tbSay = {
        "Linh Ph¸ch-ThiÕt Cèt/#WEDoAddEffectChooseTime(\"ThiÕt Cèt\")",
        "Linh Ph¸ch-B¸ch ChiÕn/#WEDoAddEffectChooseTime(\"B¸ch ChiÕn\")",
        "Linh Ph¸ch-Ch­íc NhËt/#WEDoAddEffectChooseTime(\"Ch­íc NhËt\")",
        "Linh Ph¸ch-TuÊn DËt/#WEDoAddEffectChooseTime(\"TuÊn DËt\")",
        "Linh Ph¸ch-§µo Lý/#WEDoAddEffectChooseTime(\"§µo Lý\")",
        "Linh Ph¸ch-Danh Tóc/#WEDoAddEffectChooseTime(\"Danh Tóc\")",
        "Linh Ph¸ch-L¹c Hµ/#WEDoAddEffectChooseTime(\"L¹c Hµ\")",
        "Linh Ph¸ch-§o¹n Giao/#WEDoAddEffectChooseTime(\"§o¹n Giao\")",
        "Linh Ph¸ch-Ph¸ Qu©n/#WEDoAddEffectChooseTime(\"Ph¸ Qu©n\")",
        "Linh Ph¸ch-Hµo m«n/#WEDoAddEffectChooseTime(\"Hµo m«n\")",
        "Linh Ph¸ch-Tinh Di/#WEDoAddEffectChooseTime(\"Tinh Di\")",
        "Hñy bá/nothing",
    }
    Say(szTitle, getn(tbSay), tbSay)
end

function WEDoAddEffectChooseTime(szName)
    local szTitle = format("%s HiÖu qu¶ UÈn Linh sÏ tan dÇn theo thêi gian. C­êng ®é UÈn Linh cµng cao, tån t¹i cµng l©u, tiªu hao cµng lín.", szMainNpcName)    
    local tbSay = {
        -- format("ÎÒÏ£Íû¼¤»î7Ìì(ÏûºÄÎäÆ÷ÁéÆÇ¼¤»îÈ¯x1)/#WEDoAddEffectConfirm(\"%s\", %d)", szName, 3),
        -- format("ÎÒÏ£Íû¼¤»î7Ìì(ÏûºÄ200µÀ¾ßxu)/#WEDoAddEffectConfirm(\"%s\", %d)", szName, 1),
        -- format("ÎÒÏ£Íû¼¤»î30Ìì(ÏûºÄ600µÀ¾ßxu)/#WEDoAddEffectConfirm(\"%s\", %d)", szName, 2),
        -- "·µ»Ø/WEDoAddEffect",
    }
    local tInfo = nil
    for i=1, getn(T_WE_ITEM2TIME) do
        tInfo = T_WE_ITEM2TIME[i]
        tinsert(tbSay, format("KÝch ho¹t %d ngµy (Tèn [%s] x%d)/#WEDoAddEffectConfirm(\"%s\", %d)",
            tInfo[2],
            GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
            tInfo[1][4],
            szName,
            i ) )
    end
    tinsert(tbSay, "trë l¹i/WEDoAddEffect")
    tbSay.n = nil
    
    Say(szTitle, getn(tbSay), tbSay)
end

function WEDoAddEffectConfirm(szName, szType)
    local tInfo = T_WE_ITEM2TIME[szType]
    if not tInfo then
        return
    end

    if DelItem(tInfo[1][1],tInfo[1][2],tInfo[1][3],tInfo[1][4]) ~= 1 then
        Talk(1,"",format("%s: Trªn ng­êi kh«ng ®ñ %s!", szMainNpcName, GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3])) )
        return
    end

    BindWeaponEffect( szName, tInfo[2]*86400 )
    AddWeaponEffectAttribute(8, 1) 
    AddWeaponEffectAttribute(9, 1) 
    Msg2Player("UÈn Linh thµnh c«ng! Cã thÓ chän më/®ãng Ho¸n Linh tõ biÓu t­îng Vò KhÝ trong giao diÖn Trang BÞ (PhÝm t¾t: F)")

    if szType == 1 then -- ¼¤»îÒ»ÖÜÎäÆ÷ÁéÆÇµÄ´ÎÊý °´Á÷ÅÉÇø·Ö
        AddRuntimeStat(90, 1, GetPlayerRoute(), 1)
    elseif szType == 2 then  -- ¼¤»îÒ»ÔÂÎäÆ÷ÁéÆÇµÄ´ÎÊý °´Á÷ÅÉÇø·Ö
        AddRuntimeStat(90, 2, GetPlayerRoute(), 1)
    end
end