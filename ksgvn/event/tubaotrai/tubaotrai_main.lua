Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")

Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\tubaotrai\\tubaotrai.lua')

t_isolate_base_cfg = {
    nPriority 			= 1,
    szEngName 			= "tubaotrai",
    szViewName 			= "Tô B¶o Trai",
    nTalkBeginDate 	= EVENT_TUBAOTRAI_START_DATE,
    nBeginDate 			= EVENT_TUBAOTRAI_START_DATE,
    nEndDate 				= EVENT_TUBAOTRAI_END_DATE,
}

t_isolate_user_batch_watch_list = {
    {"event_mission_task_award", {"liangshan","1chuyan", -1}, tubaotrai_GiveHuyenThach,	{"Hoµn thµnh nhiÖm vô khiªu chiÕn L­¬ng S¬n-S¬"},  },
    {"event_mission_task_award", {"liangshan","2zhongyong", -1}, tubaotrai_GiveHuyenThach,	{"Hoµn thµnh nhiÖm vô khiªu chiÕn L­¬ng S¬n-Trung Dòng"},  },
    {"event_mission_task_award", {"wanjianzhong","1daily_pass", -1}, tubaotrai_GiveHuyenThach,	{"Hoµn thµnh nhiÖm vô V¹n KiÕm Tròng h»ng ngµy"},  },
    {"event_mission_task_award", {"wanjianzhong","2daily_fanpai", -1}, tubaotrai_GiveHuyenThach,	{"Hoµn thµnh nhiÖm vô V¹n KiÕm Tròng h»ng ngµy"},  },
    {"event_mission_task_award", {"dixuangong","2dapo", -1}, tubaotrai_GiveHuyenThach,	{"Hoµn thµnh nhiÖm vô ®¹i ph¸ §Þa HuyÒn Cung"},  },
}

function on_add_watches()
    isolate_watch_npc_talk("Chñ th­¬ng héi", 350, "tubaotrai_OnNpcTalk")
    isolate_watch_npc_talk("Chñ th­¬ng héi", 300, "tubaotrai_OnNpcTalk")
    isolate_watch_npc_talk("Chñ th­¬ng héi", 100, "tubaotrai_OnNpcTalk")
end


function on_init_ok()
    isolate_enable_event_dispatch(-1)
end