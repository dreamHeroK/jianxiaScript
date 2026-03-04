Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnDeath(Launcher)
	--清除药CD
	ClearColdDown();
	--npc buff Remove

	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	RemoveState(9912); -- 新增无惧
	RemoveState(9913); -- 新增破敌
	
	for i = 20101, 20106 do
		RemoveState(i);
	end
	--非开战状态死的无视
	local nBattleState = GetMissionV(KF_MV_BATTLE_STATE);
	if nBattleState ~= KF_MS_STATE_FIGHT then	
		return 0;
	end;
	--重生
	KF_RevivePlayer();
	--死亡的时候记录死亡时间
	SetTaskTemp(TMP_TASK_KF_TIME, GetTime());
	--被杀死活跃度+1
	KF_AddActivity_Ext(KF_ACTIVITY_TYPE_PLAYERDEAD);
	--计数被杀次数
	gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2) + 1);
	--标记死亡了
	gf_SetTaskBit(KF_BATTLE_TASK, 27, 1, TASK_ACCESS_CODE_KF_BATTLE);
	--删除NB武器
	DelNBWeapon();

	SetTask(TASKID_KF_CONTINUOUS_DEAD_CNT,GetTask(TASKID_KF_CONTINUOUS_DEAD_CNT)+1)
	
	
	--杀人的玩家活跃和积分处理
	local DeathPlayerIndex = PlayerIndex;
	local KillerPlayerIndex = NpcIdx2PIdx(Launcher);	
	if KillerPlayerIndex > 0 and KillerPlayerIndex ~= DeathPlayerIndex then
		local nOldPlayerIndex = PlayerIndex
		PlayerIndex = KillerPlayerIndex;
		KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLPLAYER)	-- 击杀玩家
		SetTask(TASKID_KF_CONTINUOUS_DEAD_CNT, 0)
		-- 处理助攻--
		local KillerMap, killerX, killerY = GetWorldPos()
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= KillerPlayerIndex then
				local m,x,y = GetWorldPos()
				if m == KillerMap and (killerX - x)*(killerX - x) + (killerY - y)*(killerY - y) <700 then -- 同屏内
					KF_AddActivity_Ext(KF_ACTIVITY_TYPE_ASSISTKILL)	
				end
			end
		end
		PlayerIndex = KillerPlayerIndex;
		-- ------- --

		KF_AddScore(KF_SCORE_PLAYER);
		--记录杀人次数
		gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4) + 1);
		
		_stat_when_kill_player()
		
		PlayerIndex = DeathPlayerIndex;
		_stat_when_death()
		
		PlayerIndex = nOldPlayerIndex
	end
end