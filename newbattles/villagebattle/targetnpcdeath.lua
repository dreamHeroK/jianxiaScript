--filename:targetnpcdeath.lua
--create date:2006-06-02
--describe:目标NPC死亡脚本
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nCamp = BT_GetCamp()
	local nEnemyCamp = 3 - nCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp);
	local sNewTargetName = "";
	local nStep = 0;
	local nPoint = 0;
	local nEvenID = 0;
	local nNpcType = 0;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetNpcDeathScript(npcIndex,"");
	BT_EmperorAward(1);
	BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	if tonumber(npcIndex) == GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp) then	--杀死的是本方目标NPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			nStep = 1;
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = 2;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = 3;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		BT_AddBattleEvenPoint(nEvenID);
		if Modify_Task_Step(nCamp,nStep) == 1 then
			Reach_Final_Step(nCamp);
		else
			sNewTargetName = Go_To_Next_Step(nCamp);
			Talk(1,"","<color=green>"..sName.."<color>：你想要找到首领，你必须去问问<color=yellow>"..sNewTargetName.."<color>，他常住在村子里。")
			Msg2MSGroup(MISSION_ID,"前线战报:"..sNewTargetName.."可能知道首领，邀请各路将士迅速找出来。目前，我们已获得土民的信任"..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
		end;
	else	--杀死的是敌方目标NPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nEnemyCamp-1);
		if nNpcType == SICK_NPC then
			nStep = -2;	--扣掉敌方步骤数
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = -3;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = -5;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		Modify_Task_Step(nEnemyCamp,nStep);
		BT_AddBattleEvenPoint(nEvenID);
		sNewTargetName = Go_To_Next_Step(nEnemyCamp);
		BT_OperateAllPlayer(tell_fail,{sNewTargetName,nEnemyCamp},nEnemyCamp)
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "太遗憾了！知情人在我们到来之前已被敌人谋杀。但是我们得到了一个消息：土民<color=yellow>"..sName.."<color>可能知道首领的下落，邀请将士们<color=yellow>";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color>迅速去那里找到下一个知情人<color=yellow>"..sName.."<color>。";
	Say(sContent,0);
end;