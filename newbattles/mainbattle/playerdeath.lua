Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

SZ_BF_CHEAT_OP_SCRIPT = "\\script\\newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

--单条传送概率传送概率
--　
--		士兵	校尉	都统	先锋	大将	元帅	
--士兵	0		0		0		0		0		0
--校尉	0		0		0		0		0		0
--都统	0		0		10		7		4		1	
--先锋	0		0		7		10		7		4	
--大将	0		0		4		7		10		7	
--元帅	0		0		1		4		7		10	

--Note:死亡状态下单挑申请也不能达成；不过可以实现死亡状态下的申请

tFIGHTPROBABILITY =
{
	{010,010, 010, 010, 010, 010},
	{010,010, 010, 010, 010, 010},
	{010,010, 010, 010, 010, 010},
	{010,010, 010, 010, 010, 010},
	{010,010, 010, 010, 010, 010},
	{010,010, 010, 010, 010, 010},
}

function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local sDeathName = GetName();
	local nDeathCamp = BT_GetCamp();
	local nKillerCamp = 0;
	local sKillerName = "敌人";
	if nKillerIndex > 0 then
		PlayerIndex = nKillerIndex;
		sKillerName = GetName();
		nKillerCamp = BT_GetCamp();
	end;
	PlayerIndex = nDeathIndex;
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nDanTiaoIdx1 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2);
	local nDanTiaoIdx2 = GetMissionV(MV_FIGHTER_GROUP1_1+(nRoomIndex-1)*2+1);
	local tPlayer = {nDanTiaoIdx1,nDanTiaoIdx2};
	local nDeathRank = abs(BT_GetData(PT_CURRANK));
	if nDeathRank == 0 then
		nDeathRank = 1;
	end;
	local nKillPoint = tKillPlayerPoint[nDeathRank];
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_MAIN_DEATH);
	--=====================================================================处理重生点
	local nCampPlace = nDeathCamp;
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--设置重生点
	--======================================================================处理难民
	local nRefugeeModel = {"宋难民","辽难民"};
	local nRefugeeName = {"宋难民","辽难民"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nDeathCamp],nRefugeeName[nDeathCamp],GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle\\refugee_talk_npc.lua");
	end;
	KillFollower()	--难民掉落
	BT_SetTempData(PTT_FOLLOWER,0);	--挂了之后清掉就对啦
	--======================================================================
	if Launcher == -1 then
		return 0;	--被caststate搞死的
	end;
	if nKillerIndex == 0 then	--被NPC杀死的
		return 0;
	end;
	if nKillerCamp == nDeathCamp then	--被自己人杀死的
		return 0;
	end;
	--======================================================================
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--非开战状态死的
		return 0;
	end;
	--======================================================================处理单挑
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE then	--单挑时被杀死
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		for i=1,2 do
			PlayerIndex = tPlayer[i];
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--清除单挑信息
			BT_SetTempData(PTT_ROOMINDEX,0);
			local nPlayerCamp = BT_GetCamp();
			nCampPlace = nPlayerCamp;
			if GetGlbValue(RANDOM_PLACE) == 1 then
				nCampPlace = 3 - nCampPlace;
			end;
			RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
			SetFightState(0);
			Restore();
			RestoreNeili();
--			ClearColdDown();	--清除所有药CD
			CastState("imme_clear_skill_interval",7,0);	--消除所有技能的冷却时间			
			BT_SetTempData(PTT_LOCK,0);	--解锁
			if PlayerIndex ~= nDeathIndex then	--如果不是死死那个
				BT_SetData(PT_SINGLE_WIN,BT_GetData(PT_SINGLE_WIN)+1);
				SetRankPoint(RANK_SINGLE_FIGHT,BATTLE_OFFSET+PT_SINGLE_WIN,0);
				BT_EmperorAward(3);	--单挑胜者有３％的机会获得皇帝嘉奖
				BT_AddPersonalPoint(2*nKillPoint);	--给予杀手一定的双倍个人积分
				--BT_AddMissionPoint(BT_GetCamp(),2*nKillPoint);		--给予杀手方一定的公共积分
				Msg2MSAll(MISSION_ID,GetName().."成功击杀对方"..sDeathName.."获得积分"..(2*nKillPoint).."点");
				Say("您已经赢得了这一回合！",0);
			else
				BT_SetData(PT_SINGLE_LOSE,BT_GetData(PT_SINGLE_LOSE)+1);
				BT_DecPersonalPoint(2*ceil(nKillPoint/3))	--扣掉被杀死方2/3的相应个人积分
				Say("您输了这场比赛，下次一定要全力以赴！",0);
			end;
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Msg2Player("您已经返回了后营");
		end;
		PlayerIndex = nDeathIndex;
		return 1;
	end;
	
	local bInTaskArea = BT_GetTempData(PTT_IN_TASK_AREA)
	if 1 == bInTaskArea then --在防作弊区被杀了
		local szName = GetName()
		PlayerIndex = nKillerIndex; --惩罚杀手
		--local nPunish = 1
		--BT_DecPersonalPoint(nPunish)
		Msg2Player(format("您在防作弊区击败了[%s]，将不会获得战场奖励", szName))
		PlayerIndex = nDeathIndex;
		return 0
	end
		
	--====================================================处理连斩、单场死亡数、单场杀人数等
	PlayerIndex = nKillerIndex;
	
	--在防作弊区杀人了，也得不到奖励
	if 1 == BT_GetTempData(PTT_IN_TASK_AREA) then
		PlayerIndex = nDeathIndex;
		return 0
	end
	
	BT_AddBattleActivity(BA_MAIN_KILL_PLAYER);
	BT_SetData(PTNC_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL)+1);
	BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
	local nSeriesKillPoint = floor(BT_GetData(PTNC_SERIES_KILL)/2);	--每多杀２个，连斩分就加１
	if BT_GetData(PTNC_SERIES_KILL) > BT_GetData(PT_BEST_SERIES_KILL) then	--最大连斩数？
		BT_SetData(PT_BEST_SERIES_KILL,BT_GetData(PTNC_SERIES_KILL));
	end;
	if BT_GetData(PTNC_KILL) > BT_GetData(PT_MAX_KILL) then	--最大杀人数？
		BT_SetData(PT_MAX_KILL,BT_GetData(PTNC_KILL));
	end;
	PlayerIndex = nDeathIndex;
	BT_SetData(PTNC_SERIES_KILL,0);
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);
	if BT_GetData(PTNC_DEATH) > BT_GetData(PT_MAX_DEATH) then
		BT_SetData(PT_MAX_DEATH,BT_GetData(PTNC_DEATH));
	end;
	if SERIES_KILL_OPEN ~= 1 then	--如果连斩没开就把nSeriesKillPoint清0
		nSeriesKillPoint = 0;
	end;
	--======================================================================处理积分
	PlayerIndex = nKillerIndex;
	
	--杀人了
	local szScript = format("pcd_on_kill()")
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
	--杀人后清雪恨状态
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);

	BT_EmperorAward(tKillPlayerEAP[nDeathRank]);	--给予杀手一定概率的皇帝嘉赏
	BT_AddPersonalPoint(nKillPoint+nSeriesKillPoint);	--给予杀手一定的个人积分
	BT_AddMissionPoint(BT_GetCamp(),nKillPoint+nSeriesKillPoint);		--给予杀手方一定的公共积分
	BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
	if nDeathCamp == SONG_ID then
		Msg2Player("您杀死了宋方"..sDeathName.."，共杀死宋方人数："..BT_GetData(PTNC_KILL).."，连续击杀人数："..BT_GetData(PTNC_SERIES_KILL));
	else
		Msg2Player("您杀死了辽方"..sDeathName.."，共杀死辽方人数："..BT_GetData(PTNC_KILL).."，连续击杀人数："..BT_GetData(PTNC_SERIES_KILL));
	end;
	
	PlayerIndex = nDeathIndex;
	
	--被杀了
	local szScript = format("pcd_on_death()")
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	CastState("imme_clear_skill_interval",7,0);	--消除所有技能的冷却时间
	BT_DecPersonalPoint(ceil(nKillPoint/3))	--扣掉被杀死方个人积分
	--Msg2MSAll(MISSION_ID,tCampNameZ[nKillerCamp].."方"..sKillerName.."杀死了"..tCampNameZ[nDeathCamp].."方"..sDeathName);
	BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
	if BT_GetTempData(PTT_LOCK) == 1 then	--如果死者已被冻结
		return 0;
	end;
	--======================================================================查询是否有多余的单挑房间
	local nRoomIndex = check_room()
	if nRoomIndex == 0 then
		return 0;	--没有空房间
	end;
	--======================================================================处理剩余单挑条件
	PlayerIndex = nKillerIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--如果杀手已被冻结
		PlayerIndex = nDeathIndex;
		return 0;
	end;
	
	--=======================================================================================
	PlayerIndex = nKillerIndex
	local nKillerRank = abs(BT_GetData(PT_CURRANK));
	if nKillerRank == 0 then
		nKillerRank = 1;
	end;
	-- local nTransmitProbability = tFIGHTPROBABILITY[nKillerRank][nDeathRank];
	-- if random(1,100) <= nTransmitProbability then	--符合传送概率
-- 		PlayerIndex = nDeathIndex;
-- 		SetFightState(0);
-- 		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
-- 		BT_SetTempData(PTT_LOCK,1);	--锁定死者
-- 		WantTo1v1(nKillerIndex, "您被"..sKillerName.."杀死，想要报仇吗？倒计时%d秒", OPERATE_TIME, "\\script\\newbattles\\mainbattle\\playerdeath.lua")
-- 		PlayerIndex = nKillerIndex;
-- 		Msg2Player("您杀死了"..sDeathName.."，对方可在"..Get_Time_String(OPERATE_TIME).."内向您报仇，请注意！");
-- 		PlayerIndex = nDeathIndex;
-- 		return 1;	--立即复活
-- 	end;
	PlayerIndex = nDeathIndex;
	return 0;	
end
--发送单挑申请
function OnWant(nKillerIndex, nType)
	local nOldPlayerIndex = PlayerIndex;
	BT_SetTempData(PTT_LOCK,0);	--死者解冻
	if nKillerIndex <= 0 then
		Talk(1,"","挑战不被接受，对方可能网络出现故障或者离开战场。");
		return 0;
	end
	if nType == 0 then	--选择取消或操作超时
		PlayerIndex = nKillerIndex;
		Msg2Player("对方超时或取消复仇的机会。");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","没有战争的消息！");
		return 0;
	end;
	local nDeathIndex = PlayerIndex;
	local sDeathName = GetName();
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		Talk(1,"","抱歉，单打区房间不够。");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--没有空房间
	end;
	PlayerIndex = nKillerIndex;
	if IsPlayerDeath() ~= 0 then	--杀手是死亡状态。这个判断可以去掉。
		PlayerIndex = nDeathIndex;
		Talk(1,"","处于死亡状态的对手不能接受挑战。");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	local sKillerName = GetName();
	if BT_GetTempData(PTT_LOCK) == 1 then	--如果目标玩家被锁定
		PlayerIndex = nDeathIndex;
		Talk(1,"","对手无法接受您的挑战邀请。");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nDeathIndex;
		Talk(1,"","无法发送复仇信息给对手，可能是因为他离开了战场。")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex
	BT_SetTempData(PTT_LOCK,1);	--锁定杀手，单挑完毕后应清0
	SetPlayerScript("\\script\\newbattles\\mainbattle\\playerdeath.lua");
	Accept1v1(nDeathIndex, sDeathName.."向您挑战，同意吗？如果您拒绝，将扣除一些积分。倒计时%d秒", OPERATE_TIME, "\\script\\newbattles\\mainbattle\\playerdeath.lua")
	PlayerIndex = nOldPlayerIndex;
end;
--接受单挑
function OnAccept(nDeathIndex,nType)
	BT_SetTempData(PTT_LOCK,0);	--杀手解冻
	if nDeathIndex <= 0 then
		Talk(1,"","由于对手离线或离开战场而无法回答。");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nRank = abs(BT_GetData(PT_CURRANK));
	if nRank == 0 then
		nRank = 1;
	end;
	local nPoint = tKillPlayerPoint[nRank];
	if nType == 0 then	--选择取消或操作超时
		ignore();	--当作逃兵处理
		PlayerIndex = nDeathIndex;
		BT_SetTempData(PTT_LOCK,0);	--死者解冻
		Talk(1,"","对手超时或选择取消！");
		BT_AddPersonalPoint(2*nPoint);	--死者加个人积分
		PlayerIndex = nOldPlayerIndex;
		BT_SetTempData(PTT_LOCK,0);	--杀手解冻
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","不接受对战邀请！");
		return 0;
	end;
	local nKillerIndex = PlayerIndex;
	local nRoomIndex = check_room();
	if nRoomIndex == 0 then
		PlayerIndex = nDeathIndex;
		Talk(1,"","抱歉，单打区房间不够。");
		PlayerIndex = nKillerIndex;
		Talk(1,"","抱歉，单打区房间不够。");
		PlayerIndex = nOldPlayerIndex;
		return 0;	--没有空房间
	end;
	PlayerIndex = nDeathIndex;
	if BT_GetTempData(PTT_LOCK) == 1 then	--如果目标玩家被锁定
		PlayerIndex = nKillerIndex;
		Talk(1,"","对手无法接受您的挑战邀请。");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if IsPlayerDeath() ~= 0 then	--死者是死亡状态。这个判断可以去掉。
		PlayerIndex = nKillerIndex;
		Talk(1,"","对手处于死亡状态，无法回答。");
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	if BT_GetData(PT_BATTLE_TYPE) ~= BATTLE_TYPE then
		PlayerIndex = nKillerIndex;
		Talk(1,"","由于对手已离开战场而无法回答。")
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end;
	PlayerIndex = nKillerIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,1);
	PlayerIndex = nDeathIndex;
	set_fight_camp(BT_GetCamp(),nRoomIndex,2);
	SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_READY);	--单挑结束后清0
	PlayerIndex = nOldPlayerIndex;
end;
--检查是否有空的单挑房间
function check_room()
	for i=1,4 do
		if GetMissionV(MV_FIGHTING_ROOM1+i-1) == ROOM_STATE_IDLE then
			return i;
		end;
	end;
	return 0;
end;

function ignore()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nRank = abs(BT_GetData(PT_CURRANK));
	if nRank == 0 then
		nRank = 1;
	end;
	local nDecPoint = tKillPlayerPoint[nRank];
	local nCamp = BT_GetCamp();
	BT_DecPersonalPoint(2*ceil(nDecPoint/3))
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"宋方"..GetName().."在战争还没开始就撤退，损失了"..(2*ceil(nDecPoint/3)).."点积分。");
	else
		Msg2MSAll(MISSION_ID,"辽方"..GetName().."在战争还没开始就撤退，损失了"..(2*ceil(nDecPoint/3)).."点积分。");
	end;
	BT_SetTempData(PTT_LOCK,0);
end;

function set_fight_camp(nCamp,nRoomIndex,nPosIndex)
	local nRefugeeModel = {"宋难民","辽难民"};
	local nRefugeeName = {"宋难民","辽难民"};
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],nRefugeeName[nCamp],GetWorldPos());
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle\\refugee_talk_npc.lua");
	end;
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--原地重生
	end;
	KillFollower()	--难民掉落
	BT_SetTempData(PTT_FOLLOWER,0);	--进入单挑时清掉就对啦
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_READY);
	SetFightState(0);
	BT_SetTempData(PTT_LOCK,1);
	BT_SetTempData(PTT_ROOMINDEX,nRoomIndex);
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--清除所有临时状态
--	ClearColdDown();	--清除所有药CD
	CastState("imme_clear_skill_interval",7,0);	--消除所有技能的冷却时间
	local nOffset = (nRoomIndex-1)*2+nCamp-1;
	SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,PlayerIndex);
	Say("单打比赛将在<color=yellow>30<color>秒后开始。",0);
	Msg2Player("30秒后将开始单打比赛，让我们做好准备！");
	BT_SetTempData(PTT_LOCK,1);	--杀手锁定
	SetPos(tFightRoom[nRoomIndex][nPosIndex][1],tFightRoom[nRoomIndex][nPosIndex][2]);
end;
