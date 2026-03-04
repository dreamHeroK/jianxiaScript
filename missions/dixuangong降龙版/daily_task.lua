--地玄宫每日任务
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

N_DIXUANGONG_DAILY_TASK_ID = 3204
N_DIXUANGONG_DAILY_TASK_ACCESS_CODE = TASK_ACCESS_CODE_DAILY_TASK
N_TASK_STATUS_NONE=0
N_TASK_STATUS_DOING=1
N_TASK_STATUS_FINISH=2
N_TASK_STATUS_AWARDED=3

DXG_NPC_NAME = ""

t_dxg_task={
	[1] = {
		Name = "地玄宫探秘",
		TaskByte = 1,
		Desc = "通过1-3关",
		
	},
	[2] = {
		Name = "勇闯地玄宫",
		TaskByte = 2,
		Desc = "通过所有关卡",
	},
	[3] = {
		Name = "大破地玄宫",
		TaskByte = 3,
		Desc = "击败BOSS: %s",
	},
}

t_boss_list={
	--name, rate
	{"天阴巫师",15},
	{"天阴狱卒头目",15},
	{"地玄宫宫主",20},
	{"天阴教红旗精英",10},
	{"天阴教黑旗精英",10},
	{"天阴教蓝旗精英",10},
	{"天阴教黄旗精英",10},
	{"天阴教白旗精英",10},
}

t_dixuangong_daily_task_award={
	[1] = {
		nBagLimit = 2,
		nWeightLimit = 100,
		fix_award={
--    			{1,"地玄金令",{2,95,674,1},0,1},
    			{2,9000000},--经验
		},
		rand_award={
			{ {"神器", {2,95,55,2,4}, nil,nil, {1, 100}}, 3500},
			{ {"六阳正气丹", {2,1,30351,1, 4}, nil,nil,{1, 100} }, 4500},
			{ {"千里传音符纸", {2,1,3508,1, 4}, nil,nil,{1, 100} }, 500},
--			{ {"地玄金令", {2,95,674,1, 4}, nil,nil,{1, 100} }, 50},
		},
	},
	[2] = {
		nBagLimit = 2,
		nWeightLimit = 100,
		fix_award={
--			{1,"地玄金令",{2,95,674,1},0,1},
			{2,9000000},--经验
		},
		rand_award={
			{{MA_GiveMoney, {50000}}, 4000},
			{{MA_GiveMoney, {100000}}, 800},
			{{MA_GiveMoney, {400000}}, 100},
			{ {"千里传音符纸", {2,1,3508,1, 4}, nil,nil,{1, 100} }, 500},
			{ {"神器", {2,95,55,2,4}, nil,nil, {1, 100}}, 2000},
			{ {"陨铁", {2,2,8,1,4}, nil,nil, {1, 100}}, 700},
			{ {"八宝粽子", {2,1,1125,1, 4}, nil,nil,{1, 100} }, 300},
			{ {"小般若树种", {2,0,504,1, 4}, nil,nil,{1, 100} }, 600},
--			{ {"地玄金令", {2,95,674,1, 4}, nil,nil,{1, 100} }, 100},
		},
	},
	[3] = {
		nBagLimit = 2,
		nWeightLimit = 100,
		fix_award={
--			{1,"地玄金令",{2,95,674,1},0,1},
			{2,9000000},--经验
		},
		rand_award={
			{{MA_GivePopur, {1000}}, 2500},
			{{MA_GivePopur, {2000}}, 2500},
			{{MA_GivePopur, {4000}}, 500},
			{ {"神器", {2,95,55,4,4}, nil,nil, {1, 100}}, 1500},
			{ {"般若树种", {2,0,398,1, 4}, nil,nil,{1, 100} }, 500},
--			{ {"地玄金令", {2,95,674,1, 4}, nil,nil,{1, 100} }, 100},
		},
	},
}

function dxg_daily_task_menu()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	local tbSay = {}
	local szTitle = DXG_NPC_NAME.."我正在召集江湖人士共闯地玄宫"
	for i=1,getn(t_dxg_task) do
		local szName = task_name(i)
		local szStep = task_step(i)
		tinsert(tbSay, format("%s(%s)/#dxg_daily_task_talk(%d)",szName, szStep, i))
	end
	tinsert(tbSay, "结束对话/nothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function dxg_daily_task_msg_to_menu(szMsg)
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
--	if gf_CheckCamp() <= 0 then
--	 	Talk(1,"","请先加入阵营再来！")要加阵营我取消测试
--		return 
--	end
	local tbSay = {}
	local szTitle = format("%s地玄宫是天阴教重要的组织之一，若能将其剿灭定能重挫天阴教的锐气。大侠能否当此大任?\n%s", DXG_NPC_NAME, szMsg)
	tinsert(tbSay, format("%s/%s","返回","dxg_daily_task_menu"))
	tinsert(tbSay, "结束对话/nothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function nothing()
end

function dxg_daily_task_talk(nTaskIndex)
--	if gf_CheckCamp() <= 0 then
--	 	Talk(1,"","请先加入阵营再来！")要加阵营我取消测试
--		return 
--	end
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_NONE then
		_task_talk_give_task(nTaskIndex)
	elseif nStep == N_TASK_STATUS_DOING then
		dxg_daily_task_msg_to_menu(format("你当前的任务情况：%s - %s（<color=green>%s<color>）",task_name(nTaskIndex), task_desc(nTaskIndex), task_step(nTaskIndex)));
	elseif nStep == N_TASK_STATUS_FINISH then
		_task_talk_award(nTaskIndex)
	elseif nStep == N_TASK_STATUS_AWARDED then
		dxg_daily_task_msg_to_menu(format("今日任务%s已完成，明天再来吧", task_name(nTaskIndex)));
	end
end

function dixuangong_daily_clear()
	local n = 0
	for i = 1,getn(t_dxg_task) do
		if get_task_step(i) == N_TASK_STATUS_AWARDED then
			set_task_status(i, 0)
			n = n + 1
		end
	end
	return n
end

function dxg_task_check_and_finish_task(nTaskIndex, nNpcIdx)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_DOING then
		local nNewStep = N_TASK_STATUS_FINISH
		if nTaskIndex == 3 then
			local nBossName = GetNpcName(nNpcIdx)
			local nTaskType = get_task_type(nTaskIndex)
			local t = t_boss_list[nTaskType]
			if nBossName ~= t[1] then
				nNewStep = N_TASK_STATUS_DOING
			end
		end
		if nNewStep == N_TASK_STATUS_FINISH then
			local szTask = task_name(nTaskIndex)
			local nNewStatus = get_task_type(nTaskIndex) * 10 + nNewStep
			set_task_status(nTaskIndex, nNewStatus)
			Msg2Player(format("任务%s已完成", szTask))
			return 1
		end
	end
	return 0
end

function _task_talk_give_task(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_NONE then
    	local nRandTask = 0
    	if 3 == nTaskIndex then
    		local nRand = random(1,100)
    		local n = nRand
    		for i=1,getn(t_boss_list) do
    			n = n - t_boss_list[i][2]
    			if n <= 0 then
    				nRandTask = i
    				break
    			end
    		end
    	end
    	local nTaskStatus = nRandTask * 10 + N_TASK_STATUS_DOING
    	set_task_status(nTaskIndex, nTaskStatus)
    	local szMsg = format("成功领取任务%s：%s",task_name(nTaskIndex), task_desc(nTaskIndex))
    	local szMsg2 = format("成功领取任务%s：<color=green>%s<color>",task_name(nTaskIndex), task_desc(nTaskIndex))
    	Msg2Player(szMsg)
    	dxg_daily_task_msg_to_menu(szMsg2)
    	return 1
	end
	return 0
end

function get_task_status(nTaskIndex)
	local t=t_dxg_task[nTaskIndex]
	local nTaskByte = t.TaskByte
	local nTask = GetTask(N_DIXUANGONG_DAILY_TASK_ID)
	local nRet = SafeGetByte(nTask,nTaskByte)
	return nRet
end
function get_task_step(nTaskIndex)
	local nStep = mod(get_task_status(nTaskIndex),10)
	return nStep
end
function get_task_type(nTaskIndex)
	local nType = floor(get_task_status(nTaskIndex)/10)
	return nType
end
function set_task_status(nTaskIndex, nStatus)
	local t=t_dxg_task[nTaskIndex]
	local nTaskByte = t.TaskByte
	local nTask = GetTask(N_DIXUANGONG_DAILY_TASK_ID)
	local nTaskNew = SafeSetByte(nTask, nTaskByte, nStatus)
	SetTask(N_DIXUANGONG_DAILY_TASK_ID, nTaskNew, N_DIXUANGONG_DAILY_TASK_ACCESS_CODE)
end

function get_boss_name(Idx)
	local szRet = ""
	local t = t_boss_list[Idx]
	if t then
		szRet = t[1]
	end
	return szRet
end

function task_step(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	local szStep = ""
	if nStep == N_TASK_STATUS_NONE then
		szStep = "可接任务"
	elseif nStep == N_TASK_STATUS_DOING then
		szStep = "已接任务"
	elseif nStep == N_TASK_STATUS_FINISH then
		szStep = "完成任务"
	elseif nStep == N_TASK_STATUS_AWARDED then
		szStep = "明天再来"
	end
	return szStep
end
function task_desc(nTaskIndex)
	local t=t_dxg_task[nTaskIndex]
	local szDesc = t.Desc
	if nTaskIndex == 3 then
		local nTaskType = get_task_type(nTaskIndex)
		szDesc = format(szDesc,get_boss_name(nTaskType))
	end
	return szDesc
end
function task_name(nTaskIndex)
	local t=t_dxg_task[nTaskIndex]
	local szName = t.Name
	return szName
end

function _task_talk_award(nTaskIndex)
	local nStep = get_task_step(nTaskIndex)
	if nStep == N_TASK_STATUS_FINISH then
		local tAward = t_dixuangong_daily_task_award[nTaskIndex]
		local nNeedRoom = tAward.nBagLimit;
		local nNeedWeight = tAward.nWeightLimit;
    		if gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,"") ~= 1 then --+4预留给活动奖励的空间
    			return 0;
    		end
    	
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 20));

		local nNewStatus = get_task_type(nTaskIndex) * 10 + N_TASK_STATUS_AWARDED
		set_task_status(nTaskIndex, nNewStatus)
		gf_EventGiveAllAward(tAward.fix_award,"地玄宫","每日任务")--固定奖励
		_MissionAward_RandAward(tAward.rand_award, "地玄宫每日任务奖励")--随机奖励
		
		runtime_stat_event(RUNTIME_STAT_SYS_DIXUANGONG, RUNTIME_STAT_EVENT_FINISH_TASK, nTaskIndex, 1)--统计事件
		
		-- Event
		EventAddMaterial(2)

		--Talk(1,"",format("成功领取%s任务奖励", task_name(nTaskIndex)))
		local szMsg = format("成功领取%s任务奖励", task_name(nTaskIndex))
		Msg2Player(szMsg)
		dxg_daily_task_msg_to_menu(szMsg)
		vaf_award_api("tDXGDailyTask") --2XU活动
		Observer:onEvent(SYSEVENT_DIXUANGONG_TASK_AWARD, nTaskIndex)
		return 1
	end
	return 0
end
