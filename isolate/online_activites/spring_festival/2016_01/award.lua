--
-- Author: Zheng Jinke
-- Date: 2015-12-22 15:48:19
--
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")

tItemCfg = {
	[PackItemId(2,1,30982)] = {"hd_1y_putong"},
	[PackItemId(2,1,30983)] = {"hd_1y_jipin"},
	[PackItemId(2,1,31016)] = {"hd_1y_msqdlb"},
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


