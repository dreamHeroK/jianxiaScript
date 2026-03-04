--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "tong_extension",
    szViewName 			= "M?r閚g t輓h n╪g bang h閕",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
 TongExt_szThisFile = "\\script\\isolate\\functions\\tong_extension\\main.lua"
-----------------------Tong Extension Config-----------------------
 TongExt_TONG_MAX_CASH             = 12000

 TongExt_TSKID_SELF_LIVENESS       = 3472
 TongExt_TSKID_LIVENESSPERWEEK     = 3474
 TongExt_TSKID_ROB_LIMIT           = 3479 -- 每天第一次抢杀别帮boss可获得活跃度
 TongExt_TSKACCESSCODE_LIVENESS    = 0
 TongExt_LIVENESSPERWEEK_LIMIT     = 84 -- 玩家每周可以获得的有上限活跃度
 TongExt_MAX_SELF_LIVENESS         = 18000
 TongExt_TONG_DEFAULT_CASH         = 100

 TongExt_Activity_1v1_times = 3487
 TongExt_Activity_3v3_times = 3488
-----------------------Tong Extension Devotion-----------------------
-- 捐赠物品，由于目前只用一个任务变量保存信息，物品种类最多可以支持9种。每种每天最多可以捐赠9次。
 TongExt_TSKID_DEVOTION_LIMIT      = 3473

 TongExt_DEVOTION_CONFIG = {
    -- 表格格式 ： {物品名, {物品 g d p n}, 获得活跃度, 获得帮会资金, 每周次数 }
    { "Thi猲 Cang L謓h", { 2,95,204,1 },  350,  350,  9 },
    { "Thi猲 M玭 Kim L謓h", { 2,1,30370,1 },  350,  350,  9 },
    { "Thi猲 Ki猽 L謓h", { 2,97,236,1 },  10,  10,  9 },
}

-----------------------Tong Extension Totem-----------------------
 TongExt_BOSS_LIVE_TIME = 60*60
 TongExt_BOSS_SUMMON_TICKET_IDX = {
    PackItemId(2,1,31211),
    PackItemId(2,1,31212),
    PackItemId(2,1,31213),
    PackItemId(2,1,31214),
    PackItemId(2,1,31215),
    PackItemId(2,1,31216),
    PackItemId(2,1,31217),
    PackItemId(2,1,31218),
    PackItemId(2,1,31219),
    PackItemId(2,1,31220),
 }
 TongExt_BOSS_SUMMON_TICKET = {
    [PackItemId(2,1,31211)] = { "у Щng Tri謚 G鋓 Ph?C蕄 1","tong_juxiang","C?Tng",1 },
    [PackItemId(2,1,31212)] = { "у Щng Tri謚 G鋓 Ph?C蕄 2","tong_tongbiyuan","Th玭g T?Vi猲",2 },
    [PackItemId(2,1,31213)] = { "у Щng Tri謚 G鋓 Ph?C蕄 3","tong_zhujian","Gia Ki襫",3 },
    [PackItemId(2,1,31214)] = { "у Щng Tri謚 G鋓 Ph?C蕄 4","tong_lingjiu","Linh T鵸",4 },
    [PackItemId(2,1,31215)] = { "у Щng Tri謚 G鋓 Ph?C蕄 5","tong_huxian","H?Ti猲",5 },
    [PackItemId(2,1,31216)] = { "у Щng Tri謚 G鋓 Ph?C蕄 6","tong_zhujiuyin","Ch骳 C鰑 ",6 },
    [PackItemId(2,1,31217)] = { "у Щng Tri謚 G鋓 Ph?C蕄 7","tong_jialouluo","Ph鬾g Ho祅g",7 },
    [PackItemId(2,1,31218)] = { "у Щng Tri謚 G鋓 Ph?C蕄 8","tong_fengxi","Phong Hi",8 },
    [PackItemId(2,1,31219)] = { "у Щng Tri謚 G鋓 Ph?C蕄 9","tong_baize","B筩h Tr筩h",9 },
    [PackItemId(2,1,31220)] = { "у Щng Tri謚 G鋓 Ph?C蕄 10","tong_wushen","V?Th竛h",10 },
}
 TongExt_TOTEM_INFO = {
    -- { 图腾兽名， 兽魂物品id， 升级时消息提示， 升级后周资金消耗，福利商店id, 开启时消耗资金,开启后发送礼包等级 }
    {"图腾",   PackItemId(2,1,31221),"C?Tng tr?th祅h Th?H?у Щng m韎 c馻 bang, m?Ti謒 Ph骳 L頸 c蕄 1.", 350, 1 ,700, 0},
    {"图腾", PackItemId(2,1,31222),"Th玭g T?Vi猲 tr?th祅h Th?H?у Щng m韎 c馻 bang.", 700, 1, 1400, 0},
    {"图腾",   PackItemId(2,1,31223),"Gia Ki襫 tr?th祅h Th?H?у Щng m韎 c馻 bang, m?ho箃 ng bang-Kinh Th?Thi誸 T芻", 1100, 1, 2200, 0},
    {"图腾",   PackItemId(2,1,31224),"Linh T鵸 tr?th祅h Th?H?у Щng m韎 c馻 bang, m?Ti謒 Ph骳 L頸 c蕄 2. Bang ch?v?trng l穙 c?th?ph竧 ph骳 l頸 ?ch?Qu秐 Gia Bang.", 1450, 2, 2900, 1},
    {"图腾",   PackItemId(2,1,31225),"H?Ti猲 tr?th祅h Th?H?у Щng m韎 c馻 bang.", 1890, 2, 3780, 1},
    {"图腾", PackItemId(2,1,31226),"Ch骳 C鰑  tr?th祅h Th?H?у Щng m韎 c馻 bang.", 2470, 2, 4940, 1},
    {"图腾g", PackItemId(2,1,31227),"Ph鬾g Ho祅g tr?th祅h Th?H?у Щng m韎 c馻 bang, m?Ti謒 Ph骳 L頸 c蕄 3. Ph骳 l頸 bang t╪g c蕄.", 2750, 3, 5500, 2},
    {"图腾",   PackItemId(2,1,31228),"Phong Hi tr?th祅h Th?H?у Щng m韎 c馻 bang.", 3500, 3, 7000, 2},
    {"B图腾",   PackItemId(2,1,31229),"B筩h Tr筩h tr?th祅h Th?H?у Щng m韎 c馻 bang.", 4500, 3, 9000, 2},
    {"图腾",   PackItemId(2,1,31230),"V?Th竛h tr?th祅h Th?H?у Щng m韎 c馻 bang, ph骳 l頸 bang h閕 t╪g.", 6000, 3, 12000, 3},
}

 TongExt_SHOP_INFO = {
     [1] = {3097,"Ti謒 Ph骳 L頸 Bang C蕄 1"},
     [2] = {3098,"Ti謒 Ph骳 L頸 Bang C蕄 2"},
     [3] = {3099,"Ti謒 Ph骳 L頸 Bang C蕄 3"},
 }

 TongExt_TOTEM_BOSS_SOUL = {
    {"tong_juxiangzhihun","C?Tng Chi H錸",{ 301,304,308 }},
    {"tong_tongbiyuanzhihun","Th玭g T?Vi猲 Chi H錸",{201,203,205}},
    {"tong_zhujianzhihun","Gia Ki襫 Chi H錸",{105,108}},
    {"tong_lingjiuzhihun","Linh T鵸 Chi H錸",{401}},
    {"tong_hunxianzhihun","H?Ti猲 Chi H錸",{218}},
    {"tong_zhujiuyinzhihun","Ch骳 C鰑  Chi H錸",{406}},
    {"tong_jialouluozhihun","Ph鬾g Ho祅g Chi H錸",{106}},
    {"tong_fengxizhihun","Phong Hi Chi H錸",{504}},
    {"tong_baizezhihun","B筩h Tr筩h Chi H錸",{402}},
    {"tong_wushenzhihun","V?Th竛h Chi H錸",{507}},
}

TongExt_ROB_TOTEM_BOSS_GET_CASH = {  -- 抢别的帮会的图腾兽可以为自己帮会提供资金
    12,
    25,
    37,
    75,
    150,
    300,
    600,
    600,
    600,
    1000,
}

 TongExt_BOSS_SOUL_LIFETIME = 60*30
-----------------------Tong Extension Gift-----------------------
 TongExt_TONG_GIFT = {
    { "Ph竧 t苙g Ph骳 L頸 c蕄 1 (Ti猽 hao 1000 ng﹏ qu?bang h閕)", 1000, 4 ,"T骾 Qu?Ph骳 L頸 Bang C蕄 1" ,"tong_free1", {2, 1, 31208} },
    { "Ph竧 t苙g Ph骳 L頸 c蕄 2 (Ti猽 hao 2000 ng﹏ qu?bang h閕)", 2000, 7 ,"T骾 Qu?Ph骳 L頸 Bang C蕄 2" ,"tong_free2", {2, 1, 31209} },
    { "Ph竧 t苙g Ph骳 L頸 c蕄 3 (Ti猽 hao 3500 ng﹏ qu?bang h閕)", 3500, 10,"T骾 Qu?Ph骳 L頸 Bang C蕄 3" ,"tong_free3", {2, 1, 31210} },
}

 TongExt_TONG_AWARD = {
     [PackItemId(2, 1, 31208)] = {"tong_free1"},
     [PackItemId(2, 1, 31209)] = {"tong_free2"},
     [PackItemId(2, 1, 31210)] = {"tong_free3"},
     [PackItemId(2, 1, 31231)] = {"4xingjinshe"},
 }
-- 记录 { npcidx ={ tongidx, endtime, nType, szTongName }  }
 TongExt_BOSS_BUFF = {}

-- 记录 { npcidx ={ tongid }  }
 TongExt_BOSS_SOUL_BUFF = {}


TongExt_BOSS_MATERIAL = {
	[PackItemId(2,0,737)] = {1, "T?Quang Kim Thi襫 Ti",3481, 50},
	[PackItemId(2,0,736)] = {2, "T?Quang K?L﹏ V?",3482, 50},
	[PackItemId(2,0,739)] = {3, "Thng C?K?L﹏ Huy誸",3483, 50},
	[PackItemId(2,0,738)] = {4, "M秐h Ti謙 Ho祅h Th?",3484, 50},
	[PackItemId(2,0,735)] = {5, "T?Quang Li謙 Di謒 C萴",3485, 50},
}
TongExt_BOSS_MATERIAL_IDX = {
    PackItemId(2,0,737),
    PackItemId(2,0,736),
    PackItemId(2,0,739),
    PackItemId(2,0,738),
    PackItemId(2,0,735),
}

TongExt_BOSS_TICKET_COST = {
    { 5,5,5,5,5 },
    { 10,10,10,10,10 },
    { 15,15,15,15,15 },
    { 30,30,30,30,30 },
    { 60,60,60,60,60 },
    { 120,120,120,120,120 },
    { 240,240,240,240,240 },
    { 480,480,480,480,480 },
    { 960,960,960,960,960 },
    { 1920,1920,1920,1920,1920 },
}

 
function handle_count_time()
    for k,v in TongExt_BOSS_BUFF do
        local nTongID  = v[1]
        local nResTime = v[2] - GetTime();
        local nType    = v[3]
        local szName   = TongExt_TOTEM_INFO[nType][1]
        local nOffset  = 60; -- 判断时间的误差值
        if      nResTime <= 0   then  TongExt_BossOverTime(k)
        elseif  nResTime - 60 < nOffset and  nResTime - 60 >= 0  then  SendTongMessageByTongID(nTongID, format("%s mu鑞 ch箉 tr鑞, h穣 tranh th?th阨 gian tr?kh?h緉. (C遪 1 ph髏 )",szName))
        elseif  nResTime - 5*60 < nOffset and nResTime - 5*60 >= 0 then  SendTongMessageByTongID(nTongID, format("%s mu鑞 ch箉 tr鑞, h穣 tranh th?th阨 gian tr?kh?h緉. (C遪 5 ph髏 )",szName))
        elseif  nResTime - 10*60 < nOffset and nResTime - 10*60 >= 0  then  SendTongMessageByTongID(nTongID, format("%s mu鑞 ch箉 tr鑞, h穣 tranh th?th阨 gian tr?kh?h緉. (C遪 10 ph髏 )",szName))
        end
    end
end

function TongExt_ActionAward(nLiveness,nCash,szType)
    if nLiveness == 0 or nCash == 0 then 
        return
    end
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nCurLivenessPerWeek = GetTask(TongExt_TSKID_LIVENESSPERWEEK);
    local nPVPLiveness = floor(mod(nCurLivenessPerWeek , 10000))
    local nPVELiveness = floor(nCurLivenessPerWeek / 10000)
    local nTargetLiveness = nPVELiveness
    if szType == "PVP" then 
        nTargetLiveness = nPVPLiveness
    end
    local nLivenessAdd = nLiveness;
    if nTargetLiveness + nLiveness > TongExt_LIVENESSPERWEEK_LIMIT then
        nLivenessAdd = TongExt_LIVENESSPERWEEK_LIMIT - nTargetLiveness;
        if nLivenessAdd < 0 then
            nLivenessAdd = 0;
        end
    end
    if nLivenessAdd ~= nLiveness then
        Msg2Player(format("Do tu莕 n祔  t輈h c鵦 c?nh﹏ c馻 ho箃 ng %s  t gi韎 h筺, ho箃 ng l莕 n祔 nh薾 頲 %d  t輈h c鵦 v?t╪g ng﹏ qu?bang h閕 c飊g m鴆 cho bang h閕. C騨g c?th?n Bi謓 Kinh [Qu秐 Gia Bang] nh薾 th猰 t輈h c鵦 c?nh﹏ v?ng﹏ qu?bang h閕 khi quy猲 g鉷.",szType,nLivenessAdd));
    else
        Msg2Player(format("Ho箃 ng l莕 n祔 nh薾 頲 %d  t輈h c鵦 v?t╪g ng﹏ qu?bang h閕 c飊g m鴆 cho bang h閕.",nLivenessAdd));
    end

    if szType == "PVP" then 
        nPVPLiveness = nPVPLiveness + nLivenessAdd
    else
        nPVELiveness = nPVELiveness + nLivenessAdd
    end
    local AfterLiveness = nPVELiveness * 10000 + nPVPLiveness
    SetTask(TongExt_TSKID_LIVENESSPERWEEK, AfterLiveness)

    TongExt_AddTongCash( nLivenessAdd,true )
    TongExt_AddLiveness( nLivenessAdd,true )
end

function TongExt_ActionCompleted(tEvent, data, para)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nLiveness,nCash,szType = unpack(tEvent[4])
    TongExt_ActionAward(nLiveness, nCash, szType)
end

function TongExt_CreateTong()
    AddTongCash(TongExt_TONG_DEFAULT_CASH)            -- 新创建的帮会直接给加100块
end

function TongExt_LeaveTong()
    --  退帮的时候，删光召唤券和兽魂
    for i = 1 ,getn(TongExt_BOSS_SUMMON_TICKET_IDX) do
        local nItem = TongExt_BOSS_SUMMON_TICKET_IDX[i];
        local g,d,p = UnPackItemId(nItem);
        local nCnt = BigGetItemCount(g,d,p);
        BigDelItem(g,d,p,nCnt);
    end
    for i = 1 ,getn(TongExt_TOTEM_INFO) do
        local nItem = TongExt_TOTEM_INFO[i][2];
        local g,d,p = UnPackItemId(nItem);
        local nCnt = BigGetItemCount(g,d,p);
        BigDelItem(g,d,p,nCnt);
    end
end

function TongExt_1v1_Award()
    local nCurBiwudahui = GetTask(TSK_CURWEEKMATCH)
    local nTimes = GetTask(TongExt_Activity_1v1_times) -- 领取的胜场次数
    TongExt_ActionAward(nCurBiwudahui - nTimes, nCurBiwudahui - nTimes, "PVP")
    SetTask(TongExt_Activity_1v1_times, nCurBiwudahui)
end

function TongExt_3v3_Award()
    local nCur3V3   = GetTask(TASKID_3V3_TOTAL_ROUND_DAILY)
    local nTimes = GetTask(TongExt_Activity_3v3_times) -- 领取的胜场次数
    SetTask(TongExt_Activity_3v3_times, nCur3V3)
    TongExt_ActionAward(nCur3V3 - nTimes, nCur3V3 - nTimes, "PVP")
end


t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
   {id={"id_self_liveness", TongExt_TSKID_SELF_LIVENESS, TSKACCESSCODE_LIVENESS} }, 
   {id={"id_devotion_limit", TongExt_TSKID_DEVOTION_LIMIT, 0}, clear = "weekly" }, 
   {id={"id_liveness_per_week", TongExt_TSKID_LIVENESSPERWEEK, 0}, clear = "weekly" }, 
   {id={"id_rob_limit", TongExt_TSKID_ROB_LIMIT, 0}, clear = "daily" }, 
   {id={"id_handin_mat_limit_week1", 3481, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week2", 3482, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week3", 3483, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week4", 3484, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week5", 3485, 0}, clear = "weekly" }, 
   {id={"TongExt_Activity_1v1_times", TongExt_Activity_1v1_times, 0}, clear = "weekly" }, 
   {id={"TongExt_Activity_3v3_times", TongExt_Activity_3v3_times, 0}, clear = "daily" }, 
   
}

t_isolate_user_batch_watch_list = { 
    {"event_server_tick_minute",{1},handle_count_time,{ }},
    -- {"event_mission_affairs", {"3v3", "finished", 0}, TongExt_ActionCompleted,{ 1, 1, "PVP" }  },
    {"event_mission_affairs", {"newbattle", "resourcefinished", 0}, TongExt_ActionCompleted,{ 5, 5, "PVP" }  },
    -- {"event_mission_award", {"biwudahui", -1, -1, 0}, TongExt_ActionCompleted,{ 1, 1, "PVP" }  },
    {"event_mission_award", {"tianmenzhen", -1, -1, 0}, TongExt_ActionCompleted,{ 5, 5, "PVP" }  },
	{"event_mission_award", {"kfbattle", -1, -1, 0}, TongExt_ActionCompleted,{ 5, 5, "PVP" }  },
    
	{"event_mission_stage_finish", {"dixuangong", 3}, TongExt_ActionCompleted,{ 1, 1, "PVE" }  },
	{"event_mission_stage_finish", {"wanjianzhong", 4}, TongExt_ActionCompleted,{ 1, 1, "PVE" }  },
	{"event_mission_stage_finish", {"taiyi", 6}, TongExt_ActionCompleted,{ 2, 2, "PVE" }  },
    {"event_mission_stage_finish", {"taiyihero", 6}, TongExt_ActionCompleted,{ 4, 4, "PVE" } },	---英雄太一塔通过最后一关 200 材料3
	{"event_mission_stage_finish", {"liangshan", 4}, TongExt_ActionCompleted,{ 1, 1, "PVE" }  },
	{"event_mission_stage_finish", {"jiandangyanyun", 5}, TongExt_ActionCompleted,{ 2, 2, "PVE" }  },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, TongExt_ActionCompleted,{ 2, 2, "PVE" }  },


    {"event_player_tong_operation", {"create",-1,-1}, TongExt_CreateTong, },
    {"event_player_tong_operation", {"leave",-1,-1}, TongExt_LeaveTong, },
    
}


function on_add_watches()
    for k,v in TongExt_BOSS_SUMMON_TICKET do
        local g,d,p = UnPackItemId(k)
        isolate_watch_item_talk(g,d,p, "TongExt_OnUseTicket")
    end
    for k,v in TongExt_TOTEM_BOSS_SOUL do
        local tMaps = v[3];
        for i = 1,getn(tMaps) do
            isolate_watch_npc_talk(v[2], tMaps[i], "TongExt_Talk2BossSoul");
        end
    end
    for k,v in TongExt_TONG_AWARD do
        local g,d,p = UnPackItemId(k)
        isolate_watch_item_talk(g,d,p, "TongExt_OnUseGift")
    end
end

function TongExt_OnUseGift(nIndex)
    local g,d,p = GetItemInfoByIndex(nIndex)
    local nId = PackItemId(g,d,p)
    local t = TongExt_TONG_AWARD[nId]
    if t then
       local szAward = t[1]
       if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
           return 0
       end
       if DelItemByIndex(nIndex, 1) == 1 then
           if CustomAwardGiveGroup(szAward, 0) > 0 then   --二号参数为是否给予全部奖励
              return 1
           else
              AddItem(g,d,p, 1,4)
           end
       end
    end
end



function TongExt_Talk2BossSoul(nPara)
    local nBossSoul = GetTargetNpc();
    local szNpcName = GetTargetNpcName();
    local tongId = TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)][1];
    local nType = TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)][2];
    if GetTongID() ~= tongId then
        Talk(1,"","Th?H錸 n祔 tr?n猲 b譶h t躰h vui v? kh玭g c遪 hung 竎 nh?trc. H譶h nh?n?產ng n鉯 g?, nh璶g ti誧 l?ngi kh玭g th?hi觰 頲.")
        return 
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
		Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C竚 琻 m鋓 ngi  gi髉 ta tho竧 kh醝 s?th?h薾, ta c?m鉵 qu?mu鑞 t苙g, h穣 n鉯 bang ch?ho芻 trng l穙 n y, h譶h th竔 c馻 ta kh玭g th?duy tr?qu?l﹗."))
		return
	end
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C竚 琻 c竎 ngi  gi髉 ta tho竧 kh醝 s?th?h薾, ta s?t苙g Th?H錸 cho c竎 ngi, hy v鋘g s鴆 m筺h c馻 n?gi髉 輈h cho bang c馻 ngi.");
    local tbSay = {}
    tinsert(tbSay,format("Nh薾 Th?H錸/#TongExt_GetBossSoul(%d)",nType))
    tinsert(tbSay,"H駓 b?nothing")
    Say(szTitle,getn(tbSay),tbSay);
end

function TongExt_GetBossSoul( nType )
    local nBossSoul = GetTargetNpc();
    if nBossSoul == nil or nBossSoul <= 0 or TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] == nil then
        Talk(1,"","Th?H錸  bi課 m蕋......")
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end
    local g,d,p = UnPackItemId(TongExt_TOTEM_INFO[nType][2]);
    SetNpcLifeTime(nBossSoul,0);
    AddItem(g,d,p,1);
    SendTongMessage(format("%s  nh薾 Th?H錸 c蕄 %d.",GetName(),nType));
    TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] = nil;
end

function TongExt_GetTaskByDecimal(nTskID, nPos)
    if nPos <= 0 or nPos > 9 then
        print("[error] TongExt_SetTaskByDecimal can not call by param nPos = %d\n",nPos);
        return 
    end
    local nTskVar = GetTask(nTskID)
    local nFlag = 10^(nPos - 1)
    local nRes = mod(floor(nTskVar / nFlag), 10);
    return nRes;
end

function TongExt_SetTaskByDecimal(nTskID, nPos, nVar)
    if nPos <= 0 or nPos > 9 then
        print("[error] TongExt_SetTaskByDecimal can not call by param nPos = "..nPos);
        return 
    end
    if nVar < 0 or nVar > 9 then
        print("[error] TongExt_SetTaskByDecimal can not call by param nVar = "..nVar);
        return 
    end
    local nTskVar = GetTask(nTskID)
    local nFlag = 10^(nPos - 1)
    local nCurRes = mod(floor(nTskVar / nFlag), 10);
    nTskVar = nTskVar + (nVar - nCurRes) * nFlag;
    SetTask(nTskID, nTskVar)
end

function TongExt_DevotionTalk()
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Kh玭g ph秈 th祅h vi猲 bang, h穣 gia nh藀 1 bang."))
        return
    end
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "V藅 ph萴 di y c?th?g鉷, c?nh﹏ nh薾 頲  t輈h c鵦, bang nh薾 頲 ng﹏ qu?bang h閕")
    local tbSay = {}
    for i = 1, getn(TongExt_DEVOTION_CONFIG) do
        local tbDevotion = TongExt_DEVOTION_CONFIG[i]
        local nTimes = TongExt_GetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, i)
        tinsert( tbSay,format("G鉷 %d %s, nh薾 頲 %d  t輈h c鵦, t╪g cho bang h閕 %d 甶觤 ng﹏ qu?bang h閕. (C遪 %d/%d l莕)/#TongExt_Devote(%d)", tbDevotion[2][4], tbDevotion[1], tbDevotion[3], tbDevotion[4], nTimes, tbDevotion[5], i) )
    end
    tinsert( tbSay,"T筸 bi謙!/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_Devote( nType )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Kh玭g ph秈 th祅h vi猲 bang, h穣 gia nh藀 1 bang."))
        return
    end
    local nTimes = TongExt_GetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, nType)
    local tbDevotion = TongExt_DEVOTION_CONFIG[nType]
    if nTimes >= tbDevotion[5] then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "S?l莕 g鉷 tu莕 n祔  y, tu莕 sau h穣 g鉷 ti誴."))
        return
    end
    local nCount = GetItemCount(tbDevotion[2][1],tbDevotion[2][2],tbDevotion[2][3])
    if nCount < tbDevotion[2][4] then
        Talk(1,"",format("<color=gold>%s:<color> %s kh玭g , h穣 mang  %d r錳 n.", GetTargetNpcName(), tbDevotion[1], tbDevotion[2][4]))
        return
    end
    if DelItem(tbDevotion[2][1],tbDevotion[2][2],tbDevotion[2][3],tbDevotion[2][4]) ~= 1 then
        Talk(1,"",format("<color=gold>%s:<color> G鉷 th蕋 b筰, h穣 th?l筰 sau.", GetTargetNpcName()))
        return
    end
    TongExt_SetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, nType, nTimes+1);
    TongExt_AddLiveness( tbDevotion[3] )
    TongExt_AddTongCash( tbDevotion[4] )
    SendTongMessage(format("%s  t苙g %d %s, nh薾 頲 %d  t輈h c鵦 bang h閕, t╪g cho bang h閕 %d 甶觤 ng﹏ qu?bang h閕",GetName(),tbDevotion[2][4],tbDevotion[1],tbDevotion[3],tbDevotion[4]))
    TongExt_DevotionTalk()
end


function TongExt_AddLiveness( nVar, withoutMsg )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nCurSelfLiveness = GetTask(TongExt_TSKID_SELF_LIVENESS);
    local nNewSelfLiveness = nCurSelfLiveness + nVar;
    local nRealAddition    = nVar
    if nNewSelfLiveness < 0 then nVar = 0 end
    if nNewSelfLiveness > TongExt_MAX_SELF_LIVENESS then 
        nNewSelfLiveness = TongExt_MAX_SELF_LIVENESS 
        Msg2Player("T輈h c鵦 c?nh﹏  t gi韎 h筺.")
    end
    if withoutMsg == nil then 
        Msg2Player(format("B筺 nh薾 頲 %d  t輈h c鵦 bang h閕.",nVar))
    end
    SetSelfLiveness(nNewSelfLiveness);
    AddTongLiveness(nVar);
end

function TongExt_AddTongCash( nVar, withoutMsg )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nCash = GetTongCash();
    local nAddCash = nVar
    if nCash + nVar > TongExt_TONG_MAX_CASH then
        nAddCash = TongExt_TONG_MAX_CASH - nCash;
    end
    AddTongCash(nAddCash);
    if withoutMsg ~= nil then
        return -- 不要信息
    end
    if nAddCash == nVar then
        Msg2Player(format("Bang h閕 c馻 b筺 nh薾 頲 %d 甶觤 ng﹏ qu?bang h閕.",nVar))
    else
        Msg2Player(format("Bang h閕 c馻 b筺 nh薾 頲 %d 甶觤 ng﹏ qu?bang h閕. Ng﹏ qu?bang h閕  t gi韎 h筺.",nAddCash))
    end
end



function TongExt_OnUseTicket( nIndex )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Msg2Player("Kh玭g ph秈 th祅h vi猲 bang h閕, kh玭g th?s?d鬾g Tri謚 G鋓 Ph?")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
		Talk(1,"","Ch?bang ch? ph?bang v?trng l穙 頲 s?d鬾g Tri謚 G鋓 Ph?");
		return 0;
	end
    local m,x,y = GetWorldPos();
    local g,d,p = GetItemInfoByIndex( nIndex );
    local nPackedId = PackItemId(g,d,p);
    local tBossTicket = TongExt_BOSS_SUMMON_TICKET[nPackedId];
    local nBossType = tBossTicket[4];
    local tlegalMap = TongExt_TOTEM_BOSS_SOUL[nBossType][3]
    local nCurTotemType, _ = GetTongTotem()

    if nCurTotemType + 1 < nBossType then
        Talk(1,"",format("Bang h閕 c馻 b筺 c莕 c?%s у Щng m韎 頲 s?d鬾g Tri謚 G鋓 Ph?n祔.",TongExt_TOTEM_INFO[nBossType - 1][1]))
        return
    end
    local legalMap = 0;
    for i = 1,getn(tlegalMap) do
        if m == tlegalMap[i] then
            legalMap = 1;
            break
        end
    end
    if legalMap ~= 1 then
        Talk(1,"",format("Kh玭g th?g鋓 %s ?khu v鵦 n祔!",tBossTicket[3]));
		return 0;
    end
    if DelItemByIndex( nIndex,1 )~= 1 then
        Msg2Player("G鋓 b?l鏸, h穣 th?l筰 sau.")
        return
    end
    local nNpcIdx = CreateNpc(tBossTicket[2],tBossTicket[3],m,x,y);
    local nEndTime = GetTime() + TongExt_BOSS_LIVE_TIME;
    local szTongName = GetTongName();
    SetNpcDeathScript(nNpcIdx, TongExt_szThisFile);
    TongExt_BOSS_BUFF[tostring(nNpcIdx)] = {nTongId, nEndTime, tBossTicket[4], szTongName}; -- 缓存记录boss信息
    local szGlobalMsg = format("Bang %s t筰 %s  g鋓 Th?H?Th?%s, h穣 mau thu ph鬰!",szTongName ,GetMapName(m), tBossTicket[3]);
    Msg2Global(szGlobalMsg)
    AddGlobalNews(szGlobalMsg, 1);
    SendTongMessage(format("%s t筰 %s  g鋓 Th?H?Th?%s, m鋓 ngi mau thu ph鬰!",GetName(),GetMapName(m),tBossTicket[3]))
end

function TongExt_BossOverTime( nIndex )
    local nBossTongIdx = TongExt_BOSS_BUFF[tostring(nIndex)][1];
    local nType = TongExt_BOSS_BUFF[tostring(nIndex)][3]
    local szBossName = TongExt_TOTEM_INFO[nType][1]
    local szTongName = TongExt_BOSS_BUFF[tostring(nIndex)][4];
    SetNpcLifeTime(nIndex , 0)
    TongExt_BOSS_BUFF[tostring(nIndex)] = nil;
    -- SendTongMessageByTongID(nBossTongIdx,"Boss Run Awary")
    Msg2Global(format("Bang h閕 %s ch璦 th?nh b筰 %s, n? tr鑞 tho竧.", szTongName, szBossName))
end

function TongExt_GiveGiftTalk()
    local nTongId = GetTongID()
    local szNpcName = GetTargetNpcName();
    local nTotemType, _ = GetTongTotem();
    local nNeedTotemLv = TongExt_TONG_GIFT[1][3];
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "Kh玭g ph秈 th祅h vi猲 bang"))
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "Mu鑞 ph骳 l頸 bang, h穣 n鉯 trng l穙 ho芻 bang ch?t韎 g苝 ta."))
		return
	end
    if nTotemType < nNeedTotemLv then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "C蕄 у Щng Bang qu?th蕄, ch璦 th?ph竧 ph骳 l頸 bang."))
        return 
    end
    local szTitle = format("<color=gold>%s:<color>%s", szNpcName, "Nay bang h閕 ng祔 m閠 ph竧 tri觧, c?th?ph竧 ph骳 l頸 cho bang ch髇g. Ngi th蕐 sao? (Bang nh薾 頲 Th?H?Th?Linh T鵸 tr?l猲 m韎 c?th?ph竧)")
    local tbSay = {}
    
    for i = 1, getn(TongExt_TONG_GIFT) do
        local tGift = TongExt_TONG_GIFT[i];
        if tGift[3] <= nTotemType then
            tinsert(tbSay, format("%s/#TongExt_GiveGift(%d)",tGift[1],i))
        end
    end
    tinsert(tbSay, "H駓 b?nothing")
    Say( szTitle, getn(tbSay), tbSay )
end

function TongExt_GiveGift( nType )
    local szNpcName = GetTargetNpcName();
    local tGift = TongExt_TONG_GIFT[nType];
    local nCurCash = GetTongCash();
    local nCashCost = tGift[2];
    local nTotemType, _ = GetTongTotem();
    if nCurCash <  nCashCost + TongExt_TOTEM_INFO[nTotemType][4] then
        Talk(1,"",format("<color=gold>%s:<color> Ng﹏ qu?bang h閕 kh玭g , h穣 t筸 g竎 l筰 chuy謓 ph骳 l頸 bang ch髇g. (Sau khi ph竧 ph骳 l頸, qu?c遪 l筰 c?th?ti猽 hao cho tu莕 sau)", szNpcName ))
        return
    end
    local szFun = format("TongExt_GiveGift_CB%d",nType);
    AddTongCash( -nCashCost, TongExt_szThisFile, szFun);
end
function TongExt_GiveGift_CB1( bSuc,nCash )
    if bSuc == 1 then
        SendGift2TongMember(1);
        AddRuntimeStat(52,1,0,1)
    end
end
function TongExt_GiveGift_CB2( bSuc,nCash )
    if bSuc == 1 then
        SendGift2TongMember(2);
        AddRuntimeStat(52,2,0,1)
    end
end
function TongExt_GiveGift_CB3( bSuc,nCash )
    if bSuc == 1 then
        SendGift2TongMember(3);
        AddRuntimeStat(52,3,0,1)
    end
end

function TongExt_OnChangeTotemBtnClick()
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh玭g ph秈 th祅h vi猲 bang")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"","Ch?trng l穙 tr?l猲 m韎 頲 t╪g c蕄 у Щng.")
		return 0;
	end
    local nTotemType = GetTongTotem()
    if nTotemType >= getn(TongExt_TOTEM_INFO) then
        Talk(1,"","у Щng  t c蕄 cao nh蕋.")
        return 
    end
    local szNextName = TongExt_TOTEM_INFO[nTotemType+1][1]
 --   local szTitle = format("Bang h閕 ng祔 c祅g ph錸 vinh, n誹 l蕐 頲 h錸 ph竎h c馻 <color=red>%s<color>, bang h閕 s?c祅g th辬h vng.", szNextName)
    local szTitle = format("系统未开启<color=red>%s<color>", szNextName)
    local g,d,p = UnPackItemId( TongExt_TOTEM_INFO[nTotemType + 1][2] )
    local nSoulCnt = GetItemCount(g,d,p);
    local tbSay = {}
    if nSoulCnt > 0 then
        tinsert(tbSay, format("Ta  l蕐 h錸 %s, mu鑞 i Th?H?у Щng Bang (Ti猽 hao %d ng﹏ qu?bang h閕)/#TongExt_ChangeTotem(%d)",szNextName,TongExt_TOTEM_INFO[nTotemType+1][6],nTotemType+1))
    end
    tinsert(tbSay, "结束对话/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_ChangeTotem(nType)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh玭g ph秈 th祅h vi猲 bang")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"","Ch?trng l穙 tr?l猲 m韎 頲 t╪g c蕄 у Щng.")
		return 0;
	end
    local nCurCash = GetTongCash()
    if nCurCash < TongExt_TOTEM_INFO[nType][6] then
        Talk(1,"",format("T╪g Th?H?у Щng c莕 t鑞 %d ng﹏ qu?bang h閕.",TongExt_TOTEM_INFO[nType][6]))
		return 0;
    end
    local szFun = format("TongExt_ChangeTotemCB%d",nType);
    AddTongCash(-TongExt_TOTEM_INFO[nType][6], TongExt_szThisFile, szFun);
end
function TongExt_ChangeTotemCB( bSuc,nType )
    if bSuc == 0 then
        Talk(1,"","Tr?ng﹏ qu?bang h閕 th蕋 b筰, h穣 th?l筰")
        return
    end
    local g,d,p = UnPackItemId( TongExt_TOTEM_INFO[nType][2] )
    if DelItem(g,d,p,1) ~= 1 then
        Talk(1,"","T╪g у Щng th蕋 b筰, h穣 x竎 nh薾 trong t骾 c?linh h錸 у Щng c蕄 n祔.")
        return
    end
    SetTongTotem(nType, nType);
    SendTongMessage(TongExt_TOTEM_INFO[nType][3]);
    PostOneTongEventMsg(TongExt_TOTEM_INFO[nType][3])
    if nType >= 3 then
        Msg2Global(format("Bang %s  nh b筰 %s v?coi n?l?Th?H?у Щng",GetTongName(),TongExt_TOTEM_INFO[nType][1]))
    end
    AddRuntimeStat(51, nType, 0, 1) --开启图腾次数统计
    local nGiftType = TongExt_TOTEM_INFO[nType][7]
    AddRuntimeStat(52,nGiftType,0,1)
    SendGift2TongMember(nGiftType);                 -- 变更图腾后发礼包
end
function TongExt_ChangeTotemCB1(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,1) end
function TongExt_ChangeTotemCB2(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,2) end
function TongExt_ChangeTotemCB3(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,3) end
function TongExt_ChangeTotemCB4(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,4) end
function TongExt_ChangeTotemCB5(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,5) end
function TongExt_ChangeTotemCB6(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,6) end
function TongExt_ChangeTotemCB7(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,7) end
function TongExt_ChangeTotemCB8(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,8) end
function TongExt_ChangeTotemCB9(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,9) end
function TongExt_ChangeTotemCB10(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,10) end

function OnDeath(index)
    local nBossTongIdx = TongExt_BOSS_BUFF[tostring(index)][1];
    local nType = TongExt_BOSS_BUFF[tostring(index)][3];
    local szBossName = TongExt_TOTEM_INFO[nType][1]
    local m, x, y = GetNpcWorldPos(index);
    local szKillMsg = ""
    if nBossTongIdx == nil then
        WriteLog("[TongExtention] Player:"..GetName().." Killed Boss with tong id = nil")
        return
    end
    local nSlayerTongIdx = GetTongID();
    if nBossTongIdx == nSlayerTongIdx then -- 帮会成员击杀
        szKillMsg = format("Bang %s  nh b筰 %s, d騨g s?ra n cu鑙 l?%s",GetTongName(),szBossName,GetName());
        PostOneTongEventMsg(format("Bang h閕  nh b筰 [%s], d騨g s?ra n cu鑙 l?[%s]",szBossName,GetName()  ));
        local tSoulInfo = TongExt_TOTEM_BOSS_SOUL[nType];
        local nBossSoul = CreateNpc(tSoulInfo[1],tSoulInfo[2],m,x,y);
        TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] = {nSlayerTongIdx,nType};
        SetNpcLifeTime(nBossSoul,TongExt_BOSS_SOUL_LIFETIME);
        Msg2Global(szKillMsg);
        -- SetLastKillTotem(nType); -- 用物品判断图腾升级，因此这个不需要了
    else                              -- 外人抢怪
        szKillMsg = format("Цng gh衪! [%s]  di謙 [%s], th?n祔 ph秈 tr?", GetName(), szBossName)
        Msg2Global(format("Gi鱝 阯g di謙 %s, di謙 bang %s g鋓 ra-%s!", GetName(), TongExt_BOSS_BUFF[tostring(index)][4], szBossName));
        SendTongMessageByTongID(nBossTongIdx, szKillMsg);
        if nSlayerTongIdx == 0 or nSlayerTongIdx == nil then
            -- 抢怪者并没有帮会，没有抢怪奖励。
            return 
        end
        if GetTask(TongExt_TSKID_ROB_LIMIT) == 0 then
            TongExt_AddLiveness(12);
        end
        SetTask(TongExt_TSKID_ROB_LIMIT,1)
        TongExt_AddTongCash(TongExt_ROB_TOTEM_BOSS_GET_CASH[nType]);
        SendTongMessage(format("[%s]  di謙 bang [%s] g鋓 ra-[%s], bang ch髇g 頲 %d ng﹏ qu?bang h閕!",
            GetName(),
            TongExt_BOSS_BUFF[tostring(index)][4],
            szBossName,
            TongExt_ROB_TOTEM_BOSS_GET_CASH[nType]))
    end
    TongExt_BOSS_BUFF[tostring(index)] = nil;
    SetNpcLifeTime(index , 3)
end



function TongExt_OnGiftShopBtnClick()
    local nType,_ = GetTongTotem();
    if nType < 1 then
        Talk(1,"","系统未开启")
        return 
    end
    local nShop = TongExt_TOTEM_INFO[nType][5];
    local szTitle = "Bang hi謓 t筰 c?th?m?ti謒:"
    local tSay = {}
    for i = 1,nShop do
        local tShopinfo = TongExt_SHOP_INFO[i];
        tinsert(tSay,format("%s/#TongExt_OnGiftShopConfirm(%d, \'%s\')",tShopinfo[2],tShopinfo[1],tShopinfo[2]))
    end
    tinsert(tSay,"tr?l筰/nothing");
    Say(szTitle,getn(tSay),tSay);
end

function TongExt_OnGiftShopConfirm(nType, szName)
    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", nType, szName or ""))
end

function TongExt_OnTongSkillBtnClick()
    print("TODO TongExt_OnTongSkillBtnClick")
end


function TongExt_OnTongHandInBtnClick(nType)
Talk(1,"","未开启")
       return

 --   local nTongId = GetTongID()
 --   if nTongId == 0 or nTongId == nil then
--        Talk(1,"","Kh玭g ph秈 th祅h vi猲 bang")
--        return
 --   end
--    local nItem = TongExt_BOSS_MATERIAL_IDX[nType];
--    local g,d,p = UnPackItemId(nItem);
 --   local nCount = GetItemCount(g,d,p);
--    local szItemName = TongExt_BOSS_MATERIAL[nItem][2];
    
  --  if nCount <= 0 then
 --       Talk(1,'',format("%s mang theo kh玭g .",szItemName))
--        return
 --   end
--    local nCurGive = GetTask(TongExt_BOSS_MATERIAL[nItem][3])
 --   if nCurGive >= TongExt_BOSS_MATERIAL[nItem][4] then
 --       Talk(1,"",format("S?lng n閜 trong tu莕  t gi韎 h筺 (%d), kh玭g th?n閜 n鱝.",TongExt_BOSS_MATERIAL[nItem][4]))
 --       return
 --   end
 --   local nMax = min(nCount, TongExt_BOSS_MATERIAL[nItem][4]-nCurGive)
 --   AskClientForNumber(format("TongExt_OnTongHandInBtnClickCB_%d",nType), 1, nMax, "N閜 bao nhi猽?",97);
end

function TongExt_OnTongHandInBtnClickCB_1(nNum) TongExt_OnTongHandInBtnClickCB(1,nNum) end
function TongExt_OnTongHandInBtnClickCB_2(nNum) TongExt_OnTongHandInBtnClickCB(2,nNum) end
function TongExt_OnTongHandInBtnClickCB_3(nNum) TongExt_OnTongHandInBtnClickCB(3,nNum) end
function TongExt_OnTongHandInBtnClickCB_4(nNum) TongExt_OnTongHandInBtnClickCB(4,nNum) end
function TongExt_OnTongHandInBtnClickCB_5(nNum) TongExt_OnTongHandInBtnClickCB(5,nNum) end

function TongExt_AddTotemMaterialByType(nType,nNum,szPath,szFun)
    local tAdd = {0,0,0,0,0};
    tAdd[nType] = nNum;
    AddTotemMaterial(tAdd[1],tAdd[2],tAdd[3],tAdd[4],tAdd[5],szPath,szFun);
end

function TongExt_OnTongHandInBtnClickCB(nType,nNum)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh玭g ph秈 th祅h vi猲 bang")
        return
    end
    local nItem = TongExt_BOSS_MATERIAL_IDX[nType];
    local g,d,p = UnPackItemId(nItem)
    local nCurGive = GetTask(TongExt_BOSS_MATERIAL[nItem][3])
    if nCurGive + nNum > TongExt_BOSS_MATERIAL[nItem][4] then
        Talk(1,"",format("S?lng n閜 trong tu莕  t gi韎 h筺 (%d), kh玭g th?n閜 n鱝.",TongExt_BOSS_MATERIAL[nItem][4]))
        return
    end
    if DelItem(g,d,p,nNum) ~= 1 then
        Talk(1,"","N閜 th蕋 b筰, h穣 th?l筰")
        return
    end
    SetTask(TongExt_BOSS_MATERIAL[nItem][3],nCurGive+nNum);
    TongExt_AddLiveness(nNum);
    TongExt_AddTongCash(nNum);
    TongExt_AddTotemMaterialByType(nType,nNum,"","");
end


function TongExt_BuyBossTicket( nVar )
    local nTongId = GetTongID();
    local szNpcName = GetTargetNpcName();
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color> Kh玭g ph秈 th祅h vi猲 bang",szNpcName ))
        return
    end
    local nTongDuty = GetTongDuty()
    if nTongDuty < 0 or nTongDuty > 3 then
        Talk(1,"",format("<color=gold>%s:<color> Ch?c?ch鴆 v?trng l穙 tr?l猲 m韎 頲 mua Tri謚 G鋓 Ph?", szNpcName))
        return
    end
    local nMaxTotem,_ = GetTongTotem()
    if nMaxTotem < getn(TongExt_BOSS_SUMMON_TICKET_IDX) then
        nMaxTotem = nMaxTotem + 1;
    end
    local szTitle = format("<color=gold>%s:<color> Bang hi謓 t筰 c?th?mua Tri謚 G鋓 Ph?sau.", szNpcName)
    local tbSay = {}
    for i = 1, nMaxTotem do
        local nTicket = TongExt_BOSS_SUMMON_TICKET_IDX[i];
        local szTicketName = TongExt_BOSS_SUMMON_TICKET[nTicket][1];
        local szBossName = TongExt_BOSS_SUMMON_TICKET[nTicket][3];
        tinsert(tbSay,format("%s(%s)/#TongExt_BuyBoss(%d)",szTicketName,szBossName,i));
    end
    tinsert(tbSay,"H駓 b?nothing");
    Say( szTitle,getn(tbSay),tbSay )
end

function TongExt_BuyBoss( nType )
    local szNpcName = GetTargetNpcName();
    local nTicket = TongExt_BOSS_SUMMON_TICKET_IDX[nType];
    local szTicketName = TongExt_BOSS_SUMMON_TICKET[nTicket][1];
    local tCost = TongExt_BOSS_TICKET_COST[nType]
    local szTitle = format("<color=gold>%s:<color> Mu鑞 mua %s bang ph秈 c?nguy猲 li謚 sau:\n",szNpcName,szTicketName )
    for i = 1,getn(TongExt_BOSS_MATERIAL_IDX) do
        local tMat = TongExt_BOSS_MATERIAL[TongExt_BOSS_MATERIAL_IDX[i]];
        szTitle = format("%s%s", szTitle, format("      <color=yellow>%s<color>:<color=red>%d<color>\n",tMat[2],tCost[i]) )
    end
    local tbSay = {}
    tinsert(tbSay,format("X竎 nh /#TongExt_BuyBossConfirm(%d)",nType))
    tinsert(tbSay,"H駓 b?nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_BuyBossConfirm( nType )
    local nTongId = GetTongID();
    local szNpcName = GetTargetNpcName();
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color> Kh玭g ph秈 th祅h vi猲 bang",szNpcName ))
        return
    end
    local nTongDuty = GetTongDuty()
    if nTongDuty < 0 or nTongDuty > 3 then
        Talk(1,"",format("<color=gold>%s:<color> Ch?c?ch鴆 v?trng l穙 tr?l猲 m韎 頲 mua Tri謚 G鋓 Ph?", szNpcName))
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end
    local tAdd = TongExt_BOSS_TICKET_COST[nType];
    AddTotemMaterial(-tAdd[1],-tAdd[2],-tAdd[3],-tAdd[4],-tAdd[5],TongExt_szThisFile,"TongExt_BuyBossConfirmCB",nType);
end

function TongExt_BuyBossConfirmCB(bSuc,nRes1,nRes2,nRes3,nRes4,nRes5,nType)
    local szNpcName = GetTargetNpcName();
    if bSuc ~= 1 then
        Talk(1,"",format("<color=gold>%s:<color> фi th蕋 b筰, h穣 ki觤 tra bang h閕 xem c? nguy猲 li謚 ch璦.",szNpcName))
        return
    end
    local nItem = TongExt_BOSS_SUMMON_TICKET_IDX[nType];
    local szItemName = TongExt_BOSS_SUMMON_TICKET[nItem][1];
    local g,d,p = UnPackItemId(nItem)
    AddRuntimeStat(53, nType, 0, 1) --购买次数统计
    gf_AddItemEx({g,d,p,1}, szItemName);
end
-- AskClientForNumber("callback", n最小输入, n最大输入, "提示字符串");

-- Function callback(nNum)  ...... End

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
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
-- function on_first_login_clear(nLastLoginDate)--isolate上线后第一次登录时的清理
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 



