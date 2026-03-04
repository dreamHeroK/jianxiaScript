

tItemCfg = {
	[PackItemId(2,1,31147)] = {"9y_jrptbx"},
	[PackItemId(2,1,31148)] = {"9y_jrgjbx"},
	[PackItemId(2,1,31149)] = {"9y_jrhhbx"},
}
function handle_on_use_ticket(nIndex)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nId = PackItemId(g,d,p)
	local t = tItemCfg[nId]
	if t then
		local szAward = t[1]
		if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
			return 0
		end
		if DelItemByIndex(nIndex, 1) == 1 then
    		if CustomAwardGiveGroup(szAward, 0) > 0 then   --二号参数为是否给予全部奖励
        		return 1
        	else
        		AddItem(g,d,p, 1,4)
        	end
    	end
	end
end



function OnUse(nIndex)
    handle_on_use_ticket(nIndex)
end