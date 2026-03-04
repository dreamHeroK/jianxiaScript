--create date:2007-07-15 12:51
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作

--MV_VALUE1记录刷了多少次BOSS身边的小怪
--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
LARGE = 1;
EQUAL = 0;
SHORT = -1;

CSTAGE3 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE3.nStage = 3;	
CSTAGE3.tbTimerEven = {};
CSTAGE3.nNpcCount = 4;
CSTAGE3.nMaxNpcCount = 20;
CSTAGE3.tbBossInfo = 
{
	[1] = {"关卡boss41","风扬"},
	[2] = {"关卡boss42","云垂"},
}
--创建BOSS
function CSTAGE3:OnCreateBoss()
	self:CreateBossByType(1);
	self:CreateBossByType(2);
	Msg2MSAll(MISSION_ID,"本关目标：打败风扬和云垂");
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("左右开工",2*60,0,1,tbPlayer);
	TM_StartTimeGuage("斗转星移",60,0,2,tbPlayer);
	TM_StartTimeGuage("四大贱人",2*60,0,3,tbPlayer);
end;
--根据类型创建BOSS
function CSTAGE3:CreateBossByType(nType)
	local nMapID = SubWorldIdx2ID(SubWorld);
	nNpcIdx = CreateNpc(self.tbBossInfo[nType][1],self.tbBossInfo[nType][2],nMapID,tPos_Boss[nType][1],tPos_Boss[nType][2]);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1+nType-1,nNpcIdx);
	SetMissionV(MV_BOSS_COUNT,GetMissionV(MV_BOSS_COUNT)+1);
	--NpcChat(nNpcIdx,self.tbBossInfo[nType][2].."华丽登场");
end;
--BOSS生小孩
function CSTAGE3:CreateBossChild(tbArg)
	local nTimes = GetMissionV(MV_VALUE1);
	SetMissionV(MV_VALUE1,nTimes+1);
	local nNpcIdx = 0;
	local nBossIdx = GetMissionV(MV_BOSS1);
	if nBossIdx == 0 then	--如果BOSS1死了
		nBossIdx = GetMissionV(MV_BOSS2);
	elseif mod(nTimes,2) == 0 and nBossIdx ~= 0 then	--偶数并且BOSS1没死
		nBossIdx = GetMissionV(MV_BOSS2);
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local tbNpcName = {"厚脸皮的","无耻的","卑劣的","下流的"};
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("关卡4小怪",tbNpcName[i],nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");	
		SetMissionV(MV_NPC_COUNT,GetMissionV(MV_NPC_COUNT)+1);
	end;
	local nNpcCount = GetMissionV(MV_NPC_COUNT);
	Msg2MSAll(MISSION_ID,"当前四大贱人数量："..nNpcCount.."/"..self.nMaxNpcCount);
	if nNpcCount >= self.nMaxNpcCount then
		self:EndStage(0);	--闯关失败
		return 0;
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(3);
	TM_StartTimeGuage("四大贱人",45,0,3,tbPlayer);
end;
--BOSS的死亡脚本执行函数
function CSTAGE3:OnBossDeath(nNpcIdx)
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	nNpcIdx = tonumber(nNpcIdx);
	if nNpcIdx == GetMissionV(MV_BOSS1) then
		SetMissionV(MV_BOSS1,0);
	else
		SetMissionV(MV_BOSS2,0);
	end;
	SetNpcLifeTime(nNpcIdx,0);
	SetMissionV(MV_BOSS_COUNT,nBossCount-1);
	if nBossCount == 1 then
		self:EndStage();
		self:CheckAllStagePass();
		SetMissionV(MV_CHECK_POINT,-1);	--设为-1就表示检查点无效了
	else
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		SetMissionV(MV_CHECK_POINT,nLoop+3);	--三个循环（15秒）后检查
	end;
end;
--检测两个BOSS的距离
function CSTAGE3:CheckBossDistance(tbArg)
	local nBoss1Idx = GetMissionV(MV_BOSS1);
	local nBoss2Idx = GetMissionV(MV_BOSS2);
	if nBoss1Idx == 0 or nBoss2Idx == 0 then	--如果至少有一个BOSS死了
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX1,nMapY1 = GetNpcWorldPos(nBoss1Idx);
	local nMapID,nMapX2,nMapY2 = GetNpcWorldPos(nBoss2Idx);
	PlayerIndex = nil;
	local nDis = gf_GetDistance(nMapX1,nMapY1,nMapX2,nMapY2);
	Msg2MSAll(MISSION_ID,"两个BOSS之间的距离："..nDis);
	local tbPlayer = TM_GetPlayerTable();
	if tbArg[1] == LARGE then
		TM_StopTimeGuage(2);
		TM_StartTimeGuage("斗转星移",2*60,0,2,tbPlayer);	
	else
		TM_StopTimeGuage(1);
		TM_StartTimeGuage("左右开工",2*60,0,1,tbPlayer);
	end;
	if nDis >= 10 and tbArg[1] == LARGE then
		local funLostLifePercent = function(tArg)
			local nMaxLife = GetMaxLife();
			local nLostLife = floor(nMaxLife*tArg[1]/100);
			CastState("state_lost_life_per18",nLostLife,tArg[2]*18);
		end;
		gf_OperatePlayers(tbPlayer,funLostLifePercent,{5,20});
		Msg2MSAll(MISSION_ID,"所有玩家每秒生命伤害5%，持续20秒。");
		return LARGE;
	elseif nDis <= 30 and tbArg[1] == SHORT then
		local funLostLifePercent = function(tArg)
			local nMaxLife = GetMaxLife();
			local nLostLife = floor(nMaxLife/2);
			CastState("imme_damage_life_directly",nLostLife,0);
		end;
		Msg2MSAll(MISSION_ID,"所有玩家都受伤了，失去一半的生命。");
		gf_OperatePlayers(tbPlayer,funLostLifePercent,{});
		return SHORT;
	else
		return EQUAL;
	end;
end;
--辅助时间触发器执行函数
function CSTAGE3:OnTimerTriggerEven()
	self:CreateBossChild({self.nNpcCount});	--重新招小怪
	self:RemoveTimerTrigger();	--停止辅助计时器
end;
--小怪死亡脚本执行函数
function CSTAGE3:OnNpcDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nNpcCount = GetMissionV(MV_NPC_COUNT);
	if self:GetTimerTriggerState() == 0 then	--如果当前没有开始辅助计时器
		self:SetTimerTrigger(20);	--开始一个辅助计时器
	elseif nNpcCount == 1 then	--如果是最后一只
		self:RemoveTimerTrigger();	--停止辅助计时器
	end;
	SetMissionV(MV_NPC_COUNT,nNpcCount-1);
	SetNpcLifeTime(nNpcIdx,0);
end;
--检查点执行函数。这里处理两个BOSS的生死情况
function CSTAGE3:OnProcessCheckPoint()
	local nBoss1Idx = GetMissionV(MV_BOSS1);
	local nBoss2Idx = GetMissionV(MV_BOSS2);
	local nBossCount = GetMissionV(MV_BOSS_COUNT);	
	if nBossCount == 1 then
		if nBoss1Idx == 0 then
			self:CreateBossByType(1);
		elseif nBoss2Idx == 0 then
			self:CreateBossByType(2);
		end;
	else
		gf_ShowDebugInfor("BOSS 出现的数量有 OnProcessCheckPoint 错误，nBossCount："..nBossCount);
	end;	
end;
--初始化tbTimerEven
CSTAGE3.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 触发的函数 			触发函数的参数table
	[1] = {60,		120,	CSTAGE3.CheckBossDistance,	{LARGE}},	--检查BOSS距离是否大于某个值
	[2] = {120,		120,	CSTAGE3.CheckBossDistance,	{SHORT}},	--检查BOSS距离是否小于某个值
	[3] = {120,		45,		CSTAGE3.CreateBossChild,	{CSTAGE3.nNpcCount}},
	[4] = {30*60,	0,		CSTAGE3.AllDeath,			{}},
}
