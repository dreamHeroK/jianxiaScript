Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua");
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")

thisFile = "\\script\\missions\\taixu_mission\\mission.lua";


--tbTaiXu.msPosition.exitPos = {426,1535,2959};--进来的时候初始化
g_tmission_name = "太虚幻境"

function this:mission_name()
	return g_tmission_name
end


function this:stage()
	return GetMissionV(MV_STAGE)
end

stageFight0 = {
	name = "准备开启",
	maxsecond = 10, --20秒
	actionsType = "second",
	guage = {
		msg = "准备开启",
		time = 10,
		cyc = 0,
		id = 2,
	},
};

stageFight1 = {
	name = "关卡",
	maxsecond = 30*60, --30分钟
	actionsType = "second",
	guage = {
		msg = "",
		time = 30*60,
		cyc = 0,
		id = 2,
	},
};
stageFight2 = {
	name = "竞技模式",
	maxsecond = 60, --1分钟
	actionsType = "second",
};

stageFight0 = inherit(cycPhase, stageFight0);
stageFight1 = inherit(cycPhase, stageFight1);
stageFight2 = inherit(cycPhase, stageFight2);

nEasyBossPassNum = 75 -- 每一关需要杀死的小杂兵个数~~

tNPCPos = 
{ 
	{ {1543,3297}, --精英怪刷新点
		{1529 ,3251},{1561 ,3251},{ 1529 ,3320},{1561 ,3320},--杂兵及宝箱怪刷新区域(该区域内随机刷)--边界
	},--冰天雪地
	{ {1625, 3300},
		{1607 ,3248},{1638 ,3248},{1607 ,3316},{1638 ,3316},
	},
	{ {1542, 3458},
		{1528 ,3409},{1557 ,3409},{1528 ,3478},{1557 ,3478},
	},
	{ {1625, 3470},
		{1610 ,3406},{1643 ,3406},{1610 ,3484},{1643 ,3484},
	},
	}

----------------------------------------------------------------------
function create_enter_exit_pos(nPlace,nMapId)
	if tEnterPos[nPlace] then
		tbTaiXu.msPosition.entryPos = {tEnterPos[nPlace],};
	end

	if tExitPos[nMapId] then
		tbTaiXu.msPosition.exitPos = tExitPos[nMapId]
	end
end


function get_route_count()
	local tRoute = {};
	local nCount = 0;
	local players = this.msCamp:reflash(0)
	local oldPlayerIdx = PlayerIndex;
	for i, p in players do
		PlayerIndex = p;
		local nRoute = GetPlayerRoute();
		if not tRoute[nRoute] then
			tRoute[nRoute] = nRoute;
			nCount = nCount + 1;
		end 
	end
	PlayerIndex = oldPlayerIdx;
	return min(nCount, 8);
end

function get_box_npc_num()
	local tNum = {1,2,3,4,5,6,7,8,};
	return tNum[get_route_count()];
end

function tbTaiXu:onLeave()
	self.msOption:restoreState();
	if NewWorld(100,1379,2858) == 1 then
		SetLogoutRV(0)	-- NewWorld成功后才置0, 因为玩家有可能下线来leave	
	end
	if GetMSPlayerCount(tbTaiXu.missionID) == 0 then
		CloseMission(tbTaiXu.missionID);
	end
end

function jump_stage_award(nCount)
	for i = 1, nCount do
		local nCurStage = 10 * i;
		-- hv_get_mission_award(HV_TAIXU);
		-- Observer:onEvent(OE_TX_Pass_Mission, {1, nCurStage});
	end
	this.msCamp:turnPlayer(0, OnAchivement, 10 * nCount);
end

function stageFight0.onInit()
    local tCurPhase = this.msPhases[1]:getCurPhase();
    
    local nJump = GetMissionV(tbTaiXu.mv6);
    local self = this.msPhases[1]
    if nJump == 1 then
        SetMissionV(self.step,   GetMissionV(self.step)   + 10 * 60 * g_nfrequency);
        SetMissionV(self.second, GetMissionV(self.second) + 10 * 60);
        SetMissionV(MV_STAGE, 40);
        this.msCamp:turnPlayer(1, StopTimeGuage, self.guage.id);
        this.msCamp:turnPlayer(1, StartTimeGuage, self.guage.msg, self.maxsecond - GetMissionV(self.second), self.guage.cyc, self.guage.id);
        this.msCamp:turnPlayer(1, jump_stage_award, 4);
        this.msCamp:turnPlayer(1, Msg2Player, "成功进入下一个阶段，时间减少了20分钟。");
    elseif nJump == 2 then
        SetMissionV(this.msPhases[1].step,   GetMissionV(this.msPhases[1].step)   + 10 * 60 * g_nfrequency);
        SetMissionV(this.msPhases[1].second, GetMissionV(this.msPhases[1].second) + 10 * 60);
        SetMissionV(MV_STAGE, 60);
        this.msCamp:turnPlayer(1, StopTimeGuage, self.guage.id);
        this.msCamp:turnPlayer(1, StartTimeGuage, self.guage.msg, self.maxsecond - GetMissionV(self.second), self.guage.cyc, self.guage.id);
        this.msCamp:turnPlayer(1, jump_stage_award, 6);
        this.msCamp:turnPlayer(1, Msg2Player, "成功进入下一个阶段，时间减少了20分钟。");
    end
    
    this.msCamp:turnPlayer(0,function ()
        Msg2Player("太虚幻境马上开始，请大家抓紧时间准备。");
    end)
end


function stageFight0.onTimeout()
	local tCurPhase = this.msPhases[1]:getCurPhase();
	tCurPhase:onFinish();
end

function stageFight1.create_some_npc()
	local nStage = GetMissionV(MV_STAGE);
	local nMap = GetMissionV(this.mv4);
	if nStage > getn(tNPCTemplate) or nStage <=  0 or not tNPCTemplate[nStage] then
		return 0;
	end
	if not tNPCPos[nMap] then
		return 0;
	end
	--
	this.msCamp:turnPlayer(0,Msg2Player,format("当前队伍已闯过%d/%d.",nStage,g_MaxLevel))
	local nBoxNpcNum = get_box_npc_num();--宝箱怪数量
	local tNpc = tNPCTemplate[nStage];-- ｛｛"template","name"｝，｛..｝｝ --精英怪和小杂兵
	local tPos = tNPCPos[nMap];
	local nMaxZBNum = tNpc[1][3]; --小杂兵数量
	local nMapId	= this.msPosition:getMapID();
	local xStart	= tPos[2][1];
	local xEnd		= tPos[3][1];
	local yStart	= tPos[2][2];
	local yEnd		= tPos[4][2];
	local x = 0;
	local y = 0;
	local nNpcIdx = 0;
	if tNpc[2] and tNpc[2][1] and tNpc[2][2] then --创建精英怪
 		local nJYIdx = CreateNpc(tNpc[2][1],tNpc[2][2],nMapId,tPos[1][1],tPos[1][2]);  
 		SetNpcScript(nJYIdx,thisFile);
	end
	if tNpc[1] and tNpc[1][1] and tNpc[1][1] then --创小杂兵       
		for i = 1,nMaxZBNum do 
			x = random(xStart,xEnd)
			y = random(yStart, yEnd)     	
			nNpcIdx = CreateNpc(tNpc[1][1],tNpc[1][2],nMapId,x,y) 
			SetNpcScript(nNpcIdx,thisFile);
		end 
	end
	if nBoxNpcNum then
		for i = 1,nBoxNpcNum do 
				x = random(xStart, xEnd)
				y = random(yStart, yEnd)
				nNpcIdx = CreateNpc(tBoxNpc[1],tBoxNpc[2],nMapId,x,y);
				SetNpcScript(nNpcIdx,thisFile);
		end
	end
end

--function stageFight1.onInit()
function stageFight1.Init()
	local nStage =	GetMissionV(MV_STAGE);
	local nMap = GetMissionV(this.mv4);
	if nStage > g_MaxLevel or nStage < 0 then
		return 0;
	end
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:name, %nStage+1, this:mission_stage()) end)
	-- logserver end
	nStage = nStage + 1;
	local nSec = GetMissionV(MV_TIMER_SECOND);
	this.msCamp:turnPlayer(0, StopTimeGuage, stageFight1.guage.id);
--	stageFight1.guage.msg = format("关%d", nStage)
--	this.msCamp:turnPlayer(0, StartTimeGuage, stageFight1.guage.msg, stageFight1.maxsecond - nSec - 1, stageFight1.guage.cyc, stageFight1.guage.id);

	SetMissionV(MV_STAGE,nStage);
	SetMissionV(this.mv2,0);
	SetMissionV(this.mv3,0);
	SetMissionV(this.mv5,0);
	create_traps(nMap);
end

--区域边界
tBorders =
{
--	{{1524,3321}, {1518,3250},{1568,3321}, {1567,3241},},--冰天雪地
--	{{1606,3328}, {1605,3242},{1648,3329}, {1645,3231},},--江南春色
--	{{1566,3401}, {1525,2285},{1562,3489}, {1521,3490},},--熔岩地狱
--	{{1648,3395}, {1604,3394},{1644,3497}, {1602,3496},},--瀚海黄沙
	{{1515,3235}, {1515,3330},{1570,3235}, {1570,3330},},--冰天雪地
	{{1600,3230}, {1600,3330},{1650,3230}, {1650,3330},},--江南春色
	{{1515,3395}, {1515,3495},{1570,3395}, {1570,3495},},--熔岩地狱
	{{1600,3390}, {1600,3500},{1650,3390}, {1650,3500},},--瀚海黄沙
}

function create_traps(n)
		local m = this.msPosition:getMapID();
		local tBorderPoints = tBorders[n];
		local tPath = {
			"\\script\\missions\\taixu_mission\\trap\\trap1.lua",
			"\\script\\missions\\taixu_mission\\trap\\trap2.lua",
			"\\script\\missions\\taixu_mission\\trap\\trap3.lua",
			"\\script\\missions\\taixu_mission\\trap\\trap4.lua",}
		local tTraps = {
		{m, tBorderPoints[1] ,tBorderPoints[2],tPath[n]},
		{m, tBorderPoints[1] ,tBorderPoints[3],tPath[n]},
		{m, tBorderPoints[3] ,tBorderPoints[4],tPath[n]},
		{m, tBorderPoints[4] ,tBorderPoints[2],tPath[n]},
	};
	gf_CreateTraps(tTraps);
end

function onTrap(id)
	if tNPCPos[id] and tNPCPos[id][1] then
		local tPoints = tNPCPos[id][1];
		SetPos(tPoints[1],tPoints[2]);
	end
end

function taixu_confirmClose() 
	SetMissionV(MV_MISSION_STATUS,1);
	CloseMission(this.missionID);
end


--返回1：表示在这一关（nStage）的精英怪。
--2：在这一关的杂兵
--0：在这一关中没有这个NPC
function get_boss_type(nStage,sNpcName)
	if	getn(tBossType) < nStage or not tBossType[nStage] or not tBossType[nStage][sNpcName] then
		return 0;
	end
	return tBossType[nStage][sNpcName];
end

function onNpcDeath(npcIdx, f,x)
	if GetMissionV(this.msPhases[1].curPhaseLv) >= getn(this.msPhases[1].phases) then return 0; end
	local nEasyBoss = GetMissionV(this.mv2);
	local nHardBoss = GetMissionV(this.mv3);
	local nStage = GetMissionV(MV_STAGE);
	local nIsGetAward = GetMissionV(this.mv5);
	local nBossType = get_boss_type(nStage,GetNpcName(npcIdx))
	local bShowMsg = 0;
	if 1 == nBossType then --精英怪
		nHardBoss = nHardBoss + 1;
		bShowMsg = 1;
		SetMissionV(this.mv3,nHardBoss);
	elseif 2 == nBossType then --小杂兵
		nEasyBoss = nEasyBoss + 1;
		if mod(nEasyBoss, 5) == 0 then
			bShowMsg = 1;
		end
		SetMissionV(this.mv2,nEasyBoss);
	end
	if bShowMsg == 1 then
		this:Msg2MSAll(format("当前队伍已击杀怪物(杂鱼:%d/%d,精英:%d/1)", 
			nEasyBoss, nEasyBossPassNum, nHardBoss));
	end
	RemoveNpc(npcIdx)
	--print("nEasyBoss , nHardBoss = " , nEasyBoss , nHardBoss)
	if nEasyBoss >= nEasyBossPassNum and nHardBoss >= 1 and nIsGetAward == 0 then
		taixu_passStage(nStage);
	end 
end


function stageFight1:onTimeout()
	local nJump = GetMissionV(tbTaiXu.mv6);
	if nJump > 0 then
		this:Msg2MSAll("副本结束!");
	else
		this:Msg2MSAll("副本结束!");
	end
	local m = this.msPosition:getMapID();
	ClearMapNpc(m);	
	taixu_reviveAll();
	taixu_confirmClose();
end


--阵营为nCamp的角色回满血、回满蓝
function taixu_reviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end

function taixu_setPos(nPosX,nPosY,nMv)
	SetPos(nPosX,nPosY);
	SetFightState(1); --战斗状态 死亡去了吴仁道那里会清战斗状态
end

function TM_GetMinLevel()
	local nMinLevel = 78
	local nOldIndex = PlayerIndex
	local nTSize = GetTeamSize()
	if nTSize == 0 then
		return GetLevel()
	end
	for i=1, nTSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < nMinLevel then
			nMinLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return nMinLevel
end
tNEW_AWARD_EX = {	--等级  经验，修为
	[70] = {700000, 80},
	[80] = {800000, 100},
	[90] = {1200000, 120},
};
-- 整除：只能除以10的整倍数
-- num : 除数
-- steps : 被除数
-- 返回 商
function MU_Div(num, steps)
	if tonumber(num) == nil then						-- 整除 steps
		return 0
	else
		num = tonumber(num)
	end
	if (steps == nil) then
		steps = 10
	end
	return (num - mod(num, steps)) / steps
end
function taixu_award(n)--给奖励
	local nLevel = MU_Div(TM_GetMinLevel()) * 10
--	local nExp = tNEW_AWARD_EX[nLevel][1];
	local nPopur = tNEW_AWARD_EX[nLevel][2];
	local nPopurLimit = GetPopurLimit()
	local nCurPopur = GetPopur()
	local nR = random(10000)
	local tAward = {
		{1, 1500, "太虚八卦盘-乾", {2,1,469, 1}},
		{1, 1500, "太虚八卦盘-坤", {2,1,470, 1}},	
		{1, 1500, "太虚八卦盘-坎", {2,1,471, 1}},	
		{1, 1500, "太虚八卦盘-兑", {2,1,472, 1}},
		{1, 500, "太虚八卦盘-离", {2,1,473, 1}},	
		{1, 200, "太虚八卦盘-震", {2,1,474, 1}},	
		{1, 300, "太虚八卦盘-艮", {2,1,475, 1}},	
		{1, 100, "太虚八卦盘-巽", {2,1,476, 1}},
	}
	if nR < 7000 then
		gf_Modify("Exp", 1000000);
	elseif nR >= 7000 and nR <= 10000 then
		gf_Modify("Exp", 1000000);	
	end
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "太虚幻境", "随机奖励八卦盘");
end

function OnAchivement(nStageId)
	local nMax = max(GetTask(TASKID_TXHJ_SPE_ACH_TASK_1), nStageId);
	SetTask(TASKID_TXHJ_SPE_ACH_TASK_1, nStageId);
	-- OnAchEvent(2, TASKID_TXHJ_SPE_ACH_TASK_1);
end

function taixu_passStage(nStage)
	--print("comeing taixu_passStage")
	local nCurStage = GetMissionV(MV_STAGE);--第几关
	if nStage ~= nCurStage or nCurStage <= 0 or g_MaxLevel < nCurStage then
		WriteLog(format("[太虚幻境] [胜负记录] [nStage:%d nCurStage:%d]", tonumber(nStage), tonumber(nCurStage)));
		return 0;
	end
	
	-----------------add by wangjing-----------------
	this.msCamp:turnPlayer(0, OnAchivement, nCurStage);
	-------------------------------------------------
	--taixu_reviveAll();--玩家满血 满篮
	local nAreaType = GetMissionV(this.mv4);
	--this.msCamp:turnPlayer(0,taixu_setPos,tEnterPos[nAreaType][1],tEnterPos[nAreaType][2]);
	local m = this.msPosition:getMapID();
	ClearMapNpc(m); 
	SetMissionV(this.mv5, 1);
	--print("over	ClearMapNpc(m); ")
	this.msCamp:turnPlayer(0,taixu_award,1); --给奖励 
	--print("give award over")      
	if mod(nCurStage, 10) == 0 and nCurStage >= 10 then
		local stateId = nCurStage / 10
	--	AddRuntimeStat(68, stateId, 0, 1) --统计每10层通过的玩家数
		if GetTeamSize() > 0 and GetTeamMember(0) == PlayerIndex then
	--		AddRuntimeStat(69, stateId, 0, 1) --统计每10层通过的队伍数
		end
	end
	
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	PlayerIndex = nOldPlayerIndex;
--	---------------------
--	Observer:onEvent(OE_HDTTD_PASS_STAGE,nStage);
	---------------------
	local tCurPhase = this.msPhases[1]:getCurPhase();
	if tCurPhase then 
		
		this.msCamp:turnPlayer(0,
			function (nStage)
				StopTimeGuage(stageFight1.guage.id)
		--		FireEvent("event_mission_stage_finish", "new_taixu", nStage)
			end , 
			nCurStage);

		if nCurStage == g_MaxLevel then
			this.msCamp:turnPlayer(0,Msg2Player,format("恭喜你！团队闯关成功！"))
			tCurPhase:onFinish();
		else        
			this.msPhases[1]:setPhase(2);
		end
	end
end

function check_exp_drug()


end


this = tbTaiXu;


stageFight0.actions = {
	[1] = stageFight0.Init,
	[20] = stageFight0.finish,
}


stageFight1.actions = {
	[1] = stageFight1.Init,
	[5] = stageFight1.create_some_npc,
};

stageFight1.cycActions = {
	[60] = {
		[0] = check_exp_drug,
		start = 1,
	},
};


stageFight2.actions = {
	[15] = taixu_confirmClose, --通关成功，送出关卡
};

tbTaiXu.msOption.bSetPkFlag = 0; --练功模式
tbTaiXu.msOption.bSetPkCamp = 0;
tbTaiXu.msOption.szInitDeahScript = thisFile;


TaixuPhaseDriver = {
	timerID = 125, --计时器 唯一ID，查看配置表 CH
	maxsecond = 30*60,
	guage = {
		msg = "太虚幻境",
		time = 30*60,
		cyc = 0,
		id = 1,
	},
	phases= {
		stageFight0,
		stageFight1,
		stageFight2,
	},
};
TaixuPhaseDriver = gf_CopyInherit(phaseBase,TaixuPhaseDriver)

function TaixuPhaseDriver:setPhase(n)
	if type(n) ~= "number" then return end
	if not n or not self.phases[n] then return end
	SetMissionV(self.curPhaseLv,n);	
	local tCurPhase = self:getCurPhase();
	if tCurPhase  then
		tCurPhase:onInit(self);
	end
end

function TaixuPhaseDriver:onTimeout()
	local nJump = GetMissionV(tbTaiXu.mv6);
	if nJump > 0 then
		this:Msg2MSAll("副本结束!");
	else
		this:Msg2MSAll("副本结束!");
	end
	taixu_confirmClose();
end


tbTaiXu.msPhases = {
	TaixuPhaseDriver,
}


