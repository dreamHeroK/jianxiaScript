Include("\\script\\newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\resourcebattle\\position.lua");
		
MAX_RESOURCE_COUNT = 110;
		
BATTLE_TYPE = RESOURCE_ID;	--战场类型

ENTRANCE_POINT = 	--进入点
{
	[SONG_ID] = {MAPID_SONG,1572,3555},
	[LIAO_ID] = {MAPID_LIAO,1766,3182},
};

DIGGING_ACTION_ID = 890;	--挖粮草动作ID

DEATH_SCRIPT = "\\script\\newbattles\\resourcebattle\\playerdeath.lua";

CATERAN_GROUP_SONG = 23;	--山贼NPC任务组
CATERAN_GROUP_LIAO = 24;

CATERAN_COUNT = getn(tCateranSong);

TOE_MAX_USE_TIMES = 45;	--锄头最大使用次数

--得到随机资源
function Get_Random_Resource(nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	local nCamp = BT_GetCamp();
	local nRandomNum = random(1,100);
	if nRandomNum <= 60 then
		Get_Resource(1,nMultiple);	--初级粮草
	elseif nRandomNum <= 80 then
		Get_Resource(2,nMultiple);	--中级粮草
	elseif nRandomNum <= 90 then
		Msg2MSGroup(MISSION_ID,"这场战争肆意地影响了环境，玩家"..GetName().."被原住民追赶，等待将士们来营救。",nCamp);
		local npcIndex = CreateNpc("环保土民","环保土民",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\environmentalist_death.lua");
	else
		Msg2Player("您一直在努力挖掘，仍然找不到任何东西");
	end;
end;
--得到某种固定资源
function Get_Resource(nType,nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	AddItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nMultiple);
	Msg2Player("您获得了"..nMultiple.."个"..tBattleItem[nType][1]);
end;
--粮草增加
function Add_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)+nResNum);
end;
--粮草减少
function Dec_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)-nResNum);
	if GetMissionV(MV_RESOURCE_SONG+nCamp-1) < 0 then
		SetMissionV(MV_RESOURCE_SONG+nCamp-1,0);
	end;
end;
--得到粮草的数量
function Get_ResCount(nCamp)
	return GetMissionV(MV_RESOURCE_SONG+nCamp-1);
end;
--由粮草NPC坐标得到粮草NPC的位置索引
--function Get_ResIndex_ByPos2(nMapX,nMapY)	
--	local nX = ceil(floor(abs((abs(nMapX-1605)-1))/7)/2);	--这就是没有好好分析问题所导致的复杂公式
--	local nY = ceil(floor(abs((abs(nMapY-3240)-1))/13)/2);
--	return 11*nX+nY+1;
--end;
--由粮草NPC坐标得到粮草NPC的位置索引
function Get_ResIndex_ByPos(nMapX,nMapY)
	local nX = floor((nMapX-1598)/14);	--这个公式简单明了
	local nY = floor((nMapY-3227)/26);
	return 11*nX+nY+1;
end;
--由粮草NPC的位置索引得到粮草NPC的坐标
function Get_ResPos_ByIndex(nIndex)
	local nMapX,nMapY = 0,0;	
	nMapX = floor((nIndex-1)/10)*14+1605;
	nMapY = mod((nIndex-1),10)*26+3240;
	return nMapX,nMapY;
end;
--刷新粮草区域
function Reflash_Res()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return
	end;
	local nGroup,nBit = 0,0;
	for i=1,MAX_RESOURCE_COUNT do
		nGroup = floor(i/32);
		nBit = mod((i-1),32)+1;
		if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,0));
		end;
	end;
end;
--创建粮草NPC
function Create_Res_Npc(nCount)
	if nCount <= 0 then
		return
	end;
	if nCount == nil then
		nCount = 1;
	end;
	for i=1,nCount do
		local nRandPos = random(1,MAX_RESOURCE_COUNT);	
		local nMapX,nMapY = Get_ResPos_ByIndex(nRandPos);
		local npcIndex = CreateNpc("高级粮草垛","粮草垛",MAPID,nMapX,nMapY,-1,1,1,20);
		SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\resource_npc.lua");
	end;
end;
--创建军需官
function Create_QuarterMaster()
	local sCampName1,sCampName2 = "宋军军需官","辽军军需官";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "辽军军需官";
		sCampName2 = "宋军军需官";
	end;
	local npcIndex = CreateNpc("王安石",sCampName1,MAPID,1607,3494);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\quartermaster_npc.lua");
 	npcIndex = CreateNpc("王安石",sCampName2,MAPID,1720,3248);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\quartermaster_npc.lua");
end;
--触发一次山贼劫后营事件
function Create_Cateran_Even()
	local nSongStone = GetMissionV(MV_STONE_COUNT_SONG);
	local nLiaoStone = GetMissionV(MV_STONE_COUNT_LIAO);
	if nSongStone > nLiaoStone then
		Msg2MSAll(MISSION_ID,"经过激烈的战斗，移交战鼓：宋军"..nSongStone.." , 辽军"..nLiaoStone..", 草谷场战场出现了一群抢劫草药的山贼。");
		Create_Cateran(SONG_ID,CATERAN_COUNT);
	elseif nSongStone < nLiaoStone then
		Msg2MSAll(MISSION_ID,"经过激烈的战斗，移交战鼓：宋军"..nSongStone.." , 辽军"..nLiaoStone..", 草谷场战场出现了一群抢劫草药的山贼。");
		Create_Cateran(LIAO_ID,CATERAN_COUNT);
	else
		Msg2MSAll(MISSION_ID,"已经移交战鼓"..nSongStone.."个，山匪似乎并没有动静了。");
	end;
	SetMissionV(MV_STONE_COUNT_SONG,0);
	SetMissionV(MV_STONE_COUNT_LIAO,0);
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--初始化战鼓数量
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--初始化战鼓数量
end;
--创建后营山贼
function Create_Cateran(nCamp,nCount)
	local tPosTable = {tCateranSong,tCateranLiao};
	local nEnemyCamp = 3 - nCamp;
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = tPosTable[3-nCampPlace];
	if nCount > getn(tPos) then
		BT_ShowDebugInfor("Create_Cateran 错误，参数nCount非法");
		return 0;
	end;
	local nNpcIndex = 0;
	for i=1,nCount do
		nNpcIndex = CreateNpc("山贼喽罗","山贼 ("..tCampNameZ[nCamp]..")",MAPID,tPos[i][1],tPos[i][2]);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\resourcebattle\\cateran_death.lua");
		AddGroupUnit(CATERAN_GROUP_SONG+nCamp-1,nNpcIndex);
	end;
	SetMissionV(MV_SP_TIMER_LOOP,CATERAN_TIMER_LOOP);	--60秒特殊事件
	SetMissionV(MV_SP_TIMER_STATE,TM_STATE_CATERAN_SONG+nCamp-1);
	StartMissionTimer(MISSION_ID,CATERAN_TIMER_ID,CATERAN_TIME);
	Msg2MSGroup(MISSION_ID,"紧急战报：许多山贼出现在我们的后营中，如果您不及时阻止他们，我军粮草将在15秒后遭受严重损失。",nEnemyCamp);
end;

function Use_Hoe()
	BT_SetData(PTNC_USE_HOE_TIMES,BT_GetData(PTNC_USE_HOE_TIMES)+1);
	if BT_GetData(PTNC_USE_HOE_TIMES) >= TOE_MAX_USE_TIMES then
		DelItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1);
		Msg2Player("你的粮草锄头已损坏！");
		return 1;	--已损坏
	end;
	Msg2Player("你的粮草锄头还可以使用"..(TOE_MAX_USE_TIMES-BT_GetData(PTNC_USE_HOE_TIMES)).."次");
	return 0;	--还可以用
end;