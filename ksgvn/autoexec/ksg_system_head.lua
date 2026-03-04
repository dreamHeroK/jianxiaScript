Import("\\script\\ksgvn\\lib.lua")
_thisFile = "\\script\\ksgvn\\autoexec\\ksg_system_head.lua"

KSG_ITEMPACK_START = 50268
KSG_ITEMPACK_END = 50335

g_tbItemTalkCfg = {
    { tbProp = { 2, 1, 50018 }, szFunc = "_ksg_HandleItemPack" },
    { tbProp = { 2, 1, 50019 }, szFunc = "_ksg_HandleItemPack" },
    { tbProp = { 2, 1, 50020 }, szFunc = "_ksg_HandleItemPack" },
    { tbProp = { 2, 1, 50029 }, szFunc = "_ksg_HandleBaoRuongTK" },
    { tbProp = { 2, 1, 50250 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 50251 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 50252 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 50253 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 31004 }, szFunc = "_ksg_HandlePhongHoaQuyen" },
}

g_tbNpcTalkCfg = {
    { szName = "Thî rÌn L­u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeTTLL", szTalk = "GhÐp TÈy T©m Th¹ch vµ LuyÖn L« ThiÕt", },
    { szName = "Thî rÌn L­u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeKx5", szTalk = "RÌn trang bÞ Kim Xµ cÊp 5", },
    { szName = "Thî rÌn L­u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeKx6", szTalk = "RÌn trang bÞ Kim Xµ cÊp 6", },
    { szName = "Thî rÌn L­u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeKx7", szTalk = "RÌn trang bÞ Kim Xµ cÊp 7", },
    { szName = "Thî rÌn L­u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_upgradeSatTinh", szTalk = "LuyÖn hãa bé S¸t Tinh", },
}

function _ksg_upgradeSatTinh()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_SATTINH_TRACVIET)
end

function _ksg_ExchangeTTLL()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_TTLL)
end

function _ksg_ExchangeKx5()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_KX5)
end

function _ksg_ExchangeKx6()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_KX6)
end

function _ksg_ExchangeKx7()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_KX7)
end

function _ksg_HandleItemPack(nItemIndex)
    local g, d, p = GetItemInfoByIndex(nItemIndex)
    local tbCfg = g_tbItemPackCfg[PackItemId(g, d, p)]
    if tbCfg then
        local szType = tbCfg.szType
        if tbCfg.tbIds then
            local nId = KsgLib:RandomTableValue(tbCfg.tbIds)
            _ksg_GiveItemPackByType(nItemIndex, szType, nId)
        end
        if tbCfg.nId then
            _ksg_GiveItemPackByType(nItemIndex, szType, tbCfg.nId)
        end
        if tbCfg.tbItem then
            _ksg_GiveItemPackItem(nItemIndex, szType, tbCfg.tbItem)
        end
    end
end

function _ksg_GiveItemPackByType(nItemIndex, szType, nId)
    if szType == ITEMPACK_TYPE_ORN then
        -- ngo¹i trang c¸nh
        if not KsgLib:HasEnoughBagRoom(3) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh«ng thÓ më hép ngo¹i trang c¸nh nµy")
        end
        KsgItem:AddOrnByBody(nId, 4, 0, "KSG_ITEMPACK")
    end
    if szType == ITEMPACK_TYPE_COAT then
        -- ngo¹i trang quÇn ¸o
        if not KsgLib:HasEnoughBagRoom(3) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh«ng thÓ më hép ngo¹i trang nµy")
        end
        KsgItem:AddCoatByBody(nId, 4, 0, "KSG_ITEMPACK")
    end
    if szType == ITEMPACK_TYPE_HORSE then
        -- thó c­ìi
        if not KsgLib:HasEnoughBagRoom(1) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh«ng thÓ më hép thó c­ìi nµy")
        end
        KsgItem:AddHorse(nId, 4, 0, "KSG_ITEMPACK")
    end

    if szType == ITEMPACK_TYPE_ORN_CLOTH then
        -- ngo¹i trang c¸nh - l­ng
        if not KsgLib:HasEnoughBagRoom(1) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh«ng thÓ më hép ngo¹i trang c¸nh nµy")
        end
        KsgItem:AddOrnClothByBody(nId, 4, 0, "KSG_ITEMPACK")
    end
end

function _ksg_GiveItemPackItem(nItemIndex, szType, tbItem)
    if szType == ITEMPACK_TYPE_ITEM then
        -- C¸c vËt phÈm
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh«ng thÓ më tói vËt phÈm nµy")
        end
        KsgAward:Give(tbItem, "ItemPack")
    end
end

function _ksg_HandleBaoRuongTK(nItemIndex)
    if not KsgLib:HasEnoughBagRoom(1, 200) then
        return 0
    end
    if KsgItem:DeleteByIndex(nItemIndex, 1) ~= 1 then
        return KsgNpc:Talk("Më r­¬ng thÊt b¹i")
    end
    KsgItem:AddSuitByBody(95)
end

function _ksg_HandleKinhNghiemDon(nItemIndex)
    local g, d, p = GetItemInfoByIndex(nItemIndex)
    if not g_tbKinhNghiemDonCfg[PackItemId(g, d, p)] then
        return
    end
    local nExp = g_tbKinhNghiemDonCfg[PackItemId(g, d, p)]

    if CanModifyLargeExp(nExp) ~= 1 then
        return KsgNpc:Talk("§iÓm kinh nghiÖm ®· ®¹t giíi h¹n, kh«ng thÓ sö dông Kinh NghiÖm §¬n")
    end

    if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
        return KsgNpc:Talk("Kh«ng thÓ dïng kinh nghiÖm ®¬n, h·y thö l¹i sau")
    end
    KsgAward:Give({ nExp = nExp }, "Kinh NghiÖm §¬n")
end

function _ksg_HandlePhongHoaQuyen(nItemIndex)
    if KsgItem:DeleteByIndex(nItemIndex) == 1 then
        KsgAward:Give({ nPhongHoa = 1 }, "Phong Hoa QuyÓn")
    end
end
