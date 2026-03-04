Import("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua")
Import("\\script\\lib\\globalfunctions.lua");
-- ∂æ»ÀÀ¿Õˆ
function OnDeath(idx)
	if tGtTask:check_cur_task(534) ~= 1 then
		SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua","NpcDeath()")
		SetNpcLifeTime(idx,3)
		return
	end
    local nOldIndex = PlayerIndex;
	if GetTeamSize() == 0 then
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
            AddItem(2,0,31002,1);
        else
            Msg2Player("TÛi Æ∑ Æ«y, nhÀn vÀt ph»m th t bπi.")
	    end
		SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua","NpcDeath()")
		SetNpcLifeTime(idx,3)
		return
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
            AddItem(2,0,31002,1);
	    else
            Msg2Player("TÛi Æ∑ Æ«y, nhÀn vÀt ph»m th t bπi.")
	    end
	end
	PlayerIndex = nOldIndex;
    SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua","NpcDeath()")
	SetNpcLifeTime(idx,3)
end