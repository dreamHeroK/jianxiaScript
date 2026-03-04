Include("\\script\\gongcheng\\mission\\mission_head.lua");
function OnTimer()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_GONGCHENG then--
		mf_OperateAllPlayer(MISSION_ID,daqiziTimer,{},ALL_ID);
		local  nNpcIdx = GC_FindNpc("成都大旗");
        BR_SetCurrentNpcSFX(nNpcIdx,1009);  
	end;
end;

function daqiziTimer()
local nOldPlayerIndex = PlayerIndex;
local nMapId,nX,nY = GetWorldPos()	--获得触发事件的玩家的坐标
local nPlayerCamp = GCZ_GetPlayerCamp();
local gongjifen = GetMissionV(MV_NORMAL_FLAG2_OWNER)
local shoujifen = GetMissionV(MV_NORMAL_FLAG3_OWNER)
	local n2Map, n2X, n2Y = 5100,1762,3560
	if nMapId == n2Map then	 
	   nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, n2Map, n2X, n2Y);   --位置
	if nDistEast >= 0 and nDistEast <= 18 then  
	if nPlayerCamp == GONG_ID then
	SetMissionV(MV_NORMAL_FLAG2_OWNER,gongjifen+1);
	elseif nPlayerCamp == SHOU_ID then
	SetMissionV(MV_NORMAL_FLAG3_OWNER,shoujifen+1);
	end		
    end;
	end;
	PlayerIndex = nOldPlayerIndex;
--Msg2Player("攻:"..gongjifen.."      守:"..shoujifen.."");
end


tExistNpcList = {

};

function GC_FindNpc(szName)
	local nMapId = 5100;
	if tExistNpcList[nMapId] then
		for k, v in tExistNpcList[nMapId] do
			if v == szName and GetNpcName(k) == szName then
				return k;
			end
		end
	end
	
	local tNpcIdx = GetMapNpcIdx(nMapId);
	if not tNpcIdx then return 0; end
	for i = 1, getn(tNpcIdx) do
		if GetNpcName(tNpcIdx[i]) == szName then
			return tNpcIdx[i];
		end
	end
	return 0;
end