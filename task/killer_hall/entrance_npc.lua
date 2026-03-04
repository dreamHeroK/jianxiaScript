--date:2007-3-7
--author:yanjun
--describe:this npc help player enter the killer hall
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\lib\\writelog.lua")

g_InfoHeader = "<color=green>神秘的男子<color>：";
function main()
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAP_ID then
		dialog_exit();
	else	
	--	Talk(1,"","杀手堂暂时关闭，请稍后再回来！！！")
		 dialog_enter();
	end;
end;

function dialog_enter()
	local selTab = {
				"我要自己进去/single_man_enter",
				"我要带队进入杀手堂/team_enter",
				"结束对话/nothing",
				}
	local nTeamSize = GetTeamSize()
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	if nInMapMemberCount >= 1 or nTeamSize <= 1 then	--如果有队友在杀手堂里面或者没有组队或队伍里面只有自己一个人
		tremove(selTab,2);
	else
		tremove(selTab,1);
	end;
	Say(g_InfoHeader.."你是谁？有啥事？",getn(selTab),selTab);
end;

function dialog_exit()
	local selTab = {
				"打开一条血路，离开杀手堂/go_out",
				"我再看看/nothing",
				}
	Say(g_InfoHeader.."这是真的吗？你要离开吗？还是回来吧！",getn(selTab),selTab);
end;

function go_out()
	local nRand = random(1,getn(tExitPos));
	NewWorld(tExitPos[nRand][1],tExitPos[nRand][2],tExitPos[nRand][3]);
end;

function get_pos_idx()
	local nPosIdx = 0;
	if random(1,100) <= 30 then	--%30概率传到门口
		nPosIdx = random(1,3);
	else
		nPosIdx = random(4,getn(tEntrancePos));	--70%概率传到房间里面
	end;
	return nPosIdx;
end;

function single_man_enter()
	CleanInteractive();
	if check_mission_state() == 1 then
		local nPlayerState = check_player_state();
		local nPosIdx = get_pos_idx();
		if nPlayerState == 1 then
			local nDate = tonumber(date("%y%m%d"));
			SetTask(KH_QUEST_TSK, floor(GetTask(KH_QUEST_TSK) / 10) * 10)
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(500000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				WriteLogEx("杀手堂10","加入杀手堂")
			end;
		elseif nPlayerState == 2 then
			Talk(1,"",g_InfoHeader.."你的技能太低了，无法加入杀手堂！")
		elseif nPlayerState == 3 then--之前进去过
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(500000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
			end;
--		elseif nPlayerState == 0 then
--			Talk(2,"",g_InfoHeader.."你是谁？你怎么敢闯进来？","<color=green>玩家<color>：糟了，没有杀手堂面具，被发现了，闯关失败。");		
		elseif nPlayerState == 4 then
			Talk(1,"",g_InfoHeader.."好像没有带来足够的钱来加入杀手堂！")
		elseif nPlayerState == 5 then
			Talk(1,"",g_InfoHeader.."等级不够，不能加入杀手堂!!!")
		end;
	end;
end;
--如果之前没进去过且没有杀手堂面具则返回0
--如果之前没进去过且有杀手堂面具赐返回1
--如果武功等级不够则返回2
--如果之前进去过则返回3
function check_player_state()
	if GetLevel() < 80 then 
		return 5
	end
--	if KH_Check_Skill_Level() ~= 1 then
--		return 2;	--武功等级不够
--	end;
	if GetCash() < 80000 then
		return 4
		--Talk(1,"","好像没有带来足够的钱来加入杀手堂！")
	end
	if GetItemCount(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4]) <= 0 then
		gf_Msg2Team(GetName().."你没有杀手堂面具，无法参与。",1)
		return 0;	--表示没有杀手堂面具
	end;
	if abs(GetTask(KH_TASK_MSUID) - mf_GetMissionV(MISSION_ID,MV_MISSION_UID,MAP_ID)) > 1 then	--如果之前没进去过
		local nDate = tonumber(date("%y%m%d"));
--		if  nDate < 201022 then
			if GetItemCount(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4]) <= 0 then
				return 0;	--表示没有杀手堂面具
			end;
--		end
		SetTask(KH_TASK_OPEN_BOX_TIME,0);	--开箱子次数清0
	else
		return 3;	--满足进入条件（之前进去过）
	end;
	return 1;	--满足进入条件（有面具）
end;

function team_enter()
	CleanInteractive();
	if GetTeamSize() <= 1 then
		Talk(1,"",g_InfoHeader.."您一个人能闯杀手堂吗？");
		return 0;
	end;
	if GetCaptainName() ~= GetName() then	--如果不是队长
		Talk(1,"",g_InfoHeader.."叫你的队长见我。");
		return 0;
	end;
	if check_mission_state() == 1 then
		if check_team_state() == 1 then
			transmit_team();
		else
			Talk(2,"",g_InfoHeader.."你是谁？你怎么敢闯进来？","<color=green>玩家<color>：糟了，没有杀手堂面具，被发现了，闯关失败。");
		end;
	end;
end;

function check_mission_state()
	local nTeamSize = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID)
--	Talk(1,"",SETTING_DYNAMIC_MISSION.."---"..MISSION_ID.."--"..MV_MISSION_STATE.."--"..MAP_ID.."--"..MS_STATE_IDEL.."--"..nTeamSize);
	
	
	if SETTING_DYNAMIC_MISSION == 0 then
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			Talk(1,"",g_InfoHeader.."暂时不能让任何人出现在杀手堂附近！");
			return 0;
		end;
	else
		if mf_OpenDynamicMission(MISSION_ID,MAP_ID) == 0 then
			Talk(1,"",g_InfoHeader.."暂时不能让任何人出现在杀手堂附近！");
			return 0
		end;
	end;
	if mf_GetPlayerCount(MISSION_ID,0,MAP_ID) >= MAX_PLAYER then
		Talk(1,"",g_InfoHeader.."杀手堂内已经人满为患，请在外面等一会！");
		return 0;
	end;
	return 1;
end;

function check_team_state()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	local nPlayerState = 0;
	local bCheckFail = 0;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		nPlayerState = check_player_state();
		if nPlayerState == 0 then
			gf_Msg2Team(GetName().."没有携带杀手堂面具",1)
			bCheckFail = 1;
--		elseif nPlayerState == 2 then
--			Talk(1, "", GetName().."武功等级不够");			
--			gf_Msg2Team(GetName().."武功等级不够",1);
--			bCheckFail = 1;
		elseif nPlayerState == 4 then
			Talk(1, "", GetName().."没有带足够的钱")	
			gf_Msg2Team(GetName().."没有带足够的钱",1);
			bCheckFail = 1;
		elseif nPlayerState == 5 then
			Talk(1, "", GetName().."等级不足81级")	
			gf_Msg2Team(GetName().."等级不足81级",1);
			bCheckFail = 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	if bCheckFail == 1 then
		return 0;
	end;
	return 1;
end;

function transmit_team()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	local nPosIdx = get_pos_idx();
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		CleanInteractive();
		if abs(GetTask(KH_TASK_MSUID) - mf_GetMissionV(MISSION_ID,MV_MISSION_UID,MAP_ID)) > 1 then	--之前没进去过\
			SetTask(KH_QUEST_TSK, floor(GetTask(KH_QUEST_TSK) / 10) * 10)
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(500000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 6));
				WriteLogEx("杀手堂10","加入杀手堂")
			else
				LeaveTeam();
			end;
		else
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(500000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 6));
			else
				LeaveTeam();
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function Give1stTimeExp()
	local nRand = random(1,100)
	if nRand <= 50 then
		gf_EventGiveCustomAward(1, 500000, 1)
	elseif nRand <= 70 then
		gf_EventGiveCustomAward(1, 1000000, 1)
	elseif nRand <= 90 then
		gf_EventGiveCustomAward(1, 1500000, 1)
	elseif nRand <= 95 then
		gf_EventGiveCustomAward(1, 2000000, 1)
	elseif nRand <= 99 then
		gf_EventGiveCustomAward(1, 3000000, 1)
	else
		gf_EventGiveCustomAward(1, 4000000, 1)
	end
end

function nothing()
end;