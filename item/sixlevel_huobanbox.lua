Import("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
    local nItemIdx = tonumber(nItemIdx)
    --local g,d,p = GetItemInfoByIndex(nItemIdx)

	local szAward = "6ji_huoban_book"

    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        return 0
    end

    if DelItemByIndex(nItemIdx, 1) == 1 then
        if CustomAwardGiveGroup(szAward, 0) > 0 then   --二号参数为是否给予全部奖励
            AddRuntimeStat(47, 9, 0, 1)
    		return 1
        else
            return 0
        end
    end
end
