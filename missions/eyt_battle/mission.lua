Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\script\\missions\\eyt_battle\\eyt_head.lua")

--------------------------------------------------------------
eytMission_waiting = {
	maxsecond = 2 * 60,  -- 最大等待时间为2分钟
	guage = {
		msg = "进入等待阶段",
		time = 2 * 60,  -- 等待时间为2分钟
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
}

function eytMission_waiting.Init()
	self = eytMission_waiting;
	SetMissionV(this.battleState, EYT_STATE_PEACE);
	eyt_CreateFo();
	DebugOutput("eytMission_waiting.Init()")
end

function eytMission_waiting.Close()
	this:Msg2MSAll("时间到了，任务结束！");
	this:Close();
end

function eytMission_waiting.CheckStart()
	local nRedPlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_RED);
	local nBluePlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_BLUE);
	DebugOutput(nRedPlayer, nBluePlayer);
	if nRedPlayer == EYT_PLAYER_MAX and nBluePlayer == EYT_PLAYER_MAX then
		phaseBase.onFinish(self);
	end
	this.msCamp:turnPlayer(0, eyt_FloatReport);
end

function eytMission_waiting.Message()
	local nRedPlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_RED);
	local nBluePlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_BLUE);
	this:Msg2MSAll(format("红队参与人数: %d, 蓝队参与人数: %d, 两队共计需要 %d 人才能开始?", nRedPlayer, nBluePlayer, EYT_PLAYER_MAX));
end

eytMission_waiting.actions = {
	[1] = eytMission_waiting.Init,
	[3] = eytMission_waiting.Message,
}

eytMission_waiting.cycActions = {
	[10] = {
		[0] = eytMission_waiting.CheckStart,
	},
	[31] = {
		[0] = eytMission_waiting.Message,
	},	
}

eytMission_waiting = inherit(cycPhase, eytMission_waiting);
eytMission_waiting.onTimeout = eytMission_waiting.Close;

eytMission_fighting = {
	maxsecond = 12 * 60,
	guage = {
		msg = "战斗开始",
		time = 12 * 60,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function eytMission_fighting.Init()
	self = eytMission_fighting;
	SetMissionV(this.battleState, EYT_STATE_FIGHT);
	--SetMissionV(this.flagTime, GetTime());
	DebugOutput("eytMission_fighting.Init");
	this.msCamp:turnPlayer(0, SendScript2Client, [[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\其他\\战斗开始_越南.3e",1000*2,0.7)]])
	this.msCamp:turnPlayer(0, RestoreAll);
	this.msCamp:turnPlayer(0, eyt_SetJoinTime, GetTime());
	this.msCamp:turnPlayer(0, eyt_AddOnceJoinTimes);
	AddRuntimeStat(27, 3, 0, 1); --成功开启次数
	this:Msg2MSAll("战斗开始！");
end

function eytMission_fighting:onPlayerDeath(event, killId)
	DebugOutput("eytMission_fighting.onPlayerDeath(event, killId)", event, killId, PlayerIndex)
	--清除药CD
	ClearColdDown();
	--先清雪恨状态再加
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	eyt_KillSome(NpcIdx2PIdx(killId));
end

function eytMission_fighting:onNpcDeath(event, tParam)
	DebugOutput("eytMission_fighting.onNpcDeath(event, npcIdx, f, x)", event, tParam[1], tParam[2], tParam[3], GetNpcName(tParam[1]));
end

function eytMission_fighting:onTalk(event)
	DebugOutput("eytMission_fighting.onTalk(event)", event, GetNpcName(GetTargetNpc()));
	local npcIndex = GetTargetNpc();
	if GetNpcName(npcIndex) == EYT_NPC_FLAG then
		local nMapID, nX, nY = GetWorldPos();
		local npcMapID, npcX, npcY = GetNpcWorldPos(npcIndex);
		if nMapID ~= npcMapID then
			return 0;
		end
		if (nX - npcX) * (nX -npcX) + (nY - npcY) * (nY - npcY) > 36 then
			Msg2Player("距离太远无法操作!");
			return 0;
		end
		DoWait(119, 120, 10);
		this.msCamp:turnPlayer(0, HeadMsg2Player, format("%s 正在操作中..", GetName()));
	end
end

function eytMission_fighting:OnRevive(event)
	DebugOutput("eytMission_fighting.OnRevive(event)", event, GetName());
	SetFightState(0);
	eyt_SetTempRevPos();
	SetTempRevScript(thisFile);
	SetTaskTemp(TMP_TASK_KF_TIME, 0);
	eyt_AddBuff();
	RestoreAll();
end

function eytMission_fighting.CheckScore()
	local nRed = GetMissionV(this.redScore);
	local nBlue = GetMissionV(this.blueScore);
	if nRed >= EYT_SCROE_MAX or nBlue >= EYT_SCROE_MAX then
		eytMission_fighting:onFinish();
		this.msCamp:turnPlayer(0, SetFightState, 0);
	end
end

function eytMission_fighting.Msg()
	eyt_Report();
end

function eytMission_fighting.CreateFlag()
	local nCurTime = GetTime();
	local nOldTime = GetMissionV(this.flagTime);
	if nCurTime - nOldTime > EYT_FLAG_REFLESH_TIME then
		if eyt_CreateFlag() ~= 0 then
			SetMissionV(this.flagTime, nCurTime);
			this.msCamp:turnPlayer(0, HeadMsg2Player, "已生成旗帜，快去占领吧！");
			this:Msg2MSAll("已生成旗帜，快去占领吧！");
		end
	end
end

function eytMission_fighting.CheckStatus()
	this.msCamp:turnPlayer(0, eyt_FloatReport)
	this.msCamp:turnPlayer(0, eyt_CheckAndKickSleep);
	if GetMSPlayerCount(this.missionID) <= 1 then
		DebugOutput("GetMSPlayerCount", this.missionID, GetMSPlayerCount(this.missionID));
		eytMission_fighting:onFinish();
		this.msCamp:turnPlayer(0, SetFightState, 0);
	end
end

function eytMission_fighting:onFinish()
	DebugOutput("eytMission_fighting:onFinish");
	phaseBase.onFinish(self)
	
	this.msCamp:reflash(EYT_CAMP_RED);
	local redTb = this.msCamp.players;
	this.msCamp:reflash(EYT_CAMP_BLUE);
	local blueTb = this.msCamp.players;
	
	local nOldPlayer = PlayerIndex;
	local nRedDamage = 0;
	for i = 1,getn(redTb) do
		PlayerIndex = redTb[i];
		nRedDamage = nRedDamage + GetToPlayerDamage();
	end
	local nBlueDamage = 0;
	for i = 1,getn(blueTb) do
		PlayerIndex = blueTb[i];
		nBlueDamage = nBlueDamage + GetToPlayerDamage();
	end
	PlayerIndex = nOldPlayer;
	
	local nWiner = 0;
	local RedPlayerCount = getn(redTb);
	local BluePlayerCount = getn(blueTb);
	
	AddRuntimeStat(27, 4, 0, RedPlayerCount+BluePlayerCount); --结束时的人数
	
if RedPlayerCount ~= 0 and BluePlayerCount ~= 0 then
	local nRed = GetMissionV(this.redScore);
	local nBlue = GetMissionV(this.blueScore);
	if nRed > nBlue then
		nWiner = EYT_CAMP_RED;
		this:Msg2MSAll(format("战斗结束，双方得分为[%d:%d]，%s阵营获得胜利！", nRed, nBlue, EYT_CAMP_NAME[EYT_CAMP_RED]));
	elseif nRed < nBlue then
		nWiner = EYT_CAMP_BLUE;
		this:Msg2MSAll(format("战斗结束，双方得分为[%d:%d]，%s阵营获得胜利！", nRed, nBlue, EYT_CAMP_NAME[EYT_CAMP_BLUE]));
	else
		if nRedDamage >= nBlueDamage then
			nWiner = EYT_CAMP_RED;
			this:Msg2MSAll(format("战斗结束，双方得分为%d，伤害总量为[%d:%d]，%s阵营获得胜利！", nRed, nRedDamage + 12345, nBlueDamage, EYT_CAMP_NAME[EYT_CAMP_RED]));
		else
			nWiner = EYT_CAMP_BLUE;
			this:Msg2MSAll(format("战斗结束，双方得分为%d，伤害总量为[%d:%d]，%s阵营获得胜利！", nRed, nRedDamage, nBlueDamage + 12345, EYT_CAMP_NAME[EYT_CAMP_BLUE]));
		end
	end
elseif RedPlayerCount > 0 and BluePlayerCount == 0 then
	nWiner = EYT_CAMP_RED;
	this:Msg2MSAll(format("战斗结束，另一方%s没有人参与战斗，%s阵营获得胜利！", EYT_CAMP_NAME[EYT_CAMP_BLUE], EYT_CAMP_NAME[EYT_CAMP_RED]));
elseif BluePlayerCount > 0 and RedPlayerCount == 0 then
	nWiner = EYT_CAMP_BLUE;
	this:Msg2MSAll(format("战斗结束，另一方%s没有人参与战斗，%s阵营获得胜利！", EYT_CAMP_NAME[EYT_CAMP_RED], EYT_CAMP_NAME[EYT_CAMP_BLUE]));
end
	
	SetMissionV(this.result, nWiner);
	
	local nOldPlayer = PlayerIndex;
	if nWiner == EYT_CAMP_RED then
		for i = 1,getn(redTb) do
			PlayerIndex = redTb[i];
			eyt_AddSucc();
		end
		for i = 1,getn(blueTb) do
			PlayerIndex = blueTb[i];
			eyt_AddFail();
		end
	else
		for i = 1,getn(redTb) do
			PlayerIndex = redTb[i];
			eyt_AddFail();
		end
		for i = 1,getn(blueTb) do
			PlayerIndex = blueTb[i];
			eyt_AddSucc();
		end		
	end
	PlayerIndex = nOldPlayer;
	
	this:Msg2MSAll(format("奖励因服务器数据同步问题无法发放，请在后续进行奖励发放，敬请谅解！"))
end

function eytMission_fighting:onTimeout()
	return self:onFinish();
end

eytMission_fighting.actions = {
	[1] = eytMission_fighting.Init,
}

eytMission_fighting.cycActions = {
	[1] = {
		[0] = eytMission_fighting.CheckScore,
	},
	[5] = {
		[0] = eytMission_fighting.CreateFlag,
	},
	[7] = {
		[0] = eytMission_fighting.CheckStatus,
	},
	[45] = {
		[0] = eytMission_fighting.Msg,
	},
}

eytMission_fighting.triggers = {
	PlayerDeath = {
		{action = eytMission_fighting.onPlayerDeath,},
	},
	OnRevive = {
		{action = eytMission_fighting.OnRevive,},
	},
	NpcDeath = {
		{action = eytMission_fighting.onNpcDeath,},
	},
	Talk = {
		{action = eytMission_fighting.onTalk,},
	}
}

eytMission_fighting = inherit(cycPhase, eytMission_fighting);

eytMission_ending = {
	maxsecond = 15,
	guage = {
		msg = "结束倒计时",
		time = 15,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function eytMission_ending.Init()
	self = eytMission_ending;
	SetMissionV(this.battleState, EYT_STATE_COMPLETE);
	DebugOutput("eytMission_ending.Init()")
	this.msCamp:turnPlayer(0, eyt_SetJoinTime, 0);
	this.msCamp:turnPlayer(0, eyt_ShowExit, GetMissionV(this.result));
end

function eytMission_ending.PlayerData()
	this.msCamp:reflash(0);
	local PlayerTb = this.msCamp.players;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, #PlayerTb do
		PlayerIndex = PlayerTb[i];
		Msg2Player(format("玩家数据：总伤害 %d，击杀数 %d，被击数 %d，个人得分 %d", GetToPlayerDamage(), eyt_GetKill(), eyt_GetKilled(), eyt_GetMyScore()));
	end
	PlayerIndex = oldPlayerIndex;
end

function eytMission_ending.onFinish()
	DebugOutput("eytMission_ending:onFinish()")
	this:Close();
end

eytMission_ending.actions = {
	[1] = eytMission_ending.Init,
	[5] = eytMission_ending.PlayerData,
}

eytMission_ending = inherit(cycPhase, eytMission_ending);
eytMission_ending.onTimeout = eytMission_ending.onFinish;

--------------------------------------------------------------
eytMission = {
	phases = {
		eytMission_waiting,
		eytMission_fighting,
		eytMission_ending,
	},
	maxsecond = 15 * 60,
	timerID = 101,
};
eytMission = inherit(phaseBase, eytMission);

------------------------------------------------------------
EYT_MISSION = inherit(missionBase, EYT_MISSION);

function EYT_MISSION:Close()
	missionBase.Close(self);
end

EYT_MISSION.msOption.OnPlayerJoin = function(self, nCamp)
	CountDownRevive(EYT_COUNTDOWN_REVIVE, EYT_COUNTDOWN_TIME);
	eyt_ResetKill();
	eyt_ResetKilled();
	eyt_ResetMyScore();
	KillFollower();
	SetFightState(0);
	eyt_SetTempRevPos();
	SetTempRevScript(thisFile);
	Msg2Player(format("玩家加入阵营：%s", EYT_CAMP_NAME[nCamp]));
	this:Msg2MSAll(format("%s加入了 T? V? ?y", GetName()));
	AddRuntimeStat(27, 1, GetPlayerRoute(), 1); -- 统计流派参与人数
end

EYT_MISSION.msOption.OnPlayerLeave = function(self, nCamp)
	DebugOutput("OnPlayerLeave missionid =", this.missionID)
	CountDownRevive(0, 0);
	FloatMsg2Player("");
	SetTempRevPos(0,0,0);
	SetTempRevScript("");
	if GetMissionV(this.battleState) ~= EYT_STATE_FIGHT then
		eyt_SetJoinTime(0);
	end
end

EYT_MISSION.onMissionInit = function(self)
	
end

EYT_MISSION.msPhases = {
	eytMission,
};

EYT_MISSION.msPosition.entryPos = EYT_REV_POS;

EYT_MISSION.msPosition.exitPos = {
	{428, 1310, 2693},
	{428, 1405, 2800},
	{428, 1490, 2743},
	{428, 1366, 2608},
};

EYT_MISSION.msOption.nInitFightState = 0;
EYT_MISSION.msOption.szInitDeahScript = thisFile;
EYT_MISSION.msOption.bLeaveTeam = 0;
EYT_MISSION.msOption.bRestoreSetPkFlag = 0;
EYT_MISSION.msOption.bRestoreSetPkCamp = 0;
EYT_MISSION.msOption.bRestoreForbidChangePK = 0;
EYT_MISSION.msOption.bRestoreLeaveTeam = 0;

this = EYT_MISSION;

--------------------------------------------------------------


