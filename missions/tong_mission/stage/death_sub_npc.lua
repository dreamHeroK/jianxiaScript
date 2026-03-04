--create date:2007-07-30 9:32
--author:yanjun
--describe:替补区小怪死亡脚本
Include("\\script\\missions\\tong_mission\\main_function.lua");
function OnDeath(nNpcIdx)
	local nKillCount = GetMissionV(MV_KILL_SUB_NPC);
	SetMissionV(MV_KILL_SUB_NPC,nKillCount+1);
	if mod(nKillCount+1,50) == 0 then
		Msg2MSAll(MISSION_ID,"目前已清除了"..(nKillCount+1).."个禁卫兵");
	end;
end;