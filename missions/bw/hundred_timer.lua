Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

function OnTimer()
	local nTimeState = 0;
	nMapState = GetMissionV(MULTIMAP_STATE);
	nTimeState = GetMissionV(MULTIMAP_NEWS_STATE) + 1;
	SetMissionV(MULTIMAP_NEWS_STATE,nTimeState);
	--准备阶段
	if nMapState == 1 then 
		ReportReadyState(nTimeState);
	--比赛中
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--比赛结束
	elseif nMapState == 3 then  
		Msg2MSAll(MULIT_MISSION_ID, "比赛结束！");
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);		
	end;
end;

--准备阶段信息处理
function ReportReadyState(nTimeState)
	local news_str = "";
	local nMin = 0; 
	local nSec = 0;
	local nReportTime = 0
	local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
	local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)
	local PlayerMSIndex = 0;
	local nPlayerIndex = 0;
	local PlayerIndexTab = {};

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达15分钟以后判断场内当前情况
	if nTimeState >= HUNDRED_READY_TIME then 
		--比赛开始时比赛人数少等于1人
		if nTotalFighterNum <= 1 then
				--返还入场费给玩家
			if GetMissionV(GAME_TYPE) == 2 then
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,0,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					OldPlayer = PlayerIndex
					PlayerIndex = nPlayerIndex
					Earn(20000);
					Say("由于参加此百人英雄大擂的人数不足2人，因此无法组织比赛！现在偿还您<color=yellow>2金<color>入场费!",0);
					PlayerIndex = OldPlayer
				end
			end
			news_str = "参加人数不足，已取消比赛！";
			Msg2MSAll(MULIT_MISSION_ID,news_str);	
			--由于涉及入场费因此不作延时处理，怕玩家在延时阶段进来而使收取入场费不能退还				
			SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--删去退出Npc			 
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
		
		--比赛开始处理
		OldPlayer = PlayerIndex
		for i=1,nTotalNum do	
			PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
			if nPlayerIndex > 0 then
				tinsert(PlayerIndexTab,nPlayerIndex);
			end
		end
		
		if nTotalFighterNum ~= getn(PlayerIndexTab) then
			WriteLog("[百人英雄大擂]当比赛开始时，获得 PlayerIndex 比赛人数错误!");
		end
			
		for i=1,getn(PlayerIndexTab) do
			PlayerIndex = PlayerIndexTab[i]
			Talk(1,"","百人英雄大擂正式开始，当前参与比赛共<color=yellow>"..nTotalFighterNum.."<color>人。")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "百人英雄大擂正式开始";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--其他信息处理
	
	nMin = floor((HUNDRED_READY_TIME - nTimeState) / 3);
	nReportTime = mod(floor((HUNDRED_READY_TIME - nTimeState) / 3),3);
	nSec = mod((HUNDRED_READY_TIME - nTimeState),3) * 20;
	
	--每个三分钟一个信息
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "百人英雄大擂准备时间还剩"..nMin.."分钟，参与人数："..nTotalFighterNum.."人";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
		Msg2SubWorld("百人英雄大擂即将开始，诚邀各位英雄侠士尽快参加，准备时间还剩下"..nMin.."分钟，当前已有"..nTotalFighterNum.."人参加比赛。");
	elseif (nMin == 0) then
		news_str = "百人英雄大擂准备时间还剩" ..nSec.. "秒，参与人数："..nTotalFighterNum.."人";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	end
	
end


--开战阶段战况报告
function ReportBattleState(nTimeState)
	local news_str = "";
	local nMSPlayerIndex = 0;
	local nPlayerIndexTab = {};
	local i=0;
	local j=0;
	local nMin = 0; 
	local nSec = 0;
	local nPlayerIndex = 0;
	local nWinState = 0;
	local nPlayerName = "";
	local nKillNum = 0;
	local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	local WinnerTab = {};
	local Winner_info = {};
	local Winner_News = {};
	local nBonus = 0;
	local Bonus_str = "";
	
	--只剩下一名选手
	if nTotalFigtherNum == 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				if GetMissionV(GAME_TYPE) == 1 then
					PayAward(2);
				end
				if GetMissionV(GAME_TYPE) == 2 then
					nBonus = floor(GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)
					Bonus_str = TurnMoneyFormat(nBonus);
				--Say("<color=green>代志强<color>：你已经胜出该场百人英雄大擂比赛，按照规则将获得"..Bonus_str.."作为奖励！",0);
					Earn(nBonus);
				end
				WriteLog("[百人英雄大擂] 公告："..GetName().."赢得"..GetMissionV(START_TIME).."获得奖励："..nBonus.."总入场费为："..GetMissionV(MULTIMAP_BONUS).." 帐户："..GetAccount());
				PlayerIndex = OldPlayer;
			end
			
			--向场内所有角色发送比赛结果（包括观众）
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(GAME_TYPE) == 2 then 
						news_str = "比赛结束了，赢得这场比赛的侠士是<color=yellow>"..nPlayerName.."<color>，一共击败"..nKillNum.."人，按照规则将获得"..Bonus_str.."奖励！请稍等，即将被传出比赛场地！";
					else
						news_str = "比赛结束了，赢得这场比赛的侠士是<color=yellow>"..nPlayerName.."<color>，一共击败"..nKillNum.."人，请稍等，即将被传出比赛场地！";
					end
					Talk(1,"",news_str);
				end
			end
			PlayerIndex = OldPlayer ;
			nDelayState = 1;
			news_str = "比赛结束了，赢家是"..nPlayerName;
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			Msg2SubWorld(nPlayerName.."在游戏结束之前，击败对手的任何人都将获胜！");
			AddGlobalNews(nPlayerName.."在游戏结束之前，击败对手的任何人都将获胜！");
			return
		end
		--延时退出
		if nDelayState == 1 then
			nDelayState = 0;
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
	end
	
	--战斗结束
 	if nTimeState >= HUNDRED_GAME_TIME then
 		
 		if nDelayState == 0 then
			
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--获得杀人数目由大到小排序的list
			
			if GetMissionV(GAME_TYPE) == 2 then
				nBonus = floor((GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)/getn(WinnerTab[1]));
				Bonus_str = TurnMoneyFormat(nBonus);
			end
			
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 2 then
					Earn(nBonus);
				end
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 1 then
					PayAward(2)
				end
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				WriteLog("[百人英雄大擂] 公告："..GetName().."赢得"..GetMissionV(START_TIME).."获得奖励："..nBonus.."总入场费为："..GetMissionV(MULTIMAP_BONUS).." 帐户："..GetAccount());
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			--向失败者发奖
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP) do	
				nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(DECEDEND_NUM) == 0 then
						PayAward(1);
					else 
						for j=1,getn(WinnerTab[1]) do	
							if PlayerIndex == WinnerTab[1][j] then
								nWinState = 1;
								break;
							end
						end
						if nWinState ~= 1 then
							PayAward(1);
						end
						nWinState = 0;
					end
				end
			end
			PlayerIndex = OldPlayer;
	
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "这场比赛没有人员伤亡，这场比赛为平局。请稍等，即将被传出比赛场地！"
			else
				news_str = "比赛结束了，赢得这场比赛的侠士是"
				for i=1,getn(Winner_News) do
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].." <color>人。"
						if GetMissionV(GAME_TYPE) == 2 then
							news_str = news_str.."按照规则将获得"..Bonus_str.."奖励，请稍等，即将被传出比赛场地！";
						end
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>人。"
					end
				end
			end
			
			--向场内所有角色发送比赛结果（包括观众）
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "比赛结束了，这场比赛是平局。";
			else
				news_str = "比赛结束了，获胜者是："..nPlayerName;
			end
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			return
		end
 		
 		--延迟退出
 		if nDelayState == 1 then
 			nDelayState = 0;
 			SetMissionV(MULTIMAP_STATE,3);
 			CloseMission(MULIT_MISSION_ID);
 			return
 		end
 		
 	end
 	
	nMin = floor((HUNDRED_GAME_TIME - nTimeState) / 3);
	nSec = mod((HUNDRED_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTotalFigtherNum.."人，离比赛结束还有"..nSec.."秒。");
	elseif nSec == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTotalFigtherNum.."人，离比赛结束还有"..nMin.."分钟。");
	end
	
end;
