Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\yp\\slymg\\head.lua")
Include("\\script\\lib\\npccmdhead.lua")

---------------------------------------------------------
stageFight = {
	name = "tbSLYMG",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",	
}

function stageFight:createSomeNpc()
	local m = this.msPosition:getMapID();
	local tNpcList = {
		{"Xa phu Trung Nguyªn", "Xa phu", 1705, 3414},
		{"Xa phu", "Xa phu B¾c B", 1705, 3254},
		{"Xa phu", "Xa phu Nam B", 1674, 3548},
		{"Xa phu", "Xa phu §«ng B", 1803, 3396},
		{"Xa phu", "Xa phu T©y B", 1588, 3355},
	}
	mg_CreateNpcList(tNpcList, m);
end

function stageFight.init()
	self = stageFight;
	if this.debugVersion then
		this:Msg2MSAll("B¶n ®å NPC...");
	end
	self:createSomeNpc();
end

function stageFight:onNpcDeath(event, data)
	self = stageFight;
--	if this.debugVersion then
--		print("stageFight:onNpcDeath",event, data)	
--		gf_PrintTable(data,2)
--	end
end

function stageFight:onNpcRemove(event, data)
	self = stageFight;
--	print("stageFight:onNpcRemove",event, data)	
--	local sNpcName = GetNpcName(data); --±»»÷ÆÆnpcµÄÃû×Ö
--	local m = this.msPosition:getMapID();
end

function stageFight:onTalk()
	self = stageFight;
	local strNpcName = GetTargetNpcName();
	local tSay = {};
	local msg = nil;
	if strNpcName == "Xa phu" then
		msg = "T«i sÏ phô tr¸ch tiÕp øng c¸c vÞ, hç trî mäi ng­êi trë vÒ ThÊt L¹c Nhai!";
		tinsert(tSay, "Bèi c¶nh c©u chuyÖn/mg_BgStory");
		tinsert(tSay, "Giíi thiÖu thêi gian gia nhËp/mg_TimeInfo");
		tinsert(tSay, "Giíi thiÖu néi dung ho¹t ®éng/mg_FunctionInfo");
		tinsert(tSay, format("\n Trë vÒ ThÊt L¹c Nhai/#DelMSPlayer(%d, 0)", this.missionID));
	elseif strNpcName == "Xa phu B¾c Bé" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ tiÕn vµo s¶nh B¾c ph©n ®µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, format("\n S¶nh B¾c Ph©n §µ Thiªn ¢m/#mg_GotoLevel1(%d)", 1));
	elseif strNpcName == "Xa phu Nam Bé" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ tiÕn vµo s¶nh Nam ph©n ®µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, format("\n S¶nh Nam Ph©n §µ Thiªn ¢m/#mg_GotoLevel1(%d)", 2));
	elseif strNpcName == "Xa phu §«ng Bé" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ tiÕn vµo s¶nh §«ng ph©n ®µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, format("\n S¶nh §«ng Ph©n §µ Thiªn ¢m/#mg_GotoLevel1(%d)", 3));
	elseif strNpcName == "Xa phu T©y Bé" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ tiÕn vµo s¶nh T©y ph©n ®µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, format("\n S¶nh T©y Ph©n §µ Thiªn ¢m/#mg_GotoLevel1(%d)", 4));
	end
	tinsert(tSay, "T«i vÉn ch­a muèn vÒ/nothing");
	Say(format("<color=gold>%s<color>:", strNpcName)..msg, getn(tSay), tSay);
end

function stageFight:onPlayerDeath(event, data)
	self = stageFight;
end

function stageFight:Breathe()
	self = stageFight;
	local p1 = mg_GetMissionState();
	if p1 == SLYMG_MISSION_CLOSE then return 0; end
	if GetMissionV(this.mv1) ~= p1 then SetMissionV(this.mv1, p1); end
	if p1 > SLYMG_MISSION_READY then mg_NoticePer2Min(); end
	local p2 = GetMissionV(this.mv2);
	if p1 == p2 then return 0; end
	if p1 > p2 then
		SetMissionV(this.mv2, p1);
		local tProgress = {
			[SLYMG_MISSION_READY] = self.ProgressReady,
			[SLYMG_MISSION_STEP_1] = self.ProgressStart,
			[SLYMG_MISSION_STEP_2] = self.ProgressStep1,
			[SLYMG_MISSION_STEP_3] = self.ProgressStep2,
			[SLYMG_MISSION_END] = self.ProgressStep3,
		}
		for i = p2+1, p1 do
			tProgress[i]();
		end
	else
		local msg = "Thiªn ¢m Gi¸o ThÊt L¹c Nhai Ph©n §µ ®· sËp, c¸c hiÖp kh¸ch ®· chiÕn th¾ng trë vÒ.";
		Msg2Global(msg);
		AddLocalNews(msg);
		mg_MapClean();
		SetMissionV(this.mv2, SLYMG_MISSION_CLOSE);
	end
end

function stageFight:ProgressReady()
	local msg = "ThÊt L¹c Nhai ®· truyÒn th«ng tin, mËt ®¹o ®· më, c¸c hiÖp kh¸ch muèn cã h·y ®Õn Thiªn ¢m Gi¸o ThÊt L¹c Nhai ph©n ®µ tiÕn vÒ ThÊt L¹c Nhai MËt Cèc ®Ó chuÈn bÞ.!";
	Msg2Global(msg);
	AddLocalNews(msg);
end

function stageFight:ProgressStart()
	local msg = "MËt ®¹o Thiªn ¢m Gi¸o ThÊt L¹c Nhai Ph©n §µ ®· ®ãng, chóc c¸c hiÖp kh¸ch vµo ph©n ®µ cã thÓ tranh ®o¹t vµng thµnh c«ng.";
	Msg2Global(msg);
	AddLocalNews(msg);
	mg_CreateMonster();
	mg_Func2AllPlayer(SLYMG_LEVEL_MAP1);
end

function stageFight:ProgressStep1()
	mg_CreateBoss(SLYMG_LEVEL_MAP1, SLYMG_LEVEL_BOSS1, "Gi÷a §¹i ®­êng hçn lo¹n ph¸t hiÖn mét th¸m tö Èn nÊp, kh«ng biÕt anh ta lµm cã thuËn lîi kh«ng");
end

function stageFight:ProgressStep2()
	mg_CreateBoss(SLYMG_LEVEL_MAP2, SLYMG_LEVEL_BOSS2, "Ph©n §µ biÕn thµnh Tu L¹c Tr­êng, xuÊt hiÖn ®µi gi÷a §¹i §­êng ");
end

function stageFight:ProgressStep3()
	mg_CreateBoss(SLYMG_LEVEL_MAP3, SLYMG_LEVEL_BOSS3, "¢m thanh th¶m thiÕt, tr­ëng l·o Tiªu NhiÔm NguyÖt Thiªn ¢m Gi¸o xuÊt hiÖn råi!");
end

----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
}
stageFight.cycActions = {
	[5] = {
		[0] = stageFight.Breathe,
	},
}
stageFight.triggers = {
	NpcDeath = { 
		{action = stageFight.onNpcDeath},
	},
	NpcRemove = {
		{action = stageFight.onNpcRemove},
	},
	Talk = {
		{action = stageFight.onTalk},
	},
	PlayerDeath = {
		{action = stageFight.onPlayerDeath},
	},
};
----------------------------------------------------------------------
firePhases.phases = {stageFight};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "KÕt thóc ¶i!");
	CloseMission(this.missionID);
end

----------------------------------------------------------------------
tbSLYMG = gf_CopyInherit(missionBase, tbSLYMG);

tbSLYMG.msOption.bForbitTeam = 1; --¿ÉÒÔ×é¶Ó
tbSLYMG.msOption.nInitFightState = nil; --Õ½¶·×´Ì¬
tbSLYMG.msOption.nRestoreFightState = nil; --Õ½¶·×´Ì¬
tbSLYMG.msOption.bRestoreTempEffect = 0; --ÊÇ·ñÇå³ýÁÙÊ±×´Ì¬
tbSLYMG.msOption.szInitDeahScript = "\\script\\missions\\yp\\slymg\\player_death.lua";

tbSLYMG.msPhases[1] = firePhases;

tbSLYMG.msPosition.entryPos = {
	{1708, 3407},
};
tbSLYMG.msPosition.exitPos = {6300, 1378, 3256};

function tbSLYMG:onLogin()
	this.msOption:setState(1);
	this.msCamp:addPlayer(this.missionID, 1);	
	SetFightState(1);
end

tbSLYMG.msOption.OnPlayerJoin = function(self, nCamp)
	mg_SetPlayerState();
end

tbSLYMG.msOption.OnPlayerLeave = function(self, nCamp)
	if this.debugVersion then
		print("tbSLYMG.msOption.OnPlayerLeave")
	end
	SetLogoutRV(0);
	SetDeathPunish(0);
	ForbidChangePK(0);
	SetPKFlag(0, 0);
	SetDeathScript("");
	RestoreAll();
	SetFightState(0);
end

this = tbSLYMG;
