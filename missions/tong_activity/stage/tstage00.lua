Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Include("\\script\\missions\\tong_activity\\cfg\\npc_cfg.lua")

tStage00 = {
	name = "Giai ®o¹n chuÈn bÞ",
	nStageId = 0,
	maxsecond = 15 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai ®o¹n chuÈn bÞ",
		time =  15 * 60,
		cyc = 0,
		id = 1,
	},
};
	
function tStage00:CreateNpcs()
	local nMapId = this.msPosition:getMapID();
	local nNpcIdx = CreateNpc(g_tNpc_QiuJiang.templateNpc,g_tNpc_QiuJiang.name,nMapId,g_tNpc_QiuJiang.tMapXY[1],g_tNpc_QiuJiang.tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tNpc_QiuJiang.scriptFile);
	
	nNpcIdx = CreateNpc(g_tNpc_Sendout.templateNpc, g_tNpc_Sendout.name,nMapId, g_tNpc_Sendout.tMapXY[1], g_tNpc_Sendout.tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tNpc_Sendout.scriptFile);
	
	for _, s in g_tNpc_5Series do
		nNpcIdx = CreateNpc(s.templateNpc, s.name,nMapId, s.tMapXY[1], s.tMapXY[2]);
		SetNpcScript(nNpcIdx,s.scriptFile);
	end
	
	--Ð¡Ê¦½ã	
	nNpcIdx = CreateNpc(g_tNpc_ShiJie.templateNpc, g_tNpc_ShiJie.name,nMapId, g_tNpc_ShiJie.tMapXY[1], g_tNpc_ShiJie.tMapXY[2]);
	SetNpcScript(nNpcIdx, g_tNpc_ShiJie.scriptFile);			
	SetCampToNpc(nNpcIdx, CampPlayer);
end

--function tStage00:NpcMain()
--	local nNpcIdx = GetTargetNpc();
--	local szName = GetNpcName(nNpcIdx);
--	
--	if tNpcs.mgy_1[2] == szName then
--	end
--end

function tStage00:onTimeout()
	local m = this.msPosition:getMapID();
	--ClearMapNpc(m);
	tStage00:onFinish();
end

function tStage00:OnPlayerDeath()
	--local self = tStage00;
	--local nMapId = GetWorldPos();
	--SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage00.Init()
	SetMissionS(this.ms1, GetTongName());
	SetMissionV(this.mv6, this.msPosition:getMapID());
	tStage00:CreateNpcs();
end

function update_player_info00()
	check_give_player_exp_buff();
end

function send_tip_msg()
	SendTongMessage("Ho¹t ®éng bang ®· më, khu vùc kh«ng cã ng­êi sÏ tù ®ãng l¹i sau mét kho¶ng thêi gian.");
end

tStage00 = inherit(cycPhase, tStage00);
tStage00.actions = {
	[1] = tStage00.Init,
};
tStage00.cycActions = {
		[59] = {
			[0] = update_player_info00,
			start = 1,
		},
		[59] = {
			[1] = send_tip_msg,
			start = 1,
		},	
};

tStage00.triggers = {
--	Talk = {
--		{action = tStage00.NpcMain},
--	},
--	PlayerDeath = {
--		{action = tStage00.PlayerDeath},
--	},
};
