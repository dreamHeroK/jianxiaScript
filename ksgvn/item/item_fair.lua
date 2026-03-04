Import("\\script\\ksgvn\\lib.lua")

EXCHANGE_TINHHON_REQUIRE_NUM = 10
EXCHANGE_NGUYETPHACH_REQUIRE_NUM = 10

_g_tbFair_Exchanges = {
    [PackItemId(2, 97, 378)] = {
        tbAward = { tbProp = { 2, 102, 232 }, nStack = 1, nStatus = 4 } ,
        nCount = EXCHANGE_TINHHON_REQUIRE_NUM,
        tbCondition = {
            tbItems = {
                { tbProp = { 2, 97, 378 }, nCount = EXCHANGE_TINHHON_REQUIRE_NUM }
            }
        },
        tbAward = { tbProp = { 2, 102, 232 }, nStack = 1, nStatus = 4 }
    },
    [PackItemId(2, 97, 379)] = {
        tbCondition = {
            tbItems = {
                { tbProp = { 2, 97, 379 }, nCount = EXCHANGE_NGUYETPHACH_REQUIRE_NUM }
            }
        },
        tbAward = { tbProp = { 2, 95, 3855 }, nStack = 1, nStatus = 4 }
    },
}
function OnUse(nItemIndex)
    local g, d, p = GetItemInfoByIndex(nItemIndex)
    local t = _g_tbFair_Exchanges[PackItemId(g, d, p)]
    if t then

    end
    local tSay = {
        format("%s: §æi 1 ")
    }
end

function _OnConfirmUse()
    
end
