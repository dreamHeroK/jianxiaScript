--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\task\\global_task\\gtask_data.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "translife10",
    szViewName 			= "NhiÖm vô chuyÓn sinh 10",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
 TongExt_szThisFile = "\\script\\isolate\\functions\\translife10\\main.lua"
-----------------------Tong Extension Config-----------------------

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
}

function Trans10_KillWorldBoss()
	if tGtTask:check_cur_task(548) ~= 1 then
		return
	end
	local nOldIndex = PlayerIndex;
	if GetTeamSize() == 0 then
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
	   AddItem(2,0,31007,1);
	else
	    Msg2Player("Tói ®· ®Çy, nhËn vËt phÈm thÊt b¹i.")
	    end
		return
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
	    AddItem(2,0,31007,1);
	else
	    Msg2Player("Tói ®· ®Çy, nhËn vËt phÈm thÊt b¹i.")
	    end
	end
	PlayerIndex = nOldIndex;
    -- end
end

t_isolate_user_batch_watch_list = { 
    {"event_mission_affairs", {"worldboss","killboss",-1}, Trans10_KillWorldBoss, {} },
}


-- function on_add_watches()
--         isolate_watch_item_talk(g,d,p, "TongExt_OnUseTicket")
--         isolate_watch_npc_talk(v[2], tMaps[i], "TongExt_Talk2BossSoul");
--         isolate_watch_item_talk(g,d,p, "TongExt_OnUseGift")
-- end


--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
--t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
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


--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 



