--create date:2007-07-13 16:15
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作


--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE1 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE1.nStage = 1;	
CSTAGE1.tbTimerEven = {};
CSTAGE1.nMaxNpcCount = 12;
CSTAGE1.tbBossInfo = {"关卡boss2","璃烟"};
--创建BOSS
function CSTAGE1:OnCreateBoss()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel = self.tbBossInfo[1];
	local szName = self.tbBossInfo[2];
	local nPosX = tPos_Boss[1][1];
	local nPosY = tPos_Boss[1][2];
	local nNpcIdx = CreateNpc(szModel,szName,nMapID,nPosX,nPosY);
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_boss.lua");
	SetMissionV(MV_BOSS1,nNpcIdx);
	Msg2MSAll(MISSION_ID,"本关目标：打败"..szName);
	local tbPlayer = TM_GetPlayerTable();
	TM_StartTimeGuage("影子护卫",60,0,1,tbPlayer);
	TM_StartTimeGuage("璃府女将",30,0,2,tbPlayer);
end;
--在四个刷怪点刷随机种类的怪
function CSTAGE1:CreateOpposedNpc(tbArg)	
	local nBossIdx = GetMissionV(MV_BOSS1);
	local nCurStage = self.nStage;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local tbNpc = {1,2,3,4,5,6,7};
	local nNpcIdx = 0;
	local nRand = 0;
	local nRandNpcIdx = 0;
	local szModel,szName = "","";
	local nNpcCount = 0;
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
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--闯关失败
		return 0;
	end;
	local tbChat = {
				"璃府女武将快快现身！！！",
				"来人啊，把他们都干掉！",
				"让你见识一下我徒弟的实力！！",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(1);
	TM_StartTimeGuage("影子护卫",90,0,1,tbPlayer);
end;
--BOSS生小孩
function CSTAGE1:CreateBossChild(tbArg)
	local nBossIdx = GetMissionV(MV_BOSS1);
	if GetNpcName(nBossIdx) ~= self.tbBossInfo[2] then
		self:EndStage(0);	--闯关失败
		WriteLog("[闯关出现错误]: CreateOpposedNpc 关卡1出现的BOSS不是璃烟，是"..tostring(GetNpcName(nBossIdx)));
		return 0;
	end;
	PlayerIndex = 1;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nBossIdx);
	PlayerIndex = nil;
	local nNpcIdx = 0;
	for i=1,tbArg[1] do
		nNpcIdx = CreateNpc("关卡2小怪","璃府女武将",nMapID,nMapX,nMapY,-1,1,1,100);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
		AddGroupUnit(NPC_GROUP_ID,nNpcIdx);
	end;
	local tbChat = {
				"璃府女武将快快现身！！！",
				"来人啊，把他们都干掉！",
				"让你见识一下我徒弟的实力！！",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	TM_StopTimeGuage(2);
	TM_StartTimeGuage("璃府女武将",60,0,2,tbPlayer);
end;
--BOSS的死亡脚本执行函数
function CSTAGE1:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;

function CSTAGE1:LostLifePerMin()
	local tbPlayer = TM_GetPlayerTable();
	local funLostLife = function(tArg)
		CastState("state_lost_life_per18",5,60*18);
	end;
	gf_OperatePlayers(tbPlayer,funLostLife,{});
end;
--初始化tbTimerEven
CSTAGE1.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 触发的函数 			触发函数的参数table
	[1] = {60,		90,	CSTAGE1.CreateOpposedNpc,	{}},
	[2] = {30,		60,	CSTAGE1.CreateBossChild,	{6}},	
	[3] = {30*60,	0,	CSTAGE1.AllDeath,			{}},
	[4] = {0,		60, CSTAGE1.LostLifePerMin,		{}},
}
