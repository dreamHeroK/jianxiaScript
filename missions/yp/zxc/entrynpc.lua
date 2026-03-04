Include("\\script\\missions\\yp\\zxc\\head.lua")

function enter(nType)
	nType = nType or GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		nType = 5;
	end			
	local nMapID = mf_GetMissionV(tbZXC.missionID,MV_MAP_ID,tbZXC.realMapID);
	if nMapID ~= 0 then
		tbZXC:Enter(nMapID,nType);
	else
		nMapID = tbZXC:Create();
		tbZXC:Enter(nMapID,nType);
	end
	SetDeathPunish(0)
end

function nothing()
	
end
--服-务器启动创建mission
function gameStart() 
  local nMapID = mf_GetMissionV(tbZXC.missionID,MV_MAP_ID,tbZXC.realMapID);
	if not nMapID then
  	return 0;
    end
	if nMapID == 0 then
		nMapID = tbZXC:Create();
	end
end

