--filename:timer.lua
--create date:2006-06-22
--describe:主战场中主计时器脚本
Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\script\\newbattles\\mainbattle\\position.lua");
SZ_BF_CHEAT_OP_SCRIPT = "\\script\\newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		
		local szScript = format("pco_initialize()")
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
		if mod(nGlobalState,10) == 3 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--变为xx4
			AddGlobalNews("雁门关主战场已经准备就绪，请尽快前往赵延年或萧远楼处前往战场");
			Msg2Global("雁门关主战场已经准备就绪，请尽快前往赵延年或萧远楼处前往战场");
		end;
	else
		if mod(nLoop,10) == 0 then
			AddGlobalNews("雁门关主战场一触即发，目前正进入报名阶段，请尽快前往赵延年或萧远楼处报名，报名时间还剩"..(floor(nLoop/10)*5).."分钟。");
			Msg2Global("雁门关主战场一触即发，目前正进入报名阶段，请尽快前往赵延年或萧远楼处报名，报名时间还剩"..(floor(nLoop/10)*5).."分钟。");
		end;
		Msg2MSAll(MISSION_ID,""..tBattleName[BATTLE_TYPE].."现在还在准备阶段，战场还有"..Get_Time_String(READY_TIME/18*nLoop).."开启，当前宋辽双方["..nPlayerSong.."]:["..nPlayerLiao.."]");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;
function BT_ShowBattleRank2(nPlayerCount)
--增加一个战场结束以后得排名关联奖励 正常可以用得只是关闭了
--	local tbPlayer = mf_SortMSPlayerByTaskValue(MISSION_ID,PTNC_BATTLEPOINT+BATTLE_OFFSET,0);
--	local nOldPlayerIdx = PlayerIndex;
--	for i=1,min(getn(tbPlayer),nPlayerCount) do
--		PlayerIndex = tbPlayer[i];		
--	if 	i == 1 then
--	gf_AddItemEx({2,95,617,1,4},"师门真卷包裹");
 --   gf_AddItemEx({2,301,random(23,34),30});	
--	elseif 	i == 2 then
--	gf_AddItemEx({2,95,18385,1,4},"师门70级秘籍");
 --   gf_AddItemEx({2,301,random(23,34),20});	
--    else	
--	gf_AddItemEx({2,301,random(23,34),10});	
--	end;
			
--	end;
--	PlayerIndex = nOldPlayerIdx;
end;
function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ShowBattleRank2(10);	--显示个人积分排行榜前10名
		
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."结束");
		
		local szScript = format("pco_uninitialize()")
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		
		if nPubPointSong > nPubPointLiao then
			SetMissionV(MV_WINNER,SONG_ID);
		elseif nPubPointSong < nPubPointLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
		else
			SetMissionV(MV_WINNER,ALL_ID);
		end;
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		local nVillageResult = GetGlbValue(GLB_VILLAGE);
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"剩余时间: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		local timeshijian = FIGHT_TIMER_LOOP-nLoop+1
		if timeshijian == 4 then
			AddLocalNews("雁门关战场公告：世界BOSS也将参与此次战争，各位大侠赶紧集合。（战争开始后20分钟出现）");--滚动通知
		end
		if timeshijian == 40 then	
			 npcIndex = CreateNpc("枪神赢天BOSS", "枪神赢天",884,1752,3487)
	         msg="世界BOSS出现了"
		     AddLocalNews(msg)    
	         SetNpcLifeTime(npcIndex, 7200)
	         SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\zcwb_boss_death.lua");
			return										
		end
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"当前宋辽双方战场人数 ["..nPlayerSong.."]:["..nPlayerLiao.."]");
		end;
		if mod(nLoop,9) == 0 then	--三分钟刷一次宝箱
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
			Msg2MSAll(MISSION_ID,"当前宋辽双方战场积分 ["..nPubPointSong.."]:["..nPubPointLiao.."]");
		end;
		if mod(nLoop,30) == 0 then	--十分钟刷一次奇人异士和土民首领
			Create_Nonaligned_Hero();
			Create_VillagerHeader(nVillageResult);
			BT_ShowBattleRank(10);	--显示个人积分排行榜前10名
		end;
		if mod(nLoop,9) == 0 then
			BT_ShowDebugInfor("土民，人数："..GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Random_Pos_Villager(nVillageResult,GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT),SONG_ID);
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_LIAO_SOLDIER_COUNT),LIAO_ID);
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"战场停留时间剩余："..(COMPLETE_TIME/18*nLoop).."秒");
	end;
end;

function tell_end(tArg)
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == SONG_ID then
		szResult = "宋军获得了最终胜利。";
	elseif nWhoWin == LIAO_ID then
		szResult = "辽军获得了最终胜利。";
	else
		szResult = "宋辽双方打成了平局。";
	end;
	Say(tBattleName[BATTLE_TYPE].."已结束，<color=yellow>宋方最终获得积分:"..nPubPointSong..", 辽方获得积分:"..nPubPointLiao..", "..szResult.."<color>。您也付出了巨大的努力，准备接受奖励吧。",0);
	SetFightState(0);
	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 4));
	RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));	--删除单挑时间触发器
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--清除单挑信息
	BT_SetTempData(PTT_ROOMINDEX,0);
end;

