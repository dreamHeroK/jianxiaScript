Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

g_InfoHeader = "<color=green>武林特使<color>: "

function main()
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID) == 2 then
		Say(g_InfoHeader.."活动中,你不能离开华山地图。",0);
		return
	end

	Say(g_InfoHeader.."如此美丽的华山,你想离开吗?",
	2,
	"离开/LeaveMap",
	"结束对话/end_dialog"
	)
end

--玩家要求离开比赛场地
function LeaveMap()
	--当前申请人不是队长
--	if PlayerIndex ~= GetTeamMember(0) then
--		LeaveTeam();
--	end

--	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID) == 0 then
		MS_SetPlayerState(3);
		NewWorld(100,1420,2989);
		LeaveTeam();
--		return
--	end

--	local nOldSubWorld = SubWorld;
--	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID);
--	if SubWorld >= 0 then
		DelMSPlayer(MISSION_ID,0);
--	end;
--	SubWorld = nOldSubWorld;
end

function end_dialog()
end
