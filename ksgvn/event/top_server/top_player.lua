Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\top_server\\top_server_head.lua")

-- Xem th«ng tin top m«n ph¸i
function eventTop_QueryTopFaction()
    LIB_txtData:Init(FILENAME_TOP_ROUTE)
    LIB_txtData:LoadData()
    local szList = "Th«ng tin phÇn th­ëng <color=yellow>Top 1 hÖ ph¸i<color>: \n\n"
    local szList2 = szList
    local szList3 = szList
    for i = 1, getn(LIB_txtData.tbTextData) do
        if KsgPlayer:GetRouteName(i, 1) ~= "" then
            local nStatus = tonumber(LIB_txtData.tbTextData[i])
            local szStatus = "<color=gray>Ch­a nhËn<color>"
            if nStatus >= 1 then
                szStatus = "<color=green>§· nhËn<color>"
            end
            if i < 12 then
                szList = szList .. "Ph¸i <color=gold>" .. KsgPlayer:GetRouteName(i) .. "<color>: " .. szStatus .. "\n"
            elseif i < 22 then
                szList2 = szList2 .. "Ph¸i <color=gold>" .. KsgPlayer:GetRouteName(i) .. "<color>: " .. szStatus .. "\n"
            else
                szList3 = szList3 .. "Ph¸i <color=gold>" .. KsgPlayer:GetRouteName(i) .. "<color>: " .. szStatus .. "\n"
            end
        end
    end
    Talk(3, "", szList, szList2, szList3)
end

-- Xem th«ng tin top 3 nv chuyÓn sinh
function eventTop_QueryTopReborn()
    LIB_txtData:Init(FILENAME_TOP_REBORN)
    LIB_txtData:LoadData()
    local nCount = tonumber(LIB_txtData.tbTextData[1])
    local szHead = g_szNpcName .. "Top 3 nh©n vËt <color=yellow>®¹t chuyÓn sinh 10 cÊp 99 ®Çu tiªn<color>:\n\n"
    if nCount == 0 then
        return KsgNpc:Talk(szHead .. "<color=gray>HiÖn ch­a cã ai nhËn th­ëng.<color>")
    end
    if nCount >= 3 then
        return KsgNpc:Talk(szHead .. "<color=green>HiÖn phÇn th­ëng ®· ph¸t hÕt.<color>")
    end
    KsgNpc:Talk(szHead .. format("HiÖn ®· cã <color=gold>%d cao thñ nhËn th­ëng<color>.", nCount))
end

-- Xem th«ng tin top 1 nv qu©n c«ng 4m8
function eventTop_QueryTopHonor1()
    LIB_txtData:Init(FILENAME_TOP_HONOR1)
    LIB_txtData:LoadData()
    local szList = g_szNpcName .. "Th«ng tin phÇn th­ëng <color=yellow>Top 1 nh©n sÜ ®Çu tiªn ®¹t 6.600.000 ®iÓm c«ng tr¹ng chiÕn tr­êng<color>: \n\n"
    local nNationRank = 0
    local szCamp
    for i = 1, 2 do
        nNationRank = tonumber(LIB_txtData.tbTextData[tonumber(i)])
        if nNationRank == 1 then
            szCamp = g_tbBattleCamps[i]
            break
        end
    end
    local szStatus = "<color=gray>Ch­a cã chñ nh©n<color>"
    if nNationRank >= 1 then
        szStatus = format("§· thuéc vÒ <color=gold>1 cao thñ phe %s<color>", szCamp)
    end
    KsgNpc:Talk(szList .. szStatus)
end

-- Xem th«ng tin top 2 nv qu©n c«ng 3m6
function eventTop_QueryTopHonor2()
    LIB_txtData:Init(FILENAME_TOP_HONOR2)
    LIB_txtData:LoadData()
    local szList = g_szNpcName .. "Th«ng tin phÇn th­ëng <color=yellow>Top 2 nh©n sÜ mçi phe ®¹t 5.400.000 ®iÓm c«ng tr¹ng chiÕn tr­êng<color>: \n\n"
    for i = 1, getn(LIB_txtData.tbTextData) do
        local nStatus = tonumber(LIB_txtData.tbTextData[i])
        local szStatus = "<color=gray>Ch­a cã ai nhËn<color>."
        if nStatus >= 1 then
            szStatus = format("<color=gold>§· cã %d cao thñ nhËn th­ëng<color>.", nStatus)
        end
        szList = szList .. "Phe <color=green>" .. g_tbBattleCamps[i] .. "<color>: " .. szStatus .. "\n"
    end
    KsgNpc:Talk(szList)
end


-- Nhan thuong cap toan may chu
function eventTop_ShowLevelAward()
    local nStartDate = KsgLib:GetSrvCfg('tbTimeTop').nStartDate
    local nEndDate = KsgLib:GetSrvCfg('tbTimeTop').nEndDate
    local tSay = {
        g_szNpcName .. "Ho¹t ®éng <color=yellow>§ua Top NhËn Th­ëng<color> diÔn ra tõ ngµy<color=gold> " .. KsgDate:ToString(nStartDate) .. " ®Õn 24:00 " .. KsgDate:ToString(nEndDate) .. "<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=gold>https://volam2.zing.vn<color>"
    }
    for nIndex, tbLevelCfg in g_tbNewPlayerLevelAward do
        if KsgTask:GetBit(TASKID_TOP_LEVEL_AWARD, tbLevelCfg.nTaskBit) ~= 1 then
            tinsert(tSay, format("NhËn th­ëng %s/#getLevelAward(%d)", KsgLib:Level2String(tbLevelCfg.nRequireLevel), nIndex))
        end
    end
    if getn(tSay) == 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "®· nhËn hÕt toµn bé phÇn th­ëng lÇn nµy!")
    end
    tinsert(tSay, "\nT¹m thêi ch­a muèn nhËn/no")
    KsgNpc:SayDialog(tSay)
end

function getLevelAward(nIndex)
    if KsgTask:GetBit(TASKID_TOP_LEVEL_AWARD, g_tbNewPlayerLevelAward[nIndex].nTaskBit) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!")
    end

    if not KsgLib:HasEnoughBagRoom(25, 1000) then
        return
    end

    if KsgLib:PayMaterial(g_tbNewPlayerLevelAward[nIndex].tbCondition) then
        KsgAward:Give(g_tbNewPlayerLevelAward[nIndex].tbAward)
        KsgTask:SetBit(TASKID_TOP_LEVEL_AWARD, g_tbNewPlayerLevelAward[nIndex].nTaskBit, 1)
    end
end

function eventTop_GetTopHonor1Award_Confirm()
    local nHonor = KsgPlayer:GetHonor(1)
    local nBattleCamp = 1
    if nHonor < 0 then
        nBattleCamp = 2
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR2) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng c«ng tr¹ng 5.400.000 råi, kh«ng thÓ nhËn thªm phÇn th­ëng nµy n÷a!!")
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR1) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!")
    end

    LIB_txtData:Init(FILENAME_TOP_HONOR1)
    LIB_txtData:LoadData()

    local nNationRank = 0
    for i = 1, 2 do
        nNationRank = tonumber(LIB_txtData.tbTextData[tonumber(i)])
        if not nNationRank then
            -- If data file is empty
            nNationRank = 0
        end
        if nNationRank == 1 then
            break
        end
    end

    if tonumber(nNationRank) >= 1 then
        return KsgNpc:Talk(g_szNpcName .. "PhÇn th­ëng cao thñ ®Çu tiªn c«ng tr¹ng ®¹t 6.600.000 ®· cã chñ nh©n!")
    end
    
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "CÇn chuyÓn vÒ m«n ph¸i chñ tu míi cã thÓ nhËn th­ëng!")
    end

    if not KsgLib:CheckMaterial(g_tbTopHonor1Cfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(25, 1500) then
        return
    end

    if LIB_txtData:AddValue(tonumber(nBattleCamp), 1, 1) and KsgLib:PayMaterial(g_tbTopHonor1Cfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR1, 1)
        KsgAward:Give(g_tbTopHonor1Cfg.Award, "NhËn th­ëng c«ng tr¹ng 1")
        KsgNpc:Talk("NhËn thµnh c«ng phÇn th­ëng c«ng tr¹ng ®¹t 6.600.000!")
    end
end


-- NhËn th­ëng top 2 c«ng tr¹ng
function eventTop_GetTopHonor2Award_Confirm()
    local nHonor = KsgPlayer:GetHonor(1)
    local nBattleCamp = 1
    if nHonor < 0 then
        nBattleCamp = 2
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR1) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng c«ng tr¹ng 6.600.000 råi, kh«ng thÓ nhËn thªm phÇn th­ëng nµy n÷a!!")
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR2) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!")
    end

    LIB_txtData:Init(FILENAME_TOP_HONOR2)
    LIB_txtData:LoadData()

    local nNationRank = tonumber(LIB_txtData.tbTextData[tonumber(nBattleCamp)])

    if nNationRank >= 2 then
        return KsgNpc:Talk(g_szNpcName .. format("PhÇn th­ëng 2 cao thñ ®Çu tiªn c«ng tr¹ng ®¹t 5.400.000 <color=green>phe %s<color> ®· cã chñ nh©n!", g_tbBattleCamps[nBattleCamp]))
    end
    
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "CÇn chuyÓn vÒ m«n ph¸i chñ tu míi cã thÓ nhËn th­ëng!")
    end
    
    if not KsgLib:CheckMaterial(g_tbTopHonor2Cfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(25, 1500) then
        return
    end

    if LIB_txtData:AddValue(tonumber(nBattleCamp), 1, 2) == 1 and KsgLib:PayMaterial(g_tbTopHonor2Cfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR2, 1)
        KsgAward:Give(g_tbTopHonor2Cfg.Award, "NhËn th­ëng c«ng tr¹ng 2_" .. g_tbBattleCamps[nBattleCamp])
        KsgNpc:Talk("NhËn thµnh c«ng phÇn th­ëng c«ng tr¹ng ®¹t 5.400.000!")
    end
end

---- NhËn th­ëng Top 1 m«n ph¸i  ----------
function eventTop_GetTop1FactionAward()
    if KsgLib:IsInDualTopTime() then
        KsgNpc:SayDialog({
            g_szNpcName .. "NhËn phÇn th­ëng cao thñ top 1 theo hÖ ph¸i (mçi hÖ ph¸i chØ cã 1 phÇn th­ëng)",
            "Ta muèn nhËn/eventTop_GetTop1FactionAward_Confirm",
            "\n§Ó ta suy nghÜ l¹i./no",
        })
    else
        KsgNpc:Talk(g_szNpcName .. "Ho¹t ®éng ®· kÕt thóc!")
    end
end

---- NhËn th­ëng top 3 nh©n vËt chuyÓn sinh 10 94 ----------
function eventTop_GetTop3RebornAward()
    if KsgLib:IsInDualTopTime() then
        KsgNpc:SayDialog({
            g_szNpcName .. "NhËn phÇn th­ëng 3 cao thñ hoµn thµnh <color=red>chuyÓn sinh 10 cÊp 99<color> ®Çu tiªn cña m¸y chñ.",
            "Ta muèn nhËn/eventTop_GetTop3RebornAward_Confirm",
            "\n§Ó ta suy nghÜ l¹i./no",
        })
    else
        KsgNpc:Talk(g_szNpcName .. "Ho¹t ®éng ®· kÕt thóc!")
    end
end

--- NhËn th­ëng top 1 m«n ph¸i----
function eventTop_GetTop1FactionAward_Confirm()
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ nhËn th­ëng.")
    end
    
    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_FACTION1) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng top 1 theo hÖ ph¸i råi.")
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "CÇn chuyÓn vÒ m«n ph¸i chñ tu míi cã thÓ nhËn th­ëng!")
    end

    LIB_txtData:Init(FILENAME_TOP_ROUTE)
    LIB_txtData:LoadData()
    local nFactionRank = tonumber(LIB_txtData.tbTextData[tonumber(nRoute)])
    if nFactionRank >= 1 then
        KsgNpc:Talk(g_szNpcName .. "PhÇn th­ëng nµy ®· cã chñ nh©n!")
        return
    end

    if not KsgLib:CheckMaterial(g_tbTop1FactionCfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(10, 300) then
        return
    end

    local szRouteName = KsgPlayer:GetRouteName(tonumber(nRoute))

    if LIB_txtData:AddValue(tonumber(nRoute), 1, 1) == 1 and KsgLib:PayMaterial(g_tbTop1FactionCfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_FACTION1, 1)
        KsgAward:Give(g_tbTop1FactionCfg.Award, 'NhËn th­ëng top 1 ' .. szRouteName)
        KsgNpc:Talk("NhËn thµnh c«ng phÇn th­ëng h¹ng " .. (nFactionRank + 1) .. " m«n ph¸i " .. szRouteName .. ".")
        AddLocalNews(format("Cao thñ [%s] ®· nhËn phÇn th­ëng Top 1 %s", KsgPlayer:GetName(), szRouteName))
        Msg2SubWorld(format("Cao thñ [%s] ®· nhËn phÇn th­ëng Top 1 %s", KsgPlayer:GetName(), szRouteName))
    end
end

--- NhËn th­ëng top 3 chuyÓn sinh ----
function eventTop_GetTop3RebornAward_Confirm()
    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_REBORN3) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
    end
    LIB_txtData:Init(FILENAME_TOP_REBORN)
    LIB_txtData:LoadData()
    local nRebornRank = tonumber(LIB_txtData.tbTextData[1])

    if nRebornRank >= 3 then
        return KsgNpc:Talk(g_szNpcName .. "PhÇn th­ëng 3 cao thñ ®Çu tiªn ®¹t chuyÓn sinh 10 cÊp 99 ®Òu ®· cã chñ nh©n!")
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "CÇn chuyÓn vÒ m«n ph¸i chñ tu míi cã thÓ nhËn th­ëng!")
    end

    if not KsgLib:CheckMaterial(g_tbTop3RebornCfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(5, 300) then
        return
    end

    if LIB_txtData:AddValue(1, 1, 3) == 1 and KsgLib:PayMaterial(g_tbTop3RebornCfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_REBORN3, 1)
        KsgAward:Give(g_tbTop3RebornCfg.Award, 'NhËn th­ëng top chuyÓn sinh')
        KsgNpc:Talk("NhËn thµnh c«ng phÇn th­ëng Top chuyÓn sinh.")
        AddLocalNews(format("Cao thñ [%s] ®· nhËn phÇn th­ëng Top chuyÓn sinh.", KsgPlayer:GetName()))
        Msg2SubWorld(format("Cao thñ [%s] ®· nhËn phÇn th­ëng Top chuyÓn sinh.", KsgPlayer:GetName()))
    end
end


