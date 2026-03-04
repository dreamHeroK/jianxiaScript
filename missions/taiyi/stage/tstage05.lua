Include("\\script\\online\\qianhe_tower\\qht_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
--第5关：业刃
-----------------------------------------------------------------
tStage05 = {
	name = "第5关：业刃",
	nStageId = 5,
	maxsecond = 120 * 60,
	actionsType = "second",
};
tStage05 = inherit(cycPhase, tStage05);

function tStage05:onTimeout()
	local self = tStage05;
	this:Msg2MSAll(format("%d 时间超过 [%s], 挑战失败!", tStage05.maxsecond / 60, tStage05.name));
	TY_CloseMission();
end

--业刃-准备区
-----------------------------------------------------------------
tStage05_1 = {
	name = "业刃-准备区",
	nStageId = TOTAL_STAGE + tStage05.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "业刃-准备区",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage05_1:CreateNpcs()
	local self = tStage05_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_2, tNpcPos.mgy[6][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_2, tNpcPos.yzb[6][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage05_1:Init()
	local self = tStage05_1;
	
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_03, 0);
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("队长与穆桂英对话来开启关卡！") end);
end

function tStage05_1:BeginFight()
	local self = tStage05_1;
	SetMissionV(this.mv_22, 1);	--开启关卡
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 14, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 26, 0, 1);
	end
end

function tStage05_1:CheatMode()
	local self = tStage05_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>穆桂英<color>: 你的"..TYT_IB_ITEM[1].."数量不足.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 34, 0, 1);
	self:BeginFight();
end

function tStage05_1:EndStage06()
	local self = tStage05_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage05_1:OnPlayerDeath()
	local self = tStage05_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage05_1:onTimeout()
	this:Msg2MSAll("超过5分钟，挑战失败.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage05_1:NpcMain()
	local self = tStage05_1;
	local nNpcIdx = GetTargetNpc();
	if not TY_IsCaptain() or GetNpcName(nNpcIdx) ~= tNpcs.mgy_1[2] then return 0; end
	
	if not tStage05_1.sel_NORMAL then
		tStage05_1.sel_NORMAL = {
			"开启第五关：业刃/#tStage05_1.BeginFight()",
	--		"作弊模式（需要  "..TYT_IB_ITEM[1].."*1)/#tStage05_1.CheatMode()",
	--		"结束第五关/#tStage05_1.EndStage06()",
			"离开副本/TY_ConfirmClose",
			"结束对话/nothing",
		};
	end
	
	if not tStage05_1.sel_HARD then
		tStage05_1.sel_HARD = {
			"开启第五关：业刃/#tStage05_1.BeginFight()",
--			"结束第五关/#tStage05_1.EndStage06()",
			"离开副本/TY_ConfirmClose",
			"结束对话/nothing",
		};
	end
	
	local strTab = tStage05_1.sel_HARD;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		strTab = tStage05_1.sel_NORMAL;
	end
	Say("<color=green>穆桂英<color>: 前方流光溢彩，金光闪耀，这气息……很像爷爷的佩刀！!", getn(strTab), strTab);
end

tStage05_1 = inherit(cycPhase, tStage05_1);

tStage05_1.actions = {
	[1] = {
		[0] = {tStage05_1.Init, },
	},
};

tStage05_1.triggers = {
	Talk = {
		{action = tStage05_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage05_1.OnPlayerDeath},
	},
};

--业刃-开启
-----------------------------------------------------------------
tStage05_2 = {
	name = "业刃-开启",
	nStageId = TOTAL_STAGE + tStage05.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "业刃-开启",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage05_2:Init()
	local self = tStage05_2;
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_easy_open_2, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.taiyita_hard_open_2, 1);
	end
	
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 1);	--1:关卡开启对话 2:战斗阶段 3:战斗结束对话
	SetMissionV(this.mv_24, 0);	--技能循环周期
	SetMissionV(this.mv_25, 0);	--技能周期第20秒是否释放过荒火之球
	SetMissionV(this.mv_26, 1);	--技能周期循环次数
	SetMissionV(this.mv_27, -1);--大金刀倒计时
	SetMissionV(this.mv_28, 0);--技能释放点X坐标
	SetMissionV(this.mv_29, 0);--技能释放点Y坐标
	SetMissionV(this.mv_30, 3);--荒火流金刀出现倒计时
	SetMissionV(this.mv_31, 0);--Boss死亡
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 0); end);
	this.msCamp:turnPlayer(0, self.AddNBJ);
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	TY_AddAttackState();
	TY_ClearDamagePoint();
	--Observer:onEvent(OE_TAIYI_LEVEL_START, {5, GetMissionV(MV_MAP_ID), GetMissionV(this.mv_02)});	--201212活动添加 捣蛋的雪人

end

function tStage05_2:OnNpcDeath(event, data)
	local self = tStage05_2;
	local szName = GetNpcName(data[1]);
	
	if szName ~= tNpcs.hhlj[2] then
		RemoveNpc(data[1]);
	else
		local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
		local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
		TY_SetNpcType2Talk(nMgyIdx);
		TY_SetNpcType2Talk(nYzbIdx);
		SetMissionV(this.mv_22, 3);	--结束战斗
		SetMissionV(this.mv_30, 5);
		TY_ClearNpc(tNpcs.ljfb[2]);
		SetMissionV(this.mv_31, 1);
	end
end

function tStage05_2:DropKnife()
	if 3 ~= GetMissionV(this.mv_22) then return 0; end
	local self = tStage05_2;
	local nVal = GetMissionV(this.mv_30);
	if 0 == nVal then
		local nHhljIdx = TY_FindNpc(tNpcs.hhlj[2]);
		local nMapId, x, y = GetNpcWorldPos(nHhljIdx);
		RemoveNpc(nHhljIdx);
		local nNpcIdx = CreateNpc("荒火鎏金刀", "荒火鎏金刀", nMapId, x, y);
		SetMissionV(this.mv_20, 2);	--第二段对话
		SetMissionV(this.mv_21, 1);
	end
	if nVal >= 0 then
		SetMissionV(this.mv_30, nVal - 1);
	end
end

--凝冰诀
function tStage05_2:AddNBJ()
	if 1 ~= gf_Judge_Room_Weight(1, 10, "") then
		Talk(1, "", "你的背包空间不足，不能获得凝冰诀");
		return 0;
	end
	
	gf_AddItemEx({2, 95, 1510, 1}, "凝冰诀");
end

function tStage05_2:DelNBJ()
	local nItemCount = BigGetItemCount(2, 95, 1510);
	if nItemCount >= 1 then
		if 1 ~= BigDelItem(2, 95, 1510, nItemCount) then
			WriteLog(format("[tTY:onLeave] [离开太一塔，删除凝冰诀失败！] [Account:%s Role:%s]", GetAccount(), GetName()));
		end
	end
end

function tStage05_2:CheckPos()
	if GetMissionV(this.mv_22) ~= 2 or GetMissionV(this.mv_24) < 60 then		--技能循环第60秒开始走向台中间
		return 0;
	end
	
	local nHhljIdx = TY_FindNpc(tNpcs.hhlj[2]);
	if 0 == nHhljIdx then return 0; end
	local _, x, y = GetNpcWorldPos(nHhljIdx);
	if abs(x - 1451) > 1 or abs(y - 3494) > 1 then
		if GetMissionV(this.mv_24) < 70 then
			return 0;
		else	--第70秒还未走到，直接拉到中间
			SetNpcPos(nHhljIdx, 1451, 3494);
		end
	end
	g_NpcAI:setAI(nHhljIdx, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nHhljIdx, {{x, y}, });
	CastState2Npc(nHhljIdx, "state_fetter", 1, 10 * 18);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1675);	--释放技能荒火鎏金
	else
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1675);	--释放技能荒火鎏金
	end
	SetMissionV(this.mv_24, -10);
	SetMissionV(this.mv_26, GetMissionV(this.mv_26) + 2);
end

function tStage05_2:DoSkill1(nHhljIdx, x, y)
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1669);	--荒火烈焰
	else
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1669);	--荒火烈焰
	end
end

function tStage05_2:DoSkill2(nHhljIdx, x, y)
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	if 0 == nMgyIdx then return 0; end
	NpcChat(nMgyIdx, "快使用凝冰诀，荒火之球会把我们烧成灰烬！");
	this:Msg2MSAll("快使用凝冰诀，荒火之球会把我们烧成灰烬！");
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("荒火鎏金刀") end);
	if  eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1671);	--荒火之球
	else
		NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1671);	--荒火之球
	end
end

function tStage05_2:CreateLjfb(x, y)
	local nMapId = this.msPosition:getMapID();
	local nLjfb = CreateNpc(tNpcs.ljfb[1], tNpcs.ljfb[2], nMapId, x, y);	--鎏金风暴
	CastState2Npc(nLjfb, "state_confusion", 100, 18*60);
	SetCurrentNpcSFX(nLjfb, 990, 1, 1);
end

function tStage05_2:DoSkill()
	local self = tStage05_2;
	if GetMissionV(this.mv_22) ~= 2 then
		return 0;
	end
	local nValue = GetMissionV(this.mv_24);
	local nHhljIdx = TY_FindNpc(tNpcs.hhlj[2]);
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
	local nMapId, x, y = GetNpcWorldPos(nHhljIdx);

	--大金刀触发时间
	if not self.tTimePoint then self.tTimePoint = {}; end
	if not self.tTimePoint["DJD"] then
		tStage05_2.tTimePoint["DJD"] = {
			[0 ] = 1,
			[6 ] = 1,
			[12] = 1,
			[18] = 1,
			[24] = 1,
			[30] = 1,
			[36] = 1,
			[42] = 1,
			[48] = 1,
			[54] = 1,
			[60] = 1,
		};
	end
	
	if not self.tTimePoint["RANDOM"] then
		tStage05_2.tTimePoint["RANDOM"] = {
			[1] = 1,
			[16] = 1,
			[31] = 1,
			[46] = 1,
			[60] = 1,
		};
	end
	
	if self.tTimePoint["DJD"][nValue] then
		local _, x, y = TY_FindRandomPlayerPos({x, y});
		if x then
			NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1672);
			SetMissionV(this.mv_27, 2);
			SetMissionV(this.mv_28, x);
			SetMissionV(this.mv_29, y);
		end
	end
	
	if 0 == GetMissionV(this.mv_27) then
		local x, y = GetMissionV(this.mv_28), GetMissionV(this.mv_29);
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1673);
		else
			NpcCommand(nHhljIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1673);
		end
	end
	
	if self.tTimePoint["RANDOM"][nValue] then
		if not self.tSkillList then
			self.tSkillList = {
				{0.5, self.DoSkill1},
				{0.5, self.DoSkill2},
			};
		end
		local nRand = random(1, 100000);
		for i = 1, getn(self.tSkillList) do
			nRand = nRand - self.tSkillList[i][1] * 100000;
			if nRand <= 0 then
				self.tSkillList[i][2](self, nHhljIdx, x, y);
				break;
			end
		end
	elseif nValue >= 60 then	--60秒后的阶段在CheckPos中
		g_NpcAI:setAI(nHhljIdx, AT_SM_MOVE);
		g_NpcAI:setWayPoint(nHhljIdx, {{1451, 3495}, });
	end
	
	if GetMissionV(this.mv_27) >= 0 then
		SetMissionV(this.mv_27, GetMissionV(this.mv_27) - 1);
	end
	SetMissionV(this.mv_24, GetMissionV(this.mv_24) + 1);
end

function tStage05_2:CreateLjfb()
	local self = tStage05_2;
	if not self.tRoadPoints then
		self.tRoadPoints = {
			["A"] = {1449, 3455},
			["B"] = {1492, 3499},
			["C"] = {1406, 3498},
			["D"] = {1447, 3545},
			["E"] = {1429, 3475},
			["F"] = {1471, 3477},
			["G"] = {1474, 3519},
			["H"] = {1428, 3521},
		};
	end
	if not self.tList then
		self.tList = {
			{"A", "B", "D", "C", "A"},
			{"D", "C", "A", "B", "D"},
			{"F", "E", "G", "H", "F"},
			{"H", "G", "F", "E", "H"},
		};
	end
	local nMapId = this.msPosition:getMapID();
	local tList = self.tList;
	for i = 1, getn(tList) do
		local nLjfb = CreateNpc(tNpcs.ljfb[1], tNpcs.ljfb[2], nMapId, self.tRoadPoints[tList[i][1]][1], self.tRoadPoints[tList[i][1]][2]);	--鎏金风暴
		SetCurrentNpcSFX(nLjfb, 990, 1, 1);
		CastState2Npc(nLjfb, "state_dispear", 100, 60*60*18);
		AddUnitStates(nLjfb, 8, -GetUnitCurStates(nLjfb, 8));	--视野变0
		local tPointList = {};
		g_NpcAI:setAI(nLjfb, AT_SM_PATROL);
		for j = 1, getn(tList[i]) do
			tinsert(tPointList, self.tRoadPoints[tList[i][j]]);
		end
		g_NpcAI:setWayPoint(nLjfb, tPointList);
	end
end

function tStage05_2:StagePassed()
	local self = tStage05_2;
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 1); end);
	this.msCamp:turnPlayer(0, self.DelNBJ);
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 15, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 27, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_46, 0); -- 千寻塔产出
	TY_StagePassed(self);
	self:onFinish();
end

function tStage05_2:NpcTalk()
	local self = tStage05_2;
	if GetMissionV(this.mv_22) ~= 1 and GetMissionV(this.mv_22) ~= 3 then
		return 0;
	end
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local tContent = {
	[1] = {
			{nYzbIdx, "等等，先停下......这股灼热的气浪......我认得它！"},
			{nMgyIdx, "什么？"},
			{nYzbIdx, "这炽烈的金光，霸道的气势，像极了爷爷出征时的景象！"},
			{nMgyIdx, "可台子上了个......怎么看都不像咱家老令公。"},
			{nYzbIdx, "... ..."},
			{-1, ""},
		},
		[2] = {
			{nYzbIdx, "！！！果然是......荒火鎏金"},
			{nYzbIdx, "桂英，你可曾听过“金刀杨业”这个外号？"},
			{nMgyIdx, "自然知道，爷爷刀法极高，可称得上是北方武人中的名家翘楚。"},
			{nYzbIdx, "不错，而这“金刀杨业”中的金刀二字，所指的正是这把荒火鎏金！爷爷生前征战，这把大刀从未离身，金沙滩一役中了辽人奸计，方才失陷。"},
			{nMgyIdx, "想来因为辟邪之战，这太一塔竟也有了聚灵之力，荒火鎏金思念故主，竟然幻化为人形，镇守其中。经过刚才一番鏖战，这才被宗保身上的杨门血脉所降服！"},
			{nYzbIdx, "今日物归原主，我会用这把爷爷的宝刀，完成爷爷未完的事业！"},
			{-1, ""}
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		else
			if nParagraph == 1 then	--第一段废话说完
				SetMissionV(this.mv_22, 2);	--开打
				self:CreateLjfb();
				local nHhljIdx = 0;
				if eDifType.NORMAL == GetMissionV(this.mv_02) then
					nHhljIdx = TY_CreateNpc(tNpcs.hhlj_1, tNpcPos.hhlj[6][1]);
--					TY_SupplyNpc(self.nStageId);
				else
					nHhljIdx = TY_CreateNpc(tNpcs.hhlj, tNpcPos.hhlj[6][1]);
				end
				SetNpcDeathScript(nHhljIdx, thisFile);
				
				local nMgyIdx = TY_FindNpc(tNpcs.mgy_2[2]);
				local nYzbIdx = TY_FindNpc(tNpcs.yzb_2[2]);
				TY_SetNpcType2Fight(nMgyIdx);
				TY_SetNpcType2Fight(nYzbIdx);
				NpcChat(nYzbIdx, "快使用凝冰诀，荒火之球会把我们烧成灰烬！.");
				this:Msg2MSAll("快使用凝冰诀，荒火之球会把我们烧成灰烬！");
			elseif nParagraph == 2 then
				self:StagePassed();
			end
		end
		
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage05_2:onTimeout()
	local self = tStage05_2;
	if 1 == GetMissionV(this.mv_31) then
		self:StagePassed();
		return 0;
	end
	TY_RecordDamagePoint()
	this:Msg2MSAll("超过5分钟，挑战失败.");
	if GetMissionV(this.mv_22) == 0 then
		TY_CloseMission();
		return 0;
	end
	
	this.msCamp:turnPlayer(0, function() SetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN, 0); end);
	this.msCamp:turnPlayer(0, self.DelNBJ);
--	if eDifType.NORMAL == GetMissionV(this.mv_02) and 1 == GetMissionV(this.mv_03) then
--		TY_GoToStage(self, self.father.father, 1);
--		this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[tStage00.nStageId][1]);
--	else
		TY_GoToStage(self, self.father, 1);
--	end
end

function tStage05_2:OnPlayerDeath(event, data)
	local self = tStage05_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage05_2 = inherit(cycPhase, tStage05_2);

tStage05_2.actions = {
	[1] = tStage05_2.Init,
};

tStage05_2.cycActions = {
	[1] = {
		[0] = {tStage05_2.CheckPos, tStage05_2.DropKnife, tStage05_2.DoSkill, },
	},
	[2] = {
		[0] = {tStage05_2.NpcTalk, },
	},
};

tStage05_2.triggers = {
	NpcDeath = {
		{action = tStage05_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage05_2.OnPlayerDeath},
	},
};

--业刃-结束区
-----------------------------------------------------------------
tStage05_3 = {
	name = "业刃-结束区",
	nStageId = TOTAL_STAGE + tStage05.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "业刃-结束区",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage05_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[6][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[6][2]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
end

function tStage05_3:Init()
	local self = tStage05_3;
	
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage05_3:GoToStage07()
	local self = tStage05_3;
	TY_ClearMapNpc();
	self:onFinish();
end

function tStage05_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage05_3.sel then
			tStage05_3.sel = {
				"开启第六关：亢龙有悔/#tStage05_3.GoToStage07()",
				"离开副本/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		Say("<color=green>穆桂英<color>: 是否要去太一塔巅？", getn(tStage05_3.sel), tStage05_3.sel);
	end
end

function tStage05_3:OnPlayerDeath()
	local self = tStage05_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage05_3:onTimeout()
	this:Msg2MSAll("超过5分钟，挑战失败");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage05_3 = inherit(cycPhase, tStage05_3);

tStage05_3.actions = {
	[1] = tStage05_3.Init,
};

tStage05_3.cycActions = {
	
};

tStage05_3.triggers = {
	Talk = {
		{action = tStage05_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage05_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage05.phases = {tStage05_1, tStage05_2, tStage05_3};
