--²»¾­³£ÐÞ¸ÄµÄÅäÖÃÏîÐ´ÕâÀï
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\main.lua")

SF2017_DEBUG = 0        -- DEBUGÄ£Ê½¿ª¹Ø£¬¿ªÆôºóÊ¹ÓÃ¡¾´ÖÖÆ»ðÒ©¡¿ÄÜ¹»¿ªÆô¿ØÖÆ²Ëµ¥£¬ÒÔ¼°»áÏÔÊ¾Ò»Ð©·þÎñÆ÷µ÷ÊÔÐÅÏ¢¡£ÍâÍø×¢Òâ¹Ø±Õ¡£
if 1 ~= IsKsGMSystemOpen() then
	SF2017_DEBUG = 0
end
SF2017_DATE_ACT1 = { 20170126, 20170201 } 
SF2017_DATE_ACT2 = { 20170126, 20170201 }
SF2017_DATE_ACT3 = { 20170128, 20170201 } -- »î¶¯3
SF2017_DATE_ACT4_1 = { 20170118, 20170201 } -- »î¶¯4_1
SF2017_DATE_ACT4_2 = { 20170118, 20170125 } -- »î¶¯4_2
SF2017_DATE_ACT5 = { 20170126, 20170201 } -- »î¶¯5

SF2017_SHOP_DATE1 = {20170126, 20170201 } --ÉÌµê¿ª·ÅÈÕÆÚ
SF2017_SHOP_DATE2 = {20170202, 20170208 }
SF2017_SHOP_TIME1 = {0,2400}            --ÔÚÉÌµê¿ª·ÅÈÕÆÚµÄ¿ª·ÅÊ±¼ä
SF2017_SHOP_TIME2 = {0,2400}
SF2017_TREES = {
    szName = "§µo Hoa thô",
    szTemp = "§µo Hoa thô",
    tPos = {
        {200, 1346, 2849},{200, 1341, 2854},{200, 1336, 2859},{200, 1332, 2875},
        {200, 1337, 2880},{200, 1342, 2885},{200, 1361, 2903},{200, 1366, 2908},
        {200, 1370, 2913},{200, 1379, 2922},{200, 1389, 2904},{200, 1396, 2898},
        {200, 1401, 2892},{200, 1416, 2878},{200, 1421, 2873},{200, 1426, 2869},
        {200, 1430, 2863},{200, 1425, 2858},{200, 1418, 2852},{200, 1396, 2834},
        {200, 1391, 2829},{200, 1386, 2823},{200, 1379, 2816},{200, 1374, 2821},
        {200, 1369, 2826},{200, 1364, 2831},{300, 1729, 3497},{300, 1736, 3491},
        {300, 1740, 3498},{300, 1745, 3520},{300, 1750, 3506},{300, 1768, 3524},
        {300, 1773, 3528},{300, 1780, 3535},{300, 1784, 3540},{300, 1789, 3544},
        {300, 1807, 3563},{300, 1793, 3574},{300, 1787, 3578},{300, 1781, 3584},
        {300, 1775, 3589},{300, 1768, 3596},{300, 1751, 3584},{300, 1744, 3577},
        {300, 1738, 3572},{300, 1725, 3562},{300, 1719, 3556},{300, 1714, 3549},
        {300, 1702, 3538},{300, 1696, 3533},{300, 1704, 3523},{300, 1711, 3516},
        {100, 1444, 3007},{100, 1439, 3012},{100, 1433, 3018},{100, 1427, 3024},
        {100, 1421, 3018},{100, 1416, 3012},{100, 1396, 2994},{100, 1389, 2986},
        {100, 1384, 2981},{100, 1390, 2974},{100, 1394, 2969},{100, 1401, 2964},
        {100, 1419, 2945},{100, 1424, 2940},{100, 1429, 2936},{100, 1434, 2941},
        {100, 1440, 2947},{100, 1459, 2967},{100, 1464, 2973},{100, 1470, 2979},
        {100, 1465, 2983},{350, 1476, 2957},{350, 1481, 2962},{350, 1485, 2967},
        {350, 1490, 2971},{350, 1487, 2979},{350, 1482, 2985},{350, 1453, 3014},
        {350, 1446, 3021},{350, 1439, 3026},{350, 1434, 3022},{350, 1429, 3017},
        {350, 1424, 3012},{350, 1405, 2994},{350, 1399, 2987},{350, 1393, 2981},
        {350, 1387, 2975},{350, 1393, 2969},{350, 1400, 2962},{350, 1432, 2937},
        {350, 1439, 2931},{350, 1446, 2926},{350, 1452, 2931},{350, 1457, 2936},

    }
}

SF2017_FUSHEN = {
    szName = "Phóc ThÇn",
    szTemp = "xnhd_fs",
    tPos = {
        [1] = {
            {100,1441,2785,"TuyÒn Ch©u"},{100,1400,2856,"TuyÒn Ch©u"},{100,1284,2953,"TuyÒn Ch©u"},{100,1256,2984,"TuyÒn Ch©u"},
            {100,1312,3023,"TuyÒn Ch©u"},{100,1301,3061,"TuyÒn Ch©u"},{100,1295,3113,"TuyÒn Ch©u"},{100,1378,3157,"TuyÒn Ch©u"},
            {100,1407,3054,"TuyÒn Ch©u"},{100,1435,3098,"TuyÒn Ch©u"},{100,1496,3160,"TuyÒn Ch©u"},{100,1543,3118,"TuyÒn Ch©u"},
            {100,1500,2966,"TuyÒn Ch©u"},{100,1576,3044,"TuyÒn Ch©u"},{100,1651,3010,"TuyÒn Ch©u"},{100,1587,2988,"TuyÒn Ch©u"},
        },
        [2] = {
            {200,1199,2802,"BiÖn Kinh"},{200,1185,2905,"BiÖn Kinh"},{200,1320,3001,"BiÖn Kinh"},{200,1350,3056,"BiÖn Kinh"},
            {200,1440,2954,"BiÖn Kinh"},{200,1538,2951,"BiÖn Kinh"},{200,1482,2875,"BiÖn Kinh"},{200,1613,2861,"BiÖn Kinh"},
            {200,1564,2842,"BiÖn Kinh"},{200,1550,2813,"BiÖn Kinh"},{200,1400,2678,"BiÖn Kinh"},{200,1370,2615,"BiÖn Kinh"},
            {200,1334,2657,"BiÖn Kinh"},{200,1320,2695,"BiÖn Kinh"},{200,1301,2830,"BiÖn Kinh"},{200,1312,2914,"BiÖn Kinh"},
        },
        [3] = {
            {300,1797,3359,"Thµnh §«"},{300,1748,3393,"Thµnh §«"},{300,1851,3419,"Thµnh §«"},{300,1942,3513,"Thµnh §«"},
            {300,1965,3569,"Thµnh §«"},{300,1881,3535,"Thµnh §«"},{300,1868,3615,"Thµnh §«"},{300,1812,3708,"Thµnh §«"},
            {300,1780,3778,"Thµnh §«"},{300,1766,3714,"Thµnh §«"},{300,1753,3637,"Thµnh §«"},{300,1633,3537,"Thµnh §«"},
            {300,1589,3586,"Thµnh §«"},{300,1636,3618,"Thµnh §«"},{300,1737,3475,"Thµnh §«"},
        },
        
    },
    nCnt = 0,           -- ¼ÇÂ¼µ±Ç°¸£ÉñÒÑ¾­·¢·ÅÁË¶àÉÙ·Ö½±Æ·
    lim = 100,          -- ÉèÖÃ×î¶àÄÜ·Å¶àÉÙ·Ö½±Æ·
    nLifeTime = 30*60,  -- ¸£Éñ´æÔÚÊ±¼ä
    nHash = 0,          -- nHashÖµ£¬²»ÓÃ¹Ü
}

SF2017_HDDS = {
    szName = "§¹i Sø Ho¹t §éng Xu©n Míi",
    szTemp = "xnhd_cjhdds",
    tPos = {
        {100, 1429, 3000},
        {300, 1757, 3557},
        {200, 1385, 2894},
    }
}


SF2017_FLOWER = {2, 200, 71, 1, 4, "Hoa §µo"}
SF2017_CLOTHES = {
    {
        {0,108,985,1,"XÝch Viªn Léng H¹c Quan"},
        {0,108,986,1,"XÝch Viªn Léng H¹c Quan"},
        {0,108,987,1,"XÝch Viªn Léng H¹c Quan"},
        {0,108,988,1,"XÝch Viªn Léng H¹c Quan"},
    },
    {
        {0,109,985,1,"XÝch Viªn Léng H¹c y"},
        {0,109,986,1,"XÝch Viªn Léng H¹c y"},
        {0,109,987,1,"XÝch Viªn Léng H¹c y"},
        {0,109,988,1,"XÝch Viªn Léng H¹c y"},
    },
    {
        {0,110,985,1,"XÝch Viªn Léng H¹c Trang"},
        {0,110,986,1,"XÝch Viªn Léng H¹c Trang"},
        {0,110,987,1,"XÝch Viªn Léng H¹c Trang"},
        {0,110,988,1,"XÝch Viªn Léng H¹c Trang"},
    },
}
SF2017_TAOHUA_LIM = 10        --Ã¿Ìì×î¶à²É¶àÉÙ´ÎÌÒ»¨
SF2017_TJL = {2, 97, 236, 1, "Thiªn Kiªu LÖnh"}
SF2017_TGL = {2, 95, 204, 1, "Thiªn Cang LÖnh"}
SF2017_TMJL = {2, 1, 30370, 1, "Thiªn M«n Kim LÖnh"}

SF2017_BYTE_DCTSK = {           -- °´×Ö½Ú´æ´¢±äÁ¿ÉèÖÃ£¨Ã¿ÈÕÇå¿Õ£©
    taohua = 1, -- Ã¿ÈÕ²ÉÌÒ»¨
    fushen = 2, 
    firecrackers = 3,
    box = 4,    -- Ã¿ÈÕÊ°È¡±¦Ïä
}
SF2017_BYTE_TSK = {             -- Í¬ÉÏ£¨²»Çå¿Õ£©
    get_clothes = 1,
    exc_clothes1 = 2,
    exc_clothes2 = 3,
    exc_clothes3 = 4,
}

SF2017_FIRE = {
    normal = {2,200,64,"Háa D­îc S¬ ChÕ"},
    delicate = {2,200,65,"Háa D­îc Tinh ChÕ"},
}
SF2017_FIRECRACKERS = {
    normal = {2,200,66,"Ph¸o S¬ ChÕ"},
    delicate = {2,200,67,"Ph¸o Tinh ChÕ"},
    nUselimit = 25,                     --Ã¿ÈÕÊ¹ÓÃ´ÖÖÆ±ÞÅÚµÄ´ÎÊýÏÞÖÆ
}

SF2017_BOX = {
    szName      = "R­¬ng Xu©n Míi",
    szTemp      = "xnhd_nsdkz",
    tPos        = {100,1408,3189},      -- ÒÔÕâ¸ö×ø±êÎªÔ²ÐÄ¿ªÊ¼Ë¢NPC
    tItem       = {2,200,63,"R­¬ng Xu©n Míi"},
    nLifeTime   = 60,                   -- ´æÔÚÒ»·ÖÖÓ
    nColdTime   = 60,                   -- ²É¼¯ÀäÈ´Ê±¼ä£¬Ä¿µÄÊÇÈÃÍæ¼ÒÔÚÒ»²¨±¦ÏäÀïÖ»ÄÜÄÃÒ»¸ö
    nMaxLimit   = 3,                    -- Ã¿Ìì×î¶à¼ñÈý¸ö±¦Ïä
}

SF2017_MONSTER = {
    szName      = "Niªn thó",
    szTemp      = "xnhd_ns",
    nHp         = 0,                    -- ÁÙÊ±»º´æ£¬»¹Ê£¶àÉÙÑª
    nMaxHp      = 180000,--180000,      -- ÄêÊÞ×î´óÑªÁ¿
    nFlag       = 0,                    -- ÁÙÊ±»º´æ2£¬¾àÀëÉÏ´ÎË¢±¦ÏäÕâ¶ÎÊ±¼äÀï±»´òµô¶àÉÙÑª
    nMaxFlag    = 9000,                 -- Ã¿µô9000µãÑª£¬Ë¢Ò»´Î±¦Ïä
    nRefresh    = 0,                    -- ÁÙÊ±»º´æ3£¬Ã¿ÌìË¢ÁË¶àÉÙ´Î
    nMaxRefresh = 3,                    -- Ã¿Ìì×î¶àË¢3´Î
    nLastDate   = 0,                    -- ÉÏÒ»´ÎË¢³öÀ´µÄÈÕÆÚ£¬ÓÃÀ´´¦Àí¿çÌì
    nIdx        = 0,                    -- ±£´ænpcµÄindex
    tPos        = {100,1408,3189},      -- Î»ÖÃ
    isLife      = 0,                    -- ¼ÇÂ¼ÄêÊÞÏÖÔÚÊÇ·ñ»î×Å
    nDeadTime   = -1,                   -- É¶Ê±ºòËÀµÄ
    nRefreshTime= 30*60,                -- ËÀºó¶à¾ÃË¢ÐÂ 30min
    ActTime     = {{1200,1400},{1900,2400}},-- ÄêÊÞ»î¶¯Ê±¼ä
    nSFX        = 952,                  -- ÌØÐ§id
    DeadCnt     = 0,                    -- ¼ÇÂ¼ÄêÊÞËÀÁË¶àÉÙ´Î
}

SF2017_CARD = {
    silver = {2,200,61,"ThiÖp B¹c Xu©n Míi"},
    gold   = {2,200,62,"ThiÖp Vµng Xu©n Míi"}
}

SF2017_MISSION = {
    low = {488,489,490,491,492,493,494,495},
    mid = {496,497,498,499,500,504,505,506,507,508,509,510,511,512,513},
    high = {501,502,503,514,515,516,517,518,519,520,521,522,523,524},
    limit = 20,                         -- ÊÕ·ÑÈÎÎñ£¬Ã¿Ìì×î¶à20¸ö
    nTJL = 2,                           -- Ò»´ÎÐèÒª2¸öÌì½¾Áî
}

SF2017_BOSS = {
    {"xnhd_bdj","B¸ §ao TuyÖt",309,1457,2953},
    {"xnhd_jjk","Qu©n KiÕm Cuång",309,1269,2984},
    {"xnhd_hdzg","HuyÔn §ao Tæng Qu¶n",321,1704,3479},
    {"xnhd_hjzg","HuyÔn KiÕm Tæng Qu¶n",321,1737,3203},
    {"xnhd_mlxztl","Thñ LÜnh Miªu LÜnh TuÇn Tr¹i",408,1444,2797},
    {"xnhd_qzdymn","D· Mao Ng­u C­êng Tr¸ng",408,1499,3023},
    {"xnhd_hyzg","Hé Ên §¹i Tæng Qu¶n",420,1527,3620},
    {"xnhd_dfr","§¹i phu nh©n",420,1577,3491},
    {"xnhd_sstl","S¸t Thñ §Çu LÜnh",600,1364,3058},
    {"xnhd_gstl","Cung Thñ §Çu LÜnh",600,1373,2912},
    {"xnhd_cykh","Th¶o Nguyªn Kh¾c H·n",600,1540,2899},
    {"xnhd_yztm","DÞ Téc §Çu Môc",601,1447,2963},
    {"xnhd_ljsl","Liªu Qu©n Thñ LÜnh",602,1500,2988},
}

SF2017_FINISH_TASK = {
    [1] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },--+487
    [2] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [3] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [4] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [5] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [6] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [7] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [8] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [9] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [10] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [11] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [12] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [13] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [14] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [15] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [16] = { 300, "§¹i Sø Ho¹t §éng Xu©n Míi" },
    [17] = { 300, "A ThÞnh" },
    [18] = { 300, "Chu ThiÖn Nh©n" },
    [19] = { 200, "Tµo §¹i Lùc" },
    [20] = { 200, "Vò N­¬ng" },
    [21] = { 350, "Hµn NghÜa" },
    [22] = { 350, "Tr­¬ng ¶nh" },
    [23] = { 150, "H¹ HÇu Anh" },
    [24] = { 150, "M·nh Nham " },
    [25] = { 100, "H¹ KiÖt" },
    [26] = { 100, "Chung Phãng" },
    [27] = { 300, "A ThÞnh" },
    [28] = { 300, "Chu ThiÖn Nh©n" },
    [29] = { 200, "Tµo §¹i Lùc" },
    [30] = { 200, "Vò N­¬ng" },
    [31] = { 350, "Hµn NghÜa" },
    [32] = { 350, "Tr­¬ng ¶nh" },
    [33] = { 350, "Lôc Tróc ¤ng" },
    [34] = { 200, "Vò N­¬ng" },
    [35] = { 300, "ThÇy bãi" },
    [36] = { 300, "ThÇy bãi" },
    [37] = { 300, "ThÇy bãi" },
}

SF2017_WUSHI = {0, 105, 30044, "L©n S­"}


function SF2017_MONSTER:Init()
    local nDate = tonumber( date("%Y%m%d") );
    if nDate > SF2017_MONSTER.nLastDate then SF2017_MONSTER.nRefresh = 0 end  -- µÚ¶þÌìÖØÖÃË¢ÐÂÊý
    if SF2017_MONSTER.nRefresh >= SF2017_MONSTER.nMaxRefresh then return end
    if SF2017_MONSTER.isLife == 1 then return end
    local npcidx = CreateNpc(SF2017_MONSTER.szTemp,SF2017_MONSTER.szName,SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3])
    SF2017_MONSTER.nIdx     = npcidx
    SF2017_MONSTER.nLastDate= nDate
    SF2017_MONSTER.nHp      = SF2017_MONSTER.nMaxHp
    SF2017_MONSTER.Flag     = 0
    SF2017_MONSTER.nRefresh = SF2017_MONSTER.nRefresh + 1
    SF2017_MONSTER.isLife   = 1
    SF2017_MONSTER.nDeadTime= -1
    if npcidx ~= 0 then 
        Msg2Global("Niªn Thó ®ang xuÊt hiÖn ë TuyÒn Ch©u, c¸c ®¹i hiÖp h·y mau ®Õn ®ã, dïng Ph¸o ®uæi nã ®Ó giµnh phÇn th­ëng!")
    end
end

function SF2017_MONSTER:Die()
    local nDate = tonumber( date("%Y%m%d") );
    SF2017_MONSTER.isLife = 0
    SetNpcLifeTime(SF2017_MONSTER.nIdx,0)
    SF2017_MONSTER.nDeadTime = GetTime()
    SF2017_MONSTER.DeadCnt = SF2017_MONSTER.DeadCnt + 1;
end

function CreateBox(nPosm,nPosx,nPosy,nNum)
    local nRangeX,nRangeY = 22,22;
    for i = 1, nNum do
        local nX = nPosx + random(-nRangeX,nRangeX);
        local nY = nPosy + random(-nRangeY,nRangeY);
        local nidx = CreateNpc(SF2017_BOX.szTemp,SF2017_BOX.szName,nPosm,nX,nY)
        SetNpcLifeTime(nidx,SF2017_BOX.nLifeTime)
    end
end 

function SF2017_MONSTER:BeAttacked(nNum,nType,nUsed)  -- nNum ÎªÉËº¦Öµ
    if SF2017_MONSTER.nIdx == 0 then return end
    SetCurrentNpcSFX(SF2017_MONSTER.nIdx,SF2017_MONSTER.nSFX,1,0,18)
    SF2017_MONSTER.nHp = SF2017_MONSTER.nHp - nNum
    SF2017_MONSTER.nFlag = SF2017_MONSTER.nFlag + nNum
    local szType = SF2017_FIRECRACKERS.normal[4]
    if nType == 2 then szType = SF2017_FIRECRACKERS.delicate[4] end
    
    local tItem = {}
    if nType == 1 then 
        tItem = SF2017_CARD.silver 
        AddItemWithJudge(tItem[1],tItem[2],tItem[3],nNum,4,tItem[4])
    else  
        tItem = SF2017_CARD.gold 
        for i = 1, nUsed do
            local nRand = random(1,100)
            if nRand <= 70 then
                gf_AddItemEx({tItem[1],tItem[2],tItem[3],1,4},tItem[4])
            end
        end
    end
    if  SF2017_MONSTER.nHp <= 0 then 
        SF2017_MONSTER:Die()
        Talk(1,"","Niªn Thó sî qu¸ bá ch¹y råi, ®Ó l¹i trªn mÆt ®Êt R­¬ng Xu©n Míi.")
        Msg2Global("Niªn Thó sî qu¸ bá ch¹y råi, ®Ó l¹i trªn mÆt ®Êt R­¬ng Xu©n Míi.")
        CreateBox(SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3],100)
        return
    end
    if SF2017_MONSTER.nFlag >= SF2017_MONSTER.nMaxFlag then
        SF2017_MONSTER.nFlag = SF2017_MONSTER.nFlag - SF2017_MONSTER.nMaxFlag -- BOSS¾ª»Å·Å³ö±¦Ïä
        Talk(1,"","Niªn Thó bÞ ho¶ng sî, ®Ó l¹i trªn mÆt ®Êt mét sè R­¬ng Xu©n Míi.")
        Msg2Global("Niªn Thó bÞ ho¶ng sî, ®Ó l¹i trªn mÆt ®Êt mét sè R­¬ng Xu©n Míi.")
        CreateBox(SF2017_MONSTER.tPos[1],SF2017_MONSTER.tPos[2],SF2017_MONSTER.tPos[3],50)
        return
    end
    Talk(1,"",format("B¹n ®· sö dông <color=gold>%s<color> víi Niªn Thó, g©y cho nã <color=red>%d<color> ®iÓm s¸t th­¬ng. HiÖn ®iÓm sî h·i cña Niªn Thó lµ <color=red>%d/%d<color>.",szType,nNum,SF2017_MONSTER.nMaxHp-SF2017_MONSTER.nHp,SF2017_MONSTER.nMaxHp))
end

function Die()
    SF2017_MONSTER:Die()
end

function MonsterTalk()
    Talk(1,"",format("<color=green>%s<color>: Gõ gõ?",SF2017_MONSTER.szName))
end

function showdetail()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    print("\n\n-------------------------------")
    print("F2017_MONSTER.nHp:",SF2017_MONSTER.nHp)
    print("SF2017_MONSTER.nMaxHp",SF2017_MONSTER.nMaxHp)
    print("SF2017_MONSTER.nFlag",SF2017_MONSTER.nFlag)
    print("SF2017_MONSTER.nMaxFlag",SF2017_MONSTER.nMaxFlag)
    print("SF2017_MONSTER.nRefresh",SF2017_MONSTER.nRefresh)
    print("SF2017_MONSTER.nMaxRefresh",SF2017_MONSTER.nMaxRefresh)
    print("SF2017_MONSTER.nLastDate",SF2017_MONSTER.nLastDate)
    print("SF2017_MONSTER.nIdx",SF2017_MONSTER.nIdx)
    print("SF2017_MONSTER.DeadCnt",SF2017_MONSTER.DeadCnt)
    print("-------------------------------\n\n")
end
function sf2017_Debug()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    if SF2017_DEBUG == 1 then
        local szTitle = format("<color=green>%s<color>:Debug Mode",SF2017_MONSTER.szName)
        local tbSay  = {}
        tinsert(tbSay,"HiÓn thÞ th«ng tin chi tiÕt Niªn Thó/showdetail")
        tinsert(tbSay,"Xãa Niªn Thó (Sau khi reload script, chØ lÖnh nµy sÏ mÊt t¸c dông)/Die")
        tinsert(tbSay,"T¨ng Ph¸o S¬ ChÕ/#AddItem(2,200,66,100)")
        tinsert(tbSay,"T¨ng Ph¸o Tinh ChÕ/#AddItem(2,200,67,100)")
        tinsert(tbSay,"T¨ng Háa D­îc S¬ ChÕ/#AddItem(2,200,64,100)")
        tinsert(tbSay,"T¨ng Háa D­îc Tinh ChÕ/#AddItem(2,200,65,100)")
        tinsert(tbSay,"T¹o Niªn Thó/_refresh_monster")
        tinsert(tbSay,"T¹o Phóc ThÇn/#_refresh_fushen(1)")
        tinsert(tbSay,"ThiÕt lËp l¹i toµn bé biÕn l­îng/sf2017_reset")
        tinsert(tbSay,"Hñy bá/nothing")
        Say(szTitle,getn(tbSay),tbSay)
    end
end
function sf2017_reset()
    if 1 ~= IsKsGMSystemOpen() then
		return
	end
    for i=2782,2791 do SetTask(i,0)end
end
