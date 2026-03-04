--create date:2007-07-16 15:55
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作

--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE6 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE6.nStage = 6;	
CSTAGE6.tbTimerEven = {};
CSTAGE6.nMaxNpcCount = 24;
CSTAGE6.tbBossInfo = 
{
	[1] = {"关卡boss61","火羽"},
	[2] = {"关卡boss62","流光"},
}
--创建BOSS
function CSTAGE6:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = 0;
	for i=1,getn(self.tbBossInfo) do
		nNpcIdx = CreateNpc(self.tbBossInfo[i][1],self.tbBossInfo[i][2],nMapID,tPos_Boss[i][1],tPos_Boss[i][2]);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
		SetMissionV(MV_BOSS1+i-1,nNpcIdx);
		SetMissionV(MV_BOSS_COUNT,GetMissionV(MV_BOSS_COUNT)+1);
		--NpcChat(nNpcIdx,self.tbBossInfo[i][2].."华丽登场");
	end;
	Msg2MSAll(MISSION_ID,"本关目标：打败火羽和流光两大神兽");
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("移花接木",2*60,0,1,tbPlayer);
	TM_StartTimeGuage("影子护卫",90,0,2,tbPlayer);
end;
--刷小怪
function CSTAGE6:CreateOpposedNpc(tbArg)
	local nNpcCount = 0;
	local nCurStage = self.nStage;
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nMapX,nMapY = 0,0;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE9) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,getn(tbNpc) do
		if GetMissionV(MV_VALUE10) == tbNpc[i] then
			tremove(tbNpc,i);
		end;
	end;
	for i=1,4 do	--四个点刷
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--闯关失败
		return 0;
	end;
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(2);
	TM_StartTimeGuage("影子护卫",90,0,2,tbPlayer);
end;
--修改BOSS血量
function CSTAGE6:ModifyBossLife(tbArg)
	local nBossIdx1 = GetMissionV(MV_BOSS1);
	local nBossIdx2 = GetMissionV(MV_BOSS2);
	if tbArg[1] == 1 then
		if nBossIdx1 ~= 0 then
			if GetNpcName(nBossIdx1) == self.tbBossInfo[1][2] then
				TM_ModifyNpcLife(nBossIdx1,1);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."生命值提升 1%");
			else
				WriteLog("[紫光阁错误]: BOSS1 遇见6次错误， 名字是："..GetNpcName(nBossIdx1));
			end;
		end;
		if nBossIdx2 ~= 0 then
			if GetNpcName(nBossIdx2) == self.tbBossInfo[2][2] then
				TM_ModifyNpcLife(nBossIdx2,-1);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."生命值降低 1%");	
			else
				WriteLog("[紫光阁错误]: BOSS2 遇见6次错误， 名字是："..GetNpcName(nBossIdx1));
			end;
		end;
	else
		if nBossIdx1 ~= 0 then
			if GetNpcName(nBossIdx1) == self.tbBossInfo[1][2] then
				TM_ModifyNpcLife(nBossIdx1,-6);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."生命值降低 6%");
			else
				WriteLog("[紫光阁错误]: BOSS1 遇见6次错误， 名字是："..GetNpcName(nBossIdx1));
			end;
		end;
		if nBossIdx2 ~= 0 then
			if GetNpcName(nBossIdx2) == self.tbBossInfo[2][2] then
				TM_ModifyNpcLife(nBossIdx2,6);
				Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."生命值提升 6%");	
			else
				WriteLog("[紫光阁错误]: BOSS2 遇见6次错误， 名字是："..GetNpcName(nBossIdx1));
			end;
		end;
		local tbPlayer = TM_GetPlayerTable();
		TM_StopTimeGuage(1);
		TM_StartTimeGuage("移花接木",2*60,0,1,tbPlayer);
	end;
end;
--检查BOSS血量
function CSTAGE6:CheckBoss(tbArg)
	local nLifePercent1,nLifePercent2 = 0,0;
	local nBossIdx1,nBossIdx2 = GetMissionV(MV_BOSS1),GetMissionV(MV_BOSS2);
	gf_ShowDebugInfor("nBossIdx1:"..nBossIdx1);
	gf_ShowDebugInfor("nBossIdx2:"..nBossIdx2);
	_,nLifePercent1 = TM_GetNpcLife(nBossIdx1);
	_,nLifePercent2 = TM_GetNpcLife(nBossIdx2);
	local nPercent = abs(nLifePercent1-nLifePercent2);	--百分比之差
	local tbPlayer = TM_GetPlayerTable();
	local tbPercent = {1,1,2,2,3,5,10,30,30,30};
	local funLostLifePercent = function(tArg)
		local nMaxLife = GetMaxLife();
		local nLostLife = floor(nMaxLife*tArg[1]/100);
		CastState("state_lost_life_per18",nLostLife,tArg[2]*18);
	end;
	Msg2MSAll(MISSION_ID,"两个BOSS血量差异(百分比)："..nPercent);
	if nPercent == 0 then
		return 0;
	end;
	if nPercent > 10 then
		nPercent = 10;
	end;
	gf_OperatePlayers(tbPlayer,funLostLifePercent,{tbPercent[nPercent],5});
end;
--BOSS的死亡脚本执行函数
function CSTAGE6:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	if nNpcIdx == GetMissionV(MV_BOSS1) then
		SetMissionV(MV_BOSS1,0);
		Msg2MSAll(MISSION_ID,self.tbBossInfo[1][2].."被打败了");
	else
		SetMissionV(MV_BOSS2,0);
		Msg2MSAll(MISSION_ID,self.tbBossInfo[2][2].."被打败了");
	end;
	SetNpcLifeTime(nNpcIdx,0);
	SetMissionV(MV_BOSS_COUNT,nBossCount-1);
	if nBossCount == 1 then	--如果是最后一个BOSS
		self:EndStage();
		self:CheckAllStagePass();
	end;
end;
--初始化tbTimerEven
CSTAGE6.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 触发的函数 				触发函数的参数table
	[1] = {115,		20,		CSTAGE6.ModifyBossLife,		{1}},
	[2] = {120,		120,	CSTAGE6.ModifyBossLife,		{2}},
	[3] = {0,		10,		CSTAGE6.CheckBoss,			{}},	--检查两BOSS血量
	[4] = {90,		90,		CSTAGE6.CreateOpposedNpc,	{}},
	[5] = {30*60,	0,		CSTAGE6.AllDeath,			{}},
}
