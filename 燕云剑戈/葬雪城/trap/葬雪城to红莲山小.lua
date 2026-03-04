Include("\\script\\missions\\yp\\hls\\head.lua")
function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5086 then 
	return
	end
--nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
SetFightState(1);
yp_rebornBiaoche(5078,1848,2734);
--SetDeathPunish(0)
--SetPKFlag(1,nCamp-1);
--ForbidChangePK(1)--禁止转换PK状态	
end;

