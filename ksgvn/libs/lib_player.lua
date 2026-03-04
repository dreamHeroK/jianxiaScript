KsgPlayer = KsgPlayer or {}

--------- Reborn and Level Functions
function KsgPlayer:GetBigLevel()
    return KsgPlayer:GetRebornCount() * 100 + KsgPlayer:GetLevel()
end

function KsgPlayer:GetRebornCount()
    local nReborn = GetPlayerRebornParam(REBORN_PARAM_LEVEL)
    if nReborn > 0 then
        return tonumber(nReborn + MAX_TRANSLIFE)
    end
    local nTrans = KsgTask:GetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_COUNT) or 0
    return tonumber(nTrans)
end

function KsgPlayer:GetRebornRoute()
    local nReborn = GetPlayerRebornParam(REBORN_PARAM_LEVEL)
    if nReborn > 0 then
        return GetPlayerRebornParam(REBORN_PARAM_ROUTE)
    end
    local nTransRoute = KsgTask:GetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_ROUTE)
    return tonumber(nTransRoute)
end

function KsgPlayer:GetRebornRouteName(nRouteIndex)
    if nRouteIndex and nRouteIndex < 1 and nRouteIndex > 4 then
        return "Kh´ng x∏c Æﬁnh"
    end
    if nRouteIndex then
        return g_tbRebornRouteNames[nRouteIndex]
    end
    return g_tbRebornRouteNames
end

function KsgPlayer:GetRebornAndLevel(nBigLevel)
    nBigLevel = nBigLevel or KsgPlayer:GetBigLevel()
    local nRebornCount = floor(nBigLevel / 100)
    local nLevel = mod(nBigLevel, 100)
    return nRebornCount, nLevel
end

function KsgPlayer:Reborn(nBigLevel, szCallBack)
    if KsgPlayer:GetBigLevel() >= nBigLevel then
        return
    end

    szCallBack = szCallBack or "no"
    local tSay = {
        "Ch‰n h≠Ìng chuy”n sinh<enter><color=red>(L≠u ˝, n’u tho∏t kh·i game vµo lÛc nµy sœ m t hÁ trÓ chuy”n sinh)<color>",
    }
    for nRebornRoute, szRouteName in g_tbRebornRouteNames do
        tinsert(tSay, format("Chuy”n sinh theo h≠Ìng %s/#KsgReborn:PlayerRebornWithNews(%d, %d, %s)", szRouteName, nBigLevel, nRebornRoute, szCallBack))
    end
    KsgNpc:SayDialog(tSay)
end

----- Faction functions
function KsgPlayer:ModifyFactionPoint(nPoint)
    KsgTask:Modify(TASKID_FACTION_POINT, nPoint)
    if nPoint > 0 then
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m cËng hi’n s≠ m´n.", nPoint))
    end
    if nPoint < 0 then
        KsgPlayer:Msg(format("Bﬁ trı %d Æi”m cËng hi’n s≠ m´n,", abs(nPoint)))
    end
end

----- Mixed functions
function KsgPlayer:ModifyPhongHoaPoint(nPoint)
    KsgTask:Modify(TASKID_PHONGHOA_POINT, nPoint)
    if nPoint > 0 then
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m phong hoa", nPoint))
    end
    if nPoint < 0 then
        KsgPlayer:Msg(format("Ti™u hao %d Æi”m phong hoa", abs(nPoint)))
    end
end

function KsgPlayer:ModifyLinhKhiPoint(nPoint)
    KsgTask:Modify(TASKID_TULUYENCHAU_LINHKHI, nPoint)
    if nPoint > 0 then
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m Linh Kh›", nPoint))
    end
    if nPoint < 0 then
        KsgPlayer:Msg(format("Ti™u hao %d Æi”m Linh Kh›", abs(nPoint)))
    end
end

function KsgPlayer:ModifyPopur2(nPoint)
    KsgTask:Modify(TASKID_BOOK_POPUR2_TOTAL, nPoint)
    KsgTask:Modify(TASKID_BOOK_POPUR2, nPoint)
    if nPoint > 0 then
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m lﬁch luy÷n", nPoint))
    end
    if nPoint < 0 then
        KsgPlayer:Msg(format("Ti™u hao %d Æi”m lﬁch luy÷n", abs(nPoint)))
    end
end

function KsgPlayer:ModifyBattlePoint(nPoint)
    KsgTask:Modify(TASKID_BATTLE_POINT, nPoint)
    if nPoint > 0 then
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m t›ch lÚy chi’n tr≠Íng.", nPoint))
    end
    if nPoint < 0 then
        KsgPlayer:Msg(format("Ti™u hao %d Æi”m t›ch lÚy chi’n tr≠Íng.", abs(nPoint)))
    end
end

function KsgPlayer:ModifyHonor(nPoint)
    local nHonor = KsgPlayer:GetHonor(1);
    if nHonor ~= 0 then
        if nHonor > 0 then
            KsgTask:Modify(TASKID_BATTLE_HONOR, nPoint)
        else
            KsgTask:Modify(TASKID_BATTLE_HONOR, -nPoint)
        end
        KsgPlayer:Msg("NhÀn Æ≠Óc " .. abs(nPoint) .. " Æi”m c´ng trπng.")
    end
end

function KsgPlayer:SetHonor(nPoint)
    local nHonor = KsgPlayer:GetHonor(1);
    if nHonor ~= 0 then
        if nHonor > 0 then
            KsgTask:Set(TASKID_BATTLE_HONOR, nPoint)
        else
            KsgTask:Set(TASKID_BATTLE_HONOR, -nPoint)
        end
        KsgPlayer:Msg("ßi”m c´ng trπng Æ≠Óc Æ∆t thµnh " .. abs(nPoint) .. " Æi”m.")
    end
end

function KsgPlayer:GetPhongHoa()
    return KsgTask:Get(TASKID_PHONGHOA_POINT)
end

function KsgPlayer:GetFactionPoint()
    return KsgTask:Get(TASKID_FACTION_POINT)
end

function KsgPlayer:GetLinhKhiPoint()
    return KsgTask:Get(TASKID_TULUYENCHAU_LINHKHI)
end

function KsgPlayer:GetBattleRank(bByCamp)
    local nRank = KsgTask:Get(TASKID_BATTLE_RANK)
    if bByCamp then
        return nRank
    end
    return abs(nRank)
end

function KsgPlayer:GetPetLevel()
    return GetSkillLevel(SKILL_PET_ID)
end

function KsgPlayer:GetGold()
    return floor(GetCash() / 10000)
end

function KsgPlayer:PayGold(nAmount)
    Pay(nAmount * 10000)
end

function KsgPlayer:AddGold(nAmount)
    Earn(nAmount * 10000)
end

function KsgPlayer:GetTongName()
    return GetTongName()
end

function KsgPlayer:IsDeath()
    return IsPlayerDeath() == 1
end

function KsgPlayer:GetMeridianLevel()
    return MeridianGetLevel()
end

function KsgPlayer:GetLevel()
    return GetLevel()
end

function KsgPlayer:GetExp()
    return GetExp()
end

function KsgPlayer:GetRepute()
    return GetReputation()
end

function KsgPlayer:GetPopur()
    return GetPopur()
end

function KsgPlayer:GetHonor(bByCamp)
    local nHonor = KsgTask:Get(TASKID_BATTLE_HONOR);
    if bByCamp then
        return nHonor
    end
    return abs(nHonor)
end

function KsgPlayer:GetSexName()
    local szSexName = ""
    if GetSex() == 1 then
        szSexName = "Thi’u hi÷p"
    elseif GetSex() == 2 then
        szSexName = "N˜ hi÷p"
    else
        szSexName = "Thi’u hi÷p/N˜ hi÷p"
    end
    return szSexName
end

function KsgPlayer:BigDelExp(nValue)
    if GetExp() < nValue then
        return 0
    end
    if nValue > MAX_EXP then
        ModifyExp(-MAX_EXP)
        nValue = nValue - MAX_EXP
        KsgPlayer:BigDelExp(nValue)
        KsgPlayer:Msg(format("TÊn th t %d Æi”m kinh nghi÷m", abs(MAX_EXP)))
    else
        ModifyExp(-nValue)
        KsgPlayer:Msg(format("TÊn th t %d Æi”m kinh nghi÷m", abs(nValue)))
    end
    return 1
end

function KsgPlayer:BigAddExp(nValue)
    if nValue > MAX_EXP then
        ModifyExp(MAX_EXP)
        nValue = nValue - MAX_EXP
        KsgPlayer:BigAddExp(nValue)
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m kinh nghi÷m", MAX_EXP))
    else
        ModifyExp(nValue)
        KsgPlayer:Msg(format("NhÀn Æ≠Óc %d Æi”m kinh nghi÷m", nValue))
    end
    return 1
end

function KsgPlayer:GetRouteName(nRoute, nExceptFaction)
    nRoute = nRoute or KsgPlayer:GetRoute()
    local tRoute = g_tbFactionRoute_Names
    if nExceptFaction then
        tRoute[ROUTE_VOMONPHAI] = ""
        tRoute[ROUTE_THIEULAM] = ""
        tRoute[ROUTE_DUONGMON] = ""
        tRoute[ROUTE_NGAMI] = ""
        tRoute[ROUTE_CAIBANG] = ""
        tRoute[ROUTE_VODANG] = ""
        tRoute[ROUTE_DUONGGIA] = ""
        tRoute[ROUTE_NGUDOC] = ""
        tRoute[ROUTE_CONLON] = ""
        tRoute[ROUTE_MINHGIAO] = ""
        tRoute[ROUTE_THUYYEN] = ""
    end
    if nRoute < 0 or not tRoute[nRoute] then
        if nExceptFaction then
            return ""
        end
        return "Ch≠a r‚ h≠Ìng"
    end
    return tRoute[nRoute]
end

function KsgPlayer:GetRoute()
    return GetPlayerRoute()
end

function KsgPlayer:GetFaction()
    return GetPlayerFaction()
end

function KsgPlayer:IsJoinedRoute()
    return KsgLib:IsInTable(KsgPlayer:GetRoute(), g_tbFactionRoutes)
end

function KsgPlayer:IsBangChu()
    return IsTongMember() == 1
end

function KsgPlayer:GetBody()
    return GetBody()
end

function KsgPlayer:GetAccount()
    return GetAccount()
end

function KsgPlayer:GetName()
    return GetName()
end


-- 0 = KTC, 1 = ngoπi c´ng, 2 = nÈi c´ng
function KsgPlayer:GetRouteType(nRoute)
    nRoute = nRoute or KsgPlayer:GetRoute()
    return g_tbFactionRoute_Types[nRoute]
end

function KsgPlayer:GetRouteBodyOffset()
    local nBody = KsgPlayer:GetBody()
    local nRoute = KsgPlayer:GetRoute()
    if KsgLib:IsInTable(nRoute, g_tbFactionRoute_Females) then
        return (nBody - 2) - 1
    end
    return nBody - 1
end

function KsgPlayer:GetWeaponTypeByRoute(nRoute)
    nRoute = nRoute or KsgPlayer:GetRoute()
    return g_tbFactionRoute_WeaponTypes[nRoute]
end

function KsgPlayer:Msg(szMsg)
    Msg2Player(szMsg)
end

----- Account Functions
function KsgPlayer:IsVipAccount()
    if GetVipCardRemainTime() > 0 then
        return 1
    end
    return nil
end

function KsgPlayer:IsGM(sAccount)
    sAccount = sAccount or GetAccount()
    return KsgLib:IsInTable(sAccount, g_tbAccounts_GM) or KsgPlayer:IsAdmin(sAccount)
end

function KsgPlayer:IsAdmin(sAccount)
    sAccount = sAccount or GetAccount()
    return KsgLib:IsInTable(sAccount, g_tbAccounts_Admin)
end

--------- Meridian Functions

function KsgPlayer:GetMeridianName(nLevel)
    nLevel = nLevel or MeridianGetLevel()
    return g_tbMeridianNames[nLevel] or "Ch≠a mÎ"
end

function KsgPlayer:MeridianLevelUp(nLevel, nAddChanKhi)
    nLevel = nLevel or 1
    local nCurLevel = KsgPlayer:GetMeridianLevel()
    if nCurLevel < nLevel then
        for _ = nCurLevel + 1, nLevel do
            MeridianUpdateLevel()
        end
        if nAddChanKhi then
            local nNum = nAddChanKhi - (MeridianGetDanTian() + MeridianGetQiHai())
            if nNum > 0 then
                AwardGenuineQi(nNum)
            end
        end
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    end
end

function KsgPlayer:ResetMeridianPoint(nConfirm)
    if not nConfirm or tonumber(nConfirm) ~= 1 then
        KsgNpc:SayDialog({
            "X∏c nhÀn t»y Æi”m kinh mπch?",
            "ßÂng ˝/#KsgPlayer:ResetMeridianPoint(1)",
            "Hu˚/no",
        })
        return
    end
    MeridianRestore(-1)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

----- Faction Functions
function KsgPlayer:GetRouteIndex()
    for nIndex, nRoute in g_tbFactionRoutes do
        if nRoute == KsgPlayer:GetRoute() then
            return nIndex
        end
    end
    return 0
end

----- Hoa canh
function KsgPlayer:OpenFair()
    if KsgTask:Get(TASKID_FAIR_UP_FLAG) == 0 then
        KsgTask:Set(TASKID_FAIR_UP_FLAG, 1)
        KsgPlayer:Msg("ß∑ mÎ h„a c∂nh.")
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    end
end

function KsgPlayer:SetFairLevel(nLevel)
    nLevel = nLevel or 1
    if nLevel > MAX_FAIR_LEVEL and not KsgPlayer:IsAdmin() then
        nLevel = MAX_FAIR_LEVEL
    end
    KsgTask:Set(TASKID_FAIR_VALUE, nLevel)
    local szParam = format("%s|%d|%d", GetName(), GetPlayerRoute(), nLevel)
    SendScript2Global("fair_level_changed", szParam) -- ”√¿¥∏¸–¬ªØæ≥≈≈––∞Ò
end

function KsgPlayer:LevelUpFair(nLevel)
    KsgPlayer:OpenFair()
    local nFairLv = KsgTask:Get(TASKID_FAIR_VALUE)
    local nNextFairLv = nFairLv + 1
    if not nLevel then
        UpPlayerFairStar(nNextFairLv)
        SetTask(TASKID_FAIR_UP_TIMESTAMP, GetTime())
        WriteLog(format("H„a C∂nh Tinh HÂn k›ch hoπt Name=%s PreLevel=%d CurLevel=%d", GetName(), nFairLv, nNextFairLv));
        local szParam = format("%s|%d|%d", GetName(), GetPlayerRoute(), nNextFairLv)
        SendScript2Global("fair_level_changed", szParam) -- ”√¿¥∏¸–¬ªØæ≥≈≈––∞Ò
        SendScript2VM("\\script\\global\\attr_point_addon.lua", "Update_Player_Attr_Point_Addon()")
        return
    end
    nLevel = nLevel - nFairLv
    if nLevel <= 0 then
        return
    end
    if nLevel > MAX_FAIR_LEVEL and not KsgPlayer:IsAdmin() then
        return
    end
    for _ = 1, nLevel do
        nFairLv = KsgTask:Get(TASKID_FAIR_VALUE)
        nNextFairLv = nFairLv + 1
        UpPlayerFairStar(nNextFairLv)
        SetTask(TASKID_FAIR_UP_TIMESTAMP, GetTime())
        WriteLog(format("H„a C∂nh Tinh HÂn k›ch hoπt Name=%s PreLevel=%d CurLevel=%d", GetName(), nFairLv, nNextFairLv));
        local szParam = format("%s|%d|%d", GetName(), GetPlayerRoute(), nNextFairLv)
        SendScript2Global("fair_level_changed", szParam) -- ”√¿¥∏¸–¬ªØæ≥≈≈––∞Ò
        SendScript2VM("\\script\\global\\attr_point_addon.lua", "Update_Player_Attr_Point_Addon()")
    end
end

function KsgPlayer:IsMaxSkill55()
    local nRoute = KsgPlayer:GetRoute()
    if not g_tbFactionRoute_Skill[nRoute] then
        return nil
    end
    local nSkillID = g_tbFactionRoute_Skill[nRoute].nSkill55
    if GetSkillLevel(nSkillID) >= MAX_FACTION_SKILL_LV_55 then
        return 1
    end
    return nil
end


