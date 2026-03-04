--Create date:2008-1-9 15:09
--Author:yanjun
--Description:Mission框架相关函数
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	BWT_InitFieldNpc();
	BWT_ChangeMSState(MS_STATE_CHECK_EQUIPMENT);
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	SetMissionS(MS_MISSION_STRING,"禁止替身符");	--这个用法太奇怪
	WriteLog("["..LOG_HEAD.."]: 比武 Mission 初始化开始, MSUID 是"..nMSUID);
end;
--Mission开始
function MS_StartMission()
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local nPos1 = BWT_SetRandomPos(nPIdx1,nil);
	BWT_SetRandomPos(nPIdx2, nPos1);
	BWT_ChangeMSState(MS_STATE_STARTED);
	Talk2SomeOne(nPIdx1,1,"","比武正式开始！");
	Talk2SomeOne(nPIdx2,1,"","比武正式开始！");
	Msg2MSAll(MISSION_ID,"比武正式开始！");
end;
--Mission结束
function MS_EndMission()
	local nMSUID = GetMissionV(MV_MISSION_UID);
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--从Mission里面删除所有的玩家
	BWT_ChangeMSState(MS_STATE_IDEL);
	mf_ClearMissionData();
	ClearMapNpc(nMapID);
	FreeDynamicMap(nMapID,nMapIdx);
	WriteLog("["..LOG_HEAD.."]: 比武 Mission 结束, MSUID 是"..nMSUID);
end;
--离开Mission
function MS_LeaveMission()
	local nOldIdx = PlayerIndex;
	local nCamp = GetTaskTemp(TSK_TEMP_CAMP);
	local nState = GetMissionV(MV_MISSION_STATE);
	if (nCamp == A_CAMP or nCamp == B_CAMP) and (nState ~= MS_STATE_ENDING) then	--如果是选手退出
		local szName = BWT_GetName();
		local nOppIdx = BWT_GetOpponentIndex();
		local szOppName = BWT_GetName(nOppIdx);
		BWT_ChangeMSState(MS_STATE_ENDING);
		Msg2MSAll(MISSION_ID,szName.." 离开了比赛,"..szOppName.."获得本次较艺的胜利。");
		BWT_ReportResult(nOppIdx,PlayerIndex);
	end;
	PlayerIndex = nOldIdx;
--	local nCityID = GetMissionV(MV_CITY_ID);
--	local nOutMapID = TB_MAPID[nCityID][1];
--	local nDirection = random(1,getn(TB_EXIT));
	MS_RestorePlayerState(1);
--	BWDH_Change_Map(7100,TB_EXIT[nDirection][2],TB_EXIT[nDirection][3]) 

	BWDH_Change_Map(974,TB_ENTRY[5][1] + random(0,3),TB_ENTRY[5][2] - random(0,3))
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(nCamp);
	AddMSPlayer(MISSION_ID,nCamp);
end;

function MS_ProcessCheckEquipmentTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nOldPIdx = PlayerIndex;
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local tbPIdx = {nPIdx1,nPIdx2};
	local nMapID = gf_GetCurMapID();
	local szHint = "";
	local nOldPIdx = PlayerIndex;
	if nLoop == 0 then
		local nCheckRetCode1 = BWT_CheckEquipment(nPIdx1);
		local nCheckRetCode2 = BWT_CheckEquipment(nPIdx2);
		if nCheckRetCode1 == 0 and nCheckRetCode2 == 0 then	--双方都没穿好衣服
			for i=1,getn(tbPIdx) do
				PlayerIndex = tbPIdx[i];
				Talk(1,"","比武双方身上的装备不符合比武规定，比武已取消，扣除<color=yellow>1<color>点积分。");
				BWT_AddPoint(-1);
			end;
			PlayerIndex = nOldPIdx;
			BWT_ChangeMSState(MS_STATE_ENDING);
			return 0;
		end;
		if nCheckRetCode1 == 0 then	--1号选手没穿好衣服
			Msg2MSAll(MISSION_ID,"由于"..BWT_GetName(nPIdx1).."指定时间内身上的装备不符合比武规定，"..BWT_GetName(nPIdx2).."赢得本场胜利！");
			BWT_ReportResult(nPIdx2,nPIdx1);
			BWT_ChangeMSState(MS_STATE_ENDING);
			PlayerIndex = nOldPIdx;
			return 0;
		end;
		if nCheckRetCode2 == 0 then	--2号选手没穿好衣服
			Msg2MSAll(MISSION_ID,"由于"..BWT_GetName(nPIdx2).."指定时间内身上的装备不符合比武规定，"..BWT_GetName(nPIdx1).."赢得本场胜利！");
			BWT_ReportResult(nPIdx1,nPIdx2);
			BWT_ChangeMSState(MS_STATE_ENDING);
			PlayerIndex = nOldPIdx;
			return 0;
		end;
		PlayerIndex = nOldPIdx;
		BWT_SetPlayerFightState(1,nPIdx1);
		BWT_SetPlayerFightState(2,nPIdx2);
--		Msg2MSAll(MISSION_ID,"装备检查时间结束，接下来是准备时间。");
		Talk2SomeOne(nPIdx1,1,"","装备检查时间结束，对手的职业为<color=yellow>"..BWT_GetPlayerRouteName(nPIdx2).."<color>，接下来是准备时间。");
		Talk2SomeOne(nPIdx2,1,"","装备检查时间结束，对手的职业为<color=yellow>"..BWT_GetPlayerRouteName(nPIdx1).."<color>，接下来是准备时间。");
		Msg2SomeOne(nPIdx1,"装备检查时间结束，对手的职业为"..BWT_GetPlayerRouteName(nPIdx2).."，接下来是准备时间。");
		Msg2SomeOne(nPIdx2,"装备检查时间结束，对手的职业为"..BWT_GetPlayerRouteName(nPIdx1).."，接下来是准备时间。");
		--SetTask(1429, 1);--改变成不可以切换五行盘的状态
		BWT_ChangeMSState(MS_STATE_READY);
	else
		local nCheckRetCode,tbEquip = 0,{};
		for i=1,getn(tbPIdx) do
			nCheckRetCode,tbEquip = BWT_CheckEquipment(tbPIdx[i]);
			szHint = "";
			if nCheckRetCode == 0 then
				for i=1,getn(tbEquip) do
					if tbEquip[i] ~= 1 then
						szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color>不符合,";
					end;
				end;
				Talk2SomeOne(tbPIdx[i],1,"","身上的装备"..szHint.."比武规定，请再次检查！");
			end;
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"距装备检查结束还有"..tf_GetTimeString(nLoop*CHECK_EQUIPMENT_TIMER_INTERVAL*60).."。请比武双方认真检查自己身上的装备是否符合比武规定");
	end;
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"距离准备时间结束还有"..tf_GetTimeString(nLoop*READY_TIMER_INTERVAL*60).."，请各位选手做好准备。");
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nDrawState = 0;
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	if nLoop == 0 then
		BWT_ChangeMSState(MS_STATE_ENDING);
		nDrawState = BWT_GetDrawState(nPIdx1,nPIdx2);
		if nDrawState == 0 then
			BWT_ReportResult(nPIdx1,nPIdx2,1);
		elseif nDrawState == 1 then
			BWT_ReportResult(nPIdx1,nPIdx2);
		elseif nDrawState == 2 then
			BWT_ReportResult(nPIdx2,nPIdx1);
		end;
		Msg2MSAll(MISSION_ID,"本场较艺结束，很快将会传出场地");
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"距离较艺结束还有"..tf_GetTimeString(nLoop*STARTED_TIMER_INTERVAL*60));
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		BWT_CloseField();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"距离较艺结束还有"..tf_GetTimeString(nLoop*ENDING_TIMER_INTERVAL*60));
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState(0);
	WriteLog("["..LOG_HEAD.."]: 公告："..GetName().." 离开 Mission 不正常，正在处理日志的过程中。");
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = GetTime();
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState(nCamp)
	local nCityID = GetMissionV(MV_CITY_ID);
	local nDirection = GetMissionV(MV_FIELD_DIRECTION);
	local nFieldNum = GetMissionV(MV_FIELD_NUM);
	local tbDirection = {"东面","南面","西面","北面"};
	local nMapID = gf_GetCurMapID();
	local szTips = "";
	BWT_WeeklyClear();
	BWT_ClearTempTask();
	SetTaskTemp(TSK_TEMP_CAMP,nCamp);
	LeaveTeam();	--离开队伍
	SetLogoutRV(1);	--设置登陆点为城市重生点
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetFightState(0);	--和平状态
	UseScrollEnable(0);	--禁止使用回城符
	ForbitTrade(1);	--禁止交易
	StallEnable(0);	--禁止摆摊
	OpenFriendliness(0);	--不增加好感度
	SetDeathPunish(0);	--无死亡惩罚
	InteractiveEnable(0);	--禁止互动
	UseDummy(0,1);	--清除替身符效果
	ForbitLevelUp(1);	--禁止升级
	ForbitAddProp(1);	--禁止操作潜能点
	ForbidChangePK(0);	--可以转换PK状态（如果有人此时在切磋，是不能转换PK状态的，所以这里用指令设置允许转换PK状态）
	UseSkillEnable(0);	--禁止武功
	KillFollower();		--删除跟随NPC
	if IsPlayerDeath() == 1 then
		RevivePlayer(0);
	end;
	SetPlayerRestrictions(0,1);	--限制物品使用
	if nCamp == AUDIENCE_CAMP then
		SetPKFlag(0,0);	--PK状态
		DesaltPlayer(1,0);
		NewWorld(nMapID,TB_ENTRY[2][1],TB_ENTRY[2][2]);
	else
		NewWorld(nMapID,TB_ENTRY[3][nCamp][1],TB_ENTRY[3][nCamp][2]);
		SetDeathScript(DEATH_SCRIPT);
		SetPKFlag(1,nCamp);	--PK状态
		gf_ForbidFactionSkill(1);
		BlockSkill(19);	--屏蔽打坐
		SetCurTitle(0,0);
		SetPlayerRestrictions(2,1);	--设置称号属性无效// 原始为开放状态
		SetLockCurTitle(0);	--不可更换称号
		SetPlayerRestrictions(1,1);	--限制某些装备上的属性// 原始为开放状态
		ResetToPlayerDamage();
		RemvoeTempEffect();	--清除所有临时状态
		ClearColdDown();	--清除所有药CD
		--RemoveRevivals();	--清除宝宝
		Restore();
		RestoreNeili();
--		local nUseMask = GetMaskStatus();
--		UseMask(nUseMask,0);	--强制显示名字
		RemoveState(9900);	--清除城市奖章换的状态
		ClearStolenSkill();	--清除已偷取的技能，针对棍子
		CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
		SetMissionV(MV_PLAYERINDEX1-1+nCamp,PlayerIndex);	--记录玩家的索引
		SetMissionS(MS_PLAYERNAME1-1+nCamp,GetName());
		if UNCOMPLETED_VERSION ~= 1  then
			BWT_QuitGestConvention();	--退出配对列表
		end;
		BWT_RemoveNonlicetState();
		szTips = " <color=yellow>在准备时间结束之前快速穿上合适的设备，否则将会退出比武场地。<color>";
	end;
	ForbidChangePK(1);	--禁止转换PK状态
	if GetPlayerFaction() ~= 6 then --不是杨门不能骑马
		ForbidRiding(1);
	end
--	local szString = "你进入了"..TB_MAPID[nCityID][3]..tbDirection[nDirection]..nFieldNum.."号场地。";
--	Msg2Player(szString);
--	Say(szString..szTips,0);
end;
--离开场地时统一进行的操作
--bUseMask:比武选手是否要变成神秘人。1是，0否
function MS_RestorePlayerState(bUseMask)
	bUseMask = bUseMask or 1;
	local nCamp = GetTaskTemp(TSK_TEMP_CAMP);
	local nTime = GetTime();
	SetLogoutRV(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	LeaveTeam();	--离开队伍
	SetFightState(0);	--和平状态
	SetDeathScript("");	--清空死亡脚本
	SetTempRevPos(0,0,0);	--删除临时重生点
	ForbidChangePK(0);	--可以转换PK状态
	SetPKFlag(0,0);	--无PK状态
	local nVersion,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		ForbitTrade(0);	--允许交易
		StallEnable(1);	--允许摆摊
	end
	OpenFriendliness(1);	--可增加好感度
	SetDeathPunish(1);	--有死亡惩罚
	InteractiveEnable(1);	--允许互动
	SetLockCurTitle(1);	--可更换称号
	SetPlayerRestrictions(0,0);
	SetPlayerRestrictions(1,0);  -- 设置称号属性有效// 原始为开放状态
	SetPlayerRestrictions(2,0);  -- 开放某些装备上的属性// 原始为开放状态
	DesaltPlayer(0,0);
	ForbitLevelUp(0);
	ForbitAddProp(0);
	UseSkillEnable(1);
	ForbidRiding(0);
	--SetTask(1429, 0);--改变成可以切换五行盘的状态
--	UseMask(bUseMask,0);	--强制变神秘人
	if nCamp ~= AUDIENCE_CAMP then	--如果是比赛选手
		BWDH_SetTask(TSK_ALLOW_AUDIENCE,1);	--允许观战
		SetMissionV(MV_PLAYERINDEX1-1+nCamp,0);
		RestoreAll();
		ClearColdDown();	--清除所有药CD
		CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
		ResetToPlayerDamage();
		BWDH_SetTask(TSK_LAST_INVITE_TIME,nTime-floor(INVITE_INTERVAL_TIME/2));	--比赛出来的CD缩短一半
		gf_ForbidFactionSkill(0);
		UnBlockSkill(19);	--允许打坐
		local nTimesLeft = GetTask(TSK_JOIN_LIST_TYPE);
		if nTimesLeft > 1 then	--只参加nTimesLeft次的
			BWT_JoinGestConvention();	--加入配对列表
			BWDH_SetTask(TSK_JOIN_LIST_TYPE,nTimesLeft-1);
		elseif nTimesLeft == -1 then	--一直参加的
			BWT_JoinGestConvention();	--加入配对列表
		end;
		local nCurWeekMatch = GetTask(TSK_CURWEEKMATCH);
		if nCurWeekMatch == REQUIRE_MATCH_TIME then
			gf_ShowMsg("您本周已经进行了"..REQUIRE_MATCH_TIME.."场较艺，系统已经帮您自动登记积分。\n<color=red>以后每进行一次较艺系统都会帮您自动登记！<color>");
		end;
	end;
	BWT_ClearTempTask();
	BWT_LockEquipment(0);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		ForbidChangePK(1);
	end
end;

