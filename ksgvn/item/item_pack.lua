Import("\\script\\ksgvn\\lib.lua")

_g_tbItemPack = {
    [PackItemId(2, 1, 50255)] = {
        tbGive = { 1, 0, 32 },
        nStack = 100,
        nNeedBag = 1,
        nNeedWeight = 0,
    }
}

function OnUse(nItemIndex)
    local g,d,p = GetItemInfoByIndex(nItemIndex)
    local id = PackItemId(g,d,p)
    if not _g_tbItemPack[id] then
        return KsgNpc:Talk("VËt phÈm kh«ng tån t¹i")
    end
    local tbItemCfg = _g_tbItemPack[id]
    local bBind = GetItemSpecialAttr(nItemIndex, "BIND")
    local tSay = {
        format("Dïng <color=gold>%s<color> cã thÓ më ra <color=green>%d %s<color>, ®¹i hiÖp cã muèn dïng kh«ng?", KsgItem:GetName(nItemIndex), tbItemCfg.nStack, KsgItem:GetName(tbItemCfg.tbGive)),
        format("Më/#_ConfirmUse(%d, %d)", nItemIndex, bBind),
        "\n§Ó ta suy nghÜ l¹i mét chót/no"
    }
    KsgNpc:SayDialog(tSay)
end

function _ConfirmUse(nItemIndex, bBind)
    local g,d,p = GetItemInfoByIndex(nItemIndex)
    local id = PackItemId(g,d,p)
    if not _g_tbItemPack[id] then
        return KsgNpc:Talk("VËt phÈm kh«ng tån t¹i")
    end
    local tbItemCfg = _g_tbItemPack[id]
    local nStatus = 5
    if bBind == 1 then
        nStatus = 4
    end
    if not KsgLib:HasEnoughBagRoom(tbItemCfg.nNeedBag, tbItemCfg.nNeedWeight) then
        return
    end
    if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
        return KsgNpc:Talk(format("Kh«ng thÓ më %s. Hµnh trang kh«ng cã vËt phÈm nµy.", KsgItem:GetName(nItemIndex)))
    end
    KsgAward:Give({
        tbProp = tbItemCfg.tbGive,
        nStatus = nStatus,
        nStack = tbItemCfg.nStack
    }, "OpenItemPack_" .. id)
end
