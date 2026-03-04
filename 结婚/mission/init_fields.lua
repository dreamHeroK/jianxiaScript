Include("\\script\\结婚\\marriage_head.lua");
function main()
	if GetGlbValue(GLB_CLOSE_FIELD) == 1 then
		WriteLog("[结婚]: 结婚场地已关闭。")
		return 0;
	end;
	local nHour = tonumber(date("%H"));
	if nHour == 11 or nHour == 12 then
		for i=1,getn(map_fieldpos) do
			mf_OpenMission(MISSION_ID,map_fieldpos[i][1])
		end;
		Msg2SubWorld(map_period[1][5].."时段的结婚场地已经可以进入了");
	elseif nHour == 17 or nHour == 18 then
		for i=1,getn(map_fieldpos) do
			mf_OpenMission(MISSION_ID,map_fieldpos[i][1])
		end;
		Msg2SubWorld(map_period[2][5].."时段的结婚场地已经可以进入了");	
	elseif nHour == 20 or nHour == 21 then
		for i=1,getn(map_fieldpos) do
			mf_OpenMission(MISSION_ID,map_fieldpos[i][1])
		end;
		Msg2SubWorld(map_period[3][5].."时段的结婚场地已经可以进入了");	
	end;
end;