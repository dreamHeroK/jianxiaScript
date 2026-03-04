--准备区
-----------------------------------------------------------------
tStage00 = {
	name = "准备区",
	nStageId = 0,
	maxsecond = 5 * 60,
	actionsType = "second",
};

function tStage00:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[0][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[0][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	this:Msg2MSAll("队长与穆桂英对话来开启关卡！");
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("队长与穆桂英对话来开启关卡！") end);
end

function tStage00.GoToStage01()
	local self = tStage00;
	TY_ClearMapNpc();
	self:onFinish();
end

function tStage00.GoToStage04()
	local self = tStage00;
	TY_ClearMapNpc();
	tPhaseDriver:setPhase(5);
end

function tStage00:NpcMain()
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	
	if tNpcs.mgy_1[2] == szName then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage00.sel_FOREST_HARD then
			tStage00.sel_FOREST_HARD = {
				"开启第一关：燃寂之殇/#tStage00.GoToStage01()",
				"离开关卡/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		if not tStage00.sel_FOREST_NORMAL then
			tStage00.sel_FOREST_NORMAL = {
				"开启第一关：燃寂之殇/#tStage00.GoToStage01()",
				"离开关卡/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		if not tStage00.sel_TOWER_HARD then
			tStage00.sel_TOWER_HARD = {
				"开启第一关：燃寂之殇/#tStage00.GoToStage04()",
				"离开关卡/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		if not tStage00.sel_TOWER_NORMAL then
			tStage00.sel_TOWER_NORMAL = {
				"开启第一关：燃寂之殇/#tStage00.GoToStage04()",
				"离开关卡/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		if not tStage00.sel then
			tStage00.sel = {
				[1] = {
					[eDifType.NORMAL] = tStage00.sel_FOREST_NORMAL,
					[eDifType.HARD] = tStage00.sel_FOREST_HARD,
				},
				[2] = {
					[eDifType.NORMAL] = tStage00.sel_TOWER_NORMAL,
					[eDifType.HARD] = tStage00.sel_TOWER_HARD,
				},
			};
		end
		local x, y = GetMissionV(this.mv_01), GetMissionV(this.mv_02);
		local strTab = tStage00.sel[x][y];
		Say("<color=green>穆桂英<color>: 开始关卡", getn(strTab), strTab);
	end
end

function tStage00:onTimeout()
	this:Msg2MSAll("时间结束，挑战失败！");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage00:OnPlayerDeath()
	local self = tStage00;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage00.Init()
	local self = tStage00;
	SetMissionV(MV_STAGE, self.nStageId);
	tStage00:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_ClearTaskID);
	this.msCamp:turnPlayer(0, function() BigDelItem(2, 95, 1510, BigGetItemCount(2, 95, 1510)); end);
end

tStage00 = inherit(cycPhase, tStage00);
tStage00.actions = {
	[1] = tStage00.Init,
};

tStage00.triggers = {
	Talk = {
		{action = tStage00.NpcMain},
	},
	PlayerDeath = {
		{action = tStage00.PlayerDeath},
	},
};
