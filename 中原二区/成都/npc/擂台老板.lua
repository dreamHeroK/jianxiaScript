Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--引用字符串处理支持
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\missions\\bw\\siege\\siege_arena_mission.lua")

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
--	Talk(1,"","<color=green>擂台老板<color>：擂台暂时被关闭了。");
--	return
	--设置返回点
--	if IsFreeze() == 1 then	--如果用WG被封
--		Talk(1,"","<color=green>擂台老板<color>：<color=yellow>当前账号异常，暂时不能参与擂台比赛。<color>");
--		return
--	end;
	
--	x,y,z = GetWorldPos();
--	SetTask(MS_POS, x);
--	SetTask(MS_POS+1, y);
--	SetTask(MS_POS+2, z);
	
--	if x == 150 then	--扬州
--		Talk(1,"","<color=green>擂台老板<color>：近日朝廷正在举行比武大会，敬请侠士积极参加！");
--		return
--	elseif x == 350 then	-- 襄阳
--		Talk(1,"","<color=green>擂台老板<color>：近日朝廷正在举行比武大会，敬请侠士积极参加！");
--		return
--	end;
	
--	if (GetTaskTemp(JOINROOMINDEX) > 0) then
--		OnChanceRoom(GetTaskTemp(JOINROOMINDEX));
--		return
--	end;
	
	--查询有效场地对话
--	SelectGameStyle()
	
end

function SelectGameStyle()
	local selTab = {};
	local szTitle = format("<color=green>擂台老板<color>：擂台是提供给各路英雄好汉比武切磋的地方，根据比赛类型的不同分为<color=yellow>单人对战擂台<color>、<color=yellow>组队对战<color>、<color=yellow>单人混战<color>和<color=yellow>组队混战<color>四种，各位使土可以选择相应的比武类型进行比试: ")
	if checktime() == 0 then
		tinsert(selTab,"单人对战擂台/#SearchValidRoom(1)");
		tinsert(selTab,"组队对战擂台/#SearchValidRoom(2)");
		tinsert(selTab,"组队混战擂台/#SearchValidRoom(4)");
	else
		tinsert(selTab,"单人混战擂台/#SearchValidRoom(3)");
	end;
--	tinsert(selTab,"押金擂台/#SearchValidRoom(5)");
--	tinsert(selTab,"攻城战擂台/talk_to_npc");
	tinsert(selTab,"规则说明/GameRuleTalk");
	tinsert(selTab,"离开/OnCancel_Talk");
	Say(szTitle, getn(selTab), selTab)
end

function checktime()
	local nTime = tonumber(date("%H%M"));
	if (not ((1145 <= nTime  and nTime < 1215) or (2050 <= nTime and nTime < 2110))) then	--只在12点和21点内开放
		return 0;
	else
		return 1;
	end;
end;

function SearchValidRoom(nType)
	local nMapId = GetWorldPos();
	--选择 个人单挑擂台 场地
	if nType == 1 then
		local room_num = 0;
		local room_tab = {}
		local szSay = "";
		for index, value in MapTab do
			room_tab[index] = 0
			if nMapId == value[2] then
				idx = SubWorldID2Idx(value[1]);
				if (idx~=-1) then
					room_num = room_num+1;
					room_tab[index] = 1;
				end;
			end;
		end;
		if room_num > 0 and room_num <= MAX_ROOM_COUNT then
			szSay = "Say("..format("%q","<color=green>擂台老板<color>：这是个人单挑擂台，当前共有："..room_num.." 个场地。您选择要进入的场地：<color=yellow>");
			szSay = szSay..","..(room_num+1);	 --为了最后加上的退出选项
			for index, value in room_tab do
				if value == 1 then
					szSay = szSay..","..format("%q", MapTab[index][3].."/#OnChanceRoom("..index..")");
				end;
			end;
			szSay = szSay..","..format("%q", "离开/OnCancel_Talk")..")";
			dostring(szSay);
		elseif room_num > MAX_ROOM_COUNT then
			ErrorMsg(12);
		else
			ErrorMsg(2);
		end
		return
	 	end

	--选择 组队单挑擂台 场地
	if nType == 2 then
		local room_num = 0;
		local room_tab = {}
		local szSay = "";
		local nMapIdx = 0;
		local nMapState = 0;
		local nCaptainName_1 = "";
		local nCaptainName_2 = "";
		local nTeamSize_1 = 0;
		local nTeamSize_2 = 0;
		local nPlayerMSIndex = 0;
		local nCamp = 0;
		
		for i=1,getn(SingleTeamMapTab) do
			room_tab[i] = 0;
			if nMapId == SingleTeamMapTab[i][2] then
				nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
				if nMapIdx ~= -1 then
					room_num = room_num+1;
					room_tab[i] = 1;
				end
			end
		end
	
		szSay = "Say("..format("%q","<color=green>擂台老板<color>：组队单挑擂台必须有<color=yellow>2个队伍<color>报名参加，每个队伍至少要<color=yellow>2人<color>，由<color=yellow>队长<color>报名参加。目前共开放<color=yellow>"..room_num.."个<color>场地，您选择要进入的场地：");
		szSay = szSay..","..(room_num+1);	 --为了最后加上的退出选项
	
		for i=1,getn(room_tab) do
	 			if room_tab[i] == 1 then
	 				OldWorld = SubWorld;
	 				SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
	 				if SubWorld ~= -1 then
	 					nMapState = GetMissionV(TEAM_GAME_STATE);
	 					local strTemp = "[奖励投注]";
					if GetMissionV(MS_YAJING_NUM) <= 0 then
						strTemp = "";
					end
	 					--场地没有人
	 					if nMapState == 0 then
	 						szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(状态：空闲)/#OpenSingleTeamRoomRequest("..i..")");
	 					elseif nMapState == 1 then	
	 						--已有两支队伍
	 						if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
	 							OldPlayer = PlayerIndex;				
	 							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
	 							if PlayerIndex > 0 then
	 								nCaptainName_1 = gf_GetCaptainName();
	 								nTeamSize_1 = gf_GetTeamSize();
	 							end
	 							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
	 							if PlayerIndex > 0 then
	 								nCaptainName_2 = gf_GetCaptainName();
	 								nTeamSize_2 = gf_GetTeamSize();
	 							end
	 							PlayerIndex = OldPlayer;
	 							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：等待开始，双方是"..nCaptainName_1.."和"..nCaptainName_2.."的队伍)/#OpenSingleTeamRoom("..i..")");
	 						--已有一支队伍，等待其他队伍加入
	 						elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
	 							if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
	 								nCamp = 1;
	 							else
	 								nCamp = 2;
	 							end
	 							OldPlayer = PlayerIndex;
	 							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
	 							if PlayerIndex > 0 then
	 								nCaptainName_1 = gf_GetCaptainName();
	 								nTeamSize_1 = gf_GetTeamSize();
	 							end
	 							PlayerIndex = OldPlayer;
	 							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：等待比赛，队伍："..nCaptainName_1..",有"..nTeamSize_1.."人)/#OpenSingleTeamRoom("..i..")");
	 						end
	 					--比赛已经开始
	 					elseif nMapState == 2 then
	 						OldPlayer = PlayerIndex;
	 						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
	 						if PlayerIndex > 0 then
	 							nCaptainName_1 = gf_GetCaptainName();
	 							nTeamSize_1 = gf_GetTeamSize();
	 						end
	 						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
	 						if PlayerIndex > 0 then
	 							nCaptainName_2 = gf_GetCaptainName();
	 							nTeamSize_2 = gf_GetTeamSize();
	 						end
	 						PlayerIndex = OldPlayer;
	 						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：正在比赛，比武双方："..nCaptainName_1.."和"..nCaptainName_2.."的队伍)/#OpenSingleTeamRoom("..i..")");
	 					elseif nMapState == 3 then
	 						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：比赛结束)/#GameOverTalk");
	 					end
	 				end	 			
	 				SubWorld = OldWorld;		 					
	 			end 			
	 		end
	 		szSay = szSay..","..format("%q", "离开/OnCancel_Talk")..")";
	 		dostring(szSay);
		return
	end
	
	--选择 个人混战擂台 场地
	if nType == 3 then
		local multi_room_num = 0;
		local multi_room_tab = {};--存放满足地图条件的MultiMapTab的index的位置
		local i=0;
		local j=1;
		local nRandomNum = 0;
		local multiroom_book_tab = {};--存放满足地图数量和预定条件的MultiMapTab的index的位置
		local multiroom_nobook_tab = {};--存闲置的MultiMapTab的index的位置
		local nMapBookState = 0;
		local nFighterNum = 0;
		local nAudienceNum = 0;
		local nMapState = 0;
		local lacknum = 0;
		local hundred_room_tab = {};
		local szSay = "";
		local room_num = 0;
		
		--获取多人擂台场地数量
		for i=1,getn(MultiMapTab) do
			if MultiMapTab[i][2] == nMapId then
				multi_room_tab[j] = i
				j=j+1
				multi_room_num = multi_room_num + 1
			end
		end
		 
		--判断当前多人擂台场地状态				
		for i=1,multi_room_num do
			OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
		
			if SubWorld <= 0 then
--				WriteLog("[擂台比武]：比赛地图 SubWorld 错误，错误信息：nMapIndex 是 "..MultiMapTab[multi_room_tab[i]][1]..", SubWorld 是 "..SubWorld..".");
				SubWorld = OldWorld;
				return 0
			end
		
			nMapBookState = GetMissionV(MULTIMAP_STATE)
		
			--对已经被闲置的场地进行处理
			if nMapBookState == 0 then
				tinsert(multiroom_nobook_tab,multi_room_tab[i])
			end
		
			--对已经被预定的场地进行处理
			if nMapBookState >= 1 then
				tinsert(multiroom_book_tab,multi_room_tab[i]);
			end
		
			SubWorld = OldSubWorld;
		end
	
		if getn(multiroom_book_tab) > MAX_MULTIMAP_NUM then			--已经预定的场地数多于目前开放多人擂台场地数
			Msg2Player("已经预定的场地数多于目前开放多人擂台场地数。")
		else --已经预定的场地数少于等于目前开放多人擂台场地数
			lacknum = MAX_MULTIMAP_NUM - getn(multiroom_book_tab);
			for i=1,lacknum do
				nRandomNum = random(1,getn(multiroom_nobook_tab));
				tinsert(multiroom_book_tab,multiroom_nobook_tab[nRandomNum]);
				tremove(multiroom_nobook_tab,nRandomNum);
			end
		end
	
		--获取百人大擂场地数量
		if IsHundredBattleState() == 1 then
			for i=1,getn(multiroom_book_tab) do
				OldWorld = SubWorld;
				SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
			
				if SubWorld <= 0 then
--					WriteLog("[擂台比武]：比赛地图 SubWorld 错误，错误信息：nMapIndex 是 "..MultiMapTab[multi_room_tab[i]][1]..", SubWorld 是 "..SubWorld..".");
					SubWorld = OldWorld;
					return 0
				end
			
				if GetMissionV(GAME_TYPE) == 1 or GetMissionV(GAME_TYPE) == 2 then 	
					tinsert(hundred_room_tab,multi_room_tab[i])
				end
				SubWorld = OldWorld
			end
	
			--若比赛尚未初始化
			if getn(hundred_room_tab) <= 0 then	
				hundred_room_tab = multiroom_book_tab
			end
		
			room_num = room_num + getn(hundred_room_tab);
		else
			room_num = room_num + getn(multiroom_book_tab);
		end	 

		szSay = "Say("..format("%q","<color=green>擂台老板<color>：最近，代志强老板在成都弄了一个百人英雄大擂，希望各位大侠踊跃参加。");
		szSay = szSay..","..2;--为了最后加上的退出选项						
		--百人大擂对话选项构建
		if IsHundredBattleState() == 1 then
			for i=1,getn(hundred_room_tab) do
				OldSubWorld = SubWorld;
				SubWorld = SubWorldID2Idx(MultiMapTab[hundred_room_tab[i]][1]);
			
				if SubWorld <= 0 then
--					WriteLog("[擂台比武]：比赛地图 SubWorld 错误，错误信息：nMapIndex 是 "..MultiMapTab[multi_room_tab[i]][1]..", SubWorld 是 "..SubWorld..".");
					SubWorld = OldSubWorld;
					return 0
				end
			
				nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
				nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
				nMapState = GetMissionV(MULTIMAP_STATE);
				nGameType = GetMissionV(GAME_TYPE);
			
				if nMapState == 0 then
					szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(当前状态：空闲)/MapPreparingTalk");
				elseif nMapState == 1 then
					if nGameType == 1 or nGameType == 2 then 
						szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(当前状态：进行中，参与人数："..nFighterNum.." ："..MAX_MULTIMAP_FIGTHER_NUM.."，观众人数："..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..hundred_room_tab[i]..")");
					else
						szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][3].."(当前状态：进行中，参与人数："..nFighterNum.." ："..MAX_MULTIMAP_FIGTHER_NUM.."，观众人数："..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..hundred_room_tab[i]..")");
					end
				elseif nMapState >= 2 then
					if nGameType == 1 or nGameType == 2 then
						szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][8].."(当前状态：进行中)/#RequestGame("..hundred_room_tab[i]..")");
					else
						szSay = szSay..","..format("%q", MultiMapTab[hundred_room_tab[i]][3].."(当前状态：进行中)/#RequestGame("..hundred_room_tab[i]..")");
					end
				end
				SubWorld = OldSubWorld 
			end		 		
		--一般多人擂台对话选项构建
		else
		for i=1,getn(multiroom_book_tab) do
			OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(MultiMapTab[multiroom_book_tab[i]][1]);
			
			if SubWorld <= 0 then
--				WriteLog("[擂台比武]：比赛地图 SubWorld 错误，错误信息：nMapIndex 是 "..MultiMapTab[multi_room_tab[i]][1]..", SubWorld 是 "..SubWorld..".");
				SubWorld = OldSubWorld;
				return 0
			end
	
			nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
			nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
			nMapState = GetMissionV(MULTIMAP_STATE);

			if nMapState == 0 then
				szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(当前状态：空闲)/#RequestGame("..multiroom_book_tab[i]..")");
			elseif nMapState == 1 then
				szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(当前状态：进行中，参与人数："..nFighterNum.." ："..MAX_MULTIMAP_FIGTHER_NUM.."，观众人数："..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..multiroom_book_tab[i]..")");
			elseif nMapState >= 2 then
				szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(当前状态：进行中)/#RequestGame("..multiroom_book_tab[i]..")");
			end
			SubWorld = OldSubWorld 
		end
	end
 
	szSay = szSay..","..format("%q", "离开/OnCancel_Talk")..")";
	dostring(szSay);
	return
	end
	
	--选择 组队混战擂台 场地
	if nType == 4 then
		local nTeamNum = 0;
		local szSay = "Say("..format("%q","<color=green>擂台老板<color>: 最近，泉州的擂台老板代志强组织了组队混战擂台，希望各位大侠踊跃参加");
			szSay = szSay..","..2;--为了最后加上的退出选项	
		 	for i=1,getn(TeamMapTab) do
	 		if GetWorldPos() == TeamMapTab[i][2] then
	 			OldSubWorld = SubWorld;
	 			SubWorld = SubWorldID2Idx(TeamMapTab[i][1]);
	 			if SubWorld > 0 then
	 				if GetMissionV(TEAM_GAME_STATE) == 0 then
	 					if IsTeamAwardTime() == 1 then
	 						szSay = szSay..","..format("%q","队伍(当前状态：场地准备中)/TeamGamePreparingTalk");
	 					else
	 						szSay = szSay..","..format("%q","组队混战(当前状态：空闲)/#RequestTeamGame("..i..")");
	 					end
	 				elseif GetMissionV(TEAM_GAME_STATE) == 1 then
	 					nTeamNum = GetGameTeamNum();
	 					if IsTeamAwardTime() == 1 then
	 						szSay = szSay..","..format("%q","组队混战(当前状态：未开启"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
	 					else
	 						szSay = szSay..","..format("%q","组队混战(当前状态：未开启"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
	 					end
	 				elseif GetMissionV(TEAM_GAME_STATE) > 1 then
	 					if IsTeamAwardTime() == 1 then
	 						szSay = szSay..","..format("%q","组队混战(当前状态：进行中)/#RequestTeamGame("..i..")");
	 					else
	 						szSay = szSay..","..format("%q","组队混战(当前状态：进行中)/#RequestTeamGame("..i..")");
	 					end
	 				end
	 			end
	 			SubWorld = OldSubWorld;
	 		end
	 	end	
	 		
	 	szSay = szSay..","..format("%q", "离开/OnCancel_Talk")..")";
	 	dostring(szSay);
		return
	end
	
	--共享团队押金擂台对战擂台
	if nType == 5 then
		local room_num = 0;
		local room_tab = {}
		local szSay = "";
		local nMapIdx = 0;
		local nMapState = 0;
		local nCaptainName_1 = "";
		local nCaptainName_2 = "";
		local nTeamSize_1 = 0;
		local nTeamSize_2 = 0;
		local nPlayerMSIndex = 0;
		local nCamp = 0;

		for i=1,getn(SingleTeamMapTab) do
			room_tab[i] = 0;
			if nMapId == SingleTeamMapTab[i][2] then
				nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
				if nMapIdx ~= -1 then
					room_num = room_num+1;
					room_tab[i] = 1;
				end
			end
		end

		szSay = "Say("..format("%q","<color=green>擂台老板<color>：这是<color=red>押金擂台<color>，针对<color=yellow>2个帮会或2位玩家<color>彼此之间的较量，目前共有<color=yellow>"..room_num.."个场地<color>，请选择要进入的场地：");
		szSay = szSay..","..(room_num+1);	 --为了最后加上的退出选项
		
		for i=1,getn(room_tab) do
			if room_tab[i] == 1 then
				OldWorld = SubWorld;
				SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
				if SubWorld ~= -1 then
					nMapState = GetMissionV(TEAM_GAME_STATE);
					local strTemp = "[奖励投注]";
					if GetMissionV(MS_YAJING_NUM) <= 0 then
						strTemp = "";
					end
					--场地没有人
					if nMapState == 0 then
						szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(状态：空闲)/#OpenSingleTeamRoomRequestYJ("..i..")");
					elseif nMapState == 1 then	
						--已有两支队伍
						if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
							OldPlayer = PlayerIndex;				
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
							if PlayerIndex > 0 then
								nCaptainName_1 = gf_GetCaptainName();
								nTeamSize_1 = gf_GetTeamSize();
							end
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
							if PlayerIndex > 0 then
								nCaptainName_2 = gf_GetCaptainName();
								nTeamSize_2 = gf_GetTeamSize;
							end
							PlayerIndex = OldPlayer;
							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：等待比赛，比赛双方是"..nCaptainName_1.." 和"..nCaptainName_2.." 的队伍)/#OpenSingleTeamRoomYJ("..i..")");
						--已有一支队伍，等待其他队伍加入
						elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
							if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
								nCamp = 1;
							else
								nCamp = 2;
							end
							OldPlayer = PlayerIndex;
							nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
							if PlayerIndex > 0 then
								nCaptainName_1 = gf_GetCaptainName();
								nTeamSize_1 = gf_GetTeamSize();
							end
							PlayerIndex = OldPlayer;
							szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：等待比赛，当前队伍是"..nCaptainName_1.."，有"..nTeamSize_1.."人)/#OpenSingleTeamRoomYJ("..i..")");
						end
					--比赛已经开始
					elseif nMapState == 2 then
						OldPlayer = PlayerIndex;
						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
						if PlayerIndex > 0 then
							nCaptainName_1 = gf_GetCaptainName();
	 							nTeamSize_1 = gf_GetTeamSize();
						end
						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
						if PlayerIndex > 0 then
							nCaptainName_2 = gf_GetCaptainName();
	 							nTeamSize_2 = gf_GetTeamSize();
						end
						PlayerIndex = OldPlayer;
						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：比赛中，比赛双方是 "..nCaptainName_1.."和"..nCaptainName_2.." 的队伍)/#OpenSingleTeamRoomYJ("..i..")");
					elseif nMapState == 3 then
						szSay = szSay..","..format("%q", strTemp..SingleTeamMapTab[i][3].."(状态：比赛结束)/#GameOverTalk");
					end
				end	 			
				SubWorld = OldWorld;		 					
			end 			
		end
		szSay = szSay..","..format("%q", "离开/OnCancel_Talk")..")";
		dostring(szSay);
		return
	end
end

function OnChanceRoom(index)
	if (GetTaskTemp(JOINROOMINDEX)>0 and GetTaskTemp(JOINROOMINDEX)~=index) then
		Say("您已经预定了场地"..GetTaskTemp(JOINROOMINDEX).."，请选择进入！",0);
	else
		SetTaskTemp(JOINROOMINDEX,index);
		OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
		ms_state = GetMissionV(MS_STATE);
		if (ms_state <= 0) then
			Say("<color=green>擂台老板<color>：这是单人对战擂台，当前没有任何玩家报名，您感兴趣吗? <color=yellow>当前可以免费参加。<color>", 3, "我要报名/OnRegister", "比赛规则/OnHelp", "随便看看/OnCancel");
		elseif (ms_state == 1) then
			OnReady();
		elseif (ms_state == 2) then
			OnFighting();
		else
			OldPlayer = PlayerIndex;
			for i = 1, 2 do
				PlayerIndex = gf_GetTeamMember(i);
				SetTaskTemp(JOINROOMINDEX,0);
			end;
			PlayerIndex = OldPlayer;
			ErrorMsg(2)
		end;
		
		SubWorld = OldSubWorld;
	end;
end

function OnHelp()
	SetTaskTemp(JOINROOMINDEX,0);
	Talk(7, "",	"<color=green>擂台老板<color>：大侠身在江湖，往往避不开刀光剑影的厮杀，而全新的“单人对战擂台”模式给予你一个操练的机会。",	"<color=green>擂台老板<color>：如果您想进行单人对战，您需要报名才能参加竞技!", "<color=green>擂台老板<color>：参加“组队对战擂台”双方必须组队后由队长来报名才能参加擂台。",	"<color=green>擂台老板<color>：由于地方有限，当擂台进行中时，擂台将不会接受其它报名。", "<color=green>擂台老板<color>：报名成功后，双方开始为比赛做准备。加入擂台时间为3分钟，在3分钟内，参赛人员必须赶紧进入场地开始比赛。" , "<color=green>擂台老板<color>：比赛时间为10分钟，在10分钟内，只要击败对方即可获取比赛胜利。",	"<color=green>擂台老板<color>：在比赛中，任何一方掉线或回到城里的都将视为被击败。");
end;

function OnRegister()
	--报名
	if (gf_GetTeamSize()	~= 2) then
		ErrorMsg(1)
		SetTaskTemp(JOINROOMINDEX,0);
		return
	else
		if (PlayerIndex ~= gf_GetTeamMember(0)) then --GetName() == gf_GetCaptainName()
			ErrorMsg(5)
			SetTaskTemp(JOINROOMINDEX,0);
			return
		end;
	end;
	
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		CleanInteractive();
		if (GetPlayerRoute() == 0) then
			PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
			PlayerIndex = OldPlayer;
			ErrorMsg(10);
			return
		end;
		if (GetTaskTemp(JOINROOMINDEX) ~= 0 and PlayerIndex~=gf_GetTeamMember(0)) then
			PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
			PlayerIndex = OldPlayer;
			ErrorMsg(11);
			return
		end;
	end;
	PlayerIndex = OldPlayer;
--	AskClientForNumber("SignUpFinal", 100000, 99999999, "请输入赌注金额:");
	SignUpFinal();
end;

function SignUpFinal(V)
	x = GetTask(MS_POS);
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	ms_state = GetMissionV(MS_STATE);
	SubWorld = OldSubWorld;

	if (ms_state > 0) then 
		ErrorMsg(8);
		SetTaskTemp(JOINROOMINDEX,0);
		return
	end;
	
	local ChoiceRoom = GetTaskTemp(JOINROOMINDEX);
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		SetMissionS(i, GetName());
		if (PlayerIndex ~= gf_GetTeamMember(0)) then
			SetTaskTemp(JOINROOMINDEX,ChoiceRoom)
		end;
--		if (GetCash() < V) then 
--			PlayerIndex = OldPlayer
--			ErrorMsg(2)
--			return
--		end;
	end;
	PlayerIndex = OldPlayer;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	OpenMission(MISSIONID);

	SetMissionV(MS_ROOMINDEX,GetTaskTemp(JOINROOMINDEX));
	
	SetMissionV(BW_SIGN_MONEY,V);
	if x == 300 then
		SetMissionS(CITYID,"成都")
	elseif x == 350 then
		SetMissionS(CITYID,"襄阳")
	elseif x == 150 then
		SetMissionS(CITYID,"扬州")
	elseif x == 100 then
		SetMissionS(CITYID,"汴京")
	end;

	local nCountPlayerLevel = 0;
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = gf_GetTeamMember(i);
--		Pay(V);
		TaskTip("你的队伍已经参加"..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."的擂台PK！");
		SetMissionV(MS_PLAYER1ID + i -1, PlayerIndex);
		SetMissionS(i, GetName());
		SetMissionS(i+2, GetPlayerInfo(PlayerIndex));
		
		------------------判断是否发游戏公告----------------
		if GetLevel() >= 70 then
			nCountPlayerLevel = nCountPlayerLevel + 1
		end;
		--branchTask_BW1()
	end;
	PlayerIndex = OldPlayer;
	
--	if nCountPlayerLevel == 2 then	--双方都高于70级
--		SetMissionV(GLOBAL_NEWS_SHOW, 1);
--	end;

	str = "目前"..GetMissionS(CITYID).." - "..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."单场比赛已经开始准备，比赛双方是"..GetMissionS(1).."("..GetMissionS(3)..")".."与"..GetMissionS(2).."("..GetMissionS(4)..")".."，当前擂台赛是免费开放，欢迎侠士前往观摩比赛。";
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
		AddGlobalNews(str);
	end;
	SubWorld = OldSubWorld;
	--Msg2Team("你们已经订下了比赛，请尽快进行准备并入场，比赛将在1分钟后正式开始。");
	Say("你们已经预定了擂台比赛，请尽快进行准备并入场，比赛将在1分钟后正式开始。",0);
end;

function OnReady()
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);

	if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then 
		if (GetName() == GetMissionS(1)) then
			SetMissionV(MS_PLAYER1ID, PlayerIndex);
		end;
		if (GetName() == GetMissionS(2)) then
			SetMissionV(MS_PLAYER1ID+1, PlayerIndex);
		end;
		
		SubWorld = OldSubWorld
		OnJoin()
	else
		V = GetMissionV(BW_KEY);
		if GetTask(DUZHU+2) == V then
			str = "目前"..GetMissionS(1).."("..GetMissionS(3)..")".."与"..GetMissionS(2).."("..GetMissionS(4)..")".."正在比赛中，比赛场地观众人数<color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>，最多允许100人观看，你还可进场参观。";
			SubWorld = OldSubWorld

			Say(str, 2, "我要进场参观比赛/OnLooking","我随便转转/OnCancel");
		else
			str = "目前"..GetMissionS(1).."("..GetMissionS(3)..")".."与"..GetMissionS(2).."("..GetMissionS(4)..")".."正在比赛中，比赛场地观众人数<color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>，最多允许100人观看，您可以<color=red>进入比赛场免费观看<color>，比赛即将开始。";
			SubWorld = OldSubWorld
			Say(str, 2, "我要进场参观比赛/OnLook","我随便转转/OnCancel");
		end;
	end;
end;

function ErrorMsg(ErrorId)
	if (ErrorId == 1) then 
		Say("<color=green>擂台老板<color>：双方需要组队才能报名！",0)
	elseif (ErrorId == 2) then 
		Say("<color=green>擂台老板<color>：抱歉！当前场地尚未开放，暂时无法参加比赛！",0)
	elseif (ErrorId == 3) then 
		Say("<color=green>擂台老板<color>：报名异常，请联系游戏客服！",0);
	elseif (ErrorId == 4) then 
		Say("<color=green>擂台老板<color>：您不是参赛选手，无法进入比赛擂台，只能成为比赛观众！", 0);
	elseif (ErrorId == 5) then 
		Say("<color=green>擂台老板<color>：只有队长才能报名参赛！",0);
	elseif (ErrorId == 6) then 
		Say("<color=green>擂台老板<color>：你没有带足够的钱！",0);
	elseif (ErrorId == 7) then 
		Say("<color=green>擂台老板<color>：抱歉，您尚未报名！",0);
	elseif (ErrorId == 8) then
		Say("<color=green>擂台老板<color>：抱歉，此场地已经被预定了！",0);
	elseif (ErrorId == 9) then 
		Say("<color=green>擂台老板<color>：抱歉，比赛已经开始，无法报名！",0);
	elseif (ErrorId == 10) then 
		Say("<color=green>擂台老板<color>：抱歉，队伍中有新手玩家，不能参加擂台PK！",0);
	elseif (ErrorId == 11) then 
		Say("<color=green>擂台老板<color>：抱歉，您的队伍已参加了其他PK比赛！",0);
	elseif ErrorId == 12 then
		--仅仅开发的时候使用，错误报告
		Say("<color=green>擂台老板<color>：服务器人数已超过最大限制!!!",0);
	else
		
	end;
	return 
end;


function OnLook()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	str = GetMissionS(1).."与"..GetMissionS(2).."已开始比赛，您猜那方会取得胜利？";
	str1 = "我觉得"..GetMissionS(1).."("..GetMissionS(3)..")".."会赢/OnCas1";
	str2 = "我觉得"..GetMissionS(2).."("..GetMissionS(4)..")".."会赢/OnCas2";
	Say(str, 3, str1, str2, "我们不知道，我才不进呢！/OnCancel");
	SubWorld=OldSubWorld;
end;

function OnLooking()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	if (idx == -1) then 
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	--限制观众人数为100人
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","抱歉，比赛场内已有<color=yellow>100<color>个观众，暂时无法进入比赛场地了。");
		SubWorld=OldSubWorld;
		return
	end
	V = GetMissionV(BW_KEY);
	if GetTask(DUZHU+2) == V and V ~= 0 then
		JoinCamp(3);
	else
		ErrorMsg(7);
	end;
	SubWorld=OldSubWorld;
end;

function OnCas1()
	OnCas(0);
end;

function OnCas2()
	OnCas(1);
end;

function OnCas(nSel)
	SetTask(DUZHU,nSel + 1);
	SignUpFinalx()
--	AskClientForNumber("SignUpFinalx", 10000, 10000000, "请输入赌注金额:");
end;


--玩家输入投标金后到这里
function SignUpFinalx( )
--	if (GetCash() < V) then 
--		ErrorMsg(6)
--		return
--	end;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	ms_state = GetMissionV(MS_STATE);
	if (ms_state ~= 1) then
		SubWorld = OldSubWorld
		ErrorMsg(9)
		return
	end

--	Pay(V);		--交赌注
--	nSel = GetTask(DUZHU) - 1;	--选择的是哪方呢？
--	V1 = GetMissionV(BW_MONEY1 + nSel) + V;		--赌注加到选择的人身上
--	SetMissionV(BW_MONEY1 + nSel, V1);		
--	SetTask(DUZHU+1,V);
	SetTask(DUZHU+2,GetMissionV(BW_KEY));		--标记，是观看本次比赛
	
	--限制观众人数为100人
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","抱歉，比赛场内已有<color=yellow>100<color>个观众，暂时无法进入比赛场地了。");
		SubWorld=OldSubWorld;
		return
	end
	
	JoinCamp(3);
	SubWorld = OldSubWorld;

end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
end;

function OnFighting()
	str = "目前"..GetMissionS(1).."与"..GetMissionS(2).."的擂台比赛正在进行当中。";
	Say(str, 2, "我要进场参观比赛/OnLooking", "我随便转转/OnCancel");
end;

function OnCancel()
	SetTaskTemp(JOINROOMINDEX,0);
end;

function OnCancel_Talk()
end;

------------------------------------------------多人擂台部分函数-------------------------------------

--选择参赛或者观战或者开局
function RequestGame(nMapIndex)
	local nMapState = 0;
	local str = "";

	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("<color=green>擂台老板<color>：您已经报名了单人擂台比赛，无法进入此场地.",0)
		return
	end

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[多人擂台]：此 RequestGame SubWorld 错误，错误 nMapIndex 为"..nMapIndex..", SubWorld 为"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	nGameType = GetMissionV(GAME_TYPE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		if IsHundredBattleState() == 0 then
			Say("<color=green>擂台老板<color>：该场地还没有玩家报名，您要预定此场地吗？",
				2,
				"我要报名/#OpenMultiRoom("..nMapIndex..")",
				"算了，我还有别的事/OnCancel_Talk"
			)
		else
			Say("<color=green>擂台老板<color>：抱歉，该场已被预定，请选择其他场地。",0)
		end
	elseif nMapState == 1 then
		if nGameType == 1	then
			str = "<color=green>擂台老板<color>：参加<color=yellow>第一场比赛<color>的队员可以报名免费比赛，比赛结束后，所有参赛者将获得<color=yellow>积分和其他奖励<color>，您确定要参加吗？";
		elseif nGameType == 2 then
			str = "<color=green>擂台老板<color>：参加<color=yellow>第二场比赛<color>的玩家需要支付<color=yellow>2金<color>比赛报名费，玩家最大人数为<color=yellow>100人<color>。获胜的玩家最终可以获得丰厚的奖励，您确定要参加吗？";
		else
			str = "<color=green>擂台老板<color>：这个场地尚未预定，您是想观看比赛还是参加比赛？";
		end
		Say(str,
			3,
			"参加比武/#SelectMultiRoom("..nMapIndex..")",
			"观看比赛/#View_Game("..nMapIndex..")",
			"离开/OnCancel_Talk"
		)
	elseif nMapState == 2 then
		Say("<color=green>擂台老板<color>：这个场地已经开始比武了，你想进来看看吗？",
			2,
			"观看比赛/#View_Game("..nMapIndex..")",
			"离开/OnCancel_Talk"
		)
	end
end

--开始一个多人擂台比赛房间
function OpenMultiRoom(nMapIndex)

	local i = 0;
	local BookedTab = {};
	local nNpcIndex = 0;
	local nMapState = 0;
	local nMapID = GetWorldPos();
	local str_news = "";

	--查看当前场地预订情况
	for i=1,getn(MultiMapTab) do
		if nMapID == MultiMapTab[i][2] and nMapIndex ~= i then
			OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1]);
			if SubWorld <= 0 then
				WriteLog("[多人擂台]：此 RequestGame SubWorld 错误，错误 nMapIndex 为"..nMapIndex..", SubWorld 为"..SubWorld..".");
				SubWorld = OldSubWorld;
				return 0
			end			
			nMapState = GetMissionV(MULTIMAP_STATE);
			SubWorld = OldSubWorld
			if nMapState ~= 0 then
				tinsert(BookedTab,i)
			end
		end
	end
	
	--判断已经预定的场地是否达到房间最大数量
	if getn(BookedTab) > MAX_MULTIMAP_NUM then
		Say("<color=green>擂台老板<color>：抱歉，这个场地已经被预定，请选择其他场地！",0)
		return
	elseif getn(BookedTab) == MAX_MULTIMAP_NUM then
		nMapIndex = BookedTab[random(1,getn(BookedTab))]
	end
	
	--判断是否符合比赛资格
	if JoinConditionCheck(1) == 0 then		
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[多人擂台]：此 RequestGame SubWorld 错误，错误 nMapIndex 为"..nMapIndex..", SubWorld 为"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1])
			OpenMission(MULIT_MISSION_ID);--开启一个场地
			nNpcIndex = CreateNpc("中原当铺老板","场地传送人",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--添加一个传送出场地用的Npc
			SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
			SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex);
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--加入阵型
		SetPlayerState(1,1);--设置准备状态
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--记录玩家阵型
		SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
		StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1, MULTI_TIMER_1);
		str_news = GetPlayerInfo(PlayerIndex)..GetName().."现在"..MultiMapTab[nMapIndex][9].."多人擂台赛正在准备当中，诚邀侠士踊跃参加。",
		Msg2Global(str_news);
	elseif nMapState == 1 then
		Say("<color=green>擂台老板<color>：抱歉，这个场地已经被预定，您可以进场参观比赛！",
			3,
			"报名参加比武/#SelectMultiRoom("..nMapIndex..")",
			"我要参观比武/#View_Game("..nMapIndex..")",
			"随便转转/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
		Say("<color=green>擂台老板<color>：比武正在进行中，您要进场参观比赛吗？",
			2,
			"我要参观比武/#View_Game("..nMapIndex..")",
			"随便转转/OnCancel_Talk"
		)
	end
end

--选择进入多人擂台场地
function SelectMultiRoom(nMapIndex)
	local nTotalFigtherNum = 0;
	local nTotalAudicnceNum = 0;
	local nGameType = 0;

	OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
		if SubWorld <= 0 then
		WriteLog("[多人擂台]：此 SelectMultiRoom SubWorld 错误，错误 nMapIndex 为"..nMapIndex..", SubWorld 为"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
		nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
		nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
		nGameType = GetMissionV(GAME_TYPE); 
		SubWorld = OldSubWorld
	
		--比赛人员尚未满员
	if nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
		JoinMultiMap(nMapIndex)
	--观战人员尚未满员
	elseif nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("<color=green>擂台老板<color>：比武人数已经满员了，侠士要进场参观吗？",
		2,
		"观看比赛/#View_Game("..nMapIndex..")",
		"离开/OnCancel_Talk"
		)
	else
		Say("<color=green>擂台老板<color>：抱歉，此场比赛比武人数和观众均已满员，少侠还是稍后再来！",0)
	end
end

--进入多人擂台场地
function JoinMultiMap(nMapIndex)
	local news_str = "";
	local nMapState = 0;
	local nTotalFigtherNum = 0;
	local nTotalAudicnceNum = 0;
	local nGameType = 0;

	OldSubWorld = SubWorld;
 	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
 	if SubWorld <= 0 then
		WriteLog("[多人擂台]：此 JoinMultiMap SubWorld 错误，错误 nMapIndex 为"..nMapIndex..", SubWorld 为"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
 	nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
	nGameType = GetMissionV(GAME_TYPE)
		
	if nMapState == 1 and nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
		--百人大擂入场费用判断
		if nGameType == 1 then
			--判断是否符合比赛资格
			if JoinConditionCheck(2) == 0 then		
				return
			end
		elseif nGameType == 2 then
			if Pay(HUNDRED_MONEY) ~= 1 then
				Say("<color=green>擂台老板<color>：第二次参加多人擂台需要支付<color=yellow>2金<color>，你好像没有这么多。",0)
				return
			else
				SetMissionV(MULTIMAP_BONUS,GetMissionV(MULTIMAP_BONUS)+HUNDRED_MONEY)
				--WriteLog("[多人擂台] 玩家 "..GetName().." 进入比赛，目前入场费用累计为："..GetMissionV(MULTIMAP_BONUS).." 帐号是"..GetAccount());
			end
		--判断是否符合比赛资格
		elseif JoinConditionCheck(1) == 0 then		
			return
		end
		
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		SetPlayerState(1,1);--设置准备状态
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--加入阵型
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--记录玩家阵型
		SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
		news_str = GetPlayerInfo(PlayerIndex)..GetName().."进入比赛场地，当前比武人数："..GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP).."人"
		Msg2MSAll(MULIT_MISSION_ID,news_str);
	elseif nTotalFigtherNum >= MAX_MULTIMAP_FIGTHER_NUM and nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("<color=green>擂台老板<color>：比武人数已经满员了，侠士要进场参观吗？",
		2,
		"观看比赛/#View_Game("..nMapIndex..")",
		"离开/OnCancel_Talk"
		)
	else
		Say("<color=green>擂台老板<color>：抱歉，此场比赛比武人数和观众均已满员，少侠还是稍后再来！",0)
	end

	SubWorld = OldSubWorld
	
end

--百人大擂比赛场地筹备中对话
function MapPreparingTalk()
	local nHour = GetLocalTime()
	if nHour >= 10 and nHour <= 12 then
		Say("<color=green>擂台老板<color>：抱歉，比赛场地正在筹备中，<color=yellow>第一场<color>多人擂台开始时间是<color=yellow>11:00<color>，<color=yellow>第二场<color>开始时间是<color=yellow>11:30<color>。",0)
	elseif nHour >= 16 and nHour <= 18 then
		Say("<color=green>擂台老板<color>：抱歉，比赛场地正在筹备中，<color=yellow>第一场<color>多人擂台开始时间是<color=yellow>17:00<color>，<color=yellow>第二场<color>开始时间是<color=yellow>17:30<color>。",0)
	elseif nHour >= 20 and nHour <= 22 then
		Say("<color=green>擂台老板<color>：抱歉，比赛场地正在筹备中，<color=yellow>第一场<color>多人擂台开始时间是<color=yellow>21:00<color>，<color=yellow>第二场<color>开始时间是<color=yellow>21:30<color>。",0)
	end
end

--参加比赛条件判断
--参数：nType 1、普通多人擂台；2、百人英雄大擂；3、普通组队混战擂台；4、团队激战大擂

function JoinConditionCheck(nType)
	if nType == 1 then
		if GetLevel() <10 or GetPlayerRoute() == 0 then
			Say("<color=green>擂台老板<color>：参加普通多人擂台玩家必须<color=yellow>10级<color>并加入<color=yellow>门派<color>。",0);
			return 0 
		else
			return 1
		end
	end
	if nType == 2 then
		if GetLevel() <60 or GetPlayerRoute() == 0 then
			Say("<color=green>擂台老板<color>：参加百人英雄大擂玩家必须<color=yellow>60级<color>并加入<color=yellow>门派<color>。",0);
			return 0
		else
			return 1
		end
	end
end

--比赛规则说明选项
function GameRuleTalk()
	Say("<color=green>擂台老板<color>：选择学习相关擂台比赛的规则：",
	5,
	"单人对战擂台/#GameRule(1)",
	"组队对战擂台/#GameRule(2)",
	"单人混战擂台/#GameRule(3)",
	"组队混战擂台/#GameRule(4)",
	"结束对话/OnCancel_Talk"
	)
end

function GameRule(nType)
	local strTalk = {};
	if nType == 1 then
		OnHelp();
	elseif nType == 2 then
		strTalk = {
			"组队对战擂台， 擂台双方竞争的公平场地。",	
			"想参与擂台赛，需要提前报名，组队进场。",	
			"报名成功后，进场等待下一个队伍进来。",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk)
	elseif nType == 3 then
		Rule_Multi();
	elseif nType == 4 then
		strTalk = {
			"单人混战擂台，由个人报名参加，双方各自为战，击败对方即可获得比赛胜利。",
			"这是一对一的形式比赛，如果找不到合适的对手，可以参加百人大擂比赛。",
			"参加擂台赛玩家达到10级以上且加入流派。 报名成功后，准备时间为3分钟。 如果场地上的队伍人数少于2队，则比赛将被取消。",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk);
	end
end

function GameRule_1(nType)
	local strTalk = {}; 
	if nType == 2 then
		strTalk = {
			"报名进入场地，并邀请其他流派参加比赛，两个流派比武准备时间为3分钟。",
			"3分钟后，比赛将开始，比赛时间为15分钟，击败对手即可获得胜利。",															
			"在比赛进行当中，队长将被杀死或返回城市，他的队伍将被击败。"													
		}
	elseif nType == 4 then
		strTalk = {
			"每场比赛最多可参加10支队伍，比赛时间为15分钟。 如果时间到了，剩下的队伍数量将超过1个根据淘汰的队伍人数来决定获胜者！",
			"在比赛进行当中，队长将被杀死或返回城市，他的队伍将被击败。"
--			"擂台老板：除了一般时段内开设的组队混战擂台场地外，{成都}还在特定的时间举办{团队激战大擂}。时间分别为 {早上12:00}、{12:30}，{下午18:00}、{18:30}和{晚上23:00}、{23:30}。",
		}
	end
	TalkEx("#GameRule_2("..nType..")",strTalk);
end

function GameRule_2(nType)
	local strTalk = {};
	if nType == 4 then
		strTalk = {
			"需要两个或更多人组成的队伍达到60级且加入流派。 每位参加其选择的第一场比赛3次的玩家均可获得一定的奖励（每天只能收到一次）； 进入第二场比赛，要求队长支付2金进入比赛。 当然，获胜的团队将获得丰厚的奖励。",
			"希望这次能见证了伟大的英雄!",
			}
		TalkEx("",strTalk);
	end
end

--多人擂台规则说明
function Rule_Multi()
	local strTalk = {
	"组队混战擂台，由组队报名参加，双方各自为战，击败对方即可获得比赛胜利。",
	"这是一对一的形式武术比赛，如果找不到合适的对手，可以参加百人大擂比赛。",
	"组队混战擂台允许10级且加入流派的玩家免费加入。 当然，获胜者也不会获得任何奖励。 成功注册后，准备时间为3分钟。 如果参加场地的人数少于1人，比赛将被取消。",
	}
	TalkEx("Rule_Multi_1",strTalk)
end

function Rule_Multi_1()
	local strTalk = {
	"擂台老板：{百人英雄大擂}则需要满{60级及以上已有流派}的江湖侠士参加，凡参加{三个时段内任意第一场比赛}的各位均会获得一定的奖励（每天只能获得一次）；至于第二场比赛需要交纳{2金}作为入场费，当然胜出者将会获得更加丰厚奖金.",
--	"擂台老板：除了一般时段内开设的普通单人混战擂台赛外，{成都}还在特定的时间举办{百人英雄大擂}。时间分别为 {早上11:00}、{11:30}，{下午17:00}、{17:30}和{晚上21:00}、{21:30}。",
--	"擂台老板：{百人英雄大擂}则需要满{60级及以上已有流派}的江湖侠士参加，凡参加{三个时段内任意第一场比赛}的各位均会获得一定的奖励（每天只能获得一次）；至于第二场比赛需要交纳{2金}作为入场费，当然胜出者将会获得更加丰厚奖金。",
--	"擂台老板：希望届时能在擂台上一睹大侠你的风采。",
	}
	TalkEx("",strTalk)
	
end

---------------多人组队单挑擂台---------------------
function OpenSingleTeamRoomRequest(nMapIndex)
	Say("<color=green>擂台老板<color>：这场地尚空闲，您想报名参加这场擂台比赛吗?",
		2,
		"我要报名/#OpenSingleTeamRoom("..nMapIndex..")",
		"离开/OnCancel_Talk"
	)
end

---------------单挑或组队押金擂台---------------------
function OpenSingleTeamRoomRequestYJ(nMapIndex)
	Say("<color=green>擂台老板<color>：尚未报名参加比赛，您要下注并进入擂台吗?",
		2,
		"挑战下注(下注比赛)/#OpenSingleTeamRoomYJ("..nMapIndex..")",
		"离开/OnCancel_Talk"
	)
end

--开启一个组队单挑擂台房间
function OpenSingleTeamRoom(nMapIndex)
	local i = 0;
	local x,y,z = 0,0,0;
	local nMapState = 0;
	local nTeamSize = 0;
	local strSay = "";
	local nCaptainName = "";

	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("<color=green>擂台老板<color>: 你已经报名了另外一个场地，无法再报名这个场地!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--判断是不是押金擂台，是的就不让进
		local nTag = GetMissionV(MS_YAJING_NUM);
		if nTag ~= 0 then
			Talk(1,"","<color=green>擂台老板<color>：这是下注的擂台，不允许进入!!");
			return
		end
		--尚未有比赛
		if nMapState == 0 then
			--判断是否符合比武资格
			if HaveSingleTemaGameTitle() == 1 then
				OpenMission(SINGLE_TEAM_MISSION_ID);
				OldPlayer = PlayerIndex; 			
				for i=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(i);
					if PlayerIndex > 0 then
						CleanInteractive();
						x,y,z = GetWorldPos();
						SetTask(MS_POS,x);
						SetTask(MS_POS+1,y);
						SetTask(MS_POS+2,z);
						NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
						SCCheckOfflineExp(4)
						AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--加入阵营
						SetPlayerState(1,1,2);--设置准备状态
						SetTaskTemp(PLAYER_CAMP,1);--记录玩家阵型
						SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					end
				end
				PlayerIndex = OldPlayer;
				--SetMissionV(TEAM_GAME_STATE,1); 			
				SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
				SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0)); 			
				--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);		
			end
		--比赛已经开始或两支队伍已在准备中	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("<color=green>擂台老板<color>：这个场地比赛已经开始，两个队伍<color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color>和<color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color>，想去这个场地看比赛吗?",
			2,
			"观看比赛/#RequestViewSingleTeamGame("..nMapIndex..")",
			"算了，不想去/OnCancel_Talk"
			)
		--比赛尚未开始
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				nCaptainName = gf_GetCaptainName();
				nTeamSize = gf_GetTeamSize();
			end
			PlayerIndex = OldPlayer;
			Say("<color=green>擂台老板<color>：你想选择<color=yellow>"..nCaptainName.."<color>引导(包括"..nTeamSize.."人)邀请玩家进入场地观看比赛?",
				3,
				"发送挑战/#RequestGame2Captian("..nMapIndex..")",
				"观看比赛/#RequestViewSingleTeamGame("..nMapIndex..")",
				"离开/OnCancel_Talk"
				)
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	SubWorld = OldWorld;
end

--开启一个单挑或组队的押金擂台房间
function OpenSingleTeamRoomYJ(nMapIndex)
	local i = 0;
	local x,y,z = 0,0,0;
	local nMapState = 0;
	local nTeamSize = 0;
	local strSay = "";
	local nCaptainName = "";
	
	--使用临时任务变量记录选择的房间
	SetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI, nMapIndex);
	
	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("<color=green>擂台老板<color>：你已经预定的别的赛场，不能进入此赛场!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--尚未有比赛
		if nMapState == 0 then
			--判断是否符合比武资格
			if HaveSingleTemaGameTitleYJ() == 1 then
					AskClientForNumber("AskSingleTeamYJNum",100,5000,"输入黄金投注金额","")
			end
		--比赛已经开始或两支队伍已在准备中	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("<color=green>擂台老板<color>: 这个阶段的比赛已经开始，成员包括<color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color>和<color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color>, 你想参加比赛吗?",
			2,
			"关于（投注比赛）/#RequestViewSingleTeamGame("..nMapIndex..")",
			"离开/OnCancel_Talk"
			)
		--比赛尚未开始
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			local nTag = GetMissionV(MS_YAJING_NUM);
			if nTag <= 0 then
				Talk(1,"","<color=green>擂台老板<color>: 比赛尚未开始.");
				return
			end
			if HaveSingleTemaGameTitleYJ() == 1 then
				OldPlayer = PlayerIndex;
				PlayerIndex = GetMissionV(CAPTAIN_ID);
				if PlayerIndex > 0 then
					nCaptainName = gf_GetCaptainName();
					nTeamSize = gf_GetTeamSize();
				end
				PlayerIndex = OldPlayer;
				Say("<color=green>擂台老板<color>: 你想选择<color=yellow>"..nCaptainName.."<color>领导(包括"..nTeamSize.."人)报名进入场地?<color=red>黄金押注为："..GetMissionV(MS_YAJING_NUM).."金<color>",
					3,
					"擂台比赛(下注比赛)/#RequestGame2CaptianYJ("..nMapIndex..")",
					"关于(投注锦标赛)/#RequestViewSingleTeamGame("..nMapIndex..")",
					"离开/OnCancel_Talk"
					)
			end
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	SubWorld = OldWorld;
end

--押金擂台报名
function AskSingleTeamYJNum(num)
	--押金数目检测
	if num < 100 or num > 5000 then
		Talk(1,"","<color=green>擂台老板<color>: 赌金在100-5000黄金范围内，超出或低于我们无法处理.");
		return 0;
	end
		
	local nMapIndex = GetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI);
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		
	--二次判断
	if GetMissionV(TEAM_GAME_STATE) ~= 0 or GetMissionV(MS_YAJING_NUM) > 0 then
		Talk(1,"","<color=green>擂台老板<color>：之前已经报过名，您不能再挑战这个了.")
		return 0;
	end
		
	if Pay(num * 10000) == 1 then
		gf_WriteLogEx("不好的赌注","支付黄金赌注",num,"金","",GetTongName(),"","","","");
		OpenMission(SINGLE_TEAM_MISSION_ID);
		local OldPlayer = PlayerIndex;
		for i=1, gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				CleanInteractive();
				x,y,z = GetWorldPos();
				SetTask(MS_POS,x);
				SetTask(MS_POS+1,y);
				SetTask(MS_POS+2,z);
				NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
				SCCheckOfflineExp(4)
				AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--加入阵营
				SetPlayerState(1,1,2);--设置准备状态
				SetTaskTemp(PLAYER_CAMP,1);--记录玩家阵型
				SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
				SetCreateTeam(1); --关闭组队功能
			end
		end
		PlayerIndex = OldPlayer;
		--SetMissionV(TEAM_GAME_STATE,1); 			
		SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
		SetMissionV(CAPTAIN_ID, gf_GetTeamMember(0)); 			
		--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);
		--设置押金数目
		SetMissionV(MS_YAJING_NUM, num);
	else
		Talk(1,"","<color=green>擂台老板<color>：金钱不足，投注失败.")
	end
end

function RequestGame2Captian(nMapIndex)
	local nMapState = 0;
	local strSay = "";
	local nTeamNum = 0;
	local nCaptainName = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);		
		--尚未有比赛
		if nMapState == 0 then
			Say("<color=green>擂台老板<color>：这场战斗尚未进行，您想报名并申请转移到场地吗?",
				2,
				"我要报名/#OpenSingleTeamRoom("..nMapIndex..")",
				"离开/OnCancel_Talk"
			)		
		--比赛已经开始或两支队伍已在准备中		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("<color=green>擂台老板<color>：这个场地已经开始，两个阵营的队伍<color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color>和<color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color>想去这个场地看比赛吗?",
				2,
				"观看比赛/#RequestViewSingleTeamGame("..nMapIndex..")",
				"离开/OnCancel_Talk"
				)
		--比赛尚未开始
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitle() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","您向团队发送了比赛请求"..nCaptainName..", 请耐心等待答复!");
				SendChallenge2Captain(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end
	SubWorld = OldWorld;
end

--押金擂台
function RequestGame2CaptianYJ(nMapIndex)
	local nMapState = 0;
	local strSay = "";
	local nTeamNum = 0;
	local nCaptainName = "";
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);	
		local nTag = GetMissionV(MS_YAJING_NUM);
		if nTag <= 0 then
			Talk(1,"","<color=green>擂台老板<color>：这是下注擂台,不下注无法进入擂台.");
			return
		end
		--尚未有比赛
		if nMapState == 0 then
			Say("<color=green>擂台老板<color>: 这场战斗尚未进行,您想报名并申请转移到场地吗?",
				2,
				"预订比赛场地(投注比赛)/#OpenSingleTeamRoomYJ("..nMapIndex..")",
				"离开/OnCancel_Talk"
				)		
		--比赛已经开始或两支队伍已在准备中		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("<color=green>擂台老板<color>: 这个场地已经开始竞争，两个营地的队伍<color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color>和<color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color>想去这个场地看比赛吗?",
				2,
				"关于(投注比赛)/#RequestViewSingleTeamGame("..nMapIndex..")",
				"离开/OnCancel_Talk"
				)
		--比赛尚未开始
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitleYJ() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","您向团队发送了比武请求"..nCaptainName..",请耐心等待答复!");
				SendChallenge2CaptainYJ(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end
	SubWorld = OldWorld;
end

--向队长发比武申请
function SendChallenge2Captain(nMapIndex,nChallengeIndex,nChallengeTeamSize)
	local nChallengeName = "";
	
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\中原二区\\成都\\npc\\擂台老板.lua");
					SetMissionS(i,nChallengeName);
					Say("有<color=yellow>"..nChallengeName.."<color>领队(包括：<color=yellow>"..nChallengeTeamSize.."<color>人)邀请你参加,你同意吗?",
					2,
					"同意/#AG("..nMapIndex..","..nChallengeIndex..","..i..")",
					"不同意/#RG("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;
end

--向队长发比武申请押金擂台
function SendChallenge2CaptainYJ(nMapIndex,nChallengeIndex,nChallengeTeamSize)
	local nChallengeName = "";
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\中原二区\\成都\\npc\\擂台老板.lua");
					SetMissionS(i,nChallengeName);
					Say("有<color=yellow>"..nChallengeName.."<color>领队(包括：<color=yellow>"..nChallengeTeamSize.."<color>人)邀请你参加,你同意吗?",
					2,
					"同意/#AGYJ("..nMapIndex..","..nChallengeIndex..","..i..")",
					"不同意/#RGYJ("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;
end

--双方同意比赛
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function AG(nMapIndex,nChallengeIndex,nChallengeNameIndex)
	local i = 0;
	local x,y,z = 0,0,0;
	local nCamp = 0;
	local str_news = "";
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--保证场地内还未有其他挑战者进入且比赛尚未开始
		if GetMissionV(TEAM_GAME_STATE) == 1 then
		
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
				OldPlayer = PlayerIndex;
				PlayerIndex = nChallengeIndex;
				if PlayerIndex > 0 then
					if GetName() == GetMissionS(nChallengeNameIndex) then
						--申请者不在当前擂台地图城市则返回
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
						SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
						if HaveSingleTemaGameTitle() == 1 then
							SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
							SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
							for i=1,gf_GetTeamSize() do
								PlayerIndex = gf_GetTeamMember(i);
								if PlayerIndex > 0 then
									x,y,z = GetWorldPos();
									SetTask(MS_POS,x);
									SetTask(MS_POS+1,y);
									SetTask(MS_POS+2,z);
									CleanInteractive();
									NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
									SCCheckOfflineExp(4)
									AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--加入阵营
									SetPlayerState(1,1,3);--设置准备状态
									SetTaskTemp(PLAYER_CAMP,2);--记录玩家阵型
									SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
								end
							end
							str_news = "有"..gf_GetCaptainName().."队(包括"..gf_GetTeamSize().."人)上阵."
							Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
						end
					end
				end
				PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--押金擂台
--双方同意比赛
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function AGYJ(nMapIndex,nChallengeIndex,nChallengeNameIndex)
	local i = 0;
	local x,y,z = 0,0,0;
	local nCamp = 0;
	local str_news = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--保证场地内还未有其他挑战者进入且比赛尚未开始
		if GetMissionV(TEAM_GAME_STATE) == 1 then
		
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
				OldPlayer = PlayerIndex;
				PlayerIndex = nChallengeIndex;
				if PlayerIndex > 0 then
					if GetName() == GetMissionS(nChallengeNameIndex) then
						--申请者不在当前擂台地图城市则返回
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
						SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
						if HaveSingleTemaGameTitleYJ() == 1 then
							--扣除挑战者的钱
							if Pay(GetMissionV(MS_YAJING_NUM) * 10000) ~= 1 then
								Talk(1,"","<color=green>擂台老板<color>: 黄金不足，投注失败.")
								local sChallengeName = GetName();
								PlayerIndex = OldPlayer;
								Talk(1,"",format("<color=green>擂台老板<color>: 挑战者没有足够的金币，战斗失败",sChallengeName))
								return
							end
							gf_WriteLogEx("不好的赌注","支付黄金赌注",GetMissionV(MS_YAJING_NUM),"金","",GetTongName(),"","","","");
							-----------------
							SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
							SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
							-----------------
							for i=1, gf_GetTeamSize() do
								PlayerIndex = gf_GetTeamMember(i);
								if PlayerIndex > 0 then
									x,y,z = GetWorldPos();
									SetTask(MS_POS,x);
									SetTask(MS_POS+1,y);
									SetTask(MS_POS+2,z);
									CleanInteractive();
									NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
									SCCheckOfflineExp(4)
									AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--加入阵营
									SetPlayerState(1,1,3);--设置准备状态
									SetTaskTemp(PLAYER_CAMP,2);--记录玩家阵型
									SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
									SetCreateTeam(1); --关闭组队功能
								end
							end
							str_news = "有"..gf_GetCaptainName().."带领团队或个人挑战（一起 "..gf_GetTeamSize().." 人)上阵."
							Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
						end
					end
				end
				PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--拒绝挑战者的申请
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function RG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

local nRejectorName = "";
local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"玩家："..nRejectorName.."拒绝你发起的挑战!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--押金擂台
--拒绝挑战者的申请
--参数 nMapIndex：比赛场地在SingleTeamMapTab中的index；nChallengeIndex：挑战者的PlayerIndex；nChallengeNameIndex：挑战者姓名在Mission中的index。
function RGYJ(nMapIndex,nChallengeIndex,nChallengeNameIndex)

	local nRejectorName = "";
	local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--清空申请人姓名
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"玩家:"..nRejectorName.."拒绝了你的挑战!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--单挑队伍观战处理
function RequestViewSingleTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]); 
	
	if GetMissionV(TEAM_GAME_STATE) == 0 then
		Say("<color=green>擂台老板<color>：抱歉! 这场战斗尚未开始！ 请下次再来！",0);
	elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,3) < MAX_MULTIMAP_AUDIENCE_NUM then
		CleanInteractive();
		NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--设置观战状态
		AddMSPlayer(SINGLE_TEAM_MISSION_ID,3);--加入阵型
		SetTaskTemp(PLAYER_CAMP,3);--记录玩家阵型
	else 
		Say("<color=green>擂台老板<color>: 抱歉,观众满座.下次快点!",0);
	end
	SubWorld = OldWorld;
end

---------------多人组队混战擂台----------------------------
function RequestTeamGame(nMapIndex)

	local nMapState = 0;
	local strSay = "";

	--已经预订了单人擂台的玩家给予通知并不允许进入赛场	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("<color=green>擂台老板<color>：您已经报名了一个场地，无法进入另一个场地!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			if IsTeamAwardTime() == 1 then
				TeamGamePreparingTalk();
			else
				Say("<color=green>擂台老板<color>：该场地没有预订,您要报名场地吗?",
						2,
						"我要报名/#JoinTeamRoom("..nMapIndex..")",
						"离开/OnCancel_Talk"
				)
			end
		elseif GetMissionV(TEAM_GAME_STATE) == 1 then
			if GetGameTeamNum() < MAX_TEAM_NUM then
				if IsTeamAwardTime() == 1 then
					if GetMissionV(GAME_TYPE) == 3 then
						strSay = "<color=green>擂台老板<color>：参加<color=yellow>第一场比赛<color>的队长可以免费报名，比赛结束后，所有参赛者将获得<color=yellow>积分和其他奖励<color>，确定要参加吗?";
					elseif GetMissionV(GAME_TYPE) == 4 then
						strSay = "<color=green>擂台老板<color>：为了参加<color=yellow>第二场比赛<color>,队长必须支付<color=yellow>10金<color>比赛报名费.最多参加比赛的队伍是<color=yellow>10队<color>.获胜方可以最终获得丰厚的奖励，确定想参加吗?";
					end
				else
					strSay = "<color=green>擂台老板<color>：现今这个擂台<color=yellow>"..GetGameTeamNum().."<color>准备比赛，您想比赛还是观看比赛?";
				end
				
				Say(strSay,
						3,
						"加入擂台/#JoinTeamRoom("..nMapIndex..")",
						"观看比赛/#RequestViewTeamGame("..nMapIndex..")",
						"离开/OnCancel_Talk"
				)
			else
				Say("<color=green>擂台老板<color>：已达达到这场战斗中报名的队伍数量"..MAX_TEAM_NUM..", 您想观看比赛吗?",
					2,
					"观看比赛/#RequestViewTeamGame("..nMapIndex..")",
					"离开/OnCancel_Talk"
			)
			end
		
		elseif GetMissionV(TEAM_GAME_STATE) == 2 then
		
			Say("<color=green>擂台老板<color>: 这场场地已经开始,你想进来看看吗?",
					2,
					"观看比赛/#RequestViewTeamGame("..nMapIndex..")",
					"离开/OnCancel_Talk"
			)
		end
	end
	SubWorld = OldWorld;
end

function JoinTeamRoom(nMapIndex)
	local i = 0;
	local x,y,z = 0,0,0;
	local nGameTeamIndex = 0;
	local news_str = "";
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld < 0 then
		WriteLog("[多人擂台] 场地 SubWorld错误，错误 MapID 为"..TeamMapTab[nMapIndex][1]..", SubWorld 为"..SubWorld..".");
		SubWorld = OldWorld;
		return 0
	end
	
	if HaveTemaGameTitle(GetMissionV(GAME_TYPE)) == 0 then
		return
	end
	
	nGameState = GetMissionV(TEAM_GAME_STATE);
		
	--赛场尚没有人
	if nGameState == 0 then
		OpenMission(TEAM_MISSION_ID);
		nNpcIndex = CreateNpc("中原当铺老板","场地传送人",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--添加一个传送出场地用的Npc
		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
		SetMissionV(NPC_INDEX,nNpcIndex)
		
		OldPlayer = PlayerIndex;
		
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
					CleanInteractive();
					NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
					SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,1);--加入阵营
					SetPlayerState(1,1,1);--设置准备状态
					SetTaskTemp(PLAYER_CAMP,1);--记录玩家阵型
					SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					AddTitle(21,1);
					SetCurTitle(21,1);				
				end
			end
			
			PlayerIndex = OldPlayer;
			
			SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
			SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0));
			
			StartMissionTimer(TEAM_MISSION_ID, TEAM_TIME_ID1, TEAM_TIMER_1);
			news_str = GetPlayerInfo(gf_GetTeamMember(0))..gf_GetCaptainName().."参加的"..TeamMapTab[nMapIndex][9].."擂台比赛正在准备当中，欢迎侠士踊跃参加。";
			SubWorld = OldWorld;
			Msg2SubWorld(news_str);
		--报名阶段	
		elseif nGameState == 1 then
		
			if GetGameTeamNum() >= MAX_TEAM_NUM then	
				TalkEx("",{"<color=green>擂台老板<color>:该场场地队伍已超过10个,过会儿回来!"});
				SubWorld = OldWorld;
				return
			end
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) == 0 then
					SetMissionS(CAPTAIN_NAME + i - 1,gf_GetCaptainName());
					SetMissionV(CAPTAIN_ID + i - 1,gf_GetTeamMember(0));
					nGameTeamIndex = i;
					break;
				end
			end
			
			OldPlayer = PlayerIndex;
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
					CleanInteractive();
					NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
					SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,nGameTeamIndex);--加入阵营
					SetPlayerState(1,1,1);--设置准备状态
					SetTaskTemp(PLAYER_CAMP,nGameTeamIndex);--记录玩家阵型
					SetTask(MULTIMAP_PLAYER_STATE,1);--标志角色身在多人擂台
					AddTitle(21,nGameTeamIndex);
					SetCurTitle(21,nGameTeamIndex);
				end
			end
			
			PlayerIndex = OldPlayer;
			news_str = "由"..GetName().."率领的队伍("..gf_GetTeamSize().."人)进入了擂台场地，擂台编号："..GetGameTeamNum().."。"
			if GetMissionV(GAME_TYPE) ~= 3 and GetMissionV(GAME_TYPE) ~= 4 and GetMissionV(TEAM_NEWS_STATE) > 3 then
				SetMissionV(TEAM_NEWS_STATE,GetMissionV(TEAM_NEWS_STATE)-3);
				news_str = news_str.."由于新队伍的到来，比赛延长1分钟。";
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
		--比赛阶段 
		elseif nGameState >= 2 then
			TalkEx("",{"比赛已经开始，稍后再来吧！"});
		end
	SubWorld = OldWorld;

end

--队伍混战观战处理
function RequestViewTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]); 
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			Say("<color=green>擂台老板<color>：抱歉! 这场战斗尚未开始，请下次再来?",0);
		elseif GetMSPlayerCount(TEAM_MISSION_ID,1) < MAX_MULTIMAP_AUDIENCE_NUM then
			CleanInteractive();
			NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
			SetPlayerState(1,2);--设置观战状态
			AddMSPlayer(TEAM_MISSION_ID,11);--加入阵型
			SetTaskTemp(PLAYER_CAMP,11);--记录玩家阵型
		else
			Say("<color=green>擂台老板<color>：抱歉,观众满座，下次快点!",0);
		end
	end
	SubWorld = OldWorld;
end

function TeamGamePreparingTalk()
	local nHour = GetLocalTime()
	if nHour >= 11 and nHour <= 12 then
		Say("<color=green>擂台老板<color>：抱歉! 场地正在准备中<color=yellow>第一场<color>比赛开始报名时间<color=yellow>12:00<color>，<color=yellow>第二场<color>进入时间<color=yellow>12:30<color>.",0)
	elseif nHour >= 17 and nHour <= 18 then
		Say("<color=green>擂台老板<color>：抱歉! 场地正在准备中<color=yellow>第一场<color>比赛开始报名时间<color=yellow>18:00<color>，<color=yellow>第二场<color>进入时间<color=yellow>18:30<color>.",0)
	elseif nHour >= 22 and nHour <= 23 then
		Say("<color=green>擂台老板<color>：抱歉! 场地正在准备中<color=yellow>第一场<color>比赛开始报名时间<color=yellow>23:00<color>，<color=yellow>第二场<color>进入时间<color=yellow>23:30<color>.",0)
	end
	
end

function GameOverTalk()
	Say("<color=green>擂台老板<color>：擂台已经结束了，请下次再来！",0)
end

--51活动师门历练擂台说明
function AboutShiMenGame()
end
