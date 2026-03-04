Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\gm.lua")
Import("\\script\\ksgvn\\event\\top_server\\top_server.lua")

g_szTitle = "<color=green>ThÎ Admin: <color>"

_g_AdminCard_Version = 3 -- dïng cho update kh«ng restart server
--function OnUse(nItemIndex)
function OnUse_Main(nItemIndex)
  --  if not KsgPlayer:IsAdmin() and KsgLib:GetSrvCfg('bOpenAdminCard') ~= 1 then
  --      return KsgNpc:Talk("ThÎ Admin ®· ®ãng!")
  --  end
 --   local nVersion, nCurGs = GetRealmType();
  --  local szAccState = format("<color=green>Server ID = %d, Player Online on this GS: %d, Version = %d, RealmType = %d<color>", KsgLib:GetServerId(), gf_GetServerPlayerCount(), nVersion, nCurGs)
 --   local szHead = g_szTitle .. format("[Version.%d] Chµo Admin, <color=yellow>sè ngµy më m¸y chñ: %d ngµy<color><enter>%s, h·y chän chøc n¨ng:", _g_AdminCard_Version, KsgDate:CurrentRunningDay(), szAccState)
 --   local tSay = {
 --       szHead
 --   }

--    tinsert(tSay, "Debug/_kgm_Debug")
--    tinsert(tSay, "Xãa nh©n vËt nµy/_kgm_DeleteRole")
--    tinsert(tSay, "Kick Player/#AskClientForString(\"_kgm_KickPlayer\", \"\", 1, 500, \"NhËp username hoÆc tªn\")")
 --   tinsert(tSay, "Fix Player/#AskClientForString(\"_kgm_FixPlayer\", \"\", 1, 500, \"NhËp username hoÆc tªn\")")
--    tinsert(tSay, "T¹o NPC/#AskClientForString(\"_kgm_CreateNPC\", \"\", 1, 500, \"NhËp Template ID\")")
--    tinsert(tSay, "C­êng hãa trang bÞ/_kgm_InputEquipEnhanceLevel")
--    tinsert(tSay, "NhËn vËt phÈm theo m·/_kgm_InputStrEquip")
--    tinsert(tSay, "NhËn thÎ Test/_kgm_AddTestCard")
--    tinsert(tSay, "NhËn mËt tÞch Test/_kgm_AddTestBook")
--    tinsert(tSay, "Thay ®æi m«n ph¸i/kgm_ChangeRoute")
--    tinsert(tSay, "Më Equip Shop theo m·/_kgm_InputEquipShop")
--    tinsert(tSay, "NhËn ngo¹i trang theo m·/_kgm_InputAddCoat")
  --  tinsert(tSay, "NhËn ngo¹i trang c¸nh theo m·/_kgm_InputAddOrn")
   -- tinsert(tSay, "Vµo chiÕn tr­êng/_kgm_ShowJoinBattle")
  --  tinsert(tSay, "Më chiÕn tr­êng/battle_OpenMenu")
  --  tinsert(tSay, "Èn th©n vµ bÊt tö/_kgm_HiddenAndImmortal")
   -- tinsert(tSay, "Thao t¸c b¶n ®å/_kgm_MapAct")
  --  tinsert(tSay, "\nReloadScript/_kgm_ReloadScript")

 --   tinsert(tSay, "Thanh lý tói/kgm_ClearBagItems")
 --   tinsert(tSay, "\nKÕt thóc ®èi tho¹i/no")

  --  if IsTitleExist(100, 1) ~= 1 then
   --     tinsert(tSay, 2, "NhËn danh hiÖu Admin/_kgm_GiveAdminTitle")
  --  end
 --   KsgNpc:SayDialog(tSay)
end

function _kgm_GiveAdminTitle()
    AddTitle(100, 1)
    SetCurTitle(100, 1)
end

function _kgm_CreateNPC(szName)
    if szName then
        local nMapId, nX, nY = GetWorldPos()
        local nNpcIndex = CreateNpc(szName, "NPC Test", nMapId, nX, nY)
    end
end

function _kgm_KickPlayer(playerAccount)
    if not playerAccount then
        return
    end
    local nCount = 0;
    local player = FirstPlayer()
    local OldPlayerIndex = PlayerIndex
    local kicked
    while (player > 0) do
        PlayerIndex = player
        if GetAccount() == playerAccount or GetName() == playerAccount and not KsgPlayer:IsAdmin() then
            kicked = GetName()
            ExitGame()
        end
        nCount = nCount + 1;
        player = NextPlayer(player)
    end
    PlayerIndex = OldPlayerIndex
    if kicked then
        Msg2Player("§· ®¸ tµi kho¶n " .. kicked)
    else
        Msg2Player("Kh«ng t×m thÊy tµi kho¶n " .. playerAccount)
    end

    Msg2Player("Trë vÒ tµi kho¶n " .. GetAccount())
end

function _kgm_FixPlayer(playerAccount)
    if not playerAccount then
        return
    end
    local nCount = 0;
    local player = FirstPlayer()
    local OldPlayerIndex = PlayerIndex
    local szAccount
    while (player > 0) do
        PlayerIndex = player
        if GetAccount() == playerAccount or GetName() == playerAccount then
            szAccount = GetName()
            --if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_TEMP_BAN) == 1 then
            --    KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_TEMP_BAN, 0)
            --    KsgTask:Set(TASKID_EVENT_NGANPHIEU_POINT, KsgTask:Get(TASKID_BACKUP_NGANPHIEU))
            --    KsgNpc:Talk("Tµi kho¶n cña b¹n ®· ®­îc phôc håi.")
            --end
            KsgTask:Set(TASKID_FAIR_UP_FLAG, 33)
            KsgNpc:Talk("Tµi kho¶n cña b¹n ®· ®­îc phôc håi cÊp hãa c¶nh.")
        end
        nCount = nCount + 1
        player = NextPlayer(player)
    end
    PlayerIndex = OldPlayerIndex
    if szAccount then
        Msg2Player("§· hoµn thµnh fix lçi trªn tµi kho¶n " .. szAccount)
    else
        Msg2Player("Kh«ng t×m thÊy tµi kho¶n " .. playerAccount)
    end

    Msg2Player("Trë vÒ tµi kho¶n " .. GetAccount())
end

function _kgm_ReloadScript()
    LoadScript("\\script\\ksgvn\\lib.lua")
    LoadScript("\\script\\ksgvn\\autoexec\\ksg_system_head.lua")
    LoadScript("\\script\\ksgvn\\autoexec\\ksg_login_listener.lua")
    LoadScript("\\script\\ksgvn\\event\\top_server\\top_player.lua")
    LoadScript("\\script\\ksgvn\\item\\item_newplayer_card.lua")
    LoadScript("\\script\\ksgvn\\item\\item_admin_card.lua")
    LoadScript("\\script\\ksgvn\\item\\item_tuluyenchau.lua")
    LoadScript("\\script\\ksgvn\\item\\item_merge_server.lua")
    LoadScript("\\script\\ÖÐÔ­Ò»Çø/ãê¾©\\npc\\Ç®×¯ÀÏ°å.lua")
    LoadScript("\\script\\ksgvn\\event\\newplayer\\newplayer.lua")
    LoadScript("\\script\\ksgvn\\event\\nganphieu\\nganphieu.lua")
    LoadScript("\\script\\ksgvn\\event\\monthly\\monthly_head.lua")
    LoadScript("\\script\\ksgvn\\event\\monthly\\monthly.lua")
    LoadScript("\\script\\ksgvn\\npc\\npc_tientrang.lua")
    LoadScript("\\script\\equip_shop\\equip_shop.lua")
    KsgPlayer:Msg("Scripts Reloaded")
end

function _kgm_DeleteRole()
    EnableDeleteImmedFlag(1)
    ExitGame()
end

function _kgm_Debug()
    Msg2Player("Current Server Id = " .. KsgLib:GetServerId())
    KsgPlayer:SetFairLevel(1)
    local nLastServerId = KsgTask:GetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID)
    Msg2Player("Last server Id = " .. nLastServerId)
    Msg2Player("LSB = " .. KsgTask:Get(TASKID_LIMIT_LSB))
    Msg2Player("DHC = " .. KsgTask:Get(TASKID_LIMIT_DHC))
    Msg2Player("VKT = " .. KsgTask:Get(TASKID_LIMIT_VKT))
    CastState("state_destiny_attack_point_add", 30000, 999 * 999, 1, 117000);
    CastState("state_burst_enhance_rate", 255, 999 * 999, 1, 118000);
    CastState("state_damage_point", 30000, 999 * 999, 1, 119000);
    CastState("state_critical_damage_increase", 3000, 999 * 999, 1, 120000);
    CastState("state_critical_point_increase", 3000, 999 * 999);
    CastState("state_destiny_armor_point_add", 3000, 999 * 999, 1, 131000);
    CastState("state_life_max_point_add", 5e6, 999 * 999, 1, 132000);
    CastState("state_neili_max_point_add", 50000, 999 * 999);
    CastState("state_life_per_per8f", 1000, 999 * 999, 1, 133000);
    CastState("state_move_speed_percent_add", 100, 999 * 999, 1, 134000);
    CastState("state_neili_per_per8f", 1000, 999 * 999, 1, 135000);
    CastState("state_add_allability", 10000, 999 * 999, 1, 136000);
    CastState("state_interval_ignore", 100, 999 * 999);
    CastState("state_ignore_dodge", 100, 999 * 999);
    if HaveLearnedSkill(2978) == 0 then
        LearnSkill(2978) -- Long Ng©m
    end
end

function _kgm_AddTestBook()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    local nRoute = KsgPlayer:GetRoute()
    if not g_tbFactionBook_Super[nRoute] then
        return KsgNpc:Talk("Ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn mËt tÞch nµy!")
    end
    local _, nItemIndex = AddItem(GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, g_tbFactionBook_Super[nRoute], 1, 4)
    if nItemIndex < 0 then
        return
    end
    SetBookInfo(nItemIndex, 10, 4, 100, 100, 100, 100)
end

function _kgm_UpgradeAllItem(nEnhance)
    if nEnhance < 1 or nEnhance > 20 then
        return
    end
    local upgradeList = {
        EQUIP_POS_CAP, EQUIP_POS_BODY, EQUIP_POS_WEAPON, EQUIP_POS_PANTS, EQUIP_POS_CAPE, EQUIP_POS_BADGE, EQUIP_POS_DRESS_SMOCK
    }
    local nTotal = 0
    for k, nPos in upgradeList do
        local nEquipIdx = GetPlayerEquipIndex(nPos)
        if nEquipIdx ~= 0 then
            SetItemEnhance(nEquipIdx, nEnhance);
            nTotal = nTotal + 1
        end
    end
    if nTotal == 0 then
        KsgNpc:Talk("C¸c h¹ h×nh nh­ kh«ng mÆc trang bÞ trªn ng­êi.")
    else
        KsgNpc:Talk(format("§· thµnh c«ng c­êng hãa %d trang bÞ lªn cÊp %d", nTotal, nEnhance))
    end
end

function _kgm_MapAct()
    local tSay = {
        "Chän thao t¸c:",
        "Xem täa ®é hiÖn t¹i/_kgm_ShowCurMapPos",
        --"L­u täa ®é vµo file/_kgm_SaveMapPosToFile",
        "DÞch chuyÓn tíi Map chØ ®Þnh/_kgm_InputMapPos",
        "\nTrë l¹i/OnUse",
        "\nRêi khái/no",
    }
    KsgNpc:SayDialog(tSay)
end

function _kgm_HiddenAndImmortal()
    local toDay = KsgDate:Today()
    SetFightState(0)
    CastState("state_illusion_latent", 100, 18 * 60 * 60, 1, toDay + 1)
    KsgPlayer:Msg("§· vµo tr¹ng th¸i Èn th©n, duy tr× 1h!")
    CastState("state_dispear", 100, 18 * 60 * 60, 1, toDay + 2)
    KsgPlayer:Msg("NhËn tr¹ng th¸i bÊt tö, duy tr× 1h!")
end

function _kgm_ShowJoinBattle(nMapId)
    if not nMapId then
        local tSay = {
            "Chän chiÕn tr­êng",
            "Th«n Trang/#_kgm_ShowJoinBattle(881)",
            "L­¬ng Th¶o/#_kgm_ShowJoinBattle(882)",
            "Thµnh Tr×/#_kgm_ShowJoinBattle(883)",
            "Nh¹n M«n Quan/#_kgm_ShowJoinBattle(884)",
            "\nRêi khái/no",
        }
        return KsgNpc:SayDialog(tSay)
    end

    local tSay = {
        "Chän Phe",
        format("Phe Tèng/#_kgm_JoinBattle(%d, 1)", nMapId),
        format("Phe Liªu/#_kgm_JoinBattle(%d, 2)", nMapId),
        "\nTrë l¹i/_kgm_ShowJoinBattle",
        "\nRêi khái/no",
    }
    return KsgNpc:SayDialog(tSay)
end

function _kgm_JoinBattle(nMapId, nType)
    if not nType then
        local tSay = {
            "Chän Phe",
            format("Phe Tèng/#_kgm_JoinBattle(%d, 1)", nMapId),
            format("Phe Liªu/#_kgm_JoinBattle(%d, 2)", nMapId),
            "\nTrë l¹i/_kgm_ShowJoinBattle",
            "\nRêi khái/no",
        }
        return KsgNpc:SayDialog(tSay)
    end
    local tbMapPos = {
        [883] = { -- Thµnh Tr×
            [1] = { 1674, 3150 },
            [2] = { 1767, 3142 },
        },
        [884] = { -- Nh¹n m«n quan
            [1] = { 1664, 3604 },
            [2] = { 1835, 3600 },
        }
    }

    if not tbMapPos[nMapId] then
        return KsgNpc:Talk("B¶n ®å chiÕn tr­êng kh«ng hîp lÖ hoÆc ch­a ®­îc hç trî!")
    end

    NewWorld(nMapId, tbMapPos[nMapId][nType][1], tbMapPos[nMapId][nType][2])
end

function _kgm_AddCustomEquip(text)
    local parts = KsgLib:Split(text, ' ')
    local nLength = getn(parts)
    if nLength == 3 then
        local _, nItemIdx = AddItem(parts[1], parts[2], parts[3], 1, 1, -1, -1, -1, -1, -1, -1, -1, 0, 0)
        if nItemIdx > 0 then
            KsgPlayer:Msg("NhËn ®­îc " .. KsgItem:GetName(nItemIdx))
        else
            KsgPlayer:Msg("VËt phÈm kh«ng tån t¹i id: " .. parts[1])
        end
        return
    end
    if nLength == 4 then
        local _, nItemIdx = AddItem(KsgLib:UnPack(parts))
        if nItemIdx > 0 then
            KsgPlayer:Msg(format("NhËn ®­îc %d %s", parts[4], KsgItem:GetName(nItemIdx)))
        else
            KsgPlayer:Msg("VËt phÈm kh«ng tån t¹i")
        end
        return
    end
    if nLength > 4 then
        local tbItem = { 0, 0, 0, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0, 0 }
        for j = 1, 14 do
            tbItem[j] = parts[j] or tbItem[j]
        end
        local _, nItemIdx = AddItem(KsgLib:UnPack(parts))
        if nItemIdx > 0 then
            KsgPlayer:Msg(format("NhËn ®­îc %d %s", parts[4], KsgItem:GetName(nItemIdx)))
        else
            KsgPlayer:Msg("VËt phÈm kh«ng tån t¹i")
        end
        return
    end
    KsgPlayer:Msg("Sai có ph¸p, nhËp ®Þnh d¹ng x x x...")
end

function _kgm_ShowCurMapPos()
    local nMapID, nMapX, nMapY = GetWorldPos()
    KsgPlayer:Msg("MapId = " .. nMapID .. ", X =  " .. nMapX .. ", Y = " .. nMapY)
end

function _kgm_MoveToMap(text)
    local parts = KsgLib:Split(text, ' ')
    local nLength = getn(parts)
    if nLength == 3 then
        local nMapId, nX, nY = KsgLib:UnPack(parts)
        if tonumber(nX) < 1000 then
            nX = tonumber(nX) * 8
            nY = tonumber(nY) * 16
        end
        local nResult = NewWorld(nMapId, nX, nY)
        local szMsg = "Kh«ng thÓ dÞch chuyÕn tíi map: " .. nMapId;
        if nResult == 1 then
            szMsg = "DÞch chuyÓn tíi map: " .. nMapId
        end

        return KsgPlayer:Msg(szMsg)
    end

    KsgPlayer:Msg("Sai có ph¸p, nhËp ®Þnh d¹ng MapID X Y")
end

function _kgm_InputEquipEnhanceLevel()
    AskClientForNumber("_kgm_UpgradeAllItem", 1, 20, "NhËp cÊp ®é (1-20)")
end

function _kgm_InputStrEquip()
    AskClientForString("_kgm_AddCustomEquip", "2 1 50001", 1, 500, "NhËp vµo Id")
end

function _kgm_InputMapPos()
    AskClientForString("_kgm_MoveToMap", "200 1369 2834", 1, 500, "NhËp täa ®é")
end

function _kgm_InputEquipShop()
    AskClientForNumber("_kgm_OpenEquipShop", 1, 99999, "NhËp vµo Id")
end

function _kgm_InputAddCoat()
    AskClientForNumber("_kgm_AddCoat", 1, 99999, "NhËp vµo Id")
end

function _kgm_InputAddOrn()
    AskClientForNumber("_kgm_AddOrn", 1, 99999, "NhËp vµo Id")
end

function _kgm_AddTestCard()
    if KsgItem:CountAll(2, 1, 50001) == 0 then
        KsgAward:Give({ tbProp = { 2, 1, 50001 } })
    end
end

function _kgm_OpenEquipShop(nId)
    if not nId then
        return
    end
    if nId > 0 then
        SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", nId, "Shop " .. nId))
    end
end

function _kgm_AddCoat(nId)
    if not nId then
        return
    end
    if nId > 0 then
        KsgItem:AddCoatByBody(nId)
    end
end

function _kgm_AddOrn(nId)
    if not nId then
        return
    end
    if nId > 0 then
        KsgItem:AddOrnByBody(nId)
    end
end
