--boss¿‰œ„¡‚

Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");
Include("\\script\\newbattles\\functions.lua");
Import("\\script\\lib\\globalfunctions.lua");

function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nMapId, nX, nY = GetNpcWorldPos(npcIndex);
	SetNpcLifeTime(npcIndex,0);
	SetMissionV(MV_LENGXL_BOSS_NPXIDX, 0);
	for i=1, 4 do
		local nNpcIndex = CreateNpc("Sa mπc b∂o r≠¨ng","R≠¨ng s∏t kh›", nMapId, nX, nY, 6, 1, 1, 100);
		SetNpcScript(nNpcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua")
		SetNpcLifeTime(nNpcIndex, 2 * 60);
	end;	
--	BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	local nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	local nCamp = BT_GetCamp();
	if nCamp == SONG_ID then
		SetMissionV(MV_OCCUPY_TIME_SONG, GetMissionV(MV_OCCUPY_TIME_SONG)+100);
	else
		SetMissionV(MV_OCCUPY_TIME_LIAO, GetMissionV(MV_OCCUPY_TIME_LIAO)+100);
	end		
	BT_AddMissionPoint(BT_GetCamp(),	nPoint);
	BT_AddBattleActivity(BA_EMPL_KILL_EMPL);
	
local tMBoxPos_more =
	{
		[1] = {5065, 1714, 3216},
		[2] = {5065, 1725, 3217},		
		[3] = {5065, 1725, 3235},		
		[4] = {5065, 1714, 3235},		
--		[11] = {5065, 1720, 3332},		
--		[12] = {5065, 1714, 3331},		
	}


--	for i = 1, 4 do
--			local nNpcIndex = CreateNpc("R≠¨ng ti“n","B∂o R≠¨ng",tMBoxPos_more[i][1],tMBoxPos_more[i][2],tMBoxPos_more[i][3])
			
--			SetNpcLifeTime(nNpcIndex,2*60);
--			SetNpcScript(nNpcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua")
			
--	end
end