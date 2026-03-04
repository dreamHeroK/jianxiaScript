--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\isolate\\online_activites\\christmas\\2015_12\\handler.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "christmas",
    szViewName 			= "Trang trİ c©y th«ng",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20151223,
    nEndDate 			= 20160105,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 23,
}

--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
	{id={"id_score", 1,}, }, --
    {id={"id_task_1", 2,}, clear="daily", byte_step=1, byte_task=2, }, --
    {id={"id_task_2", 3,}, clear="daily", byte_step=1, byte_task=2, }, --
    {id={"id_server_award", 4,}, },
    {id={"id_open_box1", 5,}, clear="daily"}, --ÆÕÍ¨°ü¿ªÆô´ÎÊı
}

--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
function on_add_watches()
	isolate_watch_npc_talk("Uy NhÜ Tèn", 100, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi¸o sÜ", 200, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi¸o sÜ", 300, "handle_on_npc_talk")
	isolate_watch_item_talk(2,1,30971,"handle_on_use_item")
	isolate_watch_item_talk(2,1,30972,"handle_on_use_item")
	isolate_watch_npc_talk("C©y Noel-Th­êng", 100, "handle_on_tree1_talk")
	isolate_watch_npc_talk("C©y Noel-Th­êng", 200, "handle_on_tree1_talk")
	isolate_watch_npc_talk("C©y Noel-Th­êng", 300, "handle_on_tree1_talk")
	isolate_watch_npc_talk("C©y Noel-Hµo Hoa", 100, "handle_on_tree2_talk")
	isolate_watch_npc_talk("C©y Noel-Hµo Hoa", 200, "handle_on_tree2_talk")
	isolate_watch_npc_talk("C©y Noel-Hµo Hoa", 300, "handle_on_tree2_talk")
end
--function on_new_day(nToday) end

function on_event_server_start()
	local tTreeList = {
		{"hd_ptsds","C©y Noel-Th­êng", 100,1323,2928, ""},
		{"hd_ptsds","C©y Noel-Th­êng", 200,1319,2810, ""},
		{"hd_ptsds","C©y Noel-Th­êng", 300,1714,3552, ""},
		{"hd_hhsds","C©y Noel-Hµo Hoa", 100,1315,2920, ""},
		{"hd_hhsds","C©y Noel-Hµo Hoa", 200,1331,2798, ""},
		{"hd_hhsds","C©y Noel-Hµo Hoa", 300,1700,3539, ""},
	}
	_CreateNpcList(tTreeList)
end
function _CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLogEx(szMsg)
				print(szMsg)
			end
		end
		
	end
end
function on_event_player_login(nExchangeComing)
	Msg2Player("Ho¹t ®éng trang trİ C©y Noel ®ang ®­îc diÔn ra n¸o nhiÖt, tin tøc cô thÓ mêi ®i BiÖn Kinh, Thµnh §«, TuyÒn Ch©u t×m Gi¸o sÜ ®Ó t×m hiÓu")
end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end



