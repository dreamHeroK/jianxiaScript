Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");

function InitMission()
	BT_InitBattle();
	local sCampName1,sCampName2 = "宋","辽";
	local sModelName1,sModelName2 = "宋将军","辽国武将对话";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "宋";
		sCampName2 = "辽";
		sModelName1 = "辽国武将对话";
		sModelName2 = "宋将军";
	end;
	local npcIndex = CreateNpc(sModelName1,"军元帅",MAPID,1539,3631);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc(sModelName2,"军元帅",MAPID,1794,3147);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\maingeneral_npc.lua");
	npcIndex = CreateNpc("中原储物柜","战场军需官",MAPID,1545,3609);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("中原储物柜","战场军需官",MAPID,1803,3164);
	SetNpcScript(npcIndex,"\\script\\newbattles\\quartermaster_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1561,3614);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\soldier_npc.lua");
	npcIndex = CreateNpc("城门卫兵","前线士兵",MAPID,1776,3163);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\soldier_npc.lua");
--	for i=1,30 do
--		AddMapTrap(MAPID,(1550+i)*32,(3600+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua")
--		AddMapTrap(MAPID,(1550+i)*32,(3601+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua")
--	end;
--	for i=1,30 do
--		AddMapTrap(MAPID,(1755+i)*32,(3161+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua");
--		AddMapTrap(MAPID,(1755+i)*32,(3162+i)*32,"\\script\\newbattles\\villagebattle\\trap.lua");
--	end;
end;

function RunMission()
	local npcIndex = CreateNpc("王安石","向导",MAPID,1629,3321);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\armyguide_npc.lua");
	Msg2MSAll(MISSION_ID,"斥候回报，敌人已采取行动，我军迅速进入战场准备战斗。");
	BT_RunBattle();
end;

function EndMission()
	SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);	--设置为结束状态，在这里设置是为了方便测试时直接用CloseMission结束战场
	local nStepSong = 0;
	local nStepLiao = 0;
	if GetMissionV(MV_WINNER) == 0 then	--如果是时间到了而结束的
		nStepSong = GetMissionV(MV_SONG_TASKSTEP);
		nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
		if nStepSong > nStepLiao then
			SetMissionV(MV_WINNER,SONG_ID);
			Msg2SubWorld("经过激烈的战斗，宋军在雁门关村落争夺战场赢得了最后的胜利！");
		elseif nStepSong < nStepLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
			Msg2SubWorld("经过激烈的战斗，辽军在雁门关村落争夺战场赢得了最后的胜利！");
		else
			SetMissionV(MV_WINNER,ALL_ID);
			Msg2SubWorld("经过激烈的战斗，宋辽双方在雁门关村落争夺战场都没能找到土民首领，打成平局！");
		end;
	end;
	local nWhoWin = GetMissionV(MV_WINNER);
	SetGlbValue(GLB_VILLAGE,nWhoWin);
	local nYear,nMonth,nDay,nHour = tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),tonumber(date("%H"));
	if STATISTIC_OPEN == 1 then
		DelRelayShareDataCopy(RELAY_DATA_BATTLE,BATTLE_TYPE,1);
		AddRelayShareData(RELAY_DATA_BATTLE,BATTLE_TYPE,1,"","",0,"final_result","ddddddd",nWhoWin,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour);
	end;
	BT_EndBattle();
end;

function OnLeave(RoleIndex)	--注意对在打仗过程中离线的处理
	PlayerIndex = RoleIndex;
	BT_ShowDebugInfor(GetName().."BT_GetCamp trong OnLeave");
	local nCamp = BT_GetCamp();
	local sName = GetName();
	local nFoundTag = 0;
	local nTempState = BT_GetTempData(PTT_SELECTED);	--BT_LeaveBattle会清除所有临时变量，因此这里要先保存下来
	if BT_LeaveBattle() == 1 then
		if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT and nTempState == 1 then	--只有在开战阶段并且是选中的人离开战场才作以下处理
			local tPlayer = BT_GetMSPlayerIndex(nCamp);
			local nPlayerCount = getn(tPlayer);
			local sNewName = "";
			local nFakeIndex = 0;	--记录玩家索引在tPlayer中的索引，因此是假的玩家索引 =,=
			local nTargetName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
			BT_ShowDebugInfor("nPlayerCount:"..nPlayerCount);
			if nPlayerCount > 0 then	--如果场内还有同阵营的玩家
				BT_ShowDebugInfor("nPlayerCount > 0")
				for i=1,10 do	--重新选人的时候最多循环10次，如果找不到就说明剩下的玩家都是已经被选择的人
					nPlayerCount = getn(tPlayer);
					if nPlayerCount == 0 then
						BT_ShowDebugInfor("玩家被选择");
						break;
					end;
					nFakeIndex = random(1,nPlayerCount);
					PlayerIndex = tPlayer[nFakeIndex];
					if PlayerIndex > 0 and Is_The_Selected(nCamp) ~= 1 then	--新选择的玩家不是之前被选中的
						BT_SetTempData(PTT_SELECTED,1);
						sNewName = GetName();
						TaskTip("元帅有命令，让你迅速找到"..nTargetName);
						nFoundTag = 1;
						break
					else	--如果不符合条件，则把这个玩家的索引从tPlayer中删除掉
						tremove(tPlayer,nFakeIndex);
					end;
				end;
				for i=1,SELECT_COUNT do
					if GetMissionS(MSTR_SONG_ONE+nCamp+i*2-3) == sName then	--找到原来的名字
						SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sNewName);	--设置新的名字，如果上面没找到，那么sNewName就是""
					end;
				end;
			else --如果是最后一位退出的
				BT_ShowDebugInfor("雁门关村落争夺战场最后一名玩家离开战场")
				Clear_Task_NPC(nCamp);
				SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--名字置空，以便后来进入的玩家可以重新开始。
			end;
			if nFoundTag == 1 then
				Msg2MSGroup(MISSION_ID,""..sName.."已离开战场，将士们需要团结一致找到新的知情人"..sNewName.."。",nCamp);
				Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."_寻找新的知情人:"..sNewName.."正在执行任务");
			end;
		end;
	end;
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	BT_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end;