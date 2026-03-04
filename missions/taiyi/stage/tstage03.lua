Include("\\script\\online\\qianhe_tower\\qht_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
--第3关：梵天之梦
-----------------------------------------------------------------
tStage03 = {
	name = "第3关：梵天之梦",
	nStageId = 3,
	maxsecond = 120 * 60,
	actionsType = "second",
};

tStage03 = inherit(cycPhase, tStage03);

function tStage03:onTimeout()
	local self = tStage03;
	this:Msg2MSAll(format("%d 时间超过 [%s], 挑战失败!", tStage03.maxsecond / 60, tStage03.name));
	TY_CloseMission();
end

--第3关：梵天之梦-准备区
-----------------------------------------------------------------
tStage03_1 = {
	name = "第3关：梵天之梦-准备区",
	nStageId = TOTAL_STAGE + tStage03.nStageId*3 + 1,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "第3关：梵天之梦-准备区",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage03_1.CreateNpcs()
	local self = tStage03_1;
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[3][1]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[3][1]);
	local nJjgIdx = TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
	TY_SetNpcType2Talk(nMgyIdx);
	TY_SetNpcType2Talk(nYzbIdx);
end

function tStage03_1.Init()
	local self = tStage03_1;
	SetMissionV(MV_STAGE, self.father.nStageId);
	SetMissionV(this.mv_03, 0);
	
	TY_ClearColdDown();
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][1]);
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("队长与穆桂英对话来开启关卡！") end);
end

function tStage03_1.OnFinish()
	local self = tStage03_1;
	self:onFinish();
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 10, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 22, 0, 1);
	end
end

function tStage03_1.CheatMode()
	local self = tStage03_1;
	if GetItemCount(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4]) < 1 then
		Talk(1, "", "<color=green>穆桂英<color>: 你的"..TYT_IB_ITEM[1].."数量不足.");
		return 0;
	end
	if 1 ~= DelItem(TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1) then return 0; end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2], TYT_IB_ITEM[3], TYT_IB_ITEM[4], 1})
	SetMissionV(this.mv_03, 1);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	AddRuntimeStat(18, 32, 0, 1);
	self:OnFinish();
end

function tStage03_1.EndStage03()
	local self = tStage03_1;
	TY_StagePassed(self);
	
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	SetMissionV(self.father.curPhaseLv, 3);
	local tCurPhase = self.father.phases[3];
	tCurPhase:onInit(self.father);
end

function tStage03_1.OnPlayerDeath()
	local self = tStage03_1;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage03_1:onTimeout()
	this:Msg2MSAll("超过5分钟，挑战失败");
	TY_ReviveAll(0);
	TY_CloseMission();
end

function tStage03_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		if not tStage03_1.sel_NORMAL then
			tStage03_1.sel_NORMAL = {
	--			"结束第3关/#tStage03_1.EndStage03()",
				"开启第三关：梵天之梦/#tStage03_1.OnFinish()",
	--			"作弊模式（需要 "..TYT_IB_ITEM[1].."*1)/#tStage03_1.CheatMode()",
				"离开副本/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		if not tStage03_1.sel_HARD then
			tStage03_1.sel_HARD = {
		--		"结束第3关/#tStage03_1.EndStage03()",
				"开启第三关：梵天之梦/#tStage03_1.OnFinish()",
				"离开副本/TY_ConfirmClose",
				"结束对话/nothing",
			};
		end
		local strTab = tStage03_1.sel_HARD;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			strTab = tStage03_1.sel_NORMAL;
		end
		Say("<color=green>穆桂英<color>: 大侠是否做好了准备？", getn(strTab), strTab);
	end
end

tStage03_1 = inherit(cycPhase, tStage03_1);

tStage03_1.actions = {
	[1] = {
		[0] = {tStage03_1.Init, },
	},
};

tStage03_1.triggers = {
	Talk = {
		{action = tStage03_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage03_1.OnPlayerDeath},
	},
};

--第3关：梵天之梦
-----------------------------------------------------------------
tStage03_2 = {
	name = "第3关：梵天之梦",
	nStageId = TOTAL_STAGE + tStage03.nStageId*3 + 2,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "第3关：梵天之梦",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage03_2:Init()
	local self = tStage03_2;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);	--是否开始战斗
	SetMissionV(this.mv_23, 0);	--吟唱时间 >0为吟唱前 <0为吟唱后 == 0 停止 [3, 1] [-3, -1]
	SetMissionV(this.mv_24, 0);	--魅魔,魅魔精英 小怪数量
	SetMissionV(this.mv_25, 0);	--是否过关
	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, TY_AddGodState); end
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_easy_open_3, 1);
	else
		--ds_TYT:AddStatValue(1, tDataStateList.fantianlin_hard_open_3, 1);
	end
	TY_AddAttackState();
	TY_ClearDamagePoint();
end

function tStage03_2:StagePassed()
	local self = tStage03_2;
	local nDifType = GetMissionV(this.mv_02);
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(18, 11, 0, 1);
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(18, 23, 0, 1);
	end
	this.msCamp:turnPlayer(0, qht_raid_tyt_13, 0); -- 千寻塔产出
	TY_StagePassed(self);
	self:onFinish();
end
	
function tStage03_2:NpcTalk()
	if GetMissionV(this.mv_22) == 1 then
		return 0;
	end
	local self = tStage03_2;
	local nParagraph = GetMissionV(this.mv_20);
	local nSentence = GetMissionV(this.mv_21);
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
	local tContent = {
		[1] = {
			{nMgyIdx, "这……是个迷阵？宗保！我们中埋伏了！"},
			{nYzbIdx, "啊啊啊！！我的脑袋好疼！快帮帮我！啊……身体，身体不听使唤了！"},
			{-1, ""},
		},
		[2] = {
			{nYzbIdx, "你们终于醒了！好家伙，真把我累的够呛！"},
			{nMgyIdx, "诸位，你们可知道辽人的天门大阵？"},
			{nMgyIdx, "这里好玩天门阵有异曲同工之妙。你们方才就是被阵中迷云所惑，不管我们说什么做什么，在你们眼里都是发狂的敌人。"},
			{nYzbIdx, "我和桂英身上都带着降龙术，所以才能保持清醒。可毕竟力量有限，只能等你们在战斗中慢慢力竭，降龙术才能压制住迷阵的蛊惑，让你们恢复神智。"},
			{nYzbIdx, "不知者不怪！我们现在不都没事么？哈哈哈"},
			{nMgyIdx, "前方就是太一塔，我们还是速速离了这诡异的梵天林，进塔去吧！"},
			{-1, ""},
		},
	};
	
	if nSentence <= getn(tContent[nParagraph]) then
		if tContent[nParagraph][nSentence][1] > 0 then
			NpcChat(tContent[nParagraph][nSentence][1], tContent[nParagraph][nSentence][2]);
		end
		
		if nParagraph == 1 and nSentence == getn(tContent[nParagraph]) then	--说完第一段废话开打
			local nMgyIdx = TY_FindNpc(tNpcs.mgy_1[2]);
			local nYzbIdx = TY_FindNpc(tNpcs.yzb_1[2]);
			RemoveNpc(nMgyIdx);
			RemoveNpc(nYzbIdx);
			TY_ClearMapNpc()
			TY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1]);
			SetMissionV(this.mv_22, 1);
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				nMgyIdx = TY_CreateNpc(tNpcs.mgy_3_1, {1642, 3209});
				nYzbIdx = TY_CreateNpc(tNpcs.yzb_3_1, {1612, 3182});
--				TY_SupplyNpc(self.nStageId);
			else
				nMgyIdx = TY_CreateNpc(tNpcs.mgy_3, {1642, 3209});
				nYzbIdx = TY_CreateNpc(tNpcs.yzb_3, {1612, 3182});
			end
		elseif nParagraph == 2 and nSentence == getn(tContent[nParagraph]) then
			self:StagePassed();
		end
		SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	end
end

function tStage03_2:CheckPos()
	if GetMissionV(this.mv_22) ~= 1 or eDifType.NORMAL == GetMissionV(this.mv_02) then
		return 0;
	end
	
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	if 0 ~= nYzbIdx and 0 == IsNpcDeath(nYzbIdx) and 0 ~= nMgyIdx and 0 == IsNpcDeath(nMgyIdx) then
		local _, x1, y1 = GetNpcWorldPos(nMgyIdx);
		local _, x2, y2 = GetNpcWorldPos(nYzbIdx);
		if abs(x2 - x1) <= 15 and abs(y2 - y1) <= 15 then
			NpcChat(nMgyIdx, "恭喜率领江湖精英破除梵天林普通迷障，成功进入太一塔！");
			this:Msg2MSAll("恭喜率领江湖精英破除梵天林普通迷障，成功进入太一塔！");
		end
	end
	if 0 ~= nYzbIdx and 1 ~= IsNpcDeath(nYzbIdx) then	--魅魔变精英
		local tNpcIdx = TY_FindAllNpc("魅魔");
		local _, x, y = GetNpcWorldPos(nYzbIdx);
		for i = 1, getn(tNpcIdx) do
			local _, x1, y1 = GetNpcWorldPos(tNpcIdx[i]);
			if abs(x1 - x) <= 15 and abs(y1 - y) <= 15 then
				SetNpcLifeTime(tNpcIdx[i], 0);
				local nMapId, x, y = GetNpcWorldPos(tNpcIdx[i]);
				local nNpcIdx = CreateNpc("魅惑之王", "魅惑之王", nMapId, x, y);
				SetNpcDeathScript(nNpcIdx, thisFile);
				SetCampToNpc(nNpcIdx, CampEnemy);
				return 1;
			end
		end
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	if 0 ~= nMgyIdx and 1 ~= IsNpcDeath(nMgyIdx) then	--魅魔爆炸
		local tNpcIdx = TY_FindAllNpc("魅魔");
		local _, x, y = GetNpcWorldPos(nMgyIdx);
		for i = 1, getn(tNpcIdx) do
			local _, x1, y1 = GetNpcWorldPos(tNpcIdx[i]);
			if abs(x1 - x) <= 15 and abs(y1 - y) <= 15 then
				SetNpcLifeTime(tNpcIdx[i], 1);
				NpcCommand(tNpcIdx[i], NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1656);
				return 1;
			end
		end
	end
end

--检查场上的魅魔，精英 数量
function tStage03_2:CheckMeiMoNum()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	local self = tStage03_2;
	local tNpcIdx = TY_FindAllNpc("魅魔");
	local szMsg = "发现12只魅魔!";
	local nNum = 12
	if eDifType.HARD == GetMissionV(this.mv_02) then
		nNum = 18
	end
	if getn(tNpcIdx) + getn(TY_FindAllNpc("魅惑之王")) >= nNum then
		this:Msg2MSAll(szMsg);
		SetMissionV(this.mv_22, 0);
		TY_GoToStage(self, self.father, 1);
	end
end

function tStage03_2:CheckBlood()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	--DebugOutput("CheckBlood!!!")
	local self = tStage03_2;
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	if 0 == nMgyIdx or 0 == nYzbIdx then 
		DebugOutput("CheckBlood:0 == nMgyIdx or 0 == nYzbIdx")
		return 0; 
	end
	if IsNpcDeath(nMgyIdx) == 1 or IsNpcDeath(nYzbIdx) == 1 then
		DebugOutput("IsNpcDeath(nMgyIdx), IsNpcDeath(nYzbIdx) =", IsNpcDeath(nMgyIdx), IsNpcDeath(nYzbIdx))
		return 0;
	end
	local szName1 = GetNpcName(nMgyIdx);
	local szName2 = GetNpcName(nYzbIdx);
	if not ((szName1 == tNpcs.mgy_3[2] and szName2 == tNpcs.yzb_3[2]) or
		 (szTName1 == tNpcs.mgy_3_1[2] and szName2 == tNpcs.yzb_3_1[2])) then 
		 	DebugOutput("CheckBlood:npcname can't find")
		 	return 0; 
	end
	
	local nSumBlood = 0;
	local nMaxLife1, _  = GetUnitBaseStates(nMgyIdx, 1);
	local _, nCurLife1	= GetUnitCurStates(nMgyIdx, 1);
	local nMaxLife2, _  = GetUnitBaseStates(nYzbIdx, 1);
	local _, nCurLife2	= GetUnitCurStates(nYzbIdx, 1);
	
	local fAvg = (nCurLife1 / nMaxLife1 + nCurLife2 / nMaxLife2) / 2.0;
	
	--DebugOutput(nMaxLife1, nCurLife1, nMaxLife2, nCurLife2)
	--DebugOutput(floor(nMaxLife1*fAvg),floor(nMaxLife2*fAvg))
	ModifyNpcData(nMgyIdx, 0, floor(nMaxLife1*fAvg), 0);
	ModifyNpcData(nYzbIdx, 0, floor(nMaxLife2*fAvg), 0);
end

function tStage03_2:CallMeiMo()
	if GetMissionV(this.mv_22) ~= 1 or eDifType.NORMAL == GetMissionV(this.mv_02) then
		return 0;
	end
	local self = tStage03_2;
	local nMapId = this.msPosition:getMapID();
	for i = 1, 3 do
		local nIdx = random(1, getn(tNpcPos.mm[3]));
		local nNpcIdx = CreateNpc("魅魔", "魅魔", nMapId, tNpcPos.mm[3][nIdx][1], tNpcPos.mm[3][nIdx][2]);
		SetNpcDeathScript(nNpcIdx, thisFile);
		SetCampToNpc(nNpcIdx, CampEnemy);
	end
end

--每隔6秒刷小九龙吞云兽
function tStage03_2:CallTunYunShou()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	
	local self = tStage03_2;
	if not tStage03_2.tPoints then	--需要取点
		tStage03_2.tPoints = {
			{1631, 3191}, {1629, 3182}, {1640, 3196},
			{1624, 3189}, {1639, 3189}, {1617, 3182},
		};
	end
	local nMapId = this.msPosition:getMapID();
	local nIdx = random(1, getn(tStage03_2.tPoints));
	local x, y = tStage03_2.tPoints[nIdx][1], tStage03_2.tPoints[nIdx][2];
	local nNpcIdx = CreateNpc("傀儡", "傀儡", nMapId, x, y);
	SetNpcLifeTime(nNpcIdx, 7);
	SetNpcDeathScript(nNpcIdx, thisFile);
	CastState2Npc(nNpcIdx, "state_attack_trans", 50, 18*60*60);
	CastState2Npc(nNpcIdx, "state_fetter", 1, 6*18);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*2+1768);	--（技能4）
	else
		NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, x*32, y*32, 65536*1+1768);	--（技能4）
	end
end

--每50秒，杨宗保与穆桂英交换位置
function tStage03_2:ChangePos()
	if GetMissionV(this.mv_22) ~= 1 then
		return 0;
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	local nValue = GetMissionV(this.mv_23);
	
	if IsNpcDeath(nMgyIdx) == 1 or IsNpcDeath(nYzbIdx) == 1 or nValue == 0 then
		return 0;
	end
	
	if nValue == 2 then
		NpcChat(nMgyIdx, "每50秒，杨宗保与穆桂英交换位置");
		NpcChat(nYzbIdx, "每50秒，杨宗保与穆桂英交换位置");
		CastState2Npc(nMgyIdx, "state_fetter", 1, 4 * 18);
		CastState2Npc(nYzbIdx, "state_fetter", 1, 4 * 18);
	end
	
	if nValue == 1 then
		SetMissionV(this.mv_23, -2);
		local _, x1, y1 = GetNpcWorldPos(nMgyIdx);
		local _, x2, y2 = GetNpcWorldPos(nYzbIdx);
		SetNpcPos(nMgyIdx, x2, y2);
		SetNpcPos(nYzbIdx, x1, y1);
	end
	
	if nValue > 0 then
		SetMissionV(this.mv_23, nValue - 1);
	end
	
	this.msCamp:turnPlayer(0, function() HeadMsg2Player("每50秒，杨宗保与穆桂英交换位置") end);
end

function tStage03_2:Prepare2ChangePos()
	SetMissionV(this.mv_23, 2);
end

function tStage03_2:DoSkill()
	if 0 == GetMissionV(this.mv_22) or eDifType.NORMAL == GetMissionV(this.mv_02) then
		return 0;
	end
	local self = tStage03_2;
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	
	if 0 ~= nYzbIdx then
		local _, x, y = GetNpcWorldPos(nYzbIdx);
		local nPlayerIndex = GetWhoHitNpcMost(nYzbIdx);
		if not nPlayerIndex then
			nPlayerIndex = PIdx2NpcIdx(TY_FindRandomPlayer({x, y}));
		end
		DoSkill2Target(nYzbIdx, 1658, 1, nPlayerIndex);		--杨宗保沉重打击
	end
	if 0 ~= nMgyIdx then
		local _, x, y = GetNpcWorldPos(nMgyIdx);
		local nPlayerIndex = GetWhoHitNpcMost(nYzbIdx);
		if not nPlayerIndex then
			nPlayerIndex = PIdx2NpcIdx(TY_FindRandomPlayer({x, y}));
		end
		DoSkill2Target(nYzbIdx, 1659, 1, nPlayerIndex);		--杨宗保沉重打击
	end
end

function tStage03_2:OnNpcDeath(event, data)
	local self = tStage03_2;
	local szName = GetNpcName(data[1]);
	if szName ~= tNpcs.mgy_3[2] and szName ~= tNpcs.yzb_3[2] then
		RemoveNpc(data[1]);
		return
	end
	
	local nMgyIdx = TY_FindNpc(tNpcs.mgy_3[2]);
	local nYzbIdx = TY_FindNpc(tNpcs.yzb_3[2]);
	
	
	if (1 == IsNpcDeath(nMgyIdx) and szName == tNpcs.yzb_3[2]) or (1 == IsNpcDeath(nYzbIdx) and tNpcs.mgy_3[2]) then
		SetMissionV(this.mv_25, 1);
		
		TY_ClearMapNpc();
		local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[3][2]);
		local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[3][2]);
		SetMissionV(this.mv_20, 2);		--开始第二段对话
		SetMissionV(this.mv_21, 1);
		SetMissionV(this.mv_22, 0);		--结束战斗阶段
	end
end

function tStage03_2:onTimeout()
	local self = tStage03_2;
	if 1 == GetMissionV(this.mv_25) then
		self:StagePassed();
		return 0;
	end
	TY_RecordDamagePoint()
	this:Msg2MSAll("记录点");
	TY_GoToStage(self, self.father, 1);
end

function tStage03_2:OnPlayerDeath(event, data)
	local self = tStage03_2;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage03_2 = inherit(cycPhase, tStage03_2);

tStage03_2.actions = {
	[1] = tStage03_2.Init,
};

tStage03_2.cycActions = {
	[2] = {
		[0] = {tStage03_2.NpcTalk, tStage03_2.CheckBlood, tStage03_2.ChangePos, tStage03_2.CheckPos, tStage03_2.CheckMeiMoNum},
	},
	[6] = {
		[0] = {tStage03_2.CallTunYunShou},
	},
	[10] = {
		[0] = {tStage03_2.CallMeiMo, },
	},
	[15] = {
		[0] = {tStage03_2.DoSkill, },
	},
	[50] = {
		[0] = {tStage03_2.Prepare2ChangePos, },
	},
};

tStage03_2.triggers = {
	NpcDeath = {
		{action = tStage03_2.OnNpcDeath}
	},
	PlayerDeath = {
		{action = tStage03_2.OnPlayerDeath},
	},
};

--梵天之梦-结束区
-----------------------------------------------------------------
tStage03_3 = {
	name = "梵天之梦-结束区",
	nStageId = TOTAL_STAGE + tStage03.nStageId*3 + 3,
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "梵天之梦-结束区",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};

function tStage03_3:CreateNpcs()
	local nMgyIdx = TY_CreateNpc(tNpcs.mgy_1, tNpcPos.mgy[3][2]);
	local nYzbIdx = TY_CreateNpc(tNpcs.yzb_1, tNpcPos.yzb[3][2]);
end

function tStage03_3.Init()
	local self = tStage03_3;
	
	self:CreateNpcs();
	this.msCamp:turnPlayer(0, TY_SetPlayerPos, tPlayerPos[self.father.nStageId][2]);
end

function tStage03_3.ToTYTower()
	local self = tStage03_3;		
	TY_StagePassed(self);
	self:onFinish();
end

function tStage03_3.GoToTYTower(nDifType, nType)
	local self = tStage03_3;
	if 1 ~= TY_EnterCondCheck("<color=green>穆桂英:<color>", eMSName.TOWER, nDifType) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit("<color=green>穆桂英:<color>", eMSName.TOWER, nDifType) then
		return 0;
	end
	
	if tonumber(nType) == 1 then
		if 1 ~= TY_CheckAndCostJingLi("<color=green>穆桂英:<color>", eMSName.TOWER, nDifType, 1) then
			return 0;
		end
		if 1 ~= TY_CheckAndCostJingLi("<color=green>穆桂英:<color>", eMSName.TOWER, nDifType) then
			return 0;
		end
	elseif tonumber(nType) == 2 then
		if 1 ~= TY_CheckAndCostItem("<color=green>穆桂英:<color>", eMSName.TOWER, nDifType, 1) then
			return 0;
		end
		if 1 ~= TY_CheckAndCostItem("<color=green>穆桂英:<color>", eMSName.TOWER, nDifType) then
			return 0;
		end
	end
	
	TY_StagePassed(self);
	SetMissionV(this.mv_02, nDifType);
	self:onFinish();
end

function tStage03_3:NpcMain()
	local nNpcIdx = GetTargetNpc();
	if GetNpcName(nNpcIdx) == tNpcs.mgy_1[2] then
		if not TY_IsCaptain() then
			return 0;
		end
		
		local strTab = {
			"继续进入太一塔/#tStage03_3.ToTYTower(0)",
		--	format("我要参加普通难度的太一塔(消耗%s)/#tStage03_3.GoToTYTower(%d, %d)", "精力*"..TYT_JOIN_COST_JINGLI[2][1], eDifType.NORMAL, 1),
		--	format("我要参加普通难度的太一塔(队长消耗%s)/#tStage03_3.GoToTYTower(%d, %d)", TYT_JOIN_COST_ITEM[2][1][2].."*"..TYT_JOIN_COST_ITEM[2][1][1][4], eDifType.NORMAL, 2),
		--	format("我要参加英雄难度的太一塔(消耗%s)/#tStage03_3.GoToTYTower(%d, %d)", "精力*"..TYT_JOIN_COST_JINGLI[2][2], eDifType.HARD, 1),
		--	format("我要参加英雄难度的太一塔(队长消耗%s)/#tStage03_3.GoToTYTower(%d, %d)", TYT_JOIN_COST_ITEM[2][2][2].."*"..TYT_JOIN_COST_ITEM[2][2][1][4], eDifType.HARD, 2),
			"离开副本/TY_ConfirmClose",
			"结束对话/nothing",
		};
		Say("<color=green>穆桂英 <color>: 是否进入下一关", getn(strTab), strTab);
	end
end

function tStage03_3:OnPlayerDeath()
	local self = tStage03_3;
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage03_3:onTimeout()
	this:Msg2MSAll("超过5分钟，挑战失败.");
	TY_ReviveAll(0);
	TY_CloseMission();
end

tStage03_3 = inherit(cycPhase, tStage03_3);

tStage03_3.actions = {
	[1] = tStage03_3.Init,
};

tStage03_3.triggers = {
	Talk = {
		{action = tStage03_3.NpcMain},
	},
	NpcDeath = {
		{action = tStage03_3.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
tStage03.phases = {tStage03_1, tStage03_2, tStage03_3};
