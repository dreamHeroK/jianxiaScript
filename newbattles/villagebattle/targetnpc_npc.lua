Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		return 0;
	end;
	local _,nNpcX,nNpcY = GetNpcWorldPos(npcIdx);
	if BT_GetDistance(nNpcX,nNpcY) >= 5 then
		Msg2Player("您距离"..npcName.."太远了");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	if npcName ~= GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp) then	--这个是敌方的目标NPC
		Talk(1,"","<color=green>"..npcName.."<color>： 你有什么事？");
		return 0;
	end;
	if Is_The_Selected(nCamp) == 1 then	--如果是被选中的人之一
		Talk(1,"#reaction(\""..npcName.."\")","请注意，您如果有首领的下落，我会很感激的。");
		BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	else
		Talk(1,"","<color=green>"..npcName.."<color>： 你有什么事？");
	end;
end;

function reaction(sNpcName)
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME+nPlayerCamp-1);
	if sNpcName ~= sName then	--避免两个玩家同时点击NPC时出现的意外情况
		return 0;
	end;
	local sNewTargetName = "";
	
	if GetMissionV(MV_SONG_KILL_LIAO+nEnemyCamp-1) >= 10 then	--如果对方杀死本方方全部知情人
		if Modify_Task_Step(nPlayerCamp,5) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName = Go_To_Next_Step(nPlayerCamp);
			if nEnemyCamp == SONG_ID then
				Say("<color=green>"..sName.."<color>：你们这么来的这么晚？我的兄弟姐妹被宋军杀害，请帮我报仇，呵呵！关于首领，<color=yellow>"..sNewTargetName.."<color>是最了解的人。",0);	
			else
				Say("<color=green>"..sName.."<color>：你们这么来的这么晚？我的兄弟姐妹被辽军杀害，请帮我报仇，呵呵！关于首领，<color=yellow>"..sNewTargetName.."<color>是最了解的人。",0);	
			end;
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);	
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) >= 10 then--如果本方杀死本方全部知情人
		Talk(1,"","<color=green>"..sName.."<color>：哈！您竟然敢向匪徒寻求土民首领的信息，我会和你一起死在这里的！");
		change_npc2fight(nPlayerCamp,sName,RAGING_NPC);	--变身狂暴的目标npc
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) == 0 then	--如果本方未杀死本方任何知情人
		if Modify_Task_Step(nPlayerCamp,2) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName =Go_To_Next_Step(nPlayerCamp);
			Say("<color=green>"..sName.."<color>：虽然我是失败者，但我仍然了解真相，区分善与恶。想要找到首领，可以问<color=yellow>"..sNewTargetName.."<color>，他常住在这个村庄，也许可以帮助到您。",0);	
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) <= 3 then	--如果本方杀死本方知情人数目不超过3
		if Modify_Task_Step(nPlayerCamp,1) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName = Go_To_Next_Step(nPlayerCamp);
			Say("<color=green>"..sName.."<color>：嘿！争权夺利，像我们这样的人只能受苦，想找首领可以问<color=yellow>"..sNewTargetName.."<color>，我不想参与这个！",0);
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) < GetMissionV(MV_SONG_KILL_LIAO+nEnemyCamp-1) then	--如果本方杀死知情人数目超过3但比敌方杀的少
		Talk(1,"","<color=green>"..sName.."<color>：呸！与杀手和强盗相比，你们和他们有什么区别？我绝对不透露首领的下落。");
		change_npc2fight(nPlayerCamp,sName,SICK_NPC);	--变身仇恨的目标npc
	else	--如果本方杀死知情人数目超过3且比敌人杀得多
		if nEnemyCamp == SONG_ID then
			Talk(1,"","<color=green>"..sName.."<color>：想要找首领必须跨过我的身体！");
		else
			Talk(1,"","<color=green>"..sName.."<color>：想要找首领必须跨过我的身体！");
		end;
		change_npc2fight(nPlayerCamp,sName,ANGRY_NPC);	--变身愤怒的目标npc
	end;
end;
--变身为战斗NPC。输入参数：NPC阵营，NPC名字，NPC类型
function change_npc2fight(nCamp,sName,nType)	
	local npcIndex = GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp);
	if npcIndex == 0 then
		WriteLog("[战场错误]: 功能 change_npc2fight 获得 NPC是0");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex);
	SetNpcScript(npcIndex,"");
	SetNpcLifeTime(npcIndex,0)
	if nType == SICK_NPC then
		npcIndex = CreateNpc("仇恨的土民","仇恨的"..sName,MapID,MapX,MapY);
	elseif nType == ANGRY_NPC then
		npcIndex = CreateNpc("愤怒的土民","愤怒的"..sName,MapID,MapX,MapY);
	else
		npcIndex = CreateNpc("狂暴的土民","狂暴的"..sName,MapID,MapX,MapY);
	end;
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,nType);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);
	SetNpcDeathScript(npcIndex,"\\script\\newbattles\\villagebattle\\targetnpcdeath.lua");
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,1);	--设置目标NPC的当前状态为战斗状态
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,GetMissionV(MV_TIMER_LOOP));	--记录目标NPC变成战斗NPC时计时器的计时次数
end;
