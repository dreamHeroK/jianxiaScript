Include("\\script\\missions\\yp\\slymg\\head.lua")
Include("\\script\\lib\\define.lua")

function enter(nType)	
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID = mf_GetMissionV(tbSLYMG.missionID,MV_MAP_ID,tbSLYMG.realMapID);
	if nMapID ~= 0 then
		tbSLYMG:Enter(nMapID,nType);
	else
		nMapID = tbSLYMG:Create();
		tbSLYMG:Enter(nMapID,nType);
	end
end

function nothing()
	
end

--服务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbSLYMG.missionID,MV_MAP_ID,tbSLYMG.realMapID);
	if not nMapID then
  	return 0;
  end
	if nMapID == 0 then
		nMapID = tbSLYMG:Create();
	end
end