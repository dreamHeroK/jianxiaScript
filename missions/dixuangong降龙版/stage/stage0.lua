-- 初始等待阶段
Include("\\script\\missions\\dixuangong\\daily_task.lua")

tStage0 = {
	stepInterval = 1,
	stepLimit = 120,

	pos = {
		{1644, 3257},
	},
	resetPos = {1644, 3257},
	npcMod = {
		{"巡逻喽啰地", "巡逻的天阴教喽啰"},
	},
}

--------------------------------------------------------------------
function tStage0:onInit()
	g_theMS.msTimer:setInterval(1)
end

function tStage0:createMapTrap()
	local MapId = g_theMS:getMapId();
	for i = 1, 13 do
		AddMapTrap(MapId,(1657+i)*32,(3229+i)*32, g_theMS.Trap1);
		AddMapTrap(MapId,(1656+i)*32,(3229+i)*32, g_theMS.Trap1);
	end
	for i = 1, 13 do
		AddMapTrap(MapId,(1692+i)*32,(3188+i)*32, g_theMS.Trap2);
		AddMapTrap(MapId,(1691+i)*32,(3188+i)*32, g_theMS.Trap2);
	end
end

function tStage0:createChar()
	local npcMod = self.npcMod[1];
	local npcIdx = CreateNpc(npcMod[1], npcMod[2], self:GetPos(1));
	ChangeNpc2Talk(npcIdx);
	SetNpcScript(npcIdx, g_theMS.fileName);
	return npcIdx;
end
function tStage0:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage0:onTimer(nStep)
	if nStep == 1 then
		g_theMS:Msg2MSAll("你的队伍已经进入地玄宫前殿，队长与巡逻的天阴教喽啰对话可开启关卡");
		g_theMS.msTimer:setInterval(self.stepInterval)
		g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"准备时间", self.stepInterval * self.stepLimit, 0);
		self:createMapTrap();
		local npc = self:createChar();
		NpcChat(npc, "宫主叫我来巡山喽,哥哥我没空把留开!");
	end
	local stepRun = GetMissionV(MV_STEP_XX_RUN)
	if stepRun > 0 and nStep - stepRun == 5 then
		local npcIdx = findNpc("巡逻的天阴教喽啰");
		self:onNpcDeath(npcIdx, 0);
	end
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

--------------------------------------------------------------------
function tStage0:onTalk()
	if PlayerIndex ~= GetTeamMember(0) then
		Talk(1, "", "哼！像你这样的人也来到这里与我交谈！在这个圣地，你们仍然敢于待在这里，如果您不走开，也不要怪我残忍！");
		return
	end
	Say(format("<color=green>巡逻的天阴教喽啰<color>：哎呦，这%s长的还真是自俊呐？带去给宫主必有重赏，哇哈哈！", ((GetSex() == 1 and "小哥") or "小妞")),
		3,
		"打赏你5个天骄令，带我去大殿/tStage0_speEnter",
		"有眼无珠，接招！/tStage0_norEnter",
		"打探消息/tStage0_info");
end

function tStage0_speEnter()
	if GetItemCount(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3]) < 5 then
		Msg2Player("您身上没有5个天骄令");
		return
	end
	if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],5) ~= 1 then return end
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + N_JOIN_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);

	local nNeedTianjiao = GetTask(TASKID_DXG_SCORE)
	if nNeedTianjiao >= T_NEED_TIANJIAOLING then
		local nR = random(1,100);
		local nNum = 0
		if nR <= 40 then
			nNum = 1;
		elseif nR > 40 and nR <= 80 then
			nNum = 2;
		else
			nNum = 3;
		end;
		gf_AddItemEx({DIXUANJINLING[1],DIXUANJINLING[2],DIXUANJINLING[3],1}, DIXUANJINLING[4], nNum)
		gf_AddItemEx({XUANYINYU[1],XUANYINYU[2],XUANYINYU[3],1}, XUANYINYU[4], nNum)
		SaveNow(); -- 立即存盘
		local szNotice = format("恭喜%s从%s中获得了[%s]×%d", GetName(), "地玄宫", DIXUANJINLING[4], nNum)
		Msg2Global(szNotice);
		local szNotice1 = format("恭喜%s从%s中获得了[%s]×%d", GetName(), "地玄宫", XUANYINYU[4], nNum)
		Msg2Global(szNotice1);
		SetTask(TASKID_DXG_SCORE, 0, TASK_ACCESS_CODE_DXG_MISSION)
	end

	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	local npc = GetTargetNpc();
	g_theMS:Msg2MSAll("天阴教喽啰敲响了警报，天阴巫师出现，请击败天阴巫师。");
	g_theMS:action("sx");
	--走后门次数统计
	AddRuntimeStat(1,7,0,1);
	--地玄宫消耗通天令牌数量统计
	AddRuntimeStat(1,13,0,N_JOIN_TIANJIAOLING_NEED);
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(4)
	
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 1, npcIdx);--每日任务-123关通关
end

function tStage0_norEnter()
	self = tStage0;
	local npc = GetTargetNpc();
	NpcChat(npc, "大爷饶命，小的并没有恶意啊！快来人呐，宫主救命呐！");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local pos = {
		{1660, 3241},
	}
	g_NpcAI:setWayPoint(npc, pos);
	SetNpcDeathScript(npc, g_theMS.fileName);
	SetMissionV(MV_STEP_XX_RUN, GetMissionV(MV_TIMER_STEP));
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(1)
end

function tStage0_info()
	Talk(1, "", "<color=green>巡逻的天阴教喽啰<color>：你小弟还有点意思，不妨告诉你。咱家这地玄宫，共分三室，第一室演练拳脚，第二室机关密布，第三室正在搞个秘密会议。哇哈哈，巫师大人让小的出来巡逻，烦躁的死！不过好过在里面当苦力啊！");
end

function tStage0:onNpcDeath(npcIdx, nTime)
	nTime = nTime or 10
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
	g_theMS:Msg2MSAll("天阴教喽啰敲响了警报，天阴巫师出现，请击败天阴巫师。");
	g_theMS:action("s1");
	SetNpcLifeTime(npcIdx, nTime);
end

function tStage0:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
