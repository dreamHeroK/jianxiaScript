Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")

g_tBossInfo = {
	name = "§éng VËt G©y Rèi",
	templateNpc = "§éng VËt G©y Rèi",
	tMapXY = tPos_Boss[1],
	nDistance = 26,--NPC°ë¾¶£¬
	nChangeBloodTime = 10,
	scriptFile = "\\script\\missions\\tong_activity\\stage\\tstage01.lua",
	}
	
g_tNpc_Sendout = {
	name = "Sø Gi¶ Ho¹t §éng Bang",
	templateNpc = "Gia C¸t CÇm",
	tMapXY = tPos_Chefu[1],
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_send_out.lua",
	}

g_tNpc_QiuJiang = {
	name = "Th­¬ng Nh©n CÇu T­ëng Nh¸t Gan",
	templateNpc = "Th­¬ng Nh©n CÇu T­ëng Nh¸t Gan",
	tMapXY = tPos_Qiujiang[1],
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_qiujiang.lua",
	}

g_sz5SeriesScriptFile = "\\script\\missions\\tong_activity\\npc\\npc_5series.lua";

g_tNpc_5Series = {
	[1] = {
		name = "Ngò Hµnh Kim Sø",
		templateNpc = "Bang Héi Ngò Hµnh Kim Sø",
		tMapXY = tPos_5Series[1],
		scriptFile = g_sz5SeriesScriptFile,
		},
	[2] = {
		name = "Ngò Hµnh Méc Sø",
		templateNpc = "Bang Héi Ngò Hµnh Méc Sø",
		tMapXY = tPos_5Series[2],
		scriptFile = g_sz5SeriesScriptFile,
		},
	[3] = {
		name = "Ngò Hµnh Thæ Sø",
		templateNpc = "Bang Héi Ngò Hµnh Thæ Sø",
		tMapXY = tPos_5Series[5],
		scriptFile = g_sz5SeriesScriptFile,
		},								
	[4] = {
		name = "Ngò Hµnh Thñy Sø",
		templateNpc = "Bang Héi Ngò Hµnh Thñy Sø",
		tMapXY = tPos_5Series[3],
		scriptFile = g_sz5SeriesScriptFile,
		},
	[5] = {
		name = "Ngò Hµnh Háa Sø",
		templateNpc = "Bang Héi Ngò Hµnh Háa Sø",
		tMapXY = tPos_5Series[4],
		scriptFile = g_sz5SeriesScriptFile,
		},
	}
	
g_tNpc_PrizeBox = {
	[1] = {
		name = "R­¬ng Gi¶i 1",
		templateNpc = "B¶o r­¬ng lín r¬i trªn mÆt ®Êt",
		tMapXY = tPos_PrizeBox[1],
		scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_box.lua",
		},
	[2] = {
		name = "R­¬ng Gi¶i 2",
		templateNpc = "B¶o r­¬ng nhá r¬i trªn mÆt ®Êt",
		tMapXY = tPos_PrizeBox[2],
		scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_box.lua",
		},
}

g_tNpc_RandomBox = {
	name = "R­¬ng Tµng B¶o §å",
	templateNpc = "R­¬ng Tµng B¶o §å r¬i trªn mÆt ®Êt",
	tMapXY = tPos_RandomBox,
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_box.lua",
}

g_tNpc_ShiJie = {
	name = "Nga Mi tiÓu s­ tû ",
	templateNpc = "Bang Héi Nga Mi TiÓu S­ Tû",
	tMapXY = tPos_ShiJie[1],
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_shijie.lua",
}