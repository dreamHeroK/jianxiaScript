Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;
nReadyState = 0;

function OnTimer()
	local nTimeState = 0;
	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);
	--准备阶段
	if nMapState == 1 then
		ReportReadyState(nTimeState);
	--比赛中
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--比赛结束
	elseif nMapState == 3 then 
		Msg2MSAll(TEAM_MISSION_ID,"比赛结束！");
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID1);
	end
end

--准备阶段信息处理
function ReportReadyState(nTimeState)
	local news_str = "";
	local nMin = 0; 
	local nSec = 0;
	local nTeamNum = GetGameTeamNum();

	if GetMissionV(READY_STATE) == 1 then
		SetMissionV(READY_STATE,0);
		SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--删去退出Npc			 
		SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
		return
	end

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达3分钟以后判断场内当前情况
	if nTimeState >= TEAM_READY_TIME then 
		
		--比赛开始时比赛队伍数少等于1队
		if nTeamNum <= 1 then
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				for i=1,gf_GetTeamSize() do
					if gf_GetTeamMember(i) > 0 then					
						PlayerIndex = gf_GetTeamMember(i)
						Say("由于参加此组队混战擂台的人数不足2人，因此无法组织比赛！报名费将退还给队长。请稍候，即将被传出比赛场地！",0);
					end
				end
			end
			PlayerIndex = OldPlayer
			news_str = "参加人数不足，已取消比赛！";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			SetMissionV(READY_STATE,1);
			return
		end
		
		--比赛开始处理
		
		OldPlayer = PlayerIndex
		
		for i=1,nTeamNum do	
			nCaptainIndex = GetMissionV(CAPTAIN_ID+i-1);
			if nCaptainIndex > 0 then
				PlayerIndex = nCaptainIndex;
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						Talk(1,"","组队混战擂台正式开始，当前参与比赛共<color=yellow>"..nTeamNum.."<color>个队伍！")
					end
				end
			end
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "组队混战擂台正式开始";
		Msg2MSAll(TEAM_MISSION_ID,news_str);             
		RunMission(TEAM_MISSION_ID);
		return
	end
	
	--比赛尚未开始前的信息处理
	
	nMin = floor((TEAM_READY_TIME - nTimeState) / 3);
	nSec = mod((TEAM_READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "组队混战擂台准备时间还剩"..nMin.." 分钟，参与队伍："..nTeamNum.."个! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	elseif (nMin == 0) then
		news_str = "组队混战擂台准备时间还剩" ..nSec.. "秒，参与队伍："..nTeamNum.."个! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	end
	
end


--开战阶段战况报告
function ReportBattleState(nTimeState)
	local news_str = "";
	local i=0;
	local j=0;
	local nMin = 0; 
	local nSec = 0;
	local nWinCaptianName = "";
	local nKillNum = 0;
	local nDeadNum = 0;
	local nPlayerMSIndex = 0;
	local nTeamNum = 0;
	local nTeamNumLife = 0;
	local WinnerTab = {};
	local Winner_info = {};
	local Winner_News = {};
	local nCaptainName = "";
	local nPlayerName = "";
	local TeamMember = {};

	--若队伍被全灭则传送出赛场
	OldPlayer = PlayerIndex;
	for i=1,10 do
		nDeadNum = 0;
		PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if PlayerIndex > 0 then
			for j=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(j);
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeadNum = nDeadNum + 1;
					end
				end 
			end
			if nDeadNum == gf_GetTeamSize() then
--				for j=1,gf_GetTeamSize() do
--					PlayerIndex = gf_GetTeamMember(j);
--					if PlayerIndex > 0 then
--						tinsert(TeamMember,PlayerIndex);
--					end
--				end
--				for j=1,getn(TeamMember) do
--					PlayerIndex = TeamMember[j];
					PlayerIndex = gf_GetTeamMember(0);
					--Msg2Player("由于你所在的队伍全灭，现把你们队伍传出赛场。");
					DelMSPlayer(TEAM_MISSION_ID,0);
				--end
			end
		end	
	end
	PlayerIndex = OldPlayer
	
	--延时退出
	if GetMissionV(DELAY_STATE) == 1 then
		SetMissionV(DELAY_STATE,0);
		SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
		return
	end
	
	nTeamNumLife = GetGameTeamNumByLife();

	--当前场地只剩下一个队伍
	if nTeamNumLife <= 1 then
	
		if GetMissionV(DELAY_STATE) == 0 then
		
			OldPlayer = PlayerIndex;
			
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					nWinCaptianName = GetName();
					for j=1,gf_GetTeamSize() do
						if gf_GetTeamMember(j) > 0 then
							PlayerIndex = gf_GetTeamMember(j);
							news_str = "比赛结束，这场比赛的获胜的是<color=yellow>"..nWinCaptianName.."<color>的队伍，请稍等，即将被传出比赛场地！";
							Say(news_str,0);
						end
					end
					break;
				end
			end
					
			PlayerIndex = OldPlayer; 	
			
			SetMissionV(DELAY_STATE,1);
			
			news_str = "比赛结束，这场比赛的获胜的是"..nWinCaptianName.."的队伍，请稍等，即将被传出比赛场地！";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
		
	end
	
	--战斗结束
	
 	if nTimeState >= TEAM_GAME_TIME then
 		
 		if GetMissionV(DELAY_STATE) == 0 then
 			
 			--比赛结束去除角色身上所有状态和停止战斗
 			nPlayerMSIndex = 0;
 			OldPlayer = PlayerIndex;
 			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
 				if PlayerIndex > 0 then
 					SetFightState(0);
 					RemvoeTempEffect();
 				end
 			end
 			PlayerIndex = OldPlayer;
 		
 			if nTeamNumLife <= 1 then
 			
 				for i=1,10 do
					if GetMissionV(CAPTAIN_ID+i-1) > 0 then
						PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
						--if IsPlayerDeath() == 0 then
							nWinCaptianName = GetName();
							for j=1,gf_GetTeamSize() do
								if gf_GetTeamMember(j) > 0 then
									PlayerIndex = gf_GetTeamMember(j);
									news_str = "比赛结束，这场比赛的获胜的是<color=yellow>"..nWinCaptianName.."<color>的队伍，请稍等，即将被传出比赛场地！";
									Say(news_str,0);
									news_str = "比赛结束，这场比赛的获胜的是"..nWinCaptianName.."的队伍，请稍等，即将被传出比赛场地！"
									Msg2MSAll(TEAM_MISSION_ID,news_str);
								end
							end
						--end
						break;
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--获得队伍杀人数目由大到小排序的队长index的list
			
			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			news_str = "比赛结束了，赢得这场比赛的队伍是"
			
			for i=1,getn(Winner_News) do
				if i == getn(Winner_News) then
					nPlayerName = nPlayerName..Winner_News[i][1].."."
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>，请稍等，即将被传出比赛场地！";
					nCaptainName = nCaptainName..Winner_News[i][1];
				else
					nPlayerName = nPlayerName..Winner_News[i][1]..","
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>。"
					nCaptainName = nCaptainName..Winner_News[i][1]..",";
				end
			end
			
			--向场内所有角色发送比赛结果
			OldPlayer = PlayerIndex
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then
					nPlayerName = nPlayerName..GetName();
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					for j=1,gf_GetTeamSize() do
						if gf_GetTeamMember(j) > 0 then
							PlayerIndex = gf_GetTeamMember(j);
							Say(news_str,0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer;
			SetMissionV(DELAY_STATE,1);
			news_str = "比赛结束，这场比赛的获胜的是"..nCaptainName.."的队伍，请稍等，即将被传出比赛场地！"
			Msg2MSAll(TEAM_MISSION_ID, news_str);    	
 			return
 		end 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTeamNum.."个队伍，离比赛结束还有"..nSec.."秒。");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTeamNum.."个队伍，离比赛结束还有"..nMin.."分钟。");
	end
	
end