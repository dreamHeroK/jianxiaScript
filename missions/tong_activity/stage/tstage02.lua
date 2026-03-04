Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Include("\\script\\missions\\tong_activity\\cfg\\npc_cfg.lua")
Import("\\script\\missions\\tong_activity\\tong_activity_value.lua")
tStage02 = {
	name = "R髏 thng",
	nStageId = 2,
	maxsecond = 30 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai 畂筺 ng khu v鵦",
		time = 30 * 60,
		cyc = 0,
		id = 3,
	},	
};

function confirmClose() 
	--ds_TONG_ACTIVITY:AddStatValue(1,6 + nType,1);             
	TongActivity_SetTongValue(enumTongValue_ActivityMapId, 0);
	SetMissionV(MV_MISSION_STATUS,1);
	CloseMission(this.missionID);
end

function tStage02:CreateNpcs()
	local nMapId = this.msPosition:getMapID();
	local nNpcIdx = 0;
--	CreateNpc(g_tNpc_Sendout.templateNpc, g_tNpc_Sendout.name,nMapId, g_tNpc_Sendout.tMapXY[1], g_tNpc_Sendout.tMapXY[2]);
--	SetNpcScript(nNpcIdx,g_tNpc_Sendout.scriptFile);
		
	--箱子	
	local nIdx = 2;
	if GetMissionV(this.mv4) == 1 then
		nIdx = 1;
	end
		
	nNpcIdx = CreateNpc(g_tNpc_PrizeBox[nIdx].templateNpc, g_tNpc_PrizeBox[nIdx].name,nMapId, g_tNpc_PrizeBox[nIdx].tMapXY[1], g_tNpc_PrizeBox[nIdx].tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tNpc_PrizeBox[nIdx].scriptFile);
end

--function tStage02:NpcMain()
--	local nNpcIdx = GetTargetNpc();
--	local szName = GetNpcName(nNpcIdx);
--	
--	if tNpcs.mgy_1[2] == szName then
--	end
--end
function update_player_info02()
	check_give_player_exp_buff();
end

function tStage02:onTimeout()
	this:Msg2MSAll("Ho箃 ng bang k誸 th骳");
	local m = this.msPosition:getMapID();
	ClearMapNpc(m);
	--reviveAll();
	confirmClose();
end

function tStage02:OnPlayerDeath()
	--local self = tStage02;
	--local nMapId = GetWorldPos();
	--SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage02.Init()
	tStage02.CreateNpcs();
end

tStage02 = inherit(cycPhase, tStage02);
tStage02.actions = {
	[1] = tStage02.Init,
};
tStage02.cycActions = {
		[59] = {
			[0] = update_player_info02,
			start = 1,		-- 从什么时候开始
		},		
};

tStage02.triggers = {
--	Talk = {
--		{action = tStage02.NpcMain},
--	},
--	PlayerDeath = {
--		{action = tStage02.PlayerDeath},
--	},
};
