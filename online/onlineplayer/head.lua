Include("\\script\\online\\onlineplayer\\define.lua")
Include("\\script\\online\\onlineplayer\\award.lua")
Include("\\script\\lib\\globalfunctions.lua")

function ol_IsOpen()
	return gf_CheckDuration(OL_START, OL_END);
end

function ol_OnlinePlayer()
	local nSvrPlayerCount = 0
	local PlayerTab = {}
	local player = FirstPlayer()
	local c = 1
	while (player > 0) do
		PlayerTab[c] = player	
		player = NextPlayer(player)
		c = c + 1
	end

	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = getn(PlayerTab);
	end;

	local nOldPlayer = PlayerIndex;
	for i = 1, nSvrPlayerCount do
		PlayerIndex = PlayerTab[i];
		if PlayerIndex > 0 then
			if IsOfflineLive() == 0 and IsStalling() == 0 and IsSleeping() == 0 then
				nRet, nItemIdx = gf_AddItemEx({2,95,615, 1, 4}, "ÔÚÏß¸£´ü");
			end	
		end;
	end
	PlayerIndex = nOldPlayer;
end

--Relay call
function ol_RelayOnlineGift(nRandSeed)
	if ol_IsOpen() ~= 1 then
		return 0;
	end
	randomseed(nRandSeed);
	ol_OnlinePlayer()
end
