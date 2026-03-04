--to天龙寺
Include("\\script\\missions\\yp\\tls\\entrynpc.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapId,nX,nY = GetWorldPos();
	if qht_map_allow({6021}, nMapId) == 1 then  --加个条件，不然可以从这传送到天龙寺
		return 0;
	end	
	if nCamp ~= 1 then
		Msg2Player("不是大理势力玩家无法从天龙寺进入");
		return 0;
	end
	if GetPKValue() >= 10 then
		Msg2Player("你的PK大于10,无法传送");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","组队状态无法进入!");
		return 0;
	end
	enter();
	SetPos(1596,2762);
	SetFightState(0);
end