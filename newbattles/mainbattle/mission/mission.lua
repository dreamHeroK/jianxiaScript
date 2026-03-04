Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\script\\newbattles\\mainbattle\\position.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "宋","辽";
	local sModelName1,sModelName2 = "宋将军","辽国武将对话";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "辽";
		sCampName2 = "宋";
		sModelName1 = "辽国武将对话";
		sModelName2 = "宋将军";
	end;
	
	--创建职能npc		
	for i = 1,getn(tPositionFo) do --八个小佛
		nNpcIdx = CreateNpc("素仙秋若水对话","峨眉大师姐",MAPID,1567,3731);
		 SetNpcScript(nNpcIdx,"\\script\\global\\gm\\createautobuff.lua"); 
		nNpcIdx = CreateNpc("素仙秋若水对话","峨眉大师姐",MAPID,1929,3720);
		 SetNpcScript(nNpcIdx,"\\script\\global\\gm\\createautobuff.lua"); 
	end

	local npcIndex = CreateNpc(sModelName1,sCampName1.."军元帅",MAPID,1534,3745);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."军元帅",MAPID,1961,3735);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("中原储物柜",sCampName1.."战场军需官",MAPID,1512,3754);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("中原储物柜",sCampName2.."战场军需官",MAPID,1985,3746);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1571,3735);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\soldier_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1924,3725);
	SetNpcScript(npcIndex,"\\script\\newbattles\\mainbattle\\soldier_npc.lua");
	--==================以下是捷径的TRAP点====================================================
	for i=0,45 do	--左边的TRAP点
		AddMapTrap(MAPID,1669*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
		AddMapTrap(MAPID,1670*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
	end;
	for i=0,40 do	--右边的TRAP点
		AddMapTrap(MAPID,1828*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
		AddMapTrap(MAPID,1829*32,(3650+i)*32,"\\script\\newbattles\\mainbattle\\trap_royal_road.lua");
	end;
	--========================================================================================
	SetMissionV(MV_MID_TRAP_SONG,1);	--可以走中营
	SetMissionV(MV_MID_TRAP_LIAO,1);
	local nEmplacementCamp = GetGlbValue(GLB_EMPLACEMENT);
	if nEmplacementCamp == SONG_ID then
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nEmplacementCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"斥候回报，敌人已采取行动，我军迅速进入战场准备战斗。");
	
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_SOLDIER,SOLDIER_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_LOOEY,LOOEY_COUNT,LIAO_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,SONG_ID);
	Create_Fight_NPC(TYPE_CAPTAIN,CAPTAIN_COUNT,LIAO_ID);
	
	local nVillageCamp = GetGlbValue(GLB_VILLAGE);
	local nEmplacementCamp = GetGlbValue(GLB_EMPLACEMENT);
	local nResourceCamp = GetGlbValue(GLB_RESOURCE);
	WriteLog("[战场]: 主战场已经开始， 结果：阵营("..nVillageCamp.."), 难怪 ("..nResourceCamp.."), 要塞。 ("..nResourceCamp..")");
	Create_Emplacement(ALL_ID,nEmplacementCamp);	--公共炮台属于炮台战赢的一方（平手就是公共的啦）
	if GetGlbValue(RANDOM_PLACE) == 1 then
		Create_Emplacement(SONG_ID,LIAO_ID);
		Create_Emplacement(LIAO_ID,SONG_ID);
	else
		Create_Emplacement(SONG_ID,SONG_ID);
		Create_Emplacement(LIAO_ID,LIAO_ID);	
	end;
	
	SetMissionV(MV_HERO_DEATH,1);	--初始化土民首领和奇人异士数目
	SetMissionV(MV_HEADER_DEATH,1);

	Create_VillagerHeader(nVillageCamp);
	Create_Villager(nVillageCamp);
	Create_Refugee(SONG_ID,REFUGEE_COUNT);
	Create_Refugee(LIAO_ID,REFUGEE_COUNT);
	Create_Refugee_Receiver(SONG_ID);
	Create_Refugee_Receiver(LIAO_ID);
	--Create_Assistant_Hirer(SONG_ID);
	--Create_Assistant_Hirer(LIAO_ID);
	Create_Box();
	Create_Nonaligned_Hero();
	Create_ArrowBuilding();
	
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--设置为结束状态，在这里设置是为了方便测试时直接用CloseMission结束战场
	--这里要根据MV_WHO_WIN的Mission变量值来记录这场战争的胜负情况，使用服务器变量
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == ALL_ID then
		Msg2SubWorld("经过激烈的战斗，宋辽双方在雁门关打成平手！");
	elseif nWhoWin == SONG_ID then
		Msg2SubWorld("经过激烈的战斗，宋军在主战场雁门关赢得了最后的胜利！");
	else
		Msg2SubWorld("经过激烈的战斗，辽军在主战场雁门关赢得了最后的胜利！");
	end;
	SetGlbValue(GLB_MAINBATTLE,GetMissionV(MV_WINNER));
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nDeathSong = GetMissionV(MV_DEATH_COUNT_SONG);
	local nDeathLiao = GetMissionV(MV_DEATH_COUNT_LIAO);
	local nHelpRefugeeSong = GetMissionV(MV_HELP_REFUGEE_COUNT_SONG);
	local nHelpRefugeeLiao = GetMissionV(MV_HELP_REFUGEE_COUNT_LIAO);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddddddd",nWhoWin,nPubPointSong,nPubPointLiao,nHelpRefugeeSong,nHelpRefugeeLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
	BT_BattleAllOver();
end;

function OnLeave(RoleIndex)	--注意对在打仗过程中离线的处理
	PlayerIndex = RoleIndex;
	local nCamp = BT_GetCamp();
	local nRefugeeModel = {"宋难民","辽难民"};
	BT_ShowDebugInfor("第 GetMissionV(MS_BATTLE_STATE):"..GetMissionV(MS_BATTLE_STATE));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then	--在战争进行时离开
		BT_ShowDebugInfor("第 BT_GetTempData(PTT_FOLLOWER):"..BT_GetTempData(PTT_FOLLOWER));
		if BT_GetTempData(PTT_FOLLOWER) == 1 then
			local szNpcName = "";
			if nCamp == SONG_ID then
				szNpcName = "宋难民";
			else
				szNpcName = "辽难民";
			end;	
			local nRefugeeIndex = CreateNpc(nRefugeeModel[nCamp],szNpcName,GetWorldPos());
			SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle\\refugee_talk_npc.lua");
			BT_ShowDebugInfor("制造一场平民意外，指南："..nRefugeeIndex)
			BT_SetData(PT_HAVE_REFUGEE,1)
		end;
		BT_ShowDebugInfor("在这里删除，然后!!!!!")
		KillFollower()	--难民掉落
		BT_SetTempData(PTT_FOLLOWER,0);	--离开的时候清掉就对啦
	end;
	if BT_GetTempData(PTT_FIGHT_STATE) ~= ROOM_STATE_IDLE or BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--如果在单挑的时候离开了战场,这里使用两个条件作保证
		local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
		local sName = GetName();
		local nEnemyCamp = 3 - nCamp;
		local nOffset1 = (nRoomIndex-1)*2+nCamp-1;	
		local nOffset2 = (nRoomIndex-1)*2+nEnemyCamp-1;
		local nDeathRank = abs(BT_GetData(PT_CURRANK));	--退出就当是被杀死了
		if nDeathRank == 0 then
			nDeathRank = 1;
		end;
		local nRankPoint = tKillPlayerPoint[nDeathRank];
		if GetMissionV(MV_FIGHTER_GROUP1_1+nOffset1) ~= 0 or GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0) ~= 0 then	--第一个退出的
			BT_SetData(PT_SINGLE_LOSE,BT_GetData(PT_SINGLE_LOSE)+1);
			BT_DecPersonalPoint(2*ceil(nRankPoint/3));	--扣除个人积分2/3的相应个人积分
			
			PlayerIndex = GetMissionV(MV_FIGHTER_GROUP1_1+nOffset2);	--留在场上的人获胜
			BT_SetData(PT_SINGLE_WIN,BT_GetData(PT_SINGLE_WIN)+1);
			SetRankPoint(RANK_SINGLE_FIGHT,BATTLE_OFFSET+PT_SINGLE_WIN,0);
			BT_EmperorAward(3);	--单挑胜者有３％的机会获得皇帝嘉奖
			BT_AddPersonalPoint(2*nRankPoint);	--给予杀手一定的双倍个人积分
			BT_AddMissionPoint(BT_GetCamp(),2*nRankPoint);		--给予杀手方一定的公共积分
			
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
			BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
			Say(sName.."退出游戏，单打冠军就是您的！",0);
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),14);
			SetFightState(0);
			Restore();
			RestoreNeili();
			
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset1,0);	--第一个人退出的时候把两个变量都清0,这样就可以玩家判断是不是第二个人退出
			SetMissionV(MV_FIGHTER_GROUP1_1+nOffset2,0);
		else
			SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);	--第二个退出的时候要把房间标记为空闲状态以便后来人进入
		end;
	end;
	PlayerIndex = RoleIndex;
	BT_LeaveBattle();
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;