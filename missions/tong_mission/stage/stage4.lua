--create date:2007-07-09 23:16
--author:yanjun
--describe:帮会关卡stage文件，主要是关卡的相关操作

--MV_VALUE9表示要去掉的第一种职业
--MV_VALUE10表示要去掉的第二种职业
Include("\\script\\missions\\tong_mission\\stage\\base_stage.lua");
CSTAGE4 = OO_Inherit(CBASE_STAGE);	--继承基类
--=========下面是子类内容的定义和重载=========================================================
CSTAGE4.nStage = 4;	
CSTAGE4.tbTimerEven = {};
CSTAGE4.nMaxNpcCount = 12;
CSTAGE4.tbBossInfo = {"关卡boss1","地玄"};
--创建BOSS
function CSTAGE4:OnCreateBoss()
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
	TM_StartTimeGuage("影子护卫（左）",20,0,1,tbPlayer);
	TM_StartTimeGuage("陷阱左",60,0,2,tbPlayer);
	TM_StartTimeGuage("影子护卫（右）",80,0,3,tbPlayer);
	TM_StartTimeGuage("陷阱右",120,0,4,tbPlayer);
end;
--在某个区域创建NPC，tbArg[1]小于0表示在左边区域创建，大于0表示在右边
function CSTAGE4:CreateOpposedNpc(tbArg)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nRegion = tbArg[1];
	local nMapX,nMapY = 0,0;
	local tbNpc = {1,2,3,4,5,6,7};
	local nRand,nRandNpcIdx,nNpcCount = 0,0,0;
	local nCurStage = self.nStage;
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
	for i=1,2 do
		if nRegion == LEFT_REGION then
			nMapX,nMapY = tPos_Rect[i][1],tPos_Rect[i][2];
		else
			nMapX,nMapY = tPos_Rect[i+2][1],tPos_Rect[i+2][2];
		end;
		nRand = random(1,getn(tbNpc));
		nRandNpcIdx = tbNpc[nRand];
		nNpcCount = tb_Npc_Info[nRandNpcIdx][3][nCurStage];
		TM_CreateFactionNpc(nMapX,nMapY,nNpcCount,nRandNpcIdx);
		tremove(tbNpc,nRand);
	end;
	if self:CheckNpcCount() == 1 then
		self:EndStage(0);	--闯关失败
		return 0;
	end;
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"哈哈，让你见识我门徒的厉害！",
				"来吧，我们决一死战！",
				"左右护法，给我上！",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(1,tbPlayer);
		TM_StartTimeGuage("影子护卫（左）",120,0,1,tbPlayer);
	else
		TM_StopTimeGuage(3,tbPlayer);
		TM_StartTimeGuage("影子护卫（右）",120,0,3,tbPlayer);
	end;
end;
--混乱某个区域，死亡中间区域，tbArg[1]小于0表示在左边区域创建，大于0表示在右边
--tbArg[2]表示混乱持续时间
function CSTAGE4:ConfusionRegion(tbArg)
	local funConfuse = function(tbArg)
		local nPos = %self:GetPlayerSection();
		local nRegion = tbArg[1];
		local nDuration = tbArg[2];
		if (nPos == nRegion and nPos ~= MID_REGION)then
			CastState("state_confusion",1,nDuration*18);	--混乱n秒
		elseif nPos == MID_REGION then
			ModifyLife(0);	--如果在中间就立刻死亡
		end;
		gf_ShowDebugInfor("执行错误！！！  nPos:"..nPos..",nRegion:"..nRegion);
	end;
	local tbNormalPlayer = TM_GetPlayerTable();
	gf_ShowDebugInfor("TM_GetPlayerTable 函数返回大小表："..getn(tbNormalPlayer));
	gf_OperatePlayers(tbNormalPlayer,funConfuse,tbArg);
	local nBossIdx = GetMissionV(MV_BOSS1);
	local tbChat = {
				"让你们知道什么是功夫，看招：天下无双！！！！",
				"想混水摸鱼？再来！！！！",
				"给你们点厉害瞧瞧！！！！",
				}
	NpcChat(nBossIdx,tbChat[random(1,getn(tbChat))]);
	TM_DoSpecialEffect(1569,3175,953,"死亡焰火",10);	--MapX,MapY,EffectID,EffectName
	TM_DoSpecialEffect(1582,3163,953,"死亡焰火",10);
	TM_DoSpecialEffect(1555,3191,953,"死亡焰火",10);
	if tbArg[1] == LEFT_REGION then
		TM_DoSpecialEffect(1548,3156,936,"混乱烟花",10);
		TM_DoSpecialEffect(1559,3140,936,"混乱烟花",10);
		TM_DoSpecialEffect(1534,3168,936,"混乱烟花",10);
	else
		TM_DoSpecialEffect(1591,3202,936,"混乱烟花",10);
		TM_DoSpecialEffect(1601,3191,936,"混乱烟花",10);
		TM_DoSpecialEffect(1579,3214,936,"混乱烟花",10);
	end;
	local nRegion = tbArg[1];
	local tbPlayer = TM_GetPlayerTable();
	if nRegion == LEFT_REGION then
		TM_StopTimeGuage(2,tbPlayer);
		TM_StartTimeGuage("陷阱左",120,0,2,tbPlayer);
	else
		TM_StopTimeGuage(4,tbPlayer);
		TM_StartTimeGuage("陷阱右",120,0,4,tbPlayer);
	end;
end;
--BOSS的死亡脚本执行函数
function CSTAGE4:OnBossDeath(szNpcIdx)
	local nNpcIdx = tonumber(szNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	self:EndStage();
	self:CheckAllStagePass();
end;
--初始化tbTimerEven
CSTAGE4.tbTimerEven = 
{	--tbTimerEven的各个元素的内容就是ProcessTimeCheckPoint函数的四个参数
	--	触发时间 触发间隔 	触发的函数 			触发函数的参数table
	[1] = {20,		120,	CSTAGE4.CreateOpposedNpc,	{LEFT_REGION}},	--左边区域刷NPC
	[2] = {80,		120,	CSTAGE4.CreateOpposedNpc,	{RIGHT_REGION}},	--右边区域刷NPC
	[3] = {60,		120,	CSTAGE4.ConfusionRegion,	{LEFT_REGION,20}},	--左边混乱20秒
	[4] = {120,		120,	CSTAGE4.ConfusionRegion,	{RIGHT_REGION,20}},	--右边混乱20秒
	[5] = {30*60,	0,		CSTAGE4.AllDeath,			{}},
}
