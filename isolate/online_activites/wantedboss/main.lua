--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ
Include("\\script\\missions\\wantedboss\\head.lua")
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
Include("\\script\\mail\\mail_lux.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "wantedboss",
    szViewName 			= "Vâ L©m Truy S¸t LÖnh",
    nTalkBeginDate		= WB_BEGIN_DATE.ymd,
    nBeginDate 			= WB_BEGIN_DATE.ymd,
    nEndDate 			= WB_END_DATE.ymd,
}
 

function wb_on_event(tData)
    local nNeedRate = tData[4][1]
    local rate = random(1,100)
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        return 0
    end
    if rate <= nNeedRate then
        local _,Idx = gf_AddItemEx({2,1,31298,1,4}, "Manh Mèi")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
   {id={"tsk_free_search", WB_TSKID_DAILY_FREE_SEARCH, 0}, clear = "daily" }, 
   {id={"tsk_daily_tickey", WB_TSKID_DAILY_TICKET, 0}, clear = "daily" }, 
   {id={"tsk_daily_max_bounty", WB_TSKID_ADD_MAX_DAILY_BOUNTY, 0}, clear = "daily" }, 
   {id={"tsk_daily_bounty_got", WB_TSKID_DAILY_BOUNTY_GOT, 0}, clear = "daily" }, 
   {id={"tsk_daily_flag_sent", WB_TSKID_FLAG_SENT, 0}, clear = "daily" },   
   {id={"tsk_daily_kill_coin", WB_TSKID_DAILY_KILLCOIN, 0}, clear = "daily" },   
   
}

function UpdatePlayerTaskVersion()
    local nTskVersion = GetTask(WB_TASK_VERSION)
    if nTskVersion < WB_VERSION then
        SetTask(WB_TASK_VERSION, WB_VERSION)

        -- do task clear
        SetTask(WB_TSKID_RATING, 0)     -- Í¨¼©Áî»ı·Ö
        SetTask(WB_TSKID_COIN, 0)       -- ÉÍ½ğ
        SetTask(WB_TSKID_KILLBOSS, 0)   -- ¿ØÖÆ³É¾ÍµÄ»÷É±BOSS¼ÆÊı

        -- clear equip shop taskid
        for i = 3545, 3568 do
            SetTask(i, 0)
        end

        for i = 3579, 3580 do
            SetTask(i, 0)
        end
    end
end

t_isolate_user_batch_watch_list = {
    {"event_mission_stage_finish", {"jiandangyanyun", 5},       wb_on_event,    { 20,}  },
    {"event_mission_stage_finish", {"jiandangyanyun", 6},       wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   wb_on_event,    { 20 }  },
    
    {"event_mission_stage_finish", {"taiyi", 6},                wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"taiyihero", 6},            wb_on_event,    { 20 } },
    
    {"event_mission_stage_finish", {"new_taixu", 30},            wb_on_event,   { 20 }  },
    {"event_mission_stage_finish", {"dixuangong", 3},           wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"wanjianzhong", 4},         wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"liangshan", 4},            wb_on_event,    { 20 }  },

    -- {"event_mission_award", {"biwudahui", -1, -1, 0},           wb_on_event,    { 50 }  },
    -- {"event_mission_award", {"kfbattle", -1, -1, 0},            wb_on_event,    { 50 }  },

    {"event_mission_task_award", {"pvp","yunbiao", -1}, 	    wb_on_event,    { 20 },  },
	{"event_mission_task_award", {"pvp","duobiao", -1}, 	    wb_on_event,    { 20 },  },
	{"event_mission_task_award", {"pvp","baozang", -1}, 	    wb_on_event,    { 20 },  },
}

function on_add_watches() 
    isolate_watch_npc_talk(WB_NPC_NAME, 100, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 200, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 300, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 150, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 350, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 400, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 500, "wb_talk2npc")
    isolate_watch_item_talk(2,1,31298, "wb_boss_clue")
    isolate_watch_item_talk(2,1,31304, "wb_boss_clue_bag")
end

function wb_boss_clue_bag(nIndex)
    if wb_check_date() == 0 then
        Say(format("%s ®· kÕt thóc!", tWBMission.name), 0);
        return 0;
    end
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
	end
    if DelItemByIndex(nIndex, 1) == 1 then
        local _,Idx = gf_AddItemEx({2,1,31298,5,4}, "Manh Mèi")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

function wb_boss_clue(nIndex)
    if wb_check_time() == 0 then
        Say("Cã thÓ tham gia trong thêi gian 8:00-23:00 mçi ngµy, hiÖn kh«ng trong thêi gian ho¹t ®éng!", 0);
        return 0;
    end
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
	end
    if DelItemByIndex(nIndex, 1) == 1 then
        local nRand = random(10000)
        local nBossType = 0
        if nRand < 1000 then
            nBossType = 3;
        elseif nRand < 4000 then
            nBossType = 2;
        elseif nRand < 6000 then
            nBossType = 1;
        else
            nBossType = 0;
        end
        WantedBossCreateBoss(nBossType)
    end
end


function wb_talk2npc()
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: %s ®· kÕt thóc!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    local szTitle = format("<color=green>%s<color>:%s", WB_NPC_NAME, "Cã thÓ ®Õn ®©y xem Danh S¸ch Truy S¸t LÖnh.")
    local tSay = {}
    tinsert(tSay, "Xem Truy S¸t LÖnh/wb_showlist")
    tinsert(tSay, "TiÖm Treo Th­ëng/wb_shop")
    tinsert(tSay, "Hñy bá/nothing")
    Say(szTitle, getn(tSay), tSay)
end

function wb_showlist()
    if wb_player_check() == 0 then
        Talk(1,"","Lv59 trë lªn, ®· häc hÕt kü n¨ng Lv55, cã thÓ tham gia ho¹t ®éng nµy!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","ChØ trong c¸c thµnh chİnh míi ®­îc thùc hiÖn thao t¸c nµy!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho¹t ®éng %s ®· kÕt thóc!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    WantedBossOpenUI()
end

function wb_shop()
    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3114, "TiÖm Th­ëng Truy S¸t"))
end

function on_event_server_start() 
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 100, 1491, 3009)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 200, 1385, 2703)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 300, 1773, 3524)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 150, 1689, 3110)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 350, 1490, 3011)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 500, 1856, 3114)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 400, 1515, 2841)
end

function on_event_player_login(nExchangeComing) 
    if wb_player_check() ~= 1 then
        -- 90¼¶ÒÔÉÏÑ§Âú55¼¶¼¼ÄÜ²ÅÄÜ²ÎÓë¸Ã»î¶¯
        return
    end
    UpdatePlayerTaskVersion()
    local nLastGet = GetTask(WB_TSKID_DAILY_TICKET)
    local nDate = tonumber(date("%Y%m%d"))
    if nDate > nLastGet then
        SetTask(WB_TSKID_DAILY_TICKET, nDate)
        sendScriptMail(
			WB_NPC_NAME, 
			GetName(), 
			"Vâ L©m Truy S¸t LÖnh", 
			format("Trong ho¹t ®éng, mçi ngµy nhËn ®­îc:\n\n    %d B¹ch Ng©n Truy S¸t LÖnh\n    %d Hoµng Kim Truy S¸t LÖnh\n\nH·y nhËn qua ®İnh kÌm.", 4, 1),
			[[SendScript2VM("\\script\\missions\\wantedboss\\head.lua", "wb_daily_ticket_award()")]], 
			"wb_daily_tickey_check")
    end
end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 



