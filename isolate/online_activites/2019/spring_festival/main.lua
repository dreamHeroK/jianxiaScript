
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nian_monster.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\god_fu.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§,ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "spring2021", --2021 reOpen
    szViewName 			= SF2019_ACT_NAME,
    nTalkBeginDate		= SF2019_FULL_BEGIN_DATE,
    nBeginDate 			= SF2019_FULL_BEGIN_DATE,
    nEndDate 			= SF2019_FULL_END_DATE,
    nTaskGroup 			= SF2019_TASKGROUP[1],
    nTaskGroupVersion	= SF2019_TASKGROUP[2],
}

testItem = {2,1,31269}

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    {"event_server_time", {9, 0}, 	NM2019_CreateLittleMonster,	{}  },
    {"event_server_time", {1, 0}, 	NM2019_ClearLittleMonster,	{}  },
    {"event_kill_npc", {"TiÓu Niªn Thó G©y Rèi", 106}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"TiÓu Niªn Thó G©y Rèi", 202}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"TiÓu Niªn Thó G©y Rèi", 600}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"TiÓu Niªn Thó G©y Rèi", 507}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"TiÓu Niªn Thó G©y Rèi", 327}, NM2019_OnKillLittleMonster,	{}  },

    {"event_kill_npc", {"TÇm B¶o Nh©n", 506}, ZZ2019_OnKillMonster,	{"TÇm B¶o Nh©n"}  },
    {"event_kill_npc", {"Sa M¹c Hµnh Nh©n", 506}, ZZ2019_OnKillMonster,	{"Sa M¹c Hµnh Nh©n"}  },
    {"event_kill_npc", {"NhÊt PhÈm §­êng ¸m S¸y Sø", 503}, ZZ2019_OnKillMonster,	{"NhÊt PhÈm §­êng ¸m S¸y Sø"}  },
    {"event_kill_npc", {"KÎ ®µo mé", 503}, ZZ2019_OnKillMonster,	{"KÎ ®µo mé"}  },

    -- ½£µ´/Ì«Ò» 100%»ñµÃ1¸öôÕÒ¶ £¨²ÄÁÏ1£©
    {"event_mission_stage_finish", {"jiandangyanyun", 5},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyun", 6},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    
    {"event_mission_stage_finish", {"taiyi", 6},            ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"taiyihero", 6},        ZZ2019_OnMissionCompleted,{ 1, 10000,} },
    -- µØĞş/Íò½£/ÁºÉ½ 20%»ñµÃ1¸öôÕÒ¶ £¨²ÄÁÏ1£©
    {"event_mission_stage_finish", {"dixuangong", 3},   ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
    {"event_mission_stage_finish", {"wanjianzhong", 4}, ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
    {"event_mission_stage_finish", {"liangshan", 4},    ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
}

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
    {id={"littleBox", 1,}, clear="daily" }, --Ã¿ÈÕÊ¹ÓÃĞ¡ÄêÊŞ±¦ÏäµÄ´ÎÊı 2822
    {id={"firework", 2,}, clear="daily" }, --Ã¿ÈÕÊ¹ÓÃ±ŞÅÚÕ¨ÄêÊŞµÄ´ÎÊı  2823
    {id={"godfu_award", 3,}, clear="daily" }, --Ã¿ÈÕÁìÈ¡¸£Éñ½±Àø 2824
    {id={"use_zz", 4,}, clear="daily" }, --Ã¿ÈÕÊ¹ÓÃôÕ×ÓµÄ´ÎÊı 2825
    {id={"godfu_award_cnt", 5,}, }, --ÀÛ¼ÆÁìÈ¡¸£Éñ½±Àø 2826
    {id={"use_guild_firework", 6,}, }, --ÔÚ°ï»á¿ªÄê·¹¸±±¾Ê¹ÓÃ±¬ÖñµÄ´ÎÊı 2827
    {id={"qrj_award", 7,}, }, --·ÖbitÓÃ 1-ÇéÈË½Ú»î¶¯Áì½±±ê¼Ç 2-ÇéÈË½ÚÈÎÎñÖØÖÃ±ê¼Ç 2828
    {id={"do_jingjiu", 8,}, }, --·¢Æğ¾´¾Æ 2829
    {id={"award_jingjiu", 9,}, }, --·¢Æğ¾´¾Æ 2830
}
function on_add_watches()
    isolate_watch_item_talk(tLittleMonsterItem[1], tLittleMonsterItem[2], tLittleMonsterItem[3], "NM2019_On_open_little_monster_box")
    isolate_watch_item_talk(tFireworkItem[1].item[1], tFireworkItem[1].item[2], tFireworkItem[1].item[3], "NM2019_OnUseFirework")
    isolate_watch_item_talk(tFireworkItem[2].item[1], tFireworkItem[2].item[2], tFireworkItem[2].item[3], "NM2019_OnUseFirework")
    isolate_watch_item_talk(tZZ[1], tZZ[2], tZZ[3], "ZZ2019_OnUseZZ")
    isolate_watch_item_talk(2, 1, 31288, "SP2019_OnUseAwardTicket")
    
    -- isolate_watch_npc_talk(tFushen[2], 200, "FS2019_OnTalk2Fushen")

-------------------------------------------------------------------------------------------
    if SF2019_DEBUG == 1 then
        isolate_watch_item_talk(testItem[1], testItem[2], testItem[3], "test_func")
    end
end


function on_event_server_start()
    NM2019_OnSeverStart()
    FS2019_OnSeverStart()
end

function test_func()
    local szTitle = "§¹o Cô Thö NghiÖm"
    local tbSay = {}
    tinsert(tbSay, "Xãa biÕn l­îng/debug_resetAll")
    tinsert(tbSay, "Gäi TiÓu Niªn Thó/NM2019_CreateLittleMonster")
    tinsert(tbSay, "Xãa TiÓu Niªn Thó/NM2019_ClearLittleMonster")
    tinsert(tbSay, "nothing/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function debug_resetAll()
    set_task("littleBox", 0)
    set_task("firework", 0)
    set_task("godfu_award", 0)
    local tTaskId = {
        586,587,588,589,590,591,592,593,
    }
    for i = 586, 600 do
        ClearGTask(i)
    end
end