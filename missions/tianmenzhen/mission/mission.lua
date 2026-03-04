Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

function InitMission()
	TMZ_InitBattle();
	local nMapId = gf_GetCurMapID();
	local nNpcIdx = 0;
	
	--========这里创建战场npc =================
	for i = 1,getn(tPositionNpcA)-1 do
		nNpcIdx = CreateNpc(tPositionNpcA[i][1],tPositionNpcA[i][2],nMapId,tPositionNpcA[i][3],tPositionNpcA[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionNpcB)-1 do
		nNpcIdx = CreateNpc(tPositionNpcB[i][1],tPositionNpcB[i][2],nMapId,tPositionNpcB[i][3],tPositionNpcB[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionNpcC)-1 do
		nNpcIdx = CreateNpc(tPositionNpcC[i][1],tPositionNpcC[i][2],nMapId,tPositionNpcC[i][3],tPositionNpcC[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionNpcS[2]) do
		nNpcIdx = CreateNpc(tPositionNpcS[1][1],tPositionNpcS[1][2],nMapId,tPositionNpcS[2][i][1],tPositionNpcS[2][i][2]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	for i = 1,getn(tPositionBox) do
		nNpcIdx = CreateNpc(tPositionBox[i][1],tPositionBox[i][2],nMapId,tPositionBox[i][3],tPositionBox[i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);		
	end
	--创建阵眼
	for i = 1,getn(tPositionNpcEye[0]) do
		nNpcIdx = CreateNpc(tPositionNpcEye[0][i][1],tPositionNpcEye[0][i][2],nMapId,tPositionNpcEye[0][i][3],tPositionNpcEye[0][i][4]);
		SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
		SetCampToNpc(nNpcIdx,Neutral_Type);
	end
	--创建职能npc		
	for i = 1,getn(tPositionFo) do --八个小佛
		nNpcIdx = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],nMapId,tPositionFo[i][3],tPositionFo[i][4]);
		SetCampToNpc(nNpcIdx,CampTwo_Type);--原版CampOne_Type因为自动buff原因互换了阵营
		CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1);--给个无敌
		nNpcIdx = CreateNpc(tPositionFo[i][1],tPositionFo[i][2],nMapId,tPositionFo[i][5],tPositionFo[i][6]);
		SetCampToNpc(nNpcIdx,CampOne_Type);
		CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1);--给个无敌
	end
	nNpcIdx = CreateNpc("宋战场军需官",CampOne_Name.."军需官",nMapId,tPositionCamp[1][3][1],tPositionCamp[1][3][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\quartermaster_npc.lua");
	nNpcIdx = CreateNpc("辽战场军需官",CameTwo_Name.."军需官",nMapId,tPositionCamp[2][3][1],tPositionCamp[2][3][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\quartermaster_npc.lua");	
	nNpcIdx = CreateNpc("会宁城巡逻官","军需士兵",nMapId,tPositionCamp[1][4][1],tPositionCamp[1][4][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\soldier_npc.lua");
	nNpcIdx = CreateNpc("会宁城巡逻官","军需士兵",nMapId,tPositionCamp[2][4][1],tPositionCamp[2][4][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\soldier_npc.lua");	
	nNpcIdx = CreateNpc("前线士官","大宋前线",nMapId,tPositionCamp[1][5][1],tPositionCamp[1][5][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\tmz_trap.lua");
	nNpcIdx = CreateNpc("前线士官","大辽前线",nMapId,tPositionCamp[2][5][1],tPositionCamp[2][5][2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\tmz_trap.lua");		
	--任务npc：了意、朗月、曹信真
	nNpcIdx = CreateNpc("朗月","朗月",nMapId,1917,3695);
	SetCampToNpc(nNpcIdx,Neutral_Type);
	nNpcIdx = CreateNpc("曹信真","曹信真",nMapId,1914,3689);	
	SetCampToNpc(nNpcIdx,Neutral_Type);
	nNpcIdx = CreateNpc("了意","了意",nMapId,1886,3758);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tianmenzhen\\liaoyi_npc.lua");

	CreateChannel("天门阵"..nMapId, 15);
	CreateChannel("宋方"..nMapId, 24);
	CreateChannel("辽方"..nMapId, 25);
	--Observer:onEvent(OE_TMZ_CREATE_NPC,{nMapId,Neutral_Type}); --pvp地图传入mapID和阵营，pve传入mapID和坐标
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"据侦探来报，敌方阵营已经开始采取行动，战斗人员迅速到前线，与敌人展开死战。");

	local nMapId  = gf_GetCurMapID();
	local nNpcIdx = 0;

	--boss_npc: 诡将黯月、狂将冥日
	if 1 == GLB_TMZ_RealmCheck() then
		local nDate = tonumber(date("%y%m%d"));
		for i = 1,getn(tPositionNpcBOSS) do
			if tPositionNpcBOSS[i][2][1] <= GetMissionV(MV_TMZ_TONG_CAMPONE_LV) and tPositionNpcBOSS[i][2][1] <= GetMissionV(MV_TMZ_TONG_CAMPTWO_LV) and tPositionNpcBOSS[i][2][2] >= random(1, 100) and (0 == tPositionNpcBOSS[i][2][3] or nDate ~= GetGlbValue(tPositionNpcBOSS[i][2][3])) then
				nNpcIdx = CreateNpc(tPositionNpcBOSS[i][1][1],tPositionNpcBOSS[i][1][2],nMapId,tPositionNpcBOSS[i][1][3],tPositionNpcBOSS[i][1][4]);
				SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
				SetCampToNpc(nNpcIdx,Neutral_Type);
				if 0 ~= tPositionNpcBOSS[i][2][3] then
					SetGlbValue(tPositionNpcBOSS[i][2][3], nDate);
				end
				Msg2MSAll(MISSION_ID,"据侦探来报，前方出现"..tPositionNpcBOSS[i][1][2]..", 让我们的战士赶快消灭它。");
				break
			end
		end
	end

	TMZ_RunBattle();
end;

function EndMission()
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	WriteLog("[天门阵战斗结束]: 时间是"..GetMissionV(MV_TMZ_LOG_TIME).."战斗结束了，人数最终: ["..nPlayerOne.."]:["..nPlayerTwo.."] 总人数是:"..(nPlayerOne+nPlayerTwo)); 
	TMZ_ProcessBattleOver();
	local nMapID = GetMissionV(MV_TMZ_MAP_ID);	
	ClearMapNpc(nMapID);
	local nMapIdx = GetMissionV(MV_TMZ_MAP_INDEX);
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	TMZ_Set_ShowData_Nil();
	TMZ_ClearMissionData();
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[天门阵演武]: FreeDynamicMap 错误，nRetCode:"..nRetCode);
	end;		
	DeleteChannel("天门阵"..nMapID, 15);
	DeleteChannel("宋方"..nMapID, 24);
	DeleteChannel("辽方"..nMapID, 25);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	TMZ_LeaveBattle();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	TMZ_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;