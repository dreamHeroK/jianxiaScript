--------------------------------------------------------------------
-- 地玄宫 第3关
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------

Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
--Include("\\script\\master_prentice\\master_prentice_point.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase3_1 = gf_CopyInherit(tPhaseBase, {
--})

phase3_1 = {
	stepInterval = 1,
	stepLimit = 120,
};
phase3_2 = {
	stepInterval = 30,
	stepLimit = 600,
};
phase3_3 = {
	stepInterval = 3,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStage3 = {
	tPhases = {
		phase3_1,
		phase3_2,
		phase3_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1715, 3188},

		{1723, 3170},
		{1724, 3155},
		{1736, 3168},

		{1725, 3182},
		{1734, 3172},
		{1721, 3168},
		{1717, 3154},
		{1707, 3162},

		{1714, 3158},
		{1716, 3171},
		{1729, 3176},
		{1725, 3162},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"明教探子地", "围观的明教探子", 100},
		{"地玄宫宫主1", "地玄宫宫主"},
		{"木制机关人1", "机关", 120},
		{"木制机关人1", "机关", 120},
		{"锯魂1", "锯魂"},
		{"惊雷1", "惊雷"},
		{"天阴教狂热者", "天阴教狂热者"},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage3:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage3:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npc, npcMod[3]);
	end
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStage3:createBoss()
	self:createChar(3);
	self:createChar(4);
end

function tStage3:createJiguan()
	local rand1,rand2 = random(1,5), random(1,4)
	if rand1 == rand2 then
		rand1 = 5;
	end
	local npcMod = self.npcMod[5];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand1));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
	npcMod = self.npcMod[6];
	local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPos(4 + rand2));
	SetNpcScript(npc, g_theMS.fileName);
	SetNpcLifeTime(npc, 30);
end

function tStage3:createDog()
	local npcMod = self.npcMod[7];
	for i = 1, 4 do
		local m, x, y = self:GetPos(i + 9);
		for i = 1, 4 do
			local npc = CreateNpc(npcMod[1], npcMod[2], m, x, y);
			SetNpcLifeTime(npc, 90);
		end
	end
end

function tStage3:createFish(npc)
	local m, x, y = GetNpcWorldPos(npc);
	local count = 5 + COUNT_RUNNER - GetMissionV(MV_KILLED_NPC) - GetMissionV(MV_LIVED_RUNNER);
	for i = 1, count do
		local xx, yy = x + random(-5, 5), y + random(-5, 5)
		local npc = CreateNpc("被困人士地"..random(1,10),"被困弟子", m, xx, yy);
		SetCampToNpc(npc, CampPlayer);
		SetNpcScript(npc, g_theMS.fileName);
		ModifyNpcData(npc, 0, 1000,0);
	end
end

function tStage3:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage3:onTimerOver()
	g_theMS:Close()
end
tStage3.rule["timerover"] = tStage3.onTimerOver;

function tStage3:giveAward(nNpcIdx, nBossCount)

	g_theMS.msCamp[1]:turnPlayer(giveStageExpAward) 		--经验
	g_theMS.msCamp[1]:turnPlayer(giveStageDaiBiAward, 3); 	--代币
	--翻盘奖励
	local opui = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 3));
	end
	g_theMS.msCamp[1]:turnPlayer(opui);

	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 3)
end

-------等待开启阶段------------------------------------------------------
function phase3_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
	g_theMS:Msg2MSAll("你的队伍已经进入地玄宫后殿。");
	phase2_3_gogogo();
end

function phase3_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		g_theMS.msCamp[1]:turnPlayer(function ()
			SetFightState(0);
		end);
		local npc = getStage():createChar(2);
		getStage():createFish(npc);
		SetNpcActivator(npc);
	elseif nStep == 3 then
		local npc = findNpc("地玄宫宫主");
		NpcChat(npc, "口桀口桀口桀！迷途的NPC啊，放弃挣扎，皈依伟大的红印教主吧，阿勒个门！");
		local npc2 = findNpc("峨嵋柳轩")
		local pos = getStage().resetPos;
		SetNpcPos(npc2, pos[1], pos[2]);
	elseif nStep == 4 then
		local npc = findNpc("地玄宫宫主");
		NpcChat(npc, "以红印教主的名义赐汝等满状态原地复活！");
		NpcCommand(npc, NPCCOMMAND.do_skill,1732*32,3160*32,65536*1+693);
		local npc2 = findNpc("峨嵋柳轩")
		NpcCommand(npc2, NPCCOMMAND.do_beatdown, 8, 5 * 18);
		NpcChat(npc2, "啊，我又飞勒~~~~");
	elseif nStep == 6 then
		local npc = findNpc("地玄宫宫主");
		NpcChat(npc, "信红印，得永生！");
		ChangeNpc2Talk(npc);
		local npc2 = findNpc("峨嵋柳轩")
		SetNpcLifeTime(npc2, 0);
	end
end

function phase3_1:onNpcDeath(npcIdx)
	local npcName = GetNpcName(npcIdx)
	if npcName == "被困弟子" or npcName == "武林精英" then
		local m, x, y = GetNpcWorldPos(npcIdx);
		SetNpcLifeTime(npcIdx, 0);
		local npc = CreateNpc("僵尸地"..random(1,3), "僵尸", m, x, y);
		SetCampToNpc(npc, CampEnemy);
	end
end

function phase3_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		Talk(1, "", "我也像你年轻的时候，脾气那么暴躁！");
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	local tSel = {
		"废话少说，看打！/#stageAction('p1')",
	}
	Say("小小年纪怎能如此轻生，我看你根骨奇佳却与所谓明门正道为伍，可惜可惜！不如收了这个秘籍，拜我为师吧！", getn(tSel), tSel);
end

function info3()
	Talk(1, "", "明教探子：地玄宫的后殿是地玄宫宫主的住所，宫主研究并制造出厉害的机关，您必须小心。击败地玄宫宫主将有机会获得天阴圣物箱和天阴密箱。");
end

function phase3_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------杀怪阶段-------------------------------------------------
function phase3_2:onInit()
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msCamp[1]:turnPlayer(function ()
		SetFightState(1);
	end);
	local npc = findNpc("地玄宫宫主");
	NpcChat(npc, "以红印教主的名义赐汝等永生！");
	g_theMS:Msg2MSAll("过关条件：击败地玄宫宫主")
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(npc, {{1732, 3160}});

	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"时间进度条", self.stepLimit, 0);
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
end
function phase3_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

function phase3_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--每日任务-杀怪
	local npcName = GetNpcName(npcIdx);
	if npcName == "地玄宫宫主" then
		g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 1, npcIdx);--每日任务-123关通关
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
		getStage():giveAward(npcIdx, nBossCount);
		stageAction('p2');
	elseif npcName == "被困弟子" or npcName == "武林精英" then
		local m, x, y = GetNpcWorldPos(npcIdx);
		SetNpcLifeTime(npcIdx, 0);
		local npc = CreateNpc("僵尸地"..random(1,3), "僵尸", m, x, y);
		SetCampToNpc(npc, CampEnemy);
	end
end
function phase3_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------本关结束----------------------------------------------------
function phase3_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 3);
--	ds_DXG:AddStatValue(3,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("经过不懈的努力。你们已经成功闯过了地玄宫，少阳和文史两派将记载你们的功绩。")
	local hyd = function()
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 12));
	end
	g_theMS.msCamp[1]:turnPlayer(hyd);
	local op = function()
		if GetTask(TASKID_DXG_DAILY_TASK) == 1 then
			SetTask(TASKID_DXG_DAILY_TASK, 2, TASK_ACCESS_CODE_DXG_MISSION);
			Msg2Player("您完成了本日的地玄宫任务，去领取奖励吧！");
		end
	end
	g_theMS.msCamp[1]:turnPlayer(op);
	g_theMS:action("so");
	--通关前三关次数统计
	AddRuntimeStat(1,8,0,1);
end

function phase3_3:onTimer(nStep)
	g_theMS:action("missionfinish")
end

--------------------------------------------------------------------

tStage3 = gf_CopyInherit(tStageBase, tStage3);
