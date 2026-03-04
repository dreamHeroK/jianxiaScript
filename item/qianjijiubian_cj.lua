--使用千机九变之后执行的脚本
Include("\\script\\task\\global_task\\gtask_head.lua");

_QJJBMAPS = {306,319,320,328,325,307,}

function OnUse()
	local nMapId, nX, nY = GetWorldPos();
	local nLevel = GetLevel();
	local nKill = 1000;
--	if (checkQJJBMaps(nMapId) == 1) then
		local nTime = 2 * 60 * 18;
		if nLevel <= 60 then
			nKill = 2500
		elseif nLevel > 61 and nLevel <= 70 then
			nKill = 3500
		elseif nLevel > 71 and nLevel <= 80 then
			nKill = 4500
		elseif nLevel > 81 and nLevel <= 85 then
			nKill = 7000
		elseif nLevel >= 85 then
			nKill = 8000
		end
		CastState("state_damage_against_ghost", nKill, nTime, 1, 122603);
		CastState("state_att_rate_against_ghost", nKill, nTime, 1, 122604);
		SyncCustomState(1, 122603, 1, "对阴属性伤害增加");
		SyncCustomState(1, 122604, 1, "对阴属性命中增加");
		Msg2Player("你使用了千机九变，改变阴怪属性，持续时间为2分钟。")
		return
--	else
--		Talk(1,"","只能在指定的地图使用千机九变。");
--		return
--	end;
end;

function checkQJJBMaps(mapid) --检测mapid
	for i=1,getn(_QJJBMAPS) do
		if(mapid == _QJJBMAPS[i]) then return 1 end
	end
	return nil
end
