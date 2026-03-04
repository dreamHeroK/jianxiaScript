--begin-------------------------------------------------------------------------°Ñcdkey±ä³ÉÒ»¸öisolate
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\ksgvn\\lib.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority = 1, --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName = "cdkey",
    szViewName = "Chu T­íc LÖnh " .. EVENT_CODE_PERIOD,
    nTalkBeginDate = EVENT_CODE_TALK_BEGIN_DATE,
    nBeginDate = EVENT_CODE_BEGIN_DATE,
    nEndDate = EVENT_CODE_END_DATE,
    nTaskGroup = 9, --!!!ĞŞ¸Äcdk»î¶¯µÄnTaskGroup±ØĞë¸üĞÂ»î¶¯½çÃæÅäÖÃ
    nTaskGroupVersion = 35,
}

g_ckDebug = 0 --show debug info? 1:yes 0:no 

function _handler_event_cost_ib(data, para)
    local nItemPackId, nNum = unpack(data)
    _ck_SetCostIB(nNum)
end

function ck_DebugPrint(szStr, tTable)
    if g_ckDebug ~= 1 then
        return
    end
    if szStr then
        print("\n" .. szStr)
    end
    if tTable then
        gf_PrintTable(tTable)
    end
end

function ck_FinishTask(tEvent, data, para)
    ck_DebugPrint("tEvent = ", tEvent)
    ck_DebugPrint("data = ", data)
    if mg_CheckDate() ~= 1 then
        return
    end

    ck_DebugPrint(format("\n===== ck_FinishTask() nTaskIndex=%d =====", tEvent[4][1]))
    ck_global_set_task_finish(tEvent[4][1])
end

--ĞÂ¼ÓµÄcdkeyÈÎÎñÍê³ÉÂß¼­ÓÃÊÂ¼şÊµÏÖ
--¾ÉµÄÈÎÎñÍê³ÉÂß¼­·ÖÉ¢ÔÚÈ«ÊÀ½ç£¬¿ÉÒÔÖğ²½×ªÒÆ³ÉĞÂÊµÏÖ
t_isolate_user_batch_watch_list = {
    { "event_mission_task_award", { "planttree", "bigtreeprize", -1 }, ck_FinishTask, { 1309, "Trång vµ thu ho¹ch 1 C©y B¸t Nh· Lín" }, },
    { "event_mission_award", { "newbattle", -1, -1, 4 }, ck_FinishTask, { 1310, "NhËn th­ëng chiÕn tr­êng Nh¹n M«n LiÖt Háa" }, },
    { "event_mission_award", { "ziyuanzhan", -1, -1, -1 }, ck_FinishTask, { 1311, "Tham gia Tèng Liªu Tµi Nguyªn ChiÕn vµ nhËn th­ëng 1 lÇn" }, },
    { "event_mission_award", { "ziyuanzhan", -1, -1, -1 }, ck_FinishTask, { 2216, "Tham gia Tèng Liªu Tµi Nguyªn ChiÕn vµ nhËn th­ëng 1 lÇn" }, },
}

function on_add_watches()
    isolate_watch_npc_talk("§¹i Sø ho¹t ®éng", 100, "handle_npc_talk_huodongdashi")
    isolate_watch_npc_talk("§¹i Sø ho¹t ®éng", 200, "handle_npc_talk_huodongdashi")
    isolate_watch_npc_talk("§¹i Sø ho¹t ®éng", 300, "handle_npc_talk_huodongdashi")
    isolate_watch_event("event_ib_cost", "_handler_event_cost_ib", PackItemId(2, 97, 236))--Ìì½¾ÁîÏû·Ñ¼ÆÊı
end

function on_init_ok()
    --!!!!!!±äÁ¿±ä¸üÎñ±ØÁôÒâ¸üĞÂÍ¨ÓÃÌõ¼ş¼ì²âÅäÖÃactivity_interface_condition.txt
    CK_TASK_GROUP = AcivityBase.TaskGroup
    CK_TASK_GROUP.Task1 = 1 --1,2,3Î»·Ö±ğ±íÊ¾ÎäÁÖĞÂĞã£¬ÀÏÕ½ÓÑ£¬»îÔ¾×Å,4-11Î»ÓÂÍùÖ±Ç°ÈÎÎñ£¬°ÙÕ½É±¹ÖÈÎÎñ12-16¼ÇÂ¼,17-21Íê³É,°ÙÕ½¸±±¾ÈÎÎñ22-26¼ÇÂ¼£¬27-31½ÓÈ¡
    CK_TASK_GROUP.Task2 = 2 --(ĞÂ)ÓÃÓÚÖØĞÂ×éÖ¯Êı¾İºóµÄ°ÙÕ½ÈÎÎñ1~31 --(¾É)°ÙÕ½¸±±¾ÈÎÎñ1-5¿É½»£¬6-10Íê³É£¬--°ÙÕ½PVPÈÎÎñ11-17¼ÇÂ¼£¬18-24½ÓÈ¡£¬25-31¿É½»
    CK_TASK_GROUP.Task3 = 3 --(ĞÂ)ÓÃÓÚÖØĞÂ×éÖ¯Êı¾İºóµÄ°ÙÕ½ÈÎÎñ1~7  --(¾É)°ÙÕ½PVPÈÎÎñ1-7Íê³É,8-10É±¹Ö¼Ó³É£¬11-13¸±±¾¼Ó³É£¬14-16pvp¼Ó³É, 17+ÊÇËÙÕ½ËÙ¾öÈÎÎñ
    CK_TASK_GROUP.Task4 = 4 --ÈÎÎñ±ê¼Ç
    CK_TASK_GROUP.Task5 = 5 --´ó¸»ÎÌÏû·ÑÈÎÎñ¼ÆÊı
    CK_TASK_GROUP.Score = 6 --»îÔ¾¶È
    CK_TASK_GROUP.Award = 7 --°´Î»±ê¼Ç½±Àø
    isolate_enable_event_dispatch(-1) --´ò¿ªtalk-dateµÄevent dispatch¿ª¹Ø
end
--»î¶¯ÊÇ·ñ¿ªÆô
function ck_IsOpen()
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        return 1
    end
    return isolate_in_talk_date(nil, 0);
    --return gf_CheckDuration(CK_START_TIME, CK_END_TIME);
end
function ck_CanAct()
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        return 1
    end
    return isolate_in_talk_date(nil, 1)
    --return gf_CheckDuration(CK_START_TIME, CK_START_ACT);
end

--¼¤»î³ÆºÅ
function ck_ActTilte()
    local tSay = {
        "Vâ L©m T©n Tó/ck_ActTilte_1",
        --		"ÀÏÕ½ÓÑ/ck_ActTilte_2",
        "Ng­êi N¨ng §éng/ck_ActTilte_3",
        "\nT«i chØ xem xem th«i/nothing",
    }
    local _start, _end_act, _end = isolate_get_dates()
    local msg = format("Thêi gian ng­ng kİch ho¹t %s", isolate_get_str_date(_end_act));
    --local msg = format("¼¤»î½ØÖ¹ÈÕÆÚÎª%d/%d/%d", CK_START_ACT[3], CK_START_ACT[2], CK_START_ACT[1]);
    Say(CK_NPC_NAME .. format("%s muèn kİch ho¹t danh hiÖu nµo?<color=red>%s<color>", gf_GetPlayerSexName(), msg), getn(tSay), tSay);
end

--»î¶¯´óÊ¹npc»á»°
function handle_npc_talk_huodongdashi(nNpcIndex)
    local szTitle = format("%s %s", CK_NPC_NAME, "H·y nhanh chãng mêi b¹n bÌ ®Õn cïng ch¬i trß ch¬i nµo! B¹n bÌ cµng nhiÒu th× sÏ cã thªm nhiÒu niÒm vui!")

    local tSay = {
        "Giíi thiÖu ho¹t ®éng/ck_ActInfo",
        "Kİch ho¹t danh hiÖu/ck_ActTilte",
        "TiÕn Tíi/ck_TaskForward",
        format("%s/#ck_task_group_talk1(1)", "NhiÖm vô hµng ngµy"), --"°ÙÕ½²»´ùÈÎÎñ/ck_BaiZhanBuDai",
        format("%s/#ck_task_group_talk1(2)", "NhiÖm vô tr­ëng thµnh"), --"ËÙÕ½ËÙ¾öÈÎÎñ/ck_FastTask",
        "NhiÖm vô §¹i Phó ¤ng/ck_ZiloTask",
        "Xem ®iÓm n¨ng ®éng/ck_QueryScore",
        "Xem thiªn kiªu lÖnh ®· dïng/cdk_QueryUseTianJiaoLingNum",
        "§iÓm n¨ng ®éng ®æi phÇn th­ëng/ck_ScoreAward",
        format("\n%s/nothing", "KÕt thóc ®èi tho¹i"),
    }
    Say(szTitle, getn(tSay), tSay)
end

function on_event_daily_clear(nCurDate, nLastDate)
    ck_DailyReset()
end

function checkUiDate()
    local nDate = gf_TodayDate()
    if nDate >= t_isolate_base_cfg.nTalkBeginDate and nDate <= t_isolate_base_cfg.nEndDate then
        return 1
    end
    return 0
end

function on_event_player_login(nExchangeComing)
    if checkUiDate() == 1 then
        SendShowCDkeyIcon()
    end

    if ck_GetTitleType() == 0 then
        isolate_disable_event_dispatch(PlayerIndex) --¹ØµôÃ»ÓĞ¼¤»îCDKeyÍæ¼ÒµÄËùÓĞevent dispatch
    end

    ck_get_random_task()
end
--end-------------------------------------------------------------------------°Ñcdkey±ä³ÉÒ»¸öisolate


Include("\\script\\function\\cdkey\\ck_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")

CK_NPC_NAME = "<color=green> §¹i Sø ho¹t ®éng: <color>";

function cdk_QueryUseTianJiaoLingNum()
    Say(CK_NPC_NAME .. format("Tæng sè Thiªn Kiªu LÖnh %s ®· sö dông lµ: <color=gold>%d<color> c¸i.", gf_GetPlayerSexName(), ck_GetCostIB()), 0);
end

--»î¶¯½çÃæÁì½±µ÷ÓÃ
function ck_GetTaskAwardByUI(nTaskIndex)
    if checkUiDate() ~= 1 then
        Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n")
        return 0;
    end

    local nRet = 0;
    if not nTaskIndex or nTaskIndex <= 0 then
        return 0;
    end

    if CK_SCROE_AWARD_TABLE[nTaskIndex - CK_TASK_INDEX_BEGIN_SCORE_AWARD + 1] then
        nRet = ck_get_score_award(nTaskIndex - CK_TASK_INDEX_BEGIN_SCORE_AWARD + 1)

    elseif CK_TASK_IB_COST[nTaskIndex - CK_TASK_INDEX_BEGIN_IB + 1] then
        nRet = ck_GetIBTaskAward(nTaskIndex - CK_TASK_INDEX_BEGIN_IB + 1)

    elseif CK_TASK_ZILON_ATRR[nTaskIndex - CK_TASK_INDEX_BEGIN_ZILON + 1] then
        nRet = ck_GetZiloTaskAward(nTaskIndex - CK_TASK_INDEX_BEGIN_ZILON + 1)

    elseif T_CK_TASK_LIST[nTaskIndex] then
        nRet = _ck_task_award(nTaskIndex);

    else
        nRet = 0;
    end

    return nRet or 0;
end

--Ã¿ÈÕÇåÀí
function ck_DailyReset()
    if gDebug:is_debug() ~= 1 then
        --µ÷ÊÔÄ£Ê½
        if ck_IsOpen() ~= 1 then
            return 0;
        end
        if ck_GetTitleType() == 0 then
            return 0;
        end
    end

    --ÖØÖÃ°ÙÕ½²»´ùÈÎÎñ
    for i = 12, 31 do
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
    end
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0);
    for i = 1, 16 do
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
    end
    --É¾³ı°ÙÕ½²»´ùµÄÈÎÎñ
    for i = 234, 238 do
        DirectDeleteTask(i)
    end
    ck_task_daily_clear()
end

--»ñµÃµ±ÌìË÷Òı
function ck_GetRandIndex(nMax)
    local today = Date();
    local wDay = today:week();
    if wDay == 0 then
        wDay = 7
    end
    return mod(wDay, nMax) + 1;
end

--»ñÈ¡ÀàĞÍ
function ck_GetTitleType()
    if IsTitleExist(68, 1) == 1 then
        return 1;
    end

    if IsTitleExist(68, 2) == 1 then
        return 2;
    end

    if IsTitleExist(68, 3) == 1 then
        return 3;
    end

    return 0;
end

--»ñµÃ¹±Ï×¶È
function ck_GetCkScore()
    return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

--Ôö¼Ó»ı·Ö
function ck_AddCkScore(nAdd)
    if not nAdd or nAdd < 0 then
        return 0;
    end
    if CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) <= 0 then
        -- µÚÒ»´ÎÔö¼Ó»ı·Ö£¬ÈÏÎªÍæ¼Ò²ÎÓëÁËcdkey
        AddRuntimeStat(80, 1, 0, 1)
    end
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
    Msg2Player(format("§iÓm n¨ng ®éng t¨ng %d, tæng ®iÓm lµ %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

--»î¶¯½éÉÜ
function ck_ActInfo(nIndex)
    local strTitle = {
        "Trong thêi gian ho¹t ®éng, ng­êi ch¬i sÏ nhËn ®­îc danh hiÖu phï hîp víi ®iÒu kiÖn cña b¶n th©n. TÊt c¶ danh hiÖu ®Òu cã hiÖu lùc lµ 2 th¸ng, vµ khi nh©n vËt th¾p s¸ng danh hiÖu th× kh¸ng tÊt c¶ sÏ t¨ng 10 ®iÓm. Ng­êi ch¬i ph¶i kİch ho¹t danh hiÖu míi cã thÓ nhËn nhiÖm vô. NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng, mçi ngµy chØ ®­îc lµm 1 lÇn. NhiÖm vô Tèc ChiÕn Tèc Th¾ng vµ §¹i Phó ¤ng th× trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn. NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng cã thÓ hoµn thµnh theo c¸ nh©n vµ tæ ®éi, nÕu tæ ®éi th× phÇn th­ëng sÏ cao h¬n. Hoµn thµnh c¸c môc nhiÖm vô sÏ nhËn ®­îc ®iÓm kinh nghiÖm vµ ®é n¨ng ®éng. Tİch lòy ®é n¨ng ®éng cã thÓ ®æi phÇn th­ëng phong phó.",
        "Ng­êi n¨ng ®éng tæ ®éi tham gia nhiÖm vô Tr¨m TrËn Tr¨m Th¾ng cã x¸c suÊt cao nhÊt nhËn ®­îc phÇn th­ëng cao.", --ºÍÀÏÕ½ÓÑ
        "NhiÖm vô Dòng C¶m TiÕn Tíi chØ xuÊt hiÖn t¹i server míi,trong server míi ng­êi ch¬i cÊp 10 vµ ®· kİch ho¹t danh hiÖu Vâ L©m T©n Tó míi ®­îc nhËn nhiÖm vô.Hoµn thµnh xong nhiÖm vô nµy vµ ®¹t ®Õn cÊp 90, gamer Vâ L©m T©n Tó míi ®­îc tiÕp nhËn nhiÖm vô Tr¨m TrËn Tr¨m Th¾ng,Tèc ChiÕn Tèc Th¾ng vµ §¹i Phó ¤ng.",
    }
    local tbSay = {};
    nIndex = nIndex or 1;
    local Msg = strTitle[nIndex];
    if Msg then
        tbSay.msg = CK_NPC_NAME .. Msg;
        tbSay.sel = {
            { "\n rót lui", "nothing" },
        };
        if strTitle[nIndex + 1] then
            tinsert(tbSay.sel, 1, { "Trang kÕ", format("#ck_ActInfo(%d)", nIndex + 1) })
        end
        temp_Talk(tbSay);
    end
end

function ck_ActTilte_1()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Thêi gian kİch ho¹t ®· kÕt thóc,kh«ng thÓ kİch ho¹t danh hiÖu n÷a", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(1), GetExtPoint(2))
    if GetExtPoint(1) ~= 1 and GetExtPoint(2) ~= 1 then
        if CK_ES_SWITCH == 0 then
            Say(CK_NPC_NAME .. "M¸y chñ nµy t¹m thêi kh«ng më nhËn danh hiÖu <color=gold>Vâ L©m T©n Tó<color>!", 0);
            --return 0;
        end
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
        PayExtPoint(1, 1);
        AddTitle(68, 1);
        SetTitleTime(68, 1, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Vâ L©m T©n Tó"))
        Say(CK_NPC_NAME .. format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Vâ L©m T©n Tó"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
        isolate_enable_event_dispatch(PlayerIndex) --´ò¿ª¸ÃÍæ¼ÒµÄËùÓĞevent dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_ActTilte_2()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Thêi gian kİch ho¹t ®· kÕt thóc,kh«ng thÓ kİch ho¹t danh hiÖu n÷a", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(3), GetExtPoint(4))
    if GetExtPoint(3) == 1 and GetExtPoint(4) ~= 1 then
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 2, 1);
        PayExtPoint(3, 1);
        AddTitle(68, 2);
        SetTitleTime(68, 2, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "L·o ChiÕn H÷u"))
        Say(CK_NPC_NAME .. format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "L·o ChiÕn H÷u"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 2)");
        isolate_enable_event_dispatch(PlayerIndex) --´ò¿ª¸ÃÍæ¼ÒµÄËùÓĞevent dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_ActTilte_3()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Thêi gian kİch ho¹t ®· kÕt thóc,kh«ng thÓ kİch ho¹t danh hiÖu n÷a", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(5), GetExtPoint(6))
    if GetExtPoint(5) == 1 and GetExtPoint(6) ~= 1 then
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 3, 1);
        PayExtPoint(5, 1);
        AddTitle(68, 3);
        SetTitleTime(68, 3, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Ng­êi N¨ng §éng"))
        Say(CK_NPC_NAME .. format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Ng­êi N¨ng §éng"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 3)");
        isolate_enable_event_dispatch(PlayerIndex) --´ò¿ª¸ÃÍæ¼ÒµÄËùÓĞevent dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_TaskForward_finish()
    local nRebornLv = gf_GetPlayerRebornCount()
    local nLevel = nRebornLv * 100 + GetLevel()
    local nFaction = GetPlayerFaction()
    if nFaction ~= 0 and nLevel < 90 then
        SetLevel(90, 1);                                  --90¼¶
        Msg2Player("T¨ng thµnh c«ng!");
        Talk(1, "", "<color=yellow>T¨ng thµnh c«ng, h·y ®¨ng nhËp l¹i!<color>")
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    else
        Talk(1, "", "<color=red>CÇn d­íi cÊp 90 vµ ®· gia nhËp m«n ph¸i!<color>")
    end
end

--Task1:4-11Î»ÓÂÍùÖ±Ç°ÈÎÎñ
function ck_TaskForward()
    if CK_ES_SWITCH == 0 then
        Say(CK_NPC_NAME .. "M¸y chñ nµy t¹m thêi kh«ng më chuçi nhiÖm vô <color=red>Dòng C¶m TiÕn Tíi<color>", 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 1 then
        Say(CK_NPC_NAME .. format("ChØ cã <color=gold>[%s]<color> míi ®­îc nhËn nhiÖm vô nµy", "Vâ L©m T©n Tó"), 0)
        return 0;
    end
    if GetLevel() >= 90 or gf_GetPlayerRebornCount() > 0 then
        Say(CK_NPC_NAME .. "Nh©n vËt cÊp 90 trë lªn hoÆc ®· chuyÓn sinh kh«ng thÓ tham gia nhiÖm vô nµy!", 0);
        return 0;
    end
    local tSay = {}

    tinsert(tSay, "\nT¨ng cÊp ngay!/ck_TaskForward_finish");
    tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
    Say(CK_NPC_NAME .. "NhiÖm vô Dòng C¶m TiÕn Tíi cã thÓ gióp ng­êi nhanh chãng t¨ng cÊp!" .. "<color=gold>Nh©n vËt d­íi Lv90 vµ ®· kİch ho¹t code, chØ cÇn gia nhËp m«n ph¸i, sÏ t¨ng ngay ®Õn Lv90!<color>", getn(tSay), tSay);
end

function ck_TaskFoward_do(nTaskID, nTaskIndex)
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
        Say(CK_NPC_NAME .. "NhiÖm vô nµy ®· hoµn thµnh!", 0);
        return 0;
    end
    if nTaskIndex > 4 and CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex - 1) ~= 1 then
        Say(CK_NPC_NAME .. "Ch­a hoµn thµnh nhiÖm vô tr­íc ®ã", 0);
        return 0;
    end
    if tGtTask:check_cur_task(nTaskID) == 0 then
        DirectGetGTask(nTaskID, 1)
    else
        if DirectIsTaskFinish(nTaskID) then
            if 1 == DirectFinishGTask(nTaskID, 2) then
                CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
                Msg2Player("§· hoµn thµnh nhiÖm vô!")
            else
                Msg2Player("NhiÖm vô kh¸c th­êng, kh«ng thÓ hoµn thµnh!");
            end
        else
            Say(CK_NPC_NAME .. "NhiÖm vô vÉn ch­a hoµn thµnh!", 0);
        end
    end
end

--ÓÂÍùÖ±Ç°½±Àø(¶ÔÍâ)
function ck_TaskForward_Award()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
        SetLevel(90, 1);
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        Say(CK_NPC_NAME .. format("§¼ng cÊp nh©n vËt ®· n©ng cao ®Õn %d cÊp, xin ®¨ng nhËp l¹i!", 90), 1, "§¨ng nhËp l¹i/ExitGame");
    end
end

function ck_CheckCondition(bHideMsg)
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        return 1
    end
    local nKind = ck_GetTitleType();
    if nKind == 0 then
        if not bHideMsg then
            Say(CK_NPC_NAME .. "VÉn ch­a nhËn vµ kİch ho¹t danh hiÖu nµo, kh«ng thÓ tham gia nhiÖm vô!", 0);
        end
        return 0;
    end
    if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
        if not bHideMsg then
            Say(CK_NPC_NAME .. format("§»ng cÊp nh©n vËt kh«ng ®ñ %d cÊp, kh«ng thÓ tham gia nhiÖm vô !", 90), 0);
        end
        return 0;
    end
    return 1;
end

function ck_BaiZhanBuDai()
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    local tSay = {
        --"\nÉ±¹ÖÈÎÎñ/ck_BZBD_Kill",
        format("\n%s/#ck_task_group_talk2(1,1)", "NhiÖm vô ThÕ Lùc Ba Phe"),
        format("\n%s/#ck_task_group_talk2(1,2)", "NhiÖm vô phã b¶n"),
        format("\n%s/#ck_task_group_talk2(1,3)", "NhiÖm vô PVP"),
        --"\n¸±±¾ÈÎÎñ/ck_BZBD_Raid",
        --"\nPVPÈÎÎñ/ck_BZBD_PVP",
        "\nT«i chØ xem xem th«i/nothing",
    }
    Say(CK_NPC_NAME .. "NhiÖm vô <color=gold>Tr¨m TrËn Tr¨m Th¾ng<color>, nhËn ngÉu nhiªn h»ng ngµy, nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);
end

--Task3£º¼Ó³É
function ck_BZBD_GetType(nIndex1, nIndex2, nIndex3)
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3) == 1 then
        return 0.8;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2) == 1 then
        return 0.8;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1) == 1 then
        return 0.8;
    end
    return 0;
end

function ck_BZBD_SetType(nIndex1, nIndex2, nIndex3)
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 0)
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 0)
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 0)
    local nSize = gf_GetTeamSize();
    if nSize <= 1 then
        return 0;
    end
    --print("nSize =", nSize)
    local oldPlayerIndex = PlayerIndex;
    local nSelfType = ck_GetTitleType();
    if nSelfType == 0 then
        return 0;
    end
    --print("nSelfType =", nSelfType)
    if nSelfType == 1 then
        for i = 1, nSize do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= oldPlayerIndex then
                if ck_GetTitleType() == 1 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 1)
                    return 1;
                end
            end
        end
    end
    if nSelfType == 2 then
        for i = 1, nSize do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= oldPlayerIndex then
                if ck_GetTitleType() == 3 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
                    return 1;
                end
            end
        end
    end
    if nSelfType == 3 then
        for i = 1, nSize do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= oldPlayerIndex then
                if ck_GetTitleType() == 3 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 1)
                end
                if ck_GetTitleType() == 2 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
                end
            end
        end
    end
    PlayerIndex = oldPlayerIndex;
    --print("nIndex1 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1))
    --print("nIndex2 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2))
    --print("nIndex3 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3))
end

--É±¹ÖÈÎÎñ½±Àø(¶ÔÍâ)
function ck_BZBD_Kill_Award()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    local nParam = ck_BZBD_GetType(8, 9, 10);
    gf_ModifyExp(floor(3000000 * (1 + nParam)));
    ck_AddCkScore(floor(10 * (1 + nParam)));
end

--É±¹ÖÈÎÎñ¶ÔÍâ½Ó¿Ú
--½öÉèÖÃ¼Ó³ÉÏµÊı
function _ck_BZBD_Kill_Set()
    --print("_ck_BZBD_Kill_Set()")
    gf_TeamOperateEX(function()
        if ck_IsOpen() ~= 1 then
            return 0;
        end
        if ck_GetTitleType() == 0 then
            return 0;
        end
        local nCount = 0;
        local nTaskIndex = 0;
        for i = 12, 16 do
            --print(i, CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i))
            if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
                nCount = nCount + 1;
                nTaskIndex = i - 11;
            end
        end
        --print("nCount =", nCount)
        if nCount ~= 2 then
            return 0;
        end
        ck_BZBD_SetType(8, 9, 10);
    end);
end


--Ê¹ÓÃ°×¾ÔÍè
function _ck_UseItemBaiJu()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

--Ê¹ÓÃÈıÇåÍè
function _ck_UseItemSanQing()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

--Ê¹ÓÃÁùÉñÍè
function _ck_UseItemLiuShen()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end


--ÖÖÖ²Ğ¡°ãÈôÊ÷ÖÖ
function _ck_PlantSmallBanRuo()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);
end

TASKID_NVWA_BOX_USECOUNT = 3537 --ÊÖ¶¯¼ÓÈëtaskmanagerÖĞ¶ÔÓ¦µÄgroupÀï
--Ê¹ÓÃÅ®æ´±¦ºĞ
function _ck_UseItemNvWa()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 27, 1);

    local nUse = GetTask(TASKID_NVWA_BOX_USECOUNT)
    SetTask(TASKID_NVWA_BOX_USECOUNT, nUse + 1)
    if nUse + 1 >= 10 then
        ck_global_set_task_finish(2214)
    end
end

--Ê¹ÓÃĞÒÔËĞÇ
function _ck_UseItemLuckyStart()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 28, 1);
end

TASKID_CDK_FIRECRAKER_USE_COUNT = 3607
TASKID_DC_CDK_FIRECRAKER_USE_COUNT = 3608

--Ê¹ÓÃÊ¤Àû±¬Öñ
function _ck_UseItemFirecraker()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end

    local nUse = GetTask(TASKID_CDK_FIRECRAKER_USE_COUNT) + 1
    local nUseDaily = GetTask(TASKID_DC_CDK_FIRECRAKER_USE_COUNT) + 1
    SetTask(TASKID_CDK_FIRECRAKER_USE_COUNT, nUse)
    SetTask(TASKID_DC_CDK_FIRECRAKER_USE_COUNT, nUseDaily)
    if nUse >= 50 then
        ck_global_set_task_finish(2215);
    end
    if nUseDaily >= 50 then
        ck_global_set_task_finish(1308);
    end
end

function ck_ZiloTask()
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    local tSay = {
        "\nNhiÖm vô tİch lòy thuéc tİnh/ck_ZiloTask_1",
        "\nNhiÖm vô tiªu phİ Thiªn Kiªu LÖnh/ck_ZiloTask_2",
        "\nT«i chØ xem xem th«i/nothing",
    }
    Say(CK_NPC_NAME .. "NhiÖm vô <color=gold>§¹i Phó ¤ng<color>, trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn, cã thÓ nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);
end

--Task4£º1-7Íê³ÉÇé¿ö
function ck_ZiloTask_1(bTalk)
    local nTaskIndex = 0;
    for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
        if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
            nTaskIndex = i;
            break ;
        end
    end
    if nTaskIndex == 0 then
        Say(CK_NPC_NAME .. format("Chóc mõng %s ®· hoµn thµnh toµn bé <color=gold>nhiÖm vô tİch lòy thuéc tİnh<color>!", gf_GetPlayerSexName()), 0)
        return 0;
    end
    local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
    if not tCell then
        return 0;
    end
    if not bTalk then
        local tSay = {
            "\nTa muèn hoµn thµnh/#ck_ZiloTask_1(1)",
            "\nT«i chØ xem xem th«i/nothing",
        }
        local Str = format("Nh©n vËt ®· ®¹t chuyÓn sinh %d cÊp %d, tİch lòy %d ®iÓm danh väng, %d ®iÓm s­ m«n, %d ®iÓm c«ng tr¹ng", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
        local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d", tCell[1], Str, "Nç lùc tİch lòy sÏ gióp b¶n th©n ngµy cµng lín m¹nh", tCell[3][1], tCell[3][2]);
        Say(CK_NPC_NAME .. Msg, getn(tSay), tSay);
        return 0;
    end

    if ck_GetZiloTaskAward(nTaskIndex) == 1 then
        ck_ZiloTask_1();
    end
end

function ck_GetZiloTaskAward(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end

    if not nTaskIndex
            or nTaskIndex < CK_TASK_ZILON_ATRR_BEGIN
            or nTaskIndex > getn(CK_TASK_ZILON_ATRR) then
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex) ~= 0 then
        Say(CK_NPC_NAME .. "§· hoµn thµnh nhiÖm vô nµy!", 0);
        return 0;
    end

    local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
    if not tCell then
        return 0;
    end

    if gf_GetPlayerRebornCount() < tCell[2][1] then
        Say(CK_NPC_NAME .. format("CÊp chuyÓn sinh cña %s kh«ng ®ñ <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
        return 0;
    end
    if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
        Say(CK_NPC_NAME .. format("§¼ng cÊp cña %s kh«ng ®ñ <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
        return 0;
    end
    if GetReputation() < tCell[2][3] then
        Say(CK_NPC_NAME .. format("§iÓm tİch lòy danh väng cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][3]), 0);
        return 0;
    end
    if GetTask(336) < tCell[2][4] then
        Say(CK_NPC_NAME .. format("§iÓm tİch lòy s­ m«n cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][4]), 0);
        return 0;
    end
    if abs(GetTask(701)) < tCell[2][5] then
        Say(CK_NPC_NAME .. format("§iÓm tİch lòy c«ng tr¹ng cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][5]), 0);
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);
    --½±Àø
    gf_ModifyExp(tCell[3][1]);
    ck_AddCkScore(tCell[3][2]);
    Msg2Player("NhiÖm vô hoµn thµnh!");

    return 1;
end

--Task4£º8-12Íê³ÉÇé¿ö
function ck_ZiloTask_2(bTalk)
    local nTaskIndex = 0;
    for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN + getn(CK_TASK_IB_COST) - 1 do
        if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
            nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
            break ;
        end
    end
    if nTaskIndex == 0 then
        Say(CK_NPC_NAME .. format("Chóc mõng %s ®· hoµn thµnh toµn bé <color=gold>nhiÖm vô tiªu phİ<color>!", gf_GetPlayerSexName()), 0)
        return 0;
    end
    local tCell = CK_TASK_IB_COST[nTaskIndex];
    if not tCell then
        return 0;
    end
    if not bTalk then
        local tSay = {
            "\nTa muèn hoµn thµnh/#ck_ZiloTask_2(1)",
            "\nT«i chØ xem xem th«i/nothing",
        }
        local Str = format("Trong ¶i bÊt kú cña §Şa HuyÒn Cung, V¹n KiÕm Tròng, L­¬ng S¬n vµ Th¸i NhÊt Th¸p tİch lòy sö dông %d Thiªn Kiªu LÖnh ®Ó më r­¬ng", tCell[2]);
        local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d", tCell[1], Str, "Dïng Thiªn Kiªu LÖnh ®Ó më r­¬ng sÏ nhËn ®­îc phÇn th­ëng phong phó", tCell[3][1], tCell[3][2]);
        Say(CK_NPC_NAME .. Msg, getn(tSay), tSay);
        return 0;
    end

    if ck_GetIBTaskAward(nTaskIndex) == 1 then
        ck_ZiloTask_2();
    end
end

function ck_GetIBTaskAward(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end

    if not nTaskIndex
            or nTaskIndex <= 0
            or nTaskIndex > getn(CK_TASK_IB_COST) then
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1) ~= 0 then
        Say(CK_NPC_NAME .. "§· hoµn thµnh nhiÖm vô nµy!", 0);
        return 0;
    end

    local tCell = CK_TASK_IB_COST[nTaskIndex];
    if not tCell then
        return 0;
    end

    if ck_GetCostIB() < tCell[2] then
        Say(CK_NPC_NAME .. format("ë ¶i hiÖn t¹i, sè l­îng Thiªn Kiªu LÖnh do %s tiªu phİ kh«ng ®ñ <color=red>%d<color> c¸i", gf_GetPlayerSexName(), tCell[2]), 0);
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);
    --½±Àø
    gf_ModifyExp(tCell[3][1]);
    ck_AddCkScore(tCell[3][2]);
    Msg2Player("NhiÖm vô hoµn thµnh!");

    return 1
end

--¹Ø¿¨Ïû·ÑÌì½¾ÁîTask5
function ck_GetCostIB()
    return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

--¹Ø¿¨Ïû·Ñ¶ÔÍâ½Ó¿ÚTask5
function _ck_SetCostIB(nNum)
    if ck_IsOpen() ~= 1 then
        --print("SetCostIB",nNum,"not open")
        return 0;
    end
    if ck_GetTitleType() == 0 then
        --print("SetCostIB",nNum,"no titile")
        return 0;
    end
    nNum = nNum or 1;
    --print("GetCostIB",ck_GetCostIB(),CK_TASK_GROUP.Task5)
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task5, ck_GetCostIB() + tonumber(nNum));
end

function ck_QueryScore()
    Say(CK_NPC_NAME .. format("%s b©y giê ®iÓm n¨ng ®éng lµ <color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCkScore()), 0);
end

function ck_ScoreAward()
    local nScore = ck_GetCkScore();
    local tMsg = {
        [0] = "Ch­a nhËn",
        [1] = "§· nhËn",
    }
    local tSay = {};
    for i = 1, getn(CK_SCROE_AWARD_TABLE) do
        local nAwardedFlagId = CK_SCROE_AWARD_TABLE[i][1][7];
        --local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
        local nType = ActCheckCondition(nAwardedFlagId)
        tinsert(tSay, format("Th­ëng ®iÓm n¨ng ®éng ®¹t %d (%s)/#ck_view_score_award(%d)", CK_SCROE_AWARD_TABLE[i][1][1], tMsg[nType], i));
    end
    tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
    Say(CK_NPC_NAME .. format("§iÓm n¨ng ®éng hiÖn t¹i cña %s lµ <color=gold>%d<color>, h·y chän phÇn th­ëng muèn nhËn!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

function ActiveTitle(nType)
    --print("111111111111")
    if nType == 0 then
        ck_ActTilte_1()
    elseif nType == 1 then
        ck_ActTilte_3()
    end
end
