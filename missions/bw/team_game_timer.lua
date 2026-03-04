Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

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
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2);		
	end
end

--准备阶段信息处理
function ReportReadyState(nTimeState)
	local news_str = "";
	local nMin = 0; 
	local nSec = 0;
	local nReportTime = 0;
	local nTeamNum = GetGameTeamNum();
	local i = 0;

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达15分钟以后判断场内当前情况
	if nTimeState >= TEAM_READY_TIME_AWARD then 
	
		--比赛开始时比赛人数少等于1人
		if nTeamNum <= 1 then			
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				if GetMissionV(GAME_TYPE) == 4 then
					--返还入场费给队长
					Earn(TEAM_GAME_MONEY);
					for i=1,gf_GetTeamSize() do
						if gf_GetTeamMember(i) > 0 then					
							PlayerIndex = gf_GetTeamMember(i)
							Say("由于参加此组队混战擂台的人数不足2人，因此无法组织比赛！现在偿还您<color=yellow>2金<color>入场费!",0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer
			
			news_str = "参加人数不足，已取消比赛！";
			Msg2MSAll(TEAM_MISSION_ID,news_str);	
			--由于涉及入场费因此不作延时处理，怕玩家在延时阶段进来而使收取入场费不能退还				
			SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--删去退出Npc			 
			SetMissionV(TEAM_GAME_STATE,3);
			CloseMission(TEAM_MISSION_ID);
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
						Talk(1,"","组队混战擂台正式开始，当前参与比赛共<color=yellow>"..nTeamNum.."<color>人。")
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
	
	--其他信息处理
	
	nMin = floor((TEAM_READY_TIME_AWARD - nTimeState) / 3);
	nReportTime = mod(floor((TEAM_READY_TIME_AWARD - nTimeState) / 3),3);
	nSec = mod((TEAM_READY_TIME_AWARD - nTimeState),3) * 20;
	
	--每个三分钟一个信息
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "组队混战擂台准备时间还剩"..nMin.."分钟，参与人数："..nTeamNum.."人。";
		Msg2MSAll(TEAM_MISSION_ID, news_str);
		Msg2SubWorld("组队混战擂台即将开始，诚邀各位英雄侠士尽快参加，准备时间还剩下"..nMin.."分钟，参与人数："..nTeamNum.."人。");
	elseif (nMin == 0) then
		news_str = "组队混战擂台准备时间还剩" ..nSec.. "秒，参与人数："..nTeamNum.."人。";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	end
end


--开战阶段战况报告
function ReportBattleState(nTimeState)
	local news_str = "";
	local i=0;
	local j=0;
	local k=0;
	local nMin = 0; 
	local nSec = 0;
	local nWinCaptianName = "";
	local nKillNum = 0;
	local nDeadNum = 0;
	local nPlayerMSIndex = 0;
	local nDate = 0;
	local nCaptainState = 0;
	local nTeamNum = 0;
	local nTeamNumLife = 0;
	local WinnerTab = {};
	local Winner_info = {};
	local Winner_News = {};
	local nCaptainName = "";
	local nBonus = 0;
	local Bonus_str = "";
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
--						if GetMissionV(GAME_TYPE) == 3 then
--							PayAward(3);
--						end
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
	
	--延迟退出
 	if GetMissionV(DELAY_STATE) == 1 then
 		SetMissionV(DELAY_STATE,0);
 		SetMissionV(TEAM_GAME_STATE,3);
 		CloseMission(TEAM_MISSION_ID);
 		return
 	end
 	
 	nTeamNumLife = GetGameTeamNumByLife();
	
	--只剩下一个队伍
	if nTeamNumLife <= 1 then
		if GetMissionV(DELAY_STATE) == 0 then		
			OldPlayer = PlayerIndex;
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then				
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					if GetMissionV(GAME_TYPE) == 4 then
						nBonus = floor(GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)
						Bonus_str = TurnMoneyFormat(nBonus);
						Earn(nBonus);
					end
					nWinCaptianName = GetName();
					--对胜利队伍发放常规奖励
					for j=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(j);
						if PlayerIndex > 0 then
							if GetMissionV(GAME_TYPE) == 3 then
								PayAward(4);
								news_str = "比赛结束了，赢得这场比赛的队伍是<color=yellow>"..nWinCaptianName.."<color> ，请稍等，即将被传出比赛场地！";
							elseif GetMissionV(GAME_TYPE) == 4 then
								news_str = "比赛结束了，赢得这场比赛的队伍是<color=yellow>"..nWinCaptianName.."<color>，按照规则将获得"..Bonus_str.."奖励！请稍等，即将被传出比赛场地！";
							else
								news_str = "比赛结束了，赢得这场比赛的队伍是<color=yellow>"..nWinCaptianName.."<color>，请稍等，即将被传出比赛场地！";
							end
							Say(news_str,0);
						end
					end
					break;				
				end
			end
			
			PlayerIndex = OldPlayer;
			
			SetMissionV(DELAY_STATE,1);
			news_str = "比赛已经结束，队伍"..nWinCaptianName.."获得胜利，请稍等，即将被传出比赛场地！";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			Msg2SubWorld(nWinCaptianName.."在游戏结束之前，击败对手的任何队伍都将获胜！");
			AddGlobalNews(nWinCaptianName.."在游戏结束之前，击败对手的任何队伍都将获胜！");
			return
		end
	end
	
	--战斗结束
 	if nTimeState >= TEAM_GAME_TIME_AWARD then
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
									news_str = "比赛结束，这场比赛的获胜的是<color=yellow>"..nWinCaptianName.."<color>队伍，请稍等，即将被传出比赛场地！";
									Say(news_str,0);
									news_str = "比赛结束，这场比赛的获胜的是"..nWinCaptianName.."队伍，请稍等，即将被传出比赛场地！"
									Msg2MSAll(TEAM_MISSION_ID,news_str);
								end
							end
							break;
						--end
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--获得队伍杀人数目由大到小排序的队长index的list
			
			nBonus = floor((GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)/getn(WinnerTab[1]));
			Bonus_str = TurnMoneyFormat(nBonus);

			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				if GetMissionV(GAME_TYPE) == 4 then
					Earn(nBonus);
				end
				for j=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(j);
					if PlayerIndex > 0 then
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			--所有队伍杀人数目均为0，比赛判为和局
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "这场比赛没有人员伤亡，这场比赛为平局。请稍等，即将被传出比赛场地！";
			else
				news_str = "比赛结束了，赢得这场比赛的队伍是"
				for i=1,getn(Winner_News) do			
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>人。";
						if GetMissionV(GAME_TYPE) == 4 then 
							news_str = news_str.."按照规则将获得"..Bonus_str.."奖励，请稍等，即将被传出比赛场地！";
						end
						nCaptainName = nCaptainName..Winner_News[i][1];
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>人。 "
						nCaptainName = nCaptainName..Winner_News[i][1]..",";
					end
				end
			end
			
			--向场内所有角色发送比赛结果
			OldPlayer = PlayerIndex;
			nPlayerMSIndex = 0;
			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do	
				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
				if PlayerIndex > 0 then
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			
			--向胜利队伍发常规奖励
			if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex;
				for i=1,getn(WinnerTab[1]) do
					PlayerIndex = WinnerTab[1][i];
					if PlayerIndex > 0 then
						for j=1,gf_GetTeamSize() do
							PlayerIndex = gf_GetTeamMember(i);
							if PlayerIndex > 0 then
								PayAward(4);
							end
						end
					end
				end
				PlayerIndex = OldPlayer;
			end

			--向失败队伍发放常规奖励
			if GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex
				for i=1,10 do
					nPlayerMSIndex = 0;
					for j=1,GetMSPlayerCount(TEAM_MISSION_ID,i) do
						nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,i);
						if PlayerIndex > 0 then
							--如果没有胜者则所有人均能得奖励
							if GetMissionV(DECEDEND_NUM) == 0 then
								PayAward(3);
							else
								for k=1,getn(WinnerTab[1]) do
									if gf_GetTeamMember(0) == WinnerTab[1][k] then
										nCaptainState = 1;
										break
									end
								end
								--如果为胜利队伍则不发奖励
								if nCaptainState ~= 1 then
									PayAward(3);
								end
								nCaptainState = 0;
							end
						end
					end
				end			
				PlayerIndex = OldPlayer;
			end
			
			SetMissionV(DELAY_STATE,1);
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "比赛结束了，这场比赛是平局。"
			else 
				news_str = "比赛结束了，获胜者是："..nCaptainName.."的队伍。"
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME_AWARD - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME_AWARD - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTeamNum.."个队伍，离比赛结束还有"..nSec.."秒。");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTeamNum.."个队伍，离比赛结束还有"..nMin.."分钟。");
	end
	
end
