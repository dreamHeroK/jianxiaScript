Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")

Include("\\script\\function\\siege_qualification\\tm_head.lua")
Include("\\script\\function\\siege_qualification\\siege_npc.lua")
--------------------------------------------------------------
phaseTeamFight_waiting = {
	maxsecond = 20 * 60,
	guage = {
		msg = "Giai 畂筺 chu萵 b?",
		time = 20 * 60,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function this:onJoin(nCamp)
	self.msCamp:addPlayer(self.missionID, nCamp);
	self.msOption:setState(nCamp);
	for k,v in self.msPhases do
		v:addTimeGuage();
	end 
	if GetCaptainName() == GetName() then
		SendScript2VM("\\script\\中原二区\\成都\\npc\\擂台老板.lua","siege_set_mark()")
	end
end

function phaseTeamFight_waiting.Init()
	self = phaseTeamFight_waiting;
	DebugOutput("phaseTeamFight_waiting.Init()")
	DebugOutput("tbTONGMELEE.onMissionInit", this.msPosition:getMapID())
	local nNpcIndex = CreateNpc("宋将军", "攻城战车夫", 5099, 1633, 3180);
	SetNpcScript(nNpcIndex, "\\script\\function\\siege_qualification\\npc\\tm_mssion_npc.lua");
end

function phaseTeamFight_waiting.Msg()
--	this:Msg2MSAll("尚未领取神兽的队员，请迅速确认领取，比赛即将开始！");
	this.msCamp:turnPlayer(0, tm_UpdateTongToClient);
end

function phaseTeamFight_waiting.ShowStart()
	this:Msg2MSAll("攻城战战正式开始！");
	this.msCamp:turnPlayer(0, tm_aoto_assign_beast);
end

phaseTeamFight_waiting.actions = {
	[1] = phaseTeamFight_waiting.Init,
	[1199]	= phaseTeamFight_waiting.ShowStart,
}

phaseTeamFight_waiting.cycActions = {
	[299] = {
		[0] = phaseTeamFight_waiting.Msg,
	},	
}

phaseTeamFight_waiting = inherit(cycPhase, phaseTeamFight_waiting);
phaseTeamFight_waiting.onTimeout = phaseTeamFight_waiting.onFinish;

phaseTeamFight_fighting = {
	maxsecond = 27 * 60,
	guage = {
		msg = "战斗进度",
		time = 27 * 60,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function phaseTeamFight_fighting.Init()
	self = phaseTeamFight_fighting;
	DebugOutput("phaseTeamFight_fighting.Init");
	this.msCamp:turnPlayer(0, tm_SetPlayer2Fight);
	this:Msg2MSAll(format("T蕋 c? bang h穣 nhanh ch鉵g h祅h ng n祇, t輈h l騳 bang x誴 h筺g 1 v? t n %d 甶觤 s? nh薾 頲 t? c竎h c玭g th祅h cu鑙 c飊g!", TM_LIMIT_SCORE));
end

function phaseTeamFight_fighting.UpdateTongData()
	this.msCamp:turnPlayer(0, tm_UpdateTongToClient);
end

function phaseTeamFight_fighting.RandomEvent()
	tm_RandomEvent();
	this:Msg2MSAll("刷新随机事件");
end

function phaseTeamFight_fighting.CheckBeast()
	this.msCamp:turnPlayer(0, tm_aoto_assign_beast);
end

function phaseTeamFight_fighting:onPlayerDeath(event, killId)
	DebugOutput("phaseTeamFight_fighting.onPlayerDeath(event, killId)", event, killId, PlayerIndex)
	local _, nSubLevel = tm_GetNpcLocate();
	local nIsCurator = ((GetItemCount(2, 1, 30616) > 0) and 5) or 1;
	
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = NpcIdx2PIdx(killId);
	local _, nLevel = tm_GetNpcLocate();
	DebugOutput("phaseTeamFight_fighting.onPlayerDeath", nLevel, nSubLevel, nIsCurator)
	if nLevel < 1 or nLevel > getn(TM_SORCE_TABLE)
		or nSubLevel < 1 or nSubLevel > getn(TM_SORCE_TABLE[1]) then
			PlayerIndex = oldPlayerIndex;
			return 0;
	end
	local nSocre = TM_SORCE_TABLE[nLevel][nSubLevel] * nIsCurator;
	tm_set_tongsorce(nSocre);
	
	PlayerIndex = oldPlayerIndex;
	tm_set_tongsorce(-nSocre);
end

function phaseTeamFight_fighting:onNpcDeath(event, tParam)
	DebugOutput("phaseTeamFight_fighting.onNpcDeath(event, npcIdx, f, x)", event, tParam[1], tParam[2], tParam[3], GetNpcName(tParam[1]));
	if tParam[2] ~= 0 then return 0; end
	local deathNpcIndex = tonumber(tParam[1]);
	tm_ResetEventPoint(deathNpcIndex);
	local sNpcName = GetNpcName(deathNpcIndex);
	if sNpcName == "V? 髖 Thng Cu錸g" then
		tm_set_tongsorce(1);
	elseif sNpcName == "Nhi誴 H錸 Ng璾 u" then
		tm_set_tongsorce(5);
	elseif sNpcName == "H? Linh N? Binh" then
		gf_TeamOperateEX(function ()
			CastState("state_shelter_new", 100, 60*18, 0);
			Msg2Player("Trong 60 gi﹜ cung c蕄 1 l莕 hi謚 qu? b蕋 t?, c? hi謚 qu? i v韎 bang h閕");
		end);
	elseif sNpcName == "Gi? v? kh?" or sNpcName == "Gi? khi猲" or
			sNpcName == "L? th秓 dc" or	sNpcName == "Gi祔 gi?" then
		local tBuffInfo = TM_TMZ_BUFF[sNpcName];
		if not tBuffInfo then return 0; end
		gf_TeamOperateEX(function (tBuffInfo)
			for i = 1, getn(tBuffInfo.tbuff) do
				CastState(tBuffInfo.tbuff[i][1], tBuffInfo.tbuff[i][2], tBuffInfo.tbuff[i][3]*18, 0);
			end
			Msg2Player(format("Ngi nh薾 頲 hi謚 qu? %s", tBuffInfo.Msg));
		end, tBuffInfo);
	elseif sNpcName == "混沌智灵" then
		tm_set_tongsorce(250);
	end
	SetNpcLifeTime(deathNpcIndex, 0);
end

function phaseTeamFight_fighting:onTalk(event)
	DebugOutput("phaseTeamFight_fighting.onTalk(event)", event, GetNpcName(GetTargetNpc()));
	local talkNpcIndex = GetTargetNpc()
	tm_ResetEventPoint(talkNpcIndex);
	local sNpcName = GetNpcName(talkNpcIndex);
	if sNpcName == "圣火台" then
		local nCurTime = GetTime();
		gf_TeamOperateEX(function (nCurTime)
			SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, nCurTime);
		end, nCurTime);
		gf_Msg2Team("30秒内己方积分翻倍");
	elseif sNpcName == "火炬台" then
		local nCurTime = GetTime();
		gf_TeamOperateEX(function (nCurTime)
			SetTaskTemp(TMP_TASK_TONG_MELEE_NOTREDUCESORCE, nCurTime);
		end, nCurTime);
		gf_Msg2Team("30秒内己方无法获得积分");
	elseif sNpcName == "L玦 H? Th莕 Th?" then
		gf_TeamOperateEX(function ()
			CastState("state_life_max_percent_add", 100, 60*18, 0);
			Msg2Player("Trong 60 gi﹜ cung c蕄 hi謚 qu? t╪g sinh l鵦 100%, c? hi謚 qu? cho to祅 bang h閕");
		end);
	end
	SetNpcLifeTime(talkNpcIndex, 0);
end

function phaseTeamFight_fighting:OnRevive(event)
	DebugOutput("phaseTeamFight_fighting.OnRevive(event)", event, GetName());
	tm_SetPlayer2Fight();
end

function phaseTeamFight_fighting.CheckPlayer()
	DebugOutput("phaseTeamFight_fighting.CheckPlayer()");
	this.msCamp:turnPlayer(0, tm_CheckPlayer);
end

function phaseTeamFight_fighting.Event1()
	tm_Event1();
	this:Msg2MSAll("刷新随机事件");
end

function phaseTeamFight_fighting.CallBoss()
	local npcIndex = CreateNpc("帮战BOSS", "混沌智灵", this.msPosition:getMapID(), 1873, 4388);
	SetNpcDeathScript(npcIndex, thisFile);
	this:Msg2MSAll("帮战BOSS[混沌智灵]出现了，击败它可获得更多积分。");
end

phaseTeamFight_fighting.actions = {
	[1] = phaseTeamFight_fighting.Init,
	[3] = phaseTeamFight_fighting.Event1,
	[1320] = phaseTeamFight_fighting.CallBoss,
}

phaseTeamFight_fighting.cycActions = {
	[5]	= {
		[0] = phaseTeamFight_fighting.CheckPlayer,
	},
	[30] = {
		[0] = phaseTeamFight_fighting.UpdateTongData,
	},
	[60] = {
		[0] = phaseTeamFight_fighting.CheckBeast,
	},
	[300] = {
		[0] = phaseTeamFight_fighting.RandomEvent,
	},
}

phaseTeamFight_fighting.triggers = {
	PlayerDeath = {
		{action = phaseTeamFight_fighting.onPlayerDeath,},
	},
	OnRevive = {
		{action = phaseTeamFight_fighting.OnRevive,},
	},
	NpcDeath = {
		{action = phaseTeamFight_fighting.onNpcDeath,},
	},
	Talk = {
		{action = phaseTeamFight_fighting.onTalk,},
	}
}

phaseTeamFight_fighting = inherit(cycPhase, phaseTeamFight_fighting);
phaseTeamFight_fighting.onTimeout = phaseTeamFight_fighting.onFinish;

phaseTeamFight_ending = {
	maxsecond = 60,
	guage = {
		msg = "准备离场",
		time = 60,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function phaseTeamFight_ending.Init()
	self = phaseTeamFight_ending;
	DebugOutput("phaseTeamFight_ending.Init()")
end

function phaseTeamFight_ending.checkRezult()
	DebugOutput("phaseTeamFight_ending.checkRezult()")
	this.msCamp:turnPlayer(0, tm_EveryMatchAward);
end

function phaseTeamFight_ending.RankShow()
	DebugOutput("phaseTeamFight_ending.RankShow()");
	tm_RankShow();
end

function phaseTeamFight_ending.onFinish()
	DebugOutput("phaseTeamFight_ending:onFinish()")
	this:Close();
end

phaseTeamFight_ending.actions = {
	[1] = phaseTeamFight_ending.Init,
	[5] = phaseTeamFight_ending.checkRezult,
	[10] = phaseTeamFight_ending.RankShow,
}

phaseTeamFight_ending = inherit(cycPhase, phaseTeamFight_ending);
phaseTeamFight_ending.onTimeout = phaseTeamFight_ending.onFinish;
--------------------------------------------------------------
phaseTeamFight = {
	phases = {
		phaseTeamFight_waiting,
		phaseTeamFight_fighting,
		phaseTeamFight_ending,
	},
	maxsecond = 50 * 60,
	timerID = 117,
};
phaseTeamFight = inherit(phaseBase, phaseTeamFight);

------------------------------------------------------------
tbTONGMELEE = inherit(missionBase, tbTONGMELEE);

function tbTONGMELEE:Open()
	self:Create();
end

function tbTONGMELEE:Close()
	missionBase.Close(self);
end

tbTONGMELEE.msOption.OnPlayerJoin = function(self, nCamp)
	tm_set_tong_info(); --初始化帮会信息
--	AddItem(2, 1, 30615, 1);
--	this:Msg2MSAll(format("%s帮会-%s 进入攻城区域", GetTongName(), GetName()));
end

tbTONGMELEE.msOption.OnPlayerLeave = function(self, nCamp)
	KillFollower();
--	DelItem(2, 1, 30615, 1);
--	DelItem(2, 1, 30616, 1);
	RemoveTrigger(GetTrigger(1543*2));
	RemoveState(9991);
	RemoveState(9992);
	RemoveState(9993);
	RemoveState(9994);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 0,0,1,18*3);
end

tbTONGMELEE.msPhases = {
	phaseTeamFight,
};

tbTONGMELEE.msPosition.entryPos = {1864, 4392};

tbTONGMELEE.msPosition.exitPos = {
	{300, 1833, 3584},
};

tbTONGMELEE.msOption.nInitFightState = 0;
tbTONGMELEE.msOption.bSetPkFlag = 3;
tbTONGMELEE.msOption.bSetPkCamp = 0;
tbTONGMELEE.msOption.szInitDeahScript = thisFile;
tbTONGMELEE.msOption.bLeaveTeam = 0;
tbTONGMELEE.msOption.bRestoreSetPkFlag = 0;
tbTONGMELEE.msOption.bRestoreSetPkCamp = 0;
tbTONGMELEE.msOption.bRestoreForbidChangePK = 0;
tbTONGMELEE.msOption.bRestoreLeaveTeam = 0;

this = tbTONGMELEE;

--------------------------------------------------------------


