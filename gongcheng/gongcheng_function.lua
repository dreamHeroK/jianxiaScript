--create date:07-04-10
--author:yanjun
--describe:攻城战相关函数集合

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\gongcheng\\gongcheng_head.lua");

--获取玩家的攻城战阵营：攻城方还是守城方
function GCZ_GetPlayerCamp()
	return GetTaskTemp(TEMP_CAMP);
end;
--获取敌方阵营ID
function GCZ_GetEnemyCamp()
	return GONGSHOU_ID - GetTaskTemp(TEMP_CAMP);
end;
--判断玩家是不是某个城市的成员
function GCZ_IsCityMember(nCityMapID)
	if LIMIT_IGNORE == 1 then
		return 1;
	end;
	local _,_,nCityIdx = GCZ_GetCityInfo(nCityMapID);
	local szTongName = GetTongName();
	local szShouName = GCZ_GetCampNameFromRelay(nCityMapID,SHOU_ID)
	if szTongName == szShouName then
		return 1;
	else
		return 0;
	end;
end;
--当前在哪个战场地图,返回0表示不在战场地图，123分别表示泉州成都襄阳
function GCZ_InBattle()
	local nCityIdx = GetTaskTemp(TEMP_CITY_INDEX);
	return nCityIdx;
end;
--检查当前状况(攻门和攻城阶段)是否达到胜利条件
function GCZ_CheckWinCondition()
	local nCurFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nCurFlagCount >= FLAG_COUNT_WIN then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		SetMissionV(MV_WAR_RESULT,GONG_ID);	--设置结果
		local lfFunc = function(tArg)
			Say("在激烈的战斗中幸存下来,最后帮会<color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color>成功占领了?。(多帮会)<color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> 守城<color=yellow>"..GetMissionS(MS_CITY_NAME).."<color>.",0);
			SetFightState(0);
			if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
				SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			else
				SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			end;
		end;
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local szCityName,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID,nBattleMapID);
		SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
		Msg2Global("在激烈的战斗中幸存下来,最后帮会"..GetMissionS(MS_GONG_TONG_NAME).."成功(多帮会)"..GetMissionS(MS_SHOU_TONG_NAME).." 守卫)"..GetMissionS(MS_CITY_NAME));
		AddGlobalCountNews("T在激烈的战斗中幸存下来,最后帮会<color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color>成功(多帮会) <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color>守卫) <color=green>"..GetMissionS(MS_CITY_NAME).."<color>",1);
		PlayMusic("\\music\\themusicisnotexist.mp3",1);
		GCZ_PlaySound(GONG_ID,"攻城战胜利.wav");
		GCZ_PlaySound(SHOU_ID,"攻城战失败.wav");
		WriteLog("[成功攻城战]:"..GetMissionS(MS_GONG_TONG_NAME).."占领("..nCurFlagCount.." ) do"..GetMissionS(MS_SHOU_TONG_NAME).." 守卫"..GetMissionS(MS_CITY_NAME)..". MSUID l?"..GetMissionV(MV_MISSION_UID));
		return 1;
	else
		return 0;
	end;
end;
--从Relay共享数据库处获得攻守双方的帮会的名字
function GCZ_GetCampNameFromRelay(nCityMapID,nCamp)
	local szCityTong = GetCityWarInfo(nCityMapID, "base")
	local szGong,szShou = GetCityWarAD(nCityMapID)
	-- 如果守城方和占城方不一样，基本上是由于和区造成的，修复一下，注意，如果开启了多个攻城战，则不能这样做
	if szCityTong ~= nil and szCityTong ~= "" and szCityTong ~= szShou then
		if PlayerIndex > 0 then
			local szCityMap = tostring(nCityMapID)
			CustomDataSave("TongCitywar_Repair","sss",szCityMap,szGong,szCityTong)	-- 记录将要修改的
			ClearRelayShareData("_TongCityWarAD",0,0,"\\script\\gongcheng\\gongcheng_function.lua","gongcheng_remove")
			szShou = szCityTong
		else																		-- 不是由Player调用的
			szShou = szCityTong
		end
	end
	
	if nCamp == GONG_ID then
		return szGong;
	elseif nCamp == SHOU_ID then
		return szShou;
	else
		return szGong,szShou;
	end;
end;

function gongcheng_remove(nResult)
	local szCityMap, szGong, szCityTong = CustomDataRead("TongCitywar_Repair")
	if nResult == 1 and szCityMap ~= nil then
		AddRelayShareData("_TongCityWarAD",0,0,"","",0,szCityMap,"ddss",0,0,szGong,szCityTong)
		CustomDataRemove("TongCitywar_Repair")
	end
end

--获取攻守双方帮主的名字
function GCZ_GetTongHeaderName(nCamp)
	if nCamp == GONG_ID then
		return "山泉农夫";
	elseif nCamp == SHOU_ID then
		return "伊莎爱";
	else
		return "山泉农夫","伊莎爱";
	end;
end;
--获取城门守卫的名字。参数1：阵营，参数2：门的位置索引
function GCZ_GetGuardName(nCamp,nDoorIdx)
	local szEGuardName = GetName(GetMissionV(MV_GPIDX_EAST_DOOR+nCamp-1));
	local szSGuardName = GetName(GetMissionV(MV_GPIDX_SOUTH_DOOR+nCamp-1));
	local szWGuardName = GetName(GetMissionV(MV_GPIDX_WEST_DOOR+nCamp-1));
	if szEGuardName == "" then
		szEGuardName = "没有";
	end;
	if szSGuardName == "" then
		szSGuardName = "没有";
	end;
	if szWGuardName == "" then
		szWGuardName = "没有";
	end;
	if nDoorIdx == 1 then	--好像写得太死了，没办法，为了支持返回三个值
		return szEGuardName;
	elseif nDoorIdx == 2 then
		return szSGuardName;
	elseif nDoorIdx == 3 then
		return szWGuardName;
	else
		return szEGuardName,szSGuardName,szWGuardName;
	end;
end;
--获取城门守卫的PlayerIndex，参数同GCZ_GetGuardName
function GCZ_GetGuardPlayerIndex(nCamp,nDoorIdx)
	local nEGuardIdx = GetMissionV(MV_GPIDX_EAST_DOOR+nCamp-1);
	local nSGuardIdx = GetMissionV(MV_GPIDX_SOUTH_DOOR+nCamp-1);
	local nWGuardIdx = GetMissionV(MV_GPIDX_WEST_DOOR+nCamp-1);
	if nDoorIdx == 1 then	--好像写得太死了，没办法，为了支持返回三个值
		return nEGuardIdx;
	elseif nDoorIdx == 2 then
		return nSGuardIdx;
	elseif nDoorIdx == 3 then
		return nWGuardIdx;
	else
		return nEGuardIdx,nSGuardIdx,nWGuardIdx;
	end;	
end;
--根据某个战场地图ID获得所对应的城市信息
function GCZ_GetCityInfo(nBattleMapID)
	for i,v in tCityInfo do
		if v[3] == nBattleMapID then
			return v[1],v[2],i;	--城市地图名字，城市地图ID，地图Index
		end;
	end;
	return "",0,0;
end;
--根据获取某个城市的地图ID所对应的战场地图ID
function GCZ_GetBattleMapID(nCityMapID)
	for i,v in tCityInfo do
		if v[2] == nCityMapID then
			return v[3];
		end;
	end;
	return 0;
end;
--初始化所有墓地的状态
function GCZ_InitGraveyard()
	SetMissionV(MV_GRAVEYARD_A1,GONG_ID);
	SetMissionV(MV_GRAVEYARD_A2,GONG_ID);
	SetMissionV(MV_GRAVEYARD_B1,NONE_ID);
	SetMissionV(MV_GRAVEYARD_B2,NONE_ID);
	SetMissionV(MV_GRAVEYARD_C1,NONE_ID);
	SetMissionV(MV_GRAVEYARD_C2,NONE_ID);
	SetMissionV(MV_GRAVEYARD_11,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_12,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_21,SHOU_ID);
	SetMissionV(MV_GRAVEYARD_22,SHOU_ID);
end;
--设置墓地的状态
function GCZ_SetGraveyardStatus(nMSVID,nCamp,bEnable)
	local nCurStatus = GetMissionV(nMSVID);
	if nCurStatus == NONE_ID then
		if bEnable ~= 0 then
			SetMissionV(nMSVID,nCamp);
		end;
	elseif nCurStatus == ALL_ID then
		if bEnable == 0 then
			SetMissionV(nMSVID,GONGSHOU_ID-nCamp);
		end;	
	elseif nCurStatus == GONG_ID then
		if nCamp == GONG_ID and bEnable == 0 then
			SetMissionV(nMSVID,NONE_ID);
		elseif nCamp == SHOU_ID and bEnable ~= 0 then
			SetMissionV(nMSVID,ALL_ID);
		end;	
	elseif nCurStatus == SHOU_ID then
		if nCamp == GONG_ID and bEnable ~= 0 then
			SetMissionV(nMSVID,ALL_ID);
		elseif nCamp == SHOU_ID and bEnable == 0 then
			SetMissionV(nMSVID,NONE_ID);
		end;
	end;
end;
--初始化Trap点状态
function GCZ_InitTrap()
	SetMissionV(MV_TRAP_EAST_DOOR,ALL_ID);
	SetMissionV(MV_TRAP_WEST_DOOR,ALL_ID);
	SetMissionV(MV_TRAP_SOUTH_DOOR,ALL_ID);
end;
--创建Trap点
function GCZ_CreateTrap(nMapID)
	for i=1,32 do	--西门TRAP点
		AddMapTrap(nMapID,(1056+i)*32,(2803+i)*32,"\\script\\gongcheng\\trap\\westdoor_trap.lua")
		AddMapTrap(nMapID,(1052+i)*32,(2802+i)*32,"\\script\\gongcheng\\trap\\westdoor_trap.lua")
	end;
	for i=1,31 do	--南门TRAP点
		AddMapTrap(nMapID,(1182+i)*32,(2868+i)*32,"\\script\\gongcheng\\trap\\southdoor_trap.lua");
		AddMapTrap(nMapID,(1182+i)*32,(2867+i)*32,"\\script\\gongcheng\\trap\\southdoor_trap.lua");
	end;
	for i=1,30 do	--东门TRAP点
		AddMapTrap(nMapID,(1251+i)*32,(2996+i)*32,"\\script\\gongcheng\\trap\\eastdoor_trap.lua");
		AddMapTrap(nMapID,(1251+i)*32,(2995+i)*32,"\\script\\gongcheng\\trap\\eastdoor_trap.lua");
	end;
	for i=1,35 do	--西门单挑场地TRAP点
		AddMapTrap(nMapID,986*32,(2927-i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--攻方
		AddMapTrap(nMapID,1044*32,(2755+i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--守方
		AddMapTrap(nMapID,1416*32,(2950+i)*32,"\\script\\gongcheng\\trap\\westfightroom_trap.lua")	--传出
	end;
	for i=1,20 do	--南门单挑场地TRAP点
		AddMapTrap(nMapID,(1072+i)*32,2977*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
		AddMapTrap(nMapID,(1255+i)*32,2880*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
		AddMapTrap(nMapID,1369*32,(2999+i)*32,"\\script\\gongcheng\\trap\\southfightroom_trap.lua");
	end;
	for i=1,25 do	--东门单挑场地TRAP点
		AddMapTrap(nMapID,(1161+i)*32,(3077+i)*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
		AddMapTrap(nMapID,(1296+i)*32,3022*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
		AddMapTrap(nMapID,1321*32,(3048+i)*32,"\\script\\gongcheng\\trap\\eastfightroom_trap.lua");
	end;
	for i=1,22 do		--西桥TRAP点
		AddMapTrap(nMapID,(1011+i)*32,(2870+i)*32,"\\script\\gongcheng\\trap\\bridge_west_trap.lua");
		AddMapTrap(nMapID,(1011+i)*32,(2871+i)*32,"\\script\\gongcheng\\trap\\bridge_west_trap.lua");	
	end;		
	for i=1,24 do		--南桥TRAP点
		AddMapTrap(nMapID,(1143+i)*32,(2922+i)*32,"\\script\\gongcheng\\trap\\bridge_south_trap.lua");
		AddMapTrap(nMapID,(1143+i)*32,(2923+i)*32,"\\script\\gongcheng\\trap\\bridge_south_trap.lua");	
	end;
	for i=1,24 do		--东桥TRAP点
		AddMapTrap(nMapID,(1212+i)*32,(3050+i)*32,"\\script\\gongcheng\\trap\\bridge_east_trap.lua");
		AddMapTrap(nMapID,(1212+i)*32,(3051+i)*32,"\\script\\gongcheng\\trap\\bridge_east_trap.lua");		
	end;
gf_CreateSectionTrap(5100,1669,3462,1667,3442,"\\script\\gongcheng\\trap\\gong_trap.lua")--攻	
gf_CreateSectionTrap(5100,1901,3669,1921,3679,"\\script\\gongcheng\\trap\\shou_trap .lua")--守	
	
	
end;
--创建战场相关Npc
function GCZ_CreateNpc(nMapID)
	local nNpcIdx = CreateNpc("王安石","攻城参谋",nMapID,1640,3401);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\gongchengcanmou_npc.lua");
	nNpcIdx = CreateNpc("王安石","守城参谋",nMapID,1940,3695);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\shouchengcanmou_npc.lua");
	nNpcIdx = CreateNpc("王安石","攻城接引人",nMapID,1643,3405);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\chuansong_npc.lua");
	nNpcIdx = CreateNpc("王安石","守城接引人",nMapID,1936,3690);
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\chuansong_npc.lua");	
--	for i=1,getn(tChengMenJiGuanPos) do
--		nNpcIdx = CreateNpc(tChengMenJiGuanPos[i][4],tChengMenJiGuanPos[i][3],nMapID,tChengMenJiGuanPos[i][1],tChengMenJiGuanPos[i][2]);
--		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\chengmenjiguan_death.lua");		
--		SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,nNpcIdx);
--		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
--		gf_SetUnitCurState(nNpcIdx,0,i);
--	end;
	GCZ_CreateNormalFlag(nMapID);
--	GCZ_CreateReviviFlag(nMapID);
end;
--检查玩家是否满足所需的职位和天数要求
--nTongJob:0：未入帮 1：帮主 2：副帮主 3：长老 4：堂主 5：香主 6：普通成员
function GCZ_CheckPlayerRight(nTongJob,nDayCount)
	if LIMIT_IGNORE == 1 then
		return 1;
	end;
	local nCurJob = IsTongMember();
	if nCurJob == 0 then
		return 0;
	end;
	local nCurDayCount = GCZ_GetOnJobDayCount();
	if nCurJob <= nTongJob and nCurDayCount >= nDayCount then
		return 1;
	end;
	return 0;
end;
--获取队伍里面新的援军的数量
function GCZ_GetTeamReinforcementCount(nCamp,nBattleMapID)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local nCounter = 0;
	local nNewCounter = 0;
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	local szCampName = GCZ_GetCampNameFromRelay(nCityMapID,nCamp);
	local nCurMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			--如果是外援
			if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
				nCounter = nCounter + 1;
				--之前没进去过本阵营的外援
				if GetTask(TNC_MUID) ~= nCurMUID or GetTask(TNC_CAMP) ~= nCamp then
					nNewCounter = nNewCounter + 1;
				end;
			end;
		end;
	else	--处理一下没组队的情况
		--如果是外援
		if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
			nCounter = nCounter + 1;
			--之前没进去过的外援
			if GetTask(TNC_MUID) ~= nCurMUID then
				nNewCounter = nNewCounter + 1;
			end;
		end;	
	end;
	PlayerIndex = nOldPlayerIdx;
	return nCounter,nNewCounter;
end;
--判断玩家是不是某个目标地图上的某个阵营的外援
function GCZ_IsReinforcement(nCamp,nBattleMapID)
	local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
	local szCampName = GCZ_GetCampNameFromRelay(nCityMapID,nCamp);
	local szTongName = GetTongName();
	if szTongName ~= szCampName or GCZ_CheckPlayerRight(6,LEAST_STAY_DAY) == 0 then	--如果不是当前地图帮会或权利不够的话就是外援
		return 1;
	end;
end;
--获得队伍里面某个路线的玩家的数量
function GCZ_GetTeamRouteCount(nRoute)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local nCounter = 0;
	if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetPlayerRoute() == nRoute then
				nCounter = nCounter + 1;
			end;
		end;
	else	--处理一下没组队的情况
		if GetPlayerRoute() == nRoute then
			nCounter = nCounter + 1;
		end;	
	end;
	PlayerIndex = nOldPlayerIdx;
	return nCounter;
end;
--加入新的战场的时候所执行的函数，主要是清除一些战场变量
function GCZ_NewBattleClear()
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nCurMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	local nMyMUID = GetTask(TNC_MUID);
	if nMyMUID ~= nCurMUID then	--如果MUID不相同就表示当前要加入的是新的战场
		for i=TNC_BEGIN,TNC_END do
			SetTask(i,0);
		end;
	end;
end;
--创建不可重生的旗子
function GCZ_CreateNormalFlag(nMapID)
	local nNpcIdx = 0;
	for i=1,getn(tNormalFlagPos) do
		nNpcIdx = CreateNpc(tNormalFlagPos[i][4],tNormalFlagPos[i][3],nMapID,tNormalFlagPos[i][1],tNormalFlagPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\flag_normal_death.lua");
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		SetMissionV(MV_NORMAL_FLAG1_OWNER+i-1,SHOU_ID);
		CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1);
		BR_SetCurrentNpcSFX(nNpcIdx,1009);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
end;
function BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat)
	nPos = 0;	--默认在地上播
	bRepeat = 1;	--默认循环
	if IsNpcDeath(nNpcIdx) == 0 then	--如果NPC还活着就播放特效
		SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	end;
end;
--创建可重生的旗子
function GCZ_CreateReviviFlag(nMapID)
	local nNpcIdx = 0;
	for i=1,getn(tReviviFlagPos) do
		nNpcIdx = CreateNpc(tReviviFlagPos[i][5],tReviviFlagPos[i][3].."(守城方)",nMapID,tReviviFlagPos[i][1],tReviviFlagPos[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
		SetCampToNpc(nNpcIdx,tCampNameP[SHOU_ID]);
		SetMissionV(MV_REVIVI_FLAG1_OWNER+i-1,SHOU_ID);
		gf_SetUnitCurState(nNpcIdx,0,i);
	end;
end;
--根据可重生旗子的XY坐标获得它的索引
function GCZ_GetReviviFlagIndex(nNpcIdx)
	local nPosNum = getn(tReviviFlagPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--根据不可重生旗子的XY坐标获得它的索引
function GCZ_GetNormalFlagIndex(nNpcIdx)	
	local nPosNum = getn(tNormalFlagPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--根据城门机关的XY坐标获得它的索引
function GCZ_GetChengMenJiGuanIndex(nNpcIdx)
	local nPosNum = getn(tChengMenJiGuanPos);
	local nPosIdx = GetUnitCurStates(nNpcIdx,0);
	if nPosIdx <= 0 or nPosIdx > nPosNum then
		return 0;
	else
		return nPosIdx;
	end;
end;
--获得在位的天数
function GCZ_GetOnJobDayCount()
	if LIMIT_IGNORE == 1 then
		return 8;
	end;
	local nAssignTime = GetLastAssignTime();
	if nAssignTime == 0 then	--如果没有加入帮会
		return 0;
	end;
	local nDayCount = floor((GetTime()-nAssignTime)/(3600*24));
	return nDayCount;
end;
--获得加入帮会的天数
function GCZ_GetJoinTongDayCount()
	if LIMIT_IGNORE == 1 then
		return LEAST_STAY_DAY;
	end;
	local nJoinTime = GetJoinTongTime();
	if nJoinTime == 0 then	--如果没有加入帮会
		return 0;
	end;
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	return nDayCount;
end;
--获取某一方的人数信息。返回值：总人数，正规兵人数，外援人数
function GCZ_GetCampPlayerCount(nCamp,nBattleMapID)
	local nNormalSoldier = mf_GetPlayerCount(MISSION_ID,nCamp,nBattleMapID) or 0;
	local nReinforcement = mf_GetPlayerCount(MISSION_ID,nCamp+2,nBattleMapID) or 0;
	return (nNormalSoldier+nReinforcement),nNormalSoldier,nReinforcement;
end;
--封装的Msg2MSGroup
function GCZ_Msg2Camp(szMsg,nCamp)
	if nCamp == ALL_ID then
		Msg2MSAll(MISSION_ID,szMsg);
	else
		Msg2MSGroup(MISSION_ID,szMsg,nCamp);
		Msg2MSGroup(MISSION_ID,szMsg,nCamp+2);
	end;
end;
--播放一个wav文件
function GCZ_PlaySound(nCamp,szWavFileName)
	local lfFunc = function(tArg)
		PlaySound("\\sound\\"..%szWavFileName);
	end;
	if nCamp == ALL_ID then
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	else
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp+2);	
	end;
end;
--给某一个阵营播放一个mp3文件
function GCZ_PlayMusic(nCamp,szMusicFileName)
	local lfFunc = function(tArg)
		PlayMusic("\\music\\"..%szMusicFileName,1);
	end;
	if nCamp == ALL_ID then
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
	else
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp);
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},nCamp+2);
	end;
end;
--根据当前攻方占领的旗子数量设置攻守双方的背景音乐状态
--返回值：-1，两个都不播，0两个都播，1播攻方，2播守方
function GCZ_SetMusicState()
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	local nCurGongMusic = GetMissionV(MV_CUR_MUSIC_GONG);
	local nCurShouMusic = GetMissionV(MV_CUR_MUSIC_SHOU);
	local nNeedGongMusic = 0;
	local nNeedShouMusic = 0;
	if nFlagCount == 0 then	
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);
		nNeedGongMusic = MUSIC_WEIJI;
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);	
		nNeedShouMusic = MUSIC_YOUSHI
	elseif nFlagCount <= 5 then	
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_JIANG);
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_JIANG);	
		nNeedGongMusic = MUSIC_JIANG;
		nNeedShouMusic = MUSIC_JIANG;
	else
		SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_YOUSHI);
		SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_WEIJI);	
		nNeedGongMusic = MUSIC_YOUSHI;
		nNeedShouMusic = MUSIC_WEIJI;
	end;
	if nCurGongMusic == nNeedGongMusic and nCurShouMusic == nNeedShouMusic then
		return NONE_ID;	--双方音乐都没改变
	elseif nCurGongMusic ~= nNeedGongMusic and nCurShouMusic == nNeedShouMusic then
		return GONG_ID;	--攻方变了，守方没变
	elseif nCurGongMusic == nNeedGongMusic and nCurShouMusic ~= nNeedShouMusic then
		return SHOU_ID;	--攻方没变，守方变了
	else
		return ALL_ID;	--双方都变了
	end;
end;
--根据当前情况来播放相应的背景音乐
function GCZ_PlayBackGroundMusic(nCamp)
	if nCamp == NONE_ID then
		return 0;
	end;
	if nCamp == ALL_ID then
		GCZ_PlayMusic(GONG_ID,tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG)]);
		GCZ_PlayMusic(SHOU_ID,tMusicFileName[GetMissionV(MV_CUR_MUSIC_SHOU)]);
	else
		GCZ_PlayMusic(nCamp,tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)]);
	end;
	return 1;
end;
--检查所有的城门机关是否被破坏
function GCZ_CheckAllDoor()
	for i=MV_DESTROY_EAST_DOOR,MV_DESTROY_WEST_DOOR do
		if GetMissionV(i) == 0 then
			return 0;
		end;
	end;
	return 1;
end;
--转到攻门阶段
function GCZ_ComeToGongmeng()
		if GetMissionV(MV_MISSION_STATE) >= MS_STATE_GONGCHENG then
			return 0;
		end;
		SetMissionV(MV_MISSION_STATE,MS_STATE_GONGCHENG);
		SetMissionV(MV_TIMER_LOOP,GONGCHENG_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,GONGCHENG_TIMER_INTERVAL*FRAME_PER_MIN);
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		GCZ_PlaySound(ALL_ID,"攻门结束.wav");
		Msg2MSAll(MISSION_ID,"转入攻城阶段");
end;
--恢复所有生命和内力
function GCZ_RestoreAll()
	Restore();
	RestoreNeili();
	ClearColdDown();	--清除所有药CD
end;
function nothing()

end;



















