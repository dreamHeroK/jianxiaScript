--filename:mainbattle_head.lua
--create date:2006-06-23
--describe:主战场头文件。包含所需一切头文件。其它脚本只需包含这个头文件就行了
Include("\\script\\newbattles\\mainbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\mainbattle\\position.lua");

BATTLE_TYPE = MAINBATTLE_ID;	--战场类型

ENTRANCE_POINT = 	--进入点
{
	[SONG_ID] = {MAPID_SONG,1550,3753},
	[LIAO_ID] = {MAPID_LIAO,1939,3743},
};

SOLDIER_COUNT = getn(tSoldierSong);
ARROWBUILDING_COUNT = getn(tArrowBuildingSong);
LOOEY_COUNT = getn(tLooeySong);
CAPTAIN_COUNT = getn(tCaptainSong);
PIONEER_COUNT = getn(tPioneerSong);
GENERAL_COUNT = getn(tGeneralSong);
MARSHAL_COUNT = getn(tMarshalSong);
HEADER_COUNT = getn(tVillagerHeaderPos);
REFUGEE_COUNT =	getn(tVillagerPos); 
EMPLACEMENT_COUNT = getn(tEmplacementPos);
HERO_COUNT = getn(tNonalignedHeroPos);

REFUGEE_COUNT = getn(tSongRefugee);

TYPE_SOLDIER = 1;		--士兵
TYPE_ARROWBUILDING = 2;	--箭塔
TYPE_LOOEY = 3;			--都尉
TYPE_CAPTAIN = 4;		--都统
TYPE_PIONEER = 5;		--先锋
TYPE_GENERAL = 6;		--将军
TYPE_MARSHAL = 7;		--元帅
TYPE_HEADER = 8;		--土民首领
TYPE_REFUGEE = 9;		--土民
TYPE_EMPLACEMENT = 10;	--炮台
TYPE_HERO = 11;			--奇人异士

--注意,NPC的名字不可随意更改,如须更改,请先看懂npc_death.lua脚本
--填写格式：{宋方位置table,辽方位置table,{{宋方NPC名字,宋方模块名},...},{{辽方NPC名字,辽方模块名}},...}
tNpcInfo = {									--NPC名字　　模板名
	[TYPE_SOLDIER] = {tSoldierSong,tSoldierLiao,{{"宋方精兵","宋精兵"},{"宋方弩兵","宋强弩兵"}},{{"辽方勇士","辽勇士"},{"辽方弓兵","辽硬弓兵"}}},
	[TYPE_ARROWBUILDING] = {tArrowBuildingSong,tArrowBuildingLiao,{{"宋军箭塔","宋军箭塔"}},{{"辽军箭塔","辽军箭塔"}}},
	[TYPE_LOOEY] = {tLooeySong,tLooeyLiao,{{"宋军都尉","宋军都尉"}},{{"辽军都尉","辽军都尉"}}},
	[TYPE_CAPTAIN] = {tCaptainSong,tCaptainLiao,{{"宋军都统","宋军都统"}},{{"辽军都统","辽军都统"}}},
	[TYPE_PIONEER] = {tPioneerSong,tPioneerLiao,{{"宋军先锋","宋军先锋"}},{{"辽军先锋","辽军先锋"}}},
	[TYPE_GENERAL] = {tGeneralSong,tGeneralLiao,{{"宋军将军","宋军将军"}},{{"辽军将军 ","辽军将军"}}},
	[TYPE_MARSHAL] = {tMarshalSong,tMarshalLiao,{{"宋军元帅","宋军元帅"}},{{"辽军元帅","辽军元帅"}}},
	[TYPE_HEADER] = {tVillagerHeaderPos,tVillagerHeaderPos,{{"土民首领","土民首领"}},{{"土民首领","土民首领"}}},
	[TYPE_REFUGEE] = {tVillagerPos,tVillagerPos,{{"土民","土民"},{"土民","环保土民"}},{{"土民","土民"},{"土民","环保土民"}}},
	[TYPE_EMPLACEMENT] = {tEmplacementPos,tEmplacementPos,{{"炮台","中军火炮"}},{{"炮台","中军火炮"}}},
	[TYPE_HERO] = {tNonalignedHeroPos,tNonalignedHeroPos,{{"奇人异士","中立武将"}},{{"奇人异士","中立武将"}}}
	}

FIGHT_TIMER_ID = 1108;
FIGHT_TRIGGER_ID = 3120;

KILL_VILLAGER_POINT_LIMITED = 800;	--杀死土民所获积分上限
KILL_SOLDIER_POINT_LIMITED = 1000;	--杀死士兵所获积分上限

OPERATE_TIME = 30;	--单挑最长操作时间
--杀死玩家后得到皇帝嘉赏的概率（以军衔排序）
tKillPlayerEAP = {1,1,2,3,10,30};
--杀死NPC后得到皇帝嘉赏的概率
tKillNpcEAP = {
			[TYPE_SOLDIER] = 100,	--soldier
			[TYPE_ARROWBUILDING] = 100,	--arrowbuilding
			[TYPE_LOOEY] = 100,	--looey
			[TYPE_CAPTAIN] = 200,	--captain
			[TYPE_PIONEER] = 1000,	--pioneer
			[TYPE_GENERAL] = 2000,	--general
			[TYPE_MARSHAL] = 3000,	--marshal
			[TYPE_HEADER] = 200,	--header
			[TYPE_REFUGEE] = 0,	--refugee
			[TYPE_EMPLACEMENT] = 100,	--emplacement
			[TYPE_HERO] = 200,
			}
--杀死玩家后得到的个人积分（以军衔排序）
tKillPlayerPoint = 
{
	[1] = tBPEven[BP_MAIN_KILL_SOLDIER]*100,	--杀死士兵
	[2] = tBPEven[BP_MAIN_KILL_LOOEY]*100,		--杀死校尉
	[3] = tBPEven[BP_MAIN_KILL_CAPTAIN]*100,	--杀死都统
	[4] = tBPEven[BP_MAIN_KILL_PIONEER]*100,	--杀死先锋
	[5] = tBPEven[BP_MAIN_KILL_GENERAL]*100,	--杀死大将
	[6] = tBPEven[BP_MAIN_KILL_MARSHAL]*100,	--杀死元帅
};
--杀死NPC后得到的个人积分
tKillNpcPoint = {
			[TYPE_SOLDIER] = tBPEven[BP_MAIN_KILL_NPC_SOLDIER]*100,	--soldier
			[TYPE_ARROWBUILDING] = 1,	--杀死箭塔，特殊处理
			[TYPE_LOOEY] = tBPEven[BP_MAIN_KILL_NPC_LOOEY]*100,	--looey
			[TYPE_CAPTAIN] = tBPEven[BP_MAIN_KILL_NPC_CAPTAIN]*100,	--captain
			[TYPE_PIONEER] = tBPEven[BP_MAIN_KILL_NPC_PIONEER]*100,	--pioneer
			[TYPE_GENERAL] = tBPEven[BP_MAIN_KILL_NPC_GENERAL]*100,	--general
			[TYPE_MARSHAL] = tBPEven[BP_MAIN_KILL_NPC_MARSHAL]*100,	--marshal
			[TYPE_HEADER] = tBPEven[BP_MAIN_KILL_HEADER]*100,	--土民首领
			[TYPE_REFUGEE] = tBPEven[BP_MAIN_KILL_NATIVE]*100,	--土民
			[TYPE_EMPLACEMENT] = tBPEven[BP_MAIN_KILL_EMPLACEMENT]*100,	--炮台
			[TYPE_HERO] = tBPEven[BP_MAIN_KILL_HERO]*100,
			}
			
EMPLACEMENT0RANGE = 80;	--三个炮台的攻击范围
EMPLACEMENT1RANGE = 60;
EMPLACEMENT2RANGE = 60;

tRouteHurt = --炮台伤害{受伤概率,伤害点数}
{
	[0] = {0,0},		--白名
	[1] = {100,1000},	--少林
	[2] = {100,1000},	--俗家
	[3] = {100,600},	--禅僧
	[4] = {100,600},	--武僧
	[5] = {100,1000},	--唐门
	[6] = {30,1000},	--唐门
	[7] = {100,1000},	--峨嵋
	[8] = {100,600},	--峨嵋佛家
	[9] = {100,600},	--峨嵋俗家
	[10] = {100,1000},	--丐帮
	[11] = {100,1000},	--丐帮净衣
	[12] = {30,1000},	--丐帮污衣
	[13] = {100,1000},	--武当
	[14] = {50,800},	--武当道家
	[15] = {30,1000},	--武当俗家
	[16] = {100,1000},	--杨门
	[17] = {100,1000},	--杨门枪骑
	[18] = {100,1000},	--杨门弓骑
	[19] = {100,1000},	--五毒
	[20] = {30,1000},	--五毒邪侠
	[21] = {50,800},	--五毒蛊师
	[22] = {50,800},	--"昆仑",
	[23] = {50,800},	--"昆仑天师",
	[24] = {50,800},	--"明教",
	[25] = {50,800},	--"明教圣战",
	[26] = {50,800},	--"明教阵兵",
	[27] = {50,800},	--"明教血人",
	[28] = {50,800},	--"翠烟",
	[29] = {50,800},	--"翠烟舞仙",
	[30] = {50,800},	--"翠烟灵女",
	[31] = {50,800},	--"唐门任侠",
	[32] = {50,800},	--"昆仑剑尊",
}

ARROWBUILDING_GROUP_SONG = 21;	--NPC任务组
ARROWBUILDING_GROUP_LIAO = 22;

DEATH_SCRIPT = "\\script\\newbattles\\mainbattle\\playerdeath.lua";
--==============================================================================
--==============================================================================
--===========================以下是主战场相关函数===============================
--==============================================================================
--==============================================================================
--==============================================================================
--创建战斗NPC
function Create_Fight_NPC(nNpcType,nNum,nCamp)
	if nNum <= 0 then
		return 0;
	end;
	local tNpcPos = {};
	local sName = "";
	local sModelName = "";
	local nNpcIndex = 0;
	local nPosIndex = 0;
	local nRandomNpcType = 0;
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	tNpcPos = tNpcInfo[nNpcType][nCampPlace];
	for i=1,nNum do
		nRandomNpcType = random(1,getn(tNpcInfo[nNpcType][nCamp+2]));
		sName = tNpcInfo[nNpcType][nCamp+2][nRandomNpcType][1];
		sModelName = tNpcInfo[nNpcType][nCamp+2][nRandomNpcType][2];
		nPosIndex = mod(i,getn(tNpcPos))+1;
		nNpcIndex = CreateNpc(sModelName,sName,MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2])
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");
		if nNpcType == TYPE_MARSHAL then
			SetMissionV(MV_MARSHAL_SONG+nCamp-1,nNpcIndex);
		end;
	end;
	if nNpcType == TYPE_SOLDIER then
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+nCamp-1,0);
	end;
end
--创建炮台。第一个参数表示炮台的位置，开始的时候位置１是宋的，２是辽的，０是公共的，第二个参数表示炮台所属阵营，０为公共，１为宋，２为辽
function Create_Emplacement(nPosition,nCamp)
	local nNpcIndex = 0;
	local sNpcName = "";
	if nCamp == ALL_ID then
		sNpcName = "中间炮台";
	elseif nCamp == SONG_ID then
		sNpcName = "宋军炮台";
	else
		sNpcName = "辽军炮台";
	end;
	nNpcIndex = CreateNpc("中军火炮",sNpcName,MAPID,tEmplacementPos[nPosition][1],tEmplacementPos[nPosition][2]);
	SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	if nPosition == 0 and nCamp == SONG_ID then	--若中间的炮台被对方占领，玩家可以直接从后营传送到前营出生点
		SetMissionV(MV_FRONT_TRAP_SONG,0);
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nPosition == 0 and nCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
		SetMissionV(MV_FRONT_TRAP_LIAO,0);
	end;
	SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");
	SetMissionV(MV_EMPLACEMENT0_POSSESSION+nPosition,nCamp);
end;
--创建土民首领，由于加入了重生机制，这里暂时只支持一个首领
function Create_VillagerHeader(nCamp)
	if GetMissionV(MV_HEADER_DEATH) == 1 then
		for i=1,getn(tVillagerHeaderPos) do 
			local nNpcIndex = CreateNpc("土民首领","土民首领",MAPID,tVillagerHeaderPos[i][1],tVillagerHeaderPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		end;
		SetMissionV(MV_HEADER_DEATH,0);
	end;
end;
--创建土民
function Create_Villager(nCamp)
	for i=1,getn(tVillagerPos) do 
		local nNpcIndex = CreateNpc("土民","土民",MAPID,tVillagerPos[i][1],tVillagerPos[i][2])
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
end;
--在N个随机位置创建N个土民
function Create_Random_Pos_Villager(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	for i=1,nCount do
		local nRanPos = random(1,getn(tVillagerPos));
		local nNpcIndex = CreateNpc("土民","土民",MAPID,tVillagerPos[nRanPos][1],tVillagerPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
	SetMissionV(MV_KILL_VILLAGER_COUNT,0);
end;
--创建奇人异士，由于加入了重生机制，这里暂时只支持一个奇人异士
function Create_Nonaligned_Hero()
	if GetMissionV(MV_HERO_DEATH) == 1 then
		for i=1,getn(tNonalignedHeroPos) do 
			local nNpcIndex = CreateNpc("中立武将","奇人异士",MAPID,tNonalignedHeroPos[i][1],tNonalignedHeroPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[ALL_ID]);
		end;
		SetMissionV(MV_HERO_DEATH,0);
	end;
end;
--创建随机宝箱，战场初始化时用。
function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("战场宝箱","宝箱",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\box_death.lua");
	end;
end;
--在N个随机位置创建N个宝箱
function Create_Random_Pos_Box(nNum)
	if nNum <= 0 then
		return 0;
	end;
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("战场宝箱","宝箱",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
--创建难民
function Create_Refugee(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nRefugeeIndex = 0;
	local tPos = {tSongRefugee,tLiaoRefugee};
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRefugeeModel = {"宋难民","辽难民"};
	local tRefugeeName = {"宋难民","辽难民"};
	for i=1,nCount do
		local nRandPos = random(1,getn(tPos[nCampPlace]));
		nRefugeeIndex = CreateNpc(tRefugeeModel[nCamp],tRefugeeName[nCamp],MAPID,tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2],-1,1,1,20);
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle\\refugee_talk_npc.lua");
	end;
end;
--创建难民接收人
function Create_Refugee_Receiver(nCamp)
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tbNpcName = {"宋难民接收人","辽难民接收人"};
	local nNpcIndex = CreateNpc("宋难民接收人",tbNpcName[nCamp],MAPID,tRefugeeReceiver[nCampPlace][1],tRefugeeReceiver[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\refugee_receive_npc.lua")
end;
--创建雇佣兵团团长
function Create_Assistant_Hirer(nCamp)
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tbNpcName = {"宋雇佣兵团团长","辽雇佣兵团团长"};
	local nNpcIndex = CreateNpc("天王帮主",tbNpcName[nCamp],MAPID,tAssistantHirer[nCampPlace][1],tAssistantHirer[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\assistant_hirer_npc.lua")
end;
--创建小路上的俩箭塔
function Create_ArrowBuilding()
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("宋军箭塔","箭塔",MAPID,tArrowBuildingSong[i][1],tArrowBuildingSong[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_SONG,nNpcIndex);
	end;
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("辽军箭塔","箭塔",MAPID,tArrowBuildingLiao[i][1],tArrowBuildingLiao[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_LIAO,nNpcIndex);
	end;
end;
--摧毁小路上的俩箭塔
function Destroy_ArrowBuilding(nCamp)
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	SetGroupLifeTime(ARROWBUILDING_GROUP_SONG+nCampPlace-1,0);
	ClearGroup(ARROWBUILDING_GROUP_SONG+nCampPlace-1);
end;

--尝试去创建先锋、大将和元帅。如果创建先锋成功则返回１，创建大将成功则返回２，创建元帅成功则返回３
function Try_To_Create_FightNPC(sName,nEnemyCamp)
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	local nPlayerCamp = 3 - nEnemyCamp;
	BT_ShowDebugInfor("sName:"..sName);

	if sName == "先锋" then
		if nEnemyNpcType == 0 then	--先锋出来啦
			Create_Fight_NPC(TYPE_PIONEER,PIONEER_COUNT,nEnemyCamp);
			if nEnemyCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"宋军先锋出现了");
			else
				Msg2MSAll(MISSION_ID,"辽军先锋出现了");
			end;
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,1);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--校尉重生
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--都统重生
			return 1;
		end;	
	elseif sName == "将军" then
		if nEnemyNpcType == 1 then	--大将出来啦
			Create_Fight_NPC(TYPE_GENERAL,GENERAL_COUNT,nEnemyCamp);
			local szStr = "";
			if nEnemyCamp == SONG_ID then
				szStr = "宋军将军出现了";
			else
				szStr = "辽军将军出现了";
			end;
			Msg2MSAll(MISSION_ID,szStr.."现在可没人保护他，赶快去攻击它！");
			local fTaskTip = function(tArg)
				TaskTip("我方将军好像需要帮助");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,2);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--校尉重生
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--先锋重生
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--都统重生
			Destroy_ArrowBuilding(nEnemyCamp);	--清除箭塔
			return 2;
		end;		
	elseif sName == "元帅" then
		if nEnemyNpcType == 2  then	--元帅出来啦
			Create_Fight_NPC(TYPE_MARSHAL,MARSHAL_COUNT,nEnemyCamp);
			if nPlayerCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"宋军元帅出现在战场上！");
			else
				Msg2MSAll(MISSION_ID,"辽军元帅出现在战场上！");
			end;
			local fTaskTip = function(tArg)
				TaskTip("我方元帅好像需要帮助");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,3);
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--先锋重生
			Create_Fight_NPC(TYPE_GENERAL,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,0);	--将军重生
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--都统重生
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--校尉重生
			return 3;
		end;
	end;
	return 0;
end;
--根据公共积分来判断是否创建某个NPC；这个函数是由玩家来触发的
function Judge_State_By_Point(nCamp)
	local nPlayerCamp = nCamp;
	local nEnemyCamp = 3 - nPlayerCamp;
	local nMissionPoint = BT_GetMissionPoint(nPlayerCamp);
	local nEnemyCount = GetMSPlayerCount(MISSION_ID,nEnemyCamp);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	BT_ShowDebugInfor("nEnemyNpcType:"..nEnemyNpcType)
	BT_ShowDebugInfor("nMissionPoint:"..nMissionPoint)
	BT_ShowDebugInfor("nEnemyCount:"..nEnemyCount)
	if nEnemyNpcType == 0 and nMissionPoint >= nEnemyCount*5 then
		BT_ShowDebugInfor("辽军先锋");
		if Try_To_Create_FightNPC("先锋",nEnemyCamp) ~= 0 then		--敌方公共积分超过一定数值：本方总人数*50，对方先锋出
			if nPlayerCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"当前宋方积分已达到"..(nEnemyCount*5).."，辽军先锋出现在前线。");
			else
				Msg2MSAll(MISSION_ID,"当前辽方积分已达到"..(nEnemyCount*5).."，宋军先锋出现在前线。");
			end;
		end;
	elseif nEnemyNpcType == 1 and nMissionPoint >= nEnemyCount*10 then
		BT_ShowDebugInfor("辽军将军");
		if Try_To_Create_FightNPC("将军",nEnemyCamp) ~= 0 then	--敌方公共积分超过一定数值：本方总人数*100，对方大将出
			if nPlayerCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"当前宋方积分已达到"..(nEnemyCount*10).."，辽军将军出现在前线。");
			else
				Msg2MSAll(MISSION_ID,"当前辽方积分已达到"..(nEnemyCount*10).."，宋军将军出现在前线。");
			end;		
		end;
	elseif nEnemyNpcType == 2 and nMissionPoint >= nEnemyCount*20 then
		BT_ShowDebugInfor("辽军元帅");
		if Try_To_Create_FightNPC("元帅",nEnemyCamp) ~= 0 then	--敌方公共积分超过一定数值：本方总人数*20，对方元帅出
			if nPlayerCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"当前宋方积分已达到"..(nEnemyCount*20).."，辽军元帅出现在前线。");
			else
				Msg2MSAll(MISSION_ID,"当前辽方积分已达到"..(nEnemyCount*20).."，宋军元帅出现在前线。");
			end;		
		end;
	else
		BT_ShowDebugInfor("没有创建");
	end;
end;
