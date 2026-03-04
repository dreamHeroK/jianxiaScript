--Éñ³ö¹íÃ»
-----------------------------------------------------------------
tStage02 = {
	name = "Éñ³ö¹íÃ»",
	szStageId = "02",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage02 = inherit(cycPhase, tStage02);

tStage02_1 = {
	name = "Éñ³ö¹íÃ»Quû-ChuÈn ",
	szStageId = "02_1",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "×¼±¸Ê±¼ä",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage02_1 = inherit(cycPhase, tStage02_1);

tStage02_2 = {
	name = "Éñ³ö¹íÃ»",
	szStageId = "02_2",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage02_2 = inherit(cycPhase, tStage02_2);

tStage02_3 = {
	name = "Giai ®o¹n kÕt thóc",
	szStageId = "02_3",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage02_3 = inherit(cycPhase, tStage02_3);

--Ç°¶Ô°×
tStage02_2_1 = {
	name = "Éñ³ö¹íÃ»Quû-§èi tho¹i tr­íc",
	szStageId = "02_2_1",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage02_2_1 = inherit(cycPhase, tStage02_2_1);

--ºó¶Ô°×
tStage02_2_3 = {
	name = "Éñ³ö¹íÃ»Quû-§èi tho¹i tr­íc",
	szStageId = "02_2_3",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "½±ÀøÊ±¼ä",
		time = 15,
		cyc = 0,
		id = 2,
	},
};
tStage02_2_3 = inherit(cycPhase, tStage02_2_3);

tStage02_2_2 = {
	name = "Éñ³ö¹íÃ»Quû-ChiÕn ®Êu",
	szStageId = "02_2_2",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Éñ³ö¹íÃ»",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage02_2_2 = inherit(cycPhase, tStage02_2_2);
-----------------------------------------------------------------
--	tStage02
-----------------------------------------------------------------
function tStage02.Init()
	local self = tStage02;
end

tStage02.actions = {
	[2] = tStage02.Init,
};

tStage02.triggers = {
};

-----------------------------------------------------------------
--	tStage02_1
-----------------------------------------------------------------
function tStage02_1:MkEventTable()
	local self = tStage02_1;
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage02_1.Breathe()
	local self = tStage02_1;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage02_1:CreateNpcs()
	local nTnyIdx = JDYY_CreateNpc(tNpcs.tny, tNpcPos.tny[self.szStageId][1]);
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	JDYY_SetNpcType2Talk(nTnyIdx);
end

function tStage02_1:BringDeathPlayerToFight()
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if JDYY_InDeathArea() then
			JDYY_SetPlayerPos(tPlayerPos["02"][1]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage02_1.Init()
	local self = tStage02_1;
	
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:mission_name(), %self.father.szStageId, this:mission_stage()) end)
	-- logserver end
	
	SetMissionS(this.MS_STAGE, self.father.szStageId);
	
--	JDYY_RestoreAll();
	self:CreateNpcs();
	self:BringDeathPlayerToFight();
end

function tStage02_1.OnPlayerDeath()
	local self = tStage02_1;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage02_1.OpenStage()
	local nTaskID 	= 0
	local nDifType = GetMissionV(this.mv_02)
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_JDYY_DAILY_TIME_NORMAL;
		AddRuntimeStat(44,2,2,1) --Í³¼Æjdyy_Normal_OpenStage
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_JDYY_DAILY_TIME_HARD;
		AddRuntimeStat(44,4,2,1)
	else
		return 0
	end

	local self = tStage02_1;
	self:onFinish();
end

function tStage02_1:NpcMain()
	if not JDYY_IsCaptain() then
		Talk(1, "", "<color=green>ÌÆÅªÔÂ:<color>ÈÃÄã¶Ó³¤¹ýÀ´!");
		return 0;
	else
		local strTab = {
			"¿ªÆôµÚ¶þ¹Ø:Éñ³ö¹íÃ»/#tStage02_1.OpenStage()",
			"Àë¿ª¹Ø¿¨/#JDYY_ConfirmClose('ÌÆÅªÔÂ')",	
			"È¡Ïû/nothing",
		};
		Say("<color=green>ÌÆÅªÔÂ:<color>ÎÒµ¹ÊÇÏëºÍÒ¹Ýº±È»®±È»®,¿´Ë­µ½µ×ÊÇÌìÏÂµÚÒ»´Ì¿Í!", getn(strTab), strTab);
	end
end

function tStage02_1:onTimeout()
	this:Msg2MSAll("¹Ø¿¨Ê±¼ä½áÊøÍ¨¹ØÊ§°Ü.");
	JDYY_CloseMission();
end

tStage02_1.actions = {
	[2] = tStage02_1.Init,
};

tStage02_1.triggers = {
	Talk = {
		{action = tStage02_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage02_1.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
--	tStage02_2_1
-----------------------------------------------------------------

--	not need

-----------------------------------------------------------------
--	tStage02_2_2
-----------------------------------------------------------------
function tStage02_2_2:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage02_2_2.Breathe()
	local self = tStage02_2_2;
	local nMapId = this.msPosition:getMapID();
	SetMissionV(this.mv_21, GetMissionV(this.mv_21) + 1);
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
		self:MkOnceProcedure(1);
		self:ClearExpiredEvent();
	end
	
	self.tEventTable[nMapId]:breathe();
end

function tStage02_2_2:CreateNpcs()
	local nYyIdx = 0;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nYyIdx = JDYY_CreateNpc(tNpcs_NORMAL.yy, tNpcPos.yy[self.szStageId][1]);
	else
		nYyIdx = JDYY_CreateNpc(tNpcs.yy, tNpcPos.yy[self.szStageId][1]);
	end
	
	AddUnitStates(nYyIdx, 1, 0);	--ÉèÖÃAIÎª×·Ëæ×î´ó³ðºÞÍæ¼Ò

	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
end

function tStage02_2_2:CreateTraps()
	local self = tStage02_2_2;
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

function tStage02_2_2.Init()
	local self = tStage02_2_2;
	
	SetMissionV(this.mv_21, 0); --NOW TIME
	
	SetMissionV(this.mv_24, 0); --±»Ò¹Ýº×áµÄÍæ¼Òindex
	SetMissionV(this.mv_25, 0); --ÒþÐÎÈË1index
	SetMissionV(this.mv_26, 0); --ÒþÐÎÈË2index
	SetMissionV(this.mv_27, 0); --ÒþÐÎÈË3index
	SetMissionV(this.mv_28, 0);	--ÒþÐÎÈË4index
	SetMissionV(this.mv_29, 0);	--ÒþÐÎÈË5index
	SetMissionV(this.mv_30, 0);	--ÒþÐÎÈË6index
	SetMissionV(this.mv_31, 0);	--ÒþÐÎÈË7index
	SetMissionV(this.mv_32, 0);	--ÒþÐÎÈË8index
	SetMissionV(this.mv_33, 0);	--À×ºð×Óµ¯»÷ÖÐ±»×áÍæ¼Ò´ÎÊý
	SetMissionV(this.mv_34, 0); --±¾¾ÖÖÐËùÓÐÍæ¼ÒËÀÍö´ÎÊý
	
	SetMissionS(this.ms_02, "");	--±»Ò¹Ýº×áµÄÍæ¼Ò½ÇÉ«Ãû
	
	this.msCamp:turnPlayer(0, function()	--Íæ¼ÒËùÁ¬½ÓºÚ¹×µÄidx
		SetTask(TASKID_JDYY_HEIGUAN_IDX, 0);
	end);
	
	self:FreeDataTable();
	self:MkDataTable();
	self:CreateNpcs();
	self:MkEventTable();
	self:MkOnceProcedure();
	
	--´´½¨TRAP
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	self:CreateTraps();
	
	local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
	JDYY_SetNpcType2Fight(nTnyIdx);
	CastState2Npc(nTnyIdx, "state_dispear", 100, 60*60*18);
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_open_2, 1);
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_open_2, 1);
	end
	
	this.msCamp:turnPlayer(0, function() JDYY_SetPlayerPos(tPlayerPos["02"][1]); end);
end

--´æ´¢¸÷ÖÖÐÅÏ¢£¬Ê¹¹Ø¿¨Ö§³Öreload
function tStage02_2_2:MkDataTable()
	if not self.tPoints_HG then
		self.tPoints_HG = {
			{1552,3412}, {1539,3428}, {1544,3443}, {1557,3449}, {1579,3448}, {1588,3420}, {1565,3443}, {1546,3397},
		};
	end
	
	if not self.tPoints_CH then
		self.tPoints_CH = {
			{1551, 3444}, {1569, 3445}, {1580, 3428}, {1561, 3421}, {1548, 3415},
		};
	end
	
	if not self.tPoints_HY then
		self.tPoints_HY = {
			{1551, 3444}, {1569, 3445}, {1580, 3428}, {1561, 3421}, {1548, 3415}, {1565,3443}, {1546,3397}, {1544,3443}, {1557,3449}
		};
	end
	
	if not self.tPlayerIndex then
		self.tPlayerIndex = {};
	end
	
	local nMapId = this.msPosition:getMapID();
	if not self.tPlayerIndex then self.tPlayerIndex = {}; end
	self.tPlayerIndex[nMapId] = {};
	
	if not self.tTalks then
		self.tTalks = {
			[0] = {},
		};
	end
	
end

function tStage02_2_2:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tPlayerIndex and self.tPlayerIndex[nMapId] then
		self.tPlayerIndex[nMapId] = nil;
	end
end

function tStage02_2_2.KongChan_Back(nYyIdx)
	local self = tStage02_2_2;
	
	local szNpcName = GetNpcName(nYyIdx);
	if szNpcName ~= "Ë²ÉñÒ¹Ýº" then return end
	
	RemoveStateFromNpc(nYyIdx, 10002);
	
	local nPlayerIndex = JDYY_FindRandomPlayer({1562, 3430});
	if 0 == nPlayerIndex then SetNpcPos(nYyIdx, 1562, 3430); return end
	
	_, x, y = JDYY_GetPlayerPos(nPlayerIndex);
	SetNpcPos(nYyIdx, x + 2, y + 2);
	
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	CastState("state_fetter", 1, 3*18);
	local nValue = 50;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nValue = 35;
	end
	CastState("imme_life_percent_damage", nValue, 0);
	ChangeHitNpcList(nYyIdx, PIdx2NpcIdx(nPlayerIndex), 90000000);		--ÉèÖÃ³ÉµÚÒ»³ðºÞÕß
	PlayerIndex = nOldPlayerIndex;
end

function tStage02_2_2.KongChan_Leave(nYyIdx)
	local self = tStage02_2_2;
	
	local szNpcName = GetNpcName(nYyIdx);
	if szNpcName ~= "Ë²ÉñÒ¹Ýº" then return end
	
	SetNpcPos(nYyIdx, 1528, 3776);
	CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18, 1, 10002);
	
	local szTemplateName = "ÊÈÑªºÚÑ»";
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		szTemplateName = "ÆÕÍ¨ÊÈÑªºÚÑ»";
	end
	
	local nMapId = this.msPosition:getMapID();
	for i = 1, getn(self.tPoints_HY) do
		local nNpcIdx = CreateNpc(szTemplateName, "ÊÈÑªºÚÑ»", nMapId, self.tPoints_HY[i][1], self.tPoints_HY[i][2]);
		SetNpcLifeTime(nNpcIdx, 20);
	end
end

--¿Õ²õ
function tStage02_2_2.KongChan(nYyIdx)
	
	local self = tStage02_2_2;
	
	local szNpcName = GetNpcName(nYyIdx);
	if szNpcName ~= "Ë²ÉñÒ¹Ýº" then return end
	
	local _, x_, y_ = GetNpcWorldPos(nYyIdx);
	DoSkill2Pos(nYyIdx, 2118, 1, x_, y_);
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	
	local tEventTable = self.tEventTable[nMapId];
	tEventTable:insertevent(2, self.KongChan_Leave, nYyIdx);		--2sºó¿Õ²õÀë¿ª
	tEventTable:insertevent(5, self.KongChan_Back, nYyIdx);			--Àë¿ªºó3s»ØÀ´
end

--²Ô»ð
function tStage02_2_2:CangHuo(nYyIdx)
	if not nYyIdx then return end
	
	NpcChat(nYyIdx, "²»ÒªÍýÍ¼ÌÓ±ÜÄãµÄËÞÃü");
	
	local _, x, y = GetNpcWorldPos(nYyIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 8);
	
	if 0 == getn(tPlayerIndex) then return end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		--local nNpcIdx = GetMissionV(this.mv_24 + i);
		PlayerIndex = tPlayerIndex[i];
		CastState("state_block_type", 1, 5*60*18, 1, 10001);
		DoSkill2Target(nYyIdx, 2107, nSkillLevel, PIdx2NpcIdx(tPlayerIndex[i]));
	end
	PlayerIndex = nOldPlayerIndex;
	
	if not self.tPoints_CH then self:MkDataTable(); end
	local tRand = floyd_m4n(getn(self.tPoints_CH), 5);
	local nAdd = 1;
	for k, v in tRand do
		--local nNpcIdx = GetMissionV(this.mv_24 + nAdd);
		DoSkill2Pos(nYyIdx, 2107, nSkillLevel, self.tPoints_CH[k][1], self.tPoints_CH[k][2]);
		nAdd = nAdd + 1;
	end
end

--ºÚ¹×
function tStage02_2_2.HeiGuan(nYyIdx)
	local self = tStage02_2_2;
	
	if not self.tPoints_HG then
		self:MkDataTable();
	end
	
	NpcChat(nYyIdx, "³¢³¢»ú¹ØµÄ¿Ö²À°É!");
	local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
	if nTnyIdx ~= 0 then
		NpcChat(nTnyIdx, "¿ìÈ¥ÓëºÚ¹×²ÄÁ´ÆðÀ´£¬·½ÄÜ½â³ý²Ô»ð×´Ì¬!");
	end
	
	local nMapId = this.msPosition:getMapID();
	local tTempIdx = {};
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if not JDYY_InDeathArea() and not JDYY_IsPlayerDeath() then
			tinsert(tTempIdx, tPlayerIndex[i]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	
	local tRand = floyd_m4n(getn(self.tPoints_HG), getn(tTempIdx));
	local i = 1;
	for k, v in tRand do
		local nNpcIdx = CreateNpc("ºÚ¹×", "ºÚ¹×", nMapId, self.tPoints_HG[k][1], self.tPoints_HG[k][2]);
		SetNpcScript(nNpcIdx, thisFile);
		SetNpcLifeTime(nNpcIdx, 15);
		SetNpcActivator(nNpcIdx);
		i = i + 1;
	end
	
	self:CangHuo(nYyIdx);
end

--À×ºð
function tStage02_2_2.LeiHou(nYyIdx)
	local self = tStage02_2_2;
	
	local _, x, y = GetNpcWorldPos(nYyIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 8);
	
	if 0 == getn(tPlayerIndex) then return end
	
	local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
	if nTnyIdx ~= 0 then
		NpcChat(nTnyIdx, format("¿ì¶ã¿ª¸ú×Ù×Óµ¯!", szPlayerName));
	end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		DoSkill2Target(nYyIdx, 2105, nSkillLevel, PIdx2NpcIdx(tPlayerIndex[i]));
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage02_2_2:OnNpcDeath(event, data)
	local self = tStage02_2_2;
	local szName = GetNpcName(data[1]);
	RemoveNpc(data[1]);
	if tNpcs.yy[2] == szName then
		-- logserver begin
		-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
		-- logserver end
		self:StagePassed();
		JDYY_GivePrize(GetMissionS(this.MS_STAGE));
	end
end

--µã»÷ºÚ¹×
function tStage02_2_2:ClickHeiGuan(nNpcIdx)
	if 100 == GetUnitCurStates(nNpcIdx, 5) then
	--	Msg2Player("H¾c Quan ®· bÞ khãa!");
		return 0;
	end
	
	local _, x1, y1 = GetNpcWorldPos(nNpcIdx);
	local _, x, y = GetWorldPos();
	
	if abs(x - x1) > 8 or abs(y - y1) > 8 then
		Msg2Player("¿¿½üµã!!")
		return 0;
	end
	
	CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18, 1, 10001);
	SetTask(TASKID_JDYY_HEIGUAN_IDX, nNpcIdx);
	AddUnitStates(nNpcIdx, 5, 100 - GetUnitCurStates(nNpcIdx, 5));
	DoWait(131, 132, 1);
end

---------------------------------------------------------------------------------------------------
-- ÕâÁ½¸öº¯Êý²»ÖªµÀÎªÊ²Ã´ global/action bar callback.lua ÀïÃæ»Øµ÷²»ÁË£¬Òò´ËÖ±½Ó·Åµ½ÄÇÀïÃæÈ¥ÁË¡£

-- function jdyy_ClickHeiGuan_suc()  
-- 	local nNpcIdx = GetTask(TASKID_JDYY_HEIGUAN_IDX);
-- 	RemoveState(10001);
-- 	RemoveNpc(nNpcIdx);
-- end

-- function jdyy_ClickHeiGuan_fail()
-- 	local nNpcIdx = GetTask(TASKID_JDYY_HEIGUAN_IDX);
-- 	if "ºÚ¹×" == GetNpcName(nNpcIdx) then
-- 		RemoveStateFromNpc(nNpcIdx, 10001);
-- 		AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx, 5));
-- 	end
-- end
---------------------------------------------------------------------------------------------------

function tStage02_2_2:NpcMain()
	local self = tStage02_2_2;
	local nNpcIdx = GetTargetNpc();
	if "ºÚ¹×" == GetNpcName(nNpcIdx) then
		self:ClickHeiGuan(nNpcIdx);
	end
end

function tStage02_2_2:OnTrap(event, data)
	if not tTrapResetPos then return end
	
	JDYY_SetPlayerPos(tTrapResetPos[self.szStageId]);
end

function tStage02_2_2.OnPlayerDeath()
	local self = tStage02_2_2;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	SetMissionV(this.mv_34, GetMissionV(this.mv_34) + 1);
	
	if JDYY_PlayerDeadFailed() then
	--	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
		self:StageEnd();
		
		JDYY_GoToStage(self.father, self.father.father, 1);
		
		local szCurStageId = GetMissionS(this.MS_STAGE);
		this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
	end
end

--Õ½¶·¹ý³ÌÖÐµÄ¶Ô»°
function tStage02_2_2.NpcTalk()
	local self = tStage02_2_2;
	
	if not self.tTalks then
		self:MkDataTable();
	end
	
	local nTime = GetMissionV(this.mv_21);
	if self.tTalks[nTime] then
		local nNpcIdx = JDYY_FindNpc(self.tTalks[nTime][1]);
		NpcChat(nNpcIdx, self.tTalks[nTime][2]);
	end
end

--µ¥´ÎÁ÷³Ì
function tStage02_2_2:MkOnceProcedure(bNotInit)
	local self = tStage02_2_2;
	local nYyIdx = JDYY_FindNpc(tNpcs.yy[2]);
	if 0 == nYyIdx then return 0; end
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	local tEventTable = self.tEventTable[nMapId];
	
	if not bNotInit then
		SetMissionV(this.mv_21, 1);
	end
	
	tEventTable:insertevent(3, self.LeiHou, nYyIdx);		--À×ºð
	tEventTable:insertevent(5, self.KongChan, nYyIdx);		--¿Õ²õ
	tEventTable:insertevent(13, self.LeiHou, nYyIdx);		--À×ºð
	tEventTable:insertevent(18, self.KongChan, nYyIdx);		--¿Õ²õ
	tEventTable:insertevent(28, self.KongChan, nYyIdx);		--¿Õ²õ
	tEventTable:insertevent(38, self.LeiHou, nYyIdx);		--À×ºð
	tEventTable:insertevent(43, self.LeiHou, nYyIdx);		--À×ºð
	tEventTable:insertevent(48, self.HeiGuan, nYyIdx);		--ºÚ¹× + ²Ô»ð
	tEventTable:insertevent(60, self.MkOnceProcedure, self);--ÖØÉèÁ÷³Ì
end

--Çå³ýÒÑ¹ýÆÚÊÂ¼þ
function tStage02_2_2:ClearExpiredEvent()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return end
	
	local nNowTime = GetMissionV(this.mv_21);
	local tData = self.tEventTable[nMapId].data;
	if getn(tData) <= 0 then return end
	
	for i = 1, getn(tData) do
		tData[i][1] = tData[i][1] - nNowTime + 2;
	end
	
	while 1 do
		local nRemoved = nil;
		if tData[1][1] <= 0 then
			tremove(tData, 1);
			nRemoved = 1;
		end
		if not nRemoved then
			break;
		end
	end
end

function tStage02_2_2:StagePassed()
	JDYY_ClearMapNpcExcept({tNpcs.tny[2]});
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,3,2,1)  --Í³¼ÆÆÕÍ¨Í¨¹Ø
		AddRuntimeStat(44,10,2,GetMSPlayerCount(this.missionID, 0))
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,5,2,1)  --Í³¼ÆÓ¢ÐÛÍ¨¹Ø
		AddRuntimeStat(44,11,2,GetMSPlayerCount(this.missionID, 0))
	end
	if eDifType.HARD == GetMissionV(this.mv_02) and GetMissionV(this.mv_34) == 0 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_4, 1);end)-- OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_4); end);
	end
	
	self:StageEnd();
	self:onFinish();
end

function tStage02_2_2:StageEnd()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	JDYY_ClearMapNpc();
	JDYY_ReviveAll();
	JDYY_RestoreAll();
	JDYY_ClearAllState();
end

function tStage02_2_2:onTimeout()
--this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	self:StageEnd();
	
	JDYY_GoToStage(self.father, self.father.father, 1);
	
	local szCurStageId = GetMissionS(this.MS_STAGE);
	this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
end

tStage02_2_2.actions = {
	[1] = tStage02_2_2.Init,
};

tStage02_2_2.cycActions = {
	[1] = {
		[0] = {tStage02_2_2.Breathe, tStage02_2_2.NpcTalk, },
	},
};

tStage02_2_2.triggers = {
	Talk = {
		{action = tStage02_2_2.NpcMain}
	},
	NpcDeath = {
		{action = tStage02_2_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage02_2_2.OnPlayerDeath},
	},
	Trap = {
		{action = tStage02_2_2.OnTrap},
	},
};

-----------------------------------------------------------------
--	tStage02_2_3
-----------------------------------------------------------------
function tStage02_2_3:MkEventTable()
	local self = tStage02_2_3;
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage02_2_3:Breathe()
	local self = tStage02_2_3;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage02_2_3:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
			--	{nTnyIdx, "Ta ®Õn hËu s¬n ng¨n viÖn qu©n Thiªn ¢m Gi¸o, h·y mau ®Õn Trôy Long Cèc!"},
				{-1, ""},
			},
		};
	end
end

function tStage02_2_3:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage02_2_3:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	local nTnyIdx = JDYY_CreateNpc(tNpcs.tny, tNpcPos.tny["02_1"][1]);
end

function tStage02_2_3:Init()
	local self = tStage02_2_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	
	self:CreateNpcs();
	self:FreeDataTable();
	self:MkEventTable();
	local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
	JDYY_SetNpcType2Talk(nTnyIdx);
end

function tStage02_2_3.RemoveTny(nTnyIdx)
	local self = tStage02_2_3;
	RemoveNpc(nTnyIdx);
	SendScript2Client('Open([[ma]], 0)');	--¹Ø±Õ·­ÅÆ½çÃæ
	self:onFinish();
end

function tStage02_2_3.NpcTalk()
	if 0 ~= GetMissionV(this.mv_22) then return 0; end
	local self = tStage02_2_3;
	
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		SetMissionV(this.mv_22, 1);
		
		local nTnyIdx = JDYY_FindNpc(tNpcs.tny[2]);
		g_NpcAI:setAI(nTnyIdx, AT_SM_MOVE);
		g_NpcAI:setWayPoint(nTnyIdx, {{1599, 3445}, });
		
		self.tEventTable[nMapId]:insertevent(15, tStage02_2_3.RemoveTny, nTnyIdx);
		return 0;
	end
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

function tStage02_2_3.OnPlayerDeath()
	local self = tStage02_2_3;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage02_2_3:onTimeout()
	this:Msg2MSAll("¹Ø¿¨Ê±¼ä½áÊøÍ¨¹ØÊ§°Ü.");
	JDYY_CloseMission();
end

tStage02_2_3.actions = {
	[1] = tStage02_2_3.Init,
};

tStage02_2_3.cycActions = {
	[1] = {
		[0] = {tStage02_2_3.Breathe, },
	},
	[2] = {
		[0] = {tStage02_2_3.NpcTalk, },
	},
};

tStage02_2_3.triggers = {
	PlayerDeath = {
		{action = tStage02_2_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage02_2.phases = {tStage02_2_2, tStage02_2_3};
tStage02.phases = {tStage02_1, tStage02_2};
