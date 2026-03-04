Import("\\script\\lib\\globalfunctions.lua")

local EquipTable = {
    ["010032192"] = {"Tèng-Uy Hæ T­íng Qu©n Y" ,0,100,32192,},
    ["010032214"] = {"Tèng-Uy Hæ Nguyªn So¸i Y" ,0,100,32214,},
    ["010032236"] = {"Liªu-Uy Hæ T­íng Qu©n Y" ,0,100,32236,},
    ["010032258"] = {"Liªu-Uy Hæ Nguyªn So¸i Y" ,0,100,32258,},
    ["010231563"] = {"Tèng-Uy Hæ T­íng Qu©n LÖnh Bµi" ,0,102,31563,},
    ["010231585"] = {"Tèng-Uy Hæ T­íng Qu©n LÖnh Kú" ,0,102,31585,},
    ["010231607"] = {"Tèng-Uy Hæ T­íng Qu©n LÖnh Phï" ,0,102,31607,},
    ["010231629"] = {"Tèng-Uy Hæ Nguyªn So¸i HiÖu Phï" ,0,102,31629,},
    ["010231651"] = {"Tèng-Uy Hæ Nguyªn So¸i Hæ Phï" ,0,102,31651,},
    ["010231673"] = {"Tèng-Uy Hæ Nguyªn So¸i LÖnh Kú" ,0,102,31673,},
    ["010231695"] = {"Tèng-Uy Hæ Nguyªn So¸i LÖnh Bµi" ,0,102,31695,},
    ["010231717"] = {"Liªu-Uy Hæ T­íng Qu©n LÖnh Bµi" ,0,102,31717,},
    ["010231739"] = {"Liªu-Uy Hæ T­íng Qu©n LÖnh Kú" ,0,102,31739,},
    ["010231761"] = {"Liªu-Uy Hæ T­íng Qu©n LÖnh Phï" ,0,102,31761,},
    ["010231783"] = {"Liªu-Uy Hæ Nguyªn So¸i HiÖu Phï" ,0,102,31783,},
    ["010231805"] = {"Liªu-Uy Hæ Nguyªn So¸i Hæ Phï" ,0,102,31805,},
    ["010231827"] = {"Liªu-Uy Hæ Nguyªn So¸i LÖnh Kú" ,0,102,31827,},
    ["010231849"] = {"Liªu-Uy Hæ Nguyªn So¸i LÖnh Bµi" ,0,102,31849,},
    ["010132192"] = {"Tèng-Uy Hæ T­íng Qu©n Trang" ,0,101,32192,},
    ["010132214"] = {"Tèng-Uy Hæ Nguyªn So¸i Trang" ,0,101,32214,},
    ["010132236"] = {"Liªu-Uy Hæ T­íng Qu©n Trang" ,0,101,32236,},
    ["010132258"] = {"Liªu-Uy Hæ Nguyªn So¸i Trang" ,0,101,32258,},
    ["0232240"] =   {"Tèng-Uy Hæ T­íng Qu©n KiÕm (S¬)" ,0,2,32240,},
    ["0232262"] =   {"Tèng-Uy Hæ T­íng Qu©n KiÕm (Trung)" ,0,2,32262,},
    ["0232284"] =   {"Tèng-Uy Hæ T­íng Qu©n KiÕm (Cao)" ,0,2,32284,},
    ["0232306"] =   {"Tèng-Uy Hæ Nguyªn So¸i KiÕm (S¬)" ,0,2,32306,},
    ["0232328"] =   {"Tèng-Uy Hæ Nguyªn So¸i KiÕm (Trung)" ,0,2,32328,},
    ["0232350"] =   {"Tèng-Uy Hæ Nguyªn So¸i KiÕm (Cao)" ,0,2,32350,},
    ["0232372"] =   {"Liªu-Uy Hæ T­íng Qu©n KiÕm (S¬)" ,0,2,32372,},
    ["0232394"] =   {"Liªu-Uy Hæ T­íng Qu©n KiÕm (Trung)" ,0,2,32394,},
    ["0232416"] =   {"Liªu-Uy Hæ T­íng Qu©n KiÕm (Cao)" ,0,2,32416,},
    ["0232438"] =   {"Liªu-Uy Hæ Nguyªn So¸i KiÕm (S¬)" ,0,2,32438,},
    ["0232460"] =   {"Liªu-Uy Hæ Nguyªn So¸i KiÕm (Trung)" ,0,2,32460,},
    ["0232482"] =   {"Liªu-Uy Hæ Nguyªn So¸i KiÕm (Cao)" ,0,2,32482,},
    ["010332192"] = {"Tèng-Uy Hæ T­íng Qu©n Kh«i" ,0,103,32192,},
    ["010332214"] = {"Tèng-Uy Hæ Nguyªn So¸i Kh«i" ,0,103,32214,},
    ["010332236"] = {"Liªu-Uy Hæ T­íng Qu©n Kh«i" ,0,103,32236,},
    ["010332258"] = {"Liªu-Uy Hæ Nguyªn So¸i Kh«i" ,0,103,32258,},
}


TIME_LINE = 20190311 
-- player can exchange equipment which they got before this date (include this day)
function main()
    main_exchange()
end
function main_exchange()
    if GetPlayerRoute() ~= 32 then
        Talk(1,"","ChØ ®Ö tö C«n L«n KiÕm T«n ®­îc ®Õn ®©y ®æi vËt phÈm.")
        return
    end
    local szTitle = format("Trang BÞ Uy Hæ cña ®Ö tö C«n L«n gÆp chót trôc trÆc vÒ thuéc tÝnh, nay cã thÓ ®Õn chç ta, dïng trang bÞ tr­íc ®ã ®æi thµnh trang bÞ míi nhÊt. <color=yellow>Trang bÞ sau khi ®æi sÏ cïng chñng lo¹i víi trang bÞ tr­íc ®ã, gi÷ nguyªn møc c­êng hãa vµ B¶o Th¹ch ®· kh¶m<color>")
    local tbSay = {}
    tinsert(tbSay, "§æi Trang BÞ Uy Hæ Míi NhÊt/echange_error_equip")
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function echange_error_equip()
    local flag = 0
    for i = 0, 10 do
        local nItemIndex = GetPlayerEquipIndex(i);
        local nG = GetItemGenre(nItemIndex);
        local nD = GetItemDetail(nItemIndex);
        local nP = GetItemParticular(nItemIndex);
        local szIndex = tostring(nG)..tostring(nD)..tostring(nP)
        local tEquip = %EquipTable[szIndex]
        if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
            Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
            return 0;
        end
        if tEquip ~= nil then
            -- ÐèÒª¶Ò»»
            ExchangeEquip(nItemIndex, tEquip)
            flag = flag + 1
        end
    end
    if flag == 0 then
        Talk(1,"","Ch­a t×m thÊy trang bÞ phï hîp ®iÒu kiÖn, h·y mÆc Trang BÞ Uy Hæ cÇn ®æi lªn ng­êi.")
        return
    end
    
end

function ExchangeEquip(nItemIndex, tEquip)
    local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
    local tGenInfo = GetItemGemInfo(nItemIndex)
    if DelItemByIndex(nItemIndex, -1) == 1 then
        -- »¹Ô­×°±¸£¬°üÀ¨Ç¿»¯¶ÈºÍ±¦Ê¯
        local _,newItemIdx = AddItem(tEquip[2],tEquip[3],tEquip[4],1,4,-1,-1,-1,-1,-1,-1,-1,nEnhance)
        for k,v in tGenInfo do
            SetItemGemInfo(newItemIdx, k, v)
        end
    end
end