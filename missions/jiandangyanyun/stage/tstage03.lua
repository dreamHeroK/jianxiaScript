--Ç§ÊÖ
-----------------------------------------------------------------
tStage03 = {
	name = "Ç§ÊÖ",
	szStageId = "03",
	maxsecond = 15 * 60,
	actionsType = "second",
};
tStage03 = inherit(cycPhase, tStage03);

tStage03_1 = {
	name = "Ç§ÊÖThñ - ChuÈn ",
	szStageId = "03_1",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "×¼±¸Ê±¼ä",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage03_1 = inherit(cycPhase, tStage03_1);

tStage03_2 = {
	name = "Ç§ÊÖ",
	szStageId = "03_2",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage03_2 = inherit(cycPhase, tStage03_2);

tStage03_3 = {
	name = "Giai ®o¹n kÕt thóc",
	szStageId = "03_3",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage03_3 = inherit(cycPhase, tStage03_3);

--Ç°¶Ô°×
tStage03_2_1 = {
	name = "Ç§ÊÖThñ 1",
	szStageId = "03_2_1",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage03_2_1 = inherit(cycPhase, tStage03_2_1);

--ºó¶Ô°×
tStage03_2_3 = {
	name = "Ç§ÊÖThñ 3",
	szStageId = "03_2_3",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "½±ÀøÊ±¼ä",
		time = 15,
		cyc = 0,
		id = 2,
	},
};
tStage03_2_3 = inherit(cycPhase, tStage03_2_3);

tStage03_2_2 = {
	name = "Ç§ÊÖThñ 2",
	szStageId = "03_2_2",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Ç§ÊÖ",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage03_2_2 = inherit(cycPhase, tStage03_2_2);
-----------------------------------------------------------------
--	tStage03
-----------------------------------------------------------------
function tStage03.Init()
	local self = tStage03;
end

tStage03.actions = {
	[2] = tStage03.Init,
};

tStage03.triggers = {
};

-----------------------------------------------------------------
--	tStage03_1
-----------------------------------------------------------------
function tStage03_1:MkEventTable()
	local self = tStage03_1;
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage03_1.Breathe()
	local self = tStage03_1;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage03_1:CreateNpcs()
	local nLwqIdx = JDYY_CreateNpc(tNpcs.lwq, tNpcPos.lwq[self.szStageId][1]);
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	
	JDYY_SetNpcType2Talk(nLwqIdx);
end

function tStage03_1:BringDeathPlayerToFight()
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if JDYY_InDeathArea() then
			JDYY_SetPlayerPos(tPlayerPos["03"][1]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage03_1.Init()
	local self = tStage03_1;
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:mission_name(), %self.father.szStageId, this:mission_stage()) end)
	-- logserver end
	SetMissionS(this.MS_STAGE, self.father.szStageId);
	
--	JDYY_RestoreAll();
	self:CreateNpcs();
	self:BringDeathPlayerToFight();
end

function tStage03_1:OpenStage()
	local nTaskID 	= 0
	local nDifType = GetMissionV(this.mv_02)
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_JDYY_DAILY_TIME_NORMAL;
		AddRuntimeStat(44,2,3,1) --Í³¼Æjdyy_Normal_OpenStage
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_JDYY_DAILY_TIME_HARD;
		AddRuntimeStat(44,4,3,1)
	else
		return 0
	end

	local self = tStage03_1;
	self:onFinish();
end

function tStage03_1:OnPlayerDeath()
	local self = tStage03_1;
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage03_1:onTimeout()
	this:Msg2MSAll("¹Ø¿¨Ê±¼ä½áÊøÍ¨¹ØÊ§°Ü.");
	JDYY_CloseMission();
end

function tStage03_1:NpcMain()
	if not JDYY_IsCaptain() then
		Talk(1, "", "<color=green>ÁèÍñÇï:<color>ÈÃÄã¶Ó³¤À´ÕÒÎÒ!");
		return 0;
	else
		local strTab = {
			"¿ªÆôµÚÈý¹Ø:Ç§ÊÖ/#tStage03_1.OpenStage()",
			"Àë¿ª¹Ø¿¨/#JDYY_ConfirmClose('ÁèÍñÇï')",
			"È¡Ïû/nothing",
		};
		Say("<color=green>ÁèÍñÇï:<color>×Ô´Ó·¢ÏÖËÕÒÀÒÀµÄ¶¾Ò©Òì³£Ð×ÏÕ£¬ÎÒ±ãÇ±ÐÄÑÐ¾¿½âÒ©£¬Ï£ÍûÄÜ°ïÖúÄãÃÇÕ½Ê¤ËÕÒÀÒÀ¡£´óÏÀ¿É×öºÃ×¼±¸£¿", getn(strTab), strTab);
	end
end

tStage03_1.actions = {
	[2] = tStage03_1.Init,
};

tStage03_1.triggers = {
	Talk = {
		{action = tStage03_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage03_1.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
--	tStage03_2_1
-----------------------------------------------------------------

--	not need

-----------------------------------------------------------------
--	tStage03_2_2
-----------------------------------------------------------------
function tStage03_2_2:MkEventTable()
	local self = tStage03_2_2;
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage03_2_2.Breathe()
	local self = tStage03_2_2;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		local nStageId = GetMissionV(this.mv_20);
		self:MkOnceProcedure(nStageId, 1);
		self:ClearExpiredEvent();
	end
	SetMissionV(this.mv_30, GetMissionV(this.mv_30) + 1);
	self.tEventTable[nMapId]:breathe();
end

function tStage03_2_2:CreateNpcs()
	local nShxIdx = 0;
	local nFjIdx  = 0;
	local nSyyIdx = 0;
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nShxIdx = JDYY_CreateNpc(tNpcs_NORMAL.shx, tNpcPos.shx[self.szStageId][1]);
		nFjIdx  = JDYY_CreateNpc(tNpcs_NORMAL.fj, tNpcPos.fj[self.szStageId][1]);
		nSyyIdx = JDYY_CreateNpc(tNpcs_NORMAL.syy, tNpcPos.syy[self.szStageId][1]);
	else
		nShxIdx = JDYY_CreateNpc(tNpcs.shx, tNpcPos.shx[self.szStageId][1]);
		nFjIdx  = JDYY_CreateNpc(tNpcs.fj, tNpcPos.fj[self.szStageId][1]);
		nSyyIdx = JDYY_CreateNpc(tNpcs.syy, tNpcPos.syy[self.szStageId][1]);
	end
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	CastState2Npc(nShxIdx, "state_fetter", 1, 5*60*18);
	
	SetNpcActivator(nShxIdx);
	SetNpcActivator(nFjIdx);
	SetNpcActivator(nSyyIdx);
	
	JDYY_SetNpcType2Talk(nFjIdx);
	JDYY_SetNpcType2Talk(nSyyIdx);
	SetNpcDir(nSyyIdx, 45);
	
	local nMapId = this.msPosition:getMapID();
	-- for i = 1, getn(self.tPoints_FLH) do
	-- 	local nNpcIdx = CreateNpc("ç³Á÷çú", "ç³Á÷çú", nMapId, self.tPoints_FLH[i][1], self.tPoints_FLH[i][2]);
	-- 	CastState2Npc(nNpcIdx, "state_dispear", 100, 60*60*18);
	-- 	CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18);
	-- 	SetMissionV(this.mv_28 + i, nNpcIdx);
	-- end
end

function tStage03_2_2:CreateTraps()
	local self = tStage03_2_2;
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

function tStage03_2_2.Init()
	local self = tStage03_2_2;
	
	SetMissionV(this.mv_20, 1);	--µ±Ç°µÚ¼¸½×¶Î1,2,3
	SetMissionV(this.mv_21, 0);	--ËÕ»Ûæµ ·½ìº ËÀÍö¼ÆÊý,½×¶Î3ÓÃ
	SetMissionV(this.mv_26, 0);	--·½ìºÑªÁ¿ÊÇ·ñÔÚ5%ÒÔÏÂ
	SetMissionV(this.mv_27, 0);	--ËÕÒÁÒÁÑªÁ¿ÊÇ·ñÔÚ15%ÒÔÏÂ
	SetMissionV(this.mv_28, 0);	--ÊÇ·ñ¹ý¹Ø
	SetMissionV(this.mv_29, 0);	--ÒþÐÎÈËNpc1
	SetMissionV(this.mv_30, 0);	--ÒþÐÎÈËNpc2
	SetMissionV(this.mv_31, 0);	--ÒþÐÎÈËNpc3
	SetMissionV(this.mv_32, 0);	--ÒþÐÎÈËNpc4
	SetMissionV(this.mv_33, 0);	--ÒþÐÎÈËNpc5
	SetMissionV(this.mv_34, 0);	--ÒþÐÎÈËNpc6
	SetMissionV(this.mv_35, 0);	--ÒþÐÎÈËNpc7
	SetMissionV(this.mv_36, 0);	--ÒþÐÎÈËNpc8
	SetMissionV(this.mv_37, 0); --±¾¾ÖÖÐÍæ¼ÒËÀÍö´ÎÊý(ËùÓÐÈË)
	SetMissionV(this.mv_38, 0);	--ËÕÒÁÒÁ¼ßÃð½×¶ÎÃ¿15ÃëBUFFER¼ÓÇ¿Öµ
	SetMissionV(this.mv_39, 0);	--ËÕÒÁÒÁ¼ßÃð½×¶ÎÃ¿5Ãë¼ÓÇ¿BUFFERµ¹¼ÆÊ±
	
	self:FreeDataTable();
	self:MkDataTable();
	self:MkEventTable();
	self:CreateNpcs();
	
	local nLwqIdx = JDYY_FindNpc(tNpcs.lwq[2]);
	JDYY_SetNpcType2Fight(nLwqIdx);
	CastState2Npc(nLwqIdx, "state_dispear", 100, 60*60*18);
	self:MkOnceProcedure(1);
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_open_3, 1);
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_open_3, 1);
	end
	
	--´´½¨TRAP
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	self:CreateTraps();
	
	this.msCamp:turnPlayer(0, function() JDYY_SetPlayerPos(tPlayerPos["03"][1]); end);
end

--¶ÀÁ¢³ö¸÷ÖÖÐÅÏ¢µÄ´æ´¢£¬Ê¹¹Ø¿¨Ö§³Öreload
function tStage03_2_2:MkDataTable()
	if not self.tTTMvs then
		self.tTTMvs = {this.mv_21, this.mv_22, this.mv_23, this.mv_24};
	end
	
	if not self.tPosInfo then
		self.tPosInfo = {
			{{{1620,3518}, this.mv_21, szCamp_1},{{1643,3513}, this.mv_22, szCamp_2},{{1640,3544}, this.mv_23, szCamp_1},{{1613,3545}, this.mv_24, szCamp_2}},
			{{{1609,3526}, this.mv_21, szCamp_1},{{1627,3553}, this.mv_22, szCamp_2},{{1648,3529}, this.mv_23, szCamp_1},{{1630,3504}, this.mv_24, szCamp_2}},
		};
	end
	
	if not self.tPoints_DY then		--¶¾ÔÆÈ¡µã
		self.tPoints_DY = {
			{1612, 3523}, {1625, 3508}, {1634, 3494}, {1647, 3484}, {1663, 3479}, {1672, 3497}, {1663, 3517},
			{1648, 3549}, {1628, 3562}, {1591, 3565}, {1620, 3538}, {1631, 3543}, {1646, 3525}, {1631, 3521},
		};
	end
	
	if not self.tPoints_FLH then	--ÒþÐÎÈËç³Á÷çú
		self.tPoints_FLH = {
			{1638, 3481}, {1666, 3469}, {1667, 3518}, {1636, 3558},
			{1607, 3574}, {1591, 3553}, {1603, 3530}, {1618, 3504},
		};
	end
	
	if not self.tPoints_HY then
		self.tPoints_HY = {
			{1663, 3479}, {1648, 3492}, {1657, 3515}, {1627, 3516}, {1644, 3539}, {1629, 3563}, {1609, 3540}, {1596, 3566}, {1611, 3560},
		};
	end
end

function tStage03_2_2:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
end

function tStage03_2_2:NpcMain()
	local self = tStage03_2_2;
	
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	if "ÂäÏ¼ÏÉ×ÓÁèÍñÇï" == szName then
		SetMissionV(GetUnitCurStates(nNpcIdx, 0), 0);
		RemoveNpc(nNpcIdx);
	end
end

--ÑÌÓêÃÔÀë
function tStage03_2_2.YanYuMiLi(nNpcIdx, nStageId)
	if nStageId ~= GetMissionV(this.mv_20) then return 0; end
	local self = tStage03_2_2;
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 3);
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		DoSkill2Target(nNpcIdx, 1793, nSkillLevel, PIdx2NpcIdx(PlayerIndex));
	end
	PlayerIndex = nOldPlayerIndex;
end

--¶¾Ñæ
function tStage03_2_2.DuYan(nNpcIdx, nStageId)
	if nStageId ~= GetMissionV(this.mv_20) then return end
	
	nNpcIdx = JDYY_FindNpc(tNpcs.shx[2]);
	if nNpcIdx == 0 then return 0; end
	
	local self = tStage03_2_2;
	local nOldPlayerIndex = PlayerIndex;
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	DoSkill2Pos(nNpcIdx, 1792, nSkillLevel, x, y);
	this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(this.msCamp.players) do
		PlayerIndex = this.msCamp.players[i];
		if not JDYY_InDeathArea() and not JDYY_IsPlayerDeath() then
			local a, b = random(1, 3), random(1, 3);
			SetPos(x + a, y + b);
--			CastState("state_fetter", 1, 2*18);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage03_2_2.ShiZiQiang(nNpcIdx, nStageId)
	if nStageId ~= GetMissionV(this.mv_20) then return end
	
	local self = tStage03_2_2;
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 3);
	local nOldPlayerIndex = PlayerIndex;
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		local _, x, y = GetWorldPos();
		DoSkill2Pos(nNpcIdx, 1789, nSkillLevel, x + 1, y + 1);		
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage03_2_2.BingHuan(nNpcIdx, nStageId)
	if nStageId ~= GetMissionV(this.mv_20) then return end
	
	local self = tStage03_2_2;
	this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	for i = 1, getn(this.msCamp.players) do
		PlayerIndex = this.msCamp.players[i];
		if not JDYY_IsPlayerDeath() and not JDYY_InDeathArea() then
			DoSkill2Target(nNpcIdx, 1790, nSkillLevel, PIdx2NpcIdx(PlayerIndex));
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage03_2_2.SiGuang(nNpcIdx, nStageId)
	if nStageId ~= GetMissionV(this.mv_20) then return end
	
	local self = tStage03_2_2;
	if not self.tPoints_HY then
		self:MkDataTable();
	end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local tRand = floyd_m4n(getn(self.tPoints_HY), 5);
	local nMapId = this.msPosition:getMapID();
	for k, v in tRand do
		local nNpcIdx = CreateNpc("ºÚÒÏ", "ºÚÒÏ", nMapId, self.tPoints_HY[k][1], self.tPoints_HY[k][2]);
		CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18);
		SetNpcLifeTime(nNpcIdx, 8);
		local x, y = self.tPoints_HY[k][1] + random(1, 3), self.tPoints_HY[k][2] + random(1, 3);
		DoSkill2Pos(nNpcIdx, 2110, nSkillLevel, x, y);
	end
end

--°Ù»ú²ÙÑÝ
function tStage03_2_2:CallHeiYi(tPos)
	local nNum, tNpcIdx = CreateNpc("ºÚÒÏ", "ºÚÒÏ", tPos[1], tPos[2], tPos[3], -1, 10*18, 1, 150);
	for i = 1, nNum do
		SetCampToNpc(tNpcIdx[i], CampEnemy);
		SetNpcDeathScript(tNpcIdx[i], thisFile);
	end
	
	-- local nNpcIdx = CreateNpc("ç³Á÷çú", "ç³Á÷çú", tPos[1], tPos[2], tPos[3]);
	-- SetCampToNpc(nNpcIdx, CampEnemy);
	-- SetNpcDeathScript(nNpcIdx, thisFile);
end

function tStage03_2_2:Stage2Begin(tPos)
	local nFjIdx = JDYY_FindNpc(tNpcs.fj[2]);
	if 0 == nFjIdx then return 0; end
	JDYY_SetNpcType2Fight(nFjIdx);
	SetMissionV(this.mv_20, 2);
	self:MkOnceProcedure(2);
	
	--g_NpcAI:setAI(nFjIdx, AT_SM_ATTACK);
	--g_NpcAI:setWayPoint(nFjIdx, {{tPos[2], tPos[3]}, });
end

function tStage03_2_2:Stage3Begin()
	local nShxIdx = 0;
	local nFjIdx  = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nShxIdx = JDYY_CreateNpc(tNpcs_NORMAL.shx, tNpcPos.shx[self.szStageId][1]);
		nFjIdx  = JDYY_CreateNpc(tNpcs_NORMAL.fj, tNpcPos.fj[self.szStageId][1]);
	else
		nShxIdx = JDYY_CreateNpc(tNpcs.shx, tNpcPos.shx[self.szStageId][1]);
		nFjIdx  = JDYY_CreateNpc(tNpcs.fj, tNpcPos.fj[self.szStageId][1]);
	end
	
	SetMissionV(this.mv_20, 3);
	self:MkOnceProcedure(3);
end

--ËÕÒÁÒÁ¼ßÃð½×¶ÎÊÍ·Å¶¾ïÚ
function tStage03_2_2.JianMie()
	if GetMissionV(this.mv_20) ~= 3 then return end
	
	local self = tStage03_2_2;
	
	local nSyyIdx = JDYY_FindNpc(tNpcs.syy[2]);
	if 0 == nSyyIdx then return end
--	local nLwqIdx = JDYY_FindNpc(tNpcs.lwq[2]);
--	if 0 == nLwqIdx then return end
	
	JDYY_SetNpcType2Fight(nSyyIdx);
--	local nAdd = 4;
--	if eDifType.NORMAL == GetMissionV(this.mv_02) then
--		nAdd = 2;
--	end
--	CastState2Npc(nSyyIdx, "state_p_attack_percent_add", nAdd, 30*18);
--	CastState2Npc(nSyyIdx, "state_m_attack_percent_add", nAdd, 30*18);
	SetCurrentNpcSFX(nSyyIdx, 978, 1, 1);
	
	this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
--	local nMv = this.mv_29;
--	local nSkillLevel = 20;
--	if eDifType.NORMAL == GetMissionV(this.mv_02) then
--		nSkillLevel = 10;
--	end
	
--	DoSkill2Target(nSyyIdx, 2113, nSkillLevel, nSyyIdx);
	
	local nValue = 3.3;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nValue = 2;
	end
	
	for i = 1, getn(this.msCamp.players) do
		PlayerIndex = this.msCamp.players[i];
		if not JDYY_IsPlayerDeath() and not JDYY_InDeathArea() then
--			local nNpcIdx = GetMissionV(nMv);
--			DoSkill2Target(nNpcIdx, 2114, nSkillLevel, PIdx2NpcIdx(PlayerIndex));
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 979, 1, 1);
			CastState("state_lost_p_life_per18", nValue, 5*60*18, 0, 10005);
--			nMv = nMv + 1;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	
	SetMissionV(this.mv_38, 1);
	SetMissionV(this.mv_39, 5);
end

function tStage03_2_2:ReflashJianMieBuffer()
	if GetMissionV(this.mv_20) ~= 3 then return end
	
	local self = tStage03_2_2;
	
	SetMissionV(this.mv_39, GetMissionV(this.mv_39) - 1);
	
	if GetMissionV(this.mv_39) == 0 then
		local nValue = 3.3;
		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			nValue = 2;
		end
		this.msCamp:reflash();
		local nOldPlayerIndex = PlayerIndex;
		for i = 1, getn(this.msCamp.players) do
			PlayerIndex = this.msCamp.players[i];
			if not JDYY_IsPlayerDeath() and not JDYY_InDeathArea() then
				RemoveState(10005);
				CastState("state_lost_p_life_per18", nValue + GetMissionV(this.mv_38), 5*60*18, 0, 10005);
			end
		end
		PlayerIndex = nOldPlayerIndex;
		
		SetMissionV(this.mv_38, GetMissionV(this.mv_38) + 1);
		SetMissionV(this.mv_39, 15);
	end
end

function tStage03_2_2:StagePassed()
	JDYY_ClearMapNpcExcept({tNpcs.lwq[2]});
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,3,3,1)  --Í³¼ÆÆÕÍ¨Í¨¹Ø
		AddRuntimeStat(44,10,3,GetMSPlayerCount(this.missionID, 0))
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,5,3,1)  --Í³¼ÆÓ¢ÐÛÍ¨¹Ø
		AddRuntimeStat(44,11,3,GetMSPlayerCount(this.missionID, 0))
	end
	if eDifType.HARD == GetMissionV(this.mv_02) and GetMissionV(this.mv_37) == 0 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_5, 1); end)--OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_5); end);
	end
	
	self:StageEnd();
	JDYY_GivePrize(GetMissionS(this.MS_STAGE));
	self:onFinish();
end

function tStage03_2_2:OnTrap(event, data)
	if not tTrapResetPos then return end
	
	JDYY_SetPlayerPos(tTrapResetPos[self.szStageId]);
end

function tStage03_2_2:OnNpcDeath(event, data)
	local szName = GetNpcName(data[1]);
	
	RemoveNpc(data[1]);
	if szName == tNpcs.shx[2] then
		if 1 == GetMissionV(this.mv_20) then
			local nMapId, x, y = GetNpcWorldPos(data[1]);
	--		self:CallHeiYi({nMapId, x, y});
			-- logserver begin
			-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
			-- logserver end
			self:Stage2Begin({nMapId, x, y});	--½øÈëµÚ¶þ½×¶Î[·½ìº]
		elseif 3 == GetMissionV(this.mv_20) then
			SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
			if 2 == GetMissionV(this.mv_21) then
				self:JianMie();
			end
		end
	elseif szName == tNpcs.fj[2] then
		if 2 == GetMissionV(this.mv_20) then
			-- logserver begin
			-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
			-- logserver end
			self:Stage3Begin();					--½øÈëµÚÈý½×¶Î[ËÕÒÁÒÁ]
		elseif 3 == GetMissionV(this.mv_20) then
			SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
			if 2 == GetMissionV(this.mv_21) then
				self:JianMie();
			end
		end
	elseif szName == tNpcs.syy[2] then
		SetMissionV(this.mv_28, 1);		--¹ý¹Ø
		-- logserver begin
		-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
		-- logserver end
		self:StagePassed();
	elseif szName == "ÂäÏ¼ÏÉ×ÓÁèÍñÇï" then	--Í¼ÌÚ±»´òËÀÔòÇå³ý¶ÔÓ¦mv¼ÇÂ¼µÄnNpcIdx
		local nMV = GetUnitCurStates(data[1], 0);
		if nMV >= this.mv_21 and nMV <= this.mv_24 then
			SetMissionV(nMV, 0);
		end
	end
end

function tStage03_2_2.OnPlayerDeath()
	local self = tStage03_2_2;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	SetMissionV(this.mv_37, GetMissionV(this.mv_37) + 1);
	
	if JDYY_PlayerDeadFailed() then
	--	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
		self:StageEnd();
		
		JDYY_GoToStage(self.father, self.father.father, 1);
		
		local szCurStageId = GetMissionS(this.MS_STAGE);
		this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
	end
	
end

--BOSS = ËÕ»Ûæµ
function tStage03_2_2.Stage1Procedure()
	local self = tStage03_2_2;
	if 1 ~= GetMissionV(this.mv_20) then return 0; end
	local nShxIdx = JDYY_FindNpc(tNpcs.shx[2]);
	if 0 == nShxIdx then return 0; end
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
	end
	local tEventTable = self.tEventTable[nMapId];
	
	tEventTable:insertevent(3, self.DuYan, nShxIdx, 1);		--¶¾Ñæ
	tEventTable:insertevent(6, self.YanYuMiLi, nShxIdx, 1);	--ÑÌÓêÃÔÀë
	tEventTable:insertevent(10, self.MkOnceProcedure, self, 1);	--ÖØÉèÖÜÆÚ
end

--BOSS = ·½ìº
function tStage03_2_2.Stage2Procedure()
	local self = tStage03_2_2;
	if 2 ~= GetMissionV(this.mv_20) then return 0; end
	local nFjIdx = JDYY_FindNpc(tNpcs.fj[2]);
	if 0 == nFjIdx then return 0; end
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
	end
	local tEventTable = self.tEventTable[nMapId];
	
	tEventTable:insertevent(5, self.ShiZiQiang, nFjIdx, 2);			--¶¾ïÚ
	tEventTable:insertevent(7, self.SiGuang, nFjIdx, 2);			--¶¾ÔÆ
	tEventTable:insertevent(7, self.BingHuan, nFjIdx, 2);		--ÑÌÓêÃÔÀë
	tEventTable:insertevent(10, self.MkOnceProcedure, self, 2);	--ÖØÉèÖÜÆÚ
end

--BOSS = ËÕÒÁÒÁ
function tStage03_2_2.Stage3Procedure()
	local self = tStage03_2_2;
	if 3 ~= GetMissionV(this.mv_20) then return 0; end
	
	local nSyyIdx = JDYY_FindNpc(tNpcs.syy[2]);
	local nShxIdx = JDYY_FindNpc(tNpcs.shx[2]);
	local nFjIdx = JDYY_FindNpc(tNpcs.fj[2]);
	if 0 == nSyyIdx then return 0; end
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
	end
	local tEventTable = self.tEventTable[nMapId];
	
	if nShxIdx ~= 0 then
		tEventTable:insertevent(3, self.DuYan, nShxIdx, 3);				--Íò¼ýÆë·¢	¶¾Ñæ
		tEventTable:insertevent(7, self.YanYuMiLi, nShxIdx, 3);			--Ç§ÊÖ²ÙÎä	ÑÌÓêÃÔÀë
	end
	
	if nFjIdx ~= 0 then
		tEventTable:insertevent(3, self.ShiZiQiang, nFjIdx, 3);			--°Ù»¨çÔÂÒ 	Ê®×ÖÇ½
		tEventTable:insertevent(7, self.SiGuang, nFjIdx, 3);			--ÑÌÓêÃÔÀë 	ËÀ¹â
		tEventTable:insertevent(7, self.BingHuan, nFjIdx, 3);			--¶¾Ñæ		±ù»·
	end
	tEventTable:insertevent(10, self.MkOnceProcedure, self, 3);		--ÖØÉèÖÜÆÚ
end

function tStage03_2_2:MkOnceProcedure(nStageId, bNotInit)
	if nStageId ~= GetMissionV(this.mv_20) then return 0; end
	local self = tStage03_2_2;
	
	if not bNotInit then
		SetMissionV(this.mv_30, 1);
	end
	if not self.tProcedureList then
		self.tProcedureList = {
			self.Stage1Procedure, self.Stage2Procedure, self.Stage3Procedure
		};
	end
	local nStageId = GetMissionV(this.mv_20);
	if not self.tProcedureList[nStageId] then
--		print("[error] [Giai ®o¹n = nil]");
		return 0;
	end
	self.tProcedureList[nStageId]();
end

--Çå³ýÒÑ¹ýÆÚÊÂ¼þ
function tStage03_2_2:ClearExpiredEvent()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return end
	
	local nNowTime = GetMissionV(this.mv_30);
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

function tStage03_2_2:StageEnd()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	JDYY_ClearPlayerSFX();
	JDYY_ClearMapNpc();
	JDYY_ReviveAll();
	JDYY_RestoreAll();
	JDYY_ClearAllState();
end

function tStage03_2_2:onTimeout()
--	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	self:StageEnd();
	
	JDYY_GoToStage(self.father, self.father.father, 1);
	
	local szCurStageId = GetMissionS(this.MS_STAGE);
	this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
end

tStage03_2_2.actions = {
	[1] = tStage03_2_2.Init,
};

tStage03_2_2.cycActions = {
	[1] = {
		[0] = {tStage03_2_2.Breathe, tStage03_2_2.ReflashJianMieBuffer},
	},
	[2] = {
		[0] = {tStage03_2_2.NpcTalk, },
	},
};

tStage03_2_2.triggers = {
	Talk = {
		{action = tStage03_2_2.NpcMain},
	},
	PlayerDeath = {
		{action = tStage03_2_2.OnPlayerDeath},
	},
	NpcDeath = {
		{action = tStage03_2_2.OnNpcDeath},
	},
	Trap = {
		{action = tStage03_2_2.OnTrap},
	},
};

-----------------------------------------------------------------
--	tStage03_2_3
-----------------------------------------------------------------
function tStage03_2_3:MkEventTable()
	local self = tStage03_2_3;
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage03_2_3.Breathe()
	local self = tStage03_2_3;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage03_2_3:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	local nLwqIdx = JDYY_CreateNpc(tNpcs.lwq, tNpcPos.lwq["03_1"][1]);
end

function tStage03_2_3:Init()
	local self = tStage03_2_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	
	self:CreateNpcs();
	self:FreeDataTable();
	self:MkEventTable();
	local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
	JDYY_SetNpcType2Talk(nTnyIdx);
end

function tStage03_2_3:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nLwqIdx = JDYY_FindNpc(tNpcs.lwq[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
	--			{nLwqIdx, "Søc m¹nh ®· kh«ng cßn, kh«ng thÓ cïng mäi ng­êi hoµn thµnh trËn chiÕn cuèi. LÇn nµy ®Õn Trôy Long Cèc v« cïng nguy hiÓm, h·y b¶o träng!"},
				{-1, ""},
			},
		};
	end
end

function tStage03_2_3:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage03_2_3:StagePassed()
	JDYY_ClearMapNpc();
	SendScript2Client('Open([[ma]], 0)');	--¹Ø±Õ·­ÅÆ½çÃæ
	self:onFinish();
end

function tStage03_2_3.NpcTalk()
	if 0 ~= GetMissionV(this.mv_22) then return 0; end
	local self = tStage03_2_3;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		SetMissionV(this.mv_22, 1);
		--self:StagePassed();
		self.tEventTable[nMapId]:insertevent(15, tStage03_2_3.StagePassed, self);
		return 0;
	end
	
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

function tStage03_2_3.OnPlayerDeath()
	local self = tStage03_2_3;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage03_2_3:onTimeout()
	this:Msg2MSAll("¹Ø¿¨Ê±¼ä½áÊøÍ¨¹ØÊ§°Ü.");
	JDYY_CloseMission();
end

tStage03_2_3.actions = {
	[1] = tStage03_2_3.Init,
};

tStage03_2_3.cycActions = {
	[1] = {
		[0] = {tStage03_2_3.Breathe, },
	},
	[2] = {
		[0] = {tStage03_2_3.NpcTalk, },
	},
};

tStage03_2_3.triggers = {
	PlayerDeath = {
		{action = tStage03_2_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage03_2.phases = {tStage03_2_2, tStage03_2_3};
tStage03.phases = {tStage03_1, tStage03_2};