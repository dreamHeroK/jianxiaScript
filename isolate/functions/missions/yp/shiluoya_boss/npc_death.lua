function OnDeath(npcIndex,f,x)
	local idx = tonumber(npcIndex)
	if idx > 0 then
    	local szNpcName = GetNpcName(idx)
    	local tAward = tCfg.tNpcDeathAward[szNpcName]
    	if tAward then
    		CustomAwardGiveGroup(tAward[1], tAward[2])
    		local nScore = tAward[3]
        	if nScore and nScore > 0 then
        		t_data:award_score(nScore)
        	end
    	end
    	t_data:clear_npc(idx, 0)
    	
    	if szNpcName == "NgÙy H«u V≠¨ng" then
    		t_data.t_shiluoya_boss.boss_killer = GetName()
    		global_msg(format("%s ßπi Tri”n Th«n Oai K›ch Æ∑ gi’t NgÙy H«u V≠¨ng!", GetName()))
    		AddRuntimeStat(32, 1, 0, 1)
    	end
    	--…æµÙ ¨ÃÂ
		SetNpcRemoveScript(idx, "")
		SetNpcLifeTime(idx, 5)
	end
end