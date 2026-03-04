--------------------------------------------------------------------
-- 地玄宫 第3关
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\tstage.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
--------------------------------------------------------------------
--tPhaseBase = {
--}
--
--phasexx_1 = gf_CopyInherit(tPhaseBase, {
--})

phasexx_1 = {
	stepInterval = 1,
	stepLimit = 180,
};
phasexx_2 = {
	stepInterval = 30,
	stepLimit = 600,
};
phasexx_3 = {
	stepInterval = 60,
	stepLimit = 1,
};

--------------------------------------------------------------------
tStageXX = {
	tPhases = {
		phasexx_1,
		phasexx_2,
		phasexx_3,
	},

	rule = {
		["p0"] = 1,
		["p1"] = 2,
		["p2"] = 3,
	},
	pos = {
		{1715, 3188},

		{1721, 3168},
	},
	resetPos = {1721, 3168},
	npcMod = {
		{"明教探子地", "围观的明教探子"},
		{"青铜宝箱", "铜宝箱", 180},

	},
	bossMod = {
		{1430, "红旗精地", "天阴教红旗精英", 1},
		{1430, "黑旗精地", "天阴教黑旗精英", 1},
		{1430, "蓝旗精地", "天阴教蓝旗精英", 1},
		{1430, "黄旗精地", "天阴教黄旗精英", 1},
		{1430, "白旗精地", "天阴教白旗精英", 1},
		{510 , "红旗主地", "红旗旗主", 2},
		{510 , "黑旗主地", "黑旗旗主", 2},
		{510 , "蓝旗主地", "蓝旗旗主", 2},
		{510 , "黄旗主地", "黄旗旗主", 2},
		{510 , "白旗主地", "白旗旗主", 2},
		{100 , "雷堂主地", "雷堂堂主", 3},
		{100 , "火堂主地", "火堂堂主", 3},
		{100 , "风堂主地", "风堂堂主", 3},
	},
	bossMod2 = {
		{1440, "红旗精地", "天阴教红旗精英", 1},
		{1440, "黑旗精地", "天阴教黑旗精英", 1},
		{1430, "蓝旗精地", "天阴教蓝旗精英", 1},
		{1430, "黄旗精地", "天阴教黄旗精英", 1},
		{1430, "白旗精地", "天阴教白旗精英", 1},
		{500 , "红旗主地", "红旗旗主", 2},
		{500 , "黑旗主地", "黑旗旗主", 2},
		{500 , "蓝旗主地", "蓝旗旗主", 2},
		{500 , "黄旗主地", "黄旗旗主", 2},
		{500 , "白旗主地", "白旗旗主", 2},
		{100 , "雷堂主地", "雷堂堂主", 3},
		{100 , "火堂主地", "火堂堂主", 3},
		{100 , "风堂主地", "风堂堂主", 3},
		{15 ,  "婉柔云地",  "婉柔云", 4},
		{15 ,  "婉清儿地",  "婉清儿", 4},
	},
	bossMod3 = {
		{25 ,  "婉柔云地",  "婉柔云", 4},
		{25 ,  "婉清儿地",  "婉清儿", 4},
	},
--	stepLimit = 600,
}

--------------------------------------------------------------------
function tStageXX:onInit()
	g_theMS.msCamp[1]:turnPlayer(SetPos,self.resetPos[1], self.resetPos[2]);
	tStageBase:onInit();
	g_theMS:SetMissionV(MV_BOSS_COUNT, 0);
	stageAction("p0");
end

function tStageXX:createChar(nId)
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

function tStageXX:createBoss()
	bossMod = self.bossMod;
	if GetTask(TASKID_DXG_SCORE) >= 400 then
		bossMod = self.bossMod3;
--	if GetTask(TASKID_DXG_SCORE) >= 50 then
--		bossMod = self.bossMod2;
	end
	local npcMod = gf_RandRate(bossMod);
	local npc = CreateNpc(npcMod[2], npcMod[3], self:GetPos(2));
	SetNpcScript(npc, g_theMS.fileName);
	SetCampToNpc(npc, CampEnemy);
	SetMissionV(MV_SP_BOSS_LV, npcMod[4]);
	if npcMod[4] == 4 then
--		SetTask(TASKID_DXG_SCORE, 0, TASK_ACCESS_CODE_DXG_MISSION);
	end
	return npc;
end

function tStageXX:GetPos(n)
	local pos = self.pos[n];
	return g_theMS:GetMissionV(MV_MAP_ID), pos[1], pos[2];
end

function tStageXX:onTimerOver()
	g_theMS:Close()
end
tStageXX.rule["timerover"] = tStageXX.onTimerOver;

function tStageXX:giveAward(nNpcIdx, nBossCount)
	local bossLv = GetMissionV(MV_SP_BOSS_LV);
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT);

	g_theMS.msCamp[1]:turnPlayer(giveStageExpAward) 		--经验
	g_theMS.msCamp[1]:turnPlayer(giveStageDaiBiAward, 3+nBossCount); 	--代币
	--翻盘奖励
	local opui_1 = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 4));
	end
	local opui_2 = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 5));
	end
	local opui_3 = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 6));
	end
	local opui_4 = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 7));
	end
	local opui_5 = function()
		SendScript2VM("\\script\\missions\\dixuangong\\mission_head.lua", format("dxg_OpenUi(%d)", 8));
	end
	if nBossCount == 1 then
		g_theMS.msCamp[1]:turnPlayer(opui_1);
	elseif nBossCount == 2 then
		g_theMS.msCamp[1]:turnPlayer(opui_2);
	elseif nBossCount == 3 then
		g_theMS.msCamp[1]:turnPlayer(opui_3);
	elseif nBossCount == 4 then
		g_theMS.msCamp[1]:turnPlayer(opui_4);
	elseif nBossCount >= 5 then
		g_theMS.msCamp[1]:turnPlayer(opui_5);
	end

	for i = 1, 1 do
		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
		local npcMod = self.npcMod[2];
		local npcName = {
			"精英宝箱",
			"五旗宝箱",
			"三堂宝箱",
			"凝月宝箱",
		};
		npcName = npcName[bossLv];
		local npc = CreateNpc(npcMod[1], npcName, m, x2, y2);
		if npcMod[3] then
			SetNpcLifeTime(npc, npcMod[3]);
		end
		SetNpcScript(npc, g_theMS.Box);
	end
	Observer:onTeamEvent(SYSEVENT_DIXUANGONG_STAGE_FINISH, 3+nBossCount)
end

-------等待开启阶段------------------------------------------------------
function phasexx_1:onInit()
	reviveAll();
	g_theMS.msTimer:setInterval(self.stepInterval);
	getStage():createChar(1)
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage, "开启关卡限制", 180, 0)
	g_theMS:Msg2MSAll("明教探子似乎掌握了更多的线索，可探之！");
end

function phasexx_1:onTimer(nStep)
	if nStep >= self.stepLimit then
		g_theMS:action('missionfinish');
		return
	end
end

function phasexx_1:onTalk(npcIdx)
	local tSel = {
		"追踪地玄宫幕后黑手 (需要2个天骄令)/perStart",
		"查看地玄宫幕后黑手名单/info_xx",
		"今天就算了，离开关卡/perEnd",
		"结束对话/nothing",
	}
	if not isCaption() then
		tremove(tSel,3);
	end
	Say("围观的明教探子：大恩不言谢，各位大破地玄宫的事迹必当传为佳话！", getn(tSel), tSel);
end

function info_xx()
	Talk(1, "", "围观的明教探子：地玄宫幕后黑手名单：\n 婉清儿, 婉柔云, 风堂堂主, 火堂堂主, 雷堂堂主 \n 白旗旗主, 黄旗旗主, 蓝旗旗主, 黑旗旗主, 红旗旗主 \n 天阴教白旗精英, 天阴教黄旗精英, 天阴教蓝旗精英, 天阴教黑旗精英, 天阴教红旗精英")
end

function perStart()
	if GetMissionV(MV_SP_DAYE) ~= 0 then
		g_theMS:Msg2MSAll("无法开启下一关，请先打开宝箱");
		return
	end
	
	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT);
	if nBossCount >= 4 then
		Talk(1,"","已经战胜了4个地玄宫幕后黑手，可离开关卡了。");
		return 0;
	end
	
	SetMissionV(MV_DXG_ROUTE_CNT, getRouteCount())
	setCurStage(5 + nBossCount)

	if GetMissionV(MV_PHASE) == 1 then
		if GetItemCount(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3]) < N_CALL_BOSS_TIANJIAOLING_NEED then
			Msg2Player(format("你身上没有%d个%s",N_CALL_BOSS_TIANJIAOLING_NEED, T_TIANJIAOLING[4]));
			return
		end
		if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED) ~= 1 then return end
		SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + N_CALL_BOSS_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
		
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
		SetMissionV(MV_SP_DAYE, PlayerIndex);
		stageAction('p1');
		
		--搜索地玄宫幕后黑手次数统计
		AddRuntimeStat(1,12,0,1);
		--地玄宫消耗通天令牌数量统计
		AddRuntimeStat(1,13,0,N_CALL_BOSS_TIANJIAOLING_NEED);
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED})
	end
end
function perEnd()
	if not isCaption() then
		Msg2Player("只有队长才能带领大家离开关卡");
	end
	
	if GetMissionV(MV_SP_DAYE) ~= 0 then
		perEnd_Talk();
		return
	end

	if GetMissionV(MV_PHASE) == 1 then
		g_theMS:action("missionfinish")
	end
end

function perEnd_Talk()
	Say("你还没打开宝箱，确定要离开关卡吗？", 2, "确定/perEnd2", "我再看看/do_nothing")
end

function perEnd2()
	if not isCaption() then
		Msg2Player("只有队长才能带领大家离开关卡");
	end
	
	if GetMissionV(MV_PHASE) == 1 then
		g_theMS:action("missionfinish")
	end
end

function phasexx_1:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------杀怪阶段-------------------------------------------------
function phasexx_2:onInit()
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:onTimer();
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage,-2);
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage,"时间进度条", self.stepLimit, 0);
	getStage():createBoss();

end

function phasexx_2:onTimer(nStep)
	nStep = (nStep - 1) * self.stepInterval;
	if nStep >= self.stepLimit then
		self:finish()
		return
	end
end

function phasexx_2:finish()
	getStage():action("p2");
end

function phasexx_2:onNpcDeath(npcIdx)
	g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 3, npcIdx);--每日任务-杀怪
	local npcName = GetNpcName(npcIdx);

	local nBossCount = g_theMS:GetMissionV(MV_BOSS_COUNT) + 1;
	g_theMS:SetMissionV(MV_BOSS_COUNT, nBossCount);
	ClearMapNpc(g_theMS:getMapId(), nil);
	g_theMS.msCamp[1]:turnPlayer(StopTimeGuage, -2);
	getStage():giveAward(npcIdx, nBossCount);

	stageAction('p0');
	
	if 4 == nBossCount then
		g_theMS.msCamp[1]:turnPlayer(dxg_task_check_and_finish_task, 2, npcIdx);--每日任务-全部通关
		--全通总人数统计
		AddRuntimeStat(1,3,0,gf_GetTeamSize());
		--全通次数统计
		AddRuntimeStat(1,9,0,1);
		
		--地玄宫通7关
		g_theMS.msCamp[1]:turnPlayer(_vc_DXG_Pass_7, 0);
	end
end
function phasexx_2:onTrap(nId)
	local pos = getStage().resetPos;
	SetPos(pos[1], pos[2]);
end

--------本关结束----------------------------------------------------
function phasexx_3:onInit()
	g_theMS.msTimer:setInterval(self.stepInterval);
	g_theMS:Msg2MSAll("经过不懈的努力。你们已经成功闯过了地玄宫，少阳和文史两派将记载你们的功绩。")
	g_theMS.msCamp[1]:turnPlayer(StartTimeGuage, "离开时间", 60, 0);
end

function phasexx_3:onTimer(nStep)
	g_theMS:action("missionfinish")
end

--------------------------------------------------------------------

tStageXX = gf_CopyInherit(tStageBase, tStageXX);
