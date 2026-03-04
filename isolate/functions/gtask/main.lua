--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\isolate\\functions\\gtask\\handler.lua")
Include("\\script\\isolate\\functions\\gtask\\talk_event_config.lua")
Include("\\script\\isolate\\functions\\gtask\\create_npc_list.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "gtask",
    szViewName 			= "Nhi謒 v?Th?gi韎",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
t_isolate_user_batch_watch_list = { --{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...},
	--{nTaskId, nRate, {name,g,d,p,n,s}, room, weight}
	--纹饰系列任务
--	{"event_mission_task_award", {"pvp", "plant", -1}, fn_elem, {421, "C?頲 M閏 Tinh", nil, fn_award_items, {1,100,{{"H箃 Gi鑞g Th莕 M閏",{2,1,31090,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"taiyi", 4}, fn_elem, {424, "C竎h s鯽 ch鱝 3", nil, fn_award_items, {1,100,{{"Th駓 Tinh",{2,1,31093,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"taiyihero", 4}, fn_elem, {424, "C竎h s鯽 ch鱝 3", nil, fn_award_items, {1,100,{{"Th駓 Tinh",{2,1,31093,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 1}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"H醓 Tinh",{2,1,31094,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"H醓 Tinh",{2,1,31094,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 1}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"H醓 Tinh",{2,1,31094,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"H醓 Tinh",{2,1,31094,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 3}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"Th?Tinh",{2,1,31095,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"Th?Tinh",{2,1,31095,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 3}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"Th?Tinh",{2,1,31095,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {426, "C竎h s鯽 ch鱝 4", nil, fn_award_items, {1,100,{{"Th?Tinh",{2,1,31095,1,4},1,100}, }}} },
	
	--9转系列任务
--	{"event_mission_stage_finish", {"jiandangyanyun", 1}, fn_elem, {462, "H醓 Th莕 Ch骳 Dung", nil, fn_award_items, {1,100,{{"U H醓 Tr魕",{2,1,31112,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 2}, fn_elem, {463, "Thu蕁 Th莕 D?Oanh", nil, fn_award_items, {1,100,{{"B輈h Th駓 Ch﹗",{2,1,31113,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 3}, fn_elem, {464, "Ni誸 B祅 T玭 Gi?", nil, fn_award_items, {1,100,{{"Thi猲 Huy詎 Th?",{2,1,31114,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 4}, fn_elem, {465, "V?Lng Minh Vng", nil, fn_award_items, {1,100,{{"Huy襫 Tr鋘g Kim",{2,1,31115,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 5}, fn_elem, {466, "Thi猲  r髏 lui", nil, fn_award_items, {1,100,{{"Huy誸 M閏 蕁",{2,1,31116,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 1}, fn_elem, {462, "H醓 Th莕 Ch骳 Dung", nil, fn_award_items, {1,100,{{"U H醓 Tr魕",{2,1,31112,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 2}, fn_elem, {463, "Thu蕁 Th莕 D?Oanh", nil, fn_award_items, {1,100,{{"B輈h Th駓 Ch﹗",{2,1,31113,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 3}, fn_elem, {464, "Ni誸 B祅 T玭 Gi?", nil, fn_award_items, {1,100,{{"Thi猲 Huy詎 Th?",{2,1,31114,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 4}, fn_elem, {465, "V?Lng Minh Vng", nil, fn_award_items, {1,100,{{"Huy襫 Tr鋘g Kim",{2,1,31115,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {466, "Thi猲  r髏 lui", nil, fn_award_items, {1,100,{{"Huy誸 M閏 蕁",{2,1,31116,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {462, "H醓 Th莕 Ch骳 Dung", nil, fn_award_items, {1,100,{{"U H醓 Tr魕",{2,1,31112,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {463, "Thu蕁 Th莕 D?Oanh", nil, fn_award_items, {1,100,{{"B輈h Th駓 Ch﹗",{2,1,31113,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {464, "Ni誸 B祅 T玭 Gi?", nil, fn_award_items, {1,100,{{"Thi猲 Huy詎 Th?",{2,1,31114,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {465, "V?Lng Minh Vng", nil, fn_award_items, {1,100,{{"Huy襫 Tr鋘g Kim",{2,1,31115,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {466, "Thi猲  r髏 lui", nil, fn_award_items, {1,100,{{"Huy誸 M閏 蕁",{2,1,31116,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {462, "H醓 Th莕 Ch骳 Dung", nil, fn_award_items, {1,100,{{"U H醓 Tr魕",{2,1,31112,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {463, "Thu蕁 Th莕 D?Oanh", nil, fn_award_items, {1,100,{{"B輈h Th駓 Ch﹗",{2,1,31113,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {464, "Ni誸 B祅 T玭 Gi?", nil, fn_award_items, {1,100,{{"Thi猲 Huy詎 Th?",{2,1,31114,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {465, "V?Lng Minh Vng", nil, fn_award_items, {1,100,{{"Huy襫 Tr鋘g Kim",{2,1,31115,1,4},1,100}, }}} },
--	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {466, "Thi猲  r髏 lui", nil, fn_award_items, {1,100,{{"Huy誸 M閏 蕁",{2,1,31116,1,4},1,100}, }}} },

	--战狂升级任务第二期
--	{"event_mission_affairs", {"worldboss","killboss",-1}, fn_elem, {476, "BOSS Th?Gi韎", nil, fn_award_items, {1,100,{{"Binh Kh?Th莕 V?",{2,1,31146,1,4},1,100}, }}} },
--	{"event_mission_task_award", {"pvp","duobiao",5}, fn_elem, {470, "Ti猽 Xa Ho祅g Gia", nil, fn_award_items, {1,100,{{"V藅 T?C鴘 Tr?",{2,1,31144,1,4},1,100}, }}} },
}

function on_event_server_start()
--	fn_call_npcs(tCreateNpcList, nil)
end
function on_add_watches()
--	fn_reg_talk_events()
end

--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate上线后第一次登录时的清理



