--create date:2007-07-04
--author:yanjun
--describe:定义一些帮会关卡相关的操作
Include("\\script\\missions\\tong_mission\\main_head.lua");
Include("\\script\\online_activites\\task_values.lua");--任务变量头文件


--获取目标场地的状态和使用场地的帮会名字
function TM_GetFieldInfo(nAreaIdx,nFieldIdx)
	local szTongName = "";
	local nMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nMapID,nAreaIdx,nFieldIdx);
	local nMisstionState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nFieldMapID);
	if nMisstionState == MS_STATE_IDEL then
		return nMisstionState,0,"空闲";
	else
		szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
		nStage = mf_GetMissionV(MISSION_ID,MV_STAGE,nFieldMapID);
		return nMisstionState,nStage,szTongName;
	end;
end;

--根据地图ID，区域索引，场地索引三者获取场地的地图ID
function TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx)
	return FTB_CITY[nCurMapID][nAreaIdx][nFieldIdx];
end;

--创建场地NPC
function TM_CreateFieldNpc(nMapID)
	local nNpcIdx = CreateNpc("王安石","紫光阁外堂管理者",nMapID,tPos_Out_Room[1],tPos_Out_Room[2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua");
	nNpcIdx = CreateNpc("王安石","紫光阁内堂管理者",nMapID,tPos_In_Room[1],tPos_In_Room[2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua");
end;

--获取正选、替补、正选中帮会领导的索引table
function TM_GetPlayerTable()
	local tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);	
	local tbNormalPlayer = {};
	local tbSubPlayer = {};
	local tbTongHeader = {};
	local nOldPlayerIdx = PlayerIndex;
	local nCurJob = 0;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			tinsert(tbNormalPlayer,PlayerIndex);
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob <= 3 and GetTaskTemp(TSK_TEMP_HELPER) ~= 1 then
				tinsert(tbTongHeader,PlayerIndex);
			end;
		else
			tinsert(tbSubPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPlayerIdx
	return tbNormalPlayer,tbSubPlayer,tbTongHeader;
end;

--获取场地里面的正选有多少个
function TM_GetNormalPlayerCount()
	local tbNormalPlayer = TM_GetPlayerTable();
	return getn(tbNormalPlayer);
end;

--获取替补的人数
function TM_GetSubPlayerCount()
	local _,tbSubPlayer = TM_GetPlayerTable();
	return getn(tbSubPlayer);
end;

--检测正选玩家的组成结构：某个流派正选人数是否超过3。符合规则返回1，不符合规则返回0
function TM_CheckNormalPlayer(nRoute)
	local tbNormalPlayer = TM_GetPlayerTable();
	local nOldPlayerIdx = PlayerIndex;
	local tbRoutCount = {};	
	for i=0,30 do	--初始化tbRoutCount
		tbRoutCount[i] = 0;
	end;
	for i=1,getn(tbNormalPlayer) do
		PlayerIndex = tbNormalPlayer[i];
		local nRoute = GetPlayerRoute();
		tbRoutCount[nRoute] = tbRoutCount[nRoute] + 1;
	end;
	PlayerIndex = nOldPlayerIdx;
	local nRoutPlayerCount = tbRoutCount[GetPlayerRoute()];
	if nRoutPlayerCount >= MAX_ROUTE_PLAYER_COUNT then
		return 0;
	else
		return 1;
	end;
end;

--初始化某个关卡
function TM_InitStage(nStage)
	TB_STAGE[nStage]:InitStage();
end;

--播放音效
function TM_PlaySound(tbPlayer,szWavFileName)
	local lfFunc = function(tArg)
		PlaySound("\\sound\\"..%szWavFileName);
	end;
	gf_OperatePlayers(tbPlayer,lfFunc,{});
end;	

--在某个地点播放一个特效
function TM_DoSpecialEffect(nMapX,nMapY,nEffectID,szEffectName,nTime)
	if szEffectName == nil or szEffectName == "" then
		szEffectName = " ";
	end;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = CreateNpc("透明人",szEffectName,nMapID,nMapX,nMapY);
	SetNpcLifeTime(nNpcIdx,nTime);
	SetCurrentNpcSFX(nNpcIdx,nEffectID,1,1);
end;

--sample:TM_SetRelayTongData("山泉居",5,"d",1);
function TM_SetRelayTongData(szTongName,nDataIdx,szFormat,nsData)
	AddRelayShareData(szTongName,0,0,"","",0,nDataIdx,szFormat,nsData);
	DelRelayShareDataCopy(szTongName,0,0);
end;

--检查当前帮会有没有激活场地
function TM_GetTongFieldState(szTongName)
	for i,v in FTB_CITY do
		for j=1,getn(v) do
			for k=1,getn(v[j]) do
				if tostring(GetMissionExValue(TONG_MISSIONEX,v[j][k])) == szTongName then
					return i,j,k;	--mapid,areaidx,fieldidx
				end;
			end;
		end;
	end;
	return 0,0,0;
end;

--清除目标城市的所有场地信息
function TM_ClearFieldState(nCityMapID)
	if SubWorldID2Idx(nCityMapID) >= 0 then
		gf_ShowDebugInfor("地图:"..nCityMapID.."所有相关信息");
		for i,v in FTB_CITY[nCityMapID] do
			for j=1,getn(v) do
				SetMissionExValue(TONG_MISSIONEX,v[j],0);
			end;
		end;
	end;
end;

--清除所有城市的场地信息
function TM_ClearAllFieldState()
	TM_ClearFieldState(100);
	TM_ClearFieldState(150);
	TM_ClearFieldState(200);
	TM_ClearFieldState(300);
	TM_ClearFieldState(350);
end;

--设置某个场地的信息：标记这个场被某个帮会占有
function TM_SetTongFieldState(nFieldMapID,szTongName)
	SetMissionExValue(TONG_MISSIONEX,nFieldMapID,szTongName);
end;

--创建一个对话箱子
function TM_CreateBox(nStage)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = CreateNpc("箱子钱","第"..nStage.."关的宝箱",nMapID,1569,3175);
	TM_SetUnitCurStates(nNpcIdx,1,nStage);	--标记这个箱子是第几关的
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_box.lua");
	SetMissionV(MV_GET_BOX,1);
end;

--函数名称：NPC索引值设定
--功        能：直接设定NPC索引位置的值
function TM_SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("错误的NPC设置: 位置"..att_seq.."值:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

--创建替补区的NPC
function TM_CreateSubNpc(nCount)
	local nNpcIdx = 0;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nNpcIdx = CreateNpc("替补区小怪","禁卫兵",nMapID,1536,3253,-1,1,1,200);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_sub_npc.lua");
	end;
end;

--修改NPC血量，参数1：NPC索引，参数2：血量值，参数3：是否为百分比，1表示是，0表示不是（默认是1）
function TM_ModifyNpcLife(nNpcIdx,nValue,bPercent)
	if bPercent == 0 then	--如果不是百分比
		ModifyNpcData(nNpcIdx,0,nValue,1);
		return 0;
	end;
	local nNpcMaxLife = GetUnitCurStates(nNpcIdx,1);	
	local nDamage = floor(nNpcMaxLife*nValue/100);	--根据百分比来计算改变的血量
	ModifyNpcData(nNpcIdx,0,nDamage,1);
end;

--获取NPC最大血量和当前血量，参数二表示当前血量是否为百分比,1表示是，0表示不是，默认是1
function TM_GetNpcLife(nNpcIdx,bPercent)
	if nNpcIdx == 0 then
		return 0,0;
	end;
	local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
	if bPercent == 0 then	--如果不是百分比
		return nMaxLife,nCurLife;
	end;
	gf_ShowDebugInfor("nCurLife:"..nCurLife);
	gf_ShowDebugInfor("nMaxLife:"..nMaxLife);
	return nMaxLife,floor(nCurLife/nMaxLife*100);
end;

--获取玩家的最大生命值和当前生命值
function TM_GetPlayerLife(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxLife,nCurLife = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),1);
	PlayerIndex = nOldIdx;
	return nMaxLife,nCurLife;
end;

--增加玩家关卡积分
function TM_AddPoint(nPoint,nCurStage,tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	if GetMissionV(MV_KILL_SUB_NPC) >= MIN_KILL_SUB_NPC_COUNT then
		nPoint = nPoint + KILL_SUB_NPC_POINT;
		Msg2MSAll(MISSION_ID,"在此关卡杀死"..MIN_KILL_SUB_NPC_COUNT.."个怪物，每人获得额外的"..KILL_SUB_NPC_POINT.."紫光阁积分。");
	end;
	local funAddPoint = function(tbArg)
		local nPassTimes = TM_GetStagePassTimes(%nCurStage);
		local nP = %nPoint;
		if nPassTimes == 2 then
			nP = floor(nP*4/5);
		elseif nPassTimes == 3 then
			nP = floor(nP*3/5);
		elseif nPassTimes >= 4 then
			nP = floor(nP*1/10);
		end;
--    if %nCurStage == 6 then
--        SetTask(VET_201009_00_TASK_TONGGUAN_ZIGUANG,1)
--    end
		SetTask(TSK_POINT,GetTask(TSK_POINT)+nP);
		Msg2Player("本周大侠一共通过了"..nPassTimes.."关"..%nCurStage.."，扣除实际"..%nPoint.."点积分，你可以获得"..nP.."点积分");
	end;
	gf_OperatePlayers(tbPlayer,funAddPoint,{});
end;

--增加玩家经验
function TM_AddExpAward(nCurStage,tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funAddExp = function(tbArg)
		local nPassTimes = TM_GetStagePassTimes(%nCurStage);
		local nX = 0;
		if nPassTimes == 1 then
			nX = 1;
		elseif nPassTimes == 2 then
			nX = 2/5;
		elseif nPassTimes == 3 then
			nX =1/5;
		elseif nPassTimes == 4 then
			nX = 1/10
		elseif nPassTimes > 4 then
			nX = 0;
		end;
		if IsPlayerDeath() ~= 1 then	--如果没死
			local nExp = floor(GetLevel()^3*4);
			local nExp2 = floor(nX*nExp);
			ModifyExp(nExp2);
	--		EventAddMaterial(3); -- Event
			Msg2Player("本周大侠一共通过了"..nPassTimes.."关"..%nCurStage.."，扣除"..nExp.."的经验值后，你可以获得"..nExp2.."经验");
		end;
	end;
	gf_OperatePlayers(tbPlayer,funAddExp,{});
end;

--获得怪的门派
function TM_GetNpcFaction(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx);
	local szPreName = szNpcName;
	if szPreName == "少林影子护卫" then
		return 1;
	elseif szPreName == "武当影子护卫" then
		return 2;
	elseif szPreName == "峨眉影子护卫" then
		return 3;
	elseif szPreName == "丐帮影子护卫" then
		return 4;
	elseif szPreName == "唐门影子护卫" then
		return 5;
	elseif szPreName == "杨门影子护卫" then
		return 6;
	elseif szPreName == "五毒影子护卫" then
		return 7;
	elseif szPreName == "昆仑影子护卫" then
		return 8;
	elseif szPreName == "翠烟影子护卫" then
		return 10;
	else
		return 0;
	end;
end;

--创建门派怪
function TM_CreateFactionNpc(nMapX,nMapY,nCount,nNpcTableIdx,nRadius)
	if nRadius == nil then
		nRadius = 50;	--默认是50范围内随机刷
	end;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel,szName = tb_Npc_Info[nNpcTableIdx][1],tb_Npc_Info[nNpcTableIdx][2];
	local nNpcIdx = 0;
	for i=1,nCount do
		nNpcIdx = CreateNpc(szModel,szName,nMapID,nMapX,nMapY,-1,1,1,nRadius);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
	SetMissionV(MV_FAC_NPC_COUNT,GetMissionV(MV_FAC_NPC_COUNT)+nCount);
end;

--给某玩家集合开始一个时间进度条
function TM_StartTimeGuage(szInfo,nDuration,bRepeat,nCustomID,tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID)
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end

--停止某个计时器
function TM_StopTimeGuage(nCustomID,tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;

--关闭所有城市的关卡
function TM_CloseAllField()
	for i,v in FTB_CITY do
		if SubWorldID2Idx(i) >= 0 then
			for j=1,getn(v) do
				for k=1,getn(v[j]) do
					mf_CloseMission(MISSION_ID,v[j][k]);
				end;
			end;
		end;
	end;
end;

--一周一清（现在改成周6周日各清一次）
function TM_WeeklyClear()
	local nCurWeek = tonumber(date("%y%W"));
	if GetTask(TSK_WEEK) < nCurWeek then
		SetTask(TSK_WEEK,nCurWeek);
		SetTask(TSK_ATTEND_STAGE_1,0);
		SetTask(TSK_ATTEND_STAGE_2,0);
		SetTask(TSK_ATTEND_STAGE_3,0);
		SetTask(TSK_ATTEND_STAGE_4,0);
		SetTask(TSK_ATTEND_STAGE_5,0);
		SetTask(TSK_ATTEND_STAGE_6,0);
                if tonumber(date("%w")) ~= 6 and tonumber(date("%w")) ~= 0 then
                    SetTask(2122, 0);--设定到了星期六可以重置
                end
        else
                if GetTask(2122) == 0 then
                    local nDay = tonumber(date("%w"));
                    if nDay == 6 or nDay == 0 then
                        SetTask(TSK_WEEK,nCurWeek);
		        SetTask(TSK_ATTEND_STAGE_1,0);
		        SetTask(TSK_ATTEND_STAGE_2,0);
		        SetTask(TSK_ATTEND_STAGE_3,0);
		        SetTask(TSK_ATTEND_STAGE_4,0);
		        SetTask(TSK_ATTEND_STAGE_5,0);
		        SetTask(TSK_ATTEND_STAGE_6,0);
                        SetTask(2122, 1);--设定重置一次后不能再重置了
                    end
                end
	end;
end;

--获得玩家本周通过某一天的次数
function TM_GetStagePassTimes(nStage)
	return GetTask(TSK_ATTEND_STAGE_1+nStage-1);
end;

--玩家通过某关卡次数加1
function TM_AddStagePassTimes(nStage,tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funAddPassTimes = function(tbArg)
		SetTask(TSK_ATTEND_STAGE_1+%nStage-1,TM_GetStagePassTimes(%nStage)+1);	
	end;
	gf_OperatePlayers(tbPlayer,funAddPassTimes,{});
end;

function nothing()

end;
