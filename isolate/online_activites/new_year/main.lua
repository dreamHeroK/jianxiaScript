--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş,¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı,²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷,ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§,ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "NewYearActivity",
    szViewName 			= "Ho¹t ®éng lÔ nguyªn ®¸n",
    nTalkBeginDate		= 20161226,
    nBeginDate 			= 20161226,
    nEndDate 			= 20170103,
    nTaskGroup 			= 4,
    nTaskGroupVersion	= 14,
}

NY2016_POS = {
    {207,1364,3044,"NhŞ Long s¬n"},{207,1505,3129,"NhŞ Long s¬n"},{207,1490,2996,"NhŞ Long s¬n"},
    {114,1551,3450,"V­¬ng MÉu ®éng_1"},{114,1558,3575,"V­¬ng MÉu ®éng_1"},{408,1453,2967,"Miªu LÜnh"},
    {408,1317,3075,"Miªu LÜnh"},{403,1443,3110,"T©y Song B¶n N¹p nam"},{403,1380,3068,"T©y Song B¶n N¹p nam"},
    {112,1695,2835,"L­ìng Thñy ®éng_1"},{112,1716,3036,"L­ìng Thñy ®éng_1"},{210,1486,3123,"D­¬ng Trung ®éng"},
    {210,1411,2904,"D­¬ng Trung ®éng"},{327,1395,2857,"¤ M«ng Bé"},{327,1495,3022,"¤ M«ng Bé"},
    {503,1420,3078,"TÇn L¨ng"},{503,1508,2852,"TÇn L¨ng"},{508,1613,3222,"Quang Minh ®Ønh"},
    {508,1643,3095,"Quang Minh ®Ønh"},{508,1754,3111,"Quang Minh ®Ønh"},
}
NY2016_CARD = {
    {2,1,31183,"ThÎ [Nguyªn]"},
    {2,1,31184,"ThÎ [§¸n]"},
    {2,1,31185,"ThÎ [Vui]"},
    {2,1,31186,"ThÎ [VÎ]"},
    {2,1,31187,"ThÎ [Nguyªn §¸n Vui VÎ]"},
}
NY2016_CLOTHES = {
    {
        {0,108,833,1,"ChØ Thñy Quan"},
        {0,108,834,1,"ChØ Thñy Quan"},
        {0,108,835,1,"ChØ Thñy Tr©m"},
        {0,108,836,1,"ChØ Thñy Tr©m"},
    },
    {
        {0,109,833,1,"ChØ Thñy y"},
        {0,109,834,1,"ChØ Thñy y"},
        {0,109,835,1,"ChØ Thñy y"},
        {0,109,836,1,"ChØ Thñy y"},
    },
    {
        {0,110,833,1,"ChØ Thñy Trang"},
        {0,110,834,1,"ChØ Thñy Trang"},
        {0,110,835,1,"ChØ Thñy QuÇn"},
        {0,110,836,1,"ChØ Thñy QuÇn"},
    },
}
NY2016_HAPPY_CARD_LIMIT = 5
NY2016_EX_NEED = 3
NY2016_MAP_TIMES_LIMIT = 20
NY2016_MAP = {2,1,31182,"Tµng B¶o §å"}
NY2016_DATE = 20170101


t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
   {id={"tskid_get_map_times", 1,}, clear="daily" }, -- Ã¿ÈÕÁìÈ¡²Ø±¦Í¼µÄ´ÎÊı
   {id={"tskid_cur_pos", 2,} },
   {id={"tskid_use_happy_card", 3,},clear="daily" }, -- Ê¹ÓÃÔªµ©¿ìÀÖ¿¨ÊıÁ¿
   {id={"tskid_get_clothes", 4,} }, -- ÁìÈ¡ÏŞÊ±Íâ×°
   {id={"tskid_exchange_clothes", 5,} }, -- ¶Ò»»ÓÀ¾ÃÍâ×°
}

function NY2016_reset_tskid()
    set_task("tskid_get_map_times",0)
    set_task("tskid_use_happy_card",0)
end

function on_add_watches() 
	isolate_watch_npc_talk("T­ M· TÊn Nguyªn", 350, "NY2016_handle_talk2simajinyuan");
    isolate_watch_npc_talk("Minh Chñ Kim S¬n", 350, "NY2016_handle_talk2jszmr");
    isolate_watch_item_talk(2,1,31182, "handle_on_use_map")
    isolate_watch_item_talk(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3], "NY2016_use_happy_card")
end

function NY2016_handle_talk2jszmr()
    local nDate = tonumber(date("%Y%m%d"))
    local nClothes = get_task("tskid_get_clothes")
    local nExchange = get_task("tskid_exchange_clothes")
    local szTitle   = "<color=green>Minh Chñ Kim S¬n<color>: C¸c vŞ ®¹i hiÖp, chóc c¸c vŞ nguyªn ®¸n vui vÎ! C¸c vŞ cã thÓ nhËn ngo¹i trang ®Ñp ë ®©y nhĞ.";
    if nDate ~= NY2016_DATE then 
        Talk(1,"","<color=green>Minh Chñ Kim S¬n<color>: C¸c vŞ ®¹i hiÖp, chóc c¸c vŞ nguyªn ®¸n vui vÎ! Vµo ngµy ®Çu cña n¨m míi (<color=red>1/1/2017<color>), ta sÏ tÆng c¸c vŞ c¸c mãn quµ ngo¹i trang ®Ñp m¾t, mäi ng­êi nhí ®Õn nhËn!")
        return 
    end
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    if nClothes == 0 then tinsert(tbSay,"NhËn ngo¹i trang cã thêi h¹n/NY2016_get_clothes") end
    if nClothes == 1 and nExchange == 0 then tinsert(tbSay,"Dïng ngo¹i trang cã thêi gian ®æi lÊy ngo¹i trang vÜnh viÔn/NY2016_exchange_clothes") end
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function NY2016_get_clothes()
    local bGot = get_task("tskid_get_clothes")
    if bGot == 1 then Talk(1,"","Mçi ng­êi chØ ®­îc nhËn 1 lÇn") return end
    local nBody = GetBody()
    if gf_Judge_Room_Weight(3, 0) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return
    end
    for i = 1, getn(NY2016_CLOTHES) do
        local tGive = NY2016_CLOTHES[i][nBody]
        local _,nIdx = gf_AddItemEx({tGive[1],tGive[2],tGive[3],tGive[4],4},tGive[5])
        SetItemExpireTime(nIdx, 30*24*3600)
    end
    set_task("tskid_get_clothes",1)
end

function NY2016_exchange_clothes()
    local nBody = GetBody()
    local clothes1 = GetItemCount(NY2016_CLOTHES[1][nBody][1],NY2016_CLOTHES[1][nBody][2],NY2016_CLOTHES[1][nBody][3]);
    local clothes2 = GetItemCount(NY2016_CLOTHES[2][nBody][1],NY2016_CLOTHES[2][nBody][2],NY2016_CLOTHES[2][nBody][3]);
    local clothes3 = GetItemCount(NY2016_CLOTHES[3][nBody][1],NY2016_CLOTHES[3][nBody][2],NY2016_CLOTHES[3][nBody][3]);
    if clothes1 < 1 or clothes2 < 1 or clothes3 < 1 then
        Talk(1,"","H·y cÊt 3 mãn ngo¹i trang cã thêi h¹n ®· nhËn tr­íc ®©y vµo hµnh trang.")
        return
    end 
    local nTianJ = GetItemCount(2, 97, 236)
    local nCash  = GetCash()
    if nTianJ < 30 or nCash < 3000000 then
        Talk(1,"","§æi cÇn 30 Thiªn Kiªu LÖnh vµ 300 Vµng, trong hµnh trang hiÖn kh«ng cã ®ñ.")
        return
    end 
    if DelItem(2, 97, 236, 30) ~= 1 then return end;
    Pay(3000000)
    if DelItem(NY2016_CLOTHES[1][nBody][1],NY2016_CLOTHES[1][nBody][2],NY2016_CLOTHES[1][nBody][3],1) ~= 1 then return end;
    if DelItem(NY2016_CLOTHES[2][nBody][1],NY2016_CLOTHES[2][nBody][2],NY2016_CLOTHES[2][nBody][3],1) ~= 1 then return end;
    if DelItem(NY2016_CLOTHES[3][nBody][1],NY2016_CLOTHES[3][nBody][2],NY2016_CLOTHES[3][nBody][3],1) ~= 1 then return end;
    for i = 1, getn(NY2016_CLOTHES) do
        local tGive = NY2016_CLOTHES[i][nBody]
        local _,nIdx = gf_AddItemEx({tGive[1],tGive[2],tGive[3],tGive[4],5},tGive[5])
    end
    set_task("tskid_exchange_clothes",1)
end

function NY2016_use_happy_card()
    local nCnt = get_task("tskid_use_happy_card")
    if nCnt >= NY2016_HAPPY_CARD_LIMIT then
        Talk(1,"",format("Mét ngµy chØ ®­îc dïng %d lÇn ThÎ [Nguyªn §¸n Vui VÎ]",NY2016_HAPPY_CARD_LIMIT))
        return 0
    end
    
    local szAward = "sdhd_ydklk"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
    if DelItem(NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3],1) ~= 1 then
        Msg2Player("Lçi khi sö dông")
        return 0
    end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --¶şºÅ²ÎÊıÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø,Èç¹ûÊÇÔò1
        set_task("tskid_use_happy_card",nCnt + 1)
		return 1
	end
	return 0
end

function NY2016_handle_talk2simajinyuan()
    local szTitle   = "<color=green>T­ M· TÊn Nguyªn<color>:".."C¸c hiÖp sÜ nguyªn ®¸n vui vÎ! Vâ L©m Minh ®· ®Æt sè l­îng lín ThiÖp Gi¸ng Sinh, ®em chóng giÊu ë kh¾p n¬i. Ta ®©y cã manh mèi h­íng dÉn. Vµo ngµy 26/12 - 03/1, mçi ngµy c¸c hiÖp sÜ  ®­îc nhËn 20 lÇn. LÇn theo manh mèi ®Ó thu thËp c¸c thÎ [Nguyªn], [§¸n], [Vui], [VÎ] vµ ghĞp chóng thµnh thÎ [Nguyªn §¸n Vui VÎ] th× sÏ nhËn ®­îc phÇn th­ëng nguyªn ®¸n. NÕu t×m ®­îc qu¸ nhiÒu 1 lo¹i thÎ nµo ®ã, cã thÓ dïng 3 thÎ gièng nhau ®æi lÊy 1 thÎ ®­îc quy ®Şnh. Mçi ngµy ®­îc nhËn th­ëng tèi ®a 5 lÇn tõ thÎ [Nguyªn §¸n Vui VÎ].";
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    tinsert(tbSay,"NhiÖm vô Tµng B¶o §å/NY2016_mission")
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function NY2016_mission()
    local szNpc   = "<color=green>T­ M· TÊn Nguyªn<color>:";
    local nCnt = get_task("tskid_get_map_times")
    if nCnt >= NY2016_MAP_TIMES_LIMIT then
        Talk(1,"",format("%s, h«m nay b¹n ®· nhËn %d lÇn Tµng B¶o §å, kh«ng thÓ nhËn thªm.",szNpc,NY2016_MAP_TIMES_LIMIT))
        return
    end
    local hasMap = BigGetItemCount(NY2016_MAP[1],NY2016_MAP[2],NY2016_MAP[3])
    if hasMap > 0 then Talk(1,"",format("%s, trªn ng­êi ®· cã %s, kh«ng thÓ nhËn l¹i",szNpc,NY2016_MAP[4])); return end;
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ") return end
    local nIdx = gf_AddItemEx({NY2016_MAP[1], NY2016_MAP[2], NY2016_MAP[3], 1, 4}, NY2016_MAP[4]);
    local nRand = random(1,getn(NY2016_POS));
    set_task("tskid_cur_pos",nRand);
    set_task("tskid_get_map_times",nCnt+1)
end

function NY2016_found_tresure()
    local szAward = "sdhd_kp"
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --¶şºÅ²ÎÊıÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø,Èç¹ûÊÇÔò1
        ModifyExp(100000)
        Msg2Player("B¹n ®· nhËn ®­îc 100000 kinh nghiÖm!")
        gf_Modify('Popur2', 1)
		return 1
	end
	return 0
end

function liyu_map_cd(nCnt,nIndex)
    SetItemUseLapse(nIndex,nCnt*18);
end


function handle_on_use_map(nIndex)
    local m,x,y = GetWorldPos()
    local tTarget = NY2016_POS[ get_task("tskid_cur_pos") ]
    local posx = tTarget[2];
    local posy = tTarget[3];
    if m ~= tTarget[1] then
        Talk(1,"",format("Tµng B¶o §å hiÓn thŞ khã b¸u ë <color=red>%s<color>",tTarget[4]))
        return
    end

    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if k<=3 and k>=0 then
        if DelItemByIndex(nIndex,1) == 1 then
            NY2016_found_tresure()
        else
            error("Sö dông Tµng B¶o §å bŞ lçi.")
        end
    else
        liyu_map_cd(5,nIndex) -- cd 5s
        Talk(1,"","C¸ch vŞ trİ kho b¸u cßn <color=yellow>".. floor(k/2).." b­íc<color>!");
    end
end


function NY2016_exchange_1()
    local nYuan = GetItemCount(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3])
    local nDan  = GetItemCount(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3])
    local nKuai = GetItemCount(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3])
    local nLe   = GetItemCount(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3])
    if nYuan < NY2016_EX_NEED and nDan < NY2016_EX_NEED and nKuai < NY2016_EX_NEED and nLe < NY2016_EX_NEED then
        Talk(1,"",format("Trªn ng­êi kh«ng cã lo¹i thiÖp nµo v­ît qu¸ %d.",NY2016_EX_NEED))
        return
    end
    local szTitle = ""
    local tbSay = {}
    if nYuan >= NY2016_EX_NEED then tinsert(tbSay,format("Dïng %d thÎ [Nguyªn] (hiÖn cã %d) ®æi 1 thÎ quy ®Şnh/#NY2016_exchange_1_1(1)",NY2016_EX_NEED,nYuan))end
    if nDan >=NY2016_EX_NEED then   tinsert(tbSay,format("Dïng %d thÎ [§¸n] (hiÖn cã %d) ®æi 1 thÎ quy ®Şnh/#NY2016_exchange_1_1(2)",NY2016_EX_NEED,nDan))end
    if nKuai >=NY2016_EX_NEED then  tinsert(tbSay,format("Dïng %d thÎ [Vui] (hiÖn cã %d) ®æi 1 thÎ quy ®Şnh/#NY2016_exchange_1_1(3)",NY2016_EX_NEED,nKuai))end
    if nLe >=NY2016_EX_NEED then    tinsert(tbSay,format("Dïng %d thÎ [VÎ] (hiÖn cã %d) ®æi 1 thÎ quy ®Şnh/#NY2016_exchange_1_1(4)",NY2016_EX_NEED,nLe))end
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function NY2016_exchange_1_1(nType)
    local szTitle = ""
    local tbSay = {}
    tinsert(tbSay,format("§æi 1 thÎ [Nguyªn]/#NY2016_exchange_1_2(%d,1)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("§æi 1 thÎ [§¸n]/#NY2016_exchange_1_2(%d,2)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("§æi 1 thÎ [Vui]/#NY2016_exchange_1_2(%d,3)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("§æi 1 thÎ [VÎ]/#NY2016_exchange_1_2(%d,4)",nType,NY2016_EX_NEED))
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function NY2016_exchange_1_2(nType,nWant)
    local nCnt = GetItemCount(NY2016_CARD[nType][1],NY2016_CARD[nType][2],NY2016_CARD[nType][3])
    if nCnt < NY2016_EX_NEED then
        Msg2Player("Lçi khi ®æi");
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ") return end
    if DelItem(NY2016_CARD[nType][1],NY2016_CARD[nType][2],NY2016_CARD[nType][3],NY2016_EX_NEED) == 1 then
        gf_AddItemEx({NY2016_CARD[nWant][1],NY2016_CARD[nWant][2],NY2016_CARD[nWant][3],1,4},NY2016_CARD[nWant][4])
    end
end

function NY2016_exchange_2()
    local nYuan = GetItemCount(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3])
    local nDan  = GetItemCount(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3])
    local nKuai = GetItemCount(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3])
    local nLe   = GetItemCount(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3])
    if nYuan < 1 or nDan < 1 or nKuai < 1 or nLe < 1 then
        Talk(1,"NY2016_exchange_card","Trªn ng­êi ph¶i cã tèi thiÓu mçi lo¹i 1 thÎ [Nguyªn], [§¸n], [Vui], [VÎ].")
        return
    end
    local nCash = GetCash()
    if nCash < 100000 then
        Talk(1,"NY2016_exchange_card","TiÒn trªn ng­êi kh«ng ®ñ 10 Vµng.")
        return
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ") return end
    if DelItem(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3],1) ~= 1 then return end;
    if DelItem(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3],1) ~= 1 then return end;
    if DelItem(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3],1) ~= 1 then return end;
    if DelItem(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3],1) ~= 1 then return end;
    Pay(100000)
    gf_AddItemEx({NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3],1,4},NY2016_CARD[5][4])
end

function NY2016_exchange_card()
    local szTitle   = "";
    local tbSay     = {};
    tinsert(tbSay,"Dïng 3 thÎ gièng nhau ®æi 1 thÎ chØ ®Şnh/NY2016_exchange_1")
    tinsert(tbSay,"Dïng 4 lo¹i thÎ, mçi lo¹i 1 c¸i vµ 10 Vµng ®Ó ghĞp thµnh 1 thÎ [Nguyªn §¸n Vui VÎ]/NY2016_exchange_2");
    -- tinsert(tbSay,"NY2016_reset_tskid/NY2016_reset_tskid");
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay);
end
--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ,Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı,ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
--t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
--    {id={"id_score", 1,}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
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

--function on_event_server_start() end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí





