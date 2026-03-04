Include("\\script\\online_activites\\silingmount\\string.lua")
Import("\\script\\lib\\globalfunctions.lua")

function VET_AddSilingMaster()
	if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
		return
	end
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc(VET_TB_SILING_NPC_TEMPLATE[1], VET_TB_SILING_NPC_NAME[1], 200,1576,2848);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\silingmount\\npc\\song_master_dlg.lua");
	
	nNpcIndex = CreateNpc(VET_TB_SILING_NPC_TEMPLATE[2], VET_TB_SILING_NPC_NAME[2], 600,1514,2912);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\silingmount\\npc\\liao_master_dlg.lua");
end

function VET_AddSilingComposer()
	-- if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
	-- 	return
	-- end
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc(VET_TB_SILING_NPC_TEMPLATE[3], VET_TB_SILING_NPC_NAME[3], 350,1428,2939);
	SetNpcScript(nNpcIndex, "\\script\\online_activites\\silingmount\\npc\\composer_dlg.lua");
end