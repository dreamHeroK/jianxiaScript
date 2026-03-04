--红莲七杀
-----------------------------------------------------------------
tStage05 = {
	name = "红莲七杀",
	szStageId = "05",
	maxsecond = 15 * 60,
	actionsType = "second",
};
tStage05 = inherit(cycPhase, tStage05);

tStage05_1 = {
	name = "红莲七杀-Chu萵 ",
	szStageId = "05_1",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "准备时间",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage05_1 = inherit(cycPhase, tStage05_1);

tStage05_2 = {
	name = "红莲七杀",
	szStageId = "05_2",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage05_2 = inherit(cycPhase, tStage05_2);

tStage05_3 = {
	name = "Giai 畂筺 k誸 th骳",
	szStageId = "05_3",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage05_3 = inherit(cycPhase, tStage05_3);

--前对白
tStage05_2_1 = {
	name = "红莲七杀 1",
	szStageId = "05_2_1",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage05_2_1 = inherit(cycPhase, tStage05_2_1);

--后对白
tStage05_2_3 = {
	name = "红莲七杀 3",
	szStageId = "05_2_3",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "离开时间",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage05_2_3 = inherit(cycPhase, tStage05_2_3);

tStage05_2_2 = {
	name = "红莲七杀 2",
	szStageId = "05_2_2",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "红莲七杀",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage05_2_2 = inherit(cycPhase, tStage05_2_2);

-----------------------------------------------------------------
--	tStage05_1
-----------------------------------------------------------------
function tStage05_1:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage05_1:Breathe()
	local self = tStage05_1;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage05_1:CreateNpcs()
	local nLfIdx = JDYY_CreateNpc(tNpcs.lf, tNpcPos.lf[self.szStageId][1]);
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	
	JDYY_SetNpcType2Talk(nLfIdx);
end

function tStage05_1:BringDeathPlayerToFight()
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if JDYY_InDeathArea() then
			JDYY_SetPlayerPos(tPlayerPos["05"][1]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage05_1.Init()
	local self = tStage05_1;
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:mission_name(), %self.father.szStageId, this:mission_stage()) end)
	-- logserver end
	SetMissionS(this.MS_STAGE, self.father.szStageId);
	
--	JDYY_RestoreAll();
	self:CreateNpcs();
	self:BringDeathPlayerToFight();
end

function tStage05_1:OpenStage()
	local nTaskID 	= 0
	local nDifType = GetMissionV(this.mv_02)
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_JDYY_DAILY_TIME_NORMAL;
		AddRuntimeStat(44,2,5,1) --统计jdyy_Normal_OpenStage
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_JDYY_DAILY_TIME_HARD;
		AddRuntimeStat(44,4,5,1)
	else
		return 0
	end

	local self = tStage05_1;
	self:onFinish();
end

function tStage05_1:OnPlayerDeath()
	local self = tStage05_1;
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage05_1:NpcMain()
	if not JDYY_IsCaptain() then
		Talk(1, "", "<color=green>花圣洛飞:<color> 让你的队长来找我!");
		return 0;
	else
		local strTab = {
			"开启第五关: 红莲/#tStage05_1.OpenStage()",
			"离开关卡/#JDYY_ConfirmClose('花圣洛飞')",	
			"取消/nothing",
		};
		Say("<color=green>花圣洛飞:<color> 师傅的红莲五杀霸气十足，各位千万小心。但愿我能劝得师傅退出纷争！大侠可做好准备？", getn(strTab), strTab);
	end
end

function tStage05_1:onTimeout()
	this:Msg2MSAll("关卡时间结束通关失败.");
	JDYY_CloseMission();
end

tStage05_1.actions = {
	[2] = tStage05_1.Init,
};

tStage05_1.triggers = {
	Talk = {
		{action = tStage05_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage05_1.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
--	tStage05_2_1
-----------------------------------------------------------------
function tStage05_2_1:Init()
	local self = tStage05_2_1;
	local nHyIdx = 0;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nHyIdx = JDYY_CreateNpc(tNpcs_NORMAL.hy, tNpcPos.hy[self.szStageId][1]);
	else
		nHyIdx = JDYY_CreateNpc(tNpcs.hy, tNpcPos.hy[self.szStageId][1]);
	end
	
	SetNpcDir(nHyIdx, 35);
	JDYY_SetNpcType2Talk(nHyIdx);
	
	self:FreeDataTable();
end

function tStage05_2_1:MkTalkTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
		local nHyIdx = JDYY_FindNpc(tNpcs.hy[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				{nLfIdx, "师傅，辽国在正面战场已经大势已去，你又何必飞蛾扑火呢。。。。"},
				{nHyIdx, "哼，不如以这天下做个赌注，红莲五杀本座只出三招，若能接住这三招本座便立即离开，永不踏足中原!"},
				{-1, ""},
			},
		};
	end
end

function tStage05_2_1:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage05_2_1.NpcTalk()
	local self = tStage05_2_1;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkTalkTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		self:onFinish();
		return 0;
	end
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

tStage05_2_1.actions = {
	[1] = tStage05_2_1.Init,
};

tStage05_2_1.cycActions = {
	[2] = {
		[0] = {tStage05_2_1.NpcTalk, },
	},
};

-----------------------------------------------------------------
--	tStage05_2_2
-----------------------------------------------------------------
function tStage05_2_2:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
	return self.tEventTable[nMapId];
end

function tStage05_2_2:Breathe()
	SetMissionV(this.mv_33, GetMissionV(this.mv_33) + 1);
	local self = tStage05_2_2;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
		self:MkOnceProcedure();
		self:ClearExpiredEvent();
	end
	
	self.tEventTable[nMapId]:breathe();
--	
--	if not self.tProcedure then
--		self:MkEventTable();
--	end
--	if 1 == GetMissionV(this.mv_36) then
--		local nIndex = GetMissionV(this.mv_35);
--		if not self.tProcedure[nIndex] then
--			nIndex = 1;
--		end
--		
--		self.tProcedure[nIndex](self);
--		SetMissionV(this.mv_35, nIndex + 1);
--		SetMissionV(this.mv_36, 0);
--	end
end

function tStage05_2_2:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
end

function tStage05_2_2:CreateTraps()
	local self = tStage05_2_2;
	if not tTrapPoints[self.szStageId] then return end
	
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	local nMapId = this.msPosition:getMapID();
	local tTraps = {};
	for i = 1, getn(tTrapPoints[self.szStageId]) do
		tinsert(tTraps, {nMapId, tTrapPoints[self.szStageId][i][1], tTrapPoints[self.szStageId][i][2], thisFile});
	end
	tTraps.n = nil;
	gf_CreateTraps(tTraps);
end

function tStage05_2_2.Init()
	local self = tStage05_2_2;
--	SetMissionV(this.mv_20, 1);	--BOSS当前处于第几阶段
--	SetMissionV(this.mv_21, 0);	--BOSS在火圈外的时间
--	SetMissionV(this.mv_22, 8);	--处决次数
--	SetMissionV(this.mv_23, 0);	--随机第1招
--	SetMissionV(this.mv_24, 0);	--随机第2招
--	SetMissionV(this.mv_25, 0);	--随机第3招
--	SetMissionV(this.mv_26, 0);	--随机第4招
--	SetMissionV(this.mv_27, 0);	--红莲点名玩家index
--	SetMissionV(this.mv_28, 0);	--红莲释放倒计时
--	SetMissionV(this.mv_29, 0);	--处决倒计时
--	SetMissionV(this.mv_30, 0);	--漫天花雨计时
--	SetMissionV(this.mv_31, 0);	--红印杀死所有玩家.ID = 5
--	SetMissionV(this.mv_32, 3);	--沙罗营救倒计时
	SetMissionV(this.mv_33, 0);	--Now Time
--	SetMissionV(this.mv_34, 1);	--轮回方阵
	SetMissionV(this.mv_35, 1);	--下一阶段在self.tProcedure中的index
	SetMissionV(this.mv_36, 0);	--当前阶段是否执行完
	SetMissionV(this.mv_37, 0);	--本局玩家死亡次数（所有）
	
	self:FreeDataTable();
	self:MkEventTable();
	self:MkOnceProcedure();
	
	self:CreateNpcs();
	local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
	JDYY_SetNpcType2Fight(nLfIdx);
	local nHyIdx = JDYY_FindNpc(tNpcs.hy[2]);
	JDYY_SetNpcType2Fight(nHyIdx);
	CastState2Npc(nLfIdx, "state_dispear", 100, 60*60*18);

	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_open_5, 1);
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_open_5, 1);
	end
	
	--创建TRAP
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	self:CreateTraps();
	
	this.msCamp:turnPlayer(0, function() JDYY_SetPlayerPos(tPlayerPos["05"][1]); end);
end

function tStage05_2_2:MkDataTable()
	if not self.tPoints_Followers then
		self.tPoints_Followers = {
			{1682, 3711},{1696, 3713},{1682, 3741},{1692, 3721},
			{1702, 3721},{1692, 3731},{1699, 3721},{1692, 3741},
		};
	end
	
	if not self.tFollowers then
		self.tFollowers = {
			"花圣的红玫瑰", "花圣的蓝玫瑰", "花圣的黄玫瑰", "花圣的红玫瑰", "花圣的蓝玫瑰", "花圣的黄玫瑰"
		};
	end
	
	if not self.tStateList then
		self.tStateList = {
			["花圣的红玫瑰"] = {"state_p_attack_percent_add", 981, {150, 100},{"外功提高","外功提高"}},
			["花圣的蓝玫瑰"] = {"state_m_attack_percent_add", 982, {150, 100},{"内功提高","内功提高"}},
			["花圣的黄玫瑰"] = {"state_damage_point", 983, {1500, 1000},{"伤害增加","伤害增加"}},
		};
	end
	
	if not self.tPoints_CJ then
		self.tPoints_CJ = {
			{1692, 3687},{1692, 3708},{1678, 3711},{1698, 3711},
			{1705, 3719},{1717, 3736},{1710, 3748},{1726, 3724},
		};
	end
	
	if not self.tPoints_LH then
		self.tPoints_LH = {
			[1] = {
				{1696, 3685}, {1709, 3699}, {1722, 3715}, {1735, 3731}, {1714, 3743}, {1700, 3725}, {1684, 3706},
			},
			[2] = {
				{1728, 3713}, {1713, 3697}, {1697, 3686}, {1684, 3705}, {1698, 3719}, {1710, 3732}, {1722, 3747},
			},
		};
	end
	
	if not self.tBossPos_LH then
		self.tBossPos_LH = {
			[1] = {
				{1691, 3663},
			},
			[2] = {
				{1724, 3775},
			},
		};
	end
	
	if not self.tPoint_JP then
		self.tPoint_JP = {
			{1692, 3687},{1692, 3708},{1678, 3711},{1698, 3711},
			{1705, 3719},{1717, 3736},{1710, 3748},{1726, 3724},
		};
	end
	
	--火海
	if not self.tPoints_HH then
		self.tPoints_HH = {
			[1] = {
				[1] = {{1692, 3701}, {{1692, 3701}, {1712, 3696}, {1716, 3724}, {1704, 3731}, {1693, 3721}, }},
				[2] = {{1712, 3696}, {{1712, 3696}, {1716, 3724}, {1704, 3731}, {1693, 3721}, {1692, 3701}, }},
				[3] = {{1716, 3724}, {{1716, 3724}, {1704, 3731}, {1693, 3721}, {1692, 3701}, {1712, 3696}, }},
				[4] = {{1704, 3731}, {{1704, 3731}, {1693, 3721}, {1692, 3701}, {1712, 3696}, {1716, 3724}, }},
				[5] = {{1693, 3721}, {{1693, 3721}, {1692, 3701}, {1712, 3696}, {1716, 3724}, {1704, 3731}, }},
			},
			[2] = {
				[1] = {{1695, 3743}, {{1695, 3743}, {1710, 3746}, {1725, 3738}, {1731, 3718}, {1725, 3698}, {1712, 3680}, {1695, 3678}, {1681, 3693}, {1679, 3719},}, },
				[2] = {{1710, 3746}, {{1710, 3746}, {1725, 3738}, {1731, 3718}, {1725, 3698}, {1712, 3680}, {1695, 3678}, {1681, 3693}, {1679, 3719}, {1695, 3743},}, },
				[3] = {{1725, 3738}, {{1725, 3738}, {1731, 3718}, {1725, 3698}, {1712, 3680}, {1695, 3678}, {1681, 3693}, {1679, 3719}, {1695, 3743}, {1710, 3746},}, },
				[4] = {{1731, 3718}, {{1731, 3718}, {1725, 3698}, {1712, 3680}, {1695, 3678}, {1681, 3693}, {1679, 3719}, {1695, 3743}, {1710, 3746}, {1725, 3738},}, },
				[5] = {{1725, 3698}, {{1725, 3698}, {1712, 3680}, {1695, 3678}, {1681, 3693}, {1679, 3719}, {1695, 3743}, {1710, 3746}, {1725, 3738}, {1731, 3718},}, },
				[6] = {{1712, 3680}, {{1712, 3680}, {1695, 3678}, {1681, 3693}, {1679, 3719}, {1695, 3743}, {1710, 3746}, {1725, 3738}, {1731, 3718}, {1725, 3698},}, },
				[7] = {{1695, 3678}, {{1695, 3678}, {1681, 3693}, {1679, 3719}, {1695, 3743}, {1710, 3746}, {1725, 3738}, {1731, 3718}, {1725, 3698}, {1712, 3680},}, },
				[8] = {{1681, 3693}, {{1681, 3693}, {1679, 3719}, {1695, 3743}, {1710, 3746}, {1725, 3738}, {1731, 3718}, {1725, 3698}, {1712, 3680}, {1695, 3678},}, },
				[9] = {{1679, 3719}, {{1679, 3719}, {1695, 3743}, {1710, 3746}, {1725, 3738}, {1731, 3718}, {1725, 3698}, {1712, 3680}, {1695, 3678}, {1681, 3693},}, },
			},
		};
	end
	
	if not self.tOrder_JWPZ then
		self.tOrder_JWPZ = {
			{1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {1, 3, 5, 7}, {2, 4, 6, 8}, {1, 5, 9, 7}, {1, 3, 5, 7, 9}, {1, 2, 5, 6, 7, 8},
		};
	end
	
	if not self.tPos_JWPZ then
		self.tPos_JWPZ = {
			{1677, 3713},{1687, 3690},{1697, 3669},
			{1695, 3738},{1716, 3695},{1717, 3694},
			{1705, 3719},{1723, 3739},{1736, 3716},
		};
	end
	
	if not self.tNpcList_XM then
		self.tNpcList_XM = {
			{"武林人士地1", "心魔幻象", {1692, 3687}},
			{"武林人士地2", "心魔幻象", {1692, 3708}},
			{"武林人士地3", "心魔幻象", {1678, 3711}},
			{"武林人士地4", "心魔幻象", {1698, 3711}},
			{"武林人士地5", "心魔幻象", {1705, 3719}},
			{"武林人士地6", "心魔幻象", {1717, 3736}},
			{"武林人士地7", "心魔幻象", {1710, 3748}},
			{"武林人士地8", "心魔幻象", {1726, 3724}},
			{"武林人士地9", "心魔幻象", {1681, 3693}},
			{"武林人士地10", "心魔幻象", {1710, 3746}},
			{"武林人士地1", "心魔幻象", {1725, 3738}},
			{"武林人士地2", "心魔幻象", {1679, 3719}},
			{"武林人士地3", "心魔幻象", {1712, 3680}},
			{"武林人士地4", "心魔幻象", {1712, 3680}},
			{"武林人士地5", "心魔幻象", {1681, 3693}},
		};
	end
	
	if not self.tProcedure then
		self.tProcedure = {
			--self.JinWuPuZhao, self.XinMo, self.SiWangXuanGao, self.XinMo, self.JinWuPuZhao, self.SiWangXuanGao, self.JinWuPuZhao, self.JinWuPuZhao, self.SiWangXuanGao,
		};
	end
end

function tStage05_2_2:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
end

function tStage05_2_2:JinWuPuZhao()
	-- print("\n金乌普照")
	local self = tStage05_2_2;
	if not self.tOrder_JWPZ or not self.tPos_JWPZ then
		self:MkDataTable();
	end
	
	local tEventTable = self:GetEventTable();
	if not tEventTable then
		tEventTable = self:MkEventTable();
	end
	
	local nNpcIdx = JDYY_FindNpc(tNpcs.hy[2]);
	local nTime = 0;
	for i = 1, getn(self.tOrder_JWPZ) do
--		local tList = self.tOrder_JWPZ[i];
--		for k = 1, getn(tList) do
--			local tPos = self.tPos_JWPZ[tList[k]];
			tEventTable:insertevent(nTime, self.JinWuPuZhao_DoSkill, self, nNpcIdx, tPos);
--		end
		nTime = nTime + 3;
	end
	tEventTable:insertevent(nTime + 1, function() SetMissionV(this.mv_36, 1); end);
end

function tStage05_2_2:JinWuPuZhao_DoSkill(nNpcIdx)
	-- print("\n金乌普照--执行")
	if not nNpcIdx then
		return
	end
	
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 1);
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		local _, x, y = GetWorldPos();
		DoSkill2Pos(nNpcIdx, 2116, nSkillLevel, x, y);
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage05_2_2:XinMo()
	-- print("\n心魔幻象")
	local self = tStage05_2_2;
	if not self.tNpcList_XM then
		self:MkDataTable();
	end
	
	local nMapId = this.msPosition:getMapID();
	
	local tRand = floyd_m4n(getn(self.tNpcList_XM), 8);
	
	for k, v in tRand do
		local nNpcIdx = CreateNpc(self.tNpcList_XM[k][1], self.tNpcList_XM[k][2], nMapId, self.tNpcList_XM[k][3][1], self.tNpcList_XM[k][3][2]);
		SetNpcDeathScript(thisFile);
		SetCampToNpc(nNpcIdx, CampEnemy);
		SetNpcLifeTime(nNpcIdx, 15);
	end
	
	local tEventTable = self:GetEventTable();
	if not tEventTable then
		tEventTable = self:MkEventTable();
	end
	
	tEventTable:insertevent(1, function() SetMissionV(this.mv_36, 1); end);
end

--死亡宣告.ID = 1
function tStage05_2_2.SiWangXuanGao()
	-- print("\n死亡宣告")
	local self = tStage05_2_2;
	
	local nHyIdx = JDYY_FindNpc(tNpcs.hy[2]);
	if 0 == nHyIdx then return 0; end
	
	NpcChat(nHyIdx, "心中得邪恶，是你们堕落得源泉");
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local _, x, y = GetNpcWorldPos(nHyIdx);
	DoSkill2Pos(nHyIdx, 2117, nSkillLevel, x, y);
	
	local nOldPlayerIndex = PlayerIndex;
	this.msCamp:reflash();
	for i = 1, getn(this.msCamp.players) do
		if not JDYY_IsPlayerDeath(this.msCamp.players[i]) and not JDYY_InDeathArea(this.msCamp.players[i]) then
			PlayerIndex = this.msCamp.players[i];
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 1004, 1, 0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	
	--刷处决免死金牌
	if not self.tPoint_JP then
		self:MkDataTable();
	end
	
	local tEventTable = self:GetEventTable();
	if not tEventTable then
		tEventTable = self:MkEventTable();
	end
	tEventTable:insertevent(6, self.ChuJue, self, nHyIdx);
end

--死亡宣告.ID = 2
function tStage05_2_2:ChuJue(nNpcIdx)
	-- print("\n死亡宣告--处决")
	local nMapId, x, y = GetNpcWorldPos(nNpcIdx);
	DoSkill2Pos(nNpcIdx, 2124, 20, x, y);
	
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 8);
	local tRand = floyd_m4n(getn(self.tPoint_JP), getn(tPlayerIndex));
	for k, v in tRand do
		local tPos = self.tPoint_JP[k];
		local nNpcIdx = CreateNpc("外院总管腰牌", "金牌", nMapId, tPos[1], tPos[2]);
		SetNpcScript(nNpcIdx, thisFile);
		SetNpcLifeTime(nNpcIdx, 7);
	end
	
	local tEventTable = self:GetEventTable();
	if not tEventTable then
		tEventTable = self:MkEventTable();
	end
	tEventTable:insertevent(5, self.HuaShenDeZhuFu, self);
end

--死亡宣告.ID = 3
function tStage05_2_2:HuaShenDeZhuFu()
	-- print("\n花圣祝福")
	local self = tStage05_2_2;
	if not self.tPoints_Followers or not self.tFollowers then
		self:MkDataTable();
	end
	
	local tRandList = floyd_m4n(getn(self.tPoints_Followers), getn(self.tFollowers));
	local nMapId = this.msPosition:getMapID();
	local i = 1;
	for k, v in tRandList do
		local nNpcIdx = CreateNpc(self.tFollowers[i], self.tFollowers[i], nMapId, self.tPoints_Followers[k][1], self.tPoints_Followers[k][2]);
		SetNpcScript(nNpcIdx, thisFile);
		CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18);
		SetNpcLifeTime(nNpcIdx, 6);
		i = i + 1;
	end
	--tEventTable:insertevent(1, function() SetMissionV(this.mv_36, 1); end);
	SetMissionV(this.mv_36, 1);
end

function tStage05_2_2:NpcMain()
	local self = tStage05_2_2;
	local nNpcIdx = GetTargetNpc();
	
	if not self.tStateList then
		self:MkDataTable();
	end
	
	local szName = GetNpcName(nNpcIdx);
	if szName == "金牌" then
		CastState("state_invincibility", 100, 10*18, 0);
		RemoveNpc(nNpcIdx);
	elseif self.tStateList[szName] then
		RemoveNpc(nNpcIdx);
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			CastState(self.tStateList[szName][1], self.tStateList[szName][3][2], 10 * 18);

		--	local szMsg = format("L蕐 %s :%s ",szName,self.tStateList[szName][4][1])
		--	Msg2Player(szMsg)
		elseif eDifType.HARD == GetMissionV(this.mv_02) then
			CastState(self.tStateList[szName][1], self.tStateList[szName][3][1], 10 * 18);
			CastState(self.tStateList[szName][1], self.tStateList[szName][3][2], 10 * 18);
		--	local szMsg = format("L蕐 %s :%s ",szName,self.tStateList[szName][4][2])
		--	Msg2Player(szMsg)			
		end
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), self.tStateList[szName][2], 1, 0);
	end
end

function tStage05_2_2:ReviveAll()
	local tPlayers = this.msCamp:reflash();
	for i = 1, getn(tPlayers) do
		if not JDYY_InDeathArea(tPlayers[i]) and not JDYY_InDeathArea(tPlayers[i]) then
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tPlayers[i];
			RevivePlayer(0);
			PlayerIndex = nOldPlayerIndex;
		end
	end
end

function tStage05_2_2:RestoreAll()
	local tPlayers = this.msCamp:reflash();
	for i = 1, getn(tPlayers) do
		if not JDYY_InDeathArea(tPlayers[i]) and not JDYY_InDeathArea(tPlayers[i]) then
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tPlayers[i];
			RestoreAll();
			PlayerIndex = nOldPlayerIndex;
		end
	end
end

function tStage05_2_2:GetEventTable()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return nil; end
	return self.tEventTable[nMapId];
end

function tStage05_2_2:MkOnceProcedure(bNotInit)
	local self = tStage05_2_2;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	local tEventTable = self.tEventTable[nMapId];
	
	if not bNotInit then
		SetMissionV(this.mv_33, 1);
	end
	
	tEventTable:insertevent(5, self.SiWangXuanGao, self, nSmmfIdx);	--死亡宣告
	tEventTable:insertevent(24, self.JinWuPuZhao, self);			--金乌普照
	tEventTable:insertevent(48, self.XinMo, self);					--心魔
	tEventTable:insertevent(62, self.MkOnceProcedure, self);		--重置
end

--清除已过期事件
function tStage05_2_2:ClearExpiredEvent()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return end
	
	local nNowTime = GetMissionV(this.mv_);
	local tData = self.tEventTable[nMapId].data;
	
	if getn(tData) <= 0 then return end
	
	for i = 1, getn(tData) do
		tData[i][1] = tData[i][1] - nNowTime + 2;
	end
	
	while 1 do
		local nRemoved = nil;
		if tData[1][1] < 0 then
			tremove(tData, 1);
			nRemoved = 1;
		end
		if not nRemoved then
			break;
		end
	end
end

function tStage05_2_2:StagePassed()
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,3,5,1)  --统计普通通关
		AddRuntimeStat(44,10,5,GetMSPlayerCount(this.missionID, 0))
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,5,5,1)  --统计英雄通关
		AddRuntimeStat(44,11,5,GetMSPlayerCount(this.missionID, 0))
	end
	this.msCamp:turnPlayer(0, function() JDYY_CountPassRoute() ;end)

	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_over_5, 1);
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_participate_5, GetMSPlayerCount(this.missionID, 0));
		
		this.msCamp:turnPlayer(0, function()
			SetTask(%TASKID_JDYY_NORMAL_KO_TIME, GetTask(%TASKID_JDYY_NORMAL_KO_TIME) + 1);
			--OnAchEvent(2, %TASKID_JDYY_NORMAL_KO_TIME);
		end);
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_over_5, 1);
		
		this.msCamp:turnPlayer(0, function()
			SetTask(%TASKID_JDYY_HARD_KO_TIME, GetTask(%TASKID_JDYY_HARD_KO_TIME) + 1);
			--OnAchEvent(2, %TASKID_JDYY_HARD_KO_TIME);
		end);
	end
	
	if eDifType.HARD == GetMissionV(this.mv_02) and GetMissionV(this.mv_37) == 0 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_7, 1);end)-- OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_7); end);
	end
	
	self:StageEnd();
	JDYY_GivePrize(GetMissionS(this.MS_STAGE));
	self:onFinish();
end

function tStage05_2_2:OnNpcDeath(event, data)
	local szName = GetNpcName(data[1]);
	if tNpcs.hy[2] == szName then
		-- logserver begin
		-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
		-- logserver end
		self:StagePassed();
	end
end

function tStage05_2_2:OnTrap(event, data)
	if not tTrapResetPos then return end
	
	JDYY_SetPlayerPos(tTrapResetPos[self.szStageId]);
end

function tStage05_2_2.OnPlayerDeath()
	local self = tStage05_2_2;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	SetMissionV(this.mv_37, GetMissionV(this.mv_37) + 1);
	
	if JDYY_PlayerDeadFailed() then
--		this:Msg2MSAll("Vt 秈 th蕋 b筰!");
		self:StageEnd();
		
		JDYY_GoToStage(self.father, self.father.father, 1);
		
		local szCurStageId = GetMissionS(this.MS_STAGE);
		this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
	end
	
end

function tStage05_2_2:StageEnd()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	JDYY_ClearMapNpc();
	JDYY_ReviveAll();
	JDYY_RestoreAll();
	JDYY_ClearAllState();
end

function tStage05_2_2:onTimeout()
--	this:Msg2MSAll("Vt 秈 th蕋 b筰!");
	self:StageEnd();
	
	JDYY_GoToStage(self.father, self.father.father, 1);
	
	local szCurStageId = GetMissionS(this.MS_STAGE);
	this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);	
end

tStage05_2_2.actions = {
	[1] = tStage05_2_2.Init,
};

tStage05_2_2.cycActions = {
	[1] = {
		[0] = {tStage05_2_2.Breathe, },
	},
};

tStage05_2_2.triggers = {
	Talk = {
		{action = tStage05_2_2.NpcMain},
	},
	NpcDeath = {
		{action = tStage05_2_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage05_2_2.OnPlayerDeath},
	},
	Trap = {
		{action = tStage05_2_2.OnTrap},
	},
};

-----------------------------------------------------------------
--	tStage05_2_3
-----------------------------------------------------------------
function tStage05_2_3:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage05_2_3:Breathe()
	local self = tStage05_2_3;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage05_2_3:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	local nLfIdx = JDYY_CreateNpc(tNpcs.lf, tNpcPos.lf[self.szStageId][1]);
	local nHyIdx  = JDYY_CreateNpc(tNpcs.hy, tNpcPos.hy[self.szStageId][1]);
	JDYY_SetNpcType2Talk(nLfIdx);
	JDYY_SetNpcType2Talk(nHyIdx);
	SetNpcDir(nHyIdx, 35);
end

function tStage05_2_3:Init()
	local self = tStage05_2_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	
	self:CreateNpcs();
	self:FreeDataTable();
	self:MkEventTable();
end

function tStage05_2_3:StagePassed()
--	RemoveNpc();
end

function tStage05_2_3:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
		local nHyIdx = JDYY_FindNpc(tNpcs.hy[2]);
		local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				{nHyIdx, "败了。。。我居然败了。。。"},
				{nLfIdx, "师傅待我恩重如山，洛飞如何能忘？大辽气数已尽，天阴教也一盘散沙，师傅又何必劳神费思，为那皇帝老儿卖命？"},
				{nSlIdx, "Gi竜 ch? l阨 c馻 L筩 Phi tuy kh?nghe, nh璶g u l?s?th藅. Ch髇g ta kh玭g ai gi髉 , kh?m?n猲 chuy謓."},
				{nHyIdx, "唉，我又何尝不知啊，就算我集齐了山河社稷图，大辽也不可能再回到过去了。。。。。罢了罢了！老夫这就披发入山，再不过问尘世！"},
				{nSlIdx, "B莕 t╪g nguy謓 theo gi竜 ch?c飊g nghi猲 c鴘 Ph藅 ph竝."},
				{nHyIdx, "哈哈哈哈哈，抛却虚名俗物，成我大道真如！"},
				{-1, ""},
			},
		};
	end
end

function tStage05_2_3:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage05_2_3.NpcTalk()
	if GetMissionV(this.mv_22) ~= 0 then return end
	
	local self = tStage05_2_3;
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		SetMissionV(this.mv_22, 1);
		
		local nSmmfIdx = JDYY_FindNpc(tNpcs.smmf[2]);
		JDYY_SetNpcType2Talk(nSmmfIdx);
		self:StagePassed();
		return 0;
	end
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

function tStage05_2_3:NpcMain()
	local self = tStage05_2_3;
	
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	if szNpcName == tNpcs.lf[2] then
		if not JDYY_IsCaptain() then
			Talk(1, "", "<color=green>花圣洛飞:<color> 剑荡烟云副本结束!");
			return 0;
		else
			local strTab = {
				"离开副本/JDYY_CloseMission",
				"取消/nothing",
			};
			Say("<color=green>花圣洛飞:<color>剑荡烟云副本结束!", getn(strTab), strTab);
		end
	end
end

function tStage05_2_3.OnPlayerDeath()
	local self = tStage05_2_3;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage05_2_3:onTimeout()
	this:Msg2MSAll("关卡时间结束通关失败.");
	JDYY_CloseMission();
end

tStage05_2_3.actions = {
	[1] = tStage05_2_3.Init,
};

tStage05_2_3.cycActions = {
	[1] = {
		[0] = {tStage05_2_3.Breathe, },
	},
	[2] = {
		[0] = {tStage05_2_3.NpcTalk, },
	},
};

tStage05_2_3.triggers = {
	Talk = {
		{action = tStage05_2_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage05_2_3.OnPlayerDeath},
	},
};

tStage05_2.phases = {tStage05_2_1, tStage05_2_2, tStage05_2_3};
tStage05.phases = {tStage05_1, tStage05_2};