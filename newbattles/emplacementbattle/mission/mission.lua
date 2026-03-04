Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

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
	local npcIndex = CreateNpc(sModelName1,sCampName1.."军元帅",MAPID,1602,3358);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."军元帅",MAPID,1855,3360);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("中原储物柜",sCampName1.."战场军需官",MAPID,1582,3366);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("中原储物柜",sCampName2.."战场军需官",MAPID,1875,3365);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1623,3358);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\soldier_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1837,3361);
	SetNpcScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\soldier_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1617+i)*32,(3332+i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua")
--		AddMapTrap(MAPID,(1617+i)*32,(3333+i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1810+i)*32,(3357-i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua");
--		AddMapTrap(MAPID,(1810+i)*32,(3358-i)*32,"\\script\\newbattles\\emplacementbattle\\trap.lua");
--	end;
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"斥候回报，敌人已采取行动，我军迅速进入战场准备战斗。");
	Create_Emplacement(ALL_ID); --设置炮台为中立状态
	Create_Npc("土民",getn(tNative_Pos));
	Create_Npc("炮台守卫",getn(tGuard_Pos));
	Create_Box();
	StartMissionTimer(MISSION_ID,INJURE_TIMER_ID,INTERVAL_TIME);
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--设置为结束状态，在这里设置是为了方便测试时直接用CloseMission结束战场
	local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
	local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
	if nTimeSong > nTimeLiao then
		SetMissionV(MV_WINNER,SONG_ID);--宋赢
		Msg2SubWorld("经过激烈的战斗，宋军在雁门关炮台战场赢得了最后的胜利！");
	elseif nTimeSong == nTimeLiao then
		SetMissionV(MV_WINNER,ALL_ID);--打平
		Msg2SubWorld("经过激烈的战斗，宋辽双方在雁门关炮台战场打成平局！");
	else
		SetMissionV(MV_WINNER,LIAO_ID);--辽赢
		Msg2SubWorld("经过激烈的战斗，辽军在雁门关炮台战场赢得了最后的胜利！");
	end;
	--下面两个公告是炮台战特有的，因为炮台战结束的时候，另两个战场必结束，因此另两个战场结束时不必发通告
	AddGlobalNews("雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战已经结束，雁门关主战场将在15分钟后开始，请各路英雄速速报名参战，御敌勤王！");
	Msg2SubWorld("雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战已经结束，雁门关主战场将在15分钟后开始，请各路英雄速速报名参战，御敌勤王！");

	--这里要根据MV_WHO_WIN的Mission变量值来记录这场战争的胜负情况，使用服务器变量
	SetGlbValue(GLB_EMPLACEMENT,GetMissionV(MV_WINNER));
	SetGlbValue(GLB_NEW_BATTLESTATE,0);	--标记小战场全部结束
	StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nDeathSong = GetMissionV(MV_DEATH_COUNT_SONG);
	local nDeathLiao = GetMissionV(MV_DEATH_COUNT_LIAO);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddddddd",nWhoWin,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
end;

function OnLeave(RoleIndex)	--注意对在打仗过程中离线的处理
	PlayerIndex = RoleIndex;
	BT_LeaveBattle();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;
