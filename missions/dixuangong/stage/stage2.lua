--------------------------------------------------------------------
-- 地玄宫 第2关
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase2_1 = gf_CopyInherit(tPhaseBase, {
--})
COUNT_RUNNER = 15 - 1;

phase2_1 = {
	stepInterval = 1,
	stepLimit = 2,
};
phase2_2 = {
	stepInterval = 1,
	stepLimit = 10 * 60,
	maxCount = COUNT_RUNNER,
};
phase2_3 = {
	stepInterval = 5,
	stepLimit = 180/5,
};

--------------------------------------------------------------------
tStage2 = {
	tPhases = {
		phase2_1,
		phase2_2,
		phase2_3,
	},
	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1674, 3234},
		{1681, 3214},
	},
	way1 = {
		{1690, 3210, },
		{1682, 3203, },
		{1668, 3217, },
		{1675, 3226, },
		{1660, 3240, }, },
	way2 = {
		{1690, 3210, },
		{1697, 3219, },
		{1683, 3234, },
		{1675, 3226, },
		{1660, 3240, }, },
	npcpos = {1702, 3190, },
	fishpos = {
		{1682, 3209, },
		{1692, 3218, },
		{1674, 3218, },
		{1683, 3228, }, },
	bosspos = {1682, 3218, },

	resetPos = {1674, 3234},
	npcMod = {
		{"明教探子地", "围观的明教探子"},

		{"天阴狱卒地", "天阴狱卒头目",},
		{"旋锯地", "旋锯", },

	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStage2:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage2:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npc = CreateNpc(npcMod[1], npcMod[2], getStage():GetPos(nId));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	return npc;
end

function tStage2:createRunner()
	local npcMod = {};
	npcName = "被困的武林人士";
	local model = "被困地"..random(1,10)
	npc = CreateNpc(model, npcName, self:GetPosEx(self.npcpos));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampPlayer);
	SetNpcLifeTime(npc, 16);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	local way = self.way1;
	if self.bWay == 1 then
		way = self.way2;
		self.bWay = 0;
	else
		self.bWay = 1;
	end
	g_NpcAI:setWayPoint(npc, way);
	SetNpcActivator(npc);
	return npc;
end

function tStage2:createFish()
	local npcMod = self.npcMod[3];
	local tPos = self.fishpos;
	for i = 1, getn(tPos) do
		local npc = CreateNpc(npcMod[1], npcMod[2], self:GetPosEx(tPos[i]));
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetCampToNpc(npc, CampEnemy);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function tStage2:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end
function tStage2:GetPosEx(pos)
	local m, x, y = g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
	return m, x, y;
end
function tStage2:onTimerOver()
	g_theMS:Close()
end
tStage2.rule["timerover"] = tStage2.onTimerOver;

function tStage2:giveAward(nNpcIdx, nBossCount)

	g_theMS.msCamp[1]:turnPlayer(giveStageExpAward) 		--经验
	g_theMS.msCamp[1]:turnPlayer(giveStageDaiBiAward, 2); 	--代币
	--翻盘奖励
	local opui = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 2));
	end
	g_theMS.msCamp[1]:turnPlayer(opui);
	
	local nCount = GetMissionV(MV_LIVED_RUNNER);
	local nScore = GetMissionV(MV_L2_SCORE);
	local nExpMulti;
	if nScore < 12 then
		nExpMulti = 1.2;
	elseif nScore < 18 then
		nExpMulti = 1.5;
	elseif nScore < 24 then
		nExpMulti = 2;
	else
		nExpMulti = 2.5;
	end
	g_theMS:Msg2MSAll(format("共营救%d位武林人士，获得%d分",nCount, nScore));
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 2)
end

-------等待开启阶段------------------------------------------------------
function phase2_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
--	getStage():createChar(1)
--	g_theMS:Msg2MSAll("你们的队伍已经到达地玄宫中殿，队长与被抓的天阴教徒对话可开启关卡。");
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
end

function phase2_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = findNpc("峨嵋柳轩");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "呜呜，我可怜的姐妹呀~");
	end
end

function phase2_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())

	local tSel = {
		"我等来助你救人/#stageAction('p1')",
		"这地玄宫中殿都有什么玄机/info2",
		"结束对话/nothing"
	}
	Say("<color=green>峨嵋柳轩<color>：呜呜，我可怜的姐妹呀~", getn(tSel), tSel);
end

function info2()
	Talk(1, "", "前面的屋子里有许多旋锯，很多的同门姐妹都在逃跑中遇害了。里面还有个厉害的狱卒，快帮帮我们吧！切记，狱卒一死机关就会全部发动，所有武林人士将会会困死在里面！");
end

--------杀怪阶段-------------------------------------------------
function phase2_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"时间进度条", self.stepLimit, 0);
	g_theMS:Msg2MSAll("请保护好武林人士逃出！");
	local pos = getStage().resetPos;
	g_theMS.msCamp[1]:turnPlayer(SetPos, pos[1], pos[2]);
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
	---201212活动修改
	--Observer:onEvent(OE_DXG_CREATE_NPC,{2, nMapID, 1734, 3160}); --pvp地图传入mapID和阵营，pve传入mapID和坐标
--	ds_DXG:AddStatValue(2,1,1);
--	ds_DXG:AddStatValue(2,2,g_theMS.msCamp[1]:getCount(0));
end
function phase2_2:onTimer(nStep)
	nStep = nStep - 1;
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
	if nStep == 0 then
		g_theMS:SetMissionV(MV_KILLED_NPC, 0);
		SetMissionV(MV_LIVED_RUNNER, 0);
		local npc = getStage():createChar(2);
		NpcChat(npc, "果然你们尽然到了这儿了，等待你们的将是死路一条!");
		getStage():createFish();
	end
	local runStep = 8
	if mod(nStep, runStep) == 0 then
		if nStep < self.maxCount * runStep then
			local npc = getStage():createRunner();
			tMsg = {
				"快帮帮我，这里很危险！",
				"哎，我的妈啊！我终于出来了！",
				"你们终于来了！",
				"君子报仇十年不晚，你你你还有你给我等着！",
				"非常感谢你们救我，以后有什么需要，赴汤蹈火在所不辞！",
			}
			local msg = randomin(tMsg);
			NpcChat(npc, msg);
		elseif nStep == self.maxCount * runStep then
			local npc = getStage():createRunner();
			NpcChat(npc, "终于逃脱了！");
			g_theMS:Msg2MSAll("大部分被困的武林人士都已逃出！");
		end
	end
	self:checkRunner();
	if nStep == 25 or nStep == 85 then
		self:castSkill(1);
	elseif nStep == 55 then
		self:castSkill(2);
	end
end
function phase2_2:checkRunner()
	local tNpc = findAllNpc("被困的武林人士");
	for i = 1, getn(tNpc) do
		local npc = tNpc[i];
		local _, x, y = GetNpcWorldPos(npc);
		if abs(x-1660) + abs(y-3240) < 5 then
			local l = GetMissionV(MV_LIVED_RUNNER) + 1;
			SetMissionV(MV_LIVED_RUNNER, l)
			SetNpcLifeTime(npc, 0);
			SetMissionV(MV_L2_SCORE, GetMissionV(MV_L2_SCORE) + 2);
		end
	end
end
function phase2_2:castSkill(n)
	local npc = findNpc("天阴狱卒头目");
	if not npc then return end

	local tPos = {
		{{1662,3217},{1670,3205},{1693,3232},{1685,3239},{1679,	3213},{1686,3223},},
		{{1670,3205},{1693,3232},{1693,3207},{1671,3231},{1682,3217},},
	}
	tPos = randomin(tPos[n]);
	local tMod = {
		{"寒冰阵地","寒冰阵"},
		{"烈火阵地","烈火阵"},
	}
	tMod = tMod[n];
	local npcFlag = CreateNpc(tMod[1], tMod[2], GetMissionV(MV_MAP_ID), tPos[1], tPos[2]);
	SetNpcLifeTime(npcFlag, 15);
	SetCampToNpc(npcFlag, CampEnemy);
	NpcChat(npc, "休想逃走：我不会让你们得逞的！");
end

function phase2_2:finish()
	getStage():action("p2");
end

function phase2_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--每日任务-杀怪
	local npcName = GetNpcName(npcIdx);
	if npcName == "天阴狱卒头目" then
		ClearMapNpc(g_theMS:getMapId(), nil);
		g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
		stageAction('p2');
		getStage():giveAward(npcIdx, nBossCount);
		local maxCount = GetMissionV(MV_TIMER_STEP) * 5 / 20;
		if maxCount > self.maxCount then
			maxCount = self.maxCount;
		end
	elseif npcName == "被困的武林人士" then
		local nCount = g_theMS:GetMissionV(MV_KILLED_NPC) + 1;
		g_theMS:Msg2MSAll(format("已有%d名武林人士被杀死!!!", nCount));
		g_theMS:SetMissionV(MV_KILLED_NPC, nCount);
--		ClearMapNpc(g_theMS:getMapId(), nil);
--		StopTimeGuage(-2);
--		stageAction('p2');
	end
	if npcName ~= "旋锯" then
		SetNpcLifeTime(npcIdx, 3);
	end
end
function phase2_2:onTrap(nId)
		local pos = getStage().resetPos;
		SetPos(pos[1], pos[2]);
end

--------本关结束----------------------------------------------------
function phase2_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 2);
	--ds_DXG:AddStatValue(2,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("经过不懈的努力天阴狱卒头目终于又被你们推倒了。");

	self:createMinion();
end

function phase2_3:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('timerover');
		return
	end

	if nStep == 3 then
		local npc = findNpc("峨嵋柳轩");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "多谢各位兄弟相助，此番定能将地玄宫荡平！");
	end
end

tPos_2_3 = {
	{1649, 3251, { {1660, 3240}, {1678, 3220}}},		-- 03
	{1651, 3253, { {1660, 3240}, {1680, 3222}}},		-- 04
	{1646, 3254, { {1660, 3240}, {1675, 3223}}},		-- 09
	{1648, 3256, { {1660, 3240}, {1677, 3225}}},		-- 10
	{1647, 3249, { {1655, 3235}, {1676, 3218}}},		-- 02
	{1653, 3255, { {1665, 3245}, {1682, 3224}}},		-- 05
	{1644, 3252, { {1655, 3235}, {1673, 3221}}},		-- 08
	{1650, 3258, { {1665, 3245}, {1679, 3227}}},		-- 11
	{1643, 3257, { {1660, 3240}, {1672, 3226}}},		-- 15
	{1645, 3259, { {1660, 3240}, {1674, 3228}}},		-- 16
	{1640, 3260, { {1660, 3240}, {1669, 3229}}},		-- 21
	{1642, 3262, { {1660, 3240}, {1671, 3231}}},		-- 22
	{1645, 3247, { {1655, 3235}, {1674, 3216}}},		-- 01
	{1655, 3257, { {1665, 3245}, {1684, 3226}}},		-- 06
	{1642, 3250, { {1655, 3235}, {1671, 3219}}},		-- 07
	{1652, 3260, { {1665, 3245}, {1681, 3229}}},		-- 12
	{1641, 3255, { {1655, 3235}, {1670, 3224}}},		-- 14
	{1647, 3261, { {1665, 3245}, {1676, 3230}}},		-- 17
	{1639, 3253, { {1655, 3235}, {1668, 3222}}},		-- 13
	{1649, 3263, { {1665, 3245}, {1678, 3232}}},		-- 18
	{1638, 3258, { {1655, 3235}, {1667, 3227}}},		-- 20
	{1644, 3264, { {1665, 3245}, {1673, 3233}}},		-- 23
	{1636, 3256, { {1655, 3235}, {1665, 3225}}},		-- 19
	{1646, 3266, { {1665, 3245}, {1675, 3235}}},		-- 24
}
function phase2_3:createMinion()
	local npc = CreateNpc("柳轩地", "峨嵋柳轩", g_theMS:GetMissionV(MV_MAP_ID), 1653, 3248);
	SetCampToNpc(npc, CampPlayer);
	SetNpcActivator(npc);
	ChangeNpc2Talk(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1690, 3209}});
	SetNpcScript(npc, g_theMS.fileName);

	local nCount = g_theMS:GetMissionV(MV_LIVED_RUNNER);
	m = GetMissionV(MV_MAP_ID);
	for i = 1, nCount do
		local pos = tPos_2_3[i];
		npc = self:createMinion2(m, pos[1], pos[2]);
		g_NpcAI:setAI(npc, AT_SM_MOVE);
		g_NpcAI:setWayPoint(npc, pos[3]);
		SetNpcScript(npc, g_theMS.fileName);
	end
end

function phase2_3:createMinion2(m, x, y)
	npcName = "武林精英";
	local model = "武林人士地"..random(1,10)
	npc = CreateNpc(model, npcName, m, x, y);
	SetCampToNpc(npc, CampPlayer);
--	ChangeNpc2Talk(npc);
	return npc;
end

function phase2_3:onTalk(npcIdx)
	local npcName = GetTargetNpcName();
	if npcName == "峨嵋柳轩" and isCaption() then
		Say("这一战我武林盟军损失惨重，多亏诸位拔刀相助！", 1, "我等原为武林出力/phase2_3_gogogo");
	else
		Talk(1, "", format("<color=green>%s<color>: 谢谢你的支持！", npcName));
	end
end

function phase2_3_gogogo()
	local flag = GetMissionV(MV_S2_GGG_FLAG);
	if flag == 1 then return end
	SetMissionV(MV_S2_GGG_FLAG, 1);
	local npc = findNpc("峨嵋柳轩");
	NpcChat(npc, "兄弟伙上，爆了地玄宫宫主大家分装备！");
	ChangeNpc2Fight(npc);
	g_NpcAI:setAI(npc, AT_SM_MOVE);
	g_NpcAI:setWayPoint(npc, {{1717, 3169}});
	setCurStage(3)

	local tMsg = {
		"没钱修装备T_T",
		"好啊，整！",
		"++++++++++++++",
		"黑手就不要去开宝箱了!! ",
	}
	local tnpcs = findAllNpc("武林精英");
	local t = {{1690, 3197}, {1696, 3201}, {1700, 3208}};
	for _, npc in tnpcs do
--		ChangeNpc2Fight(npc);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		local _, x, y = GetNpcWorldPos(npc);
		local p1 = randomin(t);
		g_NpcAI:setWayPoint(npc, {p1, {x+50, y-50}});
		if random(10) <= 3 then
			NpcChat(npc, randomin(tMsg));
			SetNpcActivator(npc);
		end
	end
end

function phase2_3:onTrap(nId)
	if nId == 2 then
		g_theMS:action("s3")
	end
end
--------------------------------------------------------------------

tStage2 = gf_CopyInherit(tStageBase, tStage2);
