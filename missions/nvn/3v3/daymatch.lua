Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\nvn\\3v3\\head.lua")

function DayMatch:Init()
	g_tWinTimes = {}
end

function DayMatch:addPlayer()	
	local szAllHint = "";
	if GetTeamSize() > 0 then
		if GetTeamSize() ~= WARTEAM_SIZE then
			Talk(1, "", "CÇn ph¶i 3 ng­êi tæ ®éi míi tham gia 3v3 ®­îc");
			return 0;
		end
		if GetCaptainName() ~= GetName() then
			Talk(1, "", "CÇn ®éi tr­ëng thao t¸c");
			return 0;
		end
		local bAllow = 1;
		local tRoute = {}
		local fightteamID = GetFightTeamID();
		local nLeaderLvStage = get_lv_stage()
		for i = 1, WARTEAM_SIZE do
			PlayerIndex = GetTeamMember(i)
			if GetFightTeamID() ~= fightteamID then
				fightteamID = 0;
			end
			if get_lv_stage() ~= nLeaderLvStage then
				szAllHint = szAllHint..format("CÊp cña %s kh«ng thuéc cïng ph¹m vi cÊp víi ®éi tr­ëng", GetName())
				bAllow = 0;
			end
			local nRoute = GetPlayerRoute();
			if tRoute[nRoute] then
				szAllHint = szAllHint.."\n["..GetName().."] Cã ®éi viªn cïng hÖ ph¸i!";
				bAllow = 0;
			end
			tRoute[nRoute] = 1;
			local check, szMyHint = checkEquipment()
			if check ~= 1 then
				szAllHint = szAllHint.."\n"..szMyHint;
				bAllow = 0;
			end
		end
		if bAllow ~= 1 then
			for i = 1, WARTEAM_SIZE do
				PlayerIndex = GetTeamMember(i);
				Talk(1, "", szAllHint);
			end
			return 0
		else
			for i = 1, WARTEAM_SIZE do
				PlayerIndex = GetTeamMember(i);
				lockEquipment(1);
				P3v3_Enter(1, fightteamID);
			end
		end
	else
		local check, szMyHint = checkEquipment()
		if check ~= 1 then
			Talk(1, "", szMyHint);
			return 0;
		else
			lockEquipment(1);
			P3v3_Enter(1);
		end
	end
end

gTodayRound = 0

function DayMatch:startARound(nTodayRound)
	if self:checkTodayRound(battleState, nTodayRound) ~= 1 then
		self:gameover();
	end
	gTodayRound = nTodayRound
	DebugOutput("DayMatch:startARound")
	local tPlayers, tTeams = P3v3_GetPlayers(), P3v3_GetTeams();
	DebugOutput("tPlayers = ", Val2Str(tPlayers));
	DebugOutput("tTeams = ", Val2Str(tTeams))
	DebugOutput("=====================>1111");
	-- ×é¶Ó -> Ò°¶Ó
	local oldPidx = PlayerIndex
	local tTempTeam = {}
	for i = 1, getn(tPlayers) do
		PlayerIndex = tPlayers[i];
		if GetTeamSize() > 0 and GetTeamSize() <= WARTEAM_SIZE then
			local pidxLeader = GetTeamMember(0);
			tTempTeam[pidxLeader] = tTempTeam[pidxLeader] or {};
			tinsert(tTempTeam[pidxLeader], PlayerIndex);
			tPlayers[i] = nil;
		end
	end
	sort(tTempTeam, self.sortTeam);	-- todo
	for k, v in tTempTeam do
		tinsert(tTeams, v);
	end
	DebugOutput("tTempTeam = ", Val2Str(tTempTeam))
	DebugOutput("tTeams = ", Val2Str(tTeams))
	DebugOutput("=====================>222");

	--tinsert(tTeams, 1, {0});		-- test
	tTeams = checkTeams(tTeams);				-- fix
	-- µ¥ÈË -> Ò°¶Ó
	local lastTeam = getn(tTeams) + 1;
	tPlayers.n = nil;
	tPlayers = self.resettable(tPlayers);
	sort(tPlayers, self.sortPlayer);	-- todo
	
	for i = 1, getn(tPlayers) do
		if tPlayers[i] then
			tTeams[lastTeam] = tTeams[lastTeam] or {}
			if getn(tTeams[lastTeam]) < WARTEAM_SIZE and get_lv_stage(tPlayers[i])==get_lv_stage(tTeams[lastTeam]) then
				tinsert(tTeams[lastTeam], tPlayers[i]);
			else
				lastTeam = lastTeam + 1;
				tTeams[lastTeam] = {tPlayers[i]};
			end
			tPlayers[i] = nil;
		end
	end
	tTeams.n = nil;
	
	DebugOutput("tPlayers = ", Val2Str(tPlayers));
	DebugOutput("tTeams = ", Val2Str(tTeams))
	sort(tTeams, self.sortTeam);	-- todo
	--DebugOutput("Sorted tTeams = ", Val2Str(tTeams))
	local nPlayerCount = 0;
	for i = 1, getn(tTeams), 2 do
		if get_lv_stage(tTeams[i]) == get_lv_stage(tTeams[i+1]) and getn(tTeams[i] or {}) == WARTEAM_SIZE and getn(tTeams[i+1] or {}) == WARTEAM_SIZE then
			DebugOutput("battleteam", i, i+1, get_sort_value(tTeams[i]), get_sort_value(tTeams[i+1]))
			enterBattle_3v3(tTeams[i], tTeams[i+1]);
			nPlayerCount = nPlayerCount + getn(tTeams[i] or {}) + getn(tTeams[i+1] or {})
		else
			i = i - 1 --Ö»Ìø¹ýÒ»¸ö¶Ó
		end
	end
	--Í³¼ÆÃ¿Ò»³¡´ÎµÄ²Î¼ÓÈËÊý
	if nPlayerCount > 0 then
		AddRuntimeStat(8, 3, nTodayRound, nPlayerCount);
	end
	
end

function checkTeams(teams)
	local i = 1;
	while i <= getn(teams) do
		DebugOutput(Val2Str(teams[i]))
		if teams[i][1] == 0 then
			tremove(teams, i);
		else
			i = i + 1;
		end
		DebugOutput(Val2Str(teams))
	end
	return teams;
end

function DayMatch:checkTodayRound(battleState, nTodayRound)
	local bEnable = 1;
	if nTodayRound >= MAX_ROUND_DAILY then
		SetStartTime(1);
		bEnable = nil;
	end
	SetRoundToday(nTodayRound + 1);
	return bEnable;
end

function DayMatch:gameover()
	
end

function DayMatch.sortPlayer(p1, p2)
	return  get_sort_value(p1) > get_sort_value(p2)
end

__empty_table = {}
function DayMatch.sortTeam(t1, t2)
--	if not t1 then
--		return 1;
--	end
--	if not t2 then
--		return nil;
--	end
	t1 = t1 or __empty_table
	t2 = t2 or __empty_table
	
	local l,r = get_sort_value(t1) , get_sort_value(t2)
	
	--DebugOutput("sortTeam",Val2Str(t1), Val2Str(t2), l, r)
	
	return l > r
end

function DayMatch.resettable(t)
	local t2 = {}
	t.n = nil;
	for k,v in t do
		tinsert(t2, v)
	end
	t2.n = nil;
	return t2;
end

g_tFightTeamWinAward = {
	[1 ] = 1 + 0,
	[2 ] = 1 + 0,
	[3 ] = 1 + 0,
	[4 ] = 1 + 0,
	[5 ] = 1 + 0,
	[6 ] = 1 + 0,
	[7 ] = 1 + 0,
	[8 ] = 1 + 2,
	[9 ] = 1 + 4,
	[10] = 1 + 8,
	[11] = 1 + 16,
	[12] = 1 + 30,
}

function DayMatch:OnFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName)
	if not winTeamID or winTeamID == 0 then
		return 
	end
	local winTimes = (g_tWinTimes[winTeamID] or 0) + 1;
	g_tWinTimes[winTeamID] = winTimes;
	--DayMatch:AddFightTeamScore(winTeamID, winTeamName, g_tFightTeamWinAward[winTimes]);
	local oldPidx = PlayerIndex
	local myTotalScore = 0
	
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		FireEvent("event_mission_affairs", "3v3", "finished", 0)
		gf_ModifyTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL, 1);
		gf_ModifyTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE, g_tFightTeamWinAward[winTimes]);
		P3v3_Msg2Player(format("TrËn nµy ®éi cña ng­¬i nhËn ®­îc %d ®iÓm", g_tFightTeamWinAward[winTimes]));
		myTotalScore = max(myTotalScore, GetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE));
	end
	--SendGlbDBData(2, format([[REPLACE INTO `XvX_FightTeam_Rank` VALUES ("%s", "%s", %d)]], winTeamName, "Ä³´óÏÀ", myTotalScore));
	PlayerIndex = oldPidx;
end

function DayMatch:AddFightTeamScore(winTeamID, winTeamName, nScore)
	--FightTeam_AddScore(winTeamID, nScore);
	sdb = SDB(SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0, 3);
	sdb.sortType = 2;
	sdb:modify(winTeamName, {"df", nScore, winTeamID});
	WriteLog(format("[ChiÕn ®éi nhËn ®iÓm] [iD=%f Name=%s] [Score=%d]", winTeamID, winTeamName, nScore));
end
--tPlayers = {}
--for i = 1, 64 do
--	tPlayers[i] = random(1,64);
--end
--print(Val2Str(tPlayers));
--function P3v3_GetPlayers()
--	return gf_UnPack(tPlayers)
--end
--function P3v3_GetTeams() 
--	return
--end
--function GetTask(TaskId)
--	return PlayerIndex;
--end
--function GetTeamSize(t1, t2) return 0 end
--function enterBattle_3v3(t1, t2)
--	print("enterBattle_3v3======>")
--	print("t1 = ", Val2Str(t1));
--	print("t2 = ", Val2Str(t2));
--end
--DayMatch:startARound()
