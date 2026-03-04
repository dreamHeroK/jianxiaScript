Include("\\script\\missions\\yp\\hls\\head.lua")

function enter(nType)
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		nType = 5;
	end			
	local nMapID = mf_GetMissionV(tbHLS.missionID,MV_MAP_ID,tbHLS.realMapID);
	if nMapID ~= 0 then
		tbHLS:Enter(nMapID,nType);
	else
		nMapID = tbHLS:Create();
		tbHLS:Enter(nMapID,nType);
	end
	SetDeathPunish(0)
end

function nothing()
	
end
--服-务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbHLS.missionID,MV_MAP_ID,tbHLS.realMapID);
	if not nMapID then
  	return 0;
    end
	if nMapID == 0 then
		nMapID = tbHLS:Create();
	end
end

