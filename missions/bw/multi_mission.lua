Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i,0);
	end;
	for i = 1, 100 do 
		SetMissionS(i, "")
	end;
	SetMissionV(MULTIMAP_STATE, 1);
	nTime	= tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	SetMissionV(START_TIME,nTime)
	WriteLog("[单人混战擂台]报名成功，时间是:"..nTime);
end;

function RunMission()
	local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	local i = 0;
	local PlayerMSIndex = 0;
	WriteLog("[单人混战擂台]比赛开始了，参加比赛的人数是："..nTotalFigtherNum.."，总报名费是："..GetMissionV(MULTIMAP_BONUS))
	OldPlayer = PlayerIndex;
	for i=1,nTotalFigtherNum do	
		PlayerMSIndex,PlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,1);
		if PlayerIndex > 0 then
			SetPlayerState(2,1);--设置开战时选手状态
		else
			WriteLog("[单人混战擂台]使用 RunMission时，错误字符开关状态指令为"..PlayerIndex);
		end
	end
	PlayerIndex = OldPlayer;
	--删去退出Npc
	SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)
 	SetMissionV(MULTIMAP_STATE, 2);
end;

function EndMission()
 	local i = 0;
 	local nPlayerIndex = 0;
 	local nPlayerMSIndex = 0;
 	local PlayerIdxTab = {};
 	local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)
	OldPlayer = PlayerIndex
	for i=1, nTotalNum do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerIdxTab,nPlayerIndex);
		end
	end

	if nTotalNum ~= getn(PlayerIdxTab) then
		WriteLog("[单人混战擂台]游戏开始时，PlayerIndex收到的比赛次数不一致！");
	end
	
	for i=1,getn(PlayerIdxTab) do
		PlayerIndex = PlayerIdxTab[i];
		SetTaskTemp(PLAYER_CAMP,0);
		SetTaskTemp(TOTAL_KILL_NUM,0);
		DelMSPlayer(MULIT_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer
	
	nTime = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	SetMissionV(OVER_TIME,nTime);
	WriteLog("[单人混战擂台] 结束！！！打开战场的时间是："..GetMissionV(START_TIME).."结束时间是："..nTime);
	SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--删去退出Npc
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1);
	StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex
	SetTaskTemp(PLAYER_CAMP,0);
	SetTaskTemp(TOTAL_KILL_NUM,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--标志角色离开多人擂台
	SetPlayerState(3);
	NewWorld(GetLeavePos());
	--当角色为最后离开mission的角色时关闭mission
	if GetMSPlayerCount(MULIT_MISSION_ID,0) <= 0 and GetMissionV(GAME_TYPE) == 0 then
		SetMissionV(MULTIMAP_STATE, 3);
		CloseMission(MULIT_MISSION_ID);
	end
end;