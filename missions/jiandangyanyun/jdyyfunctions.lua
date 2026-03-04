Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\message.lua");
Include("\\settings\\static_script\\misc\\missionaward_head.lua");
Include("\\script\\lib\\teamfunctions.lua");
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")

--SZ_CONDITION = "C莕 t?i  v祇 剑荡燕云﹏. Th祅h vi猲 t?i c莕 t <color=yellow>chuy觧 sinh 7 c蕄 90 tr?l猲, s?lng h?ph竔 b籲g 4, s?ngi trong i b籲g 4,  gia nh藀 h?ph竔 v?c? tinh l鵦<color> m韎 頲 v祇. M鏸 ng祔 t鑙 產 頲 v祇 5 l莕."

function JDYY_EnterCondCheck(szNpcName, nDifType)
	if PlayerIndex ~= GetTeamMember(0) then
		if GetTeamSize() ~= 0 then
			Talk(1, "", szNpcName.."请告诉队长过来。");
			return 0;
		else
			Talk(1, "", szNpcName.."剑荡烟云需要组队进入");
			return 0;
		end
	end
	
	local nTeamID = GetTeamID();
	if 1 ~= gf_team_check_gs(nTeamID) then
		Talk(1, "", szNpcName.."华丽的装备等待您的探险!");
		return 0;
	end
	-- 新增转生等级限制
	local szName = ""
	local flag = 1;
	local infoStr = ""
	local oldPlayer = PlayerIndex
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		szName = GetName()
--		if gf_GetTransLevel() < 790 then
--			flag = 2; -- 表示转生数不足
--			break;
--		end
--		if ModifyEnergy(0,1) < 20 then -- 需要检查精力
--			flag = 3;
--			break;
--		end
		if GetTask(JDYY_TSK_DC_ENTER) >= JDYY_ENTER_LIMIT then
			flag = 4;
			break;
		end
	end
	PlayerIndex = oldPlayer;
--	if flag==2 then
--		Talk(1, "", szNpcName..SZ_CONDITION)
--		gf_team_message(GetTeamID(), format("当前等级不足[%s]", szName), 3);
--		return 0;
--	end
	
--	if flag==3 then
--		Talk(1, "", szNpcName..SZ_CONDITION);
--		gf_team_message(GetTeamID(), format("S?lng tinh l鵦 c馻 Th祅h vi猲 [%s] trong i ban kh玭g ph?h頿 甶襲 ki謓.", szName), 3);
--		return 0;
--	end

--	if flag==4 then
--		Talk(1, "", szNpcName..SZ_CONDITION);
--		gf_team_message(GetTeamID(), format("Th祅h vi猲 [%s] trong i ban h玬 nay  tham gia %d l莕, m阨 ch?ng祔 mai v?l筰.", szName, JDYY_ENTER_LIMIT), 3);
--		return 0;
--	end


	local tConditions = {
		["MemberNum"] 		= {"队伍人数不符合条件"},
		["MemberRouteNum"] 	= {"队伍流派数不符合条件"},
		["MemberLevel"] 	= {"等级不符合条件", 1},
		["MemberHaveRoute"] = {"没有加入流派", 1},
		["PKValue"]			= {"PK值是10，太可怕了", 1},
	};
	
	
	local nTemID = GetTeamID();
	local _, tResInfo = gf_CheckTeamOptions(nTeamID, tOptions[nDifType]);
	if tResInfo and getn(tResInfo) > 0 then
		if 1 == nDifType then
		--	Talk(1, "", szNpcName..SZ_CONDITION);
		else
		--	Talk(1, "", szNpcName..SZ_CONDITION);
		end
		
		for i = 1, getn(tResInfo) do
			local tCondition = tConditions[tResInfo[i][1]];
			if tCondition then
				local szName = "";
				if tCondition[2] then
					local tPlayers = tResInfo[i][2];
					if getn(tPlayers) > 0 then szName = tPlayers[1][2]; end
					for k = 2, getn(tPlayers) do
						szName = szName .. ", " .. tPlayers[k][2];
					end
				end
				gf_team_message(nTeamID, szName .. tCondition[1], 3);
			end
		end
		return 0;
	end
	
	local oldPlayer = PlayerIndex
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		AddRuntimeStat(44,12,GetPlayerRoute(),1)
	end
	PlayerIndex = oldPlayer
	return 1;
end

function JDYY_CountPassRoute()
	AddRuntimeStat(44,36,GetPlayerRoute(),1)  --统计完成所有关卡的流派数
end

function JDYY_GetCaptainSafeName()
	if GetTeamSize() == 0 then
		return "";
	end
	local szRetName = "";
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	szRetName = GetSafeName();
	PlayerIndex = nOldPlayerIndex;
	return szRetName;
end

function JDYY_GetCaptainName()
	if GetTeamSize() == 0 then
		return "";
	end
	local szRetName = "";
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	szRetName = GetName();
	PlayerIndex = nOldPlayerIndex;
	return szRetName;
end

function JDYY_GetCaptainAccount()
	if GetTeamSize() == 0 then
		return "";
	end
	local szRetAccount = "";
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	szRetAccount = GetAccount();
	PlayerIndex = nOldPlayerIndex;
	return szRetAccount;
end

--判断玩家是否全部死亡或在幽灵区
function JDYY_PlayerDeadFailed()
	this.msCamp:reflash();
	for i = 1, getn(this.msCamp.players) do
		local nOldPlayerIndex = this.msCamp.players[i];
		
		if not JDYY_IsPlayerDeath(nOldPlayerIndex) and not JDYY_InDeathArea(nOldPlayerIndex) then
			return nil;
		end
	end
	return 1;
end

function JDYY_ReviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp, function()
		if IsPlayerDeath() == 1 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end);
end

function JDYY_RestoreAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp, function() ClearColdDown(); RestoreAll(); end);
end

function JDYY_IsCaptain()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
	return nil;
end

function JDYY_GoToStage(tCurPhase, tTargetPhase, nPreLv)
--	if tCurPhase.guage and tCurPhase.guage.id then
--		this.msCamp:turnPlayer(0, StopTimeGuage, tCurPhase.guage.id);
--	end
--	JDYY_ClearMapNpc();
--	JDYY_ReviveAll();
--	JDYY_RestoreAll();
--	JDYY_ClearAllState();
	
	SetMissionV(tTargetPhase.curPhaseLv, nPreLv);
	tCurPhase = tTargetPhase.phases[nPreLv];
	tCurPhase:onInit(tTargetPhase);
end

--bNotCreate ~= nil->不重复创建Npc
function JDYY_CreateNpc(NpcInfo, tPos, bNotCreate)
	local nMapId = this.msPosition:getMapID();
	local nNpcIdx = nil;
	if bNotCreate then
		nNpcIdx = JDYY_FindNpc(NpcInfo[2]);
		if 0 ~= nNpcIdx then
			SetNpcPos(nNpcIdx, tPos[1], tPos[2]);
			SetNpcScript(nNpcIdx, NpcInfo[3]);
			SetCampToNpc(nNpcIdx, NpcInfo[4]);
			return nNpcIdx;
		end
	end
	
	nNpcIdx = CreateNpc(NpcInfo[1], NpcInfo[2], nMapId, tPos[1], tPos[2]);
	
	if NpcInfo[3] then
		SetNpcScript(nNpcIdx, NpcInfo[3]);
	end
	SetCampToNpc(nNpcIdx, NpcInfo[4]);
	if not tExistNpcList[nMapId] then tExistNpcList[nMapId] = {}; end
	tExistNpcList[nMapId][nNpcIdx] = NpcInfo[1];
	
	-- logserver begin
--	if NpcInfo[4] == CampEnemy then	
--		this.msCamp:turnPlayer(0, function() sendCreateBossLog(this:mission_name(), %NpcInfo[1], this:mission_stage()) end)
--	end
	-- logserver end
	
	return nNpcIdx;
end

--检查最大开场数量
function JDYY_CheckMapCountLimit(szNpcName, nTargetMSDif)
	local tMapId = gf_GetDataTable(GetSameMaps(tJDYY.realMapID));
	for i = 1, getn(tMapId) do
		if tJDYY.realMapID == tMapId[i] then
			tremove(tMapId, i);
		end
	end
	
	local tRecord = {
		[eDifType.NORMAL] = 0,
		[eDifType.HARD] = 0,
	};
	
	for i = 1, getn(tMapId) do
		local nDifType = mf_GetMissionV(tJDYY.missionID, tJDYY.mv_01, tMapId[i]);
		tRecord[nDifType] = tRecord[nDifType] + 1;
	end
	
	if tRecord[nTargetMSDif] >= tMapCountLimit[nTargetMSDif] then
		Talk(1, "", format("当前剑荡烟云繁忙请稍等", szNpcName, tMapCountLimit[nTargetMSDif]));
		return 0;
	end
	return 1;
end

--清除本地上的所有指定名字npc
function JDYY_ClearNpc(name)
	local nMapId = this.msPosition:getMapID();
	local tNpcs = GetMapNpcIdx(nMapId);
	
	if type(name) == "table" then
		for k, v in tNpcs do
			for i = 1, getn(name) do
				if GetNpcName(v) == name[i] then
					SetNpcLifeTime(v, 0);
					SetNpcScript(v, "");
					if tExistNpcList[nMapId] and tExistNpcList[nMapId][v] then tExistNpcList[nMapId][v] = nil; end
					break;
				end
			end
		end
	elseif type(name) == "string" then
		for k, v in tNpcs do
			if GetNpcName(v) == name then
				SetNpcLifeTime(v, 0);
				SetNpcScript(v, "");
				if tExistNpcList[nMapId] and tExistNpcList[nMapId][v] then tExistNpcList[nMapId][v] = nil; end
			end
		end
	end
end

function JDYY_ClearPlayerSFX()
	this.msCamp:turnPlayer(nCamp, function() 
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 1, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 1, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 0, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 0, 1);
		end);
end

function JDYY_ClearMapNpc()
	local nMapId = this.msPosition:getMapID();
	ClearMapNpc(nMapId);
	tExistNpcList[nMapId] = {};
	
	local tNpcIdx = GetMapNpcIdx();
	if tNpcIdx and getn(tNpcIdx) >= 1 then
		WriteLog("[JDYY_ClearMapNpc] [剑荡烟云清理NPC!!!!!!!!!!!]");
	end
	
	if GetMSPlayerCount(tJDYY.missionID) == 0 then
		CloseMission(tJDYY.missionID);
	end
end

function JDYY_ClearMapNpcExcept(tNpcNames)
	if type(tNpcNames) ~= "table" or 0 == getn(tNpcNames) then return 0; end
	
	local tFlag = {};
	for i = 1, getn(tNpcNames) do
		tFlag[tNpcNames[i]] = 1;
	end
	local nMapId = this.msPosition:getMapID();
	local tNpcIdx = GetMapNpcIdx(nMapId);
	for i = 1, getn(tNpcIdx) do
		local szName = GetNpcName(tNpcIdx[i]);
		if not tFlag[szName] then RemoveNpc(tNpcIdx[i]); end
	end
end

function JDYY_FindNpc(szName)
	local nMapId = this.msPosition:getMapID();
	if tExistNpcList[nMapId] then
		for k, v in tExistNpcList[nMapId] do
			if v == szName and GetNpcName(k) == szName then
				return k;
			end
		end
	end
	
	local tNpcIdx = GetMapNpcIdx(nMapId);
	if not tNpcIdx then return 0; end
	for i = 1, getn(tNpcIdx) do
		if GetNpcName(tNpcIdx[i]) == szName then
			return tNpcIdx[i];
		end
	end
	return 0;
end

function JDYY_FindAllNpc(szName)
	local tNpcIdx = {};
	local nMapId = this.msPosition:getMapID();
	local tTmp = GetMapNpcIdx(nMapId);
	for i = 1, getn(tTmp) do
		if szName == GetNpcName(tTmp[i]) then
			tinsert(tNpcIdx, tTmp[i]);
		end
	end
	return tNpcIdx;
end

function JDYY_SetNpcType2Fight(nNpcIdx)
	AddUnitStates(nNpcIdx, 7, 3-GetUnitCurStates(nNpcIdx, 7));
	AddUnitStates(nNpcIdx, 8, 1000);
	ChangeNpcToFight(nNpcIdx, 3, 0);
end

function JDYY_SetNpcType2Talk(nNpcIdx)
	AddUnitStates(nNpcIdx, 7, 0);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));	--视野变0
	ChangeNpcToFight(nNpcIdx, 0, 6);
end

--怪物寻找指定坐标范围内的随机玩家攻击
function JDYY_FindRandomPlayer(tPos, nNum, nDis)
	if not tPos then return 0; end
	this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	local tPlayers = {};
	if not nDis then nDis = 50; end
	for k, v in this.msCamp.players do
		PlayerIndex = v;
		local _, x, y = GetWorldPos();
		if (abs(tPos[1] - x) <= nDis and abs(tPos[2] - y) <= nDis) and not JDYY_IsPlayerDeath() and not JDYY_InDeathArea() then
			tinsert(tPlayers, v);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	local nSize = getn(tPlayers);
	if nNum then
		nNum = min(nNum, nSize);
		local tList = floyd_m4n(nSize, nNum);
		tList.n = nil;
		local tTemp = {};
		
		for k, v in tList do
			tinsert(tTemp, tPlayers[k]);
		end
		return tTemp;
	end
	if 0 == nSize then return 0; end
	return tPlayers[random(1, nSize)];
end

function JDYY_ConfirmClose(szNpcName)
	local szMsg = format("<color=green>%s:<color>确定离开副本？", szNpcName);
	suSay(szMsg, 2, "确定/JDYY_CloseMission", "取消/nothing");
end

function JDYY_CloseMission()
	SetMissionV(MV_MISSION_STATUS, 1);
	local nMapId = this.msPosition:getMapID();
	tExistNpcList[nMapId] = nil;
	SetTeamPKStatus(GetTeamID(), 0, 0);
	CloseMission(this.missionID);
	SendScript2Client('Open([[ma]], 0)');	--关闭翻牌界面
end

function JDYY_AddGodState()
--	JDYY_ClearAllState();
	local tState = tGodStates.tState;
	local szMsg = "";
	for i = 1, getn(tState) do
		CastState(tState[i][2], tState[i][3], tGodStates.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
		szMsg = szMsg .. tState[i][4] .. "\n";
	end
	
	SyncCustomState(1, tState[1][1], 1, tGodStates.tInfo[1]);
	RestoreAll();
	Talk(1, "", format("你获得<color=yellow>“%s”<color>效果:\n%s<color=green>持续%d分钟。<color>", tGodStates.tInfo[1], szMsg, tGodStates.tInfo[2]));
end

function JDYY_ClearAllGodState()
	local tState = tGodStates.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

function JDYY_InDeathArea(nPlayerIndex)
	local nRes = nil;
	local nStaticMapID = GetMapTemplate(SubWorld);
	if nStaticMapID ~= 8013 then return nRes; end
	
	if nPlayerIndex then
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		local nMapId, x, y = GetWorldPos();
		if abs(x - tDeathPos[1]) <= 50 and abs(y - tDeathPos[2]) <= 50 then
			nRes = 1;
		end
		PlayerIndex = nOldPlayerIndex;
	else
		local nMapId, x, y = GetWorldPos();
		if abs(x - tDeathPos[1]) <= 50 and abs(y - tDeathPos[2]) <= 50 then
			nRes = 1;
		end
	end
	return nRes;
end

function JDYY_IsPlayerDeath(nPlayerIndex)
	local nRes = nil;
	if nPlayerIndex then
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		if 1 == IsPlayerDeath() or GetLife() <= 1 then
			nRes = 1;
		end
		PlayerIndex = nOldPlayerIndex;
	else
		if 1 == IsPlayerDeath() or GetLife() <= 1 then
			nRes = 1;
		end
	end
	return nRes;
end

function JDYY_InArea(x1, y1, x, y, nDis)
	if abs(x - y1) <= nDis and abs(y - y1) <= nDis then
		return 1;
	end
	return
end

function JDYY_ClearAllState()
	this.msCamp:turnPlayer(nCamp, function() for i=10001,10010 do RemoveState(i); end end);
end

function JDYY_GetPlayerPos(nPlayerIndex)
	if not nPlayerIndex or "number" ~= type(nPlayerIndex) then return end
	
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	local nMapId, x, y = GetWorldPos();
	PlayerIndex = nOldPlayerIndex;
	return nMapId, x, y;
end

function JDYY_GetPlayerName(nPlayerIndex)
	if not nPlayerIndex or "number" ~= type(nPlayerIndex) then return end
	
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	local szName = GetSafeName();
	PlayerIndex = nOldPlayerIndex;
	return szName;
end

function JDYY_SetPlayerPos(tPos)
	SetFightState(1);
	SetPos(tPos[1], tPos[2]);
end

function JDYY_Msg2Player(nPlayerIndex, szMsg)
	if not nPlayerIndex or not szMsg or "number" ~= type(nPlayerIndex) or "string" ~= type(szMsg) then return end
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	Msg2Player(szMsg);
	PlayerIndex = nOldPlayerIndex;
end

function JDYY_GivePrize(szStageId)
	local szDifType = (GetMissionV(this.mv_02) == eDifType.NORMAL and "普通版") or "英雄版";
	WriteLog(format("[剑荡燕云%s] [通关%s] [RoleName:%s Account:%s]", szDifType, szStageId, JDYY_GetCaptainName(), JDYY_GetCaptainAccount()));
	local nDifType = GetMissionV(this.mv_02);
	
	local nStage = tonumber(szStageId);
	local nStageOld = nStage
	
	nStage = (nStage == 6) and 5 or nStage;
	-- Observer:onEvent(OE_JDYY_PASS_STAGE, {1,nDifType, nStage});
	if "05" == szStageId then
		local szMsg = format("恭喜 %s 率领江湖精英破除重重拦 成功通关 %s 剑荡燕云!", JDYY_GetCaptainSafeName(), szDifType);
		--this.msCamp:turnPlayer(0, callout(JDYY_GiveCompletedPop , szDifType));
		Msg2Global(szMsg);
	end	
	JDYY_RecordDamagePoint();
	
	local tRequire = JDYY_MakeRequireTable(szStageId);
	local nTeamID = GetTeamID();
	local nRouteNum = gf_team_get_route_count_ex(nTeamID);
	
	local strCaption = format("%s_%s", this:mission_name(), this:mission_stage())
	gf_SetLogCaption(strCaption);
	if "06" == szStageId then		--小路模式不翻牌
		this.msCamp:turnPlayer(0, callout(JDYY_GiveExpEtc, 1, nRouteNum, nStageOld));
		this.msCamp:turnPlayer(0, JDYY_GivePrizeZuoBi);
	else
	--	JDYY_OpenCardUI(tRequire);--此处去除翻牌系统增加给与道具直接到包裹
	 gf_TeamOperateEX(function ()
	 gf_AddItemEx({2,103,153,2},"天使☆镇魂玉");
	 gf_AddItemEx({2,95,741,10,4},"耀阳碎片");
	 end)    
		this.msCamp:turnPlayer(0, callout(JDYY_GiveExpEtc, 0, nRouteNum, nStage));
		this.msCamp:turnPlayer(0, callout(JDYY_GiveKillBossPop , szDifType));
	end
	gf_SetLogCaption("");
	
	if GetMissionV(this.mv_02) == eDifType.NORMAL then
		FireEventTeam("event_mission_stage_finish", "jiandangyanyun", nStageOld)
	else
		FireEventTeam("event_mission_stage_finish", "jiandangyanyunhero", nStageOld)
	end
	
end


function JDYY_GiveKillBossPop(szDifType)     -- JDYY每杀死一个BOSS获得的声望
	local popVar=0;
	if szDifType =="普通版" then popVar = 4
	elseif szDifType =="英雄版" then popVar = 4 
	end
	AddPop(6,popVar);

end


--function JDYY_GiveCompletedPop( szDifType )  -- JDYY副本完成获得的声望
--	local popVar=0;
--	if szDifType =="普通版" then popVar = 5
--	elseif szDifType =="英雄版" then popVar = 10 
--	end
--	AddPop(6,popVar);
--	--local playerName  = GetSafeName();
--	--local str = format("%s passed all stages and earn Pop %d",playerName,popVar)
--	--print("\n[debug info]: "..str)
--end


function JDYY_GivePrizeZuoBi()
	local nIsCaptain = JDYY_IsCaptain();
	AddPop(6,10);
	if nIsCaptain then
		Msg2Global(format("恭喜 %s 率领江湖精英破除重重拦 成功通关 %s 剑荡燕云!", JDYY_GetCaptainSafeName()));
		
		if gf_Judge_Room_Weight(1, 0) == 1 then
		--	gf_AddItemEx({2,1,31124,5}, "B秓 rng IB Ki誱 Хng 普通版");
		end
		if gf_Judge_Room_Weight(1, 0) == 1 then
		--	gf_AddItemEx({2,1,31130,5}, "B秓 rng Ki誱 Хng 普通版");
			return 1;
		end
	else
		if gf_Judge_Room_Weight(1, 0) == 1 then
		--	gf_AddItemEx({2,1,31130,5}, "B秓 rng Ki誱 Хng 普通版");
			return 1;
		end
	end
	
	local szPlayerName = GetName();
--	local tMailInfo			= {
--		szTo				= szPlayerName,
--		szFrom				= "系统",
--		szTitle				= "剑荡燕云关卡奖励",
--		byPRI				= eMAIL_PRI_SUPER,
--	};
--	
--	local tMailAttachmentInfo = nil;
--	
--	if nIsCaptain then
--		tMailAttachmentInfo = {
--			{
--				nType		= eMAIL_ATTACHMENT_T_TEXT,
--				szContent	= "附件是您参加剑荡燕云关卡因背包满而无法获得的物品！",
--			},
--			{
--				nType		= eMAIL_ATTACHMENT_T_SCRIPT,
--				szContent	= "AddItem(2, 95, 1513, 5, 4)",
--			},
--			{
--				nType		= eMAIL_ATTACHMENT_T_SCRIPT,
--				szContent	= "AddItem(2, 95, 1514, 10, 4)",
--			},
--		};
--	else
--		tMailAttachmentInfo = {
--			{
--				nType		= eMAIL_ATTACHMENT_T_TEXT,
--				szContent	= "附件是您参加剑荡燕云关卡因背包满而无法获得的物品！",
--			},
--			{
--				nType		= eMAIL_ATTACHMENT_T_SCRIPT,
--				szContent	= "AddItem(2, 95, 1513, 5, 4)",
--			},
--		};
--	end
--	
--	local tMailConditionInfo = {
--		{
--			nType		= eMAIL_CONDIFION_T_TAKEOUT,
--			szContent	= "#gf_Judge_Room_Weight(2, 10)",
--		},
--	};
--	local nRet, GUID = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
--	if 0 ~= nRet then
--		WriteLog(format("[剑荡燕云关卡] [SendOneMail 邮件发送成功] [Role:%s (acc:%s)] [GUID:%.0f]", GetName(), GetAccount(), GUID));
--	elseif 0 == nRet then
--		WriteLog(format("[剑荡燕云关卡] [SendOneMail 邮件发送失败！！！] [Role:%s (acc:%s)] [GUID:%.0f]", GetName(), GetAccount(), GUID));
--		return 0;
--	end
	
end

function JDYY_GiveExpEtc(nZuoBi, nRouteNum, stageid)
	local nExp, nMP = 0, 0;
	local nDifType = GetMissionV(this.mv_02);
	
	local tMultiExp = {
		[1] = 1.0,
		[2] = 1.0,
		[3] = 1.0,
		[4] = 1.0,
		[5] = 1.2,
		[6] = 1.4,
		[7] = 1.6,
		[8] = 2.0,
	};
	
	if not nRouteNum or not tMultiExp[nRouteNum] then return end

	local nExp = tExp[nDifType][stageid] * tMultiExp[nRouteNum]
--	Msg2Player(stageid,nExp)
	gf_Modify("Exp", nExp);

	-- if nZuoBi == 0 and nDifType == eDifType.NORMAL then
	-- 	nExp, nMP = GetLevel()^2 * 50 * 5, floor(GetLevel()^2 * 0.01 * 0.5);
	-- 	if GetTask(TASKID_JDYY_DAILY_TIME_NORMAL) > 1 then
	-- 		nExp = 	GetLevel()^2 * 50
	-- 		nMp  =  floor(GetLevel()^2 * 0.001)
	-- 	end
	-- 	nExp = floor(nExp * tMultiExp[nRouteNum]);
	-- 	-- Exp = mission_exp_bonus(nExp, MEB_JDYY_NORMAL);
	-- 	gf_Modify("Exp", nExp);
	-- 	-- MP_MasterAddPoint(nMP);
	-- elseif nZuoBi == 0 and nDifType == eDifType.HARD then
	-- 	nExp, nMP = GetLevel()^2 * 50 * 5 * 1.5, floor(GetLevel()^2 * 0.03 * 0.5);
	-- 	if GetTask(TASKID_JDYY_DAILY_TIME_HARD) > 1 then
	-- 		nExp = GetLevel()^2 * 50 * 1.5
	-- 		nMp  = floor(GetLevel()^2 * 0.003);
	-- 	end
	-- 	nExp = floor(nExp * tMultiExp[nRouteNum]);
	-- 	-- nExp = mission_exp_bonus(nExp, MEB_JDYY_HARD);
	-- 	gf_Modify("Exp", nExp);
	-- 	-- MP_MasterAddPoint(nMP);
	-- elseif nZuoBi == 1 then
	-- 	nExp, nMP = GetLevel()^2 * 50 * 5 * 5, floor(GetLevel()^2 * 0.03 * 0.5);
	-- 	if GetTask(TASKID_JDYY_DAILY_TIME_ZUOBI) > 1 then
	-- 		nExp = GetLevel()^2 * 50 * 5
	-- 		nMP  = floor(GetLevel()^2 * 0.006);
	-- 	end
	-- 	nExp = floor(nExp * tMultiExp[nRouteNum]);
	-- 	-- nExp = mission_exp_bonus(nExp, MEB_JDYY_ZUOBI);
	-- 	gf_Modify("Exp", nExp);
	-- 	-- MP_MasterAddPoint(nMP);
	-- end
end

function JDYY_OpenCardUI(tRequire)
	MA_Mission_OpenUI(this.missionID, 0, thisFile, "JDYY_RollCardCallBack", tRequire);
end


function JDYY_RollCardCallBack(id)
	local nMapId = GetWorldPos();
	if nMapId < 65537 then
		SendScript2Client('Open([[ma]], 0)');	--关闭翻牌界面
		return 0;
	end
	
	if gf_Judge_Room_Weight(1, 20, "") ~= 1 then
		return 0;
	end
	local szStageId = GetMissionS(this.MS_STAGE);
	local nDifType = GetMissionV(this.mv_02);
	local szDiyType = (nDifType == eDifType.NORMAL and "普通版") or "英雄版";
	
 	local szAwardFree = tAward[nDifType][1]
 	local szAwardIB   = tAward[nDifType][2]
	local g, d, p, n = 0, 0, 0, 0;
	if id < 8 then
		local nAwardIndex = CustomAwardSelectOne(szAwardFree);
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(id, g, d, p, n, GetName());
		end
		if nDifType == 1 then 			--统计免费翻拍次数
			AddRuntimeStat(44,6,0,1)
		else
			AddRuntimeStat(44,8,0,1)
		end
	else
		if 1 ~= CustomAwardCheckCondition(szAwardIB) then
			Talk(1, "", "在这个时刻，情况不乐观，未能取得胜利");
			return 0
		end
		if DelItem(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4]) ~= 1 then
			Talk(1, "", tCostItem[5]);
			return 0;
		else
			FireEvent("event_ib_cost", tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4])
		end
		local nAwardIndex = CustomAwardSelectOne(szAwardIB)
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex)
			MA_Team_SyncItem(id, g, d, p, n, GetName())
		end
		if nDifType == 1 then
			AddRuntimeStat(44,7,0,1)
		else
			AddRuntimeStat(44,9,0,1)
		end
	end



	-- 	if tTaskIDs[nDifType][szStageId] and GetTask(tTaskIDs[nDifType][szStageId][1]) >= tTaskIDs[nDifType][szStageId][2] then
	-- 		Talk(1, "", format("本日本关%d次免费翻牌次数你已使用完，请明日再来！", tTaskIDs[nDifType][szStageId][2]));
	-- 		return 0;
	-- 	end
		
	-- 	SetTask(tTaskIDs[nDifType][szStageId][1], GetTask(tTaskIDs[nDifType][szStageId][1]) + 1);
		
	-- 	if nDifType == eDifType.NORMAL then
	-- 		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_free, 1);
	-- 	else
	-- 		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_free, 1);
	-- 	end
		
	-- 	local strCaption = format("%s_%s_%s", this:mission_name(), "免费翻牌", this:mission_stage())
	-- 	gf_SetLogCaption(strCaption);
	-- 	local nRand = random(1, 100000);
	-- 	local tAward = tPrize[1][nDifType];
	-- 	for i = 1, getn(tAward) do
	-- 		nRand = nRand - tAward[i][3];
	-- 		if nRand <= 0 then
	-- 			gf_AddItemEx(tAward[i][2], tAward[i][1]);
	-- 			g, d, p, n = tAward[i][2][1], tAward[i][2][2], tAward[i][2][3], tAward[i][2][4];
	-- 			MA_Team_SyncItem(id, g, d, p, n, GetSafeName());
	-- 			break;
	-- 		end
	-- 	end
	-- 	gf_SetLogCaption("");
	-- 	return
	-- else
	-- 	local tItem = MA_GetRequire(id);
	-- 	if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
	-- 		Talk(1, "", "您身上的天骄令不够！");
	-- 		return 0;
	-- 	end
		
	-- 	local strCaption = format("%s_%s_%s", this:mission_name(), "消耗翻牌", this:mission_stage())
	-- 	gf_SetLogCaption(strCaption);
	-- 	local TASKID_JDYY_CONSUME = tTaskID.ConsumeTaskID[nDifType];
	-- 	local nValue = GetTask(TASKID_JDYY_CONSUME) + 2;
	-- 	SetTask(TASKID_JDYY_CONSUME, nValue);
		
	-- 	if nDifType == eDifType.NORMAL then
	-- 		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_ib, 1);
	-- 	else
	-- 		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_ib, 1);
	-- 	end
		
	-- 	if nValue >= 600 then
	-- 		SetTask(TASKID_JDYY_CONSUME, 0);
	-- 		nRand = random(1, 100000);
	-- 		for i = 1, getn(tAdvancedPrize) do
	-- 			nRand = nRand - tAdvancedPrize[i][3];
	-- 			if nRand <= 0 then
	-- 				if tAdvancedPrize[i][1] == "玄阴令" then
	-- 					ds_JDYY:AddStatValue(1, tDataStateList.yanyun_xuanyin, tAdvancedPrize[i][2][4]);
	-- 					SetTask(TASKID_JDYY_XYY_GET_TIME, GetTask(TASKID_JDYY_XYY_GET_TIME) + 1);
	-- 					OnAchEvent(2, TASKID_JDYY_XYY_GET_TIME);
	-- 				elseif tAdvancedPrize[i][1] == "真阳璧" then
	-- 					ds_JDYY:AddStatValue(1, tDataStateList.yanyun_zhenyang, tAdvancedPrize[i][2][4]);
	-- 					SetTask(TASKID_JDYY_ZYB_GET_TIME, GetTask(TASKID_JDYY_ZYB_GET_TIME) + 1);
	-- 					OnAchEvent(2, TASKID_JDYY_ZYB_GET_TIME);
	-- 				end
					
	-- 				gf_AddItemEx(tAdvancedPrize[i][2], tAdvancedPrize[i][1]);
	-- 				local g, d, p, n = tAdvancedPrize[i][2][1], tAdvancedPrize[i][2][2], tAdvancedPrize[i][2][3], tAdvancedPrize[i][2][4];
	-- 				MA_Team_SyncItem(id, g, d, p, n, GetName());
	-- 				Msg2Global(format("恭喜%s开启“剑荡燕云”关卡奖励获得[%s]×%d！", GetSafeName(), tAdvancedPrize[i][1], tAdvancedPrize[i][2][4]));
	-- 				gf_SetLogCaption("");
	-- 				return
	-- 			end
	-- 		end
	-- 	end
		
	-- 	if _JX2WZ == 1 then
	-- 		tAward = tPrize[2][1];
	-- 	elseif _JX2IB == 1 then
	-- 		tAward = tPrize[2][2];
	-- 	elseif _JX2PAY == 1 then
	-- 		tAward = tPrize[2][3];
	-- 	end
		
	-- 	local nMin = 1;
	-- 	if nValue <= 100 then
	-- 		for i = 1, 10 do
	-- 			nMin = nMin + tAward[i][3];
	-- 		end
	-- 	end
		
	-- 	local nRand = random(nMin, 100000);
	-- 	for i = 1, getn(tAward) do
	-- 		nRand = nRand - tAward[i][3];
	-- 		if nRand <= 0 then
	-- 			if tAward[i][1] == "玄阴令" then
	-- 				ds_JDYY:AddStatValue(1, tDataStateList.yanyun_xuanyin, tAward[i][2][4]);
					
	-- 				if tAward[i][2][4] >= 4 then
	-- 					SetTask(TASKID_JDYY_CONSUME, 0);
	-- 				end
	-- 				SetTask(TASKID_JDYY_XYY_GET_TIME, GetTask(TASKID_JDYY_XYY_GET_TIME) + 1);
	-- 				OnAchEvent(2, TASKID_JDYY_XYY_GET_TIME);
	-- 			elseif tAward[i][1] == "真阳璧" then
	-- 				ds_JDYY:AddStatValue(1, tDataStateList.yanyun_zhenyang, tAward[i][2][4]);
					
	-- 				if tAward[i][2][4] >= 4 then
	-- 					SetTask(TASKID_JDYY_CONSUME, 0);
	-- 				end
	-- 				SetTask(TASKID_JDYY_ZYB_GET_TIME, GetTask(TASKID_JDYY_ZYB_GET_TIME) + 1);
	-- 				OnAchEvent(2, TASKID_JDYY_ZYB_GET_TIME);
	-- 			end
				
	-- 			gf_AddItemEx(tAward[i][2], tAward[i][1]);
	-- 			if tAward[i][4] then
	-- 				Msg2Global(format("恭喜%s开启“剑荡燕云”关卡奖励获得[%s]×%d！", GetSafeName(), tAward[i][1], tAward[i][2][4]));
	-- 			end
	-- 			local g, d, p, n = tAward[i][2][1], tAward[i][2][2], tAward[i][2][3], tAward[i][2][4];
	-- 			MA_Team_SyncItem(id, g, d, p, n, GetSafeName());
	-- 			gf_SetLogCaption("");
	-- 			return
	-- 		end
	-- 	end
	-- end
	-- gf_SetLogCaption("");
	-- return
end

function JDYY_MakeRequireTable(szStageId)
	local tRequire = {};
	for i = 1, 8 do
		tinsert(tRequire, {2, 97, 236, 2});
	end
	return tRequire;
end

function JDYY_RecordDamagePoint()
	this.msCamp:turnPlayer(0, function()
		local nRoute = GetPlayerRoute();
		if tList[nRoute] then
			local msg = format("[%s] [输出伤害: %d]", GetSafeName(), GetToNpcDamage());
			%this:Msg2MSAll(msg);
		end
	end);
end

function nothing() return end