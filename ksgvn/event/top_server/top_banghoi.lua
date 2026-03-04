Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\top_server\\top_server_head.lua")

LIB_txtData.szPattern = "[A-Za-z0-9¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËEÐÌÎÏÑ£ÕÒÓÔÖãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùÝ×ØÜÞýúûüþ§¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùÝ×ØÜÞýúûüþ®_]"
g_szLogTitle = "§ua Top Bang"

function eventTop_ShowMenuTopBang()

    local szTong = KsgPlayer:GetTongName()
    if not szTong then
        return KsgNpc:FormalTalk(g_szNpcName ,  "ch­a gia nhËp bang héi, kh«ng thÓ tham gia ho¹t ®éng nµy.")
    end

    local nDate = KsgDate:Today()
    local nGetTongAwardDate = KsgLib:GetSrvCfg('tbTimeTop').nGetTongAwardDate
    local tbSay = {
        g_szNpcName .. format("<color=gold>%s<color> ®· khai më, triÒu ®×nh giao cho ta träng tr¸ch ph¸t th­ëng cho c¸c Bang héi cã cèng hiÕn lín ®ång thêi ®Ó c¸c bang héi cã c¬ héi cïng nhau tranh tµi. C¸c h¹ cã muèn tham gia kh«ng?<enter>(Thêi gian nhËn th­ëng lµ <color=green>%s<color>)", KsgLib:GetSrvCfg('szName'), KsgDate:ToString(nGetTongAwardDate))
    }
    if KsgLib:IsInDualTopTime() then
        tinsert(tbSay, "Ta muèn ®¨ng ký ®ua top cèng hiÕn bang héi/register")
        tinsert(tbSay, "Ta muèn cèng hiÕn cho bang héi hïng m¹nh/showMenuContribute")
    end
    tinsert(tbSay, "Xem ®iÓm cèng hiÕn cña c¸c bang héi/checkRank")
    if nDate == nGetTongAwardDate or KsgPlayer:IsGM() then
        tinsert(tbSay, format("Thµnh viªn nhËn th­ëng bang héi h¹ng 1,2,3/#getAward(%d)", TOP_BANG_AWARD_TYPE_MEMBER))
        if KsgPlayer:IsBangChu() then
            tinsert(tbSay, format("Bang chñ nhËn th­ëng bang héi h¹ng 1,2,3/#getAward(%d)", TOP_BANG_AWARD_TYPE_LEADER))
        end
    end
    tinsert(tbSay, "\nTa chØ ngã qua th«i/no")
    KsgNpc:SayDialog(tbSay)
end

function register()
    local szTong = GetTongName()
    local szAcc = GetAccount()
    local szRole = GetName()
    local nLevel = GetLevel()
    if nLevel < TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("§¼ng cÊp cña c¸c h¹ kh«ng ®ñ %d, kh«ng thÓ ®¨ng ký tham gia!", TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL))
    end
    if not KsgPlayer:IsMaxSkill55() then
        return KsgNpc:Talk(g_szNpcName .. "Kü n¨ng skill 55 cña c¸c h¹ ch­a ®ñ. NÕu muèn ®¨ng ký tham gia, h·y n©ng cÊp kü n¨ng cÊp 55 råi ®Õn gÆp ta.");
    end
    if not KsgPlayer:IsBangChu() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.")
    end
    if LIB_txtData:CheckString(szTong) > 0 then
        return KsgNpc:Talk(g_szNpcName .. "Tªn bang héi c¸c h¹ cã nhiÒu ch÷ l¹ qu¸, ta kh«ng biÕt ghi l¹i nh­ thÕ nµo n÷a. Hay lµ ®æi bang kh¸c ®i nhÐ.")
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName > 0 then
        return KsgNpc:Talk(g_szNpcName .. "Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng cÇn ®¨ng ký thªm lÇn n÷a.")
    end
    local szLogAward = szTong .. "	" .. szAcc .. "	" .. szRole .. "	0"
    LIB_txtData:AddLine(szLogAward)
    KsgNpc:Talk(g_szNpcName .. "Xin chóc mõng! Bang héi c¸c h¹ b¸o danh thµnh c«ng vµo cuéc ®ua vinh danh bang héi danh gi¸ , h·y b¸o tin cho c¸c thµnh viªn tÝch cùc x©y dùng danh tiÕng bang héi.")
    gf_WriteLogEx(g_szLogTitle, "nhËn", 1, "§¨ng ký thµnh c«ng")
end

function showMenuContribute()
    local szTong = KsgPlayer:GetTongName()
    if not szTong then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ kh«ng cã trong danh s¸ch bÊt kú bang nµo. H·y t×m chç gia nhËp tr­íc ®· nhÐ.")
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName == 0 then
        return KsgNpc:Talk(g_szNpcName .. "Bang héi c¸c h¹ kh«ng cã trong danh s¸ch ®¨ng ký vinh danh.")
    end
    local tbSay = { g_szNpcName .. "§«ng ng­êi thªm søc m¹nh. Ng­¬i h·y cèng hiÕn cho bang héi b»ng hÕt kh¶ n¨ng m×nh cã." }
    for nIndex, tbContribCfg in g_tbTopBangMaterialCfg do
        tinsert(tbSay, tbContribCfg.szDesc .. "/#contribute(" .. nIndex .. ")")
    end
    tinsert(tbSay, "\nTa chØ ngã qua th«i/no")
    KsgNpc:SayDialog(tbSay)
end

function contribute(nOption)
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk("Tr¹ng th¸i hiÖn t¹i kh«ng thÓ cèng hiÕn.")
    end
    if KsgPlayer:GetLevel() < TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("§¼ng cÊp cña c¸c h¹ kh«ng ®ñ %d, kh«ng thÓ tham gia cèng hiÕn!", TOP_BANG_CONTRIBUTE_REQUIRE_LEVEL))
    end
    if not KsgPlayer:IsMaxSkill55() then
        return KsgNpc:Talk(g_szNpcName .. "Kü n¨ng skill 55 cña c¸c h¹ ch­a ®ñ, kh«ng thÓ tham gia cèng hiÕn!");
    end
    local szName = GetName()
    local szTong = GetTongName() or ""
    local nPoint = KsgTask:GetPosValue(TASKID_TOP_BANG, 1, 4)
    local nAddPoint = g_tbTopBangMaterialCfg[nOption].nPoint
    if (nPoint + nAddPoint) > MAX_CONTRIBUTE_POINT_PER_DAY then
        return KsgNpc:Talk(g_szNpcName .. "Møc cèng hiÕn ng­¬i chän v­ît qu¸ sè ®iÓm tèi ®a mçi ngµy. H·y chän møc kh¸c hoÆc mai quay l¹i nhÐ.")
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nBang = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nBang = i
            break
        end
    end
    if nBang == 0 then
        return
    end
    if not KsgLib:PayMaterial(g_tbTopBangMaterialCfg[nOption].tbCondition) then
        return
    end
    KsgTask:SetPosValue(TASKID_TOP_BANG, (nPoint + nAddPoint), 1, 4)
    LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + nAddPoint
    sort(LIB_txtData.tbTextData, function(x, y)
        return tonumber(x[4]) > tonumber(y[4])
    end)
    LIB_txtData:SaveMultiColumn()
    if nAddPoint == 100 then
        AddGlobalNews(szName .. " ®· cèng hiÕn 100 ®iÓm cho bang " .. szTong .. ". M¹nh Th­êng Qu©n ®· xuÊt hiÖn t¹i bang " .. szTong .. ".")
    end
    local nNewRank = 10000
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nNewRank = i
            break
        end
    end
    if nBang >= nNewRank then
        if LIB_txtData.tbTextData[(nNewRank + 1)] ~= nil then
            AddGlobalNews(szName .. " ®· gióp bang héi " .. LIB_txtData.tbTextData[nNewRank][1] .. " v­ît qua bang héi " .. LIB_txtData.tbTextData[(nNewRank + 1)][1] .. ". D­êng nh­ bang " .. LIB_txtData.tbTextData[(nNewRank + 1)][1] .. " cã biÓu hiÖn ®uèi søc.")
        end
    end
    KsgPlayer:Msg("B¹n ®· cèng hiÕn " .. nAddPoint .. " ®iÓm cho bang héi.")
    gf_WriteLogEx(g_szLogTitle, "thªm", 1, "Cèng hiÕn " .. nAddPoint .. " ®iÓm")
    showMenuContribute()
end

function checkRank()
    local tbData = {}
    tinsert(tbData, g_szNpcName .. "XÕp h¹ng Top cèng hiÕn cña c¸c Bang Héi hiÖn t¹i:\n")
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    for i = 1, getn(LIB_txtData.tbTextData) do
        local nIndex = floor(i / 9) + 1
        if tbData[nIndex] == nil then
            tinsert(tbData, g_szNpcName .. "XÕp h¹ng Top cèng hiÕn cña c¸c Bang Héi hiÖn t¹i:\n")
        end
        tbData[nIndex] = tbData[nIndex] .. "H¹ng " .. i .. " - " .. "<color=yellow>" .. LIB_txtData.tbTextData[i][1] .. "<color>: <color=red>" .. LIB_txtData.tbTextData[i][4] .. " ®iÓm<color>\n"
    end
    for i = 1, getn(tbData) do
        KsgNpc:Talk(tbData[i])
    end
end

function getAward(nType)
    local szTong = GetTongName() or ""
    if szTong == "" then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ nhËn th­ëng.")
    end
    if nType == TOP_BANG_AWARD_TYPE_MEMBER then
        if KsgTask:GetPosValue(TASKID_TOP_BANG, 5, 5) == 1 then
            return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
        end
    else
        if KsgTask:GetPosValue(TASKID_TOP_BANG, 6, 6) == 1 then
            return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ®· nhËn th­ëng, kh«ng thÓ nhËn thªm lÇn n÷a.")
        end
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 10000
    local nDiemCongHien = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            nDiemCongHien = LIB_txtData.tbTextData[i][4]
            break
        end

    end

    if tonumber(nDiemCongHien) < TOP_BANG_CONTRIBUTE_POINT_MIN then
        return KsgNpc:Talk(g_szNpcName .. format("§iÓm cèng hiÕn kh«ng ®ñ %d kh«ng thÓ nhËn th­ëng ®ua top.", TOP_BANG_CONTRIBUTE_POINT_MIN))
    end

    if nType == TOP_BANG_AWARD_TYPE_MEMBER then
        if nCheckTongName <= 3 then
            GetMemberAward(nCheckTongName)
        else
            KsgNpc:Talk(g_szNpcName .. "Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
        end
    else
        if nCheckTongName <= 3 then
            GetLeaderAward(nCheckTongName)
        else
            KsgNpc:Talk(g_szNpcName .. "Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
        end
    end
end

function canReceiveAward()
    local szTong = GetTongName() or ""
    if szTong == "" then
        return nil
    end
    LIB_txtData:Init(FILENAME_TOP_BANG)
    LIB_txtData:LoadMultiColumn()
    local nCheckTongName = 10000
    for i = 1, getn(LIB_txtData.tbTextData) do
        if szTong == LIB_txtData.tbTextData[i][1] then
            nCheckTongName = i
            break
        end
    end
    if nCheckTongName <= 3 then
        return 1
    end
    return nil
end

function GetMemberAward(nRank)

    if not canReceiveAward() then
        return KsgNpc:Talk("C¸c h¹ kh«ng cã tªn trong danh s¸ch nhËn th­ëng!")
    end

    if not KsgLib:HasEnoughBagRoom(15, 300) then
        return
    end

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.")
    end

    if KsgPlayer:GetBigLevel() < TOP_BANG_AWARD_REQUIRE_LEVEL then
        return KsgNpc:Talk(g_szNpcName .. format("C¸c h¹ ch­a ®¹t <color=red>%s<color>, kh«ng thÓ nhËn phÇn th­ëng nµy!", KsgLib:Level2String(TOP_BANG_AWARD_REQUIRE_LEVEL)))
    end

    local nJoinTime = GetJoinTongTime()
    local nNow = GetTime()
    if KsgDate:DateDiff(nJoinTime, nNow) < TOP_BANG_MEMBER_AWARD_REQUIRE_JOIN_DAY then
        return KsgNpc:Talk(g_szNpcName .. format("Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n %d ngµy, kh«ng thÓ nhËn th­ëng!", TOP_BANG_MEMBER_AWARD_REQUIRE_JOIN_DAY))
    end

    KsgAward:Give(g_tbTopBangAwardCfg.Member[nRank], "[Top Bang] PhÇn th­ëng thµnh viªn bang héi h¹ng " .. nRank)
    KsgTask:SetPosValue(TASKID_TOP_BANG, 1, 5, 5)
    KsgNpc:Talk(g_szNpcName .. "NhËn thµnh c«ng phÇn t­ëng dµnh cho thµnh viªn bang h¹ng " .. nRank)
end

function GetLeaderAward(nRank)
    if not KsgLib:HasEnoughBagRoom(25, 300) then
        return
    end

    if not KsgPlayer:IsBangChu() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn nhËn th­ëng, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.")
    end

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.")
    end

    local nLastAssignTime = GetLastAssignTime()
    local nNow = GetTime()
    if KsgDate:DateDiff(nLastAssignTime, nNow) < TOP_BANG_LEADER_AWARD_REQUIRE_ASSIGN_DAY then
        return KsgNpc:Talk(g_szNpcName .. format("Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n %d ngµy, kh«ng thÓ nhËn th­ëng!", TOP_BANG_LEADER_AWARD_REQUIRE_ASSIGN_DAY))
    end

    KsgAward:Give(g_tbTopBangAwardCfg.Leader[nRank], "[Top Bang] PhÇn th­ëng bang chñ bang héi h¹ng " .. nRank)
    KsgTask:SetPosValue(TASKID_TOP_BANG, 1, 6, 6)
    KsgNpc:Talk(g_szNpcName .. "NhËn thµnh c«ng phÇn t­ëng dµnh cho bang h¹ng " .. nRank)
end


