Import('\\script\\ksgvn\\event\\spendmoney\\spendmoney.lua')

function OnUse(nItemIndex)
    spendmoney_GivePackage(nItemIndex)
end