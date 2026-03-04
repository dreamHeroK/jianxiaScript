Import("\\script\\ksgvn\\lib.lua")
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\ksgvn\\autoexec\\ksg_system_head.lua")
Include("\\script\\ksgvn\\autoexec\\ksg_system_listener.lua")

Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority = 1,
    szEngName = "ksg_system",
    szViewName = "Vâ L©m 2",
    nTalkBeginDate = 0,
    nBeginDate = 0,
    nEndDate = 0,
}

t_isolate_task_list = { --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},

}

function on_add_watches()
    for _, tbItemTalk in g_tbItemTalkCfg do
        local nG, nD, nP = KsgLib:UnPack(tbItemTalk.tbProp)
        isolate_watch_item_talk(nG, nD, nP, tbItemTalk.szFunc)
    end
    for i = KSG_ITEMPACK_START, KSG_ITEMPACK_END do
        isolate_watch_item_talk(2, 1, i, "_ksg_HandleItemPack")
    end
    for k, tbNpcCfg in g_tbNpcTalkCfg do
        AddMisEvent("event_talk_npc", tbNpcCfg.szName, tbNpcCfg.nMapId, tbNpcCfg.szFuncExecuteAt, tbNpcCfg.szHandleFunc, tbNpcCfg.szTalk)
    end

    isolate_watch_event("event_ib_cost", "_ksg_ib_cost", PackItemId(2, 97, 236))--Ìì½¾ÁîÏû·Ñ¼ÆÊý

    -- Monthly event
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD1[1], MONTHLY_EVENT_AWARD1[2], MONTHLY_EVENT_AWARD1[3], "monthlyEvent_OnUseItem")
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD2[1], MONTHLY_EVENT_AWARD2[2], MONTHLY_EVENT_AWARD2[3], "monthlyEvent_OnUseItem")
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD3[1], MONTHLY_EVENT_AWARD3[2], MONTHLY_EVENT_AWARD3[3], "monthlyEvent_OnUseItem")
end

function on_event_player_login(nExchangeComing)
    if KsgLib:IsInDualTopTime() then
        KsgPlayer:Msg("Ho¹t ®éng ®ua TOP ®ang diÔn ra, h·y truy cËp trang chñ https://volam2.zing.vn ®Ó xem chi tiÕt!")
    end
    if KsgLib:IsTestServer() then
        KsgPlayer:Msg("C¶m ¬n b¹n ®· tham gia m¸y chñ thö nghiÖm! NÕu trong qu¸ tr×nh hµnh tÈu gÆp vÊn ®Ò khóc m¾c, h·y liªn hÖ ngay FanPage ®Ó ®­îc hç trî!")
    end
    KsgPlayer:Msg(format("Sù kiÖn %s ®ang diÔn ra rÊt n¸o nhiÖt, h·y mau ®Õn t×m Liªn Chi t¹i BiÖn Kinh ®Ó tham gia.", g_monthlyEvent_Name))
end

function on_event_player_logout()

end

function on_event_daily_clear(nCurDate, nLastDate)

end

function on_event_weekly_clear(nCurWeek, nLastWeek)
    
end

function on_event_monthly_clear(nCurMonth, nLastMonth)

end

function _ksg_ib_cost(tEvent, data, para)

end

function _ksg_handle_monthlyEvent_Item(nItemIndex)
    monthlyEvent_OnUseItem(nItemIndex)
end

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {task_name, sè tói quµ vâ l©m, th­ëng lÖnh jx2, hu©n ch­¬ng jx2, sè ®iÓm phong hoa}}
    { "event_player_daily_online_minute", { 60 }, _ksg_onActivityFinish_Online60Min, { "Online 60 phót" }, },
    { "event_player_daily_online_minute", { 180 }, _ksg_onActivityFinish_Online180Min, { "Online 180 phót" }, },
    
    { "event_mission_stage_finish", { "liangshan", -1 }, _ksg_onActivityFinish_LSB, { "Hoµn thµnh ¶i L­¬ng S¬n B¹c" }, },
    { "event_mission_stage_finish", { "wanjianzhong", -1 }, _ksg_onActivityFinish_VKT, { "Hoµn thµnh ¶i V¹n KiÕm Tròng" }, },
    { "event_mission_stage_finish", { "dixuangong", -1 }, _ksg_onActivityFinish_DHC, { "Hoµn thµnh ¶i §Þa HuyÒn Cung" }, },

    { "event_mission_stage_finish", { "jiandangyanyun", -1 }, _ksg_onActivityFinish_KDYV, { "Hoµn thµnh ¶i KiÕm §·ng YÕn V©n" }, },
    { "event_mission_stage_finish", { "jiandangyanyunhero", -1 }, _ksg_onActivityFinish_KDYV, { "Hoµn thµnh ¶i KiÕm §·ng YÕn V©n Anh Hïng" }, },
    
    
    { "event_mission_stage_finish", { "taiyi", -1 }, _ksg_onActivityFinish_TNT, { "Hoµn thµnh ¶i Th¸i NhÊt Th¸p" }, },
    { "event_mission_stage_finish", { "taiyihero", -1 }, _ksg_onActivityFinish_TNT, { "Hoµn thµnh ¶i Th¸i NhÊt Th¸p - Anh hïng" }, },
    
    { "event_mission_stage_finish", { "new_taixu", -1 }, _ksg_onActivityFinish_TH, { "Hoµn thµnh ¶i Th¸i H­" }, },
    { "event_mission_stage_finish", { "cangjian", -1 }, _ksg_onActivityFinish_TK, { "Qua ¶i tµng kiÕm" }, },
    { "event_mission_stage_finish", { "tuquangcac", -1, }, _ksg_onActivityFinish_TQC, { "Qua ¶i Tö Quang C¸c" }, },
    { "event_mission_stage_finish", { "tuquangcac", 5, }, _ksg_onActivityFinish_TQC5, { "Qua ¶i 5 Tö Quang C¸c" }, },
    { "event_mission_stage_finish", { "tuquangcac", 6, }, _ksg_onActivityFinish_TQC6, { "Qua ¶i 6 Tö Quang C¸c" }, },

    { "event_mission_award", { "newbattle", -1, -1, -1 }, _ksg_onActivityFinish_NewBattle, { "NhËn th­ëng chiÕn tr­êng" }, },
    { "event_mission_award", { "tianmenzhen", -1, -1, -1 }, _ksg_onActivityFinish_TMT, { "NhËn th­ëng Thiªn M«n TrËn" }, },

    { "event_mission_award", { "kfbattle", -1, -1, -1 }, _ksg_onActivityFinish_TMTLSV, { "L·nh th­ëng 1 lÇn Thiªn M«n TrËn LSV" }, },
    { "event_mission_award", { "hieplo", -1, -1, -1 }, _ksg_onActivityFinish_HiepLo, { "NhËn th­ëng HiÖp Lé LSV" }, },
    { "event_mission_award", { "phaodaichien", -1, -1, -1 }, _ksg_onActivityFinish_PDLSV, { "NhËn th­ëng Ph¸o ®µi chiÕn LSV" }, },

    { "event_mission_task_award", { "pvp", "yunbiao", -1 }, _ksg_onActivityFinish_VanTieu, { "Hoµn thµnh 1 lÇn vËn tiªu" }, },
    { "event_mission_task_award", { "pvp", "duobiao", -1 }, _ksg_onActivityFinish_CuopTieu, { "Hoµn thµnh 1 lÇn c­íp tiªu" }, },

    { "event_mission_task_award", { "planttree", "plantseedtree", -1 }, _ksg_onActivityFinish_TuiHG, { "Trång thµnh c«ng c©y tói h¹t gièng" }, },
    { "event_mission_task_award", { "planttree", "bigtreeprize", -1 }, _ksg_onActivityFinish_BNL, { "Thu ho¹ch b¸t nh· lín" }, },
    { "event_mission_task_award", { "planttree", "smalltreeprize", -1 }, _ksg_onActivityFinish_BNN, { "Thu ho¹ch c©y b¸t nh· nhá" }, },
    { "event_mission_task_award", { "planttree", "plant4lingtree", -1 }, _ksg_onActivityFinish_CayTuLinh, { "Trång thµnh c«ng c©y tø linh" }, },
    --{ "event_mission_task_award", { "planttree", "plantbigtree", -1 }, _ksg_onActivityFinish_BNL, { "Trång thµnh c«ng c©y b¸t nh· lín" }, },

    -- KSG events
    { "event_mission_task_award", { "ksgsystem", "thuonghoi", -1 }, _ksg_onActivityFinish_ThuongHoi, { "Hoµn thµnh th­¬ng héi" }, },
    --{ "event_mission_task_award", { "ksgsystem", "nvsumon", -1 }, _ksg_onActivityFinish_NhiemVuSuMon, { "Hoµn thµnh s­ m«n" }, },
    { "event_mission_task_award", { "ksgsystem", "nvsumon_new", -1 }, _ksg_onActivityFinish_NhiemVuSuMon_New, { "Hoµn thµnh s­ m«n míi" }, },
    { "event_mission_task_award", { "ksgsystem", "newresourcebattle", -1, }, _ksg_onActivityFinish_NewResBattle, { "NhËn th­ëng nhiÖm vô Tµi Nguyªn ChiÕn" }, },
    { "event_mission_task_award", { "ksgsystem", "luckystar", 16, }, _ksg_onActivityFinish_LuckyStar, { "Dïng 16 sao may m¾n" }, },
    { "event_mission_task_award", { "ksgsystem", "luckystar", 32, }, _ksg_onActivityFinish_LuckyStar, { "Dïng 32 sao may m¾n" }, },
    { "event_mission_task_award", { "ksgsystem", "nuoabaohap", 100, }, _ksg_onActivityFinish_NuOa, { "Dïng 100 n÷ oa b¶o h¹p" }, },
    { "event_mission_task_award", { "ksgsystem", "nuoabaohap", 200, }, _ksg_onActivityFinish_NuOa, { "Dïng 200 n÷ oa b¶o h¹p" }, },
    { "event_mission_affairs", { "worldboss", "killboss", -1 }, _ksg_onActivityFinish_KillWorldBoss, { "Th­ëng kÝch s¸t boss hoµng kim" }, },
    { "event_mission_box_award", { "worldboss", "small", -1 }, _ksg_onActivityFinish_OpenSmallBox_WorldBoss, { "Th­ëng më r­¬ng nhá boss HK" }, },
    { "event_mission_box_award", { "worldboss", "gold", -1 }, _ksg_onActivityFinish_OpenGoldBox_WorldBoss, { "Th­ëng më r­¬ng vµng boss HK" }, },
}
