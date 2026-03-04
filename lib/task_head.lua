
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 任务系统头文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================


-- 定义各种任务触发的消息枚举
TaskCondition = {

	TaskStart = "开始任务",
	
	TaskEnd = "任务结束",
	
	LevelMore = "大于等级",
	
	LevelLess = "小于等级",
	
	LevelEqual = "等于等级",
	
	ValueMore = "大变化",
	
	ValueLess = "小变化",
	
	ValueEqual = "没有变化",
	
	ReputeMore = "更多声望",
	
	HaveItem = "专长",
	
}

-- 定义各种任务方法的枚举
TaskEntity = {

	FindGoods = "寻找物品",
	
	KillNpc = "杀怪",
	
	PayMoney = "消费金钱",
	
	ChangeValue = "需要任务",

}

-- 定义各种奖励类型的枚举
TaskAward = {

	AwardGoods = "获得物品",
	
	AwardMoney = "获得金钱",
	
	AwardExp = "获得经验",
	
	AwardRepute = "获得声望",
	
	AwardStartTask = "获得任务,

}

-- 定义任务标准按键的文字
TaskDialogText = {

	TaskConfirm = "接受任务",
	
	TaskCancel = "取消任务",
	
}


-- 用于构造任务各种数值索引的类
TaskEngine_Index = {

	-- 对外数据，事件列表，触发条件，任务实体，奖励列表，任务对话的索引
	EventIndex = nil,
	ConditionIndex = nil,
	EntityIndex = nil,
	AwardIndex = nil,
	TalkIndex = nil,

	-- 构造函数，读入触发、实体与奖励的表格，构造索引
	__new = function(self, arg)
		self.EventIndex = self:AssignEventIndex(arg[1]);
		self.ConditionIndex = self:AssignConditionIndex(arg[2]);
		self.EntityIndex = self:AssignEntityIndex(arg[3]);
		self.AwardIndex = self:AssignAwardIndex(arg[4]);
		self.TalkIndex = self:AssignTalkIndex(arg[5])
	end,

	-- 构造任务触发条件的索引
	-- 具体格式为：{任务名称，任务ID，行数，归属的事件ID}
	AssignConditionIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local nEvent = 0;
		local i,j = 0,0;
		
		local nConditionData = {}; -- 最后返回的触发条件索引

			for i=2, nRow do
				j = j + 1;
				
				-- 有些任务可能没有事件归属
				nEvent = tabFile:getCell(i,"EventID");
				if nEvent~="" then
					nEvent = tonumber(nEvent);
				else
					nEvent = 0;
				end;
				
				tinsert(nConditionData, 
						getn(nConditionData) + 1, 
							{	
								tabFile:getCell(i,"TaskName"), 
								tonumber(tabFile:getCell(i,"TaskID")), 
								i,
								nEvent
							}
						);
			end;
			
			return nConditionData;
	end,
	
	-- 构造任务实体数据的索引
	-- 具体格式为：{任务名称，行数}
	AssignEntityIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nEntityData = {}; -- 最后返回的实体数据索引
		
			for i=2, nRow do
				j = j + 1;
				tinsert(nEntityData, 
						getn(nEntityData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nEntityData;
	end,
	
	-- 构造任务奖励数据的索引
	-- 具体格式为：{任务名称，行数}
	AssignAwardIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nAwardData = {}; -- 最后返回的奖励数据索引
		
			for i=2, nRow do
				tinsert(nAwardData, 
						getn(nAwardData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nAwardData;	
	end,
	
	-- 构造事件说明索引
	-- 具体格式为：{事件ID，事件说明，是否可以共享，行数}
	AssignEventIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nEventData = {}; -- 最后返回的奖励数据索引
		
			for i=2, nRow do
				tinsert(nEventData, 
						getn(nEventData) + 1, 
						{tonumber(tabFile:getCell(i,"EventID")),
						 tabFile:getCell(i,"EventText"),
						 tonumber(tabFile:getCell(i,"CanShare")),
						 i}
						);				
			end;
			
			return nEventData;
	end,
	
	-- 构造任务对话数据的索引
	-- 具体格式为：{任务名称，行数}
	AssignTalkIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nTalkData = {}; -- 最后返回的奖励数据索引
		
			for i=2, nRow do
				tinsert(nTalkData, 
						getn(nTalkData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nTalkData;	
	end,

}