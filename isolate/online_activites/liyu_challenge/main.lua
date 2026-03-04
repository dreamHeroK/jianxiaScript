--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ
Import("\\settings\\static_script\\lib\\item_define.lua")
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")
-- Include("\\script\\lib\\sdb.lua")
Include("\\script\\isolate\\online_activites\\liyu_challenge\\liyu_mission2.lua")
Include("\\script\\isolate\\online_activites\\liyu_challenge\\data.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\function\\ornament\\ornament.lua")

t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "liyu_challenge",
    szViewName 			= "ChiÕn ®Êu b¶o vÖ C¸ ChĞp",
    nTalkBeginDate		= 20160915,
    nBeginDate 			= 20160915,
    nEndDate 			= 20161003,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 24,
}

LIYU_ONLINE_TIME        = 180*60--180*60-- Ã¿ÈÕÔÚÏßÈÎÎñĞèÒªµÄÊ±¼ä£¬µ¥Î»s
LIYU_WATERING_LIMIT     = 10            -- Ã¿ÈÕÍæ¼Ò¿É½½Ë®10´Î
LIYU_NPC_LIMIT          = 20            -- ÌìÒõ½ÌÍ·Ä¿BOSSÊıÁ¿ÏŞÖÆ
LIYU_NPC_LIFE_TIME      = 20*60         -- ÌìÒõ½ÌÍ·Ä¿BOSS´æ»îÊ±¼ä
LIYU_MISSION_END_DATE   = 161001        -- 2016 10 01 ÈÎÎñ²¿·Ö½áÊø£¬Áì½±Á÷³Ì¿ªÊ¼
LIYU_HIGH_MED_LIMIT     = 100           -- Ê¹ÓÃ¸ß¼¶½âÒ©µÄÃ¿ÈÕ´ÎÊıÏŞÖÆ
LIYU_TOP_MED_LIMIT      = 200           -- Ê¹ÓÃ¸ß¼¶½âÒ©µÄÃ¿ÈÕ´ÎÊıÏŞÖÆ
LIYU_WATER_EXP          = 1000000       -- ½½Ë®»î¶¯»ñµÃµÄ¾­Ñé
LIYU_CATCH_EXP          = 500000        -- ³ı³æ»î¶¯»ñµÃµÄ¾­Ñé
LIYU_CATCH_ADD_SCORE    = 5             -- ×½³æ¼ÓµÄ·ÖÊı
LIYU_WATER_ADD_SCORE    = 1             -- ½½Ë®¼ÓµÄ·ÖÊı
LIYU_POP_CATCH_BUG      = 5             -- ³ı³æÔö¼Ó¶àÉÙµãÕÛ³åÉçÉùÍû
LIYU_POP_WATER          = 10            -- ½½Ë®Ôö¼Ó¶àÉÙµãÕÛ³åÉçÉùÍû
LIYU_MAX_POP_PER_DAY    = 100

LIYU_TONG_DATE_LIMIT    = 7*24*3600     -- ÖÁÉÙĞèÒª¼ÓÈë°ï»áÕâÃ´³¤Ê±¼ä
LIYU_SEF_SCORE_LIMIT    = 150           -- ¸öÈËÖÁÉÙĞèÒª»ñµÃ150·Ö²ÅÄÜ²ÎÓëÁì½±
LIYU_POWER_OF_PIECE     = 150           -- Ò»¸öºì·ãËéÆ¬»»150·ç»ª»ı·Ö
LIYU_GIVE_MED_EXP1      = 500000        -- Ìá½»µÍ¼¶½âÒ©µÄ¾­Ñé
LIYU_GIVE_MED_EXP2      = 800000        -- ÖĞ
LIYU_GIVE_MED_EXP3      = 1000000       -- ¸ß
LIYU_GIVE_MED_EXP4      = 1000000       -- ÌØ
LIYU_SUMMON_BOSS_SCORE  = 14            -- ÕÙ»½ÌìÒõ´óÍ·Ä¿ 14·Ö
LIYU_SLAIN_BOSS_SCORE   = 7             -- É±ËÀÌìÒõ´óÍ·Ä¿ 7·Ö
LIYU_BOSSSOCRE_PER_MED  = 20            -- Ã¿Æ¿¸ß¼¶½âÒ©¶àÉÙBOSS»ı·Ö
liyu_szNpcName = "<color=gold>Sø Gi¶ LÔ Héi:<color>"
liyu_main_npc = {
    {"9y_jrds","Sø Gi¶ LÔ Héi",200,1370,2866},
    {"9y_jrds","Sø Gi¶ LÔ Héi",300,1743,3510},
    {"9y_jrds","Sø Gi¶ LÔ Héi",100,1413,2981},
}


liyu_local_buf = {
    -- ["tongName"] = {"tongName", "Player1", nScore1, "Player2", nScore2, "Player3", nScore3, totalScore };    
}


liyu_xianyaotree_npc = {
    template    = "9y_bhxys",
    name        = "C©y Tiªn D­îc (Bang)",
    script      = "\\script\\isolate\\online_activites\\liyu_challenge\\npc_caiyaoren.lua",
    pos         = {300,1740,3494}
}
liyu_caiyao_npc = {
    pos = {
            -- ÈªÖİ¸®Î÷:
        {105,1550,3185}, {105,1498,3174}, {105,1533,3079}, {105,1582,2987}, {105,1503,3050},
        {105,1570,2907}, {105,1509,2943}, {105,1463,2991}, {105,1425,3083}, {105,1450,2885},
            -- ÈªÖİ¸®±±:
        {108,1426,3124}, {108,1426,3124}, {108,1559,3160}, {108,1590,3087}, {108,1553,2968},
        {108,1490,2920}, {108,1422,2897}, {108,1403,2984}, {108,1452,3045}, {108,1400,3090},
            -- ³É¶¼¸®Î÷:
        {301,1594,3146}, {301,1522,3161}, {301,1452,3054}, {301,1532,3055}, {301,1595,2959},
        {301,1568,2855}, {301,1514,2784}, {301,1444,2855}, {301,1502,2904}, {301,1404,2963},
            -- ³É¶¼¸®ÄÏ:
        {304,1515,2837}, {304,1415,2921}, {304,1478,2969}, {304,1576,3008}, {304,1510,3031},
        {304,1422,3035}, {304,1484,3116}, {304,1574,3159}, {304,1479,3151}, {304,1404,3161},
            -- ³É¶¼¸®±±:
        {308,1464,3216}, {308,1426,3136}, {308,1405,3046}, {308,1406,2988}, {308,1476,2982},
        {308,1486,3076}, {308,1547,3127}, {308,1584,3068}, {308,1519,3018}, {308,1582,2984},
            -- ãê¾©¸®ÄÏ£º
        {201,1539,2832}, {201,1491,2889}, {201,1483,2814}, {201,1429,2830}, {201,1421,2959},
        {201,1528,2946}, {201,1592,3004}, {201,1514,3064}, {201,1418,3100}, {201,1585,3153},
            -- ãê¾©¸®¶«:
        {205,1631,2910}, {205,1605,3029}, {205,1782,2857}, {205,1753,3014}, {205,1598,3185},
        {205,1651,3307}, {205,1768,3111}, {205,1854,3023}, {205,1830,3200}, {205,1796,3362},
            -- ãê¾©¸®Î÷:
        {203,1512,3137}, {203,1556,3039}, {203,1573,2923}, {203,1505,3003}, {203,1417,3095},
        {203,1401,2986}, {203,1387,2894}, {203,1419,2817}, {203,1492,2807}, {203,1558,2815},
    },
    template    = "9y_cyr",
    name        = "Ng­êi H¸i Thuèc",
    lifetime    = 60*10,
    script      = "\\script\\isolate\\online_activites\\liyu_challenge\\npc_caiyaoren.lua",
}

liyu_caiyao = {
    {1276,2967}, {1327,3109}, {1525,2977},
    {1283,2947}, {1330,3152}, {1537,3071},
    {1290,2928}, {1316,3197}, {1569,3016},
    {1302,2909}, {1371,3056}, {1527,3133},
    {1318,2902}, {1389,3014}, {1516,3189},
    {1321,2867}, {1399,2960}, {1489,3128},
    {1343,2840}, {1458,2835}, {1456,3158},
    {1370,2817}, {1438,2787}, {1459,3080},
    {1369,2760}, {1460,2966}, {1429,3047},
    {1377,2877}, {1505,2883}, {1407,3082},
    {1350,2931}, {1511,2827}, {1398,3134},
    {1339,2973}, {1524,2773}, {1408,3184},
    {1323,3017}, {1531,2918}, {1304,3067},
    {1572,2871},
}

liyu_tb_tree_award = {
    [1]={{2,1,30912,100,-1,"HiÖp NghÜa Chi Chøng"}},
    [2]={{2,1,30912,200,-1,"HiÖp NghÜa Chi Chøng"}},
    [3]={{2,95,2084,5,4,"Hµo HiÖp LÖnh"}},
    [4]={{2,1,30534,5,4,"ThiÕt Tinh cÊp 2"}},
    [5]={{2,1,30913,7,4,"§ång TÕ Chi NguyÖn"}},
    [6]={{2,1,30730,4,4,"Kinh M¹ch §ång Nh©n"}},
    [7]={{2,1,30730,6,4,"Kinh M¹ch §ång Nh©n"}},
    [8]={{2,1,30731,2,4,"Kinh M¹ch Ng©n Nh©n"}},
    [9]={
        {2,1,30731,4,4,"Kinh M¹ch Ng©n Nh©n"},
        {2,1,31058,9,4,"PhiÕu Khiªu ChiÕn"},
    },
    [10]={
        {2,1,30731,8,4,"Kinh M¹ch Ng©n Nh©n"},
        {2,1,31058,15,4,"PhiÕu Khiªu ChiÕn"},
        {2,1,31162,1,4,"Hép Ngo¹i Trang DiÖp Th­îng Thu Phong"}
    },
}

liyu_tb_tong_award = {
    [1]={{2,95,2084,10,-1,"Hµo HiÖp LÖnh"}},
    [2]={{2,1,30534,10,-1,"ThiÕt Tinh cÊp 2"}},
    [3]={{2,1,30913,14,-1,"§ång TÕ Chi NguyÖn"}},
    [4]={{2,1,30730,8,-1,"Kinh M¹ch §ång Nh©n"}},
    [5]={{2,1,31064,1,-1,"VÈy Kú L©n"}},
    [6]={{2,1,31058,6,4,"PhiÕu Khiªu ChiÕn"},},
    [7]={{2,1,31058,9,4,"PhiÕu Khiªu ChiÕn"},},
    [8]={
        {2,1,31058,15,4,"PhiÕu Khiªu ChiÕn"},
        {2,1,31162,1,4,"Hép Ngo¹i Trang DiÖp Th­îng Thu Phong"},
    },
    [9]={
        --{2,1,31162,1,4,"Ò¶ÉÏÇï·çÍâ×°ÀñºĞ"},
        {2,1,31074,1,1,"Kh¾c B¶n Linh Ho¹t CÊp 2 (¸o)"},
    },
}


function _refresh_caiyaonpc()
    if liyu_check_ms_date() ~= 1 then  return end
    Msg2Global("Ng­êi H¸i Thuèc ®· xuÊt hiÖn ë gÇn c¸c thµnh lín, c¸c ®¹i hiÖp h·y ®Õn ®ã t×m ®Ó lÊy nguyªn liÖu thuèc.")
    local pos = liyu_caiyao_npc.pos;
    for group = 0,7 do
        local nRand = random(0,5)
        for j=1,5 do
            local i = j+nRand+group*10;
            local npcidx = CreateNpc(liyu_caiyao_npc.template,liyu_caiyao_npc.name,pos[i][1],pos[i][2],pos[i][3])
            SetNpcLifeTime(npcidx,liyu_caiyao_npc.lifetime)
            SetNpcScript(npcidx,liyu_caiyao_npc.script)
        end
    end
end



function handle_count_time()
    local bHas = 0;
    for key,var in liyu_local_buf do
        bHas = 1;
        break;
    end
    if bHas == 1 then
        liyu_writeFile();
    else
        liyu_readFile();
    end
end

function _refresh_both()
    if liyu_check_ms_date() ~= 1 then return end
    _refresh_caiyaonpc()
    Msg2Global("Qu¸i C¸ ChĞ xuÊt hiÖn t¹i Long TuyÒn Th«n ®Şnh tÊn c«ng th«n d©n, mêi c¸c hiÖp sÜ sö dïng thuèc gi¶i ®Ó gi¶i cøu Qu¸i C¸ ChĞ Hå §å.")
    for i=1,getn(liyu_monster_npc.pos) do
        local nNpcidx = CreateNpc(liyu_monster_npc.template,liyu_monster_npc.name,liyu_monster_npc.pos[i][1],liyu_monster_npc.pos[i][2],liyu_monster_npc.pos[i][3])
        SetNpcLifeTime(nNpcidx,3600*4)
    end
end

function liyu_handle_leave_tong(...)
    local nCurScore = get_task("tskid_sef_score")
    if nCurScore == 0 then return end 
    local nNewScore = floor(nCurScore/2);
    set_task("tskid_sef_score",nNewScore)
    Msg2Player(format("Do b¹n ra khái bang héi trong thêi gian ho¹t ®éng, ®é cèng hiÕn ho¹t ®éng sÏ bŞ trõ ®Õn %d ®iÓm.",nNewScore))
end

t_isolate_user_batch_watch_list = { 
	{"event_server_tick_minute",{1},handle_count_time,{ }},
    {"event_server_time", {18, 0},  _refresh_both ,{ }  },
    {"event_server_time", {18, 30}, _refresh_caiyaonpc,{ }  },
    {"event_server_time", {19, 0},  _refresh_caiyaonpc,{ }  },
    {"event_server_time", {19, 30}, _refresh_caiyaonpc,{ }  },
    {"event_server_time", {20, 0},  _refresh_caiyaonpc,{ }  },
    {"event_server_time", {20, 30}, _refresh_caiyaonpc,{ }  },
    {"event_server_time", {21, 0},  _refresh_caiyaonpc,{ }  },
    {"event_player_tong_operation", {"leave",-1,-1}, liyu_handle_leave_tong, },
}

LIYU_DC_TSK_BIT = {
    yaocaibox = 1,  -- Ã¿ÈÕÒ»´Î¿ªÆôÒ©²Ä±¦Ïä
    shovel    = 2,  -- Ã¿ÈÕÒ»´ÎÁìÈ¡²ÉÒ©²ù
}
LIYU_DC_TSK_BYTE = {
    high_med = 1,   -- Ê¹ÓÃ¸ß¼¶½âÒ©´ÎÊı
    top_med  = 2,   -- Ê¹ÓÃÌØ¼¶½âÒ©´ÎÊı
    add_pop  = 3,   -- Ã¿Ìì»ñµÃÕÛ³åÉçÉùÍû´ÎÊı
}

LIYU_TSK_BIT_AWARD  ={
    tong = 1,
    tree = 2,
}

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
   {id={"tskid_daily_end_time", 1,}, clear="daily" },   -- Ã¿ÈÕÔÚÏßÈÎÎñ¼ÆÊ± ³õÊ¼»¯Îª0 ¿ªÆôÈÎÎñºóÎªÈÎÎñÍê³ÉµÄÊ±¼ä(GetTime()Éú³ÉÊı) Áì½±ºóÎª-1
   {id={"tskid_once_dc", 2,}, clear="daily" },          -- Ã¿ÈÕÖ»ÄÜÖ´ĞĞÒ»´ÎµÄ²Ù×÷£¬¶¨Òå32Î»ÕûĞÎ°´Î»´æÈ¡£¬´æÈ¡¹æÔò¶¨ÒåÔÚtable LIYU_DC_TSK_BIT
   {id={"tskid_byte", 3,}, clear="daily" },             -- °´×Ö½Ú´æ´¢µÄÕûĞÎÈÎÎñ±äÁ¿£¬×î¸ß255
   {id={"tskid_caiyao_pos", 4,} },                      -- ¼ÇÂ¼µ±Ç°²ÉÒ©²ù¿ÉÒÔÊ¹ÓÃµÄ×ø±ê¡£
   {id={"tskid_sef_score", 5,} },                       -- ¼ÇÂ¼×Ô¼ºÏÉÒ©Ê÷µÄµÃ·Ö
   {id={"tskid_watering", 6,}, clear="daily" },         -- ¼ÇÂ¼×Ô¼ºÃ¿ÈÕ½½Ë®µÄ´ÎÊı
   {id={"tskid_getpop", 7,}, clear="daily" },           -- ¼ÇÂ¼Ã¿ÈÕ»ñµÃµÄÕÛ³åÉçÉùÍû
   {id={"tskid_getaward", 8,}, },                       -- ¼ÇÂ¼ÊÇ·ñÁì½±
   {id={"tskid_bossscore", 9,}, },                       -- ÕÙ»½ºÍ»÷É±BOSSµÄ½±ÀøµãÊı
}

function on_add_watches() 
	isolate_watch_npc_talk("Sø Gi¶ LÔ Héi", 100, "liyu_handle_talk2jieridashi")      --Óë½ÚÈÕ´óÊ¹¶Ô»°
    isolate_watch_npc_talk("Sø Gi¶ LÔ Héi", 200, "liyu_handle_talk2jieridashi")
    isolate_watch_npc_talk("Sø Gi¶ LÔ Héi", 300, "liyu_handle_talk2jieridashi")
    isolate_watch_npc_talk("C©y Tiªn D­îc (Bang)", 300, "liyu_handle_talk2yaoxiantree")       --ÓëÒ©ÏÉÊ÷¶Ô»°
    isolate_watch_npc_talk("Qu¸i C¸ ChĞp Hå §å", 106, "liyu_handle_talk2liyuguai")   --ÓëÀğÓã¹Ö¶Ô»°
    isolate_watch_event("event_kill_npc", "liyu_handle_on_kill_npc", "", 111)   --ÔÚÇåÏª¶´É±¹Ö
    isolate_watch_item_talk(2,1,31151, "handle_on_use_yaocai_box")              --´ò¿ªÒ©²Ä±¦Ïä
    isolate_watch_item_talk(2,1,31158, "handle_on_use_shovel")                  --Ê¹ÓÃ²ÉÒ©²ù
    isolate_watch_item_talk(2,1,31156, "handle_on_use_bucket")                  --Ê¹ÓÃË®Í°
    isolate_watch_item_talk(2,1,31159, "handle_on_use_flares")                  --Ê¹ÓÃÇó¾ÈĞÅºÅµ¯
    isolate_watch_item_talk(2,1,31164, "liyu_use_chinese_piece")                --Ê¹ÓÃÖĞ¹ú½£ËéÆ¬
    
    isolate_watch_event("event_kill_npc", "liyu_handle_on_kill_boss", "", 106)   --ÔÚÁúÈª´åÉ±¹Ö
end

-- liyu_npc_cnt = 0;
liyu_boss = {}



---------------------------------------É±BOSS-------------------------------------------

function liyu_refresh_boss()
    if liyu_check_ms_date() ~= 1 then return end
    for i = 1,getn(liyu_boss) do
        local szNpcName = GetNpcName(liyu_boss[i])
        if szNpcName ~= "Thiªn ¢m §¹i §Çu Môc" and szNpcName ~= "Thiªn ¢m TiÓu §Çu Môc" then
            tremove(liyu_boss,i);
        end
    end
end

function handle_on_use_flares(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check(1) ~= 1 then
        Talk(1,"",format("Víi thùc lùc hiÖn t¹i cña %s, tù ı gäi §Çu Môc ®Şch lµ qu¸ nguy hiÓm. H·y rÌn luyÖn thªm råi tiÕn hµnh. (<color=red>CÇn cÊp 90 trë lªn vµ häc ®ñ kü n¨ng cÊp 55<color>)",szSex))
        return 
    end
    local szSex = "HiÖp sÜ" if GetSex()==2 then szSex = "N÷ hiÖp " end
    local m,x,y = GetWorldPos()
    if m ~= 106 then
        Talk(1,"","Ph¸o Tİn HiÖu chØ ®­îc dïng ë <color=red>Long TuyÒn Th«n<color>")
        return 
    end
    liyu_refresh_boss()
    if getn(liyu_boss) >= LIYU_NPC_LIMIT then
        Talk(1,"","HiÖn cã qu¸ nhiÒu tİn hiÖu cÇu cøu, h·y thö l¹i sau.")
        return
    end

    if DelItem(2,1,31159,1) == 1 then
        local npcid = CreateNpc("9y_tydtm","Thiªn ¢m §¹i §Çu Môc",m,x,y);
        tinsert(liyu_boss,npcid);
        SetNpcLifeTime(npcid,LIYU_NPC_LIFE_TIME)
        set_task("tskid_bossscore",get_task("tskid_bossscore")+LIYU_SUMMON_BOSS_SCORE)
        Msg2Player(format("B¹n ®· sö dông Ph¸o Tİn HiÖu CÇu Cøu, nhËn ®­îc %d ®iÓm tİch ho¹t ®éng.",LIYU_SUMMON_BOSS_SCORE))
    end
end

function liyu_handle_on_kill_boss(data, para)
    if liyu_check_ms_date() ~= 1 then return end
    if liyu_condition_check(1) ~= 1 then return end;
    if data[1] ~= "Thiªn ¢m TiÓu §Çu Môc" and data[1] ~= "Thiªn ¢m §¹i §Çu Môc" then return end;
    SetNpcLifeTime(data[3],3)
    for i = 1, getn(liyu_boss) do
        if liyu_boss[i] == data[3] then
            tremove(liyu_boss,i)
            break;
        end
    end
    if data[1] == "Thiªn ¢m TiÓu §Çu Môc" then
        -- gf_AddItemEx({2,1,31153,1}, "ÖĞ¼¶µÄ½âÒ©")
        -- -- AddRuntimeStat(46,1,2,1)
    else
        -- gf_AddItemEx({2,1,31154,1}, "¸ß¼¶µÄ½âÒ©") --½âÒ©¸ÄÎª¶Ò»»ĞÎÊ½·¢·Å
        -- -- AddRuntimeStat(46,1,3,1)
        set_task("tskid_bossscore",get_task("tskid_bossscore")+LIYU_SLAIN_BOSS_SCORE)   -- Ìí¼Ó¶Ò»»»ı·Ö
        Msg2Player(format("B¹n ®· tiªu Thiªn ¢m §¹i §Çu Môc, nhËn ®­îc %d ®iÓm tİch ho¹t ®éng.",LIYU_SLAIN_BOSS_SCORE))
    end
end
--------------------------------------------------------------------------------------

function liyu_handle_talk2yaoxiantree()
    if liyu_condition_check(1) ~= 1 then
        local szTitle = "Mét C©y Tiªn D­îc thÇn kú. (<color=red>CÊp 90 trë lªn vµ häc ®ñ kü n¨ng cÊp 55 míi ®­îc tham gia ho¹t ®éng.<color>)"
        local tSay = {}
        tinsert(tSay,"Rêi khái/nothing")
        Say(szTitle,getn(tSay),tSay)
        return
    end
    local nDate = tonumber(date("%y%m%d"))
    if nDate < LIYU_MISSION_END_DATE then
        liyu_handle_talk2xianyaotree_ms()
    else
        liyu_handle_talk2xianyaotree_award()
    end
end

function liyu_handle_talk2xianyaotree_award()
    local szTongName = GetTongName();
    local szTitle = "Mét C©y Tiªn D­îc thÇn kú"
    local tSay = {}
    if liyu_local_buf[szTongName] == nil then
        tinsert(tSay,"Rêi khái/nothing")
    else
        local nSefScore = get_task("tskid_sef_score")
        local nTotScore = liyu_local_buf[szTongName][8];
        szTitle = szTitle..format(", ®é tr­ëng thµnh hiÖn t¹i cña C©y Tiªn D­îc (Bang) lµ: %s ®iÓm,®é cèng hiÕn ho¹t ®éng cña b¹n lµ: %s ®iÓm(<color=red>l­u ı: khi ho¹t ®éng kÕt thóc, İt nhÊt ph¶i vµo bang 7 ngµy míi cã thÓ nhËn th­ëng. Ra khái bang héi sÏ bŞ trõ mét nöa ®é cèng hiÕn bang héi! <color>)", nTotScore, nSefScore)
        tinsert(tSay,"Xem xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang)/liyu_show_tong_list")
        tinsert(tSay,"NhËn th­ëng tr­ëng thµnh C©y Tiªn D­îc/liyu_get_tree_award")
        tinsert(tSay,"NhËn th­ëng xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang)/liyu_get_tong_award")
        -- tinsert(tSay,"test¼Ó°ï»á¹±Ï×¶È10000/test_add_score")
        
        tinsert(tSay,"Rêi khái/nothing")
    end
    Say(szTitle,getn(tSay),tSay)
end
function liyu_get_bucket()
     if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
     if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ") return end
     if BigGetItemCount(2,1,31156) == 0 and  BigGetItemCount(2,1,31157) == 0 and IsTongMember()~=0 then
        gf_AddItemEx({2,1,31156,1}, "Thïng N­íc")
     else
        Talk(1,"","B¹n ch­a vµo bang hoÆc ®· cã Thïng N­íc, kh«ng thÓ nhËn tiÕp.")
     end
end
function liyu_handle_talk2xianyaotree_ms()
    local szTongName = GetTongName();
    local szTitle = "Mét C©y Tiªn D­îc thÇn kú"
    local tSay = {}
    if liyu_local_buf[szTongName] == nil then
        tinsert(tSay,format("Më C©y Tiªn D­îc (Bang)/#liyu_open_xianyao(\"%s\")",szTongName))
        tinsert(tSay,"Quay l¹i sau!/nothing")
    else
        local nSefScore = get_task("tskid_sef_score")
        local nTotScore = liyu_local_buf[szTongName][8];
        szTitle = szTitle..format(", ®é tr­ëng thµnh hiÖn t¹i cña C©y Tiªn D­îc (Bang) lµ: %s ®iÓm,®é cèng hiÕn ho¹t ®éng cña b¹n lµ: %s ®iÓm(<color=red>l­u ı: khi ho¹t ®éng kÕt thóc, İt nhÊt ph¶i vµo bang 7 ngµy míi cã thÓ nhËn th­ëng. Ra khái bang héi sÏ bŞ trõ mét nöa ®é cèng hiÕn bang héi! <color>)", nTotScore, nSefScore)
        tinsert(tSay,"NhËn Thïng N­íc/liyu_get_bucket")
        tinsert(tSay,format("T­íi n­íc cho C©y Tiªn D­îc (H«m nay cßn cã thÓ t­íi %d lÇn)/#liyu_water(%d)",LIYU_WATERING_LIMIT-get_task("tskid_watering"),LIYU_WATERING_LIMIT-get_task("tskid_watering")))
        tinsert(tSay,"Trõ s©u cho C©y Tiªn D­îc/liyu_catch_bug_talk")
        tinsert(tSay,"Xem xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang)/liyu_show_tong_list")
        tinsert(tSay,"Giíi thiÖu c¸ch ch¬i C©y Tiªn D­îc (Bang)/liyu_tree_detail")
        tinsert(tSay,"Rêi khái/nothing")
    end
    Say(szTitle,getn(tSay),tSay)
end

function handle_on_use_bucket(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check() ~= 1 then return end
    local m,x,y = GetWorldPos()
    if m ~= 203 then
        Talk(1,"","H·y ®Õn <color=green>T©y BiÖn Kinh (198,176)<color> lÊy n­íc") 
        return
    end
    local k = floor(sqrt((x-1582)^2+(y-2824)^2));
    if k >= 0 and k <= 5 then
        if DelItemByIndex(nIndex,1) == 1 then
            gf_AddItemEx({2,1,31157,1}, "Thïng N­íc §Çy N­íc")
        else
            error("Cã lçi khi lÊy n­íc")
        end
    else
        Talk(1,"","H·y ®Õn <color=green>T©y BiÖn Kinh (198,176)<color> lÊy n­íc") 
        return
    end
end

function liyu_add_score(nScore)
    if liyu_check_ms_date() ~= 1 then return end
    local szTongName = GetTongName();
    local szPlayerName = GetSafeName();

    local nMyScore = get_task("tskid_sef_score")
    nMyScore = nMyScore+nScore
    set_task("tskid_sef_score",nMyScore);
    
    if liyu_local_buf[szTongName] == nil then
        print("[error]function liyu_add_score(nScore) error!")
        return 
    end

    local tInfo = liyu_local_buf[szTongName];
    local tPlayer = {}
    local nTotal = tInfo[8]+nScore;
    

    if tInfo[2] == szPlayerName then tInfo[3] = nMyScore;
    elseif tInfo[4] == szPlayerName then tInfo[5] = nMyScore;
    elseif tInfo[6] == szPlayerName then tInfo[7] = nMyScore;
    else tinsert(tPlayer,{szPlayerName,nMyScore})
    end
    tinsert(tPlayer,{tInfo[2],tInfo[3]})
    tinsert(tPlayer,{tInfo[4],tInfo[5]})
    tinsert(tPlayer,{tInfo[6],tInfo[7]})
    local cmp = function(t1,t2)
        return t1[2]>t2[2]
    end
    sort(tPlayer,cmp)
    liyu_local_buf[szTongName] = {szTongName,tPlayer[1][1],tPlayer[1][2],tPlayer[2][1],tPlayer[2][2],tPlayer[3][1],tPlayer[3][2],nTotal}
end

function liyu_water_award()
    if liyu_condition_check()~=1 then return end
    if gf_Judge_Room_Weight(2, 0) == 1 then
        local nRand = random(1,100)
        if nRand <= 10 then
            gf_AddItemEx({2,1,31152,1}, "Thuèc Gi¶i-ThÊp")
            -- AddRuntimeStat(46,1,1,1)
        end
        local nRand = random(1,100)
        if nRand <= 10 then
            gf_AddItemEx({2,1,31118,1}, "§«n Hoµng HuyÒn ThiÕt")
        end
    else
        Talk(1,"","Chç trèng tói kh«ng ®ñ, h·y chõa 2 « trèng tói.");
        return 0;
    end 
    local szTongName = GetTongName()
    local szPlayerName = GetSafeName()
    local nGotPop = get_task("tskid_getpop")
    if IsUsePop(6) == 1 then                        -- Èç¹ûÕÛ³åÉçÉùÍû¿ÉÓÃ£¬ÔòÔö¼ÓÉùÍû¡£
        AddPop(6,LIYU_POP_WATER)
        Msg2Player(format("NhËn ®­îc danh väng ChiÕt Xung X· %d ®iÓm",LIYU_POP_WATER))
    else
        Msg2Player("Do b¹n kh«ng më danh väng ChiÕt Xung X·, nªn kh«ng thÓ nhËn th­ëng danh väng ChiÕt Xung X·.")
    end 
    gf_Modify("Exp", LIYU_WATER_EXP);
    liyu_add_score(LIYU_WATER_ADD_SCORE)
    return 1;
end

function liyu_water(nWatering)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local nCnt = GetItemCount(2,1,31157)
    if nCnt < 1 then
        Talk(1,"liyu_handle_talk2yaoxiantree","Thïng N­íc cña b¹n ch­a cã n­íc, kh«ng thÓ t­íi n­íc.")
        return
    end
    if nWatering <= 0 then
        Talk(1,"","H«m nay b¹n ®· t­íi qu¸ nhiÒu n­íc cho C©y Tiªn D­îc, ngµy mai h·y quay l¹i.")
        return
    end
    if DelItem(2,1,31157,1) == 1 then
        if liyu_water_award() == 0 then
            AddItem(2,1,31157,1)
            return 
        end
        set_task("tskid_watering",get_task("tskid_watering")+1);
        Talk(1,"","T­íi n­íc thµnh c«ng")
        gf_AddItemEx({2,1,31156,1}, "Thïng N­íc")
    else
        error("Cã lçi khi t­íi n­íc")
    end
end

function liyu_catch_bug_talk()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    Talk(1,"liyu_catch_bug","Mêi b¹n nép<color=yellow> Thuèc Trõ S©u<color>.")
end

function liyu_catch_bug()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check() ~= 1 then return end; 
    local nCnt = GetItemCount(2,1,31160)
    if nCnt > 1000 then nCnt = 1000 end
    AskClientForNumber("liyu_catch_bug_CB", 0, nCnt, "CÇn dïng bao nhiªu?");
end



function liyu_catch_bug_award(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local szTongName = GetTongName()
    local szPlayerName = GetSafeName()
    gf_Modify("Exp", LIYU_CATCH_EXP*nNum);               -- Ôö¼Ó¾­Ñé¡£

    local nGotPop = get_task("tskid_getpop")

    if IsUsePop(6) == 1 then                        -- Èç¹ûÕÛ³åÉçÉùÍû¿ÉÓÃ£¬ÔòÔö¼ÓÉùÍû¡£
        if nGotPop+LIYU_POP_CATCH_BUG*nNum <= LIYU_MAX_POP_PER_DAY then
            AddPop(6,LIYU_POP_CATCH_BUG*nNum)
            set_task("tskid_getpop",nGotPop+LIYU_POP_CATCH_BUG*nNum)
            Msg2Player(format("NhËn ®­îc danh väng ChiÕt Xung X· %d ®iÓm",LIYU_POP_CATCH_BUG*nNum))
        else
            AddPop(6,LIYU_MAX_POP_PER_DAY-nGotPop)
            set_task("tskid_getpop",LIYU_MAX_POP_PER_DAY)
            Msg2Player(format("NhËn ®­îc danh väng ChiÕt Xung X· %d ®iÓm",LIYU_MAX_POP_PER_DAY-nGotPop))
            Msg2Player(format("Mçi ngµy nhiÒu nhÊt chØ cá thÓ nhËn ®­îc %d ®iÓm danh väng ChiÕt Xung X· th«ng qua ho¹t ®éng trõ s©u.",LIYU_MAX_POP_PER_DAY))
        end
    else
        Msg2Player("Do b¹n kh«ng më danh väng ChiÕt Xung X·, nªn kh«ng thÓ nhËn th­ëng danh väng ChiÕt Xung X·.")
    end 
    liyu_add_score(LIYU_CATCH_ADD_SCORE*nNum)
    return 1;
end

function liyu_catch_bug_CB(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if nNum == 0 then return end
    if DelItem(2,1,31160,nNum) == 1 then
        Talk(1,"","Trõ s©u thµnh c«ng")
        liyu_catch_bug_award(nNum)
    else
        Talk(1,"","Thuèc Trõ S©u kh«ng ®ñ, kh«ng thÓ trõ s©u")
    end
end

function liyu_show_tong_list()
    local szTongName = GetTongName();
    local tTmp = liyu_local_buf[szTongName]
    if tTmp == nil then -- Ò»°ã²»»á³öÏÖÕâÖÖÇé¿ö(=¡£=)
        return  
    end
    local szShow = format("Bang: <color=gold>%s<color>",szTongName)
--   1.%s      »î¶¯¹±Ï×¶È£º%dµã
--   2.%s      »î¶¯¹±Ï×¶È£º%dµã
--   3.%s      »î¶¯¹±Ï×¶È£º%dµã]],szTongName,tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7]);
    if tTmp[2]~=nil and tTmp[2]~="" then szShow = szShow..format("\n\n1. %s          §é cèng hiÕn ho¹t ®éng: %d ®iÓm",tTmp[2],tTmp[3]) else szShow="HiÖn kh«ng cã xÕp h¹ng." end
    if tTmp[4]~=nil and tTmp[4]~="" then szShow = szShow..format("\n2.%s          ®é cèng hiÕn ho¹t ®éng: %d ®iÓm.",tTmp[4],tTmp[5]) end
    if tTmp[6]~=nil and tTmp[6]~="" then szShow = szShow..format("\n3.%s          ®é cèng hiÕn ho¹t ®éng: %d ®iÓm.",tTmp[6],tTmp[7]) end
    local tSay = {}
    tinsert(tSay,"VÒ trang tr­íc/liyu_handle_talk2yaoxiantree")
    tinsert(tSay,"Quay l¹i sau!/nothing")
    Say(szShow,getn(tSay),tSay)
end


function liyu_give_item( tItems )
    local nCnt = getn(tItems)
    if gf_Judge_Room_Weight(nCnt, 100*nCnt) == 1 then
        for i=1,nCnt do
            gf_AddItemEx({tItems[i][1],tItems[i][2],tItems[i][3],tItems[i][4],tItems[i][5]}, tItems[i][6])
        end
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
        return 0;
    end 
    return 1;
end

function liyu_get_tree_award()
    if liyu_condition_check()~=1 then return end;
    if GetTime()-GetJoinTongTime() < LIYU_TONG_DATE_LIMIT then
        Talk(1,"","Ng­êi vµo bang ch­a ®ñ 7 ngµy kh«ng thÓ tham gia nhËn th­ëng")
        Msg2Player("Ng­êi vµo bang ch­a ®ñ 7 ngµy kh«ng thÓ tham gia nhËn th­ëng")
        return
    end
    if get_task("tskid_sef_score") < LIYU_SEF_SCORE_LIMIT then
        Talk(1,"","Ng­êi cã ®é cèng hiÕn c¸ nh©n kh«ng ®ñ 150 kh«ng thÓ tham gia nhËn th­ëng")
        Msg2Player("Ng­êi cã ®é cèng hiÕn c¸ nh©n kh«ng ®ñ 150 kh«ng thÓ tham gia nhËn th­ëng")
        return
    end
    local szTongName = GetTongName();
    if liyu_local_buf[szTongName] == nil then return end; -- Ò»°ã²»»á³öÏÖÕâÖÖÆæİâÇé¿ö=¡£=
    local bTreeAward = get_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tree)
    if bTreeAward == 1 then
        Talk(1,"","B¹n ®· nhËn phÇn th­ëng tr­ëng thµnh C©y Tiªn D­îc råi.")
        Msg2Player("B¹n ®· nhËn phÇn th­ëng tr­ëng thµnh C©y Tiªn D­îc råi.")
        return
    end
    local nTotal = liyu_local_buf[szTongName][8] 
    if nTotal < 500 then
        Talk(1,"","Bang héi víi ®é tr­ëng thµnh hiÖn t¹i cña C©y Tiªn D­îc (Bang) thÊp h¬n 500 sÏ kh«ng cã phÇn th­ëng.")
        return 
    end
    if      nTotal>=500 and nTotal<1500     then if liyu_give_item(liyu_tb_tree_award[1]) == 0 then return end -- AddRuntimeStat(46,7,1,1)
    elseif  nTotal>=1500 and nTotal<2500    then if liyu_give_item(liyu_tb_tree_award[2]) == 0 then return end -- AddRuntimeStat(46,7,2,1)
    elseif  nTotal>=2500 and nTotal<3500    then if liyu_give_item(liyu_tb_tree_award[3]) == 0 then return end -- AddRuntimeStat(46,7,3,1)
    elseif  nTotal>=3500 and nTotal<7500    then if liyu_give_item(liyu_tb_tree_award[4]) == 0 then return end -- AddRuntimeStat(46,7,4,1)
    elseif  nTotal>=7500 and nTotal<12600   then if liyu_give_item(liyu_tb_tree_award[5]) == 0 then return end -- AddRuntimeStat(46,7,5,1)
    elseif  nTotal>=12600 and nTotal<27000  then if liyu_give_item(liyu_tb_tree_award[6]) == 0 then return end -- AddRuntimeStat(46,7,6,1)
    elseif  nTotal>=27000 and nTotal<34500  then if liyu_give_item(liyu_tb_tree_award[7]) == 0 then return end -- AddRuntimeStat(46,7,7,1)
    elseif  nTotal>=34500 and nTotal<51750  then if liyu_give_item(liyu_tb_tree_award[8]) == 0 then return end -- AddRuntimeStat(46,7,8,1)
    elseif  nTotal>=51750 and nTotal<71250  then if liyu_give_item(liyu_tb_tree_award[9]) == 0 then return end -- AddRuntimeStat(46,7,9,1)
    else                                         if liyu_give_item(liyu_tb_tree_award[10])== 0 then return end -- AddRuntimeStat(46,7,10,1)
    end
    set_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tree,1)
end

function liyu_get_tong_award()
    if liyu_condition_check()~=1 then return end;
    if GetTime()-GetJoinTongTime() < LIYU_TONG_DATE_LIMIT then
        Talk(1,"","Ng­êi vµo bang ch­a ®ñ 7 ngµy kh«ng thÓ tham gia nhËn th­ëng")
        Msg2Player("Ng­êi vµo bang ch­a ®ñ 7 ngµy kh«ng thÓ tham gia nhËn th­ëng")
        return
    end
    if get_task("tskid_sef_score") < LIYU_SEF_SCORE_LIMIT then
        Talk(1,"","Ng­êi cã ®é cèng hiÕn c¸ nh©n kh«ng ®ñ 150 kh«ng thÓ tham gia nhËn th­ëng")
        Msg2Player("Ng­êi cã ®é cèng hiÕn c¸ nh©n kh«ng ®ñ 150 kh«ng thÓ tham gia nhËn th­ëng")
        return
    end
    local szTongName = GetTongName();
    if liyu_local_buf[szTongName] == nil then return end; -- Ò»°ã²»»á³öÏÖÕâÖÖÆæİâÇé¿ö=¡£=
    local bTongAward = get_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tong)
    if bTongAward == 1 then
        Talk(1,"","B¹n ®· nhËn phÇn th­ëng xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang) råi.")
        Msg2Player("B¹n ®· nhËn phÇn th­ëng xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang) råi.")
        return
    end
    local nTotal = liyu_local_buf[szTongName][8]
    if nTotal < 1500 then
        Talk(1,"","Bang cã ®é tr­ëng thµnh C©y Tiªn D­îc d­íi 1500 ®iÓm kh«ng cã phÇn th­ëng xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang).")
        return 
    end
    if  GetSafeName() ~= liyu_local_buf[szTongName][2] and 
        GetSafeName() ~= liyu_local_buf[szTongName][4] and
        GetSafeName() ~= liyu_local_buf[szTongName][6] then
        Talk(1,"",format("B¹n kh«ng ph¶i Top 3 ®é cèng hiÕn cña bang <color=yellow>%s<color>, kh«ng thÓ nhËn th­ëng xÕp h¹ng ®é cèng hiÕn ho¹t ®éng C©y Tiªn D­îc (Bang).",szTongName))
        return
    end
    if      nTotal>=1500 and nTotal<2500   then if liyu_give_item(liyu_tb_tong_award[1]) == 0 then return end -- AddRuntimeStat(46,8,1,1)
    elseif  nTotal>=2500 and nTotal<3500   then if liyu_give_item(liyu_tb_tong_award[2]) == 0 then return end -- AddRuntimeStat(46,8,2,1)
    elseif  nTotal>=3500 and nTotal<7500   then if liyu_give_item(liyu_tb_tong_award[3]) == 0 then return end -- AddRuntimeStat(46,8,3,1)
    elseif  nTotal>=7500 and nTotal<12600  then if liyu_give_item(liyu_tb_tong_award[4]) == 0 then return end -- AddRuntimeStat(46,8,4,1)
    elseif  nTotal>=12600 and nTotal<27000 then if liyu_give_item(liyu_tb_tong_award[5]) == 0 then return end -- AddRuntimeStat(46,8,5,1)
    elseif  nTotal>=27000 and nTotal<34500 then if liyu_give_item(liyu_tb_tong_award[6]) == 0 then return end -- AddRuntimeStat(46,8,6,1)
    elseif  nTotal>=34500 and nTotal<51750 then if liyu_give_item(liyu_tb_tong_award[7]) == 0 then return end -- AddRuntimeStat(46,8,7,1)
    elseif  nTotal>=51750 and nTotal<71250 then if liyu_give_item(liyu_tb_tong_award[8]) == 0 then return end -- AddRuntimeStat(46,8,8,1)
    else                                        if liyu_give_item(liyu_tb_tong_award[9]) == 0 then return end -- AddRuntimeStat(46,8,9,1)
    end
    set_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tong,1)
end


function liyu_tree_detail()
    local szStr1 = "<color=green>1.<color> Ng­êi ch¬i cã thÓ t×m C©y Tiªn D­îc cña bang m×nh ®Ó t­íi n­íc,ng­êi ch¬i ®· vµo bang cã thÓ nhËn Thïng N­íc t¹i C©y Tiªn D­îc bang héi,tiÕn hµnh t­íi n­íc 1 lÇn.Ng­êi ch¬i cã thÓ t­íi n­íc 10 lÇn mçi ngµy.Mçi lÇn t­íi n­íc, ng­êi ch¬i sÏ ®­îc th­ëng Kinh nghiÖm vµ cã tû lÖ nhËn ®­îc Thuèc Gi¶i-ThÊp vµ §«n Hoµng HuyÒn ThiÕt,sÏ gióp C©y Tiªn D­îc cña bang t¨ng 1 ®iÓm ®é tr­ëng thµnh vµ nhËn ®­îc 1 ®iÓm cèng hiÕn ho¹t ®éng."
    local szStr2 = "<color=green>2.<color> Ng­êi ch¬i cã thÓ ®Õn chç §¹i Sø LÔ Héi dïng Thiªn Kiªu LÖnh mua Thuèc Trõ S©u.Ng­êi ch¬i cã thÓ ®Õn chç C©y Tiªn D­îc cña bang ®Ó nép Thuèc Trõ S©u.Mçi lÇn nép Thuèc Trõ S©u, ng­êi ch¬i sÏ ®­îc nhËn th­ëng Kinh nghiÖm,danh väng ChiÕt Xung X· vµ Thuèc Gi¶i -Cao, ®ång thêi gióp C©y Tiªn D­îc t¨ng 5 ®iÓm tr­ëng thµnh vµ nhËn ®­îc 5 ®iÓm cèng hiÕn ho¹t ®éng.Danh väng ChiÕt Xung X· nhËn ®­îc khi nép Thuèc Trõ S©u mçi ngµy tèi ®a 100 ®iÓm."
    local szStr3 = "<color=green>3.<color> Khi ho¹t ®éng kÕt thóc, tïy theo ®é tr­ëng thµnh cña C©y Tiªn D­îc, ng­êi ch¬i cña bang sÏ nhËn ®­îc phÇn th­ëng t­¬ng øng. §é tr­ëng thµnh cña C©y Tiªn D­îc chia lµm: Møc 1: 500 ®iÓm; Møc 2: 1500 ®iÓm; Møc 3: 2500 ®iÓm; Møc 4: 3500 ®iÓm; Møc 5: 7500 ®iÓm; Møc 6: 12600 ®iÓm; Møc 7: 27000 ®iÓm; Møc 8: 34500 ®iÓm; Møc 9: 51750 ®iÓm; Møc 10: 71250 ®iÓm "
    local szStr4 = "<color=green>4.<color> Sau khi ho¹t ®éng kÕt thóc, sÏ xÕp h¹ng ®é cèng hiÕn ho¹t ®éng cña thµnh viªn trong bang.Vµo 00:00 ngµy 1/10 ®Õn 24:00 ngµy 3/10 sÏ c¨n cø thø h¹ng ®Ó ph¸t th­ëng.Tïy theo møc ®é tr­ëng thµnh C©y Tiªn D­îc (Bang)®¹t ®­îc,ng­êi ch¬i sÏ nhËn ®­îc phÇn th­ëng kh¸c nhau."
    --local szStr5 = "<color=green>5.<color> ÏÉÒ©Ê÷³É³¤¶Èµµ´Î»®·ÖÎª£ºµÚÒ»µµ£º1500-2499µã¼ä µÚ¶şµµ£º2500-3499µã¼ä µÚÈıµµ£º3500-7499µã¼ä µÚËÄµµ£º7500-12599µã¼ä µÚÎåµµ£º12600-26999µã¼ä µÚÁùµµ£º27000-34499µã¼ä µÚÆßµµ£º34500-51749µã¼ä  µÚ°Ëµµ£º51750-71249µã¼ä µÚ¾Åµµ£º´óÓÚµÈÓÚ71250µã¡£"
	local szStr6 = "<color=green>5.<color> §iÒu kiÖn nhËn th­ëng: 1. Thµnh viªn vµo bang ch­a ®ñ 7 ngµy kh«ng thÓ nhËn th­ëng. 2. NhËn th­ëng C©y Tiªn D­îc (Bang) yªu cÇu ng­êi ch¬i cã ®é cèng hiÕn ho¹t ®éng ®¹t 150 ®iÓm míi ®­îc nhËn."
	Talk(5,"liyu_handle_talk2yaoxiantree",szStr1,szStr2,szStr3,szStr4,szStr6)
end

function liyu_open_xianyao(szTongName)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if IsTongMember() == 0 then
        Talk(1,"","B¹n ch­a vµo bang, kh«ng thÓ më C©y Tiªn D­îc (Bang).")
        return 
    end;
    local nRight = GetTongDuty();
    if nRight ~= 1 and nRight ~= 2 and nRight ~= 3 then
        Talk(1,"","QuyÒn cña b¹n kh«ng ®ñ ®Ó më C©y Tiªn D­îc (Bang), h·y nhê bang chñ, phã bang chñ hoÆc tr­ëng l·o ®Õn më.")
        return
    end  
    if liyu_local_buf[szTongName] ~= nil then
        Talk(1,"","Bang cña b¹n ®· më C©y Tiªn D­îc, kh«ng cÇn më l¹i.")
        return
    end
    liyu_local_buf[szTongName]={ szTongName,"",0,"",0,"",0,0 };
    liyu_handle_talk2yaoxiantree()
end

function liyu_shovel_cd(nCnt)
    local tItems = GetRoomItems(pos_equiproom)
    for i, item_idx in tItems do
        local nG, nD, nP = GetItemInfoByIndex(item_idx);
        if nG == 2 and nD == 1 and nP == 31158 then
            SetItemUseLapse(item_idx,nCnt*18);
        end
    end
end

function liyu_caiyao_award()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local nRand = random(1,100);
    local bBox = 0;
    local nCnt = 0;
    if     nRand <= 1 then    nCnt = 0; bBox = 1;
    elseif nRand <= 5 then    nCnt = 10;
    elseif nRand <= 20 then   nCnt = 7;
    elseif nRand <= 50 then   nCnt = 5
    else                      nCnt = 3;
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31151,bBox}, "R­¬ng Nguyªn LiÖu Thuèc")
        gf_AddItemEx({2,1,31150,nCnt}, "Nguyªn liÖu thuèc gi¶i")
        return 1;
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
        return 0;
    end
end

function handle_on_use_shovel(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check() ~= 1 then return end
    local pos = get_task("tskid_caiyao_pos");
    local posx = floor(pos/10000);
    local posy = floor(mod(pos,10000));
    local m,x,y = GetWorldPos()
    if m ~= 510 then
        Talk(1,"","XÎng H¸i Thuèc chØ ®­îc dïng ë D­îc V­¬ng §éng")
        return
    end
    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if k<=3 and k>=0 then
        if DelItemByIndex(nIndex,1) == 1 then
            if liyu_caiyao_award()==1 then
                liyu_get_pos_random();
            else
                AddItem(2,1,31158,1)
                return
            end
        else
            error("Lçi dïng XÎng H¸i Thuèc.")
        end
    else
        liyu_shovel_cd(5) -- cd 5s
        Talk(1,"","Cßn c¸ch vŞ trİ nguyªn liÖu <color=yellow>".. floor(k/2).." b­íc<color>!");
    end
end

function handle_on_use_yaocai_box(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check() ~= 1 then return end
    if get_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox) == 1 then
        Talk(1,"","Mçi ngµy mçi ng­êi chØ ®­îc dïng 1 R­¬ng Nguyªn LiÖu Thuèc.")
        return
    end
    set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox,1)
    if DelItem(2,1,31151,1) == 1 then
        if gf_Judge_Room_Weight(1, 0) == 1 then    
            gf_AddItemEx({2,1,31150,30}, "Nguyªn liÖu thuèc gi¶i")
        else
            Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
            set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox,0);
        end
    end
end

function liyu_handle_on_kill_npc(data, para)
    if liyu_check_ms_date() ~= 1 then return end
    if liyu_condition_check(1) ~= 1 then return end
    local nRand = random(1,1000);
    if data[1] == "Thiªn ¢m S¸t Thñ" then
        if nRand <= 800 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31161,1}, "§¬n Thuèc Gi¶i")
            else
                Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ « trèng, kh«ng thÓ nhËn ®­îc ®¹o cô ho¹t ®éng.")
            end
        elseif nRand <=810 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31159,1}, "Ph¸o Tİn HiÖu CÇu Cøu")
                -- AddRuntimeStat(46,3,1,1)
            else
                Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ « trèng, kh«ng thÓ nhËn ®­îc ®¹o cô ho¹t ®éng.")
            end
        end
    elseif data[1] == "Thiªn ¢m Vâ SÜ"or data[1] == "Thiªn ¢m TiÔn Thñ" then
        if nRand <= 30 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31161,1}, "§¬n Thuèc Gi¶i");
            else
                Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ « trèng, kh«ng thÓ nhËn ®­îc ®¹o cô ho¹t ®éng.")
            end
        elseif nRand <=31 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31159,1}, "Ph¸o Tİn HiÖu CÇu Cøu")
                -- AddRuntimeStat(46,3,1,1)
            else
                Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ « trèng, kh«ng thÓ nhËn ®­îc ®¹o cô ho¹t ®éng.")
            end
        end
    end
end

function liyu_check_ms_date()
    local nDate = tonumber(date("%y%m%d"))
    if nDate < LIYU_MISSION_END_DATE then
        return 1;
    end
    return 0;
end

function liyu_condition_check(bFlag)    -- bFlag Îª¿ÕÊ±£¬±íÊ¾×Ô¶¯ÌáĞÑ¡£·ñÔò±íÊ¾½ö×ö·µ»Ø£¬²»ÌáĞÑ¡£
    -- c)90¼¶ÒÔÉÏÑ§Âú55¼¶¼¼ÄÜ
    local nLv = GetLevel();
    local nTrans = gf_GetTransCount();
    local level = nTrans*100 + nLv;
    local res =1;
    if level < 90 then res = 0 end
    if gf_Check55FullSkill() ~= 1 then res = 0 end;
    if res == 0 then
        if bFlag == nil then
            Talk(1,"","CÊp 90 trë lªn vµ häc ®ñ kü n¨ng cÊp 55 míi ®­îc tham gia ho¹t ®éng nµy.")
        end
    end
    return res;
end

function liyu_handle_talk2jieridashi()
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local szTitle = format("%s, sau cuéc chiÕn Trôy Long S¬n, ®¹i qu©n Thiªn ¢m Gi¸o ®¹i b¹i, rót khái Trung Nguyªn, nh­ng vÉn cßn mét sè phÇn tö Thiªn ¢m Gi¸o lÈn trèn muèn tiÕp tôc ph¸ ho¹i sù b×nh yªn cña Trung Nguyªn. TÕt Trung Thu ®ang ®Õn gÇn, bän Thiªn ¢m Gi¸o nµy ®· chiÕm lÜnh Thanh Khª §éng, cßn ®Şnh dïng thuèc biÕn C¸ ChĞp ë ®ã thµnh Qu¸i C¸ tÊn c«ng th«n d©n, ph¸ ho¹i h×nh t­îng tèt ®Ñp cña C¸ ChĞp trong lßng mäi ng­êi",
    liyu_szNpcName
    )
    local tSay = {}

    tinsert(tSay,"Xem ho¹t ®éng 1/liyu_check_act1")
    tinsert(tSay,"Xem ho¹t ®éng 2/liyu_check_act2")
    if liyu_condition_check(1) == 1 then 
        tinsert(tSay,"ChÕ Thuèc Gi¶i/liyu_make_med")
        tinsert(tSay,"NhiÖm vô tİch lòy online h»ng ngµy/liyu_daily_task")
        tinsert(tSay,"NhËn 5 XÎng H¸i Thuèc/liyu_get_shovel")
        tinsert(tSay,"Mua Ph¸o Tİn HiÖu CÇu Cøu/liyu_buy_flares")
        tinsert(tSay,"Dïng 1 Thiªn Cang LÖnh mua Ph¸o Tİn HiÖu CÇu Cøu/liyu_buy_flares_with_tiangang")
        tinsert(tSay,"Mua Thuèc Trõ S©u/liyu_buy_insecticide")
        tinsert(tSay,"Dïng 1 Thiªn M«n Kim LÖnh mua Thuèc Trõ S©u/liyu_buy_insecticide_with_tianmen")
        tinsert(tSay,"Dïng M¶nh ®æi Hép Ngo¹i Trang Hång Phong/liyu_get_chinese_box")
        tinsert(tSay,"Sö dông ®iÓm tİch ho¹t ®éng ®æi Thuèc Gi¶i-Cao/liyu_buy_med_by_bossscore_talk")
        -- tinsert(tSay,"Test init/init")
        -- tinsert(tSay,"_refresh_caiyaonpc init/_refresh_caiyaonpc")
        -- tinsert(tSay,"liyu_writeFile/liyu_writeFile")
        -- tinsert(tSay,"add()/add_score")
    else
        szTitle = szTitle.."<color=red>CÊp 90 trë lªn vµ häc ®ñ kü n¨ng cÊp 55 míi ®­îc tham gia ho¹t ®éng nµy.<color>"
    end
    tinsert(tSay,"Rêi khái/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_buy_med_by_bossscore_talk()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check()~=1 then return end;
    local nScore = get_task("tskid_bossscore")
    local szTitle = format("§iÓm tİch ho¹t ®éng hiÖn t¹i cña b¹n lµ: %d ®iÓm\n<color=red>l­u ı: ®æi 1 Thuèc Gi¶i-Cao sÏ tiªu hao 20 ®iÓm tİch ho¹t ®éng<color>",nScore)
    local tbSay = {}
    tinsert(tbSay,format("®æi Thuèc Gi¶i-Cao/#liyu_buy_med_by_bossscore(%d)",nScore))
    tinsert(tbSay,"Rêi khái/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function liyu_buy_med_by_bossscore(nScore)
    local nCnt = floor( nScore/LIYU_BOSSSOCRE_PER_MED );
    if nCnt > 1000 then  nCnt = 1000 end
    AskClientForNumber("liyu_buy_med_by_bossscoreCB", 0, nCnt, "CÇn ®æi bao nhiªu c¸i?");
end 

function liyu_buy_med_by_bossscoreCB(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if nNum == 0 then return end;
    local nScore = get_task("tskid_bossscore")
    if nScore < nNum * LIYU_BOSSSOCRE_PER_MED then
        WriteLog("liyu_buy_med_by_bossscoreCB error")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return 
    end
    gf_AddItemEx({2,1,31154,nNum}, "Thuèc Gi¶i-Cao") --½âÒ©¸ÄÎª¶Ò»»ĞÎÊ½·¢·Å
    -- AddRuntimeStat(46,1,3,nNum)
    set_task("tskid_bossscore",nScore-nNum * LIYU_BOSSSOCRE_PER_MED)
end

function liyu_get_chinese_box()
    if gf_Judge_Room_Weight(1, 0) == 1 then
        if DelItem(2,1,31164,100)==1 then
            gf_AddItemEx({2,1,31163,1}, "Hép Ngo¹i Trang Hång Phong")
        else
            Talk(1,"","M¶nh Bé Ngo¹i Trang Hång Phong kh«ng ®ñ 100, kh«ng thÓ ®æi")
            return 
        end
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return
    end
end

function liyu_use_chinese_piece()
    local nCnt = GetItemCount(2,1,31164)
    AskClientForNumber("liyu_use_chinese_pieceCB", 0, nCnt, "CÇn dïng bao nhiªu?");
end
function liyu_use_chinese_pieceCB(nNum)
    if DelItem(2,1,31164,nNum) then
        ornament_add_score(nNum*LIYU_POWER_OF_PIECE)
        Msg2Player(format("NhËn ®­îc %d ®iÓm Phong Hoa!",nNum*LIYU_POWER_OF_PIECE))
    else
        Talk(1,"","Sö dông thÊt b¹i")
    end
end


function liyu_check_act1()
    local szTitle = format("%s gÇn ®©y Thanh Khª §éng bŞ bän tµn d­ cña Thiªn ¢m Gi¸o chiÕm lÜnh, chóng ®Şnh dïng thuèc lµm C¸ ChĞp ë ®ã biÕn thµnh Qu¸i C¸ tÊn c«ng th«n d©n, ph¸ ho¹i h×nh t­îng tèt ®Ñp cña C¸ ChĞp trong lßng mäi ng­êi. Vâ L©m Minh ph¸t hiÖn ®­îc ©m m­u cña chóng, b¸o víi Sø Gi¶ LÔ Héi hiÖu triÖu c¸c hiÖp kh¸ch ®Õn tiªu diÖt chóng, tham gia ho¹t ®éng t×m thuèc gi¶i sÏ nhËn ®­îc phÇn th­ëng phong phó. <color=red>C¸c hiÖp kh¸ch ®Õn Thanh Khª §éng tiªu diÖt Thiªn ¢m Vâ SÜ, Thiªn ¢m TiÔn Thñ vµ Thiªn ¢m S¸t Thñ sÏ nhËn ®­îc §¬n Thuèc Gi¶i. Sö dông Ph¸o Tİn HiÖu CÇu Cøu vµ tiªu diÖt Thiªn ¢m §¹i §Çu Môc cã thÓ nhËn ®­îc ®iÓm tİch ho¹t ®éng, sö dông ®iÓm tİch ho¹t ®éng cã thÓ ®æi Thuèc Gi¶i-Cao t¹i ho¹t ®éng ®¹i sø.<color>Bang chñ, phã bang chñ hoÆc tr­ëng l·o cña bang cßn cã thÓ ®Õn Thµnh §« më C©y Tiªn D­îc (Bang) ®Ó thµnh viªn bang nhËn ®­îc Thuèc Gi¶i.",liyu_szNpcName)
    local tSay = {}
    tinsert(tSay,"VÒ trang tr­íc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l¹i sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_check_act2()
    local szSex = "HiÖp sÜ" if GetSex()==2 then szSex = "N÷ hiÖp " end
    local szTitle = format("%s, gÇn ®©y Thanh Khª §éng bŞ bän tµn d­ cña Thiªn ¢m Gi¸o chiÕm lÜnh, chóng ®Şnh dïng thuèc lµm C¸ ChĞp ë ®ã biÕn thµnh Qu¸i C¸ tÊn c«ng th«n d©n. Sø Gi¶ LÔ Héi hiÖu triÖu c¸c hiÖp kh¸ch dïng Thuèc Gi¶i trong tay gi¶i cøu Qu¸i C¸ ChĞp bŞ Thiªn ¢m Gi¸o ®iÒu khiÓn. %s cã thÓ ®Õn <color=green>Long TuyÒn Th«n {176,183}<color> gi¶i cøu Qu¸i C¸ ChĞp Hå §å. Nép Thuèc Gi¶i-ThÊp vµ Thuèc Gi¶i-Trung sÏ nhËn ®­îc R­¬ng LÔ Héi-Th­êng, nép Thuèc Gi¶i-Cao sÏ nhËn ®­îc R­¬ng LÔ Héi-Cao, nép Thuèc Gi¶i §Æc BiÖt sÏ nhËn ®­îc R­¬ng LÔ Héi-Hµo Hoa.",liyu_szNpcName,szSex)
    local tSay = {}
    tinsert(tSay,"VÒ trang tr­íc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l¹i sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end
function liyu_make_med()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local szSex = "HiÖp sÜ" if GetSex()==2 then szSex = "N÷ hiÖp " end
    local szTitle = "ChÕ Thuèc Gi¶i"
    local tSay = {}
    tinsert(tSay,"Nép 1 §¬n Thuèc Gi¶i vµ 1 Nguyªn liÖu thuèc gi¶i/#liyu_handin_med(1)")
    tinsert(tSay,"Nép 1 §¬n Thuèc Gi¶i vµ 2 Nguyªn liÖu thuèc gi¶i/#liyu_handin_med(2)")
    tinsert(tSay,"Nép 1 §¬n Thuèc Gi¶i vµ 3 Nguyªn liÖu thuèc gi¶i/#liyu_handin_med(3)")
    tinsert(tSay,"VÒ trang tr­íc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l¹i sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end
function liyu_handin_med( nCnt )
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    -- ÖÆ×÷½âÒ©
    if DelItem(2,1,31161,1) ~= 1 then
        Talk(1,"","B¹n kh«ng cã §¬n Thuèc Gi¶i, kh«ng thÓ chÕ thuèc gi¶i.")
        return
    end
    if DelItem(2,1,31150,nCnt) ~= 1 then
        Talk(1,"","Nguyªn liÖu kh«ng ®ñ, chÕ thuèc gi¶i thÊt b¹i.")
        AddItem(2,1,31161,1)
        return
    end

    if gf_Judge_Room_Weight(1, 0) == 1 then
        local nRand = random(1,100)
        if nCnt == 1 then
            if nRand <=50 then
                gf_AddItemEx({2,1,31152,1}, "Thuèc Gi¶i-ThÊp")
                -- AddRuntimeStat(46,1,1,1)
            else
                Talk(1,"","ChÕ thuèc gi¶i thÊt b¹i")
                Msg2Player("ChÕ thuèc gi¶i thÊt b¹i")
                return
            end
        elseif nCnt == 2 then
            gf_AddItemEx({2,1,31152,1}, "Thuèc Gi¶i-ThÊp")
            -- AddRuntimeStat(46,1,1,1)
        else 
            gf_AddItemEx({2,1,31153,1}, "Thuèc Gi¶i-Trung")
            -- AddRuntimeStat(46,1,2,1)
        end
    else
        AddItem(2,1,31161,1)
        AddItem(2,1,31150,nCnt)
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
    end

end

function liyu_daily_task()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local szSex = "HiÖp sÜ" if GetSex()==2 then szSex = "N÷ hiÖp " end
    local szTitle = ""
    local tSay = {}

    local nEndTime = get_task("tskid_daily_end_time")
    local nCurTime = GetTime();
    local nRes     = nEndTime - nCurTime;
    if nEndTime == 0 then
        szTitle = format("%s, tr­íc tiªn h·y më nhiÖm vô online ngµy.",liyu_szNpcName)
        tinsert(tSay,"B¾t ®Çu ®Õm giê online/liyu_start_daily_task")
    elseif nEndTime == -1 then
        szTitle = format("%s, h«m nay b¹n ®· hoµn thµnh nhiÖm vô online ngµy, ngµy mai h·y quay l¹i.",liyu_szNpcName)
    elseif nRes <= 0 then
        szTitle = format("%s, ®· hoµn thµnh nhiÖm vô online ngµy, cã thÓ nhËn th­ëng.",liyu_szNpcName)
        tinsert(tSay,"NhËn lÊy phÇn th­ëng./liyu_give_daily_award")
    else
        local nHour = floor( nRes/3600 )
        local nMin  = floor((nRes - nHour*3600)/60)
        szTitle = format("%s, ®Ó hoµn thµnh nhiÖm vô cÇn online thªm %d giê %d phót.",liyu_szNpcName,nHour,nMin)
        if nRes < 60 then
            szTitle = format("%s, ®Ó hoµn thµnh nhiÖm vô cÇn online thªm <1 phót.",liyu_szNpcName)
        end
    end
    tinsert(tSay,"VÒ trang tr­íc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Rêi khái/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_start_daily_task()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    local nEndTime = get_task("tskid_daily_end_time")
    if nEndTime ~= 0 then
        Talk(1,"liyu_daily_task","B¹n ®· më nhiÖm vô online ngµy, kh«ng thÓ më l¹i")
        return 0;
    end
    local nCurTime = GetTime()
    set_task("tskid_daily_end_time",nCurTime+LIYU_ONLINE_TIME);
    Talk(1,"liyu_daily_task","B¹n ®· më nhiÖm vô online ngµy.")
end

function liyu_give_daily_award()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if gf_Judge_Room_Weight(1, 0) == 1 then
        set_task("tskid_daily_end_time",-1)
        gf_AddItemEx({2,1,31153,2}, "Thuèc Gi¶i-Trung")
        -- AddRuntimeStat(46,1,2,2)
        -- AddRuntimeStat(46,9,1,1)
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
    end
end

function liyu_get_pos_random()
    local nRand = random( 1,getn(liyu_caiyao) );
    set_task("tskid_caiyao_pos",liyu_caiyao[nRand][1]*10000+liyu_caiyao[nRand][2]);
end

function liyu_get_shovel()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check()~=1 then return end;
    if get_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.shovel) == 1 then
        Talk(1,"liyu_handle_talk2jieridashi","Mçi ngµy mçi ng­êi chØ ®­îc nhËn xÎng 1 lÇn.")
        return
    end
    if gf_Judge_Room_Weight(1, 0) == 1 then
        set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.shovel,1)    
        gf_AddItemEx({2,1,31158,5}, "XÎng H¸i Thuèc")
        liyu_get_pos_random();
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
    end
end

function liyu_buy_flares()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,97,236,1) ~= 1 then
        Talk(1,"","B¹n kh«ng cã ®ñ Thiªn Kiªu LÖnh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31159,1}, "Ph¸o Tİn HiÖu CÇu Cøu")
        -- AddRuntimeStat(46,3,1,1)
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        AddItem(2,97,236,1)
    end
end
function liyu_buy_flares_with_tiangang()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,95,204,1) ~= 1 then
        Talk(1,"","B¹n kh«ng cã ®ñ Thiªn Cang LÖnh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31159,40}, "Ph¸o Tİn HiÖu CÇu Cøu")
        -- AddRuntimeStat(46,3,1,40)
        -- AddRuntimeStat(46,5,1,1)
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        AddItem(2,95,204,1)
    end
end

function liyu_buy_insecticide()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,97,236,1) ~= 1 then
        Talk(1,"","B¹n kh«ng cã ®ñ Thiªn Kiªu LÖnh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31160,1}, "Thuèc Trõ S©u")
        -- AddRuntimeStat(46,4,1,1)
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        AddItem(2,97,236,1)
    end
end
function liyu_buy_insecticide_with_tianmen()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho¹t ®éng ®· kÕt thóc") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,1,30370,1) ~= 1 then
        Talk(1,"","B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31160,40}, "Thuèc Trõ S©u")
        -- AddRuntimeStat(46,4,1,40)
        -- AddRuntimeStat(46,6,1,1)
    else
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        AddItem(2,1,30370,1)
    end
end

function on_event_server_start()
    liyu_readFile()
    for i=1,getn(liyu_main_npc) do
        CreateNpc(liyu_main_npc[i][1],liyu_main_npc[i][2],liyu_main_npc[i][3],liyu_main_npc[i][4],liyu_main_npc[i][5]);
    end
    CreateNpc(liyu_xianyaotree_npc.template,liyu_xianyaotree_npc.name,liyu_xianyaotree_npc.pos[1],liyu_xianyaotree_npc.pos[2],liyu_xianyaotree_npc.pos[3]);
end
--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
--t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
--    {id={"id_score", 1,}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
-- function on_event_player_login(nExchangeComing) end
-- function on_event_daily_clear(nCurDate, nLastDate) end
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end
--function on_event_player_logout() end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí
----------------------------------------------------------------
--                         Debug                              --
----------------------------------------------------------------
-- function init()
--     set_task("tskid_daily_end_time",0)
--     set_task("tskid_once_dc",0)
--     set_task("tskid_getaward",0)
--     set_task("tskid_watering",0)
-- end

-- function test_add_score()
--     local szTongName = GetTongName();
--     if liyu_local_buf[szTongName] == nil then return end
--     liyu_local_buf[szTongName][8] = liyu_local_buf[szTongName][8] + 10000
-- end
-- function add_score()
--     set_task("tskid_bossscore",1000);
-- end
---------------------------------------SDB-------------------------------------------
-- SDBÒÑ·ÏÆú²»ÓÃ£¬ÏÖÔÚ²ÉÓÃÎÄ¼şĞÎÊ½±£´æÊı¾İ¡£
-- LIYU_SDBKEY = "liyuchallenge"
-- -- File_name   = "\\script\\isolate\\online_activites\\liyu_challenge\\liyu_sdb.lua"
-- function liyu_readFile()()
--     local sdb = SDB(LIYU_SDBKEY, 0, 0);
-- 	sdb:apply2(liyu_readFile()_cb)
-- end
-- function liyu_readFile()_cb(nCount, data)
--     liyu_local_buf = {};
--     local tTemp = {}
--     for i = 1, nCount do
--         local tTmp = data["head"..i]
--         tTemp = {tTmp[1],tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7],tTmp[8]};
--         liyu_local_buf[tTmp[1]] = tTemp;
--     end
-- end

-- function liyu_writeFile()
--     local sdb = SDB(LIYU_SDBKEY, 0, 0);
--     sdb:delete()
--     local sdb = SDB(LIYU_SDBKEY, 0, 0);
--     local i = 1;
--     for key,var in liyu_local_buf do
--         local tTmp = var
--         local id = "head"..i;
--         sdb[id] = {"ssdsdsdd", tTmp[1],tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7],tTmp[8]};
--         i = i + 1;
--     end
-- end

---------------------------------------SDB-------------------------------------------