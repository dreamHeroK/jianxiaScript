Include("\\script\\missions\\yp\\slymg\\head.lua")

tMap2Lv = {--µØÍ¼µ½²ãÊýÓ³Éä
	[7112] = 1,
	[7113] = 1,
	[7114] = 1,
	[7115] = 1,
	[7116] = 2,
	[7117] = 2,
	[7118] = 3,
}

function OnDeath(id, f, x)
	local sNpcName = GetNpcName(id);
	local m = GetNpcWorldPos(id);
	local npcIndex = CreateNpc(SLYMG_TRANS_NPC[m][1], SLYMG_TRANS_NPC[m][2], m, 1679, 3143); 
	if npcIndex > 0 then
		SetNpcScript(npcIndex, "\\script\\missions\\yp\\slymg\\npc_talk.lua");
		Msg2Map(m, format(SLYMG_LEVEL_MSG[m], gf_GetPlayerSexName(), GetName()));
	end
	gf_TeamOperateEX(mg_ModifyScore, SLYMG_SCORE_BOSS[m])
	gf_TeamOperateEX(function (mapId)
		if GetFreeItemRoom() > 1 then
			gf_AddItemEx2({2,1,30910,SLYMG_BOSS_AWARD_BOOK[mapId]}, "Danh s¸ch kh«ng ®Çy ®ñ", "Long Hæ §­êng", "Long Hæ §­êng", 0, 1);
		end
	end, m)
	mg_BossDropItem(m, id)
	local nLv = tMap2Lv[m]
	if nLv then
		AddRuntimeStat(32, 4, nLv, 1)
	end
	
end