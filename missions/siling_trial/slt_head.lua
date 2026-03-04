Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\siling_trial\\slt_define.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

--检查功能是否在有效当前GS上
function slt_CheckMap()
	for i = 1, getn(SLT_MAP_ID) do
		if -1 == SubWorldID2Idx(SLT_MAP_ID[i]) then
			WriteLog(format("slt_CheckMap faild, mapID = %d", SLT_MAP_ID[i]));
			DebugOutput(format("slt_CheckMap faild, mapID = %d", SLT_MAP_ID[i]));
			return 0;
		end
	end	
	return 1;
end

--该功能仅且仅存在于一个指定NPC身上！！！
function slt_CheckNpc(npcIndex)
--	if GetNpcName(npcIndex) ~= SLT_NPC_NAME then
--		WriteLog(format("slt_CheckNpc failed, npcName = %s", GetNpcName(npcIndex)))
--		DebugOutput(format("slt_CheckNpc failed, npcName = %s", GetNpcName(npcIndex)));
--		return 0;
--	end
	return 1;	
end

--获得能够进入的地图和区域
function slt_GetRandMap(npcIndex)
	if slt_CheckMap() ~= 1 then
		return 0, 0;
	end
	if slt_CheckNpc(npcIndex) ~= 1 then
		return 0, 0;
	end
	--生成可用map table[1-45号]
	local n = 0;
	local t = {}
	for i = 1, SLT_AERA_NUM * getn(SLT_MAP_ID) do
		if 0 ~= mod(i, SLT_AERA_NUM) then
			local nIndex, nByte = slt_ToNpcIndexByte(i);
			if GetNpcTempDataByte(npcIndex, nIndex, nByte) == 0 then
				n = n + 1;
				t[n] = i;
			end
		end
	end
	if n <= 0 then
		return 0, 0;
	end
	--随机地图
	local nSeq = t[random(n)];
	local nMapSeq = ceil(nSeq / SLT_AERA_NUM);
	local nAeraSeq = nSeq - floor(nSeq / SLT_AERA_NUM) * SLT_AERA_NUM;
	--随机中央地图
	local nCtIndex, nCtByte = slt_ToNpcIndexByte(nMapSeq * SLT_AERA_NUM);
	if GetNpcTempDataByte(npcIndex, nCtIndex, nCtByte) == 0 and random(1000) <= 10 then
		nAeraSeq = SLT_AERA_NUM;
	end
	--返回结果
	DebugOutput("nMapSeq, nAeraSeq =", nMapSeq, nAeraSeq);
	return nMapSeq, nAeraSeq;
end

function slt_ToNpcIndexByte(nMapListId)
	DebugOutput("slt_ToNpcIndexByte", nMapListId);
	local nIndex = 1 + floor((nMapListId - 1)/4);
	local nByte = mod(nMapListId, 4)
	if nByte == 0 then  nByte = 4 end
	return nIndex, nByte;
end

--记录该区域已被使用
function slt_RecordMapUse(npcIndex, nMapSeq, nAeraSeq)
	--记录任务变量
	if slt_CheckNpc(npcIndex) ~= 1 then
		return 0;
	end
	SetTask(SLT_TASKID_3, npcIndex, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 1, nMapSeq, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 2, nAeraSeq, TASK_ACCESS_CODE_SLT);
	--记录到NPC临时数据
	local nIndex, nByte = slt_ToNpcIndexByte((nMapSeq - 1) * SLT_AERA_NUM + nAeraSeq);
	local nValue = GetNpcTempDataByte(npcIndex, nIndex, nByte);
	SetNpcTempDataByte(npcIndex, nIndex, nByte, nValue + 1);
	DebugOutput("slt_RecordMapUse", npcIndex, nIndex, nByte, nValue + 1)
end

--记录该区域未被使用
function slt_RecordMapNoUse()
	--记录任务变量
	local npcIndex = GetTask(SLT_TASKID_3);
	if slt_CheckNpc(npcIndex) ~= 1 then
		return 0;
	end
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	--记录到NPC临时数据
	local nIndex, nByte = slt_ToNpcIndexByte((nMapSeq - 1) * SLT_AERA_NUM + nAeraSeq);
	local nValue = GetNpcTempDataByte(npcIndex, nIndex, nByte);
	SetNpcTempDataByte(npcIndex, nIndex, nByte, max(nValue - 1, 0));
	SetTask(SLT_TASKID_3, 0, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 1, 0, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 2, 0, TASK_ACCESS_CODE_SLT);
	DebugOutput("slt_RecordMapNoUse", npcIndex, nIndex, nByte, max(nValue - 1, 0))
end

--开始四灵试炼
function slt_JoinAera(npcIndex, nMapSeq, nAeraSeq)
	DebugOutput(GetNpcName(npcIndex, nMapSeq, nAeraSeq));
	gf_TeamOperateEX(function ()
		CleanInteractive();
		if NewWorld(SLT_MAP_ID[%nMapSeq], SLT_AERA_POS[%nAeraSeq][1], SLT_AERA_POS[%nAeraSeq][2]) == 1 then
			SetTask(SLT_TASKID_1, 0, TASK_ACCESS_CODE_SLT);	
			SetTask(SLT_TASKID_2, 0, TASK_ACCESS_CODE_SLT);
			--创建登陆触发器
			CreateTrigger(1, SLT_TRIGGER_ID, SLT_TRIGGER_ID * 2);	
			ContinueTimer(GetTrigger(SLT_TRIGGER_ID * 2));
			CreateTrigger(3, SLT_LOGOUT_ID, SLT_LOGOUT_ID * 2);
			SetCreateTeam(1);
			SetFightState(1);	--战斗状态
			SetDeathScript(SLT_SCRIPT);	--死亡脚本
			ForbidChangePK(1);	--转换PK状态
			UseScrollEnable(0);	--使用回城符
			ForbitTrade(1);	--交易
			StallEnable(0);	--摆摊
			OpenFriendliness(1);	--好感度
			SetDeathPunish(0);	--死亡惩罚
			InteractiveEnable(0);	--互动
			ResetToNpcDamage(0);
			ResetToPlayerDamage(0);
			StopTimeGuage(-2);	--清除界面计时器
			UnLimitSkill(30149);
			BlockSkill(30149);
			slt_RecordMapUse(%npcIndex, %nMapSeq, %nAeraSeq);
			CountDownRevive(1, 120);
			SetTempRevPos(SLT_MAP_ID[%nMapSeq], SLT_AERA_POS[%nAeraSeq][1] * 32, SLT_AERA_POS[%nAeraSeq][2] * 32);
			SetTempRevScript(SLT_SCRIPT);
			Msg2Player("你目前正在进行灵魂训练!");
			
			if SLT_CHANGE_PET ~= 0 then
				--如果不是变身状态
				local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
				if bOk == 1 then
					ChangeModel2WorkingPet();
				end
				if ChangeModel2WorkingPet() ~= 1 then
					Say("无法执行该操作，请先解除当前状态后再试！!", 0);
					gf_Msg2Team(format("玩家%s无法进入灵魂训练区域", GetName()), 1);
					slt_LeaveAera();
					return 0;
				end
				ForbitChangeModel(1); --禁止pet变身
			end
		end
	end)
	AddRuntimeStat(26, 2, 0, GetTeamSize());--开启关卡人数
end

--离开四灵试炼
function slt_LeaveAera(noLeaveTeam)
	if NewWorld(SLT_EXIT_POS[1], SLT_EXIT_POS[2], SLT_EXIT_POS[3]) == 1 then
		slt_RecordMapNoUse();
		SetCreateTeam(0);
		SetFightState(0);	--战斗状态
		SetDeathScript("");	--死亡脚本
		ForbidChangePK(0);	--转换PK状态
		UseScrollEnable(1);	--使用回城符
		ForbitTrade(0);	--交易
		StallEnable(1);	--摆摊
		OpenFriendliness(0);	--好感度
		SetDeathPunish(1);	--死亡惩罚
		InteractiveEnable(1);	--互动
		ForbitChangeModel(0); --容许pet变身
		ResetToNpcDamage(0);
		ResetToPlayerDamage(0);
		StopTimeGuage(-2);	--清除界面计时器
		UnBlockSkill(30149);
		LimitSkill(30149);
		RemoveTrigger(GetTrigger(SLT_TRIGGER_ID * 2));
		RemoveTrigger(GetTrigger(SLT_LOGOUT_ID * 2));
		CountDownRevive();
		SetTempRevPos(0,0,0);
		SetTempRevScript("");
		SetTask(SLT_TASKID_1, 0, TASK_ACCESS_CODE_SLT);	
		SetTask(SLT_TASKID_2, 0, TASK_ACCESS_CODE_SLT);
		local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
		if tonumber(bOk) == 1 then
			ChangeModel2WorkingPet();
		end
		if not noLeaveTeam then
			LeaveTeam();
		end
		if IsPlayerDeath() ~= 0 then
			RevivePlayer(0);
		end
		Msg2Player("你无法进入灵魂训练区域!");
	end
end

function slt_AtSltMap()
	local nMapId = GetWorldPos();
	for i = 1, getn(SLT_MAP_ID) do
		if SLT_MAP_ID[i] == nMapId then
			return 1;
		end
	end	
	return 0;
end

--处理掉线的问题
function slt_LeaveGame()
	DebugOutput("slt_LeaveGame!", slt_AtSltMap(), GetTrigger(SLT_TRIGGER_ID * 2))
	if 1 == slt_AtSltMap() or GetTrigger(SLT_TRIGGER_ID * 2) ~= 0 then
		if GetName() == GetCaptainName() and GetTeamSize() == 1 then
			slt_RemoveAllNpc();
			slt_RemoveAllBox();
		end
		slt_LeaveAera();
	end
end

--trigger
function slt_OnTrigger()
	--地图检查
local nMapId = GetWorldPos();
if gf_MapIsAllow(SLT_MAP_ID, nMapId) ~= 1 then
	gf_Msg2Team(format("%s 无法进入圣炼之地！", GetName()), 1);
	slt_LeaveAera();
	return 0;
end
	--每个人的事
	local nStep = GetTask(SLT_TASKID_2);
	--创建npc
	if nStep == 0 then
		if GetCaptainName() == GetName() then
			slt_DialogNpc(); 
		end
		SetTask(SLT_TASKID_2, nStep + 1, TASK_ACCESS_CODE_SLT);
		return 0;
	end
	--等待npc开启
	if nStep <= 1 then
		return 0;
	end
	--已开启
	SetTask(SLT_TASKID_2, nStep + 1, TASK_ACCESS_CODE_SLT);
	--检查变身状态
if nStep > 3 and SLT_CHANGE_PET ~= 0 then 
	local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
	if bOk ~= 1 then
		Say("无法变更宠物形象，请确保宠物存在并未出战！", 0);
		gf_Msg2Team(format("%s 无法进入圣炼之地！", GetName()), 1);
		slt_LeaveAera();
		return 0;
	end
end
	--以下是队长的事了
	if GetCaptainName() ~= GetName() then
		return 0;
	end
if nStep == 3 then
	gf_Msg2Team("现在开始...", 1);
end
if mod(nStep, 6) == 0 then 
	gf_Msg2Team(format("圣炼之地进度 %d/%d", nStep, SLT_MISSION_STEP_MAX), 1);
	if gf_GetTaskByte(SLT_TASKID_1, 4) ~= 0 then
		gf_Msg2Team("注意：任务奖励可能会根据不同阶段发生变化。", 1);
	end
end
	--关卡最长时间
	if nStep >=  SLT_MISSION_STEP_MAX then
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_TeamOperateEX(slt_LeaveAera, 1);
		return 0;
	end
	--流程
	if nStep < 5 then return 0; end
if mod(nStep, 2) == 0 
	and mod(nStep, 4) ~= 0
	and slt_CanRefleshMonster() == 1 
	and gf_GetTaskByte(SLT_TASKID_1, 4) == 0 
	and gf_GetTaskByte(SLT_TASKID_1, 3) < 4 
then
	gf_Msg2Team(format("注意：下一波怪物将在%d秒后刷新", 10), 1);
end
	if mod(nStep, 4) == 0 
		and slt_CanRefleshMonster() == 1 
		and gf_GetTaskByte(SLT_TASKID_1, 4) == 0
		and gf_GetTaskByte(SLT_TASKID_1, 3) < 5 
	then
		gf_TeamOperateEX(function ()
			gf_SetTaskByte(SLT_TASKID_1, 3, gf_GetTaskByte(SLT_TASKID_1, 3) + 1, TASK_ACCESS_CODE_SLT)
			RestoreAll();
		end);
		local nType = gf_GetTaskByte(SLT_TASKID_1, 3);
if nType >= 1 and nType <= 3 then
	slt_RemoveAllBox();
	slt_RefleshMonster(nType, SLT_POINT_NUM);
elseif nType == 4 then
	slt_RemoveAllBox();
	slt_RefleshBoss();
elseif nType == 5 then
	gf_Msg2Team("请清除其他怪物后再继续！");
end
	end
end

--死亡脚本
function OnDeath(id, f, x)
	DebugOutput(id, f, x)
	--Npc Death
	if f and tonumber(f) == 0 then
		slt_RemoveNpc(id);
		if slt_CanRefleshMonster() == 1 then
			slt_PassAward(gf_GetTaskByte(SLT_TASKID_1, 3));
			gf_TeamOperateEX(function ()
				if IsPlayerDeath() == 1 then
					RevivePlayer(1);
				end
			end);
		end
	else
	--Player Death
local oldPlayerIndex = PlayerIndex;
for i = 1, GetTeamSize() do
	PlayerIndex = GetTeamMember(i);
	if IsPlayerDeath() ~= 1 then
		return 0;
	end
end
slt_RemoveAllNpc();
slt_RemoveAllBox();
gf_Msg2Team("所有成员已阵亡！退出试炼天际任务！", 2);
gf_TeamOperateEX(slt_LeaveAera, 1);
end
end

--Player Revive
function OnRevive()
	DebugOutput("OnRevive")
	SetFightState(1);
	RestoreAll(); --满血复活
end

--刷怪
function slt_RefleshMonster(nType, nNum)
	local tTypeMonster = {
		SLT_NPC_TEMPLATE_1,
		SLT_NPC_TEMPLATE_2,
		SLT_NPC_TEMPLATE_3,
	}
	if not tTypeMonster[nType] then
		return 0;
	end
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	local npcIndex = nil;
	local nRandNpc = random(getn(tTypeMonster[nType]));
	local tNpc = tTypeMonster[nType][nRandNpc];
	for i = 1, nNum do
		npcIndex = slt_CreateNpc(tNpc[1], tNpc[2], SLT_MAP_ID[nMapSeq], SLT_NPC_POS_1[nAeraSeq][1] + random(-2, 2), SLT_NPC_POS_1[nAeraSeq][2] + random(-2, 2));
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end	
	nRandNpc = random(getn(tTypeMonster[nType]));
	tNpc = tTypeMonster[nType][nRandNpc];
	for i = 1, nNum do
		npcIndex = slt_CreateNpc(tNpc[1], tNpc[2], SLT_MAP_ID[nMapSeq], SLT_NPC_POS_2[nAeraSeq][1] + random(-2, 2), SLT_NPC_POS_2[nAeraSeq][2] + random(-2, 2));
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
	nRandNpc = random(getn(tTypeMonster[nType]));
	tNpc = tTypeMonster[nType][nRandNpc];
	for i = 1, nNum do
		npcIndex = slt_CreateNpc(tNpc[1], tNpc[2], SLT_MAP_ID[nMapSeq], SLT_NPC_POS_3[nAeraSeq][1] + random(-2, 2), SLT_NPC_POS_3[nAeraSeq][2] + random(-2, 2));
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
gf_Msg2Team(format("完成阶段：%d 已经开始！", nType));
end

--刷奥特曼
function slt_RefleshBoss()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	local nIndexNpc = ceil(nAeraSeq / 2);
	if not SLT_BOSS_TEMPLATE[nIndexNpc] or not SLT_PARTNER_TEMPLATE[nIndexNpc] then
		return 0;
	end
	local npcIndex = nil;
	npcIndex = slt_CreateNpc(SLT_BOSS_TEMPLATE[nIndexNpc][1], SLT_BOSS_TEMPLATE[nIndexNpc][2], SLT_MAP_ID[nMapSeq], SLT_BOSS_POS[nAeraSeq][1], SLT_BOSS_POS[nAeraSeq][2]);
	SetNpcDeathScript(npcIndex, SLT_SCRIPT);
	SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	for i = 1, SLT_GENBAN_NUM do
		npcIndex = slt_CreateNpc(SLT_PARTNER_TEMPLATE[nIndexNpc][1], SLT_PARTNER_TEMPLATE[nIndexNpc][2], SLT_MAP_ID[nMapSeq], SLT_BOSS_POS[nAeraSeq][1], SLT_BOSS_POS[nAeraSeq][2]);
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
gf_Msg2Team("BOSS 已经出现！");
end

function slt_CreateNpc(szModel, szName, nMapId, nX, nY)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_npc_table then
		g_slt_npc_table = {};
	end
	if not g_slt_npc_table[nMapSeq] then
		g_slt_npc_table[nMapSeq] = {};
	end
	if not g_slt_npc_table[nMapSeq][nAeraSeq] then
		g_slt_npc_table[nMapSeq][nAeraSeq] = {};
	end
	local npcIndex = CreateNpc(szModel, szName, nMapId, nX, nY);
	tinsert(g_slt_npc_table[nMapSeq][nAeraSeq], npcIndex);
	DebugOutput("slt_CreateNpc", nMapSeq, nAeraSeq, npcIndex, getn(g_slt_npc_table[nMapSeq][nAeraSeq]));
	return npcIndex;
end

function slt_RemoveNpc(npcIndex)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	DebugOutput("slt_RemoveNpc", npcIndex, nMapSeq, nAeraSeq)
	if not g_slt_npc_table 
		or not g_slt_npc_table[nMapSeq] 
		or not g_slt_npc_table[nMapSeq][nAeraSeq]
		or type(g_slt_npc_table[nMapSeq][nAeraSeq]) ~= "table" then
		DebugOutput("slt_RemoveNpc error", type(g_slt_npc_table[nMapSeq][nAeraSeq]));
		return 0;
	end
	for i = 1, getn(g_slt_npc_table[nMapSeq][nAeraSeq]) do
		if tonumber(npcIndex) == tonumber(g_slt_npc_table[nMapSeq][nAeraSeq][i]) then
			DebugOutput(nMapSeq, nAeraSeq, npcIndex, GetNpcName(npcIndex));
			SetNpcLifeTime(npcIndex, 0);
			tremove(g_slt_npc_table[nMapSeq][nAeraSeq], i);
			return tonumber(npcIndex);
		end
	end
end

function slt_RemoveAllNpc()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_npc_table 
		or not g_slt_npc_table[nMapSeq] 
		or not g_slt_npc_table[nMapSeq][nAeraSeq]
		or type(g_slt_npc_table[nMapSeq][nAeraSeq]) ~= "table" then
		return 0;
	end
	local t = g_slt_npc_table[nMapSeq][nAeraSeq];
	for i = 1, getn(t) do
		DebugOutput(nMapSeq, nAeraSeq, t[i], GetNpcName(t[i]));
		SetNpcLifeTime(t[i], 0);
	end
	g_slt_npc_table[nMapSeq][nAeraSeq] = {};
end

function slt_CanRefleshMonster()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_npc_table then
		g_slt_npc_table = {};
	end
	if not g_slt_npc_table[nMapSeq] then
		g_slt_npc_table[nMapSeq] = {};
	end
	if not g_slt_npc_table[nMapSeq][nAeraSeq] then
		g_slt_npc_table[nMapSeq][nAeraSeq] = {};
	end
	if type(g_slt_npc_table[nMapSeq][nAeraSeq]) ~= "table" then
		g_slt_npc_table[nMapSeq][nAeraSeq] = {};
		return 1;
	end
	for i = 1, getn(g_slt_npc_table[nMapSeq][nAeraSeq]) do
		if IsNpcDeath(g_slt_npc_table[nMapSeq][nAeraSeq][i]) ~= 1 then
			return 0;
		end
	end
	g_slt_npc_table[nMapSeq][nAeraSeq] = {};	
	return 1;
end

--1-4
function slt_PassAward(nType)
	DebugOutput("slt_PassAward", nType);
	if nType < 1 or nType > 4 then
		return 0;
	end
	gf_TeamOperateEX(function ()
		local nExp = SLT_EXP[%nType] * (1 + GetVipCardParam() + SLT_ROUTE_ADD[gf_GetRouteCount() or 1] + SLT_EXP_ADD_PRB);
		gf_ModifyExp(nExp);
	end);
	local tAward = SLT_AWARD[nType];
	local nMapId, nX, nY = GetWorldPos();
	for k, v in tAward do
		if type(v) == "table" and getn(v) == 4 then
			for i = 1, v[3] do
				local npcIndex = slt_CreateBox(v[1], v[2], nMapId, nX + random(-4, 4), nY + random(-4, 4));
				SetNpcScript(npcIndex, v[4]);
				SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
			end
		end
	end
	slt_DialogNpc();
end

function slt_CreateBox(szModel, szName, nMapId, nX, nY)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table then
		g_slt_box_table = {};
	end
	if not g_slt_box_table[nMapSeq] then
		g_slt_box_table[nMapSeq] = {};
	end
	if not g_slt_box_table[nMapSeq][nAeraSeq] then
		g_slt_box_table[nMapSeq][nAeraSeq] = {};
	end
	local npcIndex = CreateNpc(szModel, szName, nMapId, nX, nY);
	tinsert(g_slt_box_table[nMapSeq][nAeraSeq], npcIndex);
	DebugOutput("slt_CreateBox", nMapSeq, nAeraSeq, npcIndex, getn(g_slt_box_table[nMapSeq][nAeraSeq]));
	gf_TeamOperateEX(function ()
		gf_SetTaskByte(SLT_TASKID_1, 4, gf_GetTaskByte(SLT_TASKID_1, 4) + 1, TASK_ACCESS_CODE_SLT);
	end);
	return npcIndex;
end

function slt_RemoveBox(npcIndex)
	local find = 0;
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table 
		or not g_slt_box_table[nMapSeq] 
		or not g_slt_box_table[nMapSeq][nAeraSeq]
		or type(g_slt_box_table[nMapSeq][nAeraSeq]) ~= "table" then
		DebugOutput("slt_RemoveBox error")
		return find;
	end
	DebugOutput("slt_RemoveBox", npcIndex, nMapSeq, nAeraSeq)
	for i = 1, getn(g_slt_box_table[nMapSeq][nAeraSeq]) do
		if tonumber(npcIndex) == tonumber(g_slt_box_table[nMapSeq][nAeraSeq][i]) then
			DebugOutput(nMapSeq, nAeraSeq, npcIndex, GetNpcName(npcIndex));
			SetNpcLifeTime(npcIndex, 0);
			SetNpcScript(npcIndex, "");
			tremove(g_slt_box_table[nMapSeq][nAeraSeq], i);
			gf_TeamOperateEX(function ()
				gf_SetTaskByte(SLT_TASKID_1, 4, gf_GetTaskByte(SLT_TASKID_1, 4) - 1, TASK_ACCESS_CODE_SLT);
			end);
			find = tonumber(npcIndex);
		end
	end
	--要设置一下步进配合复活角色
	if GetName() == GetCaptainName() and gf_GetTaskByte(SLT_TASKID_1, 4) == 0 then
		local nStep = GetTask(SLT_TASKID_2);
		if mod(nStep, 2) == 0 then
			SetTask(SLT_TASKID_2, nStep - 1, TASK_ACCESS_CODE_SLT);
		else
			if mod(nStep + 1, 4) == 0 then
				SetTask(SLT_TASKID_2, nStep - 2, TASK_ACCESS_CODE_SLT);
			end
		end
	end
	return find;
end

function slt_RemoveAllBox()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table 
		or not g_slt_box_table[nMapSeq] 
		or not g_slt_box_table[nMapSeq][nAeraSeq]
		or type(g_slt_box_table[nMapSeq][nAeraSeq]) ~= "table" then
		return 0;
	end
	local t = g_slt_box_table[nMapSeq][nAeraSeq];
	for i = 1, getn(t) do
		DebugOutput(nMapSeq, nAeraSeq, t[i], GetNpcName(t[i]));
		SetNpcLifeTime(t[i], 0);
	end
	g_slt_box_table[nMapSeq][nAeraSeq] = {};
end

--箱子
function main()
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	DebugOutput(npcIndex, npcName);
	local nStep = gf_GetTaskByte(SLT_TASKID_1, 3);
	if npcName == SLT_TONG_BOX then
		slt_tong_box(npcIndex, nStep);
	elseif npcName == SLT_YING_BOX then
		slt_yin_box(npcIndex);
	elseif npcName == SLT_JING_BOX then
		slt_jin_box(npcIndex);
	elseif npcName == SLT_NPC_NAME then
		if GetName() ~= GetCaptainName() then
			Say("不是队长，你无法进行此操作", 0);
			return 0;
		end
		slt_intro_npc(npcIndex, nStep);
	end
end

function slt_intro_npc(npcIndex, nStep)
	if nStep == 0 then
		Say(format("<color=green>%s:<color> T? Linh Th? thách!", SLT_NPC_NAME), 3,
			"\n进入试炼/#slt_StartGame("..npcIndex..")",
			"\n退出试炼/#slt_EndGame("..npcIndex..")",
			"\n查看详情/nothing");
	elseif nStep >= 1 and nStep < 4 then
		Say(format("<color=green>%s:<color> T? Linh Th? thách!", SLT_NPC_NAME), 3,
			"\n继续训练/#slt_NextStep("..npcIndex..")",
			"\n退出试炼/#slt_EndGame("..npcIndex..")",
			"\n查看详情/nothing");
	else
		Say(format("<color=green>%s:<color> T? Linh Th? thách!", SLT_NPC_NAME), 2,
			"\n退出试炼/#slt_EndGame("..npcIndex..")",
			"\n查看详情/nothing");
	end
end

function slt_tong_box(npcIndex, nType)
	--删箱子
	if tonumber(npcIndex) ~= slt_RemoveBox(npcIndex) then
		return 0;
	end
	--给奖励
	if 1 == nType then
		local nRetIndex = CustomAwardSelectOne("silian_tong_1");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex);
		end
	elseif 2 == nType then
		local nRetIndex = CustomAwardSelectOne("silian_tong_2");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex);
		end
	elseif 3 == nType then
		local nRetIndex = CustomAwardSelectOne("silian_tong_3");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex);
		end
	end
end

function slt_yin_box(npcIndex)
	if GetNpcTempData(npcIndex, SLT_NPC_TEMP_DATA_1) == 0 then
		Say("这个[阴盒]需要1个[尸魂令牌]（可通过杀怪掉落）。",
			2, 
			"\n我已经找到了/#slt_IamDaye("..npcIndex..")",	
			"\n还没准备好/nothing")
			--"\n删除宝箱/#slt_RemoveBox("..npcIndex..")")
		return
	else
		slt_speLoot(npcIndex);
	end
end

function slt_IamDaye(npcIdx)
	local daye = GetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_1);

	if 0 ~= daye then
		Talk(1, "", "我已经找到了");
		return 0;
	end

	if DelItem(SLT_OPEN_NEED[2],SLT_OPEN_NEED[3],SLT_OPEN_NEED[4],SLT_OPEN_NEED[5]) == 1 then
		SetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_1, PlayerIndex);
		slt_speLoot(npcIdx);
--		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {SLT_OPEN_NEED[2],SLT_OPEN_NEED[3],SLT_OPEN_NEED[4],SLT_OPEN_NEED[5]})
		AddRuntimeStat(26, 4, 0, SLT_OPEN_NEED[5]);--IB消耗计数
	else
		Talk(1, "", "你没有足够的[尸魂令牌]，还需要吗？可以在<color=yellow>杀怪<color>获得[尸魂令牌]");
	end
end

function slt_speLoot(npcIdx)
	local daye = GetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_1);
	if daye == 0 then
		return 0;
	end
	local tSel = {
		"可以领取奖励/nothing",
	}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = gf_FilterName(player_name,"/","-");
				player_name = gf_FilterName(player_name,"|","-");
				player_name = gf_FilterName(player_name,":","-");
				tinsert(tSel, 1, "我可以帮"..player_name.."领取奖励/#slt_lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "我要领取奖励/#slt_lootAward("..PlayerIndex..","..npcIdx..")");
	end

	local nLootItemId = GetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_2);
	if nLootItemId == 0 then
		nLootItemId = CustomAwardSelectOne("silian_yin");
		SetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_2, nLootItemId);
	end

	local ntype, tItem = CustomAwardGetAwardInfo2(nLootItemId);
	local msg = "";
	if tItem and getn(tItem) > 4 and tItem[4] > 0 then
		msg = format("<color=yellow>[%s]x%d<color>", GetItemName(tItem[1], tItem[2], tItem[3]), tItem[4]);
	end
	Say("<color=green>B秓 rng<color>: ?y c?"..msg, getn(tSel), tSel);
end

function slt_lootAwardOther(player_index, box_index)
	local player_index_save = PlayerIndex
	--判断该索引是否还是在该队伍中
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = gf_IsInTeam(player_index);
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>注意：<color>只能给队伍中的成员进行分配，且必须同时在线!")
		return
	end
	--分配对象的背包空间负重检测
	PlayerIndex = player_index
	local s_player_name = GetName()
	if GetFreeItemRoom() < SLT_NEED_ROOM then
		Talk(1,"","<color=green>注意：<color>背包空间不足!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>注意：<color>"..s_player_name.."的背包已满，无法分配!")
		return
	end

	PlayerIndex = player_index_save
	slt_lootAward(player_index, box_index)
end

function slt_lootAward(player_index, box_index)
	local player_index_save = PlayerIndex
	--删箱子
	if tonumber(box_index) ~= slt_RemoveBox(box_index) then
		return 0;
	end
	--给奖励
	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(SLT_NEED_ROOM, 100, "") ~= 1 then return end
	local nLootItemId = GetNpcTempData(box_index, SLT_NPC_TEMP_DATA_2);
	if nLootItemId == 0 then
		nLootItemId = CustomAwardSelectOne("silian_yin");
	end
	CustomAwardGiveOne(nLootItemId);
	SetNpcTempData(box_index, SLT_NPC_TEMP_DATA_1, 0);
	SetNpcTempData(box_index, SLT_NPC_TEMP_DATA_2, 0);

	PlayerIndex = player_index_save;
end

function slt_jin_box(npcIndex)
	--删除箱子
	if tonumber(npcIndex) ~= slt_RemoveBox(npcIndex) then
		return 0;
	end
	--给予奖励
	local tRequire = {};
	for i = 1, 8 do
		tinsert(tRequire, {SLT_OPEN_NEED[2], SLT_OPEN_NEED[3], SLT_OPEN_NEED[4], 1});
	end
	MA_Team_OpenUI(SLT_SCRIPT, "slt_jin_box_card", tRequire);
	--10秒后结束
	gf_TeamOperateEX(function ()
		SetTask(SLT_TASKID_2, SLT_MISSION_STEP_MAX - 3, TASK_ACCESS_CODE_SLT);
		Msg2Player(format("10 秒后结束任务!", 10));
	end);
end

function slt_jin_box_card(id)
	local nMapId = GetWorldPos();
	if gf_MapIsAllow(SLT_MAP_ID, nMapId) ~= 1 then
		SendScript2Client('Open([[ma]])');	--关闭翻牌界面
		return 0;
	end
	
	if gf_Judge_Room_Weight(2, 20, "") ~= 1 then
		return 0;
	end
	
	local g, d, p, n;
	if id < 8 then
		local nAwardIndex = CustomAwardSelectOne("silian_jin_free");
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(id, g, d, p, n, GetName());
		end
	else
		local tItem = MA_GetRequire(id);
		if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
			Talk(1, "", "你没有带上"..SLT_OPEN_NEED[1].."无法开启!");
			return 0;
		end
--		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tItem[1], tItem[2], tItem[3], tItem[4]})
		AddRuntimeStat(26, 4, 0, tItem[4]);--IB消耗计数
		local nAwardIndex = CustomAwardSelectOne("silian_jin_IB");
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(id, g, d, p, n, GetName());
		end
	end
end

function slt_DialogNpc()
	local nMapId, nX, nY = GetWorldPos();
	local npcIndex = slt_CreateNpc("Chu Béo Ho?ch", SLT_NPC_NAME, nMapId, nX, nY);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
end

function slt_StartGame(npcIndex)
	if tonumber(npcIndex) ~= slt_RemoveNpc(npcIndex) then
		return 0;
	end
	gf_TeamOperateEX(function ()
		SetTask(SLT_TASKID_2, 3, TASK_ACCESS_CODE_SLT);
	end);
end

function slt_NextStep(npcIndex)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table then
		g_slt_box_table = {};
	end
	if not g_slt_box_table[nMapSeq] then
		g_slt_box_table[nMapSeq] = {};
	end
	if not g_slt_box_table[nMapSeq][nAeraSeq] then
		g_slt_box_table[nMapSeq][nAeraSeq] = {};
	end
	DebugOutput("Count =", getn(g_slt_box_table[nMapSeq][nAeraSeq]))
	local AllDelete = 1;
	for i =1, getn(g_slt_box_table[nMapSeq][nAeraSeq]) do
		local npcName = GetNpcName(g_slt_box_table[nMapSeq][nAeraSeq][i]);
		DebugOutput(g_slt_box_table[nMapSeq][nAeraSeq][i], npcName, GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1), GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2));
		if npcName == SLT_TONG_BOX
			or npcName == SLT_JING_BOX
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1) > 0 
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2) > 0 then
			AllDelete = 0;
			break;
		end
	end
	if 1 ~= AllDelete then
		Say("我们无法获取更多的下一步!", 0);
		return 0;
	end
	if tonumber(npcIndex) == slt_RemoveNpc(npcIndex) then
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_TeamOperateEX(function ()
			gf_SetTaskByte(SLT_TASKID_1, 4, 0, TASK_ACCESS_CODE_SLT);
		end);
	end
end

function slt_EndGame(npcIndex)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table then
		g_slt_box_table = {};
	end
	if not g_slt_box_table[nMapSeq] then
		g_slt_box_table[nMapSeq] = {};
	end
	if not g_slt_box_table[nMapSeq][nAeraSeq] then
		g_slt_box_table[nMapSeq][nAeraSeq] = {};
	end
	DebugOutput("Count =", getn(g_slt_box_table[nMapSeq][nAeraSeq]))
	local AllDelete = 1;
	for i =1, getn(g_slt_box_table[nMapSeq][nAeraSeq]) do
		local npcName = GetNpcName(g_slt_box_table[nMapSeq][nAeraSeq][i]);
		DebugOutput(g_slt_box_table[nMapSeq][nAeraSeq][i], npcName, GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1), GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2));
		if npcName == SLT_TONG_BOX
			or npcName == SLT_JING_BOX
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1) > 0 
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2) > 0 then
			AllDelete = 0;
			break;
		end
	end
	if 1 ~= AllDelete then
		Say("我们无法删除更多的宝箱!", 0);
		return 0;
	end
	if tonumber(npcIndex) == slt_RemoveNpc(npcIndex) then
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_TeamOperateEX(slt_LeaveAera, 1);
		AddRuntimeStat(26, 3, 0, 1); --通关次数
	end
end