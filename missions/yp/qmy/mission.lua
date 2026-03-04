Include("\\script\\lib\\globalvalue.lua")
Include("\\script\\missions\\yp\\qmy\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\tmp_task_id_def.lua")

---------------------------------------------------------
stageFight = {
	name = "tbSLY",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",
}

function stageFight:createSomeNpc()
--	print("stageFight:createSomeNpc()")
	local m = this.msPosition:getMapID();
	yp_CreateMonster(tNpcs[m].kmds,tPos[m].kmds);
	yp_CreateMonster(tNpcs[m].qhys,tPos[m].qhys);	
	yp_CreateMonster(tNpcs[m].cf,tPos[m].cf);
	yp_CreateMonster(tNpcs[m].xbr,tPos[m].xbr);
	yp_CreateMonster(tNpcs[m].ck,tPos[m].ck);
	yp_CreateMonster(tNpcs[m].yd,tPos[m].yd);	
end

function stageFight.init()
	self = stageFight;
--	this:Msg2MSAll("初始化地图NPC...");
	self:createSomeNpc();
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

function stageFight.createTreasure()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if nHour == 17 or nHour == 21 then
		if nMin == 0 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),10);
			for i = 1,10 do
--				print("tCurTreasure[i]",tCurTreasure[i]);
				SetMissionV(i,tCurTreasure[i]);
			end
			SetMissionV(this.mv12,0);
			SetMissionV(this.mv13,1);
			Msg2Global("众多寻宝人纷纷放弃了在云中寻宝的想法，他们似乎正在寻找接替之人！");
		end
	end
end

function stageFight.createNpcBook()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if mod(nHour,6) == 0 then 	
		if nMin < 4 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),6);
			for i = 1,getn(tCurTreasure) do
				local x,y = tBzPos[m][tCurTreasure[i]][1],tBzPos[m][tCurTreasure[i]][2];
				local nNpcIdx = CreateNpc("武林盟传教使","武林盟传教使",m,x,y);
				if nNpcIdx ~= 0 then
					SetNpcLifeTime(nNpcIdx,30*60);
					SetNpcScript(nNpcIdx,thisFile);
				end
			end
			Msg2Global("武林盟的传教使正在云中传道授业,众位有心爱教的侠士可前往拜访!")
		end
	end
end

function stageFight.createNpcTree()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if nHour == 14 or nHour == 20 then 	
		if nMin < 3 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),30);
			for i = 1,getn(tCurTreasure) do
				local x,y = tBzPos[m][tCurTreasure[i]][1],tBzPos[m][tCurTreasure[i]][2];
				local nNpcIdx = CreateNpc("武当掌门","神游真人",m,x,y);
				if nNpcIdx ~= 0 then
					SetNpcLifeTime(nNpcIdx,30*60);
					SetNpcScript(nNpcIdx,thisFile);
				end
			end
			Msg2Global("有传闻神游真人正在云中游历,有心之人可前去寻找际遇!")
		end
	end
end

function stageFight:onTalk()
	local nNpcIdx = GetTargetNpc();
	local strNpcName = GetTargetNpcName();
	if strNpcName == "武林盟传教使" then
		if GetUnitCurStates(nNpcIdx,0) == 0 or (GetTime() - GetUnitCurStates(nNpcIdx,1)) > 10 then
			AddUnitStates(nNpcIdx,0,1-GetUnitCurStates(nNpcIdx,0));
			AddUnitStates(nNpcIdx,1,GetTime()-GetUnitCurStates(nNpcIdx,1));
			SetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX,nNpcIdx);
			DoWait(125,126,10);
		else
			Talk(1,"","<color=green>提示<color>：正在被其他人点击，请稍后再试！")
			return
		end
	elseif strNpcName == "神游真人" then
		if GetUnitCurStates(nNpcIdx,0) == 0 or (GetTime() - GetUnitCurStates(nNpcIdx,1)) > 10 then
			AddUnitStates(nNpcIdx,0,1-GetUnitCurStates(nNpcIdx,0));
			AddUnitStates(nNpcIdx,1,GetTime()-GetUnitCurStates(nNpcIdx,1));
			SetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX,nNpcIdx);
			DoWait(127,128,10);
		else
			Talk(1,"","<color=green>提示<color>：正在被其他人点击，请稍后再试！")
			return
		end
	elseif strNpcName == "寻宝人" then
		Say("<color=green>寻宝人<color>：我听闻这云中是天阴教埋藏宝物之处，不料寻觅了多日毫无所获。也罢也罢！还是寻找平常之物去吧。",
			2,
			"阁下无意，可借我装备一用/xbr_give_tq",
			"结束对话/nothing")
	end
end

function xbr_give_tq()
	if BigGetItemCount(tPVPItemInfo[18][2],tPVPItemInfo[18][3],tPVPItemInfo[18][4]) ~= 0 then
		Talk(1,"","<color=green>寻宝人<color>：大侠已经领取过["..tPVPItemInfo[18][1].."]，是不是忘了?");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	gf_AddItemEx({tPVPItemInfo[18][2],tPVPItemInfo[18][3],tPVPItemInfo[18][4],1},tPVPItemInfo[18][1]);
end

function stageFight.NpcBookSuc()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		SetNpcLifeTime(nNpcIdx,0)
		local nRand = random(1,100);
		if nRand <= 50 then
			gf_AddItemEx({tPVPItemInfo[2][2],tPVPItemInfo[2][3],tPVPItemInfo[2][4],1},tPVPItemInfo[2][1]);
		else
			gf_AddItemEx({tPVPItemInfo[3][2],tPVPItemInfo[3][3],tPVPItemInfo[3][4],1},tPVPItemInfo[3][1]);
		end
	end
end

function stageFight.NpcBookFail()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		AddUnitStates(nNpcIdx,0,-GetUnitCurStates(nNpcIdx,0));
	end
end

function stageFight.NpcTreeSuc()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		SetNpcLifeTime(nNpcIdx,0)
		local nRand = random(1,100);
		if nRand <= 20 then
			gf_AddItemEx({tPVPItemInfo[6][2],tPVPItemInfo[6][3],tPVPItemInfo[6][4],1},tPVPItemInfo[6][1]);
		else
			yp_setValue(4,20);
		end
	end
end

function stageFight.NpcTreeFail()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		AddUnitStates(nNpcIdx,0,-GetUnitCurStates(nNpcIdx,0));
	end
end
----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
--	[50] = stageFight.warn,
}
stageFight.cycActions = {
	[2] = { --2秒检测一下镖车
		[0] = {stageFight.checkBiaoche,stageFight.checkPlant},
	},
	[50] = {--50s
		[0] = stageFight.createTreasure,
	},
	[180] = { --3分钟
		[0] = {stageFight.createNpcBook,stageFight.createNpcTree},
	},
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
tbSLY = gf_CopyInherit(missionBase, tbSLY);

tbSLY.msOption.bForbitTeam = 1; --可以组队
tbSLY.msOption.nInitFightState = nil; --战斗状态
tbSLY.msOption.nRestoreFightState = nil; --战斗状态
tbSLY.msOption.bRestoreTempEffect = 0; --是否清除临时状态
tbSLY.msOption.szInitDeahScript = "\\script\\missions\\yp\\player_death.lua";
tbSLY.msCamp.campType = tAllCamp;

tbSLY.msPhases[1] = firePhases;

tbSLY.msPosition.entryPos = {
	{1603,3353},
	{1585,3352},
	{1593,3364},
};
tbSLY.msPosition.exitPos = {200,1381,2845};

--function tbSLY:onInit()
----	print("tbSLY:onInit")
--	firePhases:onInit();
--	missionBase.onInit(self);
--end

function tbSLY:onLeave()
--	print("tbSLY:onLeave")
	SetMissionV(MV_MISSION_STATUS,1); --不离开队伍
	SetLogoutRV(0);	--设置登陆点为下线坐标
	self.msOption:restoreState();
end

function tbSLY:onLogin(nCamp)
--	print("tbSLY:onLogin")
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		nCamp = 5;
	end	
	this.msOption:setState(nCamp);
	this.msCamp:addPlayer(this.missionID, nCamp);	
--	SetFightState(1,3);	
end

tbSLY.msOption.OnPlayerJoin = function(self, nCamp)
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

this = tbSLY;
