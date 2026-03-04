Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
tItem_HaoXia = {
    ["0330724"]={"Hµo HiÖp §ao",	0,	3,	30724,},
    ["0830725"]={"Hµo HiÖp Tr­îng",	0,	8,	30725,},
    ["0030726"]={"Hµo HiÖp Thñ",	0,	0,	30726,},
    ["0130727"]={"Hµo HiÖp Ch©m",	0,	1,	30727,},
    ["0230728"]={"Hµo HiÖp KiÕm",	0,	2,	30728,},
    ["01030729"]={"Hµo HiÖp CÇm",0,	10,	30729,},
    ["0030730"]={"Hµo HiÖp Thñ",	0,	0,	30730,},
    ["0530731"]={"Hµo HiÖp C«n",	0,	5,	30731,},
    ["0230732"]={"Hµo HiÖp KiÕm",	0,	2,	30732,},
    ["0930733"]={"Hµo HiÖp Bót",	0,	9,	30733,},
    ["0630734"]={"Hµo HiÖp Th­¬ng",	0,	6,	30734,},
    ["0430735"]={"Hµo HiÖp Cung",	0,	4,	30735,},
    ["0730736"]={"Hµo HiÖp Song §ao",	0,	7,	30736,},
    ["01130737"]={"Hµo HiÖp Tr¶o",	0,	11,  30737,},
    ["0230738"]={"Hµo HiÖp KiÕm",	0,	2	,30738,},
    ["0330739"]={"Hµo HiÖp §ao",	0,	3	,30739,},
    ["0930740"]={"Hµo HiÖp Bót",	0,	9	,30740,},
    ["01130741"]={"Hµo HiÖp Tr¶o",	0,	11	,30741,},
    ["01330742"]={"Hµo HiÖp PhiÕn",	0,	13	,30742,},
    ["01230743"]={"Hµo HiÖp §Þch",	0,	12	,30743,},
    ["01432162"]={"Hµo HiÖp Chñy",	0,	14	,32162,},
    ["0232191"]={"Hµo HiÖp KiÕm",	0,	2	,32191,},
    ["010330568"]={"Hµo HiÖp §Çu",	0,	103	,30568,},
    ["010030568"]={"Hµo HiÖp y",	0,	100	,30568,},
    ["010231126"]={"Hµo HiÖp Giíi",	0,	102	,31126,},
    ["010231127"]={"Hµo HiÖp Béi",	0,	102	,31127,},
    ["010130568"]={"Hµo HiÖp Trang",	0,	101	,30568,},
}
tGiveBack = {
    { {2,2,7,16,4},   {2,2,8,40,4},   {2,1,1009,0,4} },
    { {2,2,7,16,4},   {2,2,8,80,4},   {2,1,1009,0,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,0,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,4,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,8,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,16,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,32,4} },
    { {2,2,7,16,4},   {2,2,8,160,4},  {2,1,1009,64,4} },
}
function _build_hash_string(ng,nd,np)
    return format("%d%d%d",ng,nd,np)
end

function _compose_item(szItem,nIdx,nStone)
    local nLv = GetEquipAttr(nIdx,2)
    if nLv > 7 then
        if gf_Judge_Room_Weight(3, 0) ~= 1 then
            Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
            return 0
        end
    end
    local nCash = GetCash()
    if nCash < 500000 then
        Talk(1,"","Vµng trªn ng­êi kh«ng ®ñ 50")
        return
    end
    
    local szTitle = format("Muèn tiªu hao <color=red>1 Thiªn Tinh Th¹ch<color>, <color=red>%s<color>, <color=red>50 Vµng<color> tiÕn hµnh dung hîp?",tItem_HaoXia[szItem][1])
    local tbSay = {}
    tinsert(tbSay,format("§óng/#_compose_item_confirm(\"%s\",%d,%d)",szItem,nIdx,nStone))
    tinsert(tbSay,"Sai/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function _compose_item_confirm(szItem,nIdx,nStone)
    local nLv = GetEquipAttr(nIdx,2)
    if nLv > 7 then
        local tItems = tGiveBack[nLv-7];
        gf_AddItemEx({tItems[1][1],tItems[1][2],tItems[1][3],tItems[1][4],tItems[1][5]},"M¶nh Thiªn th¹ch")
        gf_AddItemEx({tItems[2][1],tItems[2][2],tItems[2][3],tItems[2][4],tItems[2][5]},"Thiªn th¹ch")
        gf_AddItemEx({tItems[3][1],tItems[3][2],tItems[3][3],tItems[3][4],tItems[3][5]},"Thiªn Th¹ch Tinh Th¹ch")
    end
    DelItemByIndex(nIdx,-1)
    DelItemByIndex(nStone,1)
    Pay(500000)
    tItems = tItem_HaoXia[szItem]
    gf_AddItemEx({tItems[2],tItems[3],tItems[4],1,4,-1,-1,-1,-1,-1,-1},tItems[1])
end
function _show_details()
    Talk(1,"","Khi tiÕn hµnh dung hîp, nÕu ®é c­êng hãa cña trang bÞ Hµo HiÖp ®¹t +7 trë lªn, sÏ tïy theo ®é c­êng hãa ®Ó t¸ch vµ hoµn tr¶ nguyªn liÖu c­êng hãa, nÕu ®é c­êng hãa ®¹t d­íi +7 th× kh«ng hoµn tr¶ nguyªn liÖu c­êng hãa. Dung hîp thµnh c«ng sÏ t¹o míi 1 trang bÞ Hµo HiÖp khãa cã cïng vÞ trÝ vµ thÓ h×nh.")
end
function OnUse(ItemIdx)
    local tHaoxia = {}
    local item_idx = -1;
    for i = 0, 5 do
        local item_idx = GetPlayerEquipIndex(i);
        local nG, nD, nP = GetItemInfoByIndex(item_idx);
        if nG ~= nil and nD ~= nil and nP ~= nil then
            local szItem = _build_hash_string(nG, nD, nP)
            if tItem_HaoXia[szItem]~=nil then
                tinsert(tHaoxia,{szItem,item_idx})
            end
        end
    end
    if getn(tHaoxia) == 0 then 
        Talk(1,"","Vui lßng ®eo trang bÞ Hµo HiÖp.")
        return
    end
    local szTitle = "Thiªn Tinh Th¹ch chøa uy lùc thÇn kú, cã thÓ kÕt hîp cïng trang bÞ Hµo HiÖp h×nh thµnh 1 trang bÞ Hµo HiÖp míi."
    local tbSay = {}
    for i = 1, getn(tHaoxia) do
        local tItem = tItem_HaoXia[tHaoxia[i][1]]
        tinsert(tbSay,format("KÕt hîp cïng %s/#_compose_item(\"%s\",%d,%d)",tItem[1],tHaoxia[i][1],tHaoxia[i][2],ItemIdx))
    end
    tinsert(tbSay,"M« t¶ dung hîp/_show_details")
    tinsert(tbSay,"KÕt thóc/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end
