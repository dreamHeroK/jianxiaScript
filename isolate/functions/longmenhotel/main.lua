--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "longmenPop",
    szViewName 			= "Qu¸n Trä Long M«n-Danh Väng",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
LM_POP = 3581

LM_TSKID_FINISH_PRETASK = 3583      -- ÊÇ·ñÍê³É¿ªÆôÁúÃÅ¿ÍÕ»ÉùÍûÈÎÎñÁ´

LM_TSKID_WEEKLY_MISSION = 3584      -- ÁúÃÅ¿ÍÕ»ÖÜ³£ÈÎÎñ±ê¼Ç byte1:ÈÎÎñidË÷Òı£¬ byte2£º½ÓÈ¡¼ÆÊıÆ÷

LM_TSKID_DAILY_MISSION = 3585       -- ÁúÃÅ¿ÍÕ»ÈÕ³£ÈÎÎñ±ê¼Ç byte1:ÈÎÎñidË÷Òı£¬ byte2£º½ÓÈ¡¼ÆÊıÆ÷

LM_WEEKLY_MISSION_LIMIT = 70
LM_DAILY_MISSION_LIMIT = 10

LM_POP_LEVEL = {
    [1] = {0,       "<color=gray>S¬ NhËp Giang Hå<color>"},
    [2] = {3000,    "<color=green2>Béc Lé Tµi N¨ng<color>"},
    [3] = {6000,    "<color=green>Danh Næi Nh­ Cån<color>"},
    [4] = {10500,   "<color=blue2>C«ng Danh HiÓn H¸ch<color>"},
    [5] = {16500,   "<color=yellow>Vang Danh Thiªn H¹<color>"},
    [6] = {24000,   "<color=red2>V¹n Ng­êi Ng­ìng Mé<color>"},
}

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
   {id={"daily_task", LM_TSKID_DAILY_MISSION, 0}, clear = "daily" }, 
   {id={"weekly_task", LM_TSKID_WEEKLY_MISSION, 0}, clear = "weekly" }, 
}

----------------------------------------------------------------------------------------------
-- ÈÕ³£ÈÎÎñºÍÖÜ³£ÈÎÎñ 
-- ³õÆÚ¿ª·¢µÄÊ±ºòÃ»ÓĞÉè¼ÆÈÎÎñµÄ³öÏÖ¸ÅÂÊ£¬Òò´Ë±í½á¹¹²»Ì«ºÃ¸Ä
-- ÕâÀï²ÉÓÃÒ»ÕÅĞÂ±íÅäºÏÔ­ÈÎÎñ±íÊµÏÖ¸ÅÂÊ¿ØÖÆ
-- support up to 255 missions
tWeeklyTask = { 
    -------------------------------------------------------------------------------------------------
    647,648,649,650,651,652,                    -- ¸±±¾ÈÎÎñ [1-6] ĞÂÔö»òÉ¾³ıÊ±£¬Ò²ÒªĞŞ¸Ä tWeeklyTaskType
    -------------------------------------------------------------------------------------------------
    607,608,609,610,611,612,613,614,615,616,
    617,618,619,620,621,622,623,624,625,626,    -- Ñ°ÎïÈÎÎñ [7-26] ĞÂÔö»òÉ¾³ıÊ±£¬Ò²ÒªĞŞ¸Ä tWeeklyTaskType
    -------------------------------------------------------------------------------------------------
    627,628,629,630,631,632,633,634,635,636,
    637,638,639,640,641,642,643,644,645,646,    -- »÷É±ÈÎÎñ [27-tail] ĞÂÔö»òÉ¾³ıÊ±£¬Ò²ÒªĞŞ¸Ä tDailyTaskType
    -------------------------------------------------------------------------------------------------
}
tWeeklyTaskType = {
    missionTask = {1, 6},                       -- ¸±±¾ÈÎÎñ Idx·¶Î§£º[1, 6]
    seekTask    = {7, 26},                      -- Ñ°ÎïÈÎÎñ Idx·¶Î§£º[7, 26]
    killTask    = {27, getn(tWeeklyTask)},       -- »÷É±ÈÎÎñ Idx·¶Î§£º[7, tail]
}
function lm_get_weekly_type_range()
    local rand = random(1,1000)
    if rand <= 300 then
        return tWeeklyTaskType.missionTask
    elseif rand <= 600 then
        return tWeeklyTaskType.seekTask
    end
    return tWeeklyTaskType.killTask
end
-- support up to 255 missions
tDailyTask = {
    -------------------------------------------------------------------------------------------------
    673,674,675,676,677,678,                    -- ¸±±¾ÈÎÎñ [1-6] ĞÂÔö»òÉ¾³ıÊ±£¬Ò²ÒªĞŞ¸Ä tDailyTaskType
    -------------------------------------------------------------------------------------------------
    653,654,655,656,657,658,659,660,661,662,
    663,664,665,666,667,668,669,670,671,672,    -- »÷É±ÈÎÎñ [7-tail] ĞÂÔö»òÉ¾³ıÊ±£¬Ò²ÒªĞŞ¸Ä tDailyTaskType
    -------------------------------------------------------------------------------------------------
}
tDailyTaskType = {
    missionTask = {1, 6},                       -- ¸±±¾ÈÎÎñ Idx·¶Î§£º[1, 6]
    killTask    = {7, getn(tDailyTask)},        -- »÷É±ÈÎÎñ Idx·¶Î§£º[7, tail]
}
function lm_get_daily_type_range()
    local rand = random(1,1000)
    if rand <= 300 then
        return tDailyTaskType.missionTask
    end
    return tDailyTaskType.killTask
end
----------------------------------------------------------------------------------------------


function lm_gtask_awardItem(nTaskId, tItem, szItemName)
    local hasMission = tGtTaskManage:IsGetGTaskID(nTaskId)          -- ÓĞ¶ÔÓ¦ÈÎÎñ
    local itemCount = BigGetItemCount(tItem[1],tItem[2],tItem[3])   -- ÒÑ¾­ÓĞ¶àÉÙ¼ş¶ÔÓ¦µÀ¾ß
    if itemCount > 0 or hasMission == 0 then
        return
    end
    if gf_JudgeRoomWeight(tItem[4], 100) ~= 1 then
        Msg2Player(format("Hµnh trang kh«ng ®ñ chç, kh«ng thÓ nhËn %s!", szItemName))
        return 
    end
    gf_AddItemEx(tItem, szItemName)
end

function lm_pass_dixuangong()
    lm_gtask_awardItem(601, {2,1,31305,1,4}, "§Şa HuyÒn Cung Än")
    lm_gtask_awardItem(647, {2,1,31305,1,4}, "§Şa HuyÒn Cung Än")
    lm_gtask_awardItem(673, {2,1,31305,1,4}, "§Şa HuyÒn Cung Än")
end

function lm_pass_wanjian()
    lm_gtask_awardItem(648, {2,1,31308,1,4}, "B¸ch LuyÖn ThÇn ThiÕt")
    lm_gtask_awardItem(674, {2,1,31308,1,4}, "B¸ch LuyÖn ThÇn ThiÕt")
end

function lm_pass_liangshan()
    lm_gtask_awardItem(649, {2,1,31309,1,4}, "Tói Xuyªn V©n TiÔn")
    lm_gtask_awardItem(675, {2,1,31309,1,4}, "Tói Xuyªn V©n TiÔn")
end

function lm_pass_jdyy()
    lm_gtask_awardItem(650, {2,1,31310,1,4}, "Khai S¬n Phñ")
    lm_gtask_awardItem(676, {2,1,31310,1,4}, "Khai S¬n Phñ")
end

function lm_pass_newtaixu()
    lm_gtask_awardItem(651, {2,1,31311,1,4}, "Th¸i H­ Th¹ch")
    lm_gtask_awardItem(677, {2,1,31311,1,4}, "Th¸i H­ Th¹ch")
end

function lm_pass_taiyi()
    lm_gtask_awardItem(652, {2,1,31312,1,4}, "Th­ Tay LÖnh C«ng")
    lm_gtask_awardItem(678, {2,1,31312,1,4}, "Th­ Tay LÖnh C«ng")
end

function lm_kill_xinyihua()
    lm_gtask_awardItem(603, {2,1,31306,1,4}, "Cöu ChuyÓn Minh Huy Lé")
end

function lm_finish_gtask(para1, para2)
    local gTaskId = para1[2][1]
    local szType = para1[4][1]
    if szType == "daily" then
        local taskCounter = gf_GetTaskByte(LM_TSKID_DAILY_MISSION, 2)
        if taskCounter == 0 then
            AddRuntimeStat(73, 1, 0, 1) --Íê³ÉÁúÃÅ¿ÍÕ»ÈÕ³£ÈÎÎñµÄÈËÊı
        end
        AddRuntimeStat(73, 2, 0, 1)     --Íê³ÉÁúÃÅ¿ÍÕ»ÈÕ³£ÈÎÎñµÄ´ÎÊı
    else
        local taskCounter = gf_GetTaskByte(LM_TSKID_WEEKLY_MISSION, 2)
        if taskCounter == 0 then
            AddRuntimeStat(74, 1, 0, 1) --Íê³ÉÁúÃÅ¿ÍÕ»ÖÜ³£ÈÎÎñµÄÈËÊı
        end
        AddRuntimeStat(74, 2, 0, 1)     --Íê³ÉÁúÃÅ¿ÍÕ»ÖÜ³£ÈÎÎñµÄ´ÎÊı
    end
end


t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    {"event_mission_stage_finish", {"dixuangong", 3}, 	        lm_pass_dixuangong, {""}  },	
    {"event_mission_stage_finish", {"liangshan", 4}, 			lm_pass_liangshan,  {""}  },	
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 		lm_pass_wanjian,    {""}  },	
    {"event_mission_stage_finish", {"jiandangyanyun", 5},       lm_pass_jdyy,       {""}  },    
    {"event_mission_stage_finish", {"jiandangyanyun", 6},       lm_pass_jdyy,       {""}  },    
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   lm_pass_jdyy,       {""}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   lm_pass_jdyy,       {""}  },
    {"event_mission_stage_finish", {"new_taixu", 30},           lm_pass_newtaixu,   {""}  },    
	{"event_mission_stage_finish", {"taiyi", 6}, 				lm_pass_taiyi,      {""}  },	
    {"event_mission_stage_finish", {"taiyihero", 6}, 			lm_pass_taiyi,      {""}  },	
}

for i = 1,getn(tWeeklyTask) do
    tinsert(t_isolate_user_batch_watch_list, {"event_finish_gtask",{tWeeklyTask[i]}, lm_finish_gtask,{"weekly"}})
    tinsert(t_isolate_user_batch_watch_list, {"event_jump_gtask",{tWeeklyTask[i]}, lm_finish_gtask,{"weekly"}})
end
for i = 1,getn(tDailyTask) do
    tinsert(t_isolate_user_batch_watch_list, {"event_finish_gtask",{tDailyTask[i]}, lm_finish_gtask,{"daily"}})
    tinsert(t_isolate_user_batch_watch_list, {"event_jump_gtask",{tDailyTask[i]}, lm_finish_gtask,{"daily"}})
end

function lm_getRandomTask(tTaskList, szTaskType, tTypeRange)
    local taskidx = get_task_byte(szTaskType, 1)
    local taskCounter = get_task_byte(szTaskType, 2)
    if taskidx == 0 then
        -- Ä¿Ç°Ã»½ÓÈÎÎñ
        taskidx = random(tTypeRange[1],tTypeRange[2])
        set_task_byte(szTaskType, 1, taskidx)
        return tTaskList[taskidx]
    end
    if tGtTask:check_task_isfinish(tTaskList[taskidx]) == 1 then
        -- ÉíÉÏ´æµÄÈÎÎñÒÑ¾­Íê³ÉÁË
        ClearGTask(tTaskList[taskidx])
        -- ÇåµôÕâ¸öÈÎÎñ±ê¼Ç ÖØĞÂËæ»úÒ»¸öÈÎÎñ
        taskidx = random(1,getn(tTaskList))
        set_task_byte(szTaskType, 1, taskidx)
        set_task_byte(szTaskType, 2, taskCounter + 1)  -- ¼ÆÊıÆ÷+1
        return tTaskList[taskidx]
    end
    -- ÉíÉÏµÄÈÎÎñ»¹Ã»ÓĞÍê³É
    return tTaskList[taskidx]
end

function lm_get_weekly_mission(weeklyGtaskId)
    if tGtTaskManage:IsGetGTaskID(weeklyGtaskId) == 1 then
        -- ÒÑ¾­ÁìÈ¡ÁËÈÎÎñ
        local tbSay = {}
        local szTitle = format("<color=green>%s<color>: Ng­¬i vÉn ch­a hoµn thµnh nhiÖm vô hiÖn t¹i.", GetTargetNpcName())
        tinsert(tbSay, "Ta sÏ xong ngay/nothing")
        Say(szTitle, getn(tbSay), tbSay)
        return 
    end
    -- ClearGTask(weeklyGtaskId)
    DirectGetGTask(weeklyGtaskId, 1)
end

function lm_check_pop()
    local nPop = GetTask(LM_POP)
    local szPop = LM_POP_LEVEL[1][2]
    local level = 1
    for i = 1,getn(LM_POP_LEVEL)  do
        if LM_POP_LEVEL[i][1] <= nPop then
            level = i
        else
            break
        end
    end
    szPop = LM_POP_LEVEL[level][2]
    Talk(1,"",format("<color=green>%s<color>: Nay thêi cuéc rèi ren, viÖc lµm ¨n ngµy cµng khã kh¨n, sau nµy h·y cè g¾ng h¬n.\n\n      Danh väng hiÖn t¹i: %s (<color=yellow>%d<color>)\n", GetTargetNpcName(), szPop, GetTask(LM_POP)))
end

function lm_talk2sunerlian()
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        Talk(1, "", format("<color=green>%s<color>: NhiÖm vô g×? HiÖp sÜ ch¾c ®ang ®ïa, bæn tiÖm lµ n¬i bu«n b¸n, lµm g× cã nhiÖm vô cho ®¹i hiÖp trªn giang hå. Nh­ng nghe nãi gÇn ®©y ®o¹n ®­êng ®Õn T©y Vùc rÊt n¸o nhiÖt, th­¬ng nh©n Ba T­ ë Phông T­êng gÇn ®©y mang rÊt nhiÒu mãn ®å quı cña T©y Vùc ®Õn, ng­¬i cã thÓ ®Õn ®ã thö vËn may.", GetTargetNpcName()))
        return
    end
    local weeklyGtaskId = lm_getRandomTask(tWeeklyTask, "weekly_task", lm_get_weekly_type_range())
    local weeklyCounter = get_task_byte("weekly_task", 2)
    local szTitle = format("<color=green>%s<color>: Qu¸n trä lµ n¬i lµm ¨n, mèi hµng ghi c¶ ë ®©y råi. NhiÖm vô tuÇn nµy cßn: <color=green>%d<color>", GetTargetNpcName(), LM_WEEKLY_MISSION_LIMIT - weeklyCounter)
    local tbSay = {}
    if LM_WEEKLY_MISSION_LIMIT - weeklyCounter > 0 then
        tinsert(tbSay, format("Ta muèn nhËn nhiÖm vô/#lm_get_weekly_mission(%d)", weeklyGtaskId))
    end
    tinsert(tbSay, "Xem Danh väng/lm_check_pop")
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function lm_answerwrong()
    Talk(1,"", format("<color=green>%s<color>: Ha ha, xem ra hiÖp sÜ lµ ng­êi tõ xa ®Õn.", GetTargetNpcName()) )
end

function lm_get_daily_mission(dailyGtaskId)
    if tGtTaskManage:IsGetGTaskID(dailyGtaskId) == 1 then
        -- ÒÑ¾­ÁìÈ¡ÁËÈÎÎñ
        local tbSay = {}
        local szTitle = format("<color=green>%s<color>: Ng­¬i vÉn ch­a hoµn thµnh nhiÖm vô hiÖn t¹i.", GetTargetNpcName())
        tinsert(tbSay, "Ta sÏ xong ngay/nothing")
        Say(szTitle, getn(tbSay), tbSay)
        return 
    end
    DirectGetGTask(dailyGtaskId, 1)
end

function lm_talk2lihua()
    local szTitle = ""
    local tbSay = {}
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        szTitle = format("<color=green>%s<color>: M­a giã kh¾p n¬i còng kh«ng b»ng m­a ë Qu¸n Trä Long M«n.\n\n", GetTargetNpcName())
        tinsert(tbSay,"Trêi trong xanh thÕ nµy, ®©u ra m­a giã?/lm_answerwrong")
        Say(szTitle, getn(tbSay), tbSay)
        return
    end
    local dailyGtaskId = lm_getRandomTask(tDailyTask, "daily_task", lm_get_daily_type_range())
    local dailyCounter = get_task_byte("daily_task", 2)
    szTitle = format("<color=green>%s<color>: Ha ha, th× ra lµ ng­êi cïng nghÒ, sau nµy ph¶i gÆp gì th­êng xuyªn. C«ng viÖc ë chç ta ®Òu ghi ë ®©y, xem ®i.\n    NhiÖm vô h«m nay cßn: <color=green>%d<color>\n", GetTargetNpcName(), LM_DAILY_MISSION_LIMIT - dailyCounter)
    if LM_DAILY_MISSION_LIMIT - dailyCounter > 0 then 
        tinsert(tbSay,format("Ta ®Õn nhËn nhiÖm vô/#lm_get_daily_mission(%d)", dailyGtaskId))
    end
    tinsert(tbSay,"C¸o Tõ/nothing")
    Say(szTitle, getn(tbSay), tbSay)

end

function on_add_watches()
    isolate_watch_npc_talk("T«n NhŞ Liªn", 507, "lm_talk2sunerlian")
    isolate_watch_npc_talk("Lı Hoa", 507, "lm_talk2lihua")
    isolate_watch_event("event_kill_npc", "lm_kill_xinyihua", "T©n Di Hoa", 505)
    isolate_watch_item_talk(2, 1, 31319, "lm_usecake") --ÌØÖÆ¸âµã
end

function lm_usecake(nItemIdx)
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        Talk(1,"","Ch­a më Danh Väng Qu¸n Trä Long M«n")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(LM_POP, GetTask(LM_POP) + 10)
        Msg2Player(format("NhËn ®­îc %d ®iÓm Danh Väng Qu¸n Trä Long M«n", 10))
    end
end

function on_event_server_start()
	CreateNpc("lmkz_caoshaoqing", "Tµo ThiÕu Khanh", 507,1638,3210)
    CreateNpc("lmkz_yangzhao", "D­¬ng Chiªu", 507,1865,3281)
    CreateNpc("lmkz_yangzhao1", "D­¬ng Chiªu", 507,1700,3438)
    CreateNpc("lmkz_xingyihua", "T©n Di Hoa", 505,1392,2804)
    CreateNpc("lmkz_bjtz", "Th¸m Tö BiÖn Kinh", 507,1855,3209)
    CreateNpc("lmkz_ansha1","Ng« Lçi",327,1537,2795)
    CreateNpc("lmkz_ansha2","§oµn Vò Tr¹ch",403,1386,3051)
    CreateNpc("lmkz_ansha3","M«ng NghŞ",408,1297,3018)
    CreateNpc("lmkz_ansha4","Nguyªn TrÜ Sinh",104,1553,2865)
    CreateNpc("lmkz_ansha5","T©n Chi Trî",109,1482,2975)
    CreateNpc("lmkz_ansha6","Gi¶i Tr©n",207,1399,2763)
    CreateNpc("lmkz_ansha7","Thêi BÊt Thiªn",217,1908,2925)
    CreateNpc("lmkz_ansha8","Phan Hæ",604,1527,3041)
    CreateNpc("lmkz_ansha9","Tiªu V©n Lan",601,1382,2882)
    CreateNpc("lmkz_ansha10","M¹nh Du B×nh",506,1438,2838)
    CreateNpc("lmkz_ansha11","Viªn H¹o",505,1389,2797)
    CreateNpc("lmkz_ansha12","YÕn L¨ng V©n",309,1455,3083)
    CreateNpc("lmkz_ansha13","Lª Bµng Tö",406,1415,3049)
    CreateNpc("lmkz_ansha14","Giang Thiªn S¬n",326,1525,2879)
    CreateNpc("lmkz_ansha15","Ng­u NhŞ",202,1448,2797)
    CreateNpc("lmkz_ansha16","Tam ThiÕu Gia",302,1326,3122)
    CreateNpc("lmkz_ansha17","¢n V« Phóc",508,1617,3235)
    CreateNpc("lmkz_ansha18","Lam Bµo Kh¸ch",401,1592,3114)
    CreateNpc("lmkz_ansha19","D¹ Xoa",307,1585,3053)
    CreateNpc("lmkz_ansha20","Phi T­íng Qu©n",314,1576,3263)

end

