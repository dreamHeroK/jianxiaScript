Include("\\script\\online\\snowbattle\\head.lua");

function OnDeath(npcIdx)
	SB_HandleExp(SB_T_KILL_EXP["monster1"], 0);
	SB_HandleRandItem();
	SetNpcLifeTime(npcIdx, 0);
	SB_OnMonsterDied();
end