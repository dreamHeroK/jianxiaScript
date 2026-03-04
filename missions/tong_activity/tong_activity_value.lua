Include("\\script\\lib\\sdb.lua")
TongActivity_tTongValues = {
	-- [szTongName] = {
	-- 	[1] = {},
	-- 	[2] = {},
	-- 	...
	-- }
}
 TongActivity_nLastOperationTime = 0;
 TongActivity_nSAVETIME = 5;

TONGACTIVITY_SDBKEY = "tong_activity_20170523"

function TongActivity_OnSvrStart()
	if SubWorldID2Idx(150) < 0 then
		return
	end
	local sdb = SDB(TONGACTIVITY_SDBKEY, 0, 0);
	sdb:apply("\\script\\missions\\tong_activity\\tong_activity_value.lua", "TongActivity_LoadTongData")
end

function TongActivity_LoadTongData(szkey, nkey1, nkey2, nCount)
	local data = SDB(szkey, nkey1, nkey2, nCount);
    for i = 1, nCount do
        local tTmp = data["head"..i]
		local szTongName = tTmp[1];
		local nKey = tTmp[2];
		local nVar = tTmp[3];
        if TongActivity_tTongValues[szTongName] == nil then
		    TongActivity_tTongValues[szTongName] = {}
        end
		TongActivity_tTongValues[szTongName][nKey] = nVar;
    end
end

function TongActivity_SaveTongDataPer10min()
	if SubWorldID2Idx(150) < 0 then
		return
	end
	local isEmpty = 1;
	for k,v in TongActivity_tTongValues do
		isEmpty = 0;
		break;
	end
	if isEmpty == 1 then
		TongActivity_OnSvrStart();
		return
	end
	local nCurTime = GetTime()
	if nCurTime - TongActivity_nLastOperationTime < TongActivity_nSAVETIME then
		return
	end
    local sdb = SDB(TONGACTIVITY_SDBKEY, 0, 0);
    local i = 1;
    for key,var in TongActivity_tTongValues do
		local szTongName = key;
        local tTmp = var;
		for k,v in tTmp do
			local id = "head"..i;
			sdb[id] = {"sdd",szTongName,k,v}
			i = i + 1;
		end
    end
	sdb:apply("\\script\\missions\\tong_activity\\tong_activity_value.lua", "TongActivity_SaveTongData")
	TongActivity_nLastOperationTime = nCurTime;
end

function TongActivity_SaveTongData(szkey, nkey1, nkey2, nCount)

end

function TongActivity_SetTongValue( nKey, nVar )
	local szTongName = GetTongName();
	if TongActivity_tTongValues[szTongName] == nil then
		local tbTmp = {}
		tbTmp[nKey] = nVar;
		tbTmp[enumTongValue_ActivityOpenWeek] = tonumber(date("%Y%W"));
		TongActivity_tTongValues[szTongName] = tbTmp;
	else
		TongActivity_CheckTskDate(szTongName)
		TongActivity_tTongValues[szTongName][nKey] = nVar;
	end
end

function TongActivity_CheckTskDate( szTongName )
	local nWeek = tonumber(date("%Y%W"))
	if TongActivity_tTongValues[szTongName][enumTongValue_ActivityOpenWeek] == nil then
		TongActivity_ClearTongTsk(szTongName)
		return 
	end
	if TongActivity_tTongValues[szTongName][enumTongValue_ActivityOpenWeek] < nWeek then
		TongActivity_ClearTongTsk(szTongName)
		return 
	end
end

function TongActivity_ClearTongTsk( szTongName )
	for key,var in TongActivity_tTongValues[szTongName] do
		TongActivity_tTongValues[szTongName][key] = 0
    end
	TongActivity_tTongValues[szTongName][enumTongValue_ActivityOpenWeek]  =  tonumber(date("%Y%W"))
end

function TongActivity_GetTongValue( nKey )
	local szTongName = GetTongName();
	if TongActivity_tTongValues[szTongName] == nil then
		return 0;
	end
	TongActivity_CheckTskDate(szTongName)
	if TongActivity_tTongValues[szTongName][nKey] == nil then
		return 0
	end
	return TongActivity_tTongValues[szTongName][nKey]
end


function TongActivity_OnCrossWeek()
	if SubWorldID2Idx(150) < 0 then
		return
	end
	TongActivity_tTongValues = {}
	local sdb = SDB(TONGACTIVITY_SDBKEY, 0, 0);
    sdb:delete()
	sdb:reflash()
end