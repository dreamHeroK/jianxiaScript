Import("\\script\\ksgvn\\lib.lua")

_g_tbExpandCondition = { -- R­¬ng thø x => Sè lÖnh bµi cÇn 
    [6] = 1,
    [7] = 3,
    [8] = 10,
    [9] = 20,
    [10] = 50,
}

MAX_STORAGE_BOXES = 10

function OnUse(nItemIdx)
    local nCurrentStoreBox = GetStoreBoxPageCount()
    local nNextStoreBox = nCurrentStoreBox + 1

    if not _CanExpandStorage(nNextStoreBox) then
        return
    end

    local nNeedCount = _g_tbExpandCondition[nNextStoreBox]

    local tSay = {
        format("Më réng r­¬ng chøa ®å <color=gold>thø %d<color> cÇn tèn <color=red>%d LÖnh Bµi Më Réng R­¬ng<color> ®¹i hiÖp x¸c ®Þnh sö dông kh«ng?", nNextStoreBox, nNeedCount),
        format("X¸c ®Þnh/#_DoExpand(%d)", nNextStoreBox),
        "\n§Ó ta suy nghÜ l¹i mét l¸t/no",
    }
    KsgNpc:SayDialog(tSay)
end

function _CanExpandStorage(nExpandTo)
    local nCurrentStoreBox = GetStoreBoxPageCount()
    if nCurrentStoreBox < 5 then
        KsgNpc:Talk("§¹i hiÖp cÇn më réng ®Õn r­¬ng chøa thø 5 míi cã thÓ sö dông lÖnh bµi nµy.")
        return nil
    end

    if nCurrentStoreBox == MAX_STORAGE_BOXES then
        KsgNpc:Talk("R­¬ng chøa ®å cña ®¹i hiÖp ®· ®¹t tèi ®a, kh«ng thÓ tiÕp tôc më réng thªm n÷a.")
        return nil
    end
    if not _g_tbExpandCondition[nExpandTo] then
        KsgNpc:Talk("R­¬ng chøa nµy t¹m thêi ch­a ®­îc hç trî. Xin h·y thö l¹i sau!")
        return nil
    end
    return 1
end

function _DoExpand(nExpandTo)
    if not _CanExpandStorage(nExpandTo) then
        return
    end

    local nNeedCount = _g_tbExpandCondition[nExpandTo]

    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 1, 50257 }, nCount = nNeedCount }
        },
    }
    if KsgLib:PayMaterial(tbCondition) then
        if GetStoreBoxPageCount() < MAX_STORAGE_BOXES then
            SetStoreBoxPageCount(nExpandTo)
        end
        KsgNpc:Talk(format("Më réng r­¬ng thµnh c«ng, ®¹i hiÖp ®· cã thÓ sö dông r­¬ng chøa ®å <color=gold>thø %d<color> ®Ó cÊt gi÷ vËt phÈm.", nExpandTo))
    end
end