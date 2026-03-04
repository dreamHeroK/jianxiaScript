
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 随机任务头文件
-- Edited by peres
-- 2005/08/08 PM 13:45

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

-- 读入随机任务头文件
Include("\\script\\task\\random\\task_head.lua");

function main()

	-- 五分之一的概率触发随机事件
--	if random(1,5)~=1 then
--		return	
--	end;
	
	ShowTaskNpc();   -- 显示任务信息
	
end;


-- 杀怪结束时的回调
function finish_kill()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- 得到任务 NPC 所在地图ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- 得到任务 NPC 的名字
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- 得到任务 NPC 所在地图中文名

local nKillIndex = GetTask(TASKKILL_ID); -- 获取杀怪触发器的索引

	Msg2Player("你已经完成任务了，快回去。"..strNpcMap.."寻求"..strNpcName.."“领取奖励！”");
	
	RemoveTrigger(GetRunningTrigger()); -- 删除当前正在运行的触发器
	RemoveTrigger(nKillIndex); -- 为防止没有移除成功再删一次
	
	CreateTrigger(4, nNpcID, EVENT_NPC_ID); -- 创建新触发器让玩家去找原来的 NPC
		
	Say("你已经完成任务了，快回去。"..strNpcMap.."寻求"..strNpcName.."“领取奖励！”",
		2,
		"快送我回去！/#AcceptTask("..nNpcMapID..")",
		"我自己去！/Main_Exit");

end;


-- 到了 15 分钟的时间后触发这个检查函数
function timercheck()

local nTimerIndex = GetTask(TASKTIMER_ID);
local nLost = GetTask(TASKCANCEL_ID);

	if GetTask(TASKSTATE_ID)==0 then return end;

	PauseTimer(nTimerIndex);
	RemoveTrigger(nTimerIndex); -- 删除当前正在运行的触发器


	-- 如果任务还没有完成
	if GetTask(TASKSTATE_ID)~=3 then
		nLost = nLost + 1;
		Say("过了师门任务时间，现在还没做完",0);
		if nLost>=2 then
			nLost = 0;
			SetTask(TASKCANCEL_ID, nLost); -- 将累积失败次数清空
			SetTask(TASKSTATE_ID, 0); -- 将任务状态变为还未开始			
			-- 任务处罚
			TaskPunish();
			return
		end;
		SetTask(TASKCANCEL_ID, nLost);
		SetTask(TASKSTATE_ID, 0); -- 将任务状态变为还未开始
	end;

end;