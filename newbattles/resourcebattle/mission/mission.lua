Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

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
	local npcIndex = CreateNpc(sModelName1,sCampName1.."军元帅",MAPID,1560,3562);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,sCampName2.."军元帅",MAPID,1779,3172);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("中原储物柜",sCampName1.."战场军需官("..sCampName1..")",MAPID,1563,3538);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("中原储物柜",sCampName2.."战场军需官("..sCampName2..")",MAPID,1764,3168);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1582,3546);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1758,3196);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("难民","难民",MAPID,1602,3260);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\refugee_npc.lua");
	npcIndex = CreateNpc("山贼首领","山贼首领",MAPID,1735,3534)
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\cateran_header_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1573+i)*32,(3532+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua")
--		AddMapTrap(MAPID,(1573+i)*32,(3533+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1742+i)*32,(3192+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua");
--		AddMapTrap(MAPID,(1742+i)*32,(3193+i)*32,"\\script\\newbattles\\resourcebattle\\trap.lua");
--	end;
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--初始化战鼓数量
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--初始化战鼓数量
end;

function RunMission()
	Msg2MSAll(MISSION_ID,"斥候回报，敌人已采取行动，我军迅速进入战场准备战斗。");
	SetMissionV(MV_RESOURCE_SONG,BASE_RESOURCE);
	SetMissionV(MV_RESOURCE_LIAO,BASE_RESOURCE);
	Create_QuarterMaster();
	Reflash_Res();
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--设置为结束状态，在这里设置是为了方便测试时直接用CloseMission结束战场
	local nResSong = GetMissionV(MV_RESOURCE_SONG);
	local nResLiao = GetMissionV(MV_RESOURCE_LIAO);
	if nResSong > nResLiao then
		SetMissionV(MV_WINNER,SONG_ID);--宋赢
		Msg2SubWorld("经过激烈的战斗，宋军在雁门关草谷场战场赢得了最后的胜利！");
	elseif nResSong == nResLiao then
		SetMissionV(MV_WINNER,ALL_ID);--打平
		Msg2SubWorld("经过激烈的战斗，宋辽双方在雁门关草谷场战场打成平局！");
	else
		SetMissionV(MV_WINNER,LIAO_ID);--辽赢
		Msg2SubWorld("经过激烈的战斗，辽军在雁门关草谷场战场赢得了最后的胜利！");
	end;
	--这里要根据MV_WHO_WIN的Mission变量值来记录这场战争的胜负情况，使用服务器变量
	SetGlbValue(GLB_RESOURCE,GetMissionV(MV_WINNER));
	local nWhoWin = GetMissionV(MV_WINNER);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddd",nWhoWin,nResSong,nResLiao,nYear,nMonth,nDay,nHour);
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
