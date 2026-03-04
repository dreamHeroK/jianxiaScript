
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

local nState = GetTask(TASKSTATE_ID);
	
local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local strInfo   = tabTask:getCell(nRow, "TaskText");
local strName = GetTargetNpcName();

if nState == 0 then
	WriteLog("师门任务错误：inceptnpc.lua角色状态参数错误，nstate等于0角色名称："..GetName())
end;

if strName==nil or strName=="" then strName = ""; end;

	-- 如果是进行到任务的第一步，则告诉玩家任务的信息
	if nState==1 then
		RemoveTrigger(GetRunningTrigger()); -- 删除当前正在运行的触发器
		CDebug:MessageOut("完成人物对话！");
		ShowTask();
		return
	end;
	
	-- 如果已经接受了 NPC 的任务，则开始检测任务是否完成
	if nState==2 then
		if CheckTask()==1 then
			RemoveTrigger(GetRunningTrigger()); -- 删除当前正在运行的触发器
			CDebug:MessageOut("完成人物对话！");
			FinishTask();
		else
			-- 没有完成任务的话则继续之前的任务信息对话
			Say("<color=green>"..strName.."<color>: "..strInfo, 0);
		end;
		return
	end;
	RemoveTrigger(GetRunningTrigger()); -- 删除当前正在运行的触发器
end;