--filename:villagebattle_head.lua
--create date:2006-05-31
--describe:村落争夺战场头文件。包含所需一切头文件。村落战的其它脚本只需包含这个头文件就行了
Include("\\script\\newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\villagebattle\\position.lua");

MAX_TASK_STEP = 99;	--最大任务步数

SICK_NPC = 1;	--NPC情绪类型，仇恨
ANGRY_NPC = 2;	--愤怒
RAGING_NPC = 3;	--狂暴

BATTLE_TYPE = VILLAGE_ID;	--战场类型

SELECT_COUNT = 3;	--被选中去寻找目标NPC的玩家的数量。只能设置1或2或3或4
KNOWMAN_COUNT = 10;	--知情人数量。不能改动。如需改动，请先看懂脚本。

ENTRANCE_POINT = 	--进入点
{
	[SONG_ID] = {MAPID_SONG,1553,3618},
	[LIAO_ID] = {MAPID_LIAO,1783,3152},
};

DEATH_SCRIPT = "\\script\\newbattles\\villagebattle\\playerdeath.lua";

--以table形式返回nPlayerCount个随机玩家的索引
function Get_Random_Player(nCamp,nPlayerCount)
	local tPlayer = {};
	local tSelectedPlayer = {};
	local nMSPlayerCount = GetMSPlayerCount(MISSION_ID,nCamp);
	if nMSPlayerCount == 0 then
		WriteLog("[战场错误]: 功能 Get_Random_Player 从 MS 获得流派人数为0");
		return 0;
	end;
	tPlayer = BT_GetMSPlayerIndex(nCamp);
	if nPlayerCount > nMSPlayerCount then	--如果要求得到的玩家数量大于目前玩家数量
		--那么就返回当前所有的玩家
		for i=1,nMSPlayerCount do	
			tSelectedPlayer[i] = tPlayer[i];
		end;
		return tSelectedPlayer;
	end;
	if getn(tPlayer) ~= nMSPlayerCount then
		WriteLog("[战场错误]: 功能 Get_Random_Player trong tPlayer("..getn(tPlayer)..") 双方人数 nMSPlayerCount("..nMSPlayerCount..") 差异");
	end;
	for i=1,nPlayerCount do
		local nSel = random(1,getn(tPlayer));
		tSelectedPlayer[i] = tPlayer[nSel];
		tremove(tPlayer,nSel);
	end;
	if getn(tSelectedPlayer) ~= nPlayerCount then
		WriteLog("[战场错误]: 功能 Get_Random_Player 反馈 tSelectedPlayer("..getn(tSelectedPlayer)..") 双方人数 nPlayerCount("..nPlayerCount..") 差异");
	end;
	return tSelectedPlayer;
end;
--产生目标NPC和知情人
function Create_Task_NPC(nCamp,sName)
	local tPosition = {};
	local nNpcCount = KNOWMAN_COUNT+1;	--１１个知情人加一个目标NPC
	tPosition = Get_Position_Index(nCamp);	--tPosition最后一个元素是目标NPC的位置索引，即第nNpcCount个元素
	if getn(tPosition) ~= nNpcCount then
		WriteLog("[战场错误]: 功能 Create_Task_NPC trong Get_Position_Index 响应表差异"..nNpcCount..", 正确:"..getn(tPosition))
		for i=1,nNpcCount do	--容错处理，有可能在同一个位置创建多个NPC
			tPosition[i] = random(1,g_PosCount);	
		end;
	end;
	local npcIndex = CreateNpc("王安石",sName,MAPID,tNpcPos[tPosition[nNpcCount]][1],tNpcPos[tPosition[nNpcCount]][2],6,1,1,20);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);	--记录目标NPC的索引
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\targetnpc_npc.lua");
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,sName);	--记录目标NPC的名字
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	for i=0,9 do
		npcIndex = CreateNpc("环保土民",sName.."知情人",MAPID,tNpcPos[tPosition[i+1]][1],tNpcPos[tPosition[i+1]][2]);
		SetMissionV(nIndexBase+i,npcIndex);
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\villagebattle\\knowmandeath.lua");
	end;
end;
--清除任务NPC
function Clear_Task_NPC(nCamp)
	SetNpcLifeTime(GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp),0);	--删除目标NPC
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,0);
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	local npcIndex = 0;
	for i=0,9 do
		npcIndex = GetMissionV(nIndexBase+i);
		if npcIndex ~= 0 then
			SetNpcDeathScript(npcIndex,"");	--置空死亡脚本
			SetNpcLifeTime(npcIndex,0);	--删除知情人
			SetMissionV(nIndexBase+i,0);
		end;
	end;
end;	
--修改阵营的任务步数
function Modify_Task_Step(nCamp,nStep)
	local nCurStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	nCurStep = nCurStep + nStep;
	if nCurStep < 0 then
		nCurStep = 0;
	elseif nCurStep > MAX_TASK_STEP then
		nCurStep = MAX_TASK_STEP;
	end;
	SetMissionV(MV_SONG_TASKSTEP+nCamp-1,nCurStep);
	if nCurStep == MAX_TASK_STEP then
		return 1;	--表示完成寻找任务，这时应该生成首领
	end;
	return 0;
end;
--随机产生一个不与敌方目标NPC同名字的本方目标NPC名字
function Create_Target_Name()
	local sName = "敌方NPC";
	for i=1,20 do
		sName = Create_Name();
		if sName ~= GetMissionS(MSTR_SONG_TARGETNAME) and sName ~= GetMissionS(MSTR_LIAO_TARGETNAME) then
			return sName;
		end;
	end;
	WriteLog("[战场错误]: 循环20次还没有找出正确的名称");
	return sName;
end;
--选择三个（或三个以下）幸运儿
function Select_Task_Player(nCamp)
	local OldPlayerIndex = PlayerIndex;
	local tSelPlayer = Get_Random_Player(nCamp,SELECT_COUNT);
	if tSelPlayer == 0 then
		PlayerIndex = OldPlayerIndex;
		return 0;	--nCamp方人数为0
	end;
	local nSelPlayerCount = getn(tSelPlayer);
	if nSelPlayerCount > SELECT_COUNT then
		WriteLog("[战场错误]: Select_Task_Player 功能 Get_Random_Player(nCamp,SELECT_COUNT) 反馈错误, tSelPlayer 差异"..nSelPlayerCount);
	end;
	Clear_Task_Player(nCamp);
	for i=1,nSelPlayerCount do
		PlayerIndex = tSelPlayer[i];
		if PlayerIndex > 0 then
			local sName = GetName();
			BT_SetTempData(PTT_SELECTED,1);
			SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sName);	--记录他们的名字
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--清空记录玩家名字的MS变量
function Clear_Task_Player(nCamp)
	for i=1,SELECT_COUNT do
		SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,"");	--先清空
	end;
end;
--创建首领NPC
function Create_Header(nCamp)
	local nPosIndex = random(1,g_PosCount);
	local npcIndex = CreateNpc("王安石","土民首领",MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2]);
	SetMissionV(MV_HEADER_APPEAR,npcIndex);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\header_npc.lua");
end;
--得到NPC位置的索引数组，一共有11个，其中第11个是目标NPC的位置索引
function Get_Position_Index(nCamp)
	local tResult = {};
	local nPosIndex = 0;
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_POS_INDEX_SONG_BEGIN;
	else
		nIndexBase = MV_POS_INDEX_LIAO_BEGIN;
	end;
	for i=0,10 do
		nPosIndex = Get_Right_Pos();
		SetMissionV(nIndexBase+i,nPosIndex);
		tResult[i+1] = nPosIndex;
	end;
	return tResult;
end;
--获得一个可用的位置索引。如果循环了10次还找不到一个合适的位置索引，即将返回最后一次循环的位置索引
function Get_Right_Pos()
	local nPosIndex = random(1,g_PosCount);
	for j=1,10 do
		nPosIndex = random(1,g_PosCount);
		if Check_Position(nPosIndex) == 1 then
			return nPosIndex;
		end;
	end;
	WriteLog("[战场错误]: 循环10次还没找到合适的位置");
	return nPosIndex;
end;
--根据位置索引来检查这个位置是否可用，即有没有别的NPC占用了这个位置
function Check_Position(nPosIndex)
	for i=MV_POS_INDEX_SONG_BEGIN,MV_POS_INDEX_LIAO_END do
		if nPosIndex == GetMissionV(i) then
			return 0;
		end;
	end;
	return 1;
end;

tFirstName = {"赵","钱","孙","李","周","吴","郑","王","冯", "冯","陈","褚","卫","蒋","沈","韩","杨","朱","秦","尤","许","何","吕","施","张","孔","曹","严","华","金","魏","陶","姜","戚","谢","邹","喻","柏","水","窦","章","云","苏","潘","葛","奚","鲁","韦","昌","马","苗","凤","花","方","范","彭","郎","俞","任","袁","柳","酆","鲍","史","唐","费","廉","岑","薛","雷","贺","倪","汤","滕","殷","罗","毕","郝","邬","安","常","牧","隗","山","谷","车","侯","宓","蓬", "杜","阮","蓝","闵","席","季","麻","江","钟","丁","包", };

nFirstNameSize = getn(tFirstName);

tSecondName = {"云","安","魅璃","澈","沫","修","泷","月","枫朗","轩宇","岑","华","古","奕世","黎","粟","月","枫","溪","皖","洋","越","柯","柯","苍","苍神","瑞","尧奕","殷","沂","圣麟","孤鹤","沉孤","毓","清","希","漪","璇","燕","勒","洛","落","盛","葵","竹","璇玑","昊云","生","龙","九天","断月","尘","帝","魔","轩辕","草","冰","将","潮","守","苍","坦","傲", };

ntSecondNameSize = getn(tSecondName);

--根据tFirstName和tSecondName随机生成一个名字
function Create_Name()
	local sName = "";
	sName = tFirstName[random(1,nFirstNameSize)]..tSecondName[random(1,ntSecondNameSize)];
	return sName;
end;

--转到下一步寻人任务
function Go_To_Next_Step(nCamp)
	local sName = "";
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,0);	--设置NPC类型
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,0);		--设置NPC状态为和平状态
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,0);	
	
	BT_SetCampTempValue(nCamp,PTT_SELECTED,0);	--清空阵营所有玩家的“幸运”标记
	
	if nCamp == SONG_ID then
		SetMissionV(MV_SONG_KILL_SONG,0);
		SetMissionV(MV_LIAO_KILL_SONG,0);		
	else
		SetMissionV(MV_SONG_KILL_LIAO,0);
		SetMissionV(MV_LIAO_KILL_LIAO,0);
	end;
	Clear_Task_NPC(nCamp);
	if Select_Task_Player(nCamp) == 0 then	--之前本方人数为0
		Clear_Task_Player(nCamp);	
		SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--名字置空，以便后来进入的玩家可以重新开始。
		return "";
	end;
	sName = Create_Target_Name();
	Create_Task_NPC(nCamp,sName);
	local sContent = "";
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
	Msg2MSGroup(MISSION_ID,"前线战报: 听说"..sName.."可能知道首领的下落，赶紧召集"..sContent.."前去寻找，目前，我方得到了土民的信任"..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"将士们接到了宋方的任务是："..sContent)
	else
		Msg2MSAll(MISSION_ID,"将士们接到了辽方的任务是："..sContent)
	end;
	Tips_To_Selected_Player(nCamp);
	return sName;
end;
--向被选中的人发TIPS
function Tips_To_Selected_Player(nCamp)
	local nOldPlayerIndex = PlayerIndex;
	local tPlayer = BT_GetMSPlayerIndex(nCamp);
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if BT_GetTempData(PTT_SELECTED) == 1 then
			TaskTip("元帅有命令，您很快会发现"..GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1));
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--到达最后一步寻人任务
function Reach_Final_Step(nCamp)
	if GetMissionV(MV_HEADER_APPEAR) == 0 then
		Msg2MSAll(MISSION_ID,"寻人任务：首领出现了，将士很快就找到了！");
		Create_Header();
	end;
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"宋方已完成任务，可以与首领进行对话。");
	else
		Msg2MSAll(MISSION_ID,"辽方已完成任务，可以与首领进行对话。");
	end;
	Say("<color=green>"..GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp).."<color>：听说首领出现了，快去村落争夺战场寻找！",0);
	Clear_Task_NPC(nCamp);
end;
--是不是被选择的那几个人
function Is_The_Selected(nCamp)
	if BT_GetCamp() == nCamp and BT_GetTempData(PTT_SELECTED) == 1 then
		return 1;
	else
		return 0;
	end;
end;
