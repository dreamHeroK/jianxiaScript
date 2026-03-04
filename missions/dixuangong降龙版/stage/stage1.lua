--------------------------------------------------------------------
-- 地玄宫 第1关
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phase1_1 = gf_CopyInherit(tPhaseBase, {
--})

phase1_1 = {
	stepInterval = 1,
	stepLimit = 10,
};
phase1_2 = {
	stepInterval = 50,
	stepLimit = 450,
};
phase1_3 = {
	stepInterval = 1,
	stepLimit = 180,
};

--------------------------------------------------------------------
tStage1 = {
	tPhases = {
		phase1_1,
		phase1_2,
		phase1_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1632, 3275},
		{1660, 3241},
		{1653, 3248},
		{1660, 3241},
		{1653, 3248},
		{1648, 3244},
		{1660, 3254},
		{1634, 3271},
		{1629, 3266},
		{1634, 3271},
		{1660, 3240},
		{1661, 3243},
	},
	resetPos = {1644, 3257},
	npcMod = {
		{"明教探子地", "围观的明教探子"},
		{"天阴巫师1", "天阴巫师"},
		{"天阴教狂热者", "天阴教狂热者", 10},

		{"千军地", "千军", },
		{"万马地", "万马", },

		{"南宫晚晚地", "南宫晚晚"},
		{"南宫紫娟地", "南宫紫娟"},

		{"林冲地","豹子头林冲"},

		{"柳轩地", "峨嵋柳轩"},
		{"刘如风地", "武当刘如风"},
	},
}

--------------------------------------------------------------------
function tStage1:onInit()
	stageAction("p0");
	tStageBase:onInit();
end

function tStage1:createChar(nId)
	local npcMod = self.npcMod[nId];
	if not npcMod then
		print(format("[phase1_2:createChar] [error id] [id = %s]", tostring(nId)));
		return
	end
	local npcIdx = CreateNpc(npcMod[1], npcMod[2], self:GetPos(nId));
	SetNpcScript(npcIdx, g_theMS.fileName);
	if npcMod[3] then
		SetNpcLifeTime(npcIdx, npcMod[3]);
	end
	SetCampToNpc(npcIdx, CampEnemy);
	return npcIdx;
end

function tStage1:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStage1:onTimerOver()
	g_theMS:Close()
end

tStage1.rule["timerover"] = tStage1.onTimerOver;

function tStage1:giveAward(nNpcIdx, nBossCount)

	g_theMS.msCamp[1]:turnPlayer(giveStageExpAward) 		--经验
	g_theMS.msCamp[1]:turnPlayer(giveStageDaiBiAward, 1); 	--代币
	--翻盘奖励
	local opui = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 1));
	end
	g_theMS.msCamp[1]:turnPlayer(opui);

	local nFlag = GetMissionV(MV_L1_SPE_FLAG);
	local nLv = floor(nFlag / 10);
	nFlag = mod(nFlag, 10);
	if nFlag > 0 then
		g_theMS.msCamp[1]:turnPlayer(function ()
			local level = GetLevel();
			local nExp = floor(level * level * 30 / 2 * %nFlag);
			ModifyExp(nExp);
			local msg = {
				"击败千军和万马将获得额外%d经验值奖励。",
				"击败绝尘双侠将获得额外%d经验值奖励。",
				"协助豹子头林冲将获得额外%d经验值奖励。",
			}
			msg = msg[%nLv];
			Msg2Player(format(msg, nExp));
		end)
	else
		local msg = {
			"未能击败千军和万马无法获得额外的经验值奖励。",
			"未能击败绝尘双侠无法获得额外的经验值奖励。",
			"未能协助豹子头林冲无法获得额外的经验值奖励。",
		}
		msg = msg[nLv];
		g_theMS:Msg2MSAll(msg);
	end
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 1)
end

function tStage1:event1()
	local npc = findNpc("天阴巫师");
	NpcChat(npc, "一支穿云箭，千军万马来相见！");
	local npc1 = self:createChar(5);
	NpcChat(npc1, "谁丢的砸到我兄弟！");
	local npc2 = self:createChar(4);
	NpcChat(npc2, "那个谁，是不是你扔的？");
	g_theMS:Msg2MSAll("敌方增援，过关前消灭千军及万马有额外奖励");
	SetMissionV(MV_L1_SPE_FLAG, 10);
end
function tStage1:event2()
	local npc = findNpc("天阴巫师");
	NpcChat(npc, "巡逻的喽啰说没错，那边穿白色衣服的两个女孩对我很好，嘿！ ");
	local npc1 = self:createChar(6);
	NpcChat(npc1, "姐姐，那个该死的老东西看我们都流口水了！");
	SetCampToNpc(npc1, CampNeutral);
	local npc2 = self:createChar(7);
	SetCampToNpc(npc2, CampNeutral);
	local players = g_theMS.msCamp[1].players;
	PlayerIndex = randomin(players);
	NpcChat(npc2, format("这个%s欺负我们！我们必须报仇！", GetName()));
	g_theMS:Msg2MSAll("敌方增援，过关前击败绝尘双侠有额外奖励");
	SetMissionV(MV_L1_SPE_FLAG, 20);
end

function tStage1:event3()
	local npc = findNpc("天阴巫师");
	NpcChat(npc, "多么厉害的骑兵啊！你们是谁？");
	local npc = self:createChar(8);
	SetCampToNpc(npc, CampPlayer);
	NpcChat(npc, "据说这个地方是极其隐秘，但是谣传却不断，宋江给我的特殊任务让我来这里看看!");
	g_theMS:Msg2MSAll("过关前协助豹子头林冲完成任务有额外奖励");
	SetMissionV(MV_L1_SPE_FLAG, 32);
end

-------等待开启阶段------------------------------------------------------
function phase1_1:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"时间进度条", 460, 0);
--	stageAction("p1");
--	g_theMS:Msg2MSAll("你的队伍已经进入地玄宫前殿，队长与被抓的天阴教徒对话可开启关卡。");
end

function phase1_1:onTimer(nStep)
	if nStep > self.stepLimit then
		stageAction('p1');
		return
	end
	if nStep == 1 then
		local npc = getStage():createChar(2);
		g_NpcAI:setAI(npc, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(npc, {{1644, 3257}});
		NpcChat(npc, "大胆狂徒，敢来地玄宫捣乱！");
	elseif nStep == 6 then
		local tRate = {
			{40, tStage1.event1},
			{40, tStage1.event2},
			{20, tStage1.event3},
		}
		gf_RandRate(tRate)[2](tStage1);
	end

end

function phase1_1:onTalk(npcIdx)
	if PlayerIndex ~= GetTeamMember(0) then
		return
	end
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
--	SetMissionV(MV_DXG_STAGE_CNT, 1)
	local tSel = {
		"快点把你的主人叫来/#onStageAction('p1')",
		"打探情况/info1_1",
		"结束对话/nothing"
	}
	Say("<color=green>明教探子<color>：请不要伤害我，我会按你的要求来做。", getn(tSel), tSel);
end
function onStageAction(szAct)
	stageAction(szAct)
end

function info1_1()
	Talk(1, "", "前面的屋子里有许多旋锯，很多的被困的武林人士都在逃跑中遇害了。里面还有个厉害的狱卒，切记，狱卒一死机关就会全部发动，所有武林人士将会会困死在里面！");
end

function phase1_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
function phase1_1:onNpcDeath(npcIdx)
	phase1_2:onNpcDeath(npcIdx)
end


--------杀怪阶段-------------------------------------------------
function phase1_2:onInit()
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	local nMapID = g_theMS:GetMissionV(MV_MAP_ID);
end

function phase1_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		self:finish()
		return
	end
end
function phase1_2:finish()
	g_theMS:action('missionfinish');
end

function phase1_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--每日任务-杀怪
	local npcName = GetNpcName(npcIdx);
	if npcName == "天阴巫师" then
		ClearMapNpc(g_theMS:getMapId(), nil);
		local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
		g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
		getStage():giveAward(npcIdx, nBossCount);
		stageAction("p2");
	elseif npcName == "千军" or npcName == "万马" or npcName == "南宫晚晚" or npcName == "南宫紫娟" then
		SetMissionV(MV_L1_SPE_FLAG, GetMissionV(MV_L1_SPE_FLAG) + 1);
	elseif npcName == "豹子头林冲" then
		SetMissionV(MV_L1_SPE_FLAG, GetMissionV(MV_L1_SPE_FLAG) - 2);
	end
end

function phase1_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------本关结束----------------------------------------------------
function phase1_3:onInit()
	--Observer:onEvent(OE_DIXUANGONG_Mission, 1);
	--ds_DXG:AddStatValue(1,3,1);
	reviveAll();
--	g_theMS.msCamp[1]:turnPlayer(sjzx_add_friendly,10);
--	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("经过一番挣扎，天阴巫师终于被你们推倒了。");
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -1);
end

function phase1_3:onTimer(nStep)
	if nStep > self.stepLimit then
--		stageAction('missionfinish');
		return
	end
	if nStep == 1 then
		local npc = getStage():createChar(9);
		SetCampToNpc(npc, CampPlayer);
		local npc2 = getStage():createChar(10);
		SetCampToNpc(npc2, CampPlayer);
		SetNpcLifeTime(npc2, 60);
	elseif nStep == 2 then
		local npc2 = findNpc("武当刘如风");
		NpcCommand(npc2, NPCCOMMAND.do_beatdown, 8, 3 * 18);
		NpcChat(npc2, "妹妹你快走，啊！");
		AddUnitStates(npc2, 8, -1000);
		local npc = findNpc("峨嵋柳轩");
		SetNpcActivator(npc);
		NpcChat(npc, "我不走，姐妹们还都在里面呢！呜鸣……");
		NpcCommand(npc, NPCCOMMAND.do_beatdown, 8, 3 * 18);
	elseif nStep == 5 then
		local npc2 = findNpc("武当刘如风");
		if random(100) < 5 then
			NpcChat(npc2, "哦~~~再次...（为什么说？！）");
		end
		Death(1, npc2);
	elseif nStep == 6 then
		local npc = findNpc("峨嵋柳轩");
		ChangeNpc2Talk(npc);
		NpcChat(npc, "各位大侠，各大门派高手现被困在地玄宫中，还望江湖救急！");
		SetNpcScript(npc, g_theMS.fileName);
		g_theMS:Msg2MSAll("请与峨嵋柳轩对话");
	end
end

function phase1_3:onTalk()
	local npc = GetTargetNpc();
	local tSel = {
		"我等来助你救人/p13_gogogo",
		"打探情况/p13_next_info",
		"结束对话/nothing",
	}
	if not isCaption() then
		tremove(tSel, 1);
	end
	Say("<color=green>峨嵋柳轩<color>：呜呜，我可怜的姐妹呀~", getn(tSel), tSel);
end

function p13_next_info()
	Talk(1, "", "前面的屋子里有许多旋锯，很多的同门姐妹都在逃跑中遇害了。里面还有个厉害的狱卒，快帮帮我们吧！切记，狱卒一死机关就会全部发动，所有武林人士将会会困死在里面！");
end

function p13_gogogo()
	g_theMS:action("s2")
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
	setCurStage(2)
end

function phase1_3:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end
--------------------------------------------------------------------

tStage1 = gf_CopyInherit(tStageBase, tStage1);
