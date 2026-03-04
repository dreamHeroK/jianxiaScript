Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\spendmoney\\spendmoney_head.lua')

function _spendmoney_HasPackage(nPackItemId)
    if not _g_tbAward_Spend_Money[nPackItemId] then
        KsgNpc:Talk("Kh«ng tån t¹i gãi tÝch lòy lo¹i nµy!")
        return nil
    end
    return 1
end

function spendmoney_GivePackage(nPackIndex)
    local nG, nD, nP = GetItemInfoByIndex(nPackIndex)
    local nPackItemId = PackItemId(nG, nD, nP)
    if _spendmoney_HasPackage(nPackItemId) then
        local tbAward = _g_tbAward_Spend_Money[nPackItemId]
        local nNeedRoom = getn(tbAward) + 5
        if not KsgLib:HasEnoughBagRoom(nNeedRoom, nNeedRoom) then
            return
        end
        if 1 == KsgItem:DeleteByIndex(nPackIndex) then
            KsgAward:Give(tbAward)
        end
    end
end