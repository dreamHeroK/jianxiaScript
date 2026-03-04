-- ÓÄÚ¤¹ÖËÀÍö
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\task\\global_task\\gtask_data.lua")
function OnDeath()
	if tGtTask:check_cur_task(531) ~= 1 then
		return
	end
    local nOldIndex = PlayerIndex;
	if GetTeamSize() == 0 then
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
            AddItem(2,0,31001,1);
        else
            Msg2Player("Tói ®· ®Çy, nhËn vËt phÈm thÊt b¹i.")
	    end
		return
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
            AddItem(2,0,31001,1);
        else
            Msg2Player("Tói ®· ®Çy, nhËn vËt phÈm thÊt b¹i.")
	    end
	end
	PlayerIndex = nOldIndex;
end