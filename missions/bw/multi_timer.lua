Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;
nReadyState = 0;

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
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1);
	end;
end;

--准备阶段信息处理
function ReportReadyState(nTimeState)
	local news_str = "";
	local nMin = 0; 
	local nSec = 0;
	local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
	local PlayerMSIndex = 0;
	local nPlayerIndex = 0;
	local PlayerIndexTab = {};

	if nReadyState == 1 then
		nReadyState = 0;
		SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--删去退出Npc			 
		SetMissionV(MULTIMAP_STATE,3);
		CloseMission(MULIT_MISSION_ID);
		return
	end

	--在报名期间，系统定期通知玩家当前的报名情况
	--准备时间到达3分钟以后判断场内当前情况
	if nTimeState >= READY_TIME then 
		--比赛开始时比赛人数少等于1人
		if nTotalFighterNum <= 1 then
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
				if nPlayerIndex > 0 then					
					PlayerIndex = nPlayerIndex
					Say("由于比赛场上的人数少于<color=yellow>2人<color>取消比赛！请稍候！系统会自动将玩家从比赛场地上传出！",0);
				end
			end
			PlayerIndex = OldPlayer
			news_str = "战场上的人数不够，比赛被取消！";
			Msg2MSAll(MULIT_MISSION_ID,news_str);
			nReadyState = 1;
			return
		end	

		--比赛开始处理
		OldPlayer = PlayerIndex
		for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do	
			PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
			if nPlayerIndex > 0 then
				tinsert(PlayerIndexTab,nPlayerIndex);
			end
		end
		
		if nTotalFighterNum ~= getn(PlayerIndexTab) then
			WriteLog("[单人混战擂台]当比赛开始时，获得 PlayerIndex 比赛人数错误!");
		end
		
		for i=1,getn(PlayerIndexTab) do
			PlayerIndex = PlayerIndexTab[i]
			Talk(1,"","单人混战擂台正式开始，当前参与比赛共<color=yellow>"..nTotalFighterNum.."<color>人。")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "单人混战擂台正式开始";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--比赛尚未开始前的信息处理
	nMin = floor((READY_TIME - nTimeState) / 3);
	nSec = mod((READY_TIME - nTimeState),3) * 20;
	if nMin > 0 and nSec == 0 then
		news_str = "对战擂台准备时间还剩"..nMin.."分钟，参与人数："..nTotalFighterNum.."人。";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	elseif (nMin == 0) then
		news_str = "对战擂台准备时间还剩" ..nSec.. "秒，参与人数："..nTotalFighterNum.."人。";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	end
end


--开战阶段战况报告
function ReportBattleState(nTimeState)
	local news_str = "";
	local nMSPlayerIndex = 0;
	local nPlayerIndexTab = {};
	local i=0;
	local nMin = 0; 
	local nSec = 0;
	local nPlayerIndex = 0;
	local nPlayerName = "";
	local nKillNum = 0;
	local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	local WinnerTab = {};
	local Winner_info = {};
	local Winner_News = {};
	
	--当前场地只剩下一名选手
	if nTotalFigtherNum <= 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				--Say("恭喜你成为本次擂台赛的优胜者，你本次战绩为：成功杀死"..nKillNum.."人！稍后将会把你传送出赛场，请耐心等待。")
				gf_AddItemEx2({2,95,1463,1,4}, "单人混战称号券", "百人英雄大擂胜者奖励", "获得单人混战称号券", 1 * 24 * 3600, 1);
				PlayerIndex = OldPlayer;
			end
			
			--向场内所有角色发送比赛结果（包括观众）
			nMSPlayerIndex = 0
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					news_str = "比赛结束了，赢得这场比赛的侠士是<color=yellow>"..nPlayerName.."<color>，一共击败"..nKillNum.." 人，请稍等，即将被传出比赛场地！";
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer; 	
			nDelayState = nDelayState + 1;
			news_str = "比赛结束了，赢家是"..nPlayerName;
			msg_str = "单人混战擂台比赛结束了，"..nPlayerName.."获得最后的胜利，将获得单人混战【人雄-名震江湖】称号！";
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			AddGlobalNews(msg_str);
			Msg2Global(msg_str);
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
 	if nTimeState >= GAME_TIME then
 		if nDelayState == 0 then
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--获得杀人数目由大到小排序的list
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i]
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			news_str = "比赛结束了，赢得这场比赛的侠士是"
			
			for i=1,getn(Winner_News) do
				if i == getn(Winner_News) then
					nPlayerName = nPlayerName..Winner_News[i][1].."."
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>人。"
				else
					nPlayerName = nPlayerName..Winner_News[i][1]..","
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color>击败：<color=yellow>"..Winner_News[i][2].."<color>人。"
				end
			end
			
			--向场内所有角色发送比赛结果（包括观众）
			nMSPlayerIndex = 0
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			news_str = "比赛结束了，获胜者是："..nPlayerName
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
 	
	nMin = floor((GAME_TIME - nTimeState) / 3);
	nSec = mod((GAME_TIME - nTimeState),3) * 20;
	
	if (nMin == 0) then
		Msg2MSAll(MULIT_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTotalFigtherNum.."人，离比赛结束还有"..nSec.."秒。");
	elseif (nSec == 0) then
		Msg2MSAll(MULIT_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTotalFigtherNum.."人，离比赛结束还有"..nMin.."分。");
	--else
		--Msg2MSAll(MULIT_MISSION_ID, "战斗阶段：比赛进行中，场地上尚有"..nTotalFigtherNum.."名角色，离比赛结束还有"..nMin.."分"..nSec.."秒。");
	end;
	
end;
