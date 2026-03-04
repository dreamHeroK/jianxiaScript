--create date:2007-07-16 9:18
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作

--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
Include("\\script\\missions\\tong_mission\\position.lua");
CSTAGE5 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE5.nStage = 5;	
CSTAGE5.tbTimerEven = {};
CSTAGE5.nDistance = 20;
CSTAGE5.tbBossInfo = {"关卡boss5","截衡兽"};
CSTAGE5.tbTrap = gf_MergeTable(tPos_Boss,tPos_Rect);	--机关的点：两个BOSS点和四个NPC点
CSTAGE5.nCurIdx = 1;

--创建BOSS
function CSTAGE5:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"本关目标：打败"..szName);
	self:CreateRandomTrap(1);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("关门放狗",60,0,1,tbPlayer);
end;
--随机区域刷自爆NPC
function CSTAGE5:CreateOpposedNpc(tbArg)
	local nNpcIdx = 0;
	local nCount = tbArg[1];
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nNpcIdx = CreateNpc("关卡5小怪","邪恶的狗",nMapID,1569,3175,-1,1,1,200);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("关门放狗",30,0,1);
end;
--BOSS的死亡脚本执行函数
function CSTAGE5:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--小怪死亡脚本执行函数
function CSTAGE5:OnNpcDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local szNpcName = GetNpcName(nNpcIdx);
	if szNpcName == "机关" then
		local nMapID,nMapX1,nMapY1 = GetNpcWorldPos(nNpcIdx);
		local nBossIdx = GetMissionV(MV_BOSS1);
		local nMapID,nMapX2,nMapY2 = GetNpcWorldPos(nBossIdx);
		local nDis = gf_GetDistance(nMapX1,nMapY1,nMapX2,nMapY2);
		if nDis <= self.nDistance then
			TM_ModifyNpcLife(nBossIdx,-5);
			Msg2MSAll(MISSION_ID,GetNpcName(nBossIdx).."生命降低 5%");
		end;
		self:CreateRandomTrap(1);
	end;
	SetNpcLifeTime(nNpcIdx,0);
end;
--随机点创建机关
function CSTAGE5:CreateRandomTrap(nCount)
	local nRandom = 0;
	local tNpcModel = {"关卡5机关1", "关卡5机关2"}
	local nNpcIdx = 0;
	local nRandPosIdx = 0;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nRandPosIdx = gf_GetNextRandomIndex(self.nCurIdx,getn(self.tbTrap));
		self.nCurIdx = nRandPosIdx;
		nRandom = random(1,2)
		nNpcIdx = CreateNpc(tNpcModel[nRandom],"机关",nMapID,self.tbTrap[nRandPosIdx][1],self.tbTrap[nRandPosIdx][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
end;
--初始化tbTimerEven
CSTAGE5.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 触发的函数 			触发函数的参数table
	[1] = {60,		30,		CSTAGE5.CreateOpposedNpc,	{5}},
	[2] = {30*60,	0,		CSTAGE5.AllDeath,			{}},
}
