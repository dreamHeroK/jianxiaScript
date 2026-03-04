--凝冰诀
Include("\\script\\lib\\define.lua");
function OnUse(index)
	if 0 == GetItemCount(2, 95, 1510) then
		return 0;
	end
--	if CheckCanUse_1() ~= 1 then
--		Talk(1, "", "凝冰诀只能在太一塔中使用");
--		return 0;
--	end
	
	SetItemUseLapse(tonumber(index), 8*18);
	CastState("state_invincibility", 100, 4*18, 0, 10001);
end

function CheckCanUse_1()
	local nMap = GetMapTemplate(SubWorld);
	if 8009 ~= nMap or 1 == GetTask(TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN) then
		return 0;
	end
	
	if 5 ~= GetMissionV(99) then
		return 0;
	end
	
	return 1;
end
