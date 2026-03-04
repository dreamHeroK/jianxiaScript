Include("\\script\\missions\\bw\\bwhead.lua")

function main()

local MapTab = {}
local nGemeTeamMapID = 0;
local nMapIndex = 0;
local nNpcIndex = 0;

	for i=1,getn(TeamMapTab) do
		if TeamMapTab[i][2] == 300 then
			OldWorld = SubWorld
			SubWorld = SubWorldID2Idx(TeamMapTab[i][1])
			if SubWorld ~= -1 then
				if GetMissionV(TEAM_GAME_STATE) == 0 then
					tinsert(MapTab,i)
				end
			end
			SubWorld = OldWorld
		end
	end
	
	if getn(MapTab) == 0 then
		WriteLog("[组队混战擂台]组队混战擂台错误！找不到目标区域！请再次检查！");
		return 0
	end
	
	nMapIndex = MapTab[random(1,getn(MapTab))];
	nGemeTeamMapID = TeamMapTab[nMapIndex][1];
	
	if SubWorldID2Idx(nGemeTeamMapID) ~= -1 then
		OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nGemeTeamMapID);
			
		if SubWorld <= 0 then
			WriteLog("[组队混战擂台]组队混战擂台错误! nHundredMapID 为"..nHundredMapID.."。不能进行比赛！");
			SubWorld = OldWorld;
			return 0
		end
			
		OpenMission(TEAM_MISSION_ID);
		SetMissionV(GAME_TYPE,3);
		StartMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2,TEAM_TIMER_2);
		nNpcIndex = CreateNpc("中原当铺老板","场地传送人",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--添加一个传送出场地用的Npc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
  		SetMissionV(NPC_INDEX,nNpcIndex);
  		SubWorld = OldWorld
	end
	
	Msg2SubWorld("泉州的擂台老板代志强组织了组队混战擂台，欢迎各位大侠踊跃参加！");
	AddGlobalNews("泉州的擂台老板代志强组织了组队混战擂台，欢迎各位大侠踊跃参加！");
	
end