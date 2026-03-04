-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 门派boss开启包裹脚本
-- 文件名：boss_baoguo.lua
-- Edited by 
-- 2020/09/23 AM 21:46
-- ======================================================
Include("\\script\\task\\faction_boss\\faction_boss_define.lua");

TASK_ID_LAST_GET_DATE = 88			-- 上次领取任务的时间，任务变量ID
TASK_ID_HAVE_GOT_TODAY = 89			-- 今天是否已经领取了任务,任务变量ID

-- 初始对话入口
function main()
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- 上次接任务是什么时候
	local nCurrTime = {date("%y"), date("%m"), date("%d")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	
	local nCurNpcIndex = GetTargetNpc()
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- 此段防刷
	
	
	if (nLastGetTaskDate < nCurDay) then	-- 今天还没有领取任务
		Talk(1,"", "你今天还没有报名申请试炼，不能打开这个包裹。");
		AddUnitStates(nCurNpcIndex, 0, -100)		-- 此段防刷
		return
	end
	local nFacBOX = GetUnitCurStates(nCurNpcIndex, 6)
	
	-- 没有入流派就不能开箱子
	local nFac = GetPlayerFaction();
	local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
	local nRoute = GetPlayerRoute();
	local nRouteFlag = 0
	if nRoute > 0 then
		for _, ckRoute in tbRouteTable do
			if ckRoute == nRoute then
				nRouteFlag		= 1;	-- Route标识
			end
		end
	end
	if nRouteFlag ~= 1 then
		Talk(1,"", "少侠还没有加入任何流派，不能打开这个包裹。");
		AddUnitStates(nCurNpcIndex, 0, -100)		-- 此段防刷
		return
	end;
	
	-- 今天已经拣取了一个
	local nCanGotBox = GetTask(TASK_ID_HAVE_GOT_TODAY)
	if (nCanGotBox == 0) then
		Talk(1,"", "对不起，你今天已经打开过一个包裹，不能再打开了。");
		AddUnitStates(nCurNpcIndex, 0, -100)		-- 此段防刷
		return
	end

	--奖励
	gf_Modify("Exp", 500000);
	local tAward = {
		{1, 1000, "般若树种", {2,0,398,1,1}, 0},
		{1, 1000, "神器", {2,95,55,1,1}, 0},
		{1, 1500, "灵石宝箱", {2,95,5435,1,1}, 0},
		{1, 1000, "大人参果", {2, 0, 552, 1, 1}, 0},
		{1, 1000, "修真要诀", {2, 0, 554, 1, 1}, 0},
		{1, 500, "凌波微步残本", {2,95,146,1}, 0},
		{1, 600, "陨铁碎片", {2,2,7,10}, 0},
		{1, 1000, "陨铁", {2,2,8,5}, 0},
		{1, 600, "陨铁精石", {2,1,1009,1}, 0},
		{1, 500, "军功章", {2,1,9999,1}, 0},
		{1, 200, "大军功章", {2,1,9998,1}, 0},
		{1, 50, "辉煌军功章", {2,1,9977,1}, 0},
		{1, 1000, "金钱袋", {2,95,662,10}, 0},
		{31, 100, "vaf_GiveFactionBook70()", ""},
		{31, 50, "vaf_GiveWenLingLevel1()", ""},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS 掉落", "BOSS击杀奖励")

	local nTempRND = random(1, 100)
	if nTempRND <= 90 then
		Earn(50000)
		ModifyExp(1000000)
	elseif nTempRND == 99 or nTempRND == 100 then
		if nFac == nFacBOX then
			local tbBOX = tAwardBox[nFac]
			local nRet, nIndex = AddItem(tAwardBox[1],tAwardBox[2],tAwardBox[3],1,1) 
			Msg2Player("您获得了["..tAwardBox[4].."]×1");
			Msg2SubWorld("玩家"..GetName().."获得了"..tAwardBox[4].."。");
		end
		Earn(200000)
		ModifyExp(3000000)
	else
		Earn(100000)
		ModifyExp(2000000)
	end

	-- 把自己删除
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetTask(TASK_ID_HAVE_GOT_TODAY, 0)
end;
