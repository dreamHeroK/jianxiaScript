Import("\\script\\lib\\define.lua");
Import("\\script\\lib\\time.lua");

g_thisFile = "\\script\\misc\\fair\\fair_rank_callback.lua";
eCHARM_RANK_FAIR = 10
eCHARM_RANK_STAR = 11
g_szFairSDBKey = "FAIR_RANK_DATA";

function OnDataArriveGS(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	local _, bGlbRealm = GetRealmType()
	if bGlbRealm ~= 0 then --不在原服
		return 
	end
	if nCount <= 0 then
		return
	end
	BuildCharmRank(szKey, nKey1, nKey2);
end

function OnLoadFromSDB(nRankType)
	local _, bGlbRealm = GetRealmType()
	if bGlbRealm ~= 0 then --不在原服
		return 
	end
	if not nRankType then return end
	DelRelayShareDataCopy(g_szFairSDBKey, tf_GetWeekSequence(1, 0), nRankType)
	ApplyRelayShareData(g_szFairSDBKey, tf_GetWeekSequence(1, 0), nRankType, g_thisFile, "OnDataArriveGS")
end

function OnSaveToSDB(nRankType, _nPoint, nLastRankId)
	local _, bGlbRealm = GetRealmType()
	if bGlbRealm ~= 0 then --不在原服
		return 
	end
	local nPoint = 0;
	if nRankType == eCHARM_RANK_FAIR then
		 nPoint = GetTask(TASKID_FAIR_UP_FLAG)
	elseif nRankType == eCHARM_RANK_STAR then
		nPoint = GetTask(TASKID_FAIR_VALUE)
	else
		return
	end
	if not nRankType or not nPoint or not nLastRankId then return end
	if 	nRankType == eCHARM_RANK_FAIR  then
		AddRelayShareData(g_szFairSDBKey, 0, nRankType, "", "", 2, GetName(), "dd", GetTask(TASKID_FAIR_UP_FLAG), nLastRankId);
	else
		AddRelayShareData(g_szFairSDBKey, 0, nRankType, "", "", 2, GetName(), "dd", GetTask(TASKID_FAIR_VALUE), nLastRankId);
	end
end

