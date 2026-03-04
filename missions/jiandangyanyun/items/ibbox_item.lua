Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")


function handle_on_use()

		local szAward = "JD_IB1"
		if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
			return 0
		end
		if DelItem(2,1,31124, 1) == 1 then
    		if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
    			AddRuntimeStat(44,14,0,1)
        		return 1
        	else
        		AddItem(2,1,31124, 1)
        	end
    	end
end
function OnUse(  )
	-- body
	handle_on_use()
end