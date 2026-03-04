--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

--WatchEvent(szEventId, isolate_main_script(), szFunc, ...) 可以添加更多的事件处理函数

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\system_switch_config.lua")

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 		= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 		= "oldSys",
    szViewName 		= "",
    nTalkBeginDate 	= 0,
    nBeginDate 		=0,
    nEndDate 		= 0,
}

--模块加载时的初始化函数
function on_add_watches()
--	WatchEvent("event_server_start", "\\script\\function\\ornament\\npc_fenghuashizhe.lua", "on_server_start")
	WatchEvent("event_server_start", "\\script\\global\\autoexec.lua", "handle_event")
	WatchEvent("event_player_login", "\\script\\global\\playerloginin.lua", "handle_event")
	WatchEvent("event_player_logout", "\\script\\global\\playerlogout.lua", "handle_event")
	WatchEvent("event_player_start_offline_live", "\\script\\global\\offlinelive.lua", "handle_event")
	WatchEvent("event_player_death", "\\script\\global\\player_death_punish.lua", "handle_event", -1)
	
--	WatchEvent("event_server_start", "\\script\\task\\huofengtask\\server_start.lua", "on_server_start")
--	WatchEvent("event_player_login", "\\script\\gongcheng\\npc\\conf_res_protect.lua", "on_player_login")
--	WatchEvent("event_daily_clear", "\\settings\\static_script\\item\\item_fushengdan_impl.lua", "on_daily_clear")
--	WatchEvent("event_daily_clear", "\\script\\online_activites\\201506cn\\main.lua", "on_daily_clear")
	WatchEvent("event_server_start", "\\script\\missions\\yp\\vn\\server_start.lua", "on_server_start")
	WatchEvent("event_player_login", "\\script\\missions\\yp\\vn\\player_login.lua", "on_player_login")
	WatchEvent("event_player_logout", "\\script\\missions\\yp\\vn\\player_login.lua", "on_player_logout")
	WatchEvent("event_weekly_clear", "\\script\\equip_shop\\equip_shop.lua", "on_weekly_clear")
--	WatchEvent("event_player_taskvalue_recycle", "\\script\\item\\skill_app_box.lua", "on_task_recycle", 3346, -1, -1)
end
function on_event_player_login(nExchangeComing)
	if GetPop(6) < 0 then
		OpenPop(6)
	end
	--if IsExpSvrSystemOpen() == 1 then
    --	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then --体服指引
    --		AddItem(2,1,30644,1)
    --	end
--	end
end

t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
    {id={"id_jdyy_mission_join_cnt", 3465, 0}, clear="daily" }, 
    {id={"id_daily_pulish_jungong_limit", 771, 0}, clear="daily" }, 
}

--function on_server_start() end
--function on_player_logout() end
--function on_daily_clear(nLastDate,nCurDate) end
--function on_weekly_clear(nLastWeek,nCurWeek) end
--function on_monthly_clear(nLastMonth,nCurMonth) end

