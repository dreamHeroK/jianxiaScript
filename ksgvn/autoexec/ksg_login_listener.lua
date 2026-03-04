Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

function OnKsgPlayerLogin()
    local _, nIsGGS = GetRealmType()
    if nIsGGS == 1 and not KsgPlayer:IsGM() then
        return -- LSV th× kh«ng fire event
    end
    -- M¸y chñ míi
    if not KsgLib:ServerIsOpened() then
        local tbTimeOpen = KsgLib:GetSrvCfg("tbTimeOpen")
        local szCallBack = "ExitGame"
        if KsgPlayer:IsGM() then
            szCallBack = ""
        end
        return KsgNpc:Talk(format("HiÖn m¸y chñ ch­a më, vui lßng quay l¹i vµo lóc <color=gold>%dh00 ngµy %d/%d/%d<color>", tbTimeOpen.nHour, tbTimeOpen.nDay, tbTimeOpen.nMonth, tbTimeOpen.nYear), 1, szCallBack)
    end
    -- GM functions
    ksg_GMAccount_OnLogin()
    -- Remove Forbid Item
    ksg_CheckAndRemoveForbidItem()

    ksg_ServerIdConfig()

    ksg_OpenStorageBox()
    ksg_AddRebornTitle()
    ksg_TaskControl()
    ksg_AddTuLuyenChau()
    -- Häc kü n¨ng ®¸nh qu¸i
    ksg_LearnBaseSkill()

    -- Events
    _monthlyEvent_OnLogin()
end

function ksg_GMAccount_OnLogin()
    for _, cfg in g_tbLoginCfg do
        local nHaveItemCount = KsgItem:CountAll(cfg.tbProp)
        local bOtherRule = 1
        if cfg.szRequireRule == 'admin' then
            bOtherRule = KsgPlayer:IsAdmin()
        end
        if cfg.szRequireRule == 'gm' then
            bOtherRule = KsgPlayer:IsGM()
        end
        if KsgLib:GetSrvCfg(cfg.bCondition) == 1 and bOtherRule == 1 then
            if nHaveItemCount < 1 and GetFreeItemRoom() > 0 then
                KsgAward:Give({ { tbProp = cfg.tbProp } }, "onKsgPlayerLogin received card, type = " .. cfg.szRequireRule)
                if type(cfg.szMsg) == "string" then
                    KsgNpc:Talk(cfg.szMsg)
                end
            end
        else
            -- Admin kh«ng bÞ xãa item
            if nHaveItemCount > 0 and not KsgPlayer:IsAdmin() then
                KsgItem:DeleteAll(cfg.tbProp)
                KsgNpc:Talk(format("BÞ mÊt %s do hÕt h¹n hoÆc bÞ cÊm sö dông!", KsgItem:GetName(cfg.tbProp)))
            end
        end
    end
end

function ksg_ServerIdConfig()
    if KsgLib:GetServerId() < 100 then
        -- C¸c hµm nµy ph¶i theo ®óng thø tù hiÖn t¹i, kh«ng ®­îc ®æi vÞ trÝ
        ksg_SetPlayerServerId() -- 1
        ksg_InitNewServer() -- 2
        ksg_SaveLoginServerId() -- 3
    end
end

function ksg_SetPlayerServerId()
    if KsgLib:GetServerId() > 99 then
        return
    end
    local nCurrentServerId = KsgTask:GetByte(TASKID_SERVER, TASK_SERVER_BYTE_CURRENT_SERVER_ID)
    if nCurrentServerId == 0 then
        -- Set ServerId ban ®Çu khi míi t¹o nh©n vËt
        KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID, KsgLib:GetServerId())
        return KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_CURRENT_SERVER_ID, KsgLib:GetServerId())
    end
    if KsgTask:GetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID) == 0 then
        -- Fix bug
        KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID, KsgLib:GetServerId())
    end
    local nLoginServerId = KsgTask:Get(TASKID_SERVER_LOGIN)

    if nLoginServerId ~= KsgLib:GetServerId() then
        -- NÕu server login gÇn nhÊt kh«ng ph¶i lµ server hiÖn t¹i th× x¸c ®Þnh lµ ®· chuyÓn sang server míi
        KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID, nCurrentServerId)
        KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_NEW_SERVER_ID, KsgLib:GetServerId())
    end
end

function ksg_InitNewServer()
    if KsgLib:GetServerId() > 99 then
        return
    end
    local nNewServerId = KsgTask:GetByte(TASKID_SERVER, TASK_SERVER_BYTE_NEW_SERVER_ID)
    if nNewServerId == KsgLib:GetServerId() and nNewServerId ~= 0 then
        -- NÕu id server chuyÓn ®Õn lµ id server hiÖn t¹i -> nh©n vËt nµy ®· chuyÓn sv thµnh c«ng, tiÕn hµnh xãa th«ng tin ®¨ng ký chuyÓn sv
        KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_NEW_SERVER_ID, 0)
        KsgTask:Set(TASKID_CHANGE_SERVER_REG_TIME, 0)
        KsgTask:SetByte(TASKID_SERVER, TASK_SERVER_BYTE_CURRENT_SERVER_ID, nNewServerId)
        -- CËp nhËt l¹i qu©n hµm
        CalcBattleRank()
        UpdateBattleMaxRank()
    end
end

function ksg_SaveLoginServerId()
    if KsgLib:GetServerId() > 99 then
        return
    end
    -- Set ServerId user ®¨ng nhËp gÇn nhÊt
    KsgTask:Set(TASKID_SERVER_LOGIN, KsgLib:GetServerId())
end

function ksg_AddRebornTitle()
    local nReborn = KsgPlayer:GetRebornCount()
    for _, tbConfig in pairs(g_tbRebornTitle_Basic) do
        for _, tbTitleConfig in pairs(tbConfig) do
            RemoveTitle(tbTitleConfig[2], tbTitleConfig[3])
        end
    end
    for _, tbConfig in pairs(g_tbRebornTitle_Advanced) do
        RemoveTitle(tbConfig[1], tbConfig[2])
    end
    if nReborn > 0 then
        KsgReborn:ReceiveTitle(nReborn)
    end
end

function ksg_CheckAndRemoveForbidItem()
    -- Remove Lak
    local tbForbiddenLak = { 223, 224, 227, 68, 69, 230 }
    for _, nLakId in tbForbiddenLak do
        local nHaveLak = BigGetItemCount(1, 0, nLakId)
        if nHaveLak > 0 then
            BigDelItem(1, 0, nLakId, nHaveLak)
        end
    end
end

function ksg_TaskControl()
    -- Reset Event
    local nToday = KsgDate:Today()
    if KsgTask:Get(TASKID_EVENT_SPEND_COIN_VERSION) ~= EVENT_SPEND_COIN_VERSION then
        -- Reset spend coin
        KsgTask:Set(TASKID_EVENT_SPEND_COIN, 0)
        for i = TASKID_EVENT_SPEND_COIN_STATUS_START, TASKID_EVENT_SPEND_COIN_STATUS_END do
            KsgTask:Set(i, 0)
        end
        KsgTask:Set(TASKID_EVENT_SPEND_COIN_VERSION, EVENT_SPEND_COIN_VERSION)
    end
    if KsgTask:Get(TASKID_EVENT_NGANPHIEU_VERSION) ~= EVENT_NGANPHIEU_VERSION then
        -- Reset diem ngan phieu
        KsgTask:Set(TASKID_EVENT_NGANPHIEU_POINT, 0)
        KsgTask:Set(TASKID_EVENT_NGANPHIEU_VERSION, EVENT_NGANPHIEU_VERSION)
    end

    --- Events
    local nMonth = tonumber(date("%m"))
    if KsgTask:Get(TASKID_TUIQUA_VOLAM_VERSION) ~= nMonth then
        KsgItem:DeleteAll(2, 1, 50016) -- xãa toµn bé tói quµ vµo cuèi th¸ng, tr¸nh tÝch tr÷
        KsgTask:Set(TASKID_TUIQUA_VOLAM_VERSION, nMonth)
    end

    if KsgTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 6, 8) ~= EVENT_BACHBAORUONG_VERSION then
        KsgTask:SetPosValue(TASKID_EVENT_BACHBAORUONG, 0, 1, 4) -- reset sè r­¬ng ®· sö dông
        KsgTask:SetPosValue(TASKID_EVENT_BACHBAORUONG, EVENT_BACHBAORUONG_VERSION, 6, 8) -- set version míi
    end

    if KsgTask:Get(TASKID_TUBAOTRAI_VERSION) ~= EVENT_TUBAOTRAI_VERSION then
        KsgTask:Set(TASKID_TUBAOTRAI_VERSION, EVENT_TUBAOTRAI_VERSION, TASK_ACCESS_CODE_TUBAOTRAI) -- ®æi version
        KsgTask:Set(TASKID_TUBAOTRAI_AWARD, 0, TASK_ACCESS_CODE_TUBAOTRAI) -- Reset tr¹ng th¸i nhËn th­ëng
        KsgTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI) -- Reset sè lÇn rót th­ëng
    end

    if nToday <= 20200826 and KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_CS_8) ~= 1 then
        -- fix bug 15000 nang dong
        local nBigLevel = KsgPlayer:GetBigLevel()
        local nNeedFixReborn = 0
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, 1) == 1 and nBigLevel < 890 then
            nNeedFixReborn = 890
        elseif KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, 2) == 1 and nBigLevel < 990 then
            nNeedFixReborn = 990
        elseif KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, 3) == 1 and nBigLevel < 1090 then
            nNeedFixReborn = 1090
        end
        if nNeedFixReborn > 0 and KsgPlayer:GetBigLevel() < nNeedFixReborn then
            KsgReborn:PlayerRebornWithNews(nNeedFixReborn, random(1, 4))
            KsgNpc:Talk(format("B¹n ®· ®­îc th¨ng cÊp lªn chuyÓn sinh %s.", KsgLib:Level2String(nNeedFixReborn)))
        end

        KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_CS_8, 1)
    end

    -- Convert hãa c¶nh CN => VNG
    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_FIX_HOACANH) ~= 1 then
        if KsgTask:Get(TASKID_FAIR_UP_FLAG) >= 1 then
            KsgTask:Set(TASKID_FAIR_UP_FLAG, 1)
            local nFairLv = GetTask(TASKID_FAIR_VALUE)
            local nNewFairLv = 180 * nFairLv / 100
            nNewFairLv = ceil(nNewFairLv)
            KsgPlayer:LevelUpFair(nNewFairLv)
        end

        KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_FIX_HOACANH, 1)
    end

    if nToday <= 20200828 and KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_KND) ~= 1 then
        -- fix bug KND
        local nAddBack = 0
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, 1) == 1 then
            nAddBack = 2
        end
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, 2) == 1 then
            nAddBack = 7
        end
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, 3) == 1 then
            nAddBack = 15
        end
        if nAddBack > 0 and KsgItem:CountAll(2, 1, 50253) > 15 then
            KsgItem:DeleteAll(2, 1, 50253)
            KsgAward:Give({ tbProp = { 2, 1, 50253 }, nStack = nAddBack, nStatus = 4 }, "§Òn bï KN§ thu håi")
        end

        KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_KND, 1)
    end

    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_NGAN_PHIEU) ~= 1 then
        local nNganPhieu = KsgTask:Get(TASKID_EVENT_NGANPHIEU_POINT)
        if nNganPhieu > 300000 then
            KsgTask:Set(TASKID_BACKUP_NGANPHIEU, nNganPhieu)
            WriteLog(format("[BUG NGAN PHIEU] Tµi kho¶n: %s, nh©n vËt %s, sè ng©n phiÕu: %d", GetAccount(), GetName(), nNganPhieu))
            KsgTask:Set(TASKID_EVENT_NGANPHIEU_POINT, 0)
            KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_TEMP_BAN, 1)
        end
        KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_NGAN_PHIEU, 1)
    end
    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_TEMP_BAN) == 1 then
        return KsgNpc:Talk("C¶nh b¸o: <color=red>Tµi kho¶n cña b¹n ®· bÞ t¹m khãa, h·y liªn hÖ víi bé phËn hç trî kh¸ch hµng ®Ó ®­îc hç trî më khãa.<color>", 1, "ExitGame")
    end
end

function ksg_LearnBaseSkill()
    local nPlayerRoute = GetPlayerRoute()
    local tbSkillCfg = g_tbFactionRoute_Skill[nPlayerRoute]
    if not tbSkillCfg then
        return
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ®¸nh qu¸i
        if 1 ~= HaveLearnedSkill(nSkillId) then
            LearnSkill(nSkillId)
        end
    end
end

function ksg_AddTuLuyenChau()
    if KsgItem:CountAll(2, 1, 50017) == 0 and KsgPlayer:GetBigLevel() >= 890 then
        KsgAward:Give({ tbProp = { 2, 1, 50017 } }, "NhËn Tu LuyÖn Ch©u")
        KsgNpc:Talk("NhËn ®­îc 1 <color=red>Tu LuyÖn Ch©u<color> tõ ch­ëng m«n truyÒn dô.")
    end
end

function ksg_OpenStorageBox()
    if KsgTask:Get(805) ~= 2 then
        -- Më r­¬ng chøa ®å 
        KsgTask:Set(805, 2)
    end
end