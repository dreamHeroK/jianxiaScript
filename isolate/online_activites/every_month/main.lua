--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\every_month\\handler.lua")
Include("\\script\\isolate\\online_activites\\every_month\\sub.lua")--É±¹Ö×Ó»î¶¯,×¢ÊÍµô±¾ĞĞ£¬×Ó»î¶¯¾Í¿ÉÒÔ²»Æğ×÷ÓÃ

t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "evenyMonthMain",
    szViewName 			= "Event Tuæi Häc Trß",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20200701,
    nEndDate 			= 20200731,
    nTaskGroup 			= 1,
    nTaskGroupVersion	= 34,
}

t_isolate_task_list = {--ÓÃµ½µÄÈÎÎñ±äÁ¿¶¼ÔÚÕâÅäÖÃ
	--main
	{ id={"task_use_item1_count", 1} },
	{ id={"task_use_item2_count", 2} },
	{ id={"task_use_item3_count", 3} },
	{ id={"task_get_final_award", 4}, bit_award1=1, bit_award2=2, bit_award3=3, },
	--sub 6~10
}

--ĞèÒªWatchµÄÊÂ¼şÁĞ±í£¬»á×Ô¶¯×¢²áÕâĞ©ÊÂ¼ş£¬×îÖÕÊÂ¼ş»Øµ÷º¯ÊıÊÇpfn_elem_handler(tEvent, data, para)
t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
	{"event_mission_task_award", {"wanjianzhong", "", -1}, 			handle_add_material,	{1, 200}  }, 	--Íò½£Ú£ÈÎÎñ 200 ²ÄÁÏ1
	{TeamEvent("event_mission_box_award"), {"wanjianzhong", "gold"}, 		handle_add_material,	{1, 50}  }, 	--Íò½£Ú£½ğ±¦Ïä 100 ²ÄÁÏ1
	{"event_mission_box_award", {"wanjianzhong", "silver"},		handle_add_material,	{1, 100}  }, 	--Íò½£Ú£Òø±¦Ïä 50 ²ÄÁÏ1
	{TeamEvent("event_mission_box_award"), {"wanjianzhong", "copper"}, 	handle_add_material,	{1, 20}  },		--Íò½£Ú£Í­±¦Ïä 20 ²ÄÁÏ1
	{"event_mission_task_award", {"dixuangong", "", -1}, 			handle_add_material,	{1, 200}  }, 	--µØĞş¹¬ÈÎÎñ 200 ²ÄÁÏ1
	{TeamEvent("event_mission_box_award"), {"dixuangong", "gold"}, 		handle_add_material,	{1, 50}  }, 	--µØĞş¹¬½ğ±¦Ïä 100 ²ÄÁÏ1
	{"event_mission_box_award", {"dixuangong", "silver"}, 		handle_add_material,	{1, 100}  }, 	--µØĞş¹¬Òø±¦Ïä 50 ²ÄÁÏ1
	{TeamEvent("event_mission_box_award"), {"dixuangong", "copper"}, 		handle_add_material,	{1, 20}  },		--µØĞş¹¬Í­±¦Ïä 20 ²ÄÁÏ1
	{"event_task_award", 		{"contributecountry", -1}, 		handle_add_material,	{1, 200}  },	--ÖÎ¹úÆ½ÌìÏÂ 200 ²ÄÁÏ1
	{"event_mission_task_award",{"planttree", "smalltreeprize", -1},handle_add_material,	{1, 75}  },		--ÖÖĞ¡°ãÈôÊ÷ 25²ÄÁÏ1
	{"event_mission_task_award",{"planttree", "plantseedtree", -1},	handle_add_material,	{1, 75}  },		--ÖÖÖÖ×ÓÊ÷ 50²ÄÁÏ1
--	{"event_mission_task_award",{"planttree", "bigtreeprize", -1},	handle_add_material,	{1, 100}  },	--ÖÖ´ó°ãÈôÊ÷ 100²ÄÁÏ1
	{"event_mission_task_award",{"planttree", "plant4lingtree", -1},handle_add_material,	{1, 100}  },	--ÖÖËÄÁéÊ÷ 100²ÄÁÏ1
	{"event_mission_task_award",{"liangshan", "", -1}, 				handle_add_material,	{2, 200}  }, 	--ÁºÉ½ÈÎÎñ 200 ²ÄÁÏ2
	{TeamEvent("event_mission_box_award"), {"liangshan", "gold"}, 			handle_add_material,	{2, 50}  }, 	---ÁºÉ½½ğ±¦Ïä 100 ²ÄÁÏ2
	{"event_mission_box_award", {"liangshan", "silver"},		handle_add_material,	{2, 100}  }, 	---ÁºÉ½Òø±¦Ïä 50 ²ÄÁÏ2
	{TeamEvent("event_mission_box_award"), {"liangshan", "copper"}, 		handle_add_material,	{2, 20}  },		---ÁºÉ½Í­±¦Ïä 20 ²ÄÁÏ2
	{"event_mission_stage_finish", {"taixu", -1}, 				handle_add_material,	{2, 50}  },		---Íê³É1¹ØÌ«Ğé»Ã¾³ 10 ²ÄÁÏ2
--	{"event_mission_task_award",{"taiyi", "", -1}, 					handle_add_material,	{2, 200}  }, 	--ÆÕÍ¨Ì«Ò»ÈÎÎñ 200 ²ÄÁÏ2
	{TeamEvent("event_mission_box_award"), {"taiyi", "gold"}, 				handle_add_material,	{2, 50}  }, 	---ÆÕÍ¨Ì«Ò»½ğ±¦Ïä 100 ²ÄÁÏ2
	{"event_mission_box_award", {"taiyi", "silver"},			handle_add_material,	{2, 100}  }, 	---ÆÕÍ¨Ì«Ò»Òø±¦Ïä 50 ²ÄÁÏ2
	{TeamEvent("event_mission_box_award"), {"taiyi", "copper"}, 			handle_add_material,	{2, 20}  },		---ÆÕÍ¨Ì«Ò»Í­±¦Ïä 20 ²ÄÁÏ2
	{"event_mission_award", {"newbattle", 0, -1, -1},  			handle_add_material,	{2, 20}  },		---Õ½³¡Áì½±-²»Ê¹ÓÃ¾ü¹¦ 20 ²ÄÁÏ2
	{"event_mission_award", {"newbattle", 1, -1, -1}, 			handle_add_material,	{2, 50}  },		---Õ½³¡Áì½±-Ê¹ÓÃ¾ü¹¦ÕÂ 50 ²ÄÁÏ2
	{"event_mission_award", {"newbattle", 2, -1, -1}, 			handle_add_material,	{2, 100}  },	---Õ½³¡Áì½±-Ê¹ÓÃ´ó¾ü¹¦ÕÂ 100 ²ÄÁÏ2
	{"event_mission_award", {"newbattle", 3, -1, -1}, 			handle_add_material,	{2, 250}  },	---Õ½³¡Áì½±-Ê¹ÓÃ¾ü¹¦»Ô»Í 250 ²ÄÁÏ2
	{"event_mission_award", {"newbattle", 4, -1, -1}, 			handle_add_material,	{2, 500}  },	---Õ½³¡Áì½±-VIP 500 ²ÄÁÏ2
	{TeamEvent("event_mission_box_award"), {"taiyihero", "gold"}, 			handle_add_material,	{3, 50}  }, 	---Ó¢ĞÛÌ«Ò»½ğ±¦Ïä 100 ²ÄÁÏ3
	{"event_mission_box_award", {"taiyihero", "silver"},		handle_add_material,	{3, 50}  }, 	---Ó¢ĞÛÌ«Ò»Òø±¦Ïä 100 ²ÄÁÏ3
	--{TeamEvent("event_mission_box_award"), {"siling", "gold"}, 			handle_add_material,	{3, 50}  }, 	---ËÄÁéÊÔÁ·½ğ±¦Ïä 100 ²ÄÁÏ3
	--{"event_mission_box_award", {"siling", "silver"},			handle_add_material,	{3, 50}  }, 	---ËÄÁéÊÔÁ·Òø±¦Ïä 100 ²ÄÁÏ3
	{"event_mission_box_award", {"worldboss", "gold"}, 			handle_add_material,	{3, 100}  }, 	---ÊÀ½çBOSS½ğ±¦Ïä 100 ²ÄÁÏ3
	{"event_mission_box_award", {"worldboss", "small"},			handle_add_material,	{3, 100}  }, 	---ÊÀ½çBOSS±¦ºĞ 100 ²ÄÁÏ3
	{"event_mission_task_award",{"planttree", "plant4lingtree", 16},handle_add_material,	{3, 100}  },	--ÖÖµÚ16¿ÃËÄÁéÊ÷ 50²ÄÁÏ3
	{"event_mission_task_award",{"planttree", "plantbigtree", -1},handle_add_material,	{3, 30}  },	--	³É¹¦¼¤»î´ó°ãÈôÊ÷ÖÖ»ñµÃ10 ²ÄÁÏ3
	{"event_mission_stage_finish", {"liangshan", 8}, 			handle_add_material,	{3, 100}  },	---ÁºÉ½Í¨¹ı×îºóÒ»¹Ø 100 ²ÄÁÏ3
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 		handle_add_material,	{3, 50}  },	---Íò½£Ú£Í¨¹ı×îºóÒ»¹Ø 100 ²ÄÁÏ3
	{"event_mission_stage_finish", {"dixuangong", 7}, 			handle_add_material,	{3, 100}  },	---µØĞş¹¬Í¨¹ı×îºóÒ»¹Ø 100 ²ÄÁÏ3
	{"event_mission_stage_finish", {"taixu", 8}, 				handle_add_material,	{3, 100}  },	---Ì«ĞéĞş¾³Í¨¹ı×îºóÒ»¹Ø 100 ²ÄÁÏ3
	{"event_mission_stage_finish", {"taiyi", 6}, 				handle_add_material,	{3, 100}  },	---Ì«Ò»ËşÍ¨¹ı×îºóÒ»¹Ø 100 ²ÄÁÏ3
	{"event_mission_stage_finish", {"taiyihero", 6}, 			handle_add_material,	{3, 100}  },	---Ó¢ĞÛÌ«Ò»ËşÍ¨¹ı×îºóÒ»¹Ø 200 ²ÄÁÏ3
}

--×Ó»î¶¯µÄÒ»Ğ©º¯Êıµ÷ÓÃ
function call_if_exists(fn, ...)
	if fn then
		return fn(unpack(arg))
	end
end

function on_init()
	call_if_exists(on_sub_init)
end
function on_new_day(nToday)
	call_if_exists(on_sub_new_day, nToday)
end
function on_event_player_login(nExchangeComing)
	call_if_exists(sub_on_event_player_login, nExchangeComing)
end

--Ä£¿é¼ÓÔØÊ±µÄ³õÊ¼»¯º¯Êı
function on_add_watches()
	isolate_watch_item_talk(2, 1, 30045, "handle_on_item_talk_jingnangdashijian")--½õÄÒ´óÊÂ¼ş¶Ô»°
	local _Products = tConfig.tProducts
	for i = 1,getn(_Products) do
		isolate_watch_item_talk(_Products[i][2][1], _Products[i][2][2], _Products[i][2][3], format("handle_on_prduct%d_talk",i))
	end
	call_if_exists(on_sub_add_watches)
end

--µÚÒ»´ÎÉÏÏß£¬É¾³ıËùÓĞ¿ÉÄÜÒÑ¾­´æÔÚµÄ¾É»î¶¯²ÄÁÏ
function on_first_login_clear()
	local t = {
		tMainActivityMaterials,
		tMainActivityProducts,
	}
	for i,v in t do
		for j,v2 in v do
			local g,d,p = unpack(v2[2])
			local n = BigGetItemCount(g,d,p)
        	if n > 0 then
        		BigDelItem(g,d,p,n)
        	end
		end
	end
end
