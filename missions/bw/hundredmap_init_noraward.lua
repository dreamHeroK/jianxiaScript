Include("\\script\\missions\\bw\\bwhead.lua")

function main()
	local MapTab = {}
	local nHundredMapID = 0;
	local nMapIndex = 0;
	local nNpcIndex = 0;

	for i=1,getn(MultiMapTab) do
		if MultiMapTab[i][2] == 300 then
			OldWorld = SubWorld
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1])
			if SubWorld ~= -1 then
				if GetMissionV(MULTIMAP_STATE) == 0 then
					tinsert(MapTab,i)
				end
			end
			SubWorld = OldWorld
		end
	end
	
	if getn(MapTab) == 0 then
		WriteLog("[百人英雄大擂]百人英雄大擂错误！找不到目标区域！请再次检查！");
		return 0
	end
	
	nMapIndex = MapTab[random(1,getn(MapTab))];
	nHundredMapID = MultiMapTab[nMapIndex][1];
	
	if SubWorldID2Idx(nHundredMapID) ~= -1 then
		OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nHundredMapID);
			
		if SubWorld <= 0 then
			WriteLog("[百人英雄大擂]百人英雄大擂错误! nHundredMapID 为"..nHundredMapID.."。不能进行比赛！");
			SubWorld = OldWorld;
			return 0
		end
			
		OpenMission(MULIT_MISSION_ID);
		SetMissionV(GAME_TYPE,1);
		StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2, MULTI_TIMER_2);
		nNpcIndex = CreateNpc("中原当铺老板","场地传送人",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--添加一个传送出场地用的Npc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
  		SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex);
  		SubWorld = OldWorld
	end
	
	Msg2SubWorld(泉州的擂台老板代志强组织了组队百人英雄大擂，欢迎各位大侠踊跃参加！");
	AddGlobalNews("泉州的擂台老板代志强组织了组队百人英雄大擂，欢迎各位大侠踊跃参加！");
end