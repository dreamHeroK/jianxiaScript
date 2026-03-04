Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\system_switch_config.lua")

--框架的重新搞定：）
--1、三个表的填充
--tGtNpcInfo:数据内容为main.txt + dialog.txt
function gf_ReadAllInfo(nGTaskID)	--代码与原版有重复，代整理
	tGtNpcInfo = tGtNpcInfo or {}
	if tGtNpcInfo[nGTaskID] ~= nil then
		return 1
	end
	
	for i = 3,TABLE_GT_MAIN:getRow() do
		local nTaskID = tonumber(TABLE_GT_MAIN:getCell(i,2));
		if nGTaskID == nTaskID then
			tGtNpcInfo[nTaskID] = {};
			tGtNpcInfo[nTaskID].name = TABLE_GT_MAIN:getCell(i,1);
			tGtNpcInfo[nTaskID].from_npc = TABLE_GT_MAIN:getCell(i,4);
			tGtNpcInfo[nTaskID].to_npc = TABLE_GT_MAIN:getCell(i,5);
			tGtNpcInfo[nTaskID].data = {};
			tGtNpcInfo[nTaskID].get_talk = {};
			tGtNpcInfo[nTaskID].finish_talk = {};
			tGtNpcInfo[nTaskID].data[1] = TABLE_GT_MAIN:getCell(i,3);
			--ExCondition
			local sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,6));
			if sExpression == nil or sExpression == "" then --如果空的返回1
				sExpression = "1";
			end
			local strCondition = "function GtExCondition() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[2] = GtExCondition;
			--FinishCondition
			sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,7));
			if sExpression == nil or sExpression == "" then
				sExpression = "1";
			end			
			strCondition = "function GtFinishCondition() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[3] = GtFinishCondition;
			--Action
			sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,8));
			strCondition = "function GtAction() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[4] = GtAction;
			--Prize
			sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,9));
			strCondition = "function GtPrize() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[5] = GtPrize;			
			tGtNpcInfo[nTaskID].data[6] = TABLE_GT_MAIN:getCell(i,10); --第6项为Action空间负重
			tGtNpcInfo[nTaskID].data[7] = TABLE_GT_MAIN:getCell(i,11); --第7项为Prize空间负重
			tGtNpcInfo[nTaskID].data[8] = TABLE_GT_MAIN:getCell(i,12); --第8项为取消任务
			tGtNpcInfo[nTaskID].data[9] = TABLE_GT_MAIN:getCell(i,13); --第9项为跳过任务
			tGtNpcInfo[nTaskID].data[10] = TABLE_GT_MAIN:getCell(i,7); --第10项为完成条件，为了删除物品	
			
			for k = 3,TABLE_GT_DIALOG:getRow() do
				if tonumber(TABLE_GT_DIALOG:getCell(k,1)) == nTaskID then
					local sTalkType = TABLE_GT_DIALOG:getCell(k,2);
					for m = 3,22 do
						local StrTalk = TABLE_GT_DIALOG:getCell(k,m);
						if StrTalk ~= nil and StrTalk ~= "" then
							tinsert(tGtNpcInfo[nTaskID][sTalkType],StrTalk);								
						else
							break;
						end
					end
					tGtNpcInfo[nTaskID][sTalkType].tip = TABLE_GT_DIALOG:getCell(k,24);  
				end
			end
		
			return 1
		end
	end
	
	return 0
end

--gf_ReadAllInfo();

--g_GtCondition condition.txt
function gf_ReadCondition()
	g_GtCondition = g_GtCondition or {}

	if g_GtCondition[1] ~= nil then
		return
	end
	
	for i = 3, TABLE_GT_CONDITION:getRow() do
		local nConditionID = TABLE_GT_CONDITION:getCell(i, 1);
		g_GtCondition[nConditionID] = {}
		g_GtCondition[nConditionID][1] = TABLE_GT_CONDITION:getCell(i, 2);
		for j = 3,8 do
			g_GtCondition[nConditionID][j-1] = TABLE_GT_CONDITION:getCell(i, j);
		end
	end
end

--gf_ReadCondition();

--g_GtPrize prize.txt
function gf_ReadPrize()
	g_GtPrize = g_GtPrize or {}
	
	if g_GtPrize[1] ~= nil then
		return
	end
	
	for i = 3, TABLE_GT_PRIZE:getRow() do
		local nPrizeID = TABLE_GT_PRIZE:getCell(i, 1);
		g_GtPrize[nPrizeID] = {}
		g_GtPrize[nPrizeID][1] = TABLE_GT_PRIZE:getCell(i, 2);
		for j = 3,8 do
			g_GtPrize[nPrizeID][j-1] = TABLE_GT_PRIZE:getCell(i, j);
		end
	end
end

--gf_ReadPrize();


--管理每个玩家身上的gtask
tGtTaskManage = {};

--gtask中第一个空出来的任务变量
function tGtTaskManage:FirstEmptyTask()
	for i = tGtTask.GT_TASK_ID_START, tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == 0 then
			tGtTask:BeginSFX(i)
			return i;
		end
	end
	
	return 0
end

--gtask是否可以添加新的任务
function tGtTaskManage:IsCanAddNewTask()
	if tGtTaskManage:FirstEmptyTask() == 0 then
		return 0
	else
		return 1
	end
end

--设置gtask中的任务标记位
--nValue
	--1 表示已经完成
	--0 表示未完成
function tGtTaskManage:SetTaskStateBit(nTaskID, nValue)
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);	
	if nBit == 0 then
		nBit = 31;
	end
	gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit,nValue);  
end

--gtask中添加一个任务
--1、添加
--2、将任务状态设为未完成
--返回值
	--1、添加成功
	--2、添加失败，原因是已满
function tGtTaskManage:AddTask(nGTaskID)
	local nTaskID = self:FirstEmptyTask();
	if nTaskID ~= 0 then
		self:SetTaskStateBit(nGTaskID, 0);
		SetTask(nTaskID, nGTaskID);
		tGtTask:DoSFX(nGTaskID)
		return 1
	else
		return 0
	end
end

--移除一个任务
--1、移除
--2、将任务状态设为完成
--返回值
	--1 成功
	--2 没有此任务
function tGtTaskManage:DeleteTask(nTaskID, nIsOver)
	local nTaskReturn = 0
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			SetTask(i,0);
			for j = 1,tGtTask.GLV_GT_TASK_ADD - 1 do 
				SetTask(i+(tGtTask.GLV_GT_TASK_NUM+1)*j,0);
			end
			nTaskReturn = i;
			break;
		end
	end
	
	if nTaskReturn ~= 0 then	--有，并且已经删除
		if  nIsOver == 1 then
			tGtTaskManage:SetTaskStateBit(nTaskID, 1);
		else
			tGtTaskManage:SetTaskStateBit(nTaskID, 0);
		end
		tGtTask:remove_trigger(nTaskID)
	end
end

--是否接到gtask中nGTaskID对应的任务
function tGtTaskManage:IsGetGTaskID(nGTaskID)
	if tGtTask:get_task(nGTaskID) == 0 then
		return 0
	else
		return 1
	end
end

function tGtTaskManage:AddTaskInfo(nGTaskID)
	return gf_ReadAllInfo(nGTaskID)
end

function tGtTaskManage:IsTSDLTask(nGTaskID)
	for n = 2,TABLE_GT_TSDL:getRow() do
		if tonumber(TABLE_GT_TSDL:getCell(n,1)) == nGTaskID then	--完了完了，这个任务需要特殊掉落
			return 1
		end
	end
	
	return 0
end

--一些关于任务的易用函数
--Open 开启一个任务
--1、向manage中申请一个任务变量——它属于【管理】逻辑
--2、启动开启前的【验证】逻辑
	--2、验证空间重量
	--0、是否满足condition表中的条件
--3、启动开启前的动作
	--0、随机
	--1、策划自定义——未实现
--4、开启——设定标记位
--5、启动开启后的动作
	--1、对话（对话都被设定成事先说的了：）
	--2、策划自定义
	--3、特效
	--4、特殊掉落
--返回值
	--4 传入的nTaskID有问题
	--3 不可再接任务
	--2 未满足开启条件
	--1 成功
	--5 木有此nTaskID
function OpenGTask(nTaskID)
	--gtask关闭
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--print("in Open")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(2956)
		if nTaskID == 0 then
			return 4
		end
	end

	--manager管理
	if tGtTaskManage:IsCanAddNewTask() == 0 then
		return 3	
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 5
	end
	
	--开启前的验证
	local nCanGet = tGtTask:IsTaskCanGet(nTaskID);
	if nCanGet ~= 1 then
		if nCanGet == 3 then
			Talk(1,  "",  "由于您没有资格，很遗憾，您不能接受此任务。");
		end
		if nCanGet == 5 then
			Talk(1, "", "进入下层需要另一个流派。");
		end
		return 2
	end
	
	--接任务限制，特殊处理-----
	if nTaskID == 151 then
		--限制
		if GetWorldPos() ~= 6073 then
			Talk(1,  "",  "由于您没有资格，很遗憾，您不能接受此任务。");
			return 6
		end
		--处理
		SetCampToPlayer("camp_enemy");
	end
	---------------------------
	
	--开启前动作
	--随机<----------未作
	
	--开启
	--标记某个标记位<----------无
	tGtTaskManage:AddTask(nTaskID)
	
	--开启后的动作
	--对话
	--tGtTask:SpeakBegin(nTaskID, 1);
	--策划自定义
	SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nTaskID);
	tGtTask:DoAction(nTaskID);
	tGtTask:DoSFX(nTaskID)
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 906, 2, 0);
	
	--特殊掉落
	if tGtTaskManage:IsTSDLTask(nTaskID) == 1 and GetTrigger(4001) == 0 then
		CreateTrigger(0, 1781,  4001, 1);
	end
	
	--print("succ")
	--ok 完成接任务
	return 1
end	
	
--Finish 正常结束一个任务
--0、manage中是否接了
--1、结束条件检测
	--2、策划设定
	--1、空间
--2、结束前动作
	--1、策划设定
	--2、对话
--3、结束
--4、manage中处理
--5、给奖励
--6、下一步是否可接
--返回值
	--1 成功
	--2 不满足完成条件
	--3 木有接到任务
	--4 删除失败
	--5 传参问题
	--6 木有此nTaskID
function FinishGTask(nTaskID)
	--print("in finish")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(2956);
		if nTaskID == 0 then
			return 5
		end
	end
	tGtTask:DoSFX(nTaskID)
	
	--manage中是否接了
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 3
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--条件检测
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--结束前动作：策划设定，删除，对话
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	
	--结束动作
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	--manage处理
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--给与奖励
	tGtTask:DoPrize(nTaskID)
	tGtTask:FinishSFX(nTaskID)
	
	--帮他点一下就可以得到下一步任务
	local targetNpc = GetNpcName(GetTargetNpc());
	if targetNpc ~= "" and tGtNpcInfo[nTaskID].to_npc == targetNpc 
		and tGtNpcMain and type(tGtNpcMain.npc_main) == "function" then
		tGtNpcMain:npc_main(tGtNpcInfo[nTaskID].to_npc)
	end
	return 1
end

--Close 取消一个任务
--0、是否在manage中
--1、是否可删除
--3、取消要钱的哦
--2、从manage中删除
--返回值
	--1、成功
	--2、木有任务
	--3、任务不可以取消
	--4、扣钱失败
function CloseGTask(nTaskID)
	--manage中是否接了
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 2
	end
	
	--是否可以删除
	if tGtTask:IsCanClose(nTaskID) ~= 1 then
		return 3
	end
	
	--扣钱扣钱扣钱
	if Pay(tGtNpcInfo[nTaskID].data[8]) ~= 1 then
		return 4
	end
	
	--从manage中移除
	tGtTaskManage:DeleteTask(nTaskID)
	
	return 1
end
	
--Jump 跳过一个任务
--0、是否在manage中
--1、是否可跳过
--3、还是钱
--4、从manage中移除
--5、讲结束的话，哦也
--返回值
	--1、成功
	--2、木有任务
	--3、任务不可以跳过
	--4、扣钱失败
function JumpGTask(nTaskID, bIsPrize)
	--manage中是否接了
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 2
	end
	
	--是否可以跳过
	if tGtTask:IsCanJump(nTaskID) ~= 1 then
		return 3
	end
	
	--钱
	if Pay(tGtNpcInfo[nTaskID].data[9]) ~= 1 then
		return 4
	end
	
	--结束前动作：策划设定，删除，对话
	tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
	--删除触发器
	tGtTask:remove_trigger(nTaskID);
	
	--结束动作
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	--从manage中移除
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--给与奖励
	if bIsPrize and tonumber(bIsPrize) == 1 then
		tGtTask:DoPrize(nTaskID);
		Msg2Player("您获得了奖励!");
	end
	
	--将结束
	tGtTask:SpeakFinish(nTaskID)
	
	return 1
end

--Clear 清除一个任务
--1、如果manage中有，就移除这个任务
--2、将任务的bit位设为0
function ClearGTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) ~= 0 then
		tGtTaskManage:DeleteTask(nTaskID)
	end
	
	tGtTaskManage:SetTaskStateBit(nTaskID, 0)
end

--gtask_main，接取任务的NPC名不存在，自定义脚本处理任务
--直接接取指定TaskId的任务
--flag，1为界面，2为强制
function DirectGetGTask(nTaskID,flag)
	--是否开启了新任务系统
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskID是否合法
	if nTaskID <= 0 or nTaskID == nil then
		return -2;
	end
	--TaskID是否接取
	if tGtTask:check_cur_task(nTaskID) ~= 0 then
		Msg2Player("您已接受此任务！");
		return -3;
	end
	--是否接满
	if tGtTask:check_task() == 0 then
		Msg2Player("未完成的任务数超过了限制。");
		return -4;
	end
	if flag == 1 then
	--界面
		SetTask(Task_id_001,nTaskID);
		SendScript2Client("Open(\"TaskFace\","..tostring(nTaskID)..",1)");
		return 0;
	elseif flag == 2 then
	--强制接取
	--成功接取返回1
		return OpenGTask(nTaskID);
	end
end

--直接完成任务可能存在不能触发相关状态的情况，尽量少用。
--flag，1为界面，2为强制
function DirectFinishGTask(nTaskID,flag)
	--是否开启了新任务系统
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskID是否合法
	if nTaskID <= 0 or nTaskID == nil then
			return -2;
	end
	--TaskID是否接取
	if tGtTask:check_cur_task(nTaskID) == 0 then
		--Msg2Player("您没有接过该任务");
		return -3;
	end
	if flag == 1 then
	--界面
		SetTask(Task_id_001,nTaskID);
		SendScript2Client("Open(\"TaskFace\","..tostring(nTaskID)..",2)");
		return 0;
	elseif flag == 2 then
	--强制完成
	--成功完成返回1
		return FinishGTask(nTaskID);
	end	
end

--直接删除过期任务
function DirectDeleteTask(nTaskID)
	--是否开启了新任务系统
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskID是否合法
	if nTaskID <= 0 or nTaskID == nil then
		return -2;
	end
	if tGtTask:check_cur_task(nTaskID) ~= 1 then
		return -3;
	end
	--manage中是否接了
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return -4;
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return -5;
	end	
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			SetTask(i,0);
			--其他状态一并清理
			for j = 1,tGtTask.GLV_GT_TASK_ADD - 1 do 
				SetTask(i+(tGtTask.GLV_GT_TASK_NUM+1)*j,0);
			end
			break;
		end
	end	
	--删除任务给的道具
	tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	--删除触发器
	tGtTask:remove_trigger(nTaskID);	
	--完成状态设为0
	tGtTaskManage:SetTaskStateBit(nTaskID, 0);
end


function DirectIsTaskFinish(nTaskID)
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return nil
	end
	--条件检测
	if tGtTask:CheckCondition(nTaskID) ~= 1 then
		return nil;
	end
	return 1;
end

--是否接了或者没有能接该任务
function IsHaveTaskOrCanGet(nTaskID)
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return nil
	end
	if tGtTask:check_cur_task(nTaskID) == 1 or tGtTask:IsTaskCanGet(nTaskID) == 1 then
		return 1;
	end
	return nil;
end

--检查是否接了该区间的任务
function IsHaveTaskOrCanGet2(nStart, nEnd)
	for i = nStart, nEnd do
		if IsHaveTaskOrCanGet(i) == 1 then
			return 1;
		end
	end
	return nil;
end