Import("\\script\\isolate\\functions\\translife10\\npcs\\zfjg3_npc.lua")
Import("\\script\\lib\\globalfunctions.lua");
-- 守阵傀儡死亡

function OnDeath(idx)
	-- if tGtTask:check_cur_task(540) ~= 1 then
	-- 	SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\zfjg3_npc.lua","NpcDeath()")
	-- 	SetNpcLifeTime(idx,3)
	-- 	return
	-- end
    -- local nOldIndex = PlayerIndex;
	-- if GetTeamSize() == 0 then
	-- 	if gf_JudgeRoomWeight(1, 100, "") == 1 then
    --         AddItem(2,0,31005,1);
    --     else
    --         Msg2Player("您的背包已满，物品获取失败。")
	--     end
	-- 	NpcDeath()
	-- 	SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\zfjg3_npc.lua","NpcDeath()")
	-- 	SetNpcLifeTime(idx,3)
	-- 	return
	-- end
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	-- 	if gf_JudgeRoomWeight(1, 100, "") == 1 then
    --         AddItem(2,0,31005,1);
	--     else
    --         Msg2Player("您的背包已满，物品获取失败。")
	--     end
	-- end
	-- PlayerIndex = nOldIndex;
    SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\zfjg3_npc.lua","NpcDeath()")
	SetNpcLifeTime(idx,3)
end