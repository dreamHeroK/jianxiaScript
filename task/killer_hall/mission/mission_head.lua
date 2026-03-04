--date:2007-3-6
--author:yanjun
--describe:header script of the killer hall mission!it's a dynamic mission template!
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
MISSION_ID = 34;									--Mission的ID
TIMER_ID = 62;										--计时器的ID
LOG_ID = 205;										--登陆触发器ID
LOG_CUSTOM_ID = 3016;								--登陆触发器自定义编号
--=========================================================================================
MAX_PLAYER = 200;									--最大容纳人数
BOSS1_NEEDED_TEAM_COUNT = 1;						--多刷一个香主需要的队伍数
BOSS2_NEEDED_TEAM_COUNT = 1;						--多刷一个副堂主需要的队伍数
BOSS3_NEEDED_TEAM_COUNT = 1;						--多刷一个李大嘴需要的队伍数
TEAM_MEMBER_COUNT = 8;								--一支队伍里面最多有多少人
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填非0正整数==================================================
READY_TIME = 10;									--准备时间，10分钟
STARTED_TIME = PLAY_TIME;							--进行时间时间，60分钟。
ENDING_TIME = 3;									--等待结束时间，3分钟
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 2;							--计时器触发的时间间隔，单位分钟
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================

--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
MV_PLAYER_ENTER_TIME = 4;							--记录入场人次
--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开战阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--=========================================================================================
tMissionTS =	--MissionTimeState，定义Mission活跃时间
{
	[MS_STATE_READY]   = {{2100,2110}},	--准备时间区间
	[MS_STATE_STARTED] = {{2111,2210}},	--开始时间区间
	[MS_STATE_ENDING]  = {{2211,2211}},	--等待结束时间区间
}
--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	local nCurState,nLeftMin,nTimeInterval = 0,0,0;
	if SETTING_DYNAMIC_MISSION == 1 then	--如果支持动态Mission
		nCurState,nLeftMin = mf_GetMissionCurState();
		if nCurState == MS_STATE_READY or nCurState == MS_STATE_IDEL then
			nTimeInterval = READY_TIMER_INTERVAL;
		elseif nCurState == MS_STATE_STARTED then
			nTimeInterval = STARTED_TIMER_INTERVAL;
		elseif nCurState == MS_STATE_ENDING then
			nTimeInterval = ENDING_TIMER_INTERVAL;
		end;
	else	--静态Mission的初始化
		nCurState = MS_STATE_READY;
		nLeftMin = READY_TIME - READY_TIMER_INTERVAL;	--这里要先减去READY_TIMER_INTERVAL，不然会多一次循环
		nTimeInterval = READY_TIMER_INTERVAL;
	end;
	local nLoop = floor(nLeftMin/nTimeInterval);
	SetMissionV(MV_MISSION_STATE,nCurState);
	SetMissionV(MV_TIMER_LOOP,nLoop);
	StartMissionTimer(MISSION_ID,TIMER_ID,nTimeInterval*FRAME_PER_MIN);
	if nCurState == MS_STATE_STARTED then --如果是进行中
		if mod(nLoop,floor(5/STARTED_TIMER_INTERVAL)) == 0 then
			MS_CreateBoss(NPC_TYPE_XIANGZHU);
			MS_CreateBoss(NPC_TYPE_FUTANGZHU);
		end;
		if mod(nLoop,floor(15/STARTED_TIMER_INTERVAL)) == 0 then
			MS_CreateBoss(NPC_TYPE_LIDAZUI);
		end;
	end;
	KH_Clear_Map_Value();	--清地图变量
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	local nNpcIdx1 = CreateNpc("甑子丹","杀手堂使者",885,1562,3188);
	SetNpcScript(nNpcIdx1,"\\script\\task\\killer_hall\\quest_npc.lua");
	WriteLog("[杀手堂]: 战斗 Mission 开始, MSUID 是："..nMSUID);
end;
--Mission开始
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
	StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	MS_InitBoss();
end;
--Mission结束
function MS_EndMission()
	ClearMapNpc(MAP_ID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);	--在mf_ClearMissionData也会清，这里只是作一个强调
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,0);	--从Mission里面删除所有的玩家
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	if nBox1Count > MAX_BOX1_COUNT then
		WriteLog("[杀手堂错误]: nBox1Count 超出范围，值为："..nBox1Count);
	end;
	if nBox2Count > MAX_BOX2_COUNT then
		WriteLog("[杀手堂错误]: nBox2Count 超出范围，值为："..nBox2Count);
	end;
	if nBox3Count > MAX_BOX3_COUNT then
		WriteLog("[杀手堂错误]: nBox3`Count 超出范围，值为："..nBox3Count);
	end;
	local nPlayerEnterTime = GetMissionV(MV_PLAYER_ENTER_TIME);
	WriteLog("[杀手堂]: 战斗 Mission 开启, MSUID 是："..nMSUID.."。参加活动的人数："..nPlayerEnterTime.."。打开的箱子数："..nBox1Count..", "..nBox2Count..", "..nBox3Count);
	mf_ClearMissionData();
	KH_Clear_Map_Value();
end;
--离开Mission
function MS_LeaveMission()
	MS_RestorePlayerState();
	local nPosIdx = random(1,getn(tExitPos));
	NewWorld(tExitPos[nPosIdx][1],tExitPos[nPosIdx][2],tExitPos[nPosIdx][3]);
end;
--加入Mission
function MS_JoinMission(nCamp)
	DelItem(2,1,1087,1)--删除面具
	gf_Msg2Team(GetName().."进入杀手堂");
	MS_SetPlayerState();
	AddMSPlayer(MISSION_ID,nCamp)
	SetMissionV(MV_PLAYER_ENTER_TIME,GetMissionV(MV_PLAYER_ENTER_TIME)+1);	--记录入场人次
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"系统公告：杀手堂刺客已经出现");
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"杀手堂刺客出现时间："..(nLoop*READY_TIMER_INTERVAL).."分钟");
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		Msg2MSAll(MISSION_ID,"伪装面具已经被他们发现了，必须马上采取行动！");
		ClearMapNpc(MAP_ID);
		local lfFunc = function(tArg)
			Say("你是谁？你怎么敢闯这里？",
					1,
					"他们已经发现了这个伪装面具/MS_Nothing");
		end;
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},0,MAP_ID);
		local nNpcIdx = CreateNpc("江湖俊杰","神秘的男子",MAP_ID,1570,3190);
		SetNpcScript(nNpcIdx,"\\script\\task\\killer_hall\\entrance_npc.lua");
	else
		local nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount = MS_GetBossCount();
		if mod(nLoop,floor(5/STARTED_TIMER_INTERVAL)) == 0 then	--每5分钟刷一次杀手堂香主和杀手堂副堂主
			MS_CreateBoss(NPC_TYPE_XIANGZHU,nXiangZhuCount);
			MS_CreateBoss(NPC_TYPE_FUTANGZHU,nFuTangZhuCount);
		end;
		if mod(nLoop,floor(15/STARTED_TIMER_INTERVAL)) == 0 then	--每15分钟刷一次人屠斧李大嘴
			MS_CreateBoss(NPC_TYPE_LIDAZUI,nLiDaZuiCount);
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"完成杀手堂任务剩余时间"..(nLoop*STARTED_TIMER_INTERVAL).."分钟");
		Msg2MSAll(MISSION_ID,"战斗人数："..nPlayerCount..", 刺客人数："..nXiangZhuCount.."位香主 "..nFuTangZhuCount.."位副堂主 "..nLiDaZuiCount.."位人屠斧");
	end;
end;
--计算当前应该产生的BOSS的数量
function MS_GetBossCount()
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,0);
	local nXiangZhuCount = ceil(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS1_NEEDED_TEAM_COUNT));
	local nFuTangZhuCount = ceil(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS2_NEEDED_TEAM_COUNT));
	local nLiDaZuiCount = floor(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS3_NEEDED_TEAM_COUNT));
	if nXiangZhuCount >= BOSS1_POS_COUNT then
		nXiangZhuCount = BOSS1_POS_COUNT;
	end;
	if nFuTangZhuCount >= BOSS2_POS_COUNT then
		nFuTangZhuCount = BOSS2_POS_COUNT;
	end;
	if nLiDaZuiCount >= BOSS3_POS_COUNT then
		nLiDaZuiCount = BOSS3_POS_COUNT;
	end;
	return nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,""..(nLoop*ENDING_TIMER_INTERVAL).."分钟后离开杀手堂");
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState();
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	nMSUID = tonumber(date("%y%m%d%H"));
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()
	Say("因为戴着面具，所以没人会认出你。 在这里不要相信任何人。",0);
	SetTask(KH_TASK_MSUID,GetMissionV(MV_MISSION_UID));
	SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetDeathPunish(0);
	SetPKFlag(2,1);
	ForbidChangePK(1);
	UseScrollEnable(0);
	ForbitTrade(1);
	StallEnable(0);
	SetFightState(1);
	UseMask(1,0);
	SetCreateTeam(1);	--禁止组队
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetTempRevPos(305,1584*32,2830*32);
	OpenFriendliness(0);	--不增加好感度
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		gf_ForbidFactionSkill(1)	
	end
end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()
	SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	SetLogoutRV(0)
	SetDeathPunish(1);
	ForbidChangePK(0);
	UseScrollEnable(1);
	ForbitTrade(0);
	StallEnable(1);
	SetPKFlag(0,0);
	SetFightState(0);
	UseMask(0,0);
	SetCreateTeam(0);
	--LeaveTeam();	--这个要放在SetCreateTeam(0)之后才有作用
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	SetTempRevPos(0,0,0);
	OpenFriendliness(1);	--恢复增加好感度
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		gf_ForbidFactionSkill(0)	
	end
end;
--创建Boss
function MS_CreateBoss(nType,nNum)
	local tBossPos = tNpcRegion[nType];
	local nNpcIdx = 0;
	local sBossModel,sBossName,nLifeTime = tNpcInfo[nType][1],tNpcInfo[nType][2],tNpcInfo[nType][3];
	local nBasePosIdx = random(1,getn(tBossPos));	--随机一个初始位置索引
	for i=1,nNum do
		local nBossPosIdx = mod(nBasePosIdx+i-2,getn(tBossPos))+1;	--获得一个刷新BOSS的房间的索引
		local nPosIdx = random(1,getn(tBossPos[nBossPosIdx]));	--获得BOSS房间里面的随机一个刷新点
		nNpcIdx = CreateNpc(sBossModel,sBossName,tBossPos[nBossPosIdx][nPosIdx][1],tBossPos[nBossPosIdx][nPosIdx][2],tBossPos[nBossPosIdx][nPosIdx][3]);
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\killer_hall\\npc_death.lua");
		SetNpcLifeTime(nNpcIdx,nLifeTime);
	end;
end;
--初始化BOSS的位置，在正常执行RunMission的时候调用
function MS_InitBoss()
	local nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount = MS_GetBossCount();
	MS_CreateBoss(NPC_TYPE_XIANGZHU,nXiangZhuCount);
	MS_CreateBoss(NPC_TYPE_FUTANGZHU,nFuTangZhuCount);
	MS_CreateBoss(NPC_TYPE_LIDAZUI,nLiDaZuiCount);
	Msg2MSAll(MISSION_ID,"战斗人数："..nPlayerCount..", 刺客人数："..nXiangZhuCount.."位香主 "..nFuTangZhuCount.."位副堂主 "..nLiDaZuiCount.."位人屠斧");
end;

function MS_Nothing()

end;