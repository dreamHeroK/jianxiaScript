Include("\\script\\missions\\yp\\qmy\\head.lua")
function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5085 then 
	return
	end

--nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
SetFightState(1);
yp_rebornBiaoche(5077,1929,3567);
--SetDeathPunish(0)
--SetPKFlag(1,nCamp-1);
--ForbidChangePK(1)--禁止转换PK状态	
end;

