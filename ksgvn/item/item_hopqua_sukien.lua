Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

function OnUse(nItemIndex)
    if 1 == KsgItem:DeleteByIndex(nItemIndex) then
        monthlyEvent_DropMaterial()
    end
end