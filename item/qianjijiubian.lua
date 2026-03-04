--使用千机九变之后执行的脚本
Include("\\script\\task\\global_task\\gtask_head.lua");

_QJJBMAPS = {306,319,320,328,325,307,}

function OnUse()
	local nMapId, nX, nY = GetWorldPos();
	local flagEast = 0;
	local nLevel = GetLevel();
	local nKill = 300;
	if (tGtTask:check_cur_task(513) == 1 or tGtTask:check_cur_task(514) == 1 or tGtTask:check_cur_task(552) == 1 or tGtTask:check_cur_task(563) == 1 or tGtTask:check_cur_task(565) == 1 or tGtTask:check_cur_task(566) == 1 or tGtTask:check_cur_task(635) == 1 or tGtTask:check_cur_task(636) == 1 or tGtTask:check_cur_task(831) == 1 or tGtTask:check_cur_task(863) == 1 or tGtTask:check_cur_task(864) == 1) then	
	
		if (checkQJJBMaps(nMapId) == 1) then
			local nTime = 2 * 60 * 18;
			if nLevel <= 10 then
				nKill = 300
			elseif nLevel > 11 and nLevel <= 30 then
				nKill = 700
			elseif nLevel > 31 and nLevel <= 50 then
				nKill = 1300
			elseif nLevel > 51 and nLevel <= 80 then
				nKill = 2100
			elseif nLevel >= 81 then
				nKill = 3000
			end
			CastState("state_damage_against_ghost", nKill, nTime, 1, 122601);
			CastState("state_att_rate_against_ghost", nKill, nTime, 1, 122602);
			SyncCustomState(1, 122601, 1, "对阴属性伤害增加");
			SyncCustomState(1, 122602, 1, "对阴属性命中增加");
			Msg2Player("你使用了千机九变，改变阴怪属性，持续时间为2分钟。")
			return
		else
			Talk(1,"","只能在指定的地图使用千机九变。");
			return
		end;
	else
		Talk(1,"","很奇怪，你没有接到任务，怎么会有这个道具？");
	end;
end;

function checkQJJBMaps(mapid) --检测mapid
	for i=1,getn(_QJJBMAPS) do
		if(mapid == _QJJBMAPS[i]) then return 1 end
	end
	return nil
end
