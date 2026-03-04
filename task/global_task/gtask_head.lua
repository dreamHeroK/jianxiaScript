--新的世界任务
--by vivi
--modify by liubo

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\string.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\position.lua")
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\system_switch_config.lua")

TABLE_GT_MAIN = new(KTabFile,"\\settings\\gtask\\gtask_main.txt");
TABLE_GT_CONDITION = new(KTabFile,"\\settings\\gtask\\gtask_condition.txt");
TABLE_GT_PRIZE = new(KTabFile,"\\settings\\gtask\\gtask_prize.txt");
TABLE_GT_DIALOG = new(KTabFile,"\\settings\\gtask\\gtask_dialog.txt");
TABLE_GT_TSDL = new(KTabFile,"\\settings\\gtask\\gtask_tsdl.txt");

--=======================任务处理====================================
tGtTask = {
	--这一段是记录每个任务ID是否完成的情况，分bit使用，每个变量拆31个。
	--暂时定为40个，可加。
	tGtTaskID = {
		3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,
		3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,
		3028,3029,3030,3031,3032,3033,3034,3035,3036,3037,
		3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,
	},
	--任务变量
	--这一段任务变量的开始
	--记录规则：从这个开始的10个变量记录当前接的任务ID
	--往后的10个是对应任务ID的触发器数量（如果有），分4个字节使用，第1个为类型，第2个为数量，3、4还没用到。
	--再往后的10个记录对应任务ID的触发器完成情况
	--再往后10个记录对应任务ID的某些特殊数值需求。
	GT_TASK_ID_START = 2968,
	GLV_GT_TASK_NUM = 9,  --每段加9，一共10个
	GLV_GT_TASK_ADD = 4,  --一共4段
	GT_TEMP_TASK_ID = 201, --临时变量，记录当前接的任务ID
	GT_TEMP_RAND_ID = 202, --临时变量，记录当前接的随机任务ID
	GT_TRIGGER_OFFSET = 4000, --CustomtriggerID与任务变量的偏移量
};

--检测任务完成的进度
--返回任务进度的步数（要求gtask_main表任务ID连续）
function tGtTask:check_finsh_taskid()
	local nCount = getn(tGtTask.tGtTaskID) or 0;
	local nNum = 31;
	if nCount <= 0 then return 0; end
	for i = 1,nCount do
		for j = 1,nNum do
			if gf_GetTaskBit(tGtTask.tGtTaskID[i],j) ~= 1 then
				return (i-1) * 31 + j;
			end
		end
	end
	return 0;
end

--检测TaskId任务是否完成
--返回~0完成0未完成
function tGtTask:check_task_isfinish(nTaskId)
	--清楚标记位
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskId/31);
	nBit = mod(nTaskId,31);
	if nBit == 0 then
		nBit = 31;
	end
	return gf_GetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit);
end

--检测是否接满了任务
--这个应该丢给
function tGtTask:check_task()
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == 0 then
			return 1;
		end
	end
	return 0;
end

function tGtTask:GetAllTask()
	local tRetTask = {};
	local nRetTask = 1;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		local nTaskID = GetTask(i);
		if nTaskID ~= 0 then
			tRetTask[nRetTask] = nTaskID;
			nRetTask=nRetTask+1;
		end
	end

	return tRetTask;
end

--检测是否接了该任务
function tGtTask:check_cur_task(nTaskID)
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			return 1;
		end
	end
	return 0;
end

function tGtTask:ClearAll()
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) ~= 0 then
			tGtTask:set_task(3, GetTask(i));
		end
	end
end

--任务变量的操作
--nType：1表示接任务 2表示完成任务或跳过任务 3表示取消任务
--nTaskID:任务ID
--返回：设置的变量值
function tGtTask:set_task(nType,nTaskID)
	local nTaskReturn = 0;
	if nType == 1 then
		for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
			if GetTask(i) == 0 then
				SetTask(i,nTaskID);
				nTaskReturn = i;
				break;
			end
		end
	else
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
		if nType ~= 3 then
			if tGtNpcInfo[nTaskID].data[1] == "" or tonumber(tGtNpcInfo[nTaskID].data[1]) == 0 then
				local nTabIdx,nBit = 0,0;
				nTabIdx = ceil(nTaskID/31);
				nBit = mod(nTaskID,31);
				if nBit == 0 then
					nBit = 31;
				end
				gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit,1);  --设置对应的值为1表示该任务ID已经完成
			end
		end
	end
	return nTaskReturn;
end

--获取nTaskID存在哪个变量上
function tGtTask:get_task(nTaskID)
	local nTaskReturn = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskReturn = i;
			return nTaskReturn;
		end
	end
	return nTaskReturn;
end

--设置随机任务，把前置任务ID储存进第四个变量中
function tGtTask:set_ex_task(nTaskID,nExTaskID)
	local nTaskValue1 = tGtTask:get_task(nTaskID);
	local nTaskValue4 = nTaskValue1+(tGtTask.GLV_GT_TASK_NUM+1)*3;
	SetTask(nTaskValue4,nExTaskID);
end

--获取随机任务的前置任务ID，传入随机任务ID，返回是否接了改任务
function tGtTask:get_ex_task(nTaskID)
	local nResult = 0;
	for i = tGtTask.GT_TASK_ID_START+(tGtTask.GLV_GT_TASK_NUM+1)*3,tGtTask.GT_TASK_ID_START+(tGtTask.GLV_GT_TASK_NUM+1)*3+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nResult = i;
			return nResult;
		end
	end
	return nResult;
end

--触发器（杀怪）完成情况
function tGtTask:trigger_finish_state(nTaskID)
	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return 1;
	end
	for i = 1,nCount do
		if gf_GetTaskBit(nTaskValue3,i) ~= 1 then
			return 0;
		end
	end
	return 1;
end

--根据TaskID移除相关触发器
function tGtTask:remove_trigger(nTaskID)
	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCustomTrigger = 0;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return 0;
	end
	for i = 1,nCount do
		nCustomTrigger = tGtTask.GT_TRIGGER_OFFSET+nTaskID*10+i;
		RemoveTrigger(GetTrigger(nCustomTrigger));
	end
end

function tGtTask:get_trigger(nTaskID)
	local tTrigger = {};

	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCustomTrigger = 0;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return nil;
	end
	for i = 1,nCount do
		nCustomTrigger = tGtTask.GT_TRIGGER_OFFSET+nTaskID*10+i;
		tTrigger[i] = nCustomTrigger
	end

	return tTrigger;
end

--任务对话
--nType
	--1 开始对话
	--2 结束对话
function tGtTask:_Speak(nTaskID, nDialogNum, nType, funcName)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end

	local strType = "";
	local strFunName = "";
	if nType == 1 then
		strType = "get_talk"
		strFunName = "SpeakBegin"
	elseif nType == 2 then
		strType = "finish_talk"
		strFunName = "SpeakFinish"
	end

	local strDialog = nil;
	if nDialogNum and tGtNpcInfo[nTaskID][strType] then
		strDialog = tGtNpcInfo[nTaskID][strType][nDialogNum];
	end
	if strDialog ~= nil then
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nTaskID].from_npc);
		if tGtNpcInfo[nTaskID][strType][nDialogNum + 1] == nil and funcName ~= "" then
			Talk(1, funcName, strDialog);
		else
			Talk(1, "#tGtTask:"..strFunName.."("..nTaskID..","..(nDialogNum + 1)..", )", strDialog);
		end
	end

	local strTip = tGtNpcInfo[nTaskID][strType].tip;
	if strTip ~= nil and strTip ~= "" and nDialogNum == 1 then
		TaskTip(strTip);
	end
end

--任务开始对话（代码与以前版本有重复，待整理）
function tGtTask:SpeakBegin(nTaskID, nDialogNum)
	tGtTask:_Speak(nTaskID, nDialogNum, 1)
end

--任务结束对话（待整理）
function tGtTask:SpeakFinish(nTaskID, nDialogNum)
	tGtTask:_Speak(nTaskID, nDialogNum, 2)
end

--任务执行动作（待整理）
function tGtTask:DoAction(nTaskID)
	if tGtNpcInfo[nTaskID] ~= nil then
		tGtNpcInfo[nTaskID]["data"][4]();
	end
end

--可以接任务特效
function tGtTask:BeginSFX(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end
	szFromNpc = tGtNpcInfo[nTaskID].from_npc
	szToNpc = tGtNpcInfo[nTaskID].to_npc

	local nFromMapId = getPosition(szFromNpc)
	local nToMapId = getPosition(szToNpc)
	local nFromIdx = gf_FindNpc(nFromMapId, szFromNpc)
	local nToIdx = gf_FindNpc(nToMapId, szToNpc)

	if szFromNpc ~= szToNpc then
		SetCurrentNpcSFX(nFromIdx, 917, 2, 1);	-- 关闭特效
		SetCurrentNpcSFX(nToIdx, 977, 2, 1);	-- 可接受特效
	else
		SetCurrentNpcSFX(nFromIdx, 976, 2, 1);	-- 未完成特效
	end
	return 1
end


--下一个任务特效
function tGtTask:NextSFX(nTaskID, szFromNpc, szToNpc)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end
	local nFromMapId = getPosition(szFromNpc)
	local nToMapId = getPosition(szToNpc)
	local nFromIdx = gf_FindNpc(nFromMapId, szFromNpc)
	local nToIdx = gf_FindNpc(nToMapId, szToNpc)

	if szFromNpc ~= szToNpc then
		SetCurrentNpcSFX(nFromIdx, 917, 2, 1);	-- 关闭特效
		SetCurrentNpcSFX(nToIdx, 977, 2, 1);	-- 可接受特效
	else
		SetCurrentNpcSFX(nFromIdx, 976, 2, 1);	-- 未完成特效
	end
	return 1
end

--未完成特效
function tGtTask:DoSFX(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end
	szFromNpc = tGtNpcInfo[nTaskID].from_npc
	szToNpc = tGtNpcInfo[nTaskID].to_npc

	local nFromMapId = getPosition(szFromNpc)
	local nToMapId = getPosition(szToNpc)
	local nFromIdx = gf_FindNpc(nFromMapId, szFromNpc)
	local nToIdx = gf_FindNpc(nToMapId, szToNpc)

	if szFromNpc ~= szToNpc then
		SetCurrentNpcSFX(nFromIdx, 917, 2, 1);	-- 关闭特效
		SetCurrentNpcSFX(nToIdx, 977, 2, 1);	-- 可接受特效
	else
		SetCurrentNpcSFX(nFromIdx, 976, 2, 1);	-- 未完成特效
	end
	return 1
end

--完成条件特效
function tGtTask:DoOkSFX(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end
	szFromNpc = tGtNpcInfo[nTaskID].from_npc
	szToNpc = tGtNpcInfo[nTaskID].to_npc

	local nFromMapId = getPosition(szFromNpc)
	local nToMapId = getPosition(szToNpc)
	local nFromIdx = gf_FindNpc(nFromMapId, szFromNpc)
	local nToIdx = gf_FindNpc(nToMapId, szToNpc)

	if szFromNpc ~= szToNpc then
		SetCurrentNpcSFX(nFromIdx, 917, 2, 1);	-- 已完成特效
		SetCurrentNpcSFX(nToIdx, 975, 2, 1);	-- 已完成特效
	else
		SetCurrentNpcSFX(nFromIdx, 975, 2, 1);	-- 已完成特效
		SetCurrentNpcSFX(nToIdx, 975, 2, 1);	-- 已完成特效
	end
	return 1
end

--完成任务特效
function tGtTask:FinishSFX(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end
	szFromNpc = tGtNpcInfo[nTaskID].from_npc
	szToNpc = tGtNpcInfo[nTaskID].to_npc

	local nFromMapId = getPosition(szFromNpc)
	local nToMapId = getPosition(szToNpc)
	local nFromIdx = gf_FindNpc(nFromMapId, szFromNpc)
	local nToIdx = gf_FindNpc(nToMapId, szToNpc)

	SetCurrentNpcSFX(nFromIdx, 917, 2, 1);	-- 已完成特效
	SetCurrentNpcSFX(nToIdx, 917, 2, 1);	-- 已完成特效
	return 1
end

function UpdateMeridia_73()
	if MeridianGetLevel() == 0 then
	--print("MeridianGetLevel")
		local tSex = gf_GetPlayerSexName();
		if MeridianUpdateLevel() == 1 then
			Msg2Player("恭喜"..tSex.."研究成果祖花宝成功并达到武圣的境界");
			if MeridianGetLevel() == 1 then
				gf_WriteLogEx("KICK HOAT KINH MACH", "TaskUndefined056", 1, "TaskUndefined057")
				--AwardGenuineQi(30000);
	  		Msg2Player("恭喜"..tSex.."TaskUndefined058");
	  		Talk(2,"",format("恭喜<color=green>%s<color>TaskUndefined053",tSex),format("TaskUndefined051%sTaskUndefined054',(TaskUndefined055)",tSex));
			end
		end
	end
end

--任务奖励
function tGtTask:DoPrize(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end

	tGtNpcInfo[nTaskID].data[5]();
	
	--给予奖励后的特殊处理------
	--已经完成73号任务
	if tGtTask:check_finsh_taskid() == 74 then
		UpdateMeridia_73();
	end
	----------------------------
end

--任务空间检测
--返回值
	--1 成功
	--2 失败
function tGtTask:_CheckRoomWeight(tRoomWeight)
	local nRoomWeight = tRoomWeight;--tGtNpcInfo[nGTaskID]["data"][6];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 2
		end
	end

	return 1
end

--门派的特殊处理
	--返回值：1、成功
	--2、失败
function tGtTask:CheckRoute(nGTaskID)
	return 1
end

--任务是否可接
	--1、满足空间
	--2、condition
--返回值
	--1 成功
	--2 空间不够
	--3 condition 不满足
	--4 此任务已接
	--5 门派冲突
	--6 任务完成过
function tGtTask:IsTaskCanGet(nGTaskID)
	if self:_CheckRoomWeight(tGtNpcInfo[nGTaskID]["data"][6]) ~= 1 then
		Msg2Player("你的背包没有足够的空间。")
		return 2
	end

	SetTaskTemp(tGtTask.GT_TEMP_TASK_ID, nGTaskID);	--这里把任务id存入临时变量中为了下面的前置条件检测
	local nConditionResult = tGtNpcInfo[nGTaskID]["data"][2]();
	if nConditionResult == nil then
		return 3
	end

	if tGtTask:check_cur_task(nGTaskID) == 1 then
		return 4
	end
	
	if tGtTask:CheckRoute(nGTaskID) == 0 then
		return 5
	end

	if tonumber(tGtNpcInfo[nGTaskID]["data"][1]) == 1 then	--随机任务
		return 1
	else
		if tGtCondition:check_taskid(nGTaskID,1) ~= nil then
			return 6
		end
	end

	return 1
end

--任务是否可结束
	--2、完成条件
		--1、设定完成条件
		--2、触发器
	--1、满足空间
--返回值
	--1、成功
	--2、空间不够
	--3、不满足完成条件
	--4、触发器未完成
function tGtTask:IsTaskCanOver(nGTaskID)
	local nConditionResult = tGtNpcInfo[nGTaskID]["data"][3]();
	if nConditionResult == nil then
		return 3
	end

	if tGtTask:trigger_finish_state(nGTaskID) == 0 then --触发器完成情况
		return 4
	end

	if self:_CheckRoomWeight(tGtNpcInfo[nGTaskID]["data"][7]) ~= 1 then
		Msg2Player("你的背包没有足够的空间。")
		return 2
	end
	return 1
end

--可用钱消耗任务——结束任务的第二个办法
--nType
	--1、关闭
	--2、跳过
--返回值
	--1、可以
	--2、不可取消
	--3、不存在任务
	--4、钱不够
	--5、空间不够
function tGtTask:IsCanPayForTask(nTaskID, nType)
	if tGtNpcInfo[nTaskID] == nil then
		return 3
	end

	local nMoney = 0
	if nType == 1 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[8]);
	elseif nType == 2 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[9]);
		if self:_CheckRoomWeight(tGtNpcInfo[nTaskID]["data"][7]) ~= 1 then
			return 5
		end
	end

	if nMoney ~= -1 and nMoney ~= nil then
		if GetCash() < nMoney then
			return 4
		end
		return 1
	end

	return 2
end

--获得跳过任务的金子数目
function tGtTask:GetJumpTaskCost(nTaskID)
	if not nTaskID then
		return 0;
	end
	if tGtNpcInfo[nTaskID] == nil then
		return 0;
	end
	return tonumber(tGtNpcInfo[nTaskID].data[9]);
end

--可用钱消耗任务——结束任务的第二个办法
--nType
	--1、关闭
	--2、跳过
--返回值
	--1、可以
	--2、不可取消
	--3、不存在任务
	--4、钱不够
function tGtTask:JumpTaskCheckCondition(nTaskID, nType)
	if tGtNpcInfo[nTaskID] == nil then
		return 3
	end
	local nMoney = 0
	if nType == 1 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[8]);
	elseif nType == 2 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[9]);
	end

	if nMoney ~= -1 and nMoney ~= nil then
		if GetCash() < nMoney then
			return 4
		end
		return 1
	end
	return 2
end

--任务是否可以关闭
function tGtTask:IsCanClose(nTaskID)
	return self:IsCanPayForTask(nTaskID, 1)
end

--任务是否可以跳过
function tGtTask:IsCanJump(nTaskID)
	return self:IsCanPayForTask(nTaskID, 2)
end

--跳过任务条件检查
function tGtTask:CheckJumpTask(nTaskID)
	return self:JumpTaskCheckCondition(nTaskID, 2);
end

function tGtTask:CloseTask(nTaskID)
	--清楚标记位
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);
	if nBit == 0 then
		nBit = 31;
	end
	gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit, 0);
	--清除详细记录
	tGtTask:set_task(3,nTaskID)
end

--杀怪触发器回调函数
function gt_trigger_callback()
	local nCustomTrigger = GetTriggerCustomID(GetRunningTrigger());
	local nCount = mod(nCustomTrigger,10);
	local nTaskID = ((nCustomTrigger-nCount)-tGtTask.GT_TRIGGER_OFFSET)/10;
	local nTaskValue = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskValue = i;
			break;
		end
	end
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	gf_SetTaskBit(nTaskValue3,nCount,1);
	RemoveTrigger(GetRunningTrigger());
end

--检测任务是否完成
function tGtTask:CheckCondition(nTaskID)
	local nConditionResult = tGtNpcInfo[nTaskID]["data"][3]();
	if nConditionResult == nil then
		return nil
	end
	if tGtTask:trigger_finish_state(nTaskID) == 0 then --触发器完成情况
		return nil
	end

	return 1
end

--=======================主对话处理=================================
tNpcInfoEx = {};
tGtNpcMain = {};
tGtNpcInfo = {};

--这张表用来存NPC身上有哪些任务信息，用于缓存
function tGtNpcMain:get_main_table(sNpcName)
--	if sNpcName == "" or sNpcName == nil then
--		return 0;
--	end	
--	if tNpcInfoEx[sNpcName] ~= nil then
--		return 0;
--	else
--		tNpcInfoEx[sNpcName] = 1;
--	end
--	if tGtNpcInfo ~= nil then
--		return 0;
--	end
	for i = 3,TABLE_GT_MAIN:getRow() do
		if TABLE_GT_MAIN:getCell(i,4) == sNpcName or TABLE_GT_MAIN:getCell(i,5) == sNpcName then
			local nTaskID = tonumber(TABLE_GT_MAIN:getCell(i,2));
			if tGtNpcInfo[nTaskID] == nil then
				tGtNpcInfo[nTaskID] = {};
				tGtNpcInfo[nTaskID].name = TABLE_GT_MAIN:getCell(i,1);
				tGtNpcInfo[nTaskID].from_npc = TABLE_GT_MAIN:getCell(i,4);
				tGtNpcInfo[nTaskID].to_npc = TABLE_GT_MAIN:getCell(i,5);
				tGtNpcInfo[nTaskID].data = {};
				tGtNpcInfo[nTaskID].get_talk = {};
				tGtNpcInfo[nTaskID].finish_talk = {};
				tGtNpcInfo[nTaskID].data[1] = TABLE_GT_MAIN:getCell(i,3);
				--------------------
				local sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,6));
				if sExpression == nil or sExpression == "" then --如果空的返回1
					sExpression = "1";
				end
				local strCondition = "function GtExCondition() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[2] = GtExCondition;
				---------------------
				sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,7));
				if sExpression == nil or sExpression == "" then
					sExpression = "1";
				end
				strCondition = "function GtFinishCondition() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[3] = GtFinishCondition;
				----------------------
				sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,8));
				strCondition = "function GtAction() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[4] = GtAction;
				-----------------------
				sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,9));
				strCondition = "function GtPrize() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[5] = GtPrize;
				----------------------
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
						tGtNpcInfo[nTaskID][sTalkType].unFinish = TABLE_GT_DIALOG:getCell(k,25);
					end
				end
			end
		end
	end
end

function tGtNpcMain:HaveTaskInGTask(sNpcName)
	sNpcName = sNpcName or GetTargetNpcName();
	local strtab = {};
	for i,v in tGtNpcInfo do
		local nCheckCurTask = tGtTask:check_cur_task(i);
		if nCheckCurTask == 1 then --已经接了
			local nConditionResult = v.data[3](); --完成条件
			if tGtNpcInfo[i].to_npc == sNpcName or tGtNpcInfo[i].from_npc == sNpcName then
				if nConditionResult ~= nil then --满足完成条件
					if tGtTask:trigger_finish_state(i) == 1 and tGtNpcInfo[i].to_npc == sNpcName then --触发器完成情况
						tinsert(strtab,v.name.."(已完成)/#tGtNpcMain:finish_task_talk("..i..",1)");
					else
						tinsert(strtab, v.name.."(未完成)/#tGtNpcMain:UnFinishTask("..i..")");	--未完成对话
						local nMoney1 = tonumber(v.data[8]);
						local nMoney2 = tonumber(v.data[9]);
						if nMoney2 ~= -1 and nMoney2 ~= nil then
							tinsert(strtab,"我要跳过任务["..v.name.."]/#tGtNpcMain:skip_task_talk("..i..","..nMoney2..")");
						end
					end
				else
					tinsert(strtab, v.name.."(未完成)/#tGtNpcMain:UnFinishTask("..i..")");	--未完成对话
					local nMoney1 = tonumber(v.data[8]);
					local nMoney2 = tonumber(v.data[9]);
					if nMoney2 ~= -1 and nMoney2 ~= nil then
						tinsert(strtab,"我要跳过任务["..v.name.."]/#tGtNpcMain:skip_task_talk("..i..","..nMoney2..")");
					end
					--end
				end
			end
		else --还没接或已经完成
			local nTaskIdResult = tGtCondition:check_taskid(i,1);
			if nTaskIdResult == nil then --还没完成，那就是可以接
				SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,i); --这里把任务id存入临时变量中为了下面的前置条件检测
				local nConditionResult = v.data[2](); --前置条件
				if nConditionResult ~= nil and tGtNpcInfo[i].from_npc == sNpcName then --满足前置条件
					if tonumber(tGtNpcInfo[i].data[1]) == 1 then --随机任务
						if tGtTask:get_ex_task(i) == 0 then --还没有接随机任务
							tinsert(strtab,v.name.."(可接受)/#tGtNpcMain:start_task("..i..",2)");
						end
					else
						if tGtTask:CheckRoute(i) == 1 then
							tinsert(strtab,v.name.."(可接受)/#tGtNpcMain:start_task_talk("..i..",1)");
						end
					end
				end
			end
		end
	end
	
	return strtab;
end

function tGtNpcMain:LevelGtask(npcId)
	local script = GetNpcScript(npcId);
	if script == nil or script == "" then
		return
	end
	
	SetPlayerScript(script);
	SendScript2VM(script,"main()");
end

--npc对话处理
function tGtNpcMain:npc_main(sNpcName,sNpcTalk)
	sNpcName = sNpcName or GetTargetNpcName();

	sNpcTalk = sNpcTalk or "你有什么事？";
	self:get_main_table(sNpcName);

	local strtab = tGtNpcMain:HaveTaskInGTask(sNpcName);

	local strLevel = format("我要处理其他事/#tGtNpcMain:LevelGtask(%d)",GetTargetNpc());
	if getn(strtab) ~= 0 then
		tinsert(strtab,strLevel);
		Say("<color=green>"..sNpcName.."<color>: "..sNpcTalk,
			getn(strtab),
			strtab)
	else
		return 1
	end

	return nil
end

--npc名为物品的对话处理
function tGtNpcMain:item_main(sItemName,sItemTalk)
	if not sItemName or sItemName == "" then
		return nil;
	end
	sItemTalk = sItemTalk or "你有什么事？";
	self:get_main_table(sItemName);

	local strtab = tGtNpcMain:HaveTaskInGTask(sItemName);

	if getn(strtab) ~= 0 then
		Say("<color=green>"..sItemName.."<color>: "..sItemTalk,
			getn(strtab),
			strtab)
	else
		return 1
	end

	return nil	
end

--对话字符串处理
function tGtNpcMain:dialog_string_deal(dialog_str,sNpcName)
	sNpcName = sNpcName or GetTargetNpcName();
	dialog_str = gsub(dialog_str,"NpcName","<color=green>"..sNpcName.."<color>");
	dialog_str = gsub(dialog_str,"PlayerName","<color=green>"..GetSafeName().."<color>");
	local strSex = gf_GetPlayerSexName();
	dialog_str = gsub(dialog_str,"<sex>",strSex);
	if GetSex() == 1 then
		strSex = "少侠";
	elseif GetSex() == 2 then
		strSex = "女侠";
	else
		strSex = "少侠/女侠";
	end;
	dialog_str = gsub(dialog_str,"<person>",strSex);
	if GetSex() == 1 then
		strSex = "大侠";
	elseif GetSex() == 2 then
		strSex = "女侠";
	else
		strSex = "大侠/女侠";
	end;
	dialog_str = gsub(dialog_str,"<bro_sis>",strSex);
	if GetSex() == 1 then
		strSex = "大侠";
	elseif GetSex() == 2 then
		strSex = "女侠";
	else
		strSex = "大侠/女侠";
	end;
	dialog_str = gsub(dialog_str,"<tbro_tsis>",strSex);
	return dialog_str
end

--任务对话
--nNpcTabIdx == TaskID
function tGtNpcMain:start_task_talk(nNpcTabIdx,nDialogNum)
	local nTaskTotal = tGtTask:check_task();
	if nTaskTotal == 0 then
		Talk(1,"","该任务已收到，请完成任务，然后再返回以获取更多信息");
		return 0;
	end
	local nRoomWeight = tGtNpcInfo[nNpcTabIdx]["data"][6];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 0;
		end
	end
	local strDialog = tGtNpcInfo[nNpcTabIdx]["get_talk"][nDialogNum];
	if strDialog == "" or strDialog == nil then
		tGtNpcMain:start_task(nNpcTabIdx,1);
	else
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nNpcTabIdx].from_npc);
		Talk(1,"#tGtNpcMain:start_task_talk("..nNpcTabIdx..","..(nDialogNum+1)..")",strDialog);
	end
end

--接任务处理
--nType为1时表示普通任务，为2时表示随机任务入口
function tGtNpcMain:start_task(nNpcTabIdx,nType)
	local nTaskTotal = tGtTask:check_task();
	if nTaskTotal == 0 then
		Talk(1,"","该任务已收到，请完成任务，然后再返回以获取更多信息");
		return 0;
	end	
	if nType == 2 then
		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx);
		tGtNpcInfo[nNpcTabIdx]["data"][4]();  --action
	elseif nType == 1 then --and nNpcTabIdx > 260 then		--2011新资料片
		--tGtTask:set_task(1,nNpcTabIdx)
		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx); --此处设置为了action触发器的处理
		SetTask(2956, nNpcTabIdx);
		--print("GetTask(2956) = ",GetTask(2956))
		--print("Open(\"TaskFace\","..nNpcTabIdx..",1)")
		--AcceptTask(nNpcTabIdx);
		SendScript2Client("Open(\"TaskFace\","..nNpcTabIdx..",1)");
--	elseif nType == 1 and nNpcTabIdx < 261 then		--2011双剑诛邪
--		tGtTask:set_task(1,nNpcTabIdx);
--		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx); --此处设置为了action触发器的处理
--		tGtNpcInfo[nNpcTabIdx]["data"][4]();
--		if tonumber(tGtNpcInfo[nNpcTabIdx].data[1]) == 1 then --随机任务
--			local nExTaskID = GetTaskTemp(tGtTask.GT_TEMP_RAND_ID);
--			tGtTask:set_ex_task(nNpcTabIdx,nExTaskID);
--		end
--		local strTip = tGtNpcInfo[nNpcTabIdx]["get_talk"].tip;
--		if strTip ~= nil and strTip ~= "" then 
--			TaskTip(strTip);
--		end
	end
	
end

--完成任务对话
function tGtNpcMain:finish_task_talk(nNpcTabIdx,nDialogNum)
	local nRoomWeight = tGtNpcInfo[nNpcTabIdx]["data"][7];
	if nRoomWeight ~= "" then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 0;
		end
	end
	local strDialog = tGtNpcInfo[nNpcTabIdx]["finish_talk"][nDialogNum];
	if strDialog == "" or strDialog == nil then
		self:finish_task(nNpcTabIdx);
	else
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nNpcTabIdx].to_npc);
		Talk(1,"#tGtNpcMain:finish_task_talk("..nNpcTabIdx..","..(nDialogNum+1)..")",strDialog);
	end
end

--完成任务处理
function tGtNpcMain:finish_task(nNpcTabIdx)
	SetTask(2956, nNpcTabIdx);
	SendScript2Client("Open(\"TaskFace\","..nNpcTabIdx..",2)");
end

--未完成任务对话
function tGtNpcMain:UnFinishTask(nTaskID)
	if tGtNpcInfo[nTaskID]["get_talk"].unFinish ~= nil and tGtNpcInfo[nTaskID]["get_talk"].unFinish ~= "" then
		local strDialog = tGtNpcMain:dialog_string_deal(tGtNpcInfo[nTaskID]["get_talk"].unFinish, sNpcName)
		Talk(1, "", strDialog)
	else
		Talk(1, "", "这个任务还没有完成。")
	end
end

function tGtNpcMain:cancel_main(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		local strName = "";
		for i = 3,TABLE_GT_MAIN:getRow() do
			if nTaskID == tonumber(TABLE_GT_MAIN:getCell(i,2)) then
				strName = TABLE_GT_MAIN:getCell(i,4);
				nTaskFlag = TABLE_GT_MAIN:getCell(i,3);
				break;
			end
		end
		if strName == "" then
			Talk(1, "", "该任务不能再此处取消，请进入山河社稷图取消任务。")
			return 0;
		else
			tGtNpcMain:get_main_table(strName);
		end
	end
	local nConditionResult = tGtNpcInfo[nTaskID].data[3](); --完成条件
	if GetTime() - GetTask(TASK_GT_TASK_CANCEL_TIME) < 60 then
		Talk(1,"","大侠取消任务太频繁了，稍等片刻再来吧。");
		return 0;
	end
	if nConditionResult ~= nil then --满足完成条件
		if tGtTask:trigger_finish_state(nTaskID) == 1 then --and (nTaskID <= 282 or nTaskID >= 293) then --触发器完成情况
			Talk(1,"","该任务已完成，您无需放弃此任务！");
			return 0;
		else
			local strFromNpc = tGtNpcInfo[nTaskID].from_npc;
			local	strToNpc = tGtNpcInfo[nTaskID].to_npc;
				local nMoney1 = tonumber(tGtNpcInfo[nTaskID].data[8]);
				if nMoney1 ~= -1 and nMoney1 ~= nil then
					tGtNpcMain:cancel_task_talk(nTaskID,nMoney1);
				else
					Talk(1,"","这个任务不能放弃！");
				end
		end
	else
		local strFromNpc = tGtNpcInfo[nTaskID].from_npc;
		local	strToNpc = tGtNpcInfo[nTaskID].to_npc;
		local nMoney1 = tonumber(tGtNpcInfo[nTaskID].data[8]);
		if nMoney1 ~= -1 and nMoney1 ~= nil then
			tGtNpcMain:cancel_task_talk(nTaskID,nMoney1);
		else
			Talk(1,"","这个任务不能放弃！");
		end	
	end
end

--取消任务对话
function tGtNpcMain:cancel_task_talk(nTaskID,nMoney)
	if nMoney == 0 then
		tGtNpcMain:cancel_task_confirm(nTaskID,nMoney);
		return
	end
	local strMoney = gf_GetMoneyString(nMoney);
	Say("取消这个任务需要消耗<color=yellow>"..strMoney.."<color>，你确定要取消吗",
		2,
		"\是的，我要取消/#tGtNpcMain:cancel_task_confirm("..nTaskID..","..nMoney..")",
		"\结束对话/nothing")
end

--确定取消任务
function tGtNpcMain:cancel_task_confirm(nTaskID,nMoney)
	if GetCash() < nMoney then
		Talk(1,"","您身上的铜钱不够");
		return 0;
	end
	if Pay(nMoney) == 1 or nMoney == 0 then
		tGtTask:remove_trigger(nTaskID);
		tGtTask:set_task(3,nTaskID);
		KillFollower();--把跟随npc干掉
		
		--删除任务道具
		--结束前动作：策划设定，删除，对话
		tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
		SetTask(TASK_GT_TASK_CANCEL_TIME,GetTime());
		if tGtNpcInfo[nTaskID].from_npc and strlen(tGtNpcInfo[nTaskID].from_npc) > 0 then
			Msg2Player("您成功取消了这个任务，可以找["..tGtNpcInfo[nTaskID].from_npc.."]重新接此任务。");
			Talk(1,"","您成功取消了这个任务，可以找["..tGtNpcInfo[nTaskID].from_npc.."]重新接此任务");
		else
			Msg2Player("您取消了这个任务。");
			Talk(1,"","您取消了这个任务。");
		end
		----------------------------------------------------------
	end
end   

--跳过任务对话
function tGtNpcMain:skip_task_talk(nTaskID,nMoney)
	local strMoney = gf_GetMoneyString(nMoney);
	Say("跳过这个任务需要消耗<color=yellow>"..strMoney.."<color>，你确定要跳过吗？",
		2,
		"\是的，我要跳过/#tGtNpcMain:skip_task_confirm("..nTaskID..","..nMoney..")",
		"\结束对话/nothing")
end

--确定跳过任务
function tGtNpcMain:skip_task_confirm(nTaskID,nMoney)
	if GetCash() < nMoney then
		Talk(1,"","你身上带的银两不够，请检查！");
		return 0;
	end
	if Pay(nMoney) == 1 or nMoney == 0 then
		tGtTask:remove_trigger(nTaskID);
		tGtTask:set_task(3,nTaskID);
		KillFollower();--把跟随npc干掉
		
		--删除任务道具
		--结束前动作：策划设定，删除，对话
		tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
		SetTask(TASK_GT_TASK_CANCEL_TIME,GetTime());
		if tGtNpcInfo[nTaskID].from_npc and strlen(tGtNpcInfo[nTaskID].from_npc) > 0 then
			Msg2Player("您成功跳过了["..tGtNpcInfo[nTaskID].from_npc.."]任务");
			Talk(1,"","您成功跳过了["..tGtNpcInfo[nTaskID].from_npc.."]任务");
		else
			Msg2Player("您跳过了这个任务。");
			Talk(1,"","您跳过了这个任务。");
		end
--		tGtNpcMain:finish_task(nTaskID);
	end
end

--完成任务奖励提示
function tGtNpcMain:ShowAward(nTaskID)
	local TaskName = nil
	local strPrize = nil
	for i = 3,TABLE_GT_MAIN:getRow() do
		if nTaskID == tonumber(TABLE_GT_MAIN:getCell(i,2)) then
			TaskName = TABLE_GT_MAIN:getCell(i,1);
			strPrizeID = TABLE_GT_MAIN:getCell(i,9);
			bFlag = 1
			break;
		end
	end
	if not TaskName or not strPrizeID then
		return
	end
	local msg = "";
	local nCount = 0;
	while 1 do
		if nCount > 10 then
			break
		end
		local nIndex = strfind(strPrizeID, "&") or (strlen(strPrizeID) + 1);
		local nConditionID = tonumber(strsub(strPrizeID, 1, nIndex - 1))
		g_GtPrize = g_GtPrize or {}
		if not g_GtPrize[nConditionID] then
			g_GtPrize[nConditionID] = {};
			local nIDRow = TABLE_GT_PRIZE:selectRowNum(1,nConditionID);
			g_GtPrize[nConditionID][1] = TABLE_GT_PRIZE:getCell(nIDRow,2);
			for i = 3,8 do
				g_GtPrize[nConditionID][i-1] = TABLE_GT_PRIZE:getCell(nIDRow,i);
			end
			if tGtPrize.tPrizeType[g_GtPrize[nConditionID][1]] == nil then
				return nil;
			end
		end
		if g_GtPrize[nConditionID][1] == "Exp" then
			msg = msg..format("Exp:%s", g_GtPrize[nConditionID][2]).."\n"
		elseif g_GtPrize[nConditionID][1] == "Item" then
			local cIndex = nil
			local strItem = g_GtPrize[nConditionID][2];
			for i = 1, strlen(strItem) do
				if strsub(strItem, i, i) == "," then
					cIndex = i
				end
			end
			if not cIndex then
				msg = msg..format("获得 %s", g_GtPrize[nConditionID][3]).."\n"
			else
				local nNum = tonumber(strsub(strItem, cIndex + 1, strlen(strItem)))
				msg = msg..format("获得 %s*%d", g_GtPrize[nConditionID][3], nNum).."\n"
			end
		elseif	g_GtPrize[nConditionID][1] == "Money" then
			msg = msg..format("获得 %d 银两", tonumber(g_GtPrize[nConditionID][2])/10000).."\n"
		elseif	g_GtPrize[nConditionID][1] == "ZhenQi" then
			msg = msg..format("获得 %s真气", g_GtPrize[nConditionID][2]).."\n"
		end
		if nIndex + 1 > strlen(strPrizeID) then
			break
		end
		strPrizeID = strsub(strPrizeID, nIndex + 1, strlen(strPrizeID)) 
		nCount = nCount + 1	
	end 
	Talk(1,"",format("完成[<color=gold>%s<color>]任务，获得奖励：\n<color=green>%s<color>", TaskName, msg))
end

--=======================条件处理====================================
tGtCondition = {};

--检测任务ID为nTaskID的任务状态
--nValue为1表示检测是否已经完成该任务，为0表示未接该任务（一般用于分支选择），2表示是否接了
function tGtCondition:check_taskid(nTaskID,nValue)
	nTaskID = tonumber(nTaskID);
	nValue = tonumber(nValue);
	if nTaskID == nil or nValue == nil then
		return nil;
	end
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);
	if nBit == 0 then
		nBit = 31;
	end
	local nResult = gf_GetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit);
	if nValue == 1 and nResult == nValue then
		return 1;
	elseif nValue == 0 then
		local nCheckCurTask = tGtTask:check_cur_task(nTaskID);
		if nCheckCurTask == 1 or nResult == 1 then --接了该任务或者该任务已经完成
			return nil;
		else
			return 1;
		end
	elseif nValue == 2 then
		local nCheckCurTask = tGtTask:check_cur_task(nTaskID);
		if nCheckCurTask == 1 and nResult == 0 then
			return 1;
		else
			return nil;
		end
	end
	return nil;
end

--检测玩家等级是否大于等于nValue
function tGtCondition:check_lv(nValue, nReborn)
	nValue = tonumber(nValue) or 9999;
	nReborn = tonumber(nReborn) or 0;
	local nNeedLv = nReborn * 100 + nValue;
	local nCurrLv = gf_GetPlayerRebornCount() * 100 + GetLevel();
	if nCurrLv >= nNeedLv then
		return 1;
	else
		return nil;
	end
end

--检测玩家任务变量nValue1的值与nValue2的关系nValue3
function tGtCondition:check_tv(nValue1,nValue2,nValue3)
	nValue1 = tonumber(nValue1);
	nValue2 = tonumber(nValue2);
	nValue3 = tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil or nValue3 == nil then
		return nil;
	end
	return ((1 == nValue3 and GetTask(nValue1) == nValue2) or
	        (2 == nValue3 and GetTask(nValue1) >  nValue2) or
	        (3 == nValue3 and GetTask(nValue1) >= nValue2) or
	        (4 == nValue3 and GetTask(nValue1) <  nValue2) or
	        (5 == nValue3 and GetTask(nValue1) <= nValue2) or
	        (6 == nValue3 and GetTask(nValue1) ~= nValue2));
end

--检测玩家任务变量nValue1的值与nValue2的关系nValue3
function tGtCondition:check_tv_bit(nValue1,nValue2,nValue3)
	nValue1 = tonumber(nValue1);
	nValue2 = tonumber(nValue2);
	nValue3 = tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil or nValue3 == nil then
		return nil;
	end
	return ((GetBit(GetTask(nValue1), nValue2) == nValue3));
end

--检测前一个任务是否已经完成
function tGtCondition:check_ex_task()
	local nTaskID = GetTaskTemp(tGtTask.GT_TEMP_TASK_ID);
	if nTaskID == 0 then
		return nil;
	else
		local nCheck = self:check_taskid(nTaskID-1,1);
		if nCheck == 1 then
			return 1;
		else
			return nil;
		end
	end
end

function tGtCondition:check_kill()
	return 1;
end

function tGtCondition:do_script()
	return 1;
end
--nValue 为 1 验证是男，2为女
function tGtCondition:sex(nValue)
	nValue = tonumber(nValue);
	if nValue == 1 or nValue == 2 then
		local nSex = GetSex();
		if nSex == nValue then
			return 1
		end
	end

	return nil;
end

function tGtCondition:command(nValue)
	if nValue == "" then
		return nil;
	end

	dostring("return "..nValue);
end

function tGtCondition:_nil()
	return nil;
end

function tGtCondition:check_player_route(nValue)
	nValue = tonumber(nValue);	
	if nValue == 1 then --不加入门派才可以接
		if gf_IsPlayerRoute() ~= 1 then
			return 1
		else
			return nil
		end
	elseif nValue == 2 then --加入门派才可以接
		if gf_IsPlayerRoute() == 1 then
			return 1
		else
			return nil
		end
	end

	return nil
end

function tGtCondition:check_player_tong(nValue)
	nValue = tonumber(nValue);	
	if nValue == 0 then --不加入帮会才可以接
		if gf_CheckPlayerTong() ~= 1 then
			return 1
		else
			return nil
		end
	elseif nValue == 1 then --加入帮会才可以接
		if gf_CheckPlayerTong() == 1 then
			return 1
		else
			return nil
		end
	end

	return nil
end

--1、需要在队伍中
--2、需要不在队伍中
function tGtCondition:is_in_team(nValue)
	nValue = tonumber(nValue);
	if nValue == 0 then
		if gf_CheckPlayerTeam() == 0 then
			return 1
		else
			return nil
		end
	elseif nValue == 1 then
		if gf_CheckPlayerTeam() >= 1 then
			return 1
		else
			return nil
		end
	elseif nValue == 2 then
		if gf_CheckPlayerTeam() == 2 then
			return 1
		else
			return nil
		end
	end
	return nil
end

--nKey 
--1，等于nLevel
--2，大于nLevel
--3，大于等于nLevel
--4，小于nlevel
--5，小于等于nlLevel
function tGtCondition:check_meridian(sLevel, sKey)
	local nLevel = tonumber(sLevel);
	local nKey = tonumber(sKey);
	if nLevel < 0 or nLevel > 6 then
		return nil;
	end
	if nKey < 1 or nKey > 5 then
		return nil;
	end
	local nCurrentLevel = MeridianGetLevel();
	if nKey == 1 then
		if nCurrentLevel == nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 2 then
		if nCurrentLevel > nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 3 then
		if nCurrentLevel >= nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 4 then
		if nCurrentLevel < nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 5 then
		if nCurrentLevel <= nLevel then
			return 1;
		else
			return nil;
		end
	end
end

--nKey 
--1，等于nLevel
--2，大于nLevel
--3，大于等于nLevel
--4，小于nlevel
--5，小于等于nlLevel
function tGtCondition:check_reborn(sLevel, sKey)
	local nLevel = tonumber(sLevel);
	local nKey = tonumber(sKey);
	if nLevel < 0 or nLevel > 7 then
		return nil;
	end
	local nCurrentLevel = gf_GetPlayerRebornCount();
	if nKey == 1 then
		if nCurrentLevel == nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 2 then
		if nCurrentLevel > nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 3 then
		if nCurrentLevel >= nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 4 then
		if nCurrentLevel < nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 5 then
		if nCurrentLevel <= nLevel then
			return 1;
		else
			return nil;
		end
	end
end

function tGtCondition:check_exp(nExp)
	local nNeedExp = tonumber(nExp)
	if GetExp() < nNeedExp then
		return nil
	end
	return 1;
end

--检测物品
function tGtCondition:check_item(nID1,nID2,nID3,nNums,sName)
	nID1,nID2,nID3,nNums,sName = tonumber(nID1),tonumber(nID2),tonumber(nID3),tonumber(nNums),tostring(sName);
	if nID1 == nil or nID2 == nil or nID3 == nil or nNums == nil or sName == nil then
		return nil;
	end
	if GetItemCount(nID1,nID2,nID3) < nNums then
		return nil;
	else
		return 1;
	end
end

-- 参数说明
-- nValue1：装备位置（如：0=头盔;1=上衣;2=武器;3=下衣;4=配饰1;5=配饰1;6=外装头盔;7=外装上衣;8=外装下衣;9=副秘籍;10=坐骑;11=秘籍）
-- nID1：装备物品nGenre（如：0）
-- nID2：装备物品nDetail（如：0）
-- nID3：装备物品nParticular（如：10015）
-- sKey：是否装备（1: 装备；0: 未装备）
function tGtCondition:check_equip(nValue1, nID1,nID2,nID3)
	nValue1, nID1, nID2, nID3 = tonumber(nValue1), tonumber(nID1), tonumber(nID2), tonumber(nID3);
	if nValue1 == "" or nID1 == nil or nID2 == nil or nID3 == nil  then
		return nil;
	end
	nGenre,nDetail,nParticular = GetPlayerEquipInfo(nValue1);    --获得身上的装备id（0-11）
	if nGenre == nID1 and nDetail == nID2 and nParticular == nID3  then
		return 1;
	else
		return nil
	end
	return nil
end

tGtCondition.tConditionType = {
	TaskID = tGtCondition.check_taskid,  --检测任务ID
	Lv = tGtCondition.check_lv,			--检测等级
	Item = tGtCondition.check_item,		--检测物品
	Tv = tGtCondition.check_tv,			--检测任务变量值
	TvBit = tGtCondition.check_tv_bit,	--检测任务变量值(Bit)
	ExTask = tGtCondition.check_ex_task,
	Killer = tGtCondition.check_kill,
	Sex = tGtCondition.sex,
	CheckPlayerRoute = tGtCondition.check_player_route,
	CheckTong = tGtCondition.check_player_tong,
	IsInTeam = tGtCondition.is_in_team,
	Script = tGtCondition.do_script,
	Meridian = tGtCondition.check_meridian,--检测经脉等级
	Reborn = tGtCondition.check_reborn, --检测转生等级
	Exp = tGtCondition.check_exp, --检测经验
	Equip = tGtCondition.check_equip, 	--检测身上装备
};

--传入条件ID，得到条件Type，执行对应函数
function tGtCondition:check(nConditionID)
	g_GtCondition = g_GtCondition or {};
	if not g_GtCondition[nConditionID] then
		g_GtCondition[nConditionID] = {};
		local nIDRow = TABLE_GT_CONDITION:selectRowNum(1,nConditionID);
		g_GtCondition[nConditionID][1] = TABLE_GT_CONDITION:getCell(nIDRow,2);
		for i = 3,8 do
			g_GtCondition[nConditionID][i-1] = TABLE_GT_CONDITION:getCell(nIDRow,i);
		end
		if tGtCondition.tConditionType[g_GtCondition[nConditionID][1]] == nil then
			return nil;
		end
	end
	local nConditionType = g_GtCondition[nConditionID][1];
	return tGtCondition.tConditionType[nConditionType](self,g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5],g_GtCondition[nConditionID][6]);
end

--任务条件处理
function tGtCondition:get_sub(sExpression)
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:check(%1)");
	return sExpression
end

--参数传入表达式，结果返回1或nil
function tGtCondition:result(sExpression)
	sExpression = tGtCondition:get_sub(sExpression);
	dostring("nConditionResult = "..sExpression);
	return nConditionResult;
end

--传入Action ID，检测需要删除的物品
function tGtCondition:check_del_item(nConditionID)
	if g_GtCondition[nConditionID] ~= nil then
		if g_GtCondition[nConditionID][1] == "Item" then
			if DelItem(g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5]) == 1 then
				return 1;
			else
				return nil;
			end
		end
		if g_GtCondition[nConditionID][1] == "Exp" then
			local nExp = tonumber(g_GtCondition[nConditionID][2]);
			if GetExp() < nExp then
				return nil;
			end
			ModifyExp(-nExp);
			return 1;
		end
	end
	return 1;
end

--传入Action ID，检测需要删除的物品
function tGtCondition:force_del_item(nConditionID)
	--g_GtCondition可能未初始化
	self:check(nConditionID);
	if g_GtCondition[nConditionID] ~= nil then
		if g_GtCondition[nConditionID][1] == "Item" then
			if BigDelItem(g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5]) == 1 then
				return 1;
			else
				return 2;
			end
		end
	end
	return 1;
end

--强制删除任务道具
function tGtCondition:del_item_force(sExpression)
	if sExpression == "" or sExpression == nil then
		return 1;
	end
	sExpression = gsub(sExpression,"&"," ; ");
	sExpression = gsub(sExpression,"|"," ; ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:force_del_item(%1)");
	dostring(sExpression);
	return 0;
end

--任务完成条件，检测要删除的物品并执行删除操作
function tGtCondition:del_item_confirm(sExpression)
	if sExpression == "" or sExpression == nil then
		return 1;
	end
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:check_del_item(%1)");
	dostring("g_ret = "..sExpression);
	return g_ret;
end

--=========================Action & Prize处理=============================
tGtPrize = {};

--创建触发器
function tGtPrize:create_trigger(nValue1,nValue2,nValue3)
	if (nValue1 == nil and nValue2 == nil) or nValue3 == nil then
		return nil;
	end
	if tonumber(nValue1) == 1 and nValue3 == nil then
		return nil;
	end
	local TaskID = GetTaskTemp(tGtTask.GT_TEMP_TASK_ID);
	if TaskID == 0 then
		return nil;
	end
	local nTaskValue = tGtTask:get_task(TaskID); --记录此任务ID的任务变量
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	gf_SetTaskByte(nTaskValue2,2,nCount+1);
	local nValue3 = tGtTask.GT_TRIGGER_OFFSET+TaskID*10+nCount+1; --自定义ID为任务ID*10+4000偏移量+触发器的数量
	local n = CreateTrigger(tonumber(nValue1),tonumber(nValue2),nValue3,1);
	if tonumber(nValue1) == 1 then
		ContinueTimer(n);
	end
end

--给予任务ID为nValue1的任务，不再检测任务条件
function tGtPrize:task_next(nValue1)
	nValue1 = tonumber(nValue1);
	if nValue1 == nil then
		return nil;
	end
	tGtNpcMain:start_task_talk(nValue1,1);
end

--传入任务ID和概率获取任务ID
function tGtPrize:rand_task(nValue1,nValue2)
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	local tTaskID = split(nValue1,";");
	local tIDrand = split(nValue2,";");
	local nTotal = 0;
	for i = 1,getn(tIDrand) do
		nTotal = nTotal + tonumber(tIDrand[i]);
	end
	local nRand = random(1,nTotal);
	local nCurRand = 0;
	local nTaskID = 0;
	for i = 1,getn(tIDrand) do
		nCurRand = nCurRand + tonumber(tIDrand[i]);
		if nRand <= nCurRand then
			nTaskID = tonumber(tTaskID[i]);
			break;
		end
	end
	if nTaskID ~= 0 and nTaskID ~= nil then
		SetTaskTemp(tGtTask.GT_TEMP_RAND_ID,GetTaskTemp(tGtTask.GT_TEMP_TASK_ID));
		tGtNpcMain:start_task_talk(nTaskID,1);
	end
end

--给予经验
function tGtPrize:give_exp(nValue1)
	if nValue1 == "" then
		return nil;
	end
	local nLv = GetLevel();
	nValue1 = gsub(nValue1,"Lv",nLv);
	dostring("gf_Modify('Exp',"..nValue1..")");
end

--给予真气
function tGtPrize:give_zhenqi(nValue)
	if nValue == "" then
		return nil;
	end
--	if tonumber(nValue) > 1000 then
--		print("WARN: \\script\\task\\global_task\\gtask_head.lua tGtPrize:give_zhenqi nValue > 1000")
--	end
	AwardGenuineQi(tonumber(nValue));
end

--AddMstPtByParam
function AddMstPtByParam(nValue)
	if nValue == "" then
		return nil;
	end
	nValue = nValue * 100
	AwardGenuineQi(tonumber(nValue));
end

--给予物品
function tGtPrize:give_item(nValue1,nValue2,nValue3)
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	dostring("gAddFlag,gAddIdx = gf_AddItemEx({"..nValue1.."},'"..nValue2.."')");
	if nValue3 ~= "" then
		nValue3 = tonumber(nValue3);
		if gAddFlag == 1 then
			SetItemExpireTime(gAddIdx,nValue3);
		end
	end
	gAddFlag,gAddIdx = nil,nil
end

--设置变量值
function tGtPrize:set_task_value(nValue1,nValue2,nValue3)
	nValue1, nValue2, nValue3 = tonumber(nValue1), tonumber(nValue2), tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil then
		return nil;
	end
	if nValue3 then
		SetTask(nValue1,nValue2);
	else
		SetTask(nValue1, nValue2 + GetTask(nValue1));
	end
end

--设置变量值Bit
function tGtPrize:set_task_bit_value(nValue1,nValue2,nValue3)
	nValue1, nValue2, nValue3 = tonumber(nValue1), tonumber(nValue2), tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil or nValue3 == nil then
		return nil;
	end
	SetTask(nValue1, SetBit(GetTask(nValue1), nValue2, nValue3));
end

--给钱
function tGtPrize:give_money(nValue1)
	if nValue1 == "" then
		return nil;
	end
	dostring("gf_Modify('Money',"..nValue1..")");
end

--给银券
function tGtPrize:give_yinquan(nValue1)
	if nValue1 == "" then
		return nil;
	end
	dostring("gf_Modify('YinJuan',"..nValue1..")");
end

--给活跃度
function tGtPrize:give_activity(nValue1)
	if nValue1 == "" then
		return nil;
	end
--	dostring("gf_Modify('YinJuan',"..nValue1..")");
end

--执行某个脚本里的某个函数
function tGtPrize:send_script(nValue)
	if nValue == "" then
		return nil;
	end
	dofile(nValue);
end

function tGtPrize:tong_score(nValue1)
	nValue1 = tonumber(nValue1);
	if nValue1 == nil then
		return nil;
	end
	ModifyPlayerCurWeekScore(nValue1);
	ModifyTongCurWeekScore(nValue1);
	Msg2Player("您收到了"..nValue1.."赏善罚恶值！");
end

function tGtPrize:create_npc(nValue1,nValue2,nValue3,nValue4)
	nValue1,nValue2,nValue3 = tostring(nValue1),tostring(nValue2),tonumber(nValue3);
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	nValue3 = nValue3 or 1;
	for i = 1,nValue3 do
		local nNpcIdx;
		local nMapId,nX,nY = GetWorldPos();
		local i = random(4);
		local j = random(4);
		local tbTemp = {2,-2,1,-1};
		nNpcIdx = CreateNpc(nValue1,nValue2,nMapId,nX+tbTemp[i],nY+tbTemp[j]);
		if nValue4 ~= "" and nValue4 ~= nil then
			SetNpcScript(nNpcIdx,nValue4)
		else
			SetNpcScript(nNpcIdx, "\\script\\task\\global_task\\gtask_npc.lua");
		end
		SetNpcLifeTime(nNpcIdx,3*60); --Npc默认生存时间3min
	end
end

function tGtPrize:change_npc_to_fight()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
	local sNpcName = GetTargetNpcName();
	--change npc 特殊处理
	if sNpcName == "九头金凤" and (tGtTask:check_cur_task(416) == 1 or tGtTask:check_cur_task(686) == 1) then
		SetNpcDeathScript(nIndexNpc,"\\script\\中原二区\\暮雪山庄\\npc\\九头金凤.lua");
		return 1;
	end
	if sNpcName == "陈飞扬" and tGtTask:check_cur_task(540) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\中原二区\\剑阁蜀道\\npc\\陈飞扬.lua");
		return 1;
	end
	if sNpcName == "苗岭族长" and tGtTask:check_cur_task(762) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\西南区\\苗岭\\npc\\苗岭族长.lua");
		return 1;
	end
	if sNpcName == "武陵山秋蓉" and (tGtTask:check_cur_task(572) == 1 or tGtTask:check_cur_task(784) == 1) then
		SetNpcDeathScript(nIndexNpc,"\\script\\西南区\\武陵山\\npc\\武陵山秋蓉.lua");
		return 1;
	end
	if sNpcName == "落魄的山贼" and tGtTask:check_cur_task(471) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\中原二区\\伏牛山\\npc\\落魄的山贼.lua");
		return 1;
	end
	if sNpcName == "梅若童" and  (tGtTask:check_cur_task(22) == 1 or tGtTask:check_cur_task(25) == 1) then
		SetNpcDeathScript(nIndexNpc,"\\script\\中原二区\\峨嵋\\npc\\梅若童.lua");
		return 1;
	end
	if sNpcName == "薛虎" and  (tGtTask:check_cur_task(28) == 1 or tGtTask:check_cur_task(29) == 1) then
		SetNpcDeathScript(nIndexNpc,"\\script\\中原二区\\青城山\\npc\\薛虎.lua");
		return 1;
	end
	if sNpcName == "车轮霸王" and  (tGtTask:check_cur_task(746) == 1) then
		SetNpcDeathScript(nIndexNpc,"\\script\\西北区\\龙门镇\\npc\\车轮霸王.lua");
		return 1;
	end
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_head.lua");
	return 1;
end

function OnDeath(nIndexNpc)
	SetNpcLifeTime(nIndexNpc,0);
end

--根据性别选择
function tGtPrize:sex(tValue)
	local tTaskID = split(tValue, ";");
	if getn(tTaskID) == 2 then
		tGtNpcMain:start_task_talk(tonumber(tTaskID[GetSex()]), 1);
	end
end

function tGtPrize:newWorld(nValue1, nValue2, nValue3)
	--print("!!!newnew!!!")
	NewWorld(tonumber(nValue1), tonumber(nValue2), tonumber(nValue3));
end

function tGtPrize:add_stat_value(nValue1, nValue2)
	nValue2 = tonumber(nValue2)
	if nValue1 == "" then
		return nil;
	end

	dostring(format("AddStatValue('%s', %d)", nValue1, nValue2));
end

function tGtPrize:command(nValue1)
	if nValue1 == "" then
		return nil;
	end

	dostring(nValue1);
end

function tGtPrize:exec_func(szPath, szFunc)
	if szPath == "" or szFunc == "" then
		return nil;
	end
	SetPlayerScript(szPath);
	SendScript2VM(szPath, szFunc);
end

-- 参数说明
-- nValue1：技能ID（如：20）
-- nValue2：变量（如：3378）
-- nValue3：写入数值（1）
function tGtPrize:exec_learnskill_to_value(nValue1, nValue2, nValue3)
	nValue1, nValue2, nValue3 = tonumber(nValue1), tonumber(nValue2), tonumber(nValue3);
	if nValue1 == "" or nValue2 == ""  or nValue3 == "" then
		return nil;
	end
	
	if GetSkillLevel(nValue1) >= 1 then
		SetTask(nValue2,nValue3);
	end;
end


tGtPrize.tPrizeType = {
	Trigger = tGtPrize.create_trigger,  --创建触发器
	Exp = tGtPrize.give_exp,			--给予经验
	Item = tGtPrize.give_item,		--给予物品
	Tv = tGtPrize.set_task_value,			--设置任务变量值
	TvBit = tGtPrize.set_task_bit_value,			--设置任务变量值(Bit)
	Money = tGtPrize.give_money,			--给予钱
	TaskNext = tGtPrize.task_next,    --接取任务
	Rand = tGtPrize.rand_task,       --随机任务
	Script = tGtPrize.send_script,   --执行某个脚本里的某个函数
	Score = tGtPrize.tong_score,     --给予赏善罚恶值（帮会）
	CrNpc = tGtPrize.create_npc,       --创建npc
	ChangeNpc = tGtPrize.change_npc_to_fight,   --转换战斗npc
	Sex = tGtPrize.sex,				--判断性别
	Stat = tGtPrize.add_stat_value,		--数据埋点
	NewWorld = tGtPrize.newWorld,		--坐标
	--DelItem = tGtPrize.delItem,			--删除，不支持
	ZhenQi = tGtPrize.give_zhenqi,
	Skill = tGtPrize.exec_learnskill_to_value, 	--根据所学技能写入变量
	Command = tGtPrize.command,			--执行脚本，有了他实际上可以不用上面部分的内容了
	Function = tGtPrize.exec_func, 	--执行脚本函数
	YinQuan = tGtPrize.give_yinquan, 			--给银券
	Activity = tGtPrize.give_activity, 			--给活跃度
};

--传入Action ID，得到Action Type，执行对应函数
function tGtPrize:action_prize(nConditionID)
	g_GtPrize = g_GtPrize or {}
	if not g_GtPrize[nConditionID] then
		g_GtPrize[nConditionID] = {};
		local nIDRow = TABLE_GT_PRIZE:selectRowNum(1,nConditionID);
		g_GtPrize[nConditionID][1] = TABLE_GT_PRIZE:getCell(nIDRow,2);
		for i = 3,8 do
			g_GtPrize[nConditionID][i-1] = TABLE_GT_PRIZE:getCell(nIDRow,i);
		end
		if tGtPrize.tPrizeType[g_GtPrize[nConditionID][1]] == nil then
			return nil;
		end
	end
	local nConditionType = g_GtPrize[nConditionID][1];
	tGtPrize.tPrizeType[nConditionType](self,g_GtPrize[nConditionID][2],g_GtPrize[nConditionID][3],g_GtPrize[nConditionID][4],g_GtPrize[nConditionID][5],g_GtPrize[nConditionID][6],g_GtPrize[nConditionID][7]);
	return 1;
end

--任务条件处理
function tGtPrize:get_sub(sExpression)
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtPrize:action_prize(%1)");
	return sExpression
end

--参数传入表达式，执行
function tGtPrize:result(sExpression)
	sExpression = tGtCondition:get_sub(sExpression);
	dostring(sExpression);
end

