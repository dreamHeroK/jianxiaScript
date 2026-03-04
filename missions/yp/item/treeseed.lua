--树种
Include("\\script\\missions\\yp\\yp_head.lua");

function OnUse(nItemIndex)
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","少侠需要加入势力才能使用该物品！");
		return 0;
	end
	if tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"","只能在本势力地图种植树种！");
		return 0;
	end
	local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	if nPlantTime ~= 0 and GetTime() - nPlantTime > 150*60 then
		SetTask(TASK_FIELD_PVP_TREE_IDX,0);
		SetTask(TASK_FIELD_PVP_TREE_TIME,0);
		SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,0);
	end
	if GetTask(TASK_FIELD_PVP_TREE_IDX) ~= 0 or (nPlantTime ~= 0 and GetTime() - nPlantTime < 150*60) then
		Talk(1,"","您已经种植了太虚古树！");
		return 0;
	end
	local tScript = {
		"\\script\\missions\\yp\\tls\\mission.lua",
		"\\script\\missions\\yp\\hss\\mission.lua",
		"\\script\\missions\\yp\\mm\\mission.lua",
	}
	SendScript2VM(tScript[nCamp],"pl_useSeed()");
end