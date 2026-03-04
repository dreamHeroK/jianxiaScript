Include("\\script\\lib\\globalvalue.lua")
Include("\\script\\missions\\yp\\zxc\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\tmp_task_id_def.lua")--

---------------------------------------------------------
stageFight = {
	name = "tbZXC",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",
}

function stageFight:createSomeNpc()
--	print("stageFight:createSomeNpc()")
	local m = this.msPosition:getMapID();
end

function stageFight.init()
	self = stageFight;
--	this:Msg2MSAll("初始化地图NPC...");
--	self:createSomeNpc();
end

function stageFight.moveBiaoche()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
--	print("nNpcID,nCurNpcID",nNpcID,nCurNpcID);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Msg2Player("您的镖车由于被毁或者超过托镖时限未成功送达目的地，运镖失败！");
		Talk(1,"","您的镖车由于被毁或者超过托镖时限未成功送达目的地，运镖失败！");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local sMapName = GetMapName(nNpcMapID);
	if nMapID ~= nNpcMapID then --不在同一张图
		if sMapName then
			Msg2Player(format("您的镖车目前停留在(%s[%d,%d])，请赶紧回去寻找您的镖车吧！",sMapName,floor(nNpcPosX/8),floor(nNpcPosY/16)));
		else
			Msg2Player("您距离您的镖车太远了，请赶紧回去寻找您的镖车吧！");
		end		
		return 0;
	end
	local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
	local nMarkLife = GetTask(TASK_FIELD_PVP_CAR_LIFE);
	if nCurLife < nMarkLife then
		Msg2Player("您的镖车正在被攻击，赶紧去保护您的镖车吧！");
		SetTask(TASK_FIELD_PVP_CAR_LIFE,nCurLife);
	end
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
--	print("nDistance",nDistance);
	if nDistance <= 30 then
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx,{{nPosX,nPosY}});
	else
		if sMapName then
			Msg2Player(format("您的镖车目前停留在(%s[%d,%d])，请赶紧回去寻找您的镖车吧！",sMapName,floor(nNpcPosX/8),floor(nNpcPosY/16)));
		else
			Msg2Player("您距离您的镖车太远了，请赶紧回去寻找您的镖车吧！");
		end
	end
end

function stageFight.checkBiaoche()
	self = stageFight;
	this.msCamp:turnPlayer(0,stageFight.moveBiaoche);
end

----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
--	[50] = stageFight.warn,
}
stageFight.cycActions = {
	[2] = { --2秒检测一下镖车
		[0] = {stageFight.checkBiaoche},
	},
--	[50] = {--50s
--		[0] = stageFight.createTreasure,
--	},
--	[180] = { --3分钟
--		[0] = {stageFight},
--	},
}
stageFight.triggers = {
	Talk = {
		{action = stageFight.onTalk},
	},
};

----------------------------------------------------------------------
firePhases.phases = {stageFight};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "时间结束！");
	CloseMission(this.missionID);
end

----------------------------------------------------------------------
tbZXC = gf_CopyInherit(missionBase, tbZXC);

tbZXC.msOption.bForbitTeam = 1; --可以组队
tbZXC.msOption.nInitFightState = nil;  --战斗状态
tbZXC.msOption.nRestoreFightState = nil; --战斗状态
tbZXC.msOption.bRestoreTempEffect = 0; --是否清除临时状态
tbZXC.msOption.szInitDeahScript = "\\script\\missions\\yp\\player_death.lua";
tbZXC.msCamp.campType = tAllCamp;

tbZXC.msPhases[1] = firePhases;

tbZXC.msPosition.entryPos = {
--	{3965,11224},
	{4080,11302},
	{3970,11218},
};
tbZXC.msPosition.exitPos = {200,1381,2845};

function tbZXC:onInit()
----	print("tbSLY:onInit")
	firePhases:onInit();
	missionBase.onInit(self);
end

function tbZXC:onLeave()
--	print("tbSLY:onLeave")
	SetMissionV(MV_MISSION_STATUS,1); --不离开队伍
	SetLogoutRV(0);	--设置登陆点为下线坐标
	self.msOption:restoreState();
end

function tbZXC:onLogin(nCamp)
--	print("tbSLY:onLogin")
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		nCamp = 5;
	end	
	this.msOption:setState(nCamp);
	this.msCamp:addPlayer(this.missionID, nCamp);	
--	SetFightState(1,3);	
end

tbZXC.msOption.OnPlayerJoin = function(self, nCamp)
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if GetTask(TASK_FIELD_PVP_CAMP) == 0 or nCamp == 5 then
		ForbidChangePK(0);
		SetPKFlag(0,0);
		ForbidChangePK(1);
	else
		ForbidChangePK(0);
		SetPKFlag(1,nCamp-1);
		ForbidChangePK(1);	
	end
	local m = GetWorldPos();
	SetTempRevPos(tTempRev[nCamp][m][1],tTempRev[nCamp][m][2]*32,tTempRev[nCamp][m][3]*32); --临时重生点
--	if nCamp == 1 then
--		print("tbSLY.msOption.OnPlayerJoin")
--		local n = CreateTrigger(1,this.timerTriggerID,this.costomerID);
--		ContinueTimer(n);
--	end
	if GetTrigger(g_nLoginCostomerID) == 0 then
		CreateTrigger(3,g_nLoginTriggerID,g_nLoginCostomerID);
	end	
	if GetTrigger(g_nRectCostomerID) == 0 then
		CreateTrigger(2,g_nRectTriggerID,g_nRectCostomerID);
	end			
end
--
--tbSLY.msOption.OnPlayerLeave = function(self, nCamp)
--	print("tbSLY.msOption.OnPlayerLeave")
--	RemoveTrigger(GetTrigger(this.costomerID));
--end

this = tbZXC;
