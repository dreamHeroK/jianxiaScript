
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 任务系统实体处理文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 读入任务引擎头文件
Import("\\script\\lib\\task_head.lua");

-- 读入任务引擎变量管理文件
Import("\\script\\lib\\task_value.lua");

-- 读入任务引擎 DEBUG 支持文件
Import("\\script\\lib\\task_debug.lua");

-- 表格文件类的支持
Import("\\script\\class\\ktabfile.lua");

-- 字符串处理功能库
Import("\\script\\lib\\string.lua");

-- 读入事件描述表格文件
taskEventFile = new(KTabFile, "\\settings\\task\\task_event.txt");

-- 读入任务触发条件表格文件
taskConditionFile = new(KTabFile, "\\settings\\task\\task_condition.txt");

-- 读入任务实体完成条件表格文件
taskEntityFile = new(KTabFile, "\\settings\\task\\task_entity.txt");

-- 读入奖励表格文件
taskAwardFile = new(KTabFile, "\\settings\\task\\task_award.txt");

-- 读入对话表格文件
taskTalkFile = new(KTabFile, "\\settings\\task\\task_talk.txt");

-- 构造任务数据索引
taskIndex = new(TaskEngine_Index,
				taskEventFile, 
				taskConditionFile, 
				taskEntityFile, 
				taskAwardFile, 
				taskTalkFile
				);

-- 任务引擎实体处理方法
CTask = {

--  /////////////////////////////////////////////
-- //			任务流程处理相关部分		  //
--/////////////////////////////////////////////

	-- 开始一个新任务，外部调用函数
	StartTask = function(self, taskName)
	
		local strTaskText = "";		
		local nRow = 0;	
		local nCheck;
		
		-- 如果任务还没开始，则检测是否可以开始做
		if self:GetTaskState(taskName)==0 then
		
			nCheck = self:CheckCanStart(taskName);
			if nCheck==1 then
			
				CDebug:MessageOut(taskName.."TaskUndefined021");
				
				self:SetTaskStateStart(taskName);
				
				-- 弹出任务提示信息
				nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
				strTaskText = taskConditionFile:getCell(nRow, "TaskText");
				
				if strTaskText~="" and strTaskText~=nil then
					TaskTip(self:SetTaskSayColor(strTaskText));
				end;
				
				return 1;
			else
				return nil;
			end;
			
		end;
		
	end,
	
	-- 手动结束一个任务，外部调用函数
	-- 如果有任务物品的话则删除
	-- 如果有其它临时状态也在这里清除
	FinishTask = function(self, taskName)
		
		CDebug:MessageOut("TaskUndefined022："..taskName);
		
		-- 删除任务物品部分
	
		-- 用于存放与此任务相关的实体数据的数组
		local aryTaskEntity = {};
		-- 任务实体的类型
		local strTaskEntity = "";
		local aryGoods = {0,0,0,0};
		
		local i=0;
		
		-- 将索引中与此任务相关的行数取出来
		for i=1, getn(taskIndex.EntityIndex) do
			if taskIndex.EntityIndex[i][1]==taskName then
				tinsert(aryTaskEntity,
						getn(aryTaskEntity) + 1,
						taskIndex.EntityIndex[i][2]);
			end;
		end;	
		-- 开始循环遍历任务物品及其它条件
		for i=1, getn(aryTaskEntity) do
			strTaskEntity = taskEntityFile:getCell(aryTaskEntity[i],"TaskType");
			-- 如果是收集物品的任务
			if strTaskEntity==TaskEntity.FindGoods then
				aryGoods[1] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Genre"));
				aryGoods[2] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Detail"));
				aryGoods[3] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Particular"));
				aryGoods[4] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"GoodsNum"));
				-- 如果该任务物品是要删除的话，则删除
				if tonumber(taskEntityFile:getCell(aryTaskEntity[i],"DelGoods"))==1 then
					CDebug:MessageOut(taskName.."TaskUndefined023");
					DelItem(aryGoods[1],aryGoods[2],aryGoods[3],aryGoods[4]);
				end;
			end;
			
		end;
		-- 循环结束，将任务设置为结束
		self:SetTaskStateEnd(taskName);
		
	end,
	
	
	-- 判断一个任务是否完成，外部调用函数，如果成功则返回 1，否则返回 0
	CheckTask = function(self, taskName)
	
		CDebug:MessageOut("TaskUndefined024："..taskName);
		
		-- 用于存放与此任务相关的实体数据的数组
		local aryTaskEntity = {};
		
		local nCheck = 0; -- 统计任务达成条件次数的临时变量
		
		local strTaskEntity = "";
		local aryGoods = {0,0,0,0};
		local nMoney = 0;
		
		local i=0;
		
		-- 如果任务不是正在进行中时，直接返回否
		if self:GetTaskState(taskName)~=1 then
			CDebug:MessageOut(taskName.." TaskUndefined025");
			return 0;
		end;		
		
		-- 将索引中与此任务相关的行数取出来
		for i=1, getn(taskIndex.EntityIndex) do
			if taskIndex.EntityIndex[i][1]==taskName then
				tinsert(aryTaskEntity,
						getn(aryTaskEntity) + 1,
						taskIndex.EntityIndex[i][2]);
			end;
		end;
		
		-- 如果一个条件也没有则返回可以完成
		if getn(aryTaskEntity)==0 then
			CDebug:MessageOut(taskName.." TaskUndefined026");
			return 1;
		end;
		
		-- 开始循环遍历任务条件是否都已经完成
		for i=1, getn(aryTaskEntity) do
			strTaskEntity = taskEntityFile:getCell(aryTaskEntity[i],"TaskType");
			
			-- 如果是收集物品的任务
			if strTaskEntity==TaskEntity.FindGoods then
				aryGoods[1] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Genre"));
				aryGoods[2] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Detail"));
				aryGoods[3] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Particular"));
				aryGoods[4] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"GoodsNum"));
				
				if GetItemCount(aryGoods[1],aryGoods[2],aryGoods[3]) >= aryGoods[4] then
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- 如果是支付金钱的任务
			if strTaskEntity==TaskEntity.PayMoney then
				nMoney = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"PayMoney"));
				if Pay(nMoney)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
		end;
		
		if nCheck == getn(aryTaskEntity) then
			CDebug:MessageOut(taskName.."TaskUndefined027"..nCheck.."TaskUndefined028");
			return 1;
		else
			return 0;
		end;
	
	end,
	
	
	-- 给玩家发予奖励
	PayAward = function(self, taskName)
		
		CDebug:MessageOut("TaskUndefined029"..taskName.."TaskUndefined030");
		
		-- 奖励的数组，格式为 {奖励类型，行数}
		local aryTaskAward = {};
		local strAward = "";
		
		local aryGoods = {0,0,0,0};
		local nMoney = 0;
		local nExp = 0;
		local nRepute = 0;
		local strTask = "";
		
		local i=0;
		
		-- 将与此任务相关的奖励取出来
		for i=1, getn(taskIndex.AwardIndex) do
			--strAward = taskAwardFile:getCell();
			if taskIndex.AwardIndex[i][1]==taskName then
				tinsert(aryTaskAward,
						getn(aryTaskAward) + 1,
						{taskIndex.AwardIndex[i][1], taskIndex.AwardIndex[i][2]});			
			end;
		end;
				
		-- 开始循环遍历发奖
		for i=1, getn(aryTaskAward) do
		
			strAward = taskAwardFile:getCell(aryTaskAward[i][2], "AwardType");
			
			-- 如果奖励的类型是物品
			if strAward==TaskAward.AwardGoods then
				aryGoods[1] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Genre"));
				aryGoods[2] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Detail"));
				aryGoods[3] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Particular"));
				aryGoods[4] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"GoodsNum"));
				AddItem(aryGoods[1],aryGoods[2],aryGoods[3],aryGoods[4]);
				CDebug:MessageOut("TaskUndefined031"..taskName.."TaskUndefined032");
			end;
			
			-- 如果奖励的类型是金钱
			if strAward==TaskAward.AwardMoney then
				nMoney = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"MoneyNum"));
				Earn(nMoney);
				CDebug:MessageOut("TaskUndefined031"..taskName.."TaskUndefined033："..nMoney);
			end;

			-- 如果奖励的类型是经验
			if strAward==TaskAward.AwardExp then
				nExp = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"ExpNum"));
				ModifyExp(nExp);
				CDebug:MessageOut("TaskUndefined031"..taskName.." 获得经验值:"..nExp);
			end;

			-- 如果奖励的类型是声望
			if strAward==TaskAward.AwardRepute then
				nRepute = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"ReputeNum"));
				ModifyReputation(nRepute, 0); -- 无限制类型增加声望
				CDebug:MessageOut("TaskUndefined031"..taskName.." TaskUndefined034："..nRepute);
			end;
			
			-- 如果奖励是开始一个新任务
			if strAward==TaskAward.AwardStartTask then
				strTask = taskAwardFile:getCell(aryTaskAward[i][2],"TaskString");
				
				if strTask~="" and strTask~=nil then
					self:StartTask(strTask);
					CDebug:MessageOut("TaskUndefined031"..taskName..TaskUndefined035："..strTask");
				end;
			end;

		end;
		
	end,
	
	
	-- 检测一个任务是否可以开始启动
	-- 返回 1 则为可以启动，返回 0 则为不能启动
	CheckCanStart = function(self, taskName)

		CDebug:MessageOut("TaskUndefined036："..taskName);
	
		-- 获取这个任务所在触发条件表格的行数
		local nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
		
		-- 任务开始条件数组
		local taskCondition = {};
		
		-- 任务完成条件的累加，如果达成则 + 1
		local nCheck = 0;
		
		-- 用于读取任务判断内容的临时变量
		local nStartType = ""; -- 读取条件枚举字符
		local nTask = ""; -- 需要判断的任务标识
		local nTaskID = 0; -- 需要判断的任务 ID
		local nTaskState = 0; -- 需要判断的任务状态
		local nLevel = 0; -- 需要判断的人物等级
		local nValue = 0; -- 需要判断的任务变量
		local nRepute = 0; -- 需要判断声望的变量
		local strGoods = ""; -- 需要判断是否持有物品的字符串
		local nGoodsID = nil; -- 需要判断是否持有物品的数组
		
		local i=0;
		
		-- 如果任务已经开始或者已经完成了，直接返回否
		if self:GetTaskState(taskName)~=0 then
			return 0;
		end;
		
		for i=1,5 do
		
			nStartType = taskConditionFile:getCell(nRow, "StartType"..i);
			
			-- 将任务的触发条件读入 taskCondition 数组
			if nStartType~="n" and nStartType~=nil and nStartType~="" then
				tinsert(taskCondition,
						getn(taskCondition) + 1,
						nStartType);
			end;
			
		end;
		
		for i=1, getn(taskCondition) do
		
			-- 任务是否已经开始条件的判断
			if taskCondition[i] == TaskCondition.TaskStart then
				nTask = taskConditionFile:getCell(nRow, "StartDes"..i);
				nTaskID = tonumber(self:GetTaskID(nTask));
				nTaskState = CTaskValue:GetTaskState(nTaskID);
				
				if nTaskState==1 then
					CDebug:MessageOut(taskName.."TaskUndefined037");					
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- 任务是否正已经结束的条件的判断
			if taskCondition[i] == TaskCondition.TaskEnd then
				nTask = taskConditionFile:getCell(nRow, "StartDes"..i);
				nTaskID = tonumber(self:GetTaskID(nTask));
				nTaskState = CTaskValue:GetTaskState(nTaskID);
				
				if nTaskState==2 then
					CDebug:MessageOut(taskName.."TaskUndefined038");	
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- 等级是否大于的条件判断
			if taskCondition[i] == TaskCondition.LevelMore then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()>=nLevel then
					CDebug:MessageOut(taskName.."TaskUndefined039");	
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 等级是否小于的条件判断
			if taskCondition[i] == TaskCondition.LevelLess then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()<=nLevel then
					CDebug:MessageOut(taskName.."TaskUndefined040");	
					nCheck = nCheck + 1;
				end;
			end;

			-- 等级是否等于的条件判断
			if taskCondition[i] == TaskCondition.LevelEqual then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()==nLevel then
					CDebug:MessageOut(taskName.."TaskUndefined041");	
					nCheck = nCheck + 1;
				end;
			end;

			-- 声望是否大于的条件判断
			if taskCondition[i] == TaskCondition.ReputeMore then
				nRepute = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetReputation()>=nRepute then
					CDebug:MessageOut(taskName.."TaskUndefined042");	
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 是否持有某个物品的条件判断
			if taskCondition[i] == TaskCondition.HaveItem then
				strGoods = taskConditionFile:getCell(nRow, "StartDes"..i);
				nGoodsID = split(strGoods, "|");
				
				-- 必须保证物品代码的4位正确性才能做下一步判断
				if getn(nGoodsID)==4 then
					if GetItemCount( tonumber(nGoodsID[1]), tonumber(nGoodsID[2]), tonumber(nGoodsID[3]) ) >= tonumber(nGoodsID[4]) then
						CDebug:MessageOut(taskName.."TaskUndefined043");							
						nCheck = nCheck + 1;
					end;
				end;
			end;
			
		end;
		
		if nCheck==getn(taskCondition) then
			CDebug:MessageOut(taskName.."TaskUndefined027"..getn(taskCondition).."TaskUndefined028 ");	
			return 1;
		else
			return 0;
		end;
		
	end,
	
	-- 执行一个开始任务所有的流程
	DoTask = function(self, taskName)
		
		-- 如果任务已经完成则直接返回空值
		if self:IsTaskFinish(taskName) then return nil; end;
		
		-- 如果任务还没有开始，则开始任务
		if not self:IsTaskStart(taskName) then
			-- 先判断是否能开始
			if self:CheckCanStart(taskName)==1 then
			
				-- 判断是否需要询问才能开始任务
				if self:GetTaskIsAsk(taskName)==1 then
					CDebug:MessageOut("TaskUndefined044："..taskName);
					self:TaskAskSay(taskName);
				else
					-- 说开始任务时的语句
					self:TaskSay(taskName, 0);
				end;
				return 1;
				
			end;
		end;
		
		-- 如果开始任务了，则给出中间状态
		if self:IsTaskStart(taskName) then
			-- 如果没中间状态的对话则返回空值
			if self:GetTaskText(taskName, 1) then
				self:TaskSay(taskName, 1);
				return 1;
			else
				return nil;
			end;
			
		end;
		
		-- 如果以上过程都不执行则返回空值
		return nil;
		
	end,
	
	-- 结束一个任务的所有流程
	EndTask = function(self, taskName)
	
		-- 如果任务已经完成则直接返回空值
		if self:IsTaskFinish(taskName) then return nil; end;
		
		-- 如果任务还没有开始，则也直接返回空值
		if not self:IsTaskStart(taskName) then
			return nil;
		end;
		
		-- 如果任务已经开始了，则检查任务是否完成，完成则发奖
		if self:IsTaskStart(taskName) then
			if self:CheckTask(taskName)==1 then
				-- 如果结束对话不为空则对话，否则直接发奖
				if self:GetTaskText(taskName, 2)~="" then
					self:TaskSay(taskName, 2);
				else
					self:FinishTask(taskName);
					self:PayAward(taskName);
				end;
				return 1;
			end;
		else
			-- 否则还是直接返回空值
			return nil
		end;

		-- 如果以上过程都不执行则返回空值
		return nil;
				
	end,
	
	-- 任务开始的对话回调函数
	_FunStart = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:StartTask(taskName);
	end,
	
	-- 任务进行中的对话回调函数
	_FunNow = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		return
	end,
	
	-- 任务结束时的对话回调函数
	_FunEnd = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:FinishTask(taskName);
		self:PayAward(taskName);
	end,
	
	-- 任务询问面版确认接受任务的回调函数
	_FunAskStart = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:StartTask(taskName);
	end,
	
	-- 任务询问面版取消任务的回调函数
	_FunAskCancel = function(self, taskID)
		return
	end,
	
	-- 执行任务的对话，传入参数为任务的状态：
	-- 0为还未开始任务，接任务时的对话
	-- 1为已经接了任务的对话
	-- 2为完成任务时的对话
	TaskSay = function(self, taskName, taskState)
		local strTalk = self:GetTaskText(taskName, taskState);
		
		local nTaskID = self:GetTaskID(taskName);
		
		local strFunBack = {
			[0]="#CTask:_FunStart("..nTaskID..")",
			[1]="#CTask:_FunNow("..nTaskID..")",
			[2]="#CTask:_FunEnd("..nTaskID..")",
		}
		
		-- 如果字符串是空的则直接返回
		if strTalk=="" or strTalk==nil then return ""; end;
		
		-- 开始对话，并设置好返回函数
		self:TaskTalk(strFunBack[taskState], strTalk);
		
	end,
	
	
	-- 获取一个任务指定的对话段，直接返回字符串
	GetTaskText = function(self, taskName, taskState)
		local strTask = ""
		local nRow = 0;
		local i=0;
		
		local strTitle = {
			[0]="TaskStartTalk",
			[1]="TaskNowTalk",
			[2]="TaskEndTalk",
		}
			for i=1, getn(taskIndex.TalkIndex) do
				if taskIndex.TalkIndex[i][1]==taskName then
					nRow = taskIndex.TalkIndex[i][2];
				end;
			end;

			if nRow~=0 then
				strTask = taskTalkFile:getCell(nRow, strTitle[taskState]);
				if strTask~="" then
					return strTask;
				else
					return nil;
				end;
			end;

	end,
	
	
	-- 获取一个任务所在触发条件表格的行数
	GetTaskRow = function(self, nIndex, strName)
		local i = 0;
		for i=1, getn(nIndex) do
			if nIndex[i][1]==strName then
				return nIndex[i][3];
			end;
		end;
		-- 什么也找不到返回 0
		return 0;
	end,
	
	
	-- 获取一个任务所对应的变量 ID
	GetTaskID = function(self, strName)
		local i = 0;
		for i=1, getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][1]==strName then
				return taskIndex.ConditionIndex[i][2];
			end;
		end;
		-- 什么也找不到返回 0
		return 0;		
	end,
	
	
	-- 已知一个任务ID获取相对应的名字
	GetTaskName = function(self, taskID)
	
		local strName = "";
		local i=0;
		
		for i=1, getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][2]==taskID then
				return taskIndex.ConditionIndex[i][1];
			end;
		end;
		-- 什么也找不到返回 0
		return strName;
		
	end,
	
	-- 获取一个任务是否需要询问才能开始
	GetTaskIsAsk = function(self, taskName)
	
		local nRow = 0;
		local nAsk = 0;
		local i=0;

		for i=1,getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][1]==taskName then
				nRow = taskIndex.ConditionIndex[i][3];
				break;
			end;
		end;
		
		nAsk = taskConditionFile:getCell(nRow, "IsAsk");
		
		if nAsk~="" then
			return 1;
		else
			return nil;
		end;
		
	end,
	
	-- 读取任务对话文本展开一段对话
	TaskTalk = function(self, funBack, strTask)
		
		local aryTaskText;
		local i=0;
		
		if strTask~=nil and strTask~="n" and strTask~="" then
			aryTaskText = split(strTask, "|");
		end;
		
		-- 如果返回的数组为1个成员则直接用 SAY，否则用 TALK 进行多分段
		if getn(aryTaskText)==1 then
			aryTaskText[1] = self:SetTaskSayColor(aryTaskText[1]);
			Say(aryTaskText[1],1,"TaskUndefined045/"..funBack);
		else
			for i=1, getn(aryTaskText) do
				aryTaskText[i] = self:SetTaskSayColor(aryTaskText[i]);
			end;
			self:TalkEx(funBack, aryTaskText);
		end;
		
	end,
	
	-- 任务开始时询问是否做任务的对话
	TaskAskSay = function(self, taskName)
		local strTalk = self:GetTaskText(taskName, 0);
		local nTaskID = self:GetTaskID(taskName);
		Say(
				self:SetTaskSayColor(strTalk),
				2,
				TaskDialogText.TaskConfirm.."/#CTask:_FunAskStart("..nTaskID..")",
				TaskDialogText.TaskCancel.."/#CTask:_FunAskCancel("..nTaskID..")"
			);
	end,
	
	
	-- 将一个任务设置为开始
	SetTaskStateStart = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:AssignTask(nTaskID);
	end,
	
	-- 将一个任务设置为结束
	SetTaskStateEnd = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:CompleteTask(nTaskID);	
	end,
	
	-- 将一个任务设置为还没开始
	SetTaskStateClean = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:ClearTask(nTaskID);	
	end,
	
	-- 获取一个任务的进展状态
	GetTaskState = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		return CTaskValue:GetTaskState(nTaskID);
	end,
	
	-- 外部调用函数，判断一个任务是否完成
	IsTaskFinish = function(self, strName)
		if self:GetTaskState(strName)==2 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- 外部调用函数，判断一个任务是否已经开始
	IsTaskStart = function(self, strName)
		if self:GetTaskState(strName)==1 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- 获取一个任务的描述
	GetTaskTipText = function(self, taskName)
		local nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
		local strTaskText = taskConditionFile:getCell(nRow, "TaskText");	
		return strTaskText;
	end,
	
	-- 外部调用函数，对所有的队友做同一件事情
	-- 传入参数为过程名 "Function Name"
	-- nMode：执行模式，1 是发出者连同队友一起执行，2 是只执行队友
	DoWithTeammate = function(self, funName, nMode)
		local nPreservedPlayerIndex = PlayerIndex;
		local nMemCount = GetTeamSize();
		local i=0;
		
			if (nMemCount == 0) then -- 如果玩家到这一步未组队，则执行了过程之后返回
				funName();
				return
			else
				if nMode==1 then
					for i=1,nMemCount do
						PlayerIndex = GetTeamMember(i);
						funName(); -- 执行传入的这个过程
					end;
				end;
				if nMode==2 then
					for i=1,nMemCount do
						PlayerIndex = GetTeamMember(i);
						if PlayerIndex~=nPreservedPlayerIndex then
							funName(); -- 执行传入的这个过程
						end;
					end;
				end;				
				PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
			end;
	end,
	
	-- 自动更换任务对话中的人名以及重点标识的文字颜色
	SetTaskSayColor = function(self, str)
		local strKey = ":";
		local strKeyLeft = "{";
		local strKeyRight = "}";
		local strPoint = strfind(str,strKey,1)
		local strName = "";
		local strColorText = str;
		
		if strPoint~=nil and strPoint>=1 then 
			strName = strsub(str, 1, strPoint-1);
			-- 处理人物名称颜色
			strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
		end;
				
		-- 处理重点标识颜色
		strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
		strColorText = join(split(strColorText,strKeyRight), "<color>");
		
		str = strColorText;
		return str;
		
	end,

--  /////////////////////////////////////////////
-- //			事件功能处理相关部分		  //
--/////////////////////////////////////////////

	-- 检查一个事件的状态
	-- 0 为从来没有开始
	-- 1 为正在进行中
	-- 2 为已经全部完成
	CheckEvent = function(self, aryEvent)
		
		local nNever, nNow, nEnd = 0,0,0;
		local i=0;
		
		for i=1, getn(aryEvent) do
			if aryEvent[i][2]==0 then
				nNever = nNever + 1;
			end;
			
			if aryEvent[i][2]==1 then
				nNow = nNow + 1;
			end;
			
			if aryEvent[i][2]==2 then
				nEnd = nEnd + 1;
			end;		
		end;
		
		if nNever==getn(aryEvent) then
			return 0;
		end;
		
		if nNow>=1 then
			return 1;
		end;
		
		if nEnd==getn(aryEvent) then
			return 2;
		end;
		
		return 0;

	end,

	-- 枚举目前正在经历的所有事件，并返回事件的状态
	-- 格式为：{事件ID，事件状态}
	EnumTotalEvent = function(self)
		local aryEventState = {};
		local eventID = 0;
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			eventID = taskIndex.EventIndex[i][1];
			rawset(aryEventState,
					getn(aryEventState)+1,
					{eventID, self:CheckEvent(self:EnumEventTask(eventID))}
				   );
		end;
		
		return aryEventState;
	end,
	
	-- 枚举一个事件所包含的任务，并返回各个任务的状态
	-- 格式为：{任务名称，任务状态}
	EnumEventTask = function(self, eventID)
		
		local taskName = "";
		local aryContainTask = {};
		local i=0;
		
		for i=1, getn(taskIndex.ConditionIndex) do
			taskName = taskIndex.ConditionIndex[i][1];
			if taskIndex.ConditionIndex[i][4]==eventID then
				rawset(aryContainTask, 
						getn(aryContainTask)+1,
						{taskName, self:GetTaskState(taskName)}
					   );
			end;
		end;
		
		if getn(aryContainTask)>0 then
			return aryContainTask;
		else
			return nil;
		end;
		
	end,
	
	-- 获取一个事件是否有共享属性
	IsEventShare = function(self, eventID)
		local nShare = 0;
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			if taskIndex.EventIndex[i][1]==eventID then
				nShare = taskIndex.EventIndex[i][3];
			end;
		end;
		
		if nShare==1 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- 确定一个事件是否可以共享，nType 1为宿主发出判断，2为接收者判断
	CanEventShare = function(self, eventID, nType)
		local aryTask = self:EnumEventTask(eventID);
		local nState = 0;
		local i=0;
		
		if nType==1 then
			-- 如果此事件可以共享才开始判断
			if self:IsEventShare(eventID) then
				return 1;
			else
				return nil;
			end;
		end;
		
		if nType==2 then
			if self:CheckEvent(aryTask)==0 then
				return 1;
			else
				return nil;
			end;
		end;
		
	end,
	
	-- 获取一个事件的描述
	GetEventText = function(self, eventID)
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			if taskIndex.EventIndex[i][1]==eventID then
				return taskIndex.EventIndex[i][2];
			end;
		end;
		
		return "";
	end,


--  /////////////////////////////////////////////
-- //			任务功能扩展相关部分		  //
--/////////////////////////////////////////////

	-- 对 Talk 功能的扩展
	TalkEx = function(self, fun, szMsg)
	
		local num = getn(szMsg);
		local szmsg = "";
		
		if fun==nil then fun = ""; end;
		
		for i=1,num-1 do
			szmsg = szmsg..format("%q",szMsg[i])..",";
		end;
		
		szmsg = szmsg .. format("%q",szMsg[num]);
		szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")";
		dostring(szmsg);
		
	end,
	
	-- 对 Say 功能的扩展
	SayEx = function(self, strSay)
	
		local strMsg,strSel = "","";
		local strNum = getn(strSay);
		
			if strNum < 2 then
				return
			end;
			
			if strNum > 2 then
				for i=2,strNum - 1 do
					strSel = strSel..format("%q", strSay[i])..",";
				end;
				strSel = strSel..format("%q", strSay[strNum]);
				strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
			elseif strNum == 2 then
				strSel = format("%q", strSay[strNum]);
				strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
			end;
			
			dostring(strMsg);
		
	end,
	
	-- 直接获取性别的字符
	GetSexName = function(self)
	
		local mySex -- 用以显示人物性别的字符
	
		if (GetSex() == 1) then
			mySex = "少侠";
		elseif (GetSex() == 2) then
			mySex = "姑娘";
		end;
		
		return mySex;
		
	end,
	
}
