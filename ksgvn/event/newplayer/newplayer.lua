Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\newplayer\\newplayer_head.lua")

function newplayer_ActiveGiftCode()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:FormalTalk(g_szNpcName, "ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng")
    end
    if KsgTask:GetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER) == 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "®· nhËn phÇn th­ëng Giftcode nµy råi, vui lßng truy cËp <color=gold>https://volam2.zing.vn<color> ®Ó xem chi tiÕt ho¹t ®éng.")
    end
    if GetExtPoint(EXTPOINT_GIFTCODE_NEWPLAYER) < 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "ch­a cã kÝch ho¹t Giftcode, vui lßng truy cËp <color=gold>https://volam2.zing.vn<color> ®Ó xem chi tiÕt ho¹t ®éng.")
    end
    if not KsgLib:HasEnoughBagRoom(15, 500) then
        return
    end
    if PayExtPoint(EXTPOINT_GIFTCODE_NEWPLAYER, 1) == 1 then
        KsgAward:Give(_g_tbAward_Giftcode_NewPlayer)
        KsgTask:SetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER, 1)
        return KsgNpc:FormalTalk(g_szNpcName, "kÝch ho¹t thµnh c«ng Giftcode Ngäa Hæ Tµng Long, nhËn ®­îc phÇn th­ëng phong phó! Xin h·y kiÓm tra trong tói hµnh trang!")
    end
end

function newplayer_GetDailyGift()
    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng h«m nay råi, kh«ng thÓ nhËn l¹i!")
    end
    if not KsgLib:HasEnoughBagRoom(15) then
        return
    end
    local tbAward = g_tbNewPlayerGift_Daily
    if KsgPlayer:IsVipAccount() then
        tbAward = g_tbNewPlayerGift_Daily_VIP
    end
    KsgAward:Give(tbAward)
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT, 1)
    KsgNpc:Talk("NhËn phÇn th­ëng hµng ngµy thµnh c«ng!")
end

function newplayer_GetWeeklyGift()
    local wDay = tonumber(date("%w"))
    if wDay ~= 6 and wDay ~= 0 then
        return KsgNpc:Talk(g_szNpcName .. "PhÇn th­ëng nµy chØ cã thÓ nhËn vµo cuèi tuÇn. Xin h·y quay l¹i sau.")
    end

    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng tuÇn nµy råi, kh«ng thÓ nhËn l¹i!!")
    end

    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end

    local tbAward = g_tbNewPlayerGift_Weekly
    if KsgPlayer:IsVipAccount() then
        tbAward = g_tbNewPlayerGift_Weekly_VIP
    end

    KsgAward:Give(tbAward)
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT, 1)
    KsgNpc:Talk("NhËn phÇn th­ëng hµng tuÇn thµnh c«ng!")
end

-- Nhan thuong thang cap cs 8, 9, 10
function newplayer_ShowSupportRebornAward()
    local nStartDate = KsgLib:GetSrvCfg('tbTimeTop').nStartDate
    local nEndDate = KsgLib:GetSrvCfg('tbTimeTop').nEndDate
    local tSay = {
        g_szNpcName .. "Ho¹t ®éng <color=yellow>§ua Top NhËn Th­ëng<color> diÔn ra tõ ngµy<color=gold> " .. KsgDate:ToString(nStartDate) .. " ®Õn 24:00 " .. KsgDate:ToString(nEndDate) .. "<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=gold>https://volam2.zing.vn<color>"
    }
    if not KsgLib:IsInDualTopTime() then
        tSay = {
            g_szNpcName .. "C¸c h¹ muèn nhËn hç trî nµo?"
        }
    end
    for nIndex, tbLevelCfg in g_tbNewPlayer_AwardSupportReborn do
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex) ~= 1 then
            if tbLevelCfg.nAwardLevel > 1090 then
                tinsert(tSay, format("NhËn phÇn th­ëng ®¹t %s/#newplayer_GetSupportRebornAward(%d)", KsgLib:Level2String(tbLevelCfg.nAwardLevel), nIndex))
            else
                tinsert(tSay, format("NhËn quµ trùc tiÕp th¨ng tiÕn ®Õn %s/#newplayer_GetSupportRebornAward(%d)", KsgLib:Level2String(tbLevelCfg.nAwardLevel), nIndex))
            end

        end
    end
    if getn(tSay) == 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "d­êng nh­ ®· nhËn hÕt phÇn th­ëng lÇn nµy, khi kh¸c l¹i tíi nhÐ!")
    end
    tinsert(tSay, "\nT¹m thêi ch­a muèn nhËn/no")
    KsgNpc:SayDialog(tSay)
end

function newplayer_GetSupportRebornAward(nIndex)
    if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!")
    end

    if not g_tbNewPlayer_AwardSupportReborn[nIndex] then
        return KsgNpc:Talk(g_szNpcName .. "PhÇn th­ëng nµy kh«ng tån t¹i!")
    end
    local tbRebornAwardCfg = g_tbNewPlayer_AwardSupportReborn[nIndex]
    local tbAward = tbRebornAwardCfg.tbAward
    local tbAwardBonus = {}
    if KsgPlayer:GetBigLevel() >= tbRebornAwardCfg.nAwardLevel then
        if type(tbRebornAwardCfg.tbAwardBonus) == "table" then
            tbAwardBonus = tbRebornAwardCfg.tbAwardBonus
        end
    end

    if not KsgLib:HasEnoughBagRoom(25, 1000) then
        return
    end

    if KsgLib:PayMaterial(tbRebornAwardCfg.tbCondition) then
        KsgAward:Give(tbAward, "RebornAward_" .. nIndex)
        if KsgLib:TableLength(tbAwardBonus) > 0 then
            KsgAward:Give(tbAwardBonus, "RebornAwardBonus_" .. nIndex)
        end
        KsgTask:SetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex, 1)
    end
end

function newplayer_HasRebornAward()
    for nIndex, _ in g_tbNewPlayer_AwardSupportReborn do
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex) ~= 1 then
            return 1
        end
    end
    return nil
end