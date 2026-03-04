Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nNumBox = GetUnitCurStates(npcIndex, 6)
	SetGlbValue(GLB_MOMENTUM_BOX_FLAG, SetBit(GetGlbValue(GLB_MOMENTUM_BOX_FLAG), nNumBox, 0))
	SetNpcScript(npcIndex, "")
	SetNpcLifeTime(npcIndex,0);
	SetMomentumBoundSwitch(0)
	SetMomentum(10)
	SetMomentumBoundSwitch(1)
end