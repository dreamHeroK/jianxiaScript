Import("\\script\\lib\\define.lua");

g_thisFile = "\\script\\global\\charm_rank_callback.lua";

g_tRankType = {
	RANK_GLOBAL						= 0,
	RANK_MONTHLY_COLLECT_COAT		= 1,
	RANK_MONTHLY_COLLECT_HORSE		= 2,
	--RANK_MONTHLY_COLLECT_FOLLOWER	= 3,
	RANK_MONTHLY_COLLECT_ORNAMENT	= 3,
	RANK_MONTHLY_GIFT_COLLECTION	= 4,
	--RANK_COMBAT_POWER				= 6,
	--eCHARM_RANK_PLAYER_WORTH		= 7,
};

g_szSDBKey = "CHARM_RANK_DATA";

g_tCache = {};

g_nDailyRequest = 0;

function OnDataArriveGS(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	BuildCharmRank(nKey2);
end

function OnLoadFromSDB(nRankType)
	if not nRankType then return end
	DelRelayShareDataCopy(g_szSDBKey, 0, nRankType)
	ApplyRelayShareData(g_szSDBKey, 0, nRankType, g_thisFile, "OnDataArriveGS")
end

function OnSaveToSDB(nRankType, nCharmPoint, nLastRankId)
	if not nRankType or not nCharmPoint or not nLastRankId then return end
	
	if nRankType == g_tRankType.RANK_GLOBAL or nRankType == g_tRankType.RANK_COMBAT_POWER or nRankType == g_tRankType.eCHARM_RANK_PLAYER_WORTH then
		AddRelayShareData(g_szSDBKey, 0, nRankType, "", "", 2, GetName(), "dd", nCharmPoint, nLastRankId);
	else
		local szPlayerName = GetName();
		tinsert(g_tCache, {nRankType, szPlayerName, nCharmPoint, nLastRankId});
		
		local nDate = tonumber(date("%Y%m%d"));
		if g_nDailyRequest < nDate then
			CheckClearOldDataAndSave();
		else
			Save();
		end
	end
end

function Save()
	g_tCache.n = nil;
	for k, v in g_tCache do
		local nRankType = v[1];
		local szName	= v[2];
		local nPoint	= v[3];
		local nLastRankId = v[4];
		
		AddRelayShareData(g_szSDBKey, 0, nRankType, "", "", 2, GetName(), "dd", nPoint, nLastRankId);
	end
	g_tCache = {};
end

function CheckClearOldDataAndSave()
	ApplyRelayShareData(g_szSDBKey, 1, 0, g_thisFile, "ReadLastMonthTime_CB");
end

function ReadLastMonthTime_CB(szKey, nKey1, nKey2, nCount)
	local nMonth = tonumber(date("%Y%m"));
	
	if 0 == nCount then
		Save();
	else
		local nOldMonth = GetRelayShareDataByKey(szKey, nKey1, nKey2, "LAST_MODIFY_MONTH");
		
		if nOldMonth < nMonth then
			for i = g_tRankType.RANK_MONTHLY_COLLECT_COAT, g_tRankType.RANK_MONTHLY_COLLECT_ORNAMENT do
				ClearRelayShareData(g_szSDBKey, 0, i, "", "");
			end
			ClearRelayShareData(g_szSDBKey, 0, g_tRankType.RANK_MONTHLY_GIFT_COLLECTION, g_thisFile, "ClearMonthlyRankData_CB");
		else
			Save();
		end
	end
	
	AddRelayShareData(g_szSDBKey, 1, 0, "", "", 2, "LAST_MODIFY_MONTH", "d", nMonth);
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function ClearMonthlyRankData_CB(szKey, nKey1, nKey2, nCount)
	g_nDailyRequest = tonumber(date("%Y%m%d"));
	Save();
end

function OnRelayTriggerUpdateData()
	for i = g_tRankType.RANK_GLOBAL, g_tRankType.RANK_MONTHLY_GIFT_COLLECTION do
		DelRelayShareDataCopy(g_szSDBKey, 0, i);
		ApplyRelayShareData(g_szSDBKey, 0, i, g_thisFile, "OnDataArriveGS");
	end
	g_nDailyRequest = tonumber(date("%Y%m%d"));
end
