Include("\\script\\missions\\yp\\slymg\\head.lua")

function OnDeath(id, f, x)
	local m = GetWorldPos();
	local tTempRev = nil;
	local nIndex = nil;
	if m == 7111 then
		local tTempRev = SLYMG_TEMP_REV1;
		local nIndex = GetTask(TASK_FIELD_PVP_CAMP);
		if nIndex == 0 then nIndex = 5; end
		SetTempRevPos(tTempRev[nIndex][1], tTempRev[nIndex][2] * 32, tTempRev[nIndex][3] * 32);
	else
		SetTempRevPos(7111, 1708 * 32, 3407 *32);
		SetTempRevScript("\\script\\missions\\yp\\slymg\\player_death.lua");
	end
	local szKiller = nil;
	local szName = GetName();
	local nDeathIndex = PlayerIndex;
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
		PlayerIndex = nKillerIndex;
		szKiller = GetName();
		Msg2Player(format("B¹n tiªu diÖt [%s]!", szName));
		PlayerIndex = nDeathIndex;
		Msg2Player(format("B¹n bÞ [%s] tiªu diÖt råi!", szKiller));
		Msg2Map(m, format("Ng­êi ch¬i %s ®¸nh óp ng­êi ch¬i %s, ng­êi ch¬i %s bÞ th­¬ng rêi khái", szKiller, szName, szName));
	end	
end

function OnRevive()
	SetPlayerScript("\\script\\missions\\yp\\slymg\\mission.lua");
	SendScript2VM("\\script\\missions\\yp\\slymg\\mission.lua", "tbSLYMG:onLogin()");	
end