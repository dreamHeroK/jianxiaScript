--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")

N_START_DATE = 20160328
N_END_DATE = 20160430
TASK_HARD_JOIN_TIME = {3386,40,2}--task_id,access_code,limit_time

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= N_START_DATE,
    nEndDate 			= N_END_DATE,
}

function is_hard_mission_in_date()
	local _today = tonumber(date("%Y%m%d"))
	if _today >= N_START_DATE and _today <= N_END_DATE then
		return 1
	end
	return 0
end
function check_hard_join_time()
	if GetTask(TASK_HARD_JOIN_TIME[1]) < TASK_HARD_JOIN_TIME[3] then
		return 1
	end
	return 0
end
function add_hard_join_time()
	local nValue = GetTask(TASK_HARD_JOIN_TIME[1]) + 1
	SetTask(TASK_HARD_JOIN_TIME[1], nValue, TASK_HARD_JOIN_TIME[2])
end

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_hard_limit", 3386, 40}, clear="daily" }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end

--function on_event_server_start() end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
function on_event_daily_clear(nCurDate, nLastDate)
	SetTask(TASK_HARD_JOIN_TIME[1], 0, TASK_HARD_JOIN_TIME[2])
end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end



