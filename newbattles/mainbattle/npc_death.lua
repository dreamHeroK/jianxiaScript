Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\script\\newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\mainbattle\\kill_npc_effect.txt")
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local sNpcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	if PlayerIndex == 0 then
		process_npc_kill_npc(npcIndex)
	else
		process_player_kill_npc(npcIndex)
	end;
end;

function get_emplacement_pos_index(nMapX,nMapY)
	for i=0,getn(tEmplacementPos) do
		if nMapX == tEmplacementPos[i][1] and nMapY == tEmplacementPos[i][2] then
			return i;
		end;
	end;
	BT_ShowDebugInfor("[错误战场]: 功能 get_emplacement_pos_index 找不到要塞位置");
	WriteLog("[错误战场]: 功能 get_emplacement_pos_index 找不到要塞位置");
end;
--处理NPC杀死NPC事件
function process_npc_kill_npc(npcIndex)	
	local nVillageCamp = GetGlbValue(GLB_VILLAGE);
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == "土民" then	--根据村落战结果来确定给哪一方加分
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,1);
		end;
		return 0;
	elseif sNpcName == "土民首领" then	--根据村落战结果来确定给哪一方加分
		SetMissionV(MV_HEADER_DEATH,1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,2);
		end;
		return 0;
	elseif sNpcName == "奇人异士" then	--这个是中立NPC
		SetMissionV(MV_HERO_DEATH,1);
		return 0;
	elseif sNpcName == "箭塔" or sNpcName == "箭塔" then	--这个NPC是用来摆设的
		return 0;
	elseif sNpcName == "宋难民" or sNpcName == "辽难民" then
		return 0;
	end	
	local nNpcCamp = get_npc_camp(sNpcName);
	process_camp_fight_camp(nNpcCamp,sNpcName,npcIndex,1)
end;
--处理玩家杀死NPC事件
function process_player_kill_npc(npcIndex)
	local sNpcName = GetNpcName(npcIndex);
	local nNpcType = 0;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nEmplacementPosIndex = 0;
	local BoxEffectFunc = function(tArg)
		Do_Box_Effect(TBOX_FILE);
	end;
	if sNpcName == "土民" then
		nNpcType = TYPE_REFUGEE;
		BT_AddBattleActivity(BA_MAIN_KILL_NATIVE);
	elseif sNpcName == "土民首领" then
		nNpcType = TYPE_HEADER;
		SetMissionV(MV_HEADER_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"玩家："..GetName().."击杀了"..sNpcName.."，将士们一鼓作气，冲啊！",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "奇人异士" then
		nNpcType = TYPE_HERO;
		SetMissionV(MV_HERO_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"玩家："..GetName().."击杀了"..sNpcName.."，将士们一鼓作气，冲啊！",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "宋难民" or sNpcName == "辽难民" then
		return 0;
	else
		nNpcType = process_camp_fight_camp(nPlayerCamp,sNpcName,npcIndex,2)
		if nNpcType == TYPE_EMPLACEMENT then
			BT_AddBattleActivity(BA_MAIN_KILL_EMPL);
		elseif nNpcType <= TYPE_CAPTAIN then
			BT_AddBattleActivity(BA_MAIN_KILL_ENEMY);	--杀死一个对方士兵，校尉，都统
		else 
			BT_AddBattleActivity(BA_MAIN_KILL_BOSS);	--杀死对方阵营的先锋、将军、元帅
		end;
	end;
	BT_EmperorAward(tKillNpcEAP[nNpcType]);
	local nPoint = tKillNpcPoint[nNpcType]
	local nKillVillagerPoint = BT_GetData(PTNC_KILL_VILLAGER_POINT);
	local nKillSoldierPoint = BT_GetData(PTNC_KILL_SOLDIER_POINT);
	if nNpcType == TYPE_REFUGEE then	--如果杀的是土民，就记一下
		if nKillVillagerPoint < KILL_VILLAGER_POINT_LIMITED then	
			--BT_AddPersonalPoint(nPoint);	--给予玩家一定的个人积分
			--BT_SetData(PTNC_KILL_VILLAGER_POINT,nKillVillagerPoint+nPoint);
		end;
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
	elseif nNpcType == TYPE_SOLDIER then	--如果杀的是士兵，也记一下
		if nKillSoldierPoint < KILL_SOLDIER_POINT_LIMITED then	
			--BT_AddPersonalPoint(nPoint);	--给予玩家一定的个人积分
			--BT_SetData(PTNC_KILL_SOLDIER_POINT,nKillSoldierPoint+nPoint);
		end;
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp)+1);
	else
		--BT_AddPersonalPoint(nPoint);	--给予玩家一定的个人积分
	end;
	BT_AddMissionPoint(nPlayerCamp,nPoint);		--给予一定的公共积分
	Judge_State_By_Point(nPlayerCamp);
end;
--处理一个阵营的玩家或NPC打死另一个阵营的NPC事件
--因为是泛化为NPC打NPC，因此这个函数里面不会对玩家状态进行操作，即可以忽略PlayerIndex
function process_camp_fight_camp(nPlayerCamp,sNpcName,nNpcIndex,nKillType)
	local nEnemyCamp = 3 - nPlayerCamp
	if nEnemyCamp >= 3 then
		nEnemyCamp = random(1,2)
	end
	local sNpcTypeName = get_npc_type(sNpcName);
	local _,nNpcPos_X,nNpcPos_Y = GetNpcWorldPos(nNpcIndex);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	if sNpcTypeName == "炮台" then		
		local nEmplacementPosIndex = get_emplacement_pos_index(nNpcPos_X,nNpcPos_Y);		
		local nEmplacementCamp = nPlayerCamp
		if nKillType == 1 then
			nEmplacementCamp = nEnemyCamp
		end
		Create_Emplacement(nEmplacementPosIndex,nEmplacementCamp)		
		if GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT1_POSSESSION) and GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT2_POSSESSION) then
			--Try_To_Create_FightNPC("元帅",nEnemyCamp);	--本方占据三门火炮，对方元帅出
		end;
		SetNpcLifeTime(nNpcIndex,0);	--炮台是立即消失的
		nNpcType = TYPE_EMPLACEMENT;
	elseif sNpcTypeName == "士兵" or sNpcTypeName == "精兵" or sNpcTypeName == "弩兵" or sNpcTypeName == "勇士" or sNpcTypeName == "弓兵" then
		nNpcType = TYPE_SOLDIER;
	elseif sNpcTypeName == "箭塔" then
		nNpcType = TYPE_ARROWBUILDING;
	elseif sNpcTypeName == "都尉" then
		nNpcType = TYPE_LOOEY;
		SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 0 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"宋军都尉和校尉被击败，宋军先锋出现了。");
					else
						Msg2MSAll(MISSION_ID,"辽军都尉和校尉被击败，辽军先锋出现了。");
					end;
				end;
				Try_To_Create_FightNPC("先锋",nEnemyCamp);	--对方校尉都统被屠戮殆尽，对方先锋出
			end;
		end;
	elseif sNpcTypeName == "都统" then
		nNpcType = TYPE_CAPTAIN;
		SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
			if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
				if nEnemyNpcType == 0 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"宋军都统和校尉被击败，宋军先锋出现了。");
					else
						Msg2MSAll(MISSION_ID,"辽军都统和校尉被击败，辽军先锋出现了。");
					end;
				end;
				Try_To_Create_FightNPC("先锋",nEnemyCamp);	--对方校尉都统被屠戮殆尽，对方先锋出
			end;
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 1 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"宋军都统和先锋被击败，宋军将军出现了。");
					else
						Msg2MSAll(MISSION_ID,"辽军都统和先锋被击败，辽军将军出现了。");
					end;	
				end;
				Try_To_Create_FightNPC("将军",nEnemyCamp);	--对方都统先锋被屠戮殆尽，对方大将出
			end;
		end;
	elseif sNpcTypeName == "将军" then
		nNpcType = TYPE_PIONEER;
		SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
			if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
				if nEnemyNpcType == 2 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"宋军大将和先锋被击败，宋军元帅出现了。");
					else
						Msg2MSAll(MISSION_ID,"辽军大将和先锋被击败，辽军元帅出现了。");
					end;
				end;
				Try_To_Create_FightNPC("元帅",nEnemyCamp);	--对方大将和先锋都被灭，则对方元帅出
			end;
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 1 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"宋军都统和先锋被击败，宋军将军出现了。");
					else
						Msg2MSAll(MISSION_ID,"辽军都统和先锋被击败，辽军将军出现了。");
					end;
				end;
				Try_To_Create_FightNPC("将军",nEnemyCamp);	--对方都统先锋被屠戮殆尽，对方先大将出
			end;
		end;
	elseif sNpcTypeName == "将军" then
		nNpcType = TYPE_GENERAL;
		SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 2 then
					if nEnemyCamp == SONG_ID then
						Msg2MSAll(MISSION_ID,"宋军将军和先锋被击败，宋军元帅出现了。");
					else
						Msg2MSAll(MISSION_ID,"辽军将军和先锋被击败，辽军元帅出现了。");
					end;
				end;
				Try_To_Create_FightNPC("元帅",nEnemyCamp);	--对方大将先锋被屠戮殆尽，对方元帅出
			end;
		end;
	elseif sNpcTypeName == "元帅" then
		nNpcType = TYPE_MARSHAL;
		if nEnemyCamp == SONG_ID then
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,GetName().."击败了宋军元帅，辽方最终获得胜利！");
			else
				Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).."击败了宋军元帅，辽方最终获得胜利！");
			end;
		else
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,GetName().."击败了辽军元帅，宋方最终获得胜利！");
			else
				Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).."击败了辽军元帅，宋方最终获得胜利！");
			end;		
		end;
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_WINNER,nPlayerCamp);
		ClearMapNpc(MAPID);	
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	end;
	SetNpcDeathScript(npcIndex,"");
	return nNpcType;
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."已结束，您的努力将会得到回报。",0);
	SetFightState(0);
end;
--根据NPC名字获取NPC的阵营
function get_npc_camp(szNpcName)
	local nNpcCamp = 0;
	if szNpcName == "宋方精兵" or szNpcName == "宋方弩兵" or szNpcName == "宋军箭塔" or szNpcName == "宋军炮台" 
		or szNpcName == "宋军都尉" or szNpcName == "宋军都统" or szNpcName == "宋军先锋" 
		or szNpcName == "宋军将军" or szNpcName == "宋军元帅" then
		nNpcCamp = SONG_ID;
	elseif  szNpcName == "辽方勇士" or szNpcName == "辽方弓兵" or szNpcName == "辽军箭塔" or szNpcName == "辽军都尉" 
		or szNpcName == "辽军都统" or szNpcName == "辽军先锋" or szNpcName == "辽军将军" 
		or szNpcName == "辽军元帅" or szNpcName == "辽军炮台" then
		nNpcCamp = LIAO_ID;
	else
		nNpcCamp = ALL_ID;
	end;
	return nNpcCamp;
end;
--根据NPC的名字获取NPC的类型
function get_npc_type(szNpcName)
	local sNpcTypeName = "";
	if szNpcName == "宋方精兵" or szNpcName == "宋方弩兵" or szNpcName == "辽方勇士" or szNpcName == "辽方弓兵" then
		sNpcTypeName = "士兵";
	elseif szNpcName == "宋军都尉" or szNpcName == "辽军都尉" then
		sNpcTypeName = "都尉";
	elseif szNpcName == "宋军都统" or szNpcName == "辽军都统" then
		sNpcTypeName = "都统";
	elseif szNpcName == "宋军先锋" or szNpcName == "辽军先锋" then
		sNpcTypeName = "先锋";
	elseif szNpcName == "宋军将军" or szNpcName == "辽军将军" then
		sNpcTypeName = "将军";
	elseif szNpcName == "宋军元帅" or szNpcName == "辽军元帅" then
		sNpcTypeName = "元帅";
	elseif szNpcName == "宋军炮台" or szNpcName == "辽军炮台" or szNpcName == "中间炮台" then
		sNpcTypeName = "炮台";
	elseif szNpcName == "宋军箭塔" or szNpcName == "辽军箭塔" then
		sNpcTypeName = "箭塔";
	end;
	return sNpcTypeName;
end;
