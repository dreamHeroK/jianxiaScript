
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


-- 表格文件类的支持以及地图跳转的支持
Include("\\script\\task\\random\\task_gotoworld.lua");

-- 读入任务引擎 DEBUG 支持文件
Include("\\script\\lib\\task_debug.lua");

-- 数据文件的支持
Include("\\script\\task\\random\\task_data.lua");

-- 辉煌之夜
Include("\\script\\shinynight_head.lua");

tabNpcName   = new(KTabFile, "\\settings\\task\\random\\task_npc.txt");  -- NPC 名字表格
tabTaskType  = new(KTabFile, "\\settings\\task\\random\\task_type.txt"); -- 任务类型总表
tabTalkTask  = new(KTabFile, "\\settings\\task\\random\\task_talk.txt"); -- 对话任务细表
tabKillTask  = new(KTabFile, "\\settings\\task\\random\\task_kill.txt"); -- 杀怪任务细表
tabCollTask  = new(KTabFile, "\\settings\\task\\random\\task_coll.txt"); -- 收集任务细表

TASKNPC_ID      = 550; -- 任务 NPC 的 ID
TASKSTATE_ID    = 551; -- 任务进展程度的 ID
TASKTYPE_ID     = 552; -- 任务类型的 ID
TASKID_ID       = 553; -- 具体任务的 ID
TASKCANCEL_ID   = 554; -- 任务取消累积次数的 ID
TASKRANDOM_ID   = 555; -- 任务随机种子记录
TASKTIMER_ID    = 556; -- 记录时间触发器的索引
TASKKILL_ID     = 557; -- 记录杀怪任务触发器的索引

EVENT_NPC_ID    = 100; -- 与 NPC 对话的触发器 ID
EVENT_TIMER_ID  = 101; -- 15 分钟期限的计算 ID


-- 特殊奖励
  speAward1 = {

    {"长拳谱", 0,	107, 51},
       {"象形谱", 0, 107, 52},
      {"中平浦", 0,	107, 53},
      {"开山谱", 0,	107, 54},
     {"气体疗法", 0,	107, 55},
      {"碎叶谱", 0,	107, 56},
      {"聚愿功谱", 0,	107, 57},
       {"玄石功谱", 0,	107, 58},
  
  }
  
  speAward2 = {
      {"长拳谱", 0,	107, 51},
       {"象形谱", 0, 107, 52},
      {"中平浦", 0,	107, 53},
      {"开山谱", 0,	107, 54},
     {"气体疗法", 0,	107, 55},
      {"碎叶谱", 0,	107, 56},
      {"聚愿功谱", 0,	107, 57},
       {"玄石功谱", 0,	107, 58},
      {"金蝉谱", 0,	107, 59},
       {"修罗密寂", 0,	107, 60},
      {"补金密寂", 0,	107, 61},
      {"补石密寂", 0,	107, 62},
     {"五鬼密席", 0,	107, 63},
  
  }
  
  speAward3 = {
      {"长拳谱", 0,	107, 51},
       {"象形谱", 0, 107, 52},
      {"中平浦", 0,	107, 53},
      {"开山谱", 0,	107, 54},
     {"气体疗法", 0,	107, 55},
      {"碎叶谱", 0,	107, 56},
      {"聚愿功谱", 0,	107, 57},
       {"玄石功谱", 0,	107, 58},
      {"金蝉谱", 0,	107, 59},
       {"修罗密寂", 0,	107, 60},
      {"补金密寂", 0,	107, 61},
      {"补石密寂", 0,	107, 62},
     {"五鬼密席", 0,	107, 63},
      {"天河密寂", 0,	107, 64},
     {"紫霞密寂", 0,	107, 65},
      {"詹伊普", 0,	107, 66},
  
}

--师门秘笈，心法
  FactionBook = {
	--金刚伏魔经,金刚伏魔心法,少林令牌
   [2] = {{0,107,1},{0,107,2},{2,0,205},"少林"},
	--无尘秘籍,无尘心法,少林令牌    
   [3] = {{0,107,5},{0,107,6},{2,0,205},"少林"},
	--潜龙秘籍,潜龙心法,少林令牌
   [4] = {{0,107,3},{0,107,4},{2,0,205},"少林"},
	--天罗秘籍,天罗心法,唐门令牌
   [6] = {{0,107,7},{0,107,8},{2,0,209},"唐门"},
	--如意秘籍,如意心法,峨嵋令牌
   [8] = {{0,107,9},{0,107,10},{2,0,207},"峨眉"},
	--碧海谱,碧海心法,峨嵋令牌
   [9] = {{0,107,11},{0,107,12},{2,0,207},"峨眉"},
	--混沌秘籍,混沌心法,丐帮令牌
   [11] = {{0,107,13},{0,107,14},{2,0,208},"丐帮"},
	--揆天秘籍,揆天心法,丐帮令牌
   [12] = {{0,107,15},{0,107,16},{2,0,208},"丐帮"},
	--幻影秘籍,幻影心法,武当令牌
  [14] = {{0,107,17},{0,107,18},{2,0,206},"武当"},
	--君子秘籍,君子心法,武当令牌
  [15] = {{0,107,19},{0,107,20},{2,0,206},"武当"},
	--枪骑秘籍,枪骑心法,杨门令牌
   [17] = {{0,107,21},{0,107,22},{2,0,350},"杨门"},
	--弓骑秘籍,弓骑心法,杨门令牌
   [18] = {{0,107,23},{0,107,24},{2,0,350},"杨门"},
	--邪侠秘籍，邪侠心法,五毒令牌
  [20] = {{0,107,25},{0,107,26},{2,0,390},"五毒"},
	--蛊师秘籍，蛊师心法,五毒令牌
  [21] = {{0,107,27},{0,107,28},{2,0,390},"五毒"},
}

-- 从任务类型表中根据权重选择一个任务类型
function SelectTaskType()
    
local nLevel      = SelectPlayerLevel(); -- 选择一个任务区间
local aryRate     = tabTaskType:createArray("Rate"..nLevel); -- 构造一个数组
local nRow        = GetRateForArray(aryRate);
    
local nTaskType   = tonumber(tabTaskType:getCell(nRow, "TaskType"));
	  
	CDebug:MessageOut("收到任务类型："..nTaskType);
	return nTaskType;
    
end;
    
    
-- 根据任务类型选取一个具体的任务
function SelectTask(nTaskType)

local nLevel      = SelectPlayerLevel(); -- 选择一个任务区间
local tabTaskFile = GetTaskTableFile(nTaskType);
local aryRate = {};
local nRow = 0;

	aryRate = tabTaskFile:createArray("Rate"..nLevel);
	nRow    = GetRateForArray(aryRate);
	
	CDebug:MessageOut("收到具体任务："..nRow);
	return nRow;

end;


-- 从人物列表中选择一个任务人物
function SelectTaskNpc()

local nRow = tabNpcName:getRow();
local nRandom = random(3, nRow);
local nNpcID = tabNpcName:getCell(nRandom, "NpcID");

	CDebug:MessageOut("得到任务NPC的ID："..nNpcID);
	return nNpcID, nRandom;

end;


-- 告诉玩家任务接口 NPC，任务状态为：1
function CreateTask()
	local nNpcID, nRow   = SelectTaskNpc();   -- 得到任务 NPC 的ID 和行数
	local nTaskType      = SelectTaskType();           -- 得到一个任务的类型
	local nRow           = SelectTask(nTaskType);      -- 得到一个任务的具体行号
	local tabTask        = GetTaskTableFile(nTaskType);
	local nTaskID        = tabTask:getCell(nRow, "TaskID"); -- 获取 ID
	local nTimerIndex    = 0;
	
	CDebug:MessageOut("任务类型："..nTaskType.."任务行数："..nRow);
	if CreateTrigger(4, nNpcID, EVENT_NPC_ID) == 0 then
		WriteLog("师门任务错误：taskhead.lua函数中的CreateTask错误，CreateTrigger4。nNpcID，EVENTNPCID），值nNpcID："..nNpcID.."。名字"..GetName());
		return 0;	--创建失败
	end;
	CDebug:MessageOut("开始出现：NPC ID："..nNpcID);
	-- 将任务的内容记录到任务变量中
	SetTask(TASKTYPE_ID, nTaskType);
	SetTask(TASKID_ID, nTaskID);
	SetTask(TASKNPC_ID, nNpcID);
	SetTask(TASKSTATE_ID, 1);
		
	nTimerIndex = CreateTrigger(1, 100, EVENT_TIMER_ID); -- 开始一个时间计数器
	
	ContinueTimer(nTimerIndex);
	SetTask(TASKTIMER_ID, nTimerIndex);
	
	-- 如果身上没有信函的话那就加上一封
	if GetItemCount(2,0,135)<=0 then
		AddItem(2,0,135,1);
	end;
	
	CDebug:MessageOut("建立任务完成，任务计算为1");
	return 1;
end;


-- 告诉玩家任务 NPC 的位置
function ShowTaskNpc()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- 得到任务 NPC 所在地图ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- 得到任务 NPC 的名字
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- 得到任务 NPC 所在地图中文名

local strBossName    = FactionBossName[GetPlayerFaction()];
local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

                              Say("你收到信鸽的信"..strBossTitle.."信鸽"..strBossName.."请你到coloryellow>"..strNpcMap.."颜色>查找颜色黄色>"..strNpcName.."color>，这个人需要你的帮助，同时嘱咐你无论如何都要完成分配的任务！",
3,
      "接受任务并前往那个地方/#AcceptTask("..nNpcMapID..")",
      "“我有事，改天吧！”/Main_Exit",
  "拒绝任务/CancelTask_Confirm");
end;


-- 由任务 NPC 告诉玩家任务的详细情况，任务状态为 2
function ShowTask()

local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);
local nMapID    = tabTask:getCell(nRow, "MapID");

local strInfo   = tabTask:getCell(nRow, "TaskText");
local strName = GetTargetNpcName();

	if strName==nil or strName=="" then 
		strName = ""; 
	end;
	
	SetTask(TASKSTATE_ID, 2); -- 将任务进程设为 2
	
	StartTaskEvent(nTaskType, nTask); -- 开始任务所必须的触发器
           CDebug:MessageOut("玩家结束与NPC对话，任务计算为2");

    if nMapID=="" or nMapID==nil then
  Say("colorgreen>"..strName.."颜色>："..strInfo, 0);
else
  nMapID = tonumber(nMapID)
   Say("colorgreen>"..strName.."颜色>："..strInfo, 2,
    "去执行任务/#gotoWorld("..nMapID..")",
 "知道了/Main_Exit");
	end;
	
end;


-- 开启一个具体任务的触发器
function StartTaskEvent(nTaskType, nTask)

local nNpcID         = GetTask(TASKNPC_ID);
local tabTask        = GetTaskTableFile(nTaskType);
local nRow           = tabTask:selectRowNum("TaskID", nTask);
local nEventID       = tabTask:getCell(nRow, "EventID");
local nKillIndex     = 0;

	if nTaskType==1 then
		CreateTrigger(4, nTask, EVENT_NPC_ID); -- 对话任务
	elseif nTaskType==2 then
		CreateTrigger(4, nNpcID, EVENT_NPC_ID); -- 收集任务，照旧触发人物
	elseif nTaskType==3 then
		-- 存储杀怪计数的触发器索引
		nKillIndex = CreateTrigger(0, nEventID, EVENT_NPC_ID); -- 杀怪任务
		SetTask(TASKKILL_ID, nKillIndex);
	end;
	
end;


-- 接受任务并前往任务所在地
function AcceptTask(nMapID)
local nMap = GetWorldPos()
	--雪杖场地不能使用师父密函出送离开地图
        if nMap >= 961 and nMap <= 965 then
                  Talk(1,"","此区域不能送至师门任务处，请你离开后才使用师父密函！")
return
	end
    if GetTask(1715) ~= 0 then
                  Talk(1,"","此区域不能送至师门任务处，请你离开后才使用师父密函！")
return
	end;
	gotoWorld(nMapID);
end;


-- 确认取消任务
function CancelTask_Confirm()

local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

                Say("你同意取消任务"..strBossTitle.."这个？如果连续取消2次，您将失去coloryellow1color>声望积分！",
2,
"好的/CancelTask",
  "我再看看！/ShowTaskNpc");

end;

-- 取消任务后的提示
function CancelTask()

local nLost = GetTask(TASKCANCEL_ID);

	nLost = nLost + 1;
	
	if nLost>=2 then
		nLost = 0;
		SetTask(TASKCANCEL_ID, nLost); -- 将累积失败次数清空
		-- 任务处罚
		TaskPunish();
		return
	end;
	
	SetTask(TASKSTATE_ID, 0); -- 将任务状态变为还未开始
	SetTask(TASKCANCEL_ID, nLost);
	local nTriggerID = GetTrigger(EVENT_NPC_ID);
	if nTriggerID ~= 0 then
		RemoveTrigger(nTriggerID);
	end;
end;


-- 任务的惩罚
function TaskPunish()

-- 减少声望 5 点
          Msg2Player("因为你还没有完成声望下降1的任务");
          TaskTip("因为你还没有完成声望下降1的任务");
ModifyReputation(-1,0);

end;


-- 检查任务是否完成
function CheckTask()

local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);

local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local nGenre, nDetail, nParticular, nNum = 0,0,0,0;

	-- 对话任务的处理
	if nTaskType==1 then
		return 1;
	end;
	
	-- 收集任务的处理
	if nTaskType==2 then
	
		nGenre      = tonumber(tabTask:getCell(nRow, "Genre"));
		nDetail     = tonumber(tabTask:getCell(nRow, "Detail"));
		nParticular = tonumber(tabTask:getCell(nRow, "Particular"));
		nNum        = tonumber(tabTask:getCell(nRow, "Num"));
		
		if GetItemCount(nGenre, nDetail, nParticular)>= nNum then
			DelItem(nGenre, nDetail, nParticular, nNum);
			return 1;
		else
			return 0;
		end;

	end;
	
	-- 杀怪任务的处理
	if nTaskType==3 then
		return 1;
	end;
	
	return 0;

end;


-- 完成任务并发予奖励，任务进展为 3
function FinishTask()

local nTimerIndex = GetTask(TASKTIMER_ID);

	PauseTimer(nTimerIndex);
	RemoveTrigger(nTimerIndex);
	
	-- 完成任务，设置任务进展为 3
	SetTask(TASKSTATE_ID, 3);
	
	-- 将失败累积清空
	SetTask(TASKCANCEL_ID, 0);
	
	-- 如果是辉煌之夜活动期间，则发两次奖励
	local multiple = get_reward_multiple(SYS_MASTER_RANDOMTASK)
	--local times = ceil(multiple)
	local times = 2  --固定奖励为2 
	PayAward(multiple, times)
end;

-- 发奖函数
function PayAward(multiple, times)

	local nTaskType = GetTask(TASKTYPE_ID);
	local nTask     = GetTask(TASKID_ID);
	local tabTask   = GetTaskTableFile(nTaskType);
	local nRow      = tabTask:selectRowNum("TaskID", nTask);
	local nValue    = floor(tonumber(tabTask:getCell(nRow, "Value")) * 3.5); -- 基础价值乘以 2.5 倍
	
	local strBossTitle   = FactionBossTitle[GetPlayerFaction()];
	local strName = GetTargetNpcName();
	
	local nSpe      = 0;
	
	if strName==nil or strName=="" then strName = ""; end;
	
      CDebug:MessageOut("开始发放奖励，奖励是："..nValue);

	nValue = nValue * multiple
	ModifyExp(nValue);
	
	local nRoute = GetPlayerRoute();
	local nlevel = GetLevel()
	local a = 0;
	local b = 0;
 
 	for i=1, times do
	-- 有 5% 的概率得到一个特殊奖励
		if random(1, 100)<=5 then
			if random(1,100)<=40 then
				AddItem(2, 1, 148, 1, 1);
				a = 1;				
		  	elseif random(1,100)<=20 and nlevel>=45 then
		  		if FactionBook[nRoute][1][1] ~= nil then
		    		AddItem(FactionBook[nRoute][1][1], FactionBook[nRoute][1][2], FactionBook[nRoute][1][3], 1, 1);
					a = 2;
				end		  
		  	elseif random(1,100)<=20 and nlevel>=45 then
		  		if FactionBook[nRoute][2][1] ~= nil then
		  			AddItem(FactionBook[nRoute][2][1], FactionBook[nRoute][2][2], FactionBook[nRoute][2][3], 1, 1);		    
		    		a = 2;
		  		end
		  	else
		    	if nlevel>=50 then
				    nSpe = random(1, getn(speAward3));
				    AddItem(speAward3[nSpe][2],
					    speAward3[nSpe][3],
				    	speAward3[nSpe][4],
				    	1, 1); 
					a = 2;
				elseif nlevel>=30 and nlevel<=49 then
			    	nSpe = random(1, getn(speAward2));
			    	AddItem(speAward2[nSpe][2],
					    speAward2[nSpe][3],
				    	speAward2[nSpe][4],
			    		1, 1);
					a = 2;
				elseif nlevel<=29 then
			    	nSpe = random(1, getn(speAward1));
			    	AddItem(speAward1[nSpe][2],
				    	speAward1[nSpe][3],
				    	speAward1[nSpe][4],
				    	1, 1);
					a = 2;
				end;
		  	end;
		end;
		
		-- 有5%的概率得到师门令牌 
		if random(1, 100)<=5 then
			AddItem(FactionBook[nRoute][3][1], FactionBook[nRoute][3][2], FactionBook[nRoute][3][3], 1, 1);
			b = 1;
		end;
	end

    if a==0 and b==0 then
            Say("colorgreen>"..strName.."好家伙！你完成了你的任务"..strBossTitle.."“这是奖励！”EnterenterExperience："..nValue,0);
     elseif a==1 and b==0 then
                  Say("colorgreen>"..strName.."好家伙！你完成了你的任务"..strBossTitle.."“这是奖励！”EnterenterExperience："..nValue.."特殊物品：冰石碎片",0);
           Msg2Faction(FactionBook[nRoute][4], "弟子"..GetName().."完成师门任务得到冰石碎片");
    elseif a==2 and b==0 then
                 Say("colorgreen>"..strName.."好家伙！你完成了你的任务"..strBossTitle.."“这是奖励！”EnterenterExperience："..nValue.."特殊物品：密籍",0);
          Msg2Faction(FactionBook[nRoute][4], "弟子"..GetName().."完成师门任务获得密籍");
    elseif a==0 and b==1 then
                  Say("colorgreen>"..strName.."好家伙！你完成了你的任务"..strBossTitle.."“这是奖励！”EnterenterExperience："..nValue.."特殊物品：师门令牌",0);
           Msg2Faction(FactionBook[nRoute][4], "弟子"..GetName().."完成师门任务获得师门令牌");
    elseif a==1 and b==1 then
                     Say("colorgreen>"..strName.."好家伙！你完成了你的任务"..strBossTitle.."“这是奖励！”EnterenterExperience："..nValue.."特殊物品：师门令牌和冰石碎片",0);
              Msg2Faction(FactionBook[nRoute][4], "弟子"..GetName().."完成师门任务获得师门令牌和冰石碎片");
    elseif a==2 and b==1 then
                    Say("colorgreen>"..strName.."好家伙！你完成了你的任务"..strBossTitle.."“这是奖励！”EnterenterExperience："..nValue.."特殊物品：师门令牌和密籍",0);
             Msg2Faction(FactionBook[nRoute][4], "弟子"..GetName().."完成师门任务获得师门令牌和密籍");
	end;
	
	-- 增加 2 点声望
	ModifyReputation(2 * multiple, 0);  
end;
  
  
-- 得到任务的简明信息
function GetTaskClearInfo()
  
local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local strInfo   = "";
local strMain   = "";

  if (nTaskType==2) then
   strInfo = tabTask:getCell(nRow, "GoodsName");
       strMain = "去收集coloryellow>"..strInfo.."颜色>。";
  elseif (nTaskType==3) then
   strInfo = tabTask:getCell(nRow, "KillNpc");
      strMain = "去杀了coloryellow"..strInfo.."颜色>。";
	end;
	
	return strMain;

end;


-- 根据任务 ID 号来返回相应的任务表格
function GetTaskTableFile(nTaskType)

local tabTaskFile;

	if nTaskType==1 then
		tabTaskFile = tabTalkTask;
	elseif nTaskType==2 then
		tabTaskFile = tabCollTask;
	elseif nTaskType==3 then
		tabTaskFile = tabKillTask;
	end;
	
	return tabTaskFile;
	
end;

-- 从一个多维数组里构造一个单维权重数组
-- 传入参数：ary:table 数组，nCol:int 列数、数组的索引
function CreateRateArray(ary, nCol)

local aryReturn = {};
local i=0;

	for i=1, getn(ary) do
		tinsert(aryReturn, ary[i][nCol]);
	end;
	
	return aryReturn;

end;


-- 从一列带权重的数组里面选出一个
-- 传入参数：ary:table 单维数组
function GetRateForArray(ary)

local nRandom = 0;
local nAdd = 0;
local i,j=0

	for i=1, getn(ary) do
		nAdd = nAdd + ary[i];
	end;
	
	nRandom = random(1, nAdd);
	
	nAdd = 0;
	
	for i=1, getn(ary) do
		nAdd = nAdd + ary[i];
		if nAdd>=nRandom then
			return i+2;
		end;
	end;
	
	return 0;
	
end;


-- 根据玩家等级来决定其所在的等级区间
function SelectPlayerLevel()

local nLevel = GetLevel();

	if nLevel<10 then return 10; end;
	
	if nLevel>100 then return 100; end;
	
	return floor(nLevel/10)*10;

end;


-- 什么也不做的空函数
function Main_Exit()

end;