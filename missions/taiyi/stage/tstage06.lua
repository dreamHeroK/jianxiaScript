Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

--第6关：亢龙有悔
-----------------------------------------------------------------
tStage06 = {
	name = "第6关：亢龙有悔",
	nStageId = 6,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage06 = inherit(cycPhase, tStage06);

function tStage06:onTimeout()
	local self = tStage06;
	this:Msg2MSAll(format("%d 时间超过 [%s], 挑战失败!", tStage06.maxsecond / 60, tStage06.name));
	TY_CloseMission();
end

-----------------------------------------------------------------
tStage06_1 = {
	name = "亢龙有悔—准备区",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "亢龙有悔—准备区",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_1:CreateNpcs()
	local self = tStage06_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[7][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[7][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage06_1:BeginFight()
	local self = tStage06_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 16, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 28, 0, 1);
	end
end

function tStage06_1:CheatMode()
	local self = tStage06_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>穆桂英<color>: 你的"..TYT_IB_ITEM[1].."数量不足..");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 35, 0, 1);
	self:BeginFight();
end

function tStage06_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if not TY_IsCaptain() or GetNpcName(nNpcIdx) ~= tNpcs.mgy_2[2] then return 0; end
	
	if not tStage06_1.sel_NORMAL then
		tStage06_1.sel_NORMAL = {
			"开启第六关：亢龙有悔/#tStage06_1.BeginFight()",
	--		"作弊模式（需要 "..TYT_IB_ITEM[1].."*1)/#tStage06_1.CheatMode()",
			"离开副本/TY_ConfirmClose",
			"结束对话/nothing",
		};
	end
	
	if not tStage06_1.sel_HARD then
		tStage06_1.sel_HARD = {
			"开启第六关：亢龙有悔/#tStage06_1.BeginFight()",
			"离开副本/TY_ConfirmClose",
			"结束对话/nothing",
		};
	end
	
	local strTab = tStage06_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage06_1.sel_NORMAL;
	end
	Say("<color=green>穆桂英<color>: 大侠是否做好了准备？", getn(strTab), strTab);
end

function tStage06_1:onTimeout()
	this:Msg2MSAll("超过5分钟，挑战失败");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage06_1:Init()
	local self = tStage06_1;
	
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_22, 0);
	SetMissionV(this.mv_03, 0);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("队长与穆桂英对话来开启关卡！") end);
end

function tStage06_1:OnPlayerDeath()
	local self = tStage06_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage06_1 = inherit(cycPhase, tStage06_1);

tStage06_1.actions = {
	[1] = {
		[0] = {tStage06_1.Init, },
	},
};

tStage06_1.triggers = {
	Talk = {
		{action = tStage06_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_1.OnPlayerDeath},
	},
};

--亢龙有悔-开启
-------------------------------------------------------------------
tStage06_2 = {
	name = "亢龙有悔-开启",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "亢龙有悔-开启",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_2:OnTrap(nTrapId)
	local self = tStage06_2;
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	if 1 == nTrapId then
		local nMapId, x, y = GetWorldPos();
		local nLastTime = GetTask(TASKID_TAIYITA_TIME);
		local nNowTime = GetTime();
		if nNowTime - nLastTime > 5 then
			local tDsyh = tNpcs.dsyh;
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				tDsyh = tNpcs.dsyh_1;
			end
			for i = 1, 3 do
				nNpcIdx = CreateNpc(tDsyh[1], tDsyh[2], nMapId, x, y, -1, 1, 1, 10);
				SetNpcScript(nNpcIdx, thisFile);
			end
			SetTask(TASKID_TAIYITA_TIME, nNowTime);
		end
	end
end

function tStage06_2:CreateNpcs()
	local self = tStage06_2;
	local nYlfhIdx = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nYlfhIdx = TY_CreateNpc(tNpcs.ylfh_1, tNpcPos.ylfh[7][1]);
	else
		nYlfhIdx = TY_CreateNpc(tNpcs.ylfh, tNpcPos.ylfh[7][1]);
	end
	CastState2Npc(nYlfhIdx, "state_attack_trans", 50, 5*60*18);
	TY_SetNpcType2Talk(nYlfhIdx);
end

function tStage06_2:Init()
	local self = tStage06_2;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_easy_open_3, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_hard_open_3, 1);
	end
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 1);	--0:未开启关卡 1:开启前戏对话 2:开始战斗 3:结束对话
	SetMissionV(this.mv_23, 0);
	SetMissionV(this.mv_24, 5);	--技能1倒计时
	SetMissionV(this.mv_25, 0);	--技能2倒计时
	SetMissionV(this.mv_26, 0);
	SetMissionV(this.mv_30, 0);	--是否进入第二阶段
	SetMissionV(this.mv_31, 1);	--火焰刷新倒计时
	SetMissionV(this.mv_32, 1);	--火焰刷新顺序idx
	SetMissionV(this.mv_33, 0);	--是否进入第三阶段
	self:CreateNpcs();
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	if not self.tFirePoints then
		self.tFirePoints = {{1648,3477},{1657,3485},{1670,3495},{1679,3502},{1672,3516},{1660,3526},{1640,3537},{1633,3529},{1622,3519},{1610,3511},{1622,3492},{1636,3477},{1640,3492},{1632,3504},{1634,3516},{1650,3523},{1622,3500},{1623,3507},{1630,3485},{1645,3514},{1628,3498},{1673,3474},{1674,3497},};
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	if 0 ~= nMgyIdx and 0 ~= nYzbIdx then
		SetNpcDir(nMgyIdx, 36);
		SetNpcDir(nYzbIdx, 34);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage06_2:OnNpcDeath(event, data)
	local self = tStage06_2;
	local szName = GetNpcName(data[1]);
	RemoveNpc(data[1]);
	if szName == tNpcs.ylfh[2] then
		self:StagePassed();
	end
end

function tStage06_2:OnBossStage1()	--BOSS 阶段一[0.65]
	local self = tStage06_2;
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	if 0 == GetMissionV(this.mv_24) then	--20秒释放一次
		SetMissionV(this.mv_24, 10);
		local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
		NpcChat(nMgyIdx, "注意躲开耶律飞鸿的横扫千军！");
		this:Msg2MSAll("注意躲开耶律飞鸿的横扫千军！");
		
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nPlayerIndex = TY_FindRandomPlayer({x, y});
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 4*18);
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		nMapId, x, y = GetWorldPos();
		if eDifType.NORMAL == GetMissionV(this.mv_02) then		--横扫千军
			DoSkill2Target(nYlfhIdx, 1680, 2, PIdx2NpcIdx(nPlayerIndex));
		else
			DoSkill2Target(nYlfhIdx, 1680, 1, PIdx2NpcIdx(nPlayerIndex));
		end
		PlayerIndex = nOldPlayerIndex;
		NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1756);	--回笼枪
		
		this.msCamp:turnPlayer(0, function() HeadMsg2Player("快躲开地面上的火焰！") end);
	end
	
	if GetMissionV(this.mv_24) >= 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) - 1);
	end
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
	end
end

function tStage06_2:OnBossStage2()	--BOSS 阶段一[0.35]
	local self = tStage06_2;
	
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	if 0 == GetMissionV(this.mv_30) then
		SetMissionV(this.mv_30, 1);
		SetMissionV(this.mv_32, 1);
		SetNpcPos(nYlfhIdx, 1648, 3502);
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 10 * 60 * 18, 0, 10013);
		local nMapId = this.msPosition:getMapID();
		local nNpcIdx = CreateNpc("耶律飞鸿", "耶律飞鸿", nMapId, 1659, 3508);
		SetNpcScript(nNpcIdx, thisFile);
		CastState2Npc(nNpcIdx, "state_fetter", 1, 10 * 60 * 18, 0, 10013);
		
		local nMaxLife1, _  = GetUnitBaseStates(nYlfhIdx, 1);
		local _, nCurLife1	= GetUnitCurStates(nYlfhIdx, 1);
		local nMaxLife2, _  = GetUnitBaseStates(nNpcIdx, 1);
		local fPercent = nCurLife1 / nMaxLife1;
		ModifyNpcData(nNpcIdx, 0, floor(nMaxLife2*fPercent), 0);
		
		local nMapId = this.msPosition:getMapID();
		if not self.tRandList then self.tRandList = {}; end
		if not self.tRandList[nMapId] then
			self.tRandList[nMapId] = floyd_rm4n(getn(self.tFirePoints), getn(self.tFirePoints));
		end
	end
	local nYlfhsyIdx = TY_FindNpc("耶律飞鸿");
	if 0 ~= nYlfhsyIdx then
		local nMaxLife1, _  = GetUnitBaseStates(nYlfhIdx, 1);
		local _, nCurLife1	= GetUnitCurStates(nYlfhIdx, 1);
		local nMaxLife2, _  = GetUnitBaseStates(nYlfhsyIdx, 1);
		local _, nCurLife2	= GetUnitCurStates(nYlfhsyIdx, 1);
		
		local fAvg = (nCurLife1 / nMaxLife1 + nCurLife2 / nMaxLife2) / 2.0;
		
		ModifyNpcData(nYlfhIdx, 0, floor(nMaxLife1*fAvg), 0);
		ModifyNpcData(nYlfhsyIdx, 0, floor(nMaxLife2*fAvg), 0);
	end
	
	if 0 == GetMissionV(this.mv_26) then	--流光绝影10s一次
		SetMissionV(this.mv_26, 3);
		--连线技能修改为随机施放技能7（20%）和技能8
		if not self.tSkillList_NORMAL then
			self.tSkillList_NORMAL = {
				{0.2, 1777, 2}, {0.2, 1771, 2}, {0.3, 1772, 2}, {0.3, 1773, 2},
			};
		end
		if not self.tSkillList_HARD then
			self.tSkillList_HARD = {
				{0.2, 1777, 1}, {0.2, 1771, 1}, {0.3, 1772, 1},{0.3, 1773, 2},
			};
		end
		
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nRand = random(1, 100000);
		local tSkillList = self.tSkillList_HARD;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			tSkillList = self.tSkillList_NORMAL;
		end
		
		for i = 1, getn(tSkillList) do
			nRand = nRand - tSkillList[i][1] * 100000;
			if nRand <= 0 then
				NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*tSkillList[i][3]+tSkillList[i][2]);
				break;
			end
		end
	end
	if 0 == GetMissionV(this.mv_31) then	--混乱火堆15s一个
		SetMissionV(this.mv_31, 6);
		
		local nIdx = GetMissionV(this.mv_32);
		local nMapId = this.msPosition:getMapID();
		if self.tRandList and self.tRandList[nMapId] and nIdx <= getn(self.tRandList[nMapId]) then
			nIdx = self.tRandList[nMapId][nIdx];
			local x, y = self.tFirePoints[nIdx][1], self.tFirePoints[nIdx][2];
			SetMissionV(this.mv_32, nIdx + 1);
			local nNpcIdx = CreateNpc("耶律火焰", "耶律火焰", nMapId, x, y);
			if 0 ~= nNpcIdx then
				CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
				SetCurrentNpcSFX(nNpcIdx, 991, 1, 1);
			end
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			NpcChat(nMgyIdx, "快躲开地面上的火焰！");
			this:Msg2MSAll("快躲开地面上的火焰！");
		end
	end
	if GetMissionV(this.mv_31) >= 0 then
		SetMissionV(this.mv_31, GetMissionV(this.mv_31) - 1);
	end
	if GetMissionV(this.mv_26) >= 0 then
		SetMissionV(this.mv_26, GetMissionV(this.mv_26) - 1);
	end
end

function tStage06_2:OnBossStage3()	--BOSS 阶段一[0]
	local self = tStage06_2;
	if 0 == GetMissionV(this.mv_33) then
		local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
		SetMissionV(this.mv_33, 1);
		SetMissionV(this.mv_32, 1);
		SetMissionV(this.mv_24, 10);
		SetMissionV(this.mv_25, 13);
		RemoveStateFromNpc(nYlfhIdx, 10013);
		local nYlfhsyIdx = TY_FindNpc("耶律火焰");
		if 0 ~= nYlfhsyIdx then RemoveNpc(nYlfhsyIdx); end
		TY_ClearNpc("耶律火焰");
		
		if not self.tFirePoints_1 then
			self.tFirePoints_1 = {{1648,3477},{1657,3485},{1670,3495},{1679,3502},{1672,3516},{1660,3526},{1640,3537},{1633,3529},{1622,3519},{1610,3511},{1622,3492},{1636,3477},{1640,3492},{1632,3504},{1634,3516},{1650,3523},{1622,3500},{1623,3507},{1630,3485},{1645,3514},{1628,3498},{1673,3474},{1674,3497},};
		end
		local nMapId = this.msPosition:getMapID();
		if not self.tRandList then self.tRandList = {}; end
		if not self.tRandList[nMapId] then
			self.tRandList[nMapId] = floyd_rm4n(getn(self.tFirePoints_1), getn(self.tFirePoints_1));
		end
	end
	if 0 == GetMissionV(this.mv_24) then			--20秒释放横扫千军，回笼枪
		SetMissionV(this.mv_24, 10);
		local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
		local nMapId, x, y = GetNpcWorldPos(nYlfhIdx);
		local nPlayerIndex = TY_FindRandomPlayer({x, y});
		CastState2Npc(nYlfhIdx, "state_fetter", 1, 4*18);
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		nMapId, x, y = GetWorldPos();
		if eDifType.NORMAL == GetMissionV(this.mv_02) then		--横扫千军
			DoSkill2Target(nYlfhIdx, 1680, 2, PIdx2NpcIdx(nPlayerIndex));
		else
			DoSkill2Target(nYlfhIdx, 1680, 1, PIdx2NpcIdx(nPlayerIndex));
		end
		NpcCommand(nYlfhIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536+1756);	--回笼枪
		PlayerIndex = nOldPlayerIndex;
	end
	
	if 0 == GetMissionV(this.mv_25) then
		SetMissionV(this.mv_25, 6);
		local nIdx = GetMissionV(this.mv_32);
		local nMapId = this.msPosition:getMapID();
		if self.tRandList and self.tRandList[nMapId] and nIdx <= getn(self.tRandList[nMapId]) then
			SetMissionV(this.mv_32, nIdx + 1);
			nIdx = self.tRandList[nMapId][nIdx];
			local x, y = self.tFirePoints_1[nIdx][1], self.tFirePoints_1[nIdx][2];
			local nNpcIdx = CreateNpc("耶律火焰", "耶律火焰", nMapId, x, y);
			if 0 ~= nNpcIdx then
				CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
				SetCurrentNpcSFX(nNpcIdx, 991, 1, 1);
			end
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
			NpcChat(nMgyIdx, "快躲开地面上的火焰！");
			this:Msg2MSAll("快躲开地面上的火焰！");
		end
	end
	
	if GetMissionV(this.mv_24) >= 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) - 1);
	end
	
	if GetMissionV(this.mv_25) >= 0 then
		SetMissionV(this.mv_25, GetMissionV(this.mv_25) - 1);
	end
end

function tStage06_2:DoSkill()
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local self = tStage06_2;
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	if 0 == nYlfhIdx then return 0; end
	
	local nMaxLife, nCurLife = GetUnitCurStates(nYlfhIdx, 1);
	local fPercent = nCurLife / nMaxLife;
	if not self.tEventList then
		self.tEventList = {
			{0.65, self.OnBossStage1}, {0.35, self.OnBossStage2}, {0, self.OnBossStage3},
		};
	end
	
	for i = 1, getn(self.tEventList) do
		if fPercent > self.tEventList[i][1] then
			self.tEventList[i][2]();
			break;
		end
	end
end

function tStage06_2:StagePassed()
	local self = tStage06_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 17, 0, 1);
		gf_TeamOperateEX(function ()
			AddRuntimeStat(18, 41, GetPlayerRoute(), 1);		
		end);
		--普通太一塔全通 vipcard
		this.msCamp:turnPlayer(0, _vc_TYT_AllPass, 0);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 29, 0, 1);
		gf_TeamOperateEX(function ()
			AddRuntimeStat(18, 43, GetPlayerRoute(), 1);		
		end);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_46, 0); -- 千寻塔产出
	TY_StagePassed(self);
	self:onFinish();
end

function tStage06_2:NpcTalk()
	if not (1 == GetMissionV(this.mv_22) or 3 == GetMissionV(this.mv_22)) then
		return 0;
	end
	local self = tStage06_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
	local nYlfhIdx	= TY_FindNpc(tNpcs.ylfh[2]);
	local tContent = {
		[1] = {
			{nYzbIdx, "你就是耶律飞鸿？"},
			{nYlfhIdx, "哪来的鼠辈，胆敢质问本王姓名！"},
			{nYzbIdx, "哼！我乃大宋金刀杨令公嫡孙，杨延昭之子，杨宗保是也！今日特来取你这辽狗首级！祭奠我杨氏一门忠烈！"},
			{nYlfhIdx, "嗟尔鼠辈，安敢妄言！"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		else
			if nParagraph == 1 then	--第一段废话说完
				SetMissionV(this.mv_22, 2);	--开打
				local nYlfhIdx	= TY_FindNpc(tNpcs.ylfh[2]);
				local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
				local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
				TY_SetNpcType2Fight(nYzbIdx);
				TY_SetNpcType2Fight(nMgyIdx);
				TY_SetNpcType2Fight(nYlfhIdx);
				NpcChat(nMgyIdx, "注意耶律飞鸿的前面和后面都是非常危险的区域，另外，千万不要走到边缘的人骨区域。");
				this:Msg2MSAll("注意耶律飞鸿的前面和后面都是非常危险的区域，另外，千万不要走到边缘的人骨区域。");
--				if eDifType.NORMAL == GetMissionV(this.mv_02) then
--					TY_SupplyNpc(self.nStageId);
--				end
			end
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage06_2:onTimeout()
	local self = tStage06_2;
	TY_RecordDamagePoint()
	this:Msg2MSAll("超过5分钟，挑战失败.");
	TY_GoToStage(self, self.father, 1);
end

function tStage06_2:OnPlayerDeath(event, data)
	local self = tStage06_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage06_2 = inherit(cycPhase, tStage06_2);

tStage06_2.actions = {
	[1] = tStage06_2.Init,
};

tStage06_2.cycActions = {
	[1] = {
		[0] = {tStage06_2.DoSkill},
	},
	[2] = {
		[0] = {tStage06_2.NpcTalk, },
	},
};

tStage06_2.triggers = {
	NpcDeath = {
		{action = tStage06_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage06_2.OnPlayerDeath},
	},
};

--结束
-----------------------------------------------------------------
tStage06_3 = {
	name = "结束",
	nStageId = TOTAL_STAGE + tStage06.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "结束",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage06_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[7][2]);
	SetNpcDir(nMgyIdx, 55);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[7][2]);
	SetNpcDir(nYzbIdx, 8);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	local nYlfhIdx = TY_CreateNpc(tNpcs.ylfh, tNpcPos.ylfh[7][2]);
	TY_SetNpcType2Talk(nYlfhIdx);
	SetNpcDir(nYlfhIdx, 35);
end

function tStage06_3:Init()
	local self = tStage06_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage06_3:NpcTalk()
	local self = tStage06_3;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local nYlfhIdx = TY_FindNpc(tNpcs.ylfh[2]);
	
	local tContent = {
		[1] = {
			{nYlfhIdx, "白狼衍素镜，倚剑目苍穹。烽火关山三百二，故人乘鹤化游龙。"},
			{nYlfhIdx, "三十余年，雁门麗兵，杨兄治军严谨，韬略高明，飞鸿着实佩服，窃引为平生知己，只是飞鸿身兼家国重担，只能与君干戈相见，难诉衷肠。"},
			{nYlfhIdx, "杨兄，你是南朝抵住，却为奸臣设计，情愿以死明志……当初你要是归顺了我大辽，哪用得着活的这般憋屈！"},
			{nYzbIdx, "耶律飞鸿！用不着你说这些假惺惺的话！快把爷爷的骨灰盒交出来！"},
			{nYlfhIdx, "什么？你们休想偷走杨兄的骨灰！黄口小儿，你道我发方才真的是怕了你们么？"},
			{tNpcs.yy[2], "住——手——"},
			{nYlfhIdx, "难道是……杨兄？"},
			{tNpcs.yy[2], "不错，正是故人。"},
			{{nYzbIdx, nMgyIdx}, "爷爷"},
			{tNpcs.yy[2], "耶律贤弟，杨某生前与你数次交手，贤弟用兵，常令杨某自叹不如。我死之后，你又向辽主告老，要来看守这太一塔，保贱躯周全。数年以来，阁下每每长叹自嗟，杨某都看在眼里，试问我何德何能，能得大王如此垂青？你我虽是汉辽两立，然杨某当世之知己，唯耶律兄一人而已！"},
			{nYlfhIdx, "杨兄！有你今天这句话，耶律飞鸿这辈子值了！"},
			{tNpcs.yy[2], "这柄荒火鎏金随我征战多年，常伴左右。方今世上能配此物者，唯贤弟一人而已！今日，我便将它转赠与你，贤弟万勿推辞！"},
			{nYlfhIdx, "如此，多谢杨兄了！"},
			{tNpcs.yy[2], "宗保，桂英你们要好好的活下去，杨家的未来，就靠你们了……"},
			{nYlfhIdx, "暮云深锁清秋梦，素月寒星照归人。多少离愁多少怨，凭栏细数，雨默风城。杨兄骨灰再次，你们走吧！"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		local v = tContent[nParagraph][nSentence][1];
		if "number" ~= type(v) or (tContent[nParagraph][nSentence][1] > 0) then
			if "number" == type(v) then
				NpcChat(v, tContent[nParagraph][nSentence][2]);
			elseif "string" == type(v) then
				local nNpcIdx = TY_FindNpc(v);
				if 0 == nNpcIdx then
					nNpcIdx = TY_CreateNpc(tNpcs.yy, tNpcPos.yy[7][1]);
					SetNpcDir(nMgyIdx, 38);
					SetNpcDir(nYzbIdx, 32);
				end
				NpcChat(nNpcIdx, tContent[nParagraph][nSentence][2]);
			elseif "table" == type(v) then
				for i = 1, getn(v) do
					NpcChat(v[i], tContent[nParagraph][nSentence][2]);
				end
			end
		else
			local nNpcIdx = TY_FindNpc(tNpcs.yy[2]);
			RemoveNpc(nNpcIdx);
			RemoveNpc(nYlfhIdx);
			SetNpcDir(nMgyIdx, 55);
			SetNpcDir(nYzbIdx, 15);
			SetMissionV(this.mv_22, 1);
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage06_3:NpcMain()
	if 0 == GetMissionV(this.mv_22) then return 0; end
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		local strTab = {
			"离开副本/TY_CloseMission",
			"结束对话/nothing",
		};
		Say("<color=green>穆桂英<color>: 关卡结束", getn(strTab), strTab);
	end
end

function tStage06_3:OnPlayerDeath()
	local self = tStage06_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage06_3:onTimeout()
	this:Msg2MSAll("超过5分钟，挑战失败");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage06_3 = inherit(cycPhase, tStage06_3);

tStage06_3.actions = {
	[1] = tStage06_3.Init,
};

tStage06_3.cycActions = {
	[2] = {
		[0] = {tStage06_3.NpcTalk, },
	},
};

tStage06_3.triggers = {
	Talk = {
		{action = tStage06_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage06.phases = {tStage06_1, tStage06_2, tStage06_3};
