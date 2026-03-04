Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()
	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end;
	Msg2MSAll(MISSIONID, "单挑擂台赛战斗结束，"..GetMissionS(1).." 与 "..GetMissionS(2).."双方平局！");
	str = GetMissionS(CITYID).." - "..MapTab[GetMissionV(MS_ROOMINDEX)][3].."单挑擂台赛战斗结束，"..GetMissionS(1).." 与 "..GetMissionS(2).."双方平局！;
	--51活动发奖
		if Is51PartyTime() == 1 and Is2PlayerLevelOK() == 1 then
			Award2Player();
		end
	--师徒任务
	process_master_task()
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
		AddGlobalNews(str);
	end;
	--WinBonus(3);
	SetMissionV(MS_STATE,3);
	CloseMission(MISSIONID);
end;
