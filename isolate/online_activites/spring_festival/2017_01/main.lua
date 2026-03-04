--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼þ£¬¸÷Ä£¿éÖ»ÐèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼þ´¦Àíº¯Êý£¬²»ÐèÒª¹ØÐÄÕâÐ©º¯ÊýÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓÐIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ÐèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìÐ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\award.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act1.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act2.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act3.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act4.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act5.lua")

t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ð§ >0:Ä£¿éÓÐÐ§£¬ÊýÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "SpringFestival",
    szViewName 			= "Ho¹t ®éng xu©n míi 2017",
    nTalkBeginDate		= 20170118,
    nBeginDate 			= 20170118,
    nEndDate 			= 20170208,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 25,
}

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
   {id={"id_dc_byte", 1,}, clear="daily" }, -- ×Ö½Ú´æÈÕÇå±äÁ¿
   {id={"id_byte", 2,},  },                 -- ×Ö½Ú´æ²»Çå±äÁ¿
   {id={"id_get_box", 3,},  },              -- ¼ÇÂ¼Ê°È¡ÐÂ´º±¦ÏäµÄÊ±¼ä
   {id={"id_get_box_fromDS", 4,}, clear="daily" },       -- ¼ÇÂ¼´Ó»î¶¯´óÊ¹´¦ÁìÈ¡±¦ÏäµÄ´ÎÊý£¬ºÍ»÷É±ÄêÊÞµÄ´ÎÊýÓÐ¹Ø
   {id={"id_last_fushen", 5,},  },          -- ¼ÇÂ¼Íæ¼ÒÒÑÕÒµ½¸£ÉñµÄhashÖµ
   {id={"id_mission", 6,}, clear="daily" },              -- ¼ÇÂ¼Íæ¼ÒÃ¿Ìì×öµÄÈÎÎñ
   {id={"id_toahuaCD", 7,},  },              -- ¼ÇÂ¼Íæ¼Ò²ÉÌÒ»¨µÄCD
   {id={"id_wushi", 8,},  },                -- ¼ÇÂ¼ÊÇ·ñÁì¶Ò»»¹ýÎèÊ¨
}

function _refresh_fushen(nPara) 
    if sf2017_indate(SF2017_DATE_ACT1) ~= 1 then return end
    local tPos = SF2017_FUSHEN.tPos[nPara[4][1]];
    if tPos == nil then return end
    local nPos = random(1,getn(tPos))
    SF2017_FUSHEN.nCnt =0 ;
    SF2017_FUSHEN.nHash = GetTime()
    local npcidx = CreateNpc(SF2017_FUSHEN.szTemp,SF2017_FUSHEN.szName,tPos[nPos][1],tPos[nPos][2],tPos[nPos][3])
    SetNpcLifeTime(npcidx,SF2017_FUSHEN.nLifeTime)
    if SF2017_DEBUG == 1 then
        print("\nFushen Pos:",tPos[nPos][1],tPos[nPos][2],tPos[nPos][3])
    end
    if npcidx ~= 0 then
    	Msg2Global(format("Phóc ThÇn ®· xuÊt hiÖn ë %s, c¸c vÞ ®¹i hiÖp h·y ®Õn ®ã t×m Phóc ThÇn, nhËn th­ëng phong phó!",tPos[nPos][4]))
    end
end

function _refresh_monster()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if SF2017_MONSTER.isLife == 1 then return end
    local tnpc = SF2017_MONSTER
    SF2017_MONSTER:Init()
end

function _refresh_both(nPara)
    _refresh_fushen(nPara)
    _refresh_monster()
end

function handle_count_time()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if SF2017_MONSTER.isLife == 1 then return end
    if SF2017_MONSTER.nDeadTime == -1 then return end
    local nTime = GetTime()
    if nTime - SF2017_MONSTER.nDeadTime >= SF2017_MONSTER.nRefreshTime then
        SF2017_MONSTER:Init()
    end
end

t_isolate_user_batch_watch_list = { 
    {"event_server_tick_minute",{1},handle_count_time,{ }},
	{"event_server_time", {12, 00}, _refresh_both,{ 1 }  },
    {"event_server_time", {14, 00}, _refresh_fushen,{ 2 }  },
    {"event_server_time", {16, 00}, _refresh_fushen,{ 3 }  },
    {"event_server_time", {18, 00}, _refresh_fushen,{ 1 }  },
    {"event_server_time", {19, 00}, _refresh_monster,{  }  },
    {"event_server_time", {20, 00}, _refresh_fushen,{ 2 }  },
    {"event_server_time", {21, 00}, _refresh_fushen,{ 3 }  },
    {"event_server_time", {22, 00}, _refresh_fushen,{ 3 }  },
    {"event_server_time", {23, 00}, _refresh_fushen,{ 2 }  },
}

function on_add_watches() 
	isolate_watch_npc_talk(SF2017_TREES.szName, 100, "sf2017_talk2tree")
    isolate_watch_npc_talk(SF2017_TREES.szName, 200, "sf2017_talk2tree")
    isolate_watch_npc_talk(SF2017_TREES.szName, 300, "sf2017_talk2tree")
    isolate_watch_npc_talk(SF2017_TREES.szName, 350, "sf2017_talk2tree")
    isolate_watch_item_talk(SF2017_FLOWER[1],SF2017_FLOWER[2],SF2017_FLOWER[3], "NY2016_usetaohua")

    isolate_watch_npc_talk(SF2017_FUSHEN.szName, 100, "sf2017_talk2fushen")
    isolate_watch_npc_talk(SF2017_FUSHEN.szName, 200, "sf2017_talk2fushen")
    isolate_watch_npc_talk(SF2017_FUSHEN.szName, 300, "sf2017_talk2fushen")

    isolate_watch_npc_talk(SF2017_HDDS.szName, 100, "sf2017_talk2hdds")
    isolate_watch_npc_talk(SF2017_HDDS.szName, 200, "sf2017_talk2hdds")
    isolate_watch_npc_talk(SF2017_HDDS.szName, 300, "sf2017_talk2hdds")
    isolate_watch_item_talk(SF2017_FIRECRACKERS.normal[1],SF2017_FIRECRACKERS.normal[2],SF2017_FIRECRACKERS.normal[3], "sf2017_use_firecrackers")
    isolate_watch_item_talk(SF2017_FIRECRACKERS.delicate[1],SF2017_FIRECRACKERS.delicate[2],SF2017_FIRECRACKERS.delicate[3], "sf2017_ask_number")
    isolate_watch_item_talk(SF2017_BOX.tItem[1],SF2017_BOX.tItem[2],SF2017_BOX.tItem[3], "sf2017_use_box_award")
    
    isolate_watch_npc_talk(SF2017_MONSTER.szName, 100, "MonsterTalk")
    
    isolate_watch_item_talk(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3], "sf2017_Debug")
    isolate_watch_npc_talk(SF2017_BOX.szName, SF2017_BOX.tPos[1], "sf2017_talk2xcbox")
    isolate_watch_event("event_kill_npc", "sf2017_killnpc", "", 102)
    isolate_watch_event("event_kill_npc", "sf2017_killnpc", "", 103)
    isolate_watch_event("event_kill_npc", "sf2017_killnpc", "", 104)

    isolate_watch_npc_talk("A ThÞnh", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("Chu ThiÖn Nh©n", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("ThÇy bãi", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("Tµo §¹i Lùc", 200, "sf2017_finish_mission")
    isolate_watch_npc_talk("Vò N­¬ng", 200, "sf2017_finish_mission")
    isolate_watch_npc_talk("Hµn NghÜa", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("Tr­¬ng ¶nh", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("Lôc Tróc ¤ng", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("H¹ HÇu Anh", 150, "sf2017_finish_mission")
    isolate_watch_npc_talk("M·nh Nham ", 150, "sf2017_finish_mission")
    isolate_watch_npc_talk("H¹ KiÖt", 100, "sf2017_finish_mission")
    isolate_watch_npc_talk("Chung Phãng", 100, "sf2017_finish_mission")
end

function sf2017_talk2hdds()
    if sf2017_finish_mission() == 1 then return end
    local nSex = GetSex()
    local szSex = "§¹i hiÖp"
    if nSex == 2 then szSex = "N÷ hiÖp " end
    local szTitle = format("<color=green>%s<color>: Xu©n míi vui vÎ!",SF2017_HDDS.szName)
    if sf2017_indate(SF2017_DATE_ACT4_2) == 1 then 
        szTitle = format("<color=green>%s<color>: Xu©n míi s¾p ®Õn, %s cã thÓ thu thËp mét sè Háa D­îc ®Ó chÕ thµnh Ph¸o trong thêi gian tÕt, chuÈn bÞ ®uæi Niªn Thó.",SF2017_HDDS.szName,szSex)
    elseif sf2017_indate(SF2017_DATE_ACT5) == 1 then
        szTitle = format("<color=green>%s<color>: GÇn ®©y, Niªn Thó th­êng xuÊt hiÖn ë vïng biÓn TuyÒn Ch©u, muèn vµo thµnh ph¸ ho¹i kh«ng cho d©n chóng mõng tÕt. Nhê %s ®Õn vïng biÓn TuyÒn Ch©u dïng Ph¸o ®uæi Niªn Thó ®i.",SF2017_HDDS.szName,szSex)
    end
    local tbSay  = {}
    local bGotClothes = get_task_byte("id_byte",SF2017_BYTE_TSK.get_clothes)
    if sf2017_indate(SF2017_DATE_ACT3) == 1 then 
        if bGotClothes == 0 then tinsert(tbSay,"NhËn 1 bé ngo¹i trang XÝch Viªn Léng H¹c cã thêi h¹n/sf2017_on_getclothes") end
        if bGotClothes == 1 then tinsert(tbSay,"Dïng 40 Thiªn Kiªu LÖnh vµ 500 Vµng ®Ó ®æi 1 ngo¹i trang XÝch Viªn Léng H¹c cã thêi h¹n thµnh 1 ngo¹i trang vÜnh viÔn/sf2017_excclothes") end
    end
    if sf2017_indate(SF2017_DATE_ACT5) == 1 then
        tinsert(tbSay,"Sö dông 1 Háa D­îc S¬ ChÕ vµ 2 Vµng chÕ t¹o 1 Ph¸o S¬ ChÕ/sf2017_make_normalfirecrackers")
        tinsert(tbSay,"Sö dông 1 Háa D­îc Tinh ChÕ vµ 5 Vµng chÕ t¹o 1 Ph¸o Tinh ChÕ/sf2017_make_delicatefirecrackers")
        tinsert(tbSay,"NhËn tÊt c¶ phÇn th­ëng ®uæi Niªn Thó/sf2017_get_box_fromDS")
        tinsert(tbSay,"§em thó c­ìi [L©n S­] cã thêi h¹n ®æi thµnh vÜnh viÔn/sf2017_exc_wushi")
        tinsert(tbSay,"Gi¶i thÝch ho¹t ®éng/sf2017_monster_description")
    end
    if sf2017_indate(SF2017_DATE_ACT4_2) == 1 then
        tinsert(tbSay,"Tham gia nhiÖm vô Thu thËp Háa D­îc/sf2017_mission")
        tinsert(tbSay,"Giíi thiÖu nhiÖm vô/sf2017_mission_description")
    end
    if sf2017_indate(SF2017_SHOP_DATE1) == 1 and sf2017_intime(SF2017_SHOP_TIME1) == 1 then
        tinsert(tbSay,"Cöa hµng Xu©n Míi-Giai ®o¹n 1/#sf2017_openshop(1)")
    end
    if sf2017_indate(SF2017_SHOP_DATE2) == 1 and sf2017_intime(SF2017_SHOP_TIME2) == 1 then
        tinsert(tbSay,"Cöa hµng Xu©n Míi-Giai ®o¹n 2/#sf2017_openshop(2)")
    end
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_openshop(nType)
    if nType == 1 then
        if sf2017_indate(SF2017_SHOP_DATE1) == 1 and sf2017_intime(SF2017_SHOP_TIME1) == 1 then
            SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3082, "Cöa hµng Xu©n Míi"))
        end
    else
        if sf2017_indate(SF2017_SHOP_DATE2) == 1 and sf2017_intime(SF2017_SHOP_TIME2) == 1 then
            SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3083, "Cöa hµng Xu©n Míi"))
        end
    end
end

function on_event_server_start() 
    for i = 1, getn(SF2017_TREES.tPos) do
        CreateNpc(SF2017_TREES.szTemp,SF2017_TREES.szName,SF2017_TREES.tPos[i][1],SF2017_TREES.tPos[i][2],SF2017_TREES.tPos[i][3])
    end
    for i = 1, getn(SF2017_HDDS.tPos) do
        CreateNpc(SF2017_HDDS.szTemp,SF2017_HDDS.szName,SF2017_HDDS.tPos[i][1],SF2017_HDDS.tPos[i][2],SF2017_HDDS.tPos[i][3])
    end
    for i = 1, getn(SF2017_BOSS) do
        CreateNpc(SF2017_BOSS[i][1],SF2017_BOSS[i][2],SF2017_BOSS[i][3],SF2017_BOSS[i][4],SF2017_BOSS[i][5])
    end
end

function on_new_day(nToday) 
    SF2017_MONSTER.nDeadCnt = 0;
end