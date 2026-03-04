-- 2019¸£Éñ
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
tFushen = {
    "Phóc ThÇn", "Phóc ThÇn", 
    "\\script\\isolate\\online_activites\\2019\\spring_festival\\god_fu.lua"
}
local tFushenPos = {
    {200,1427,2879}
}

tZZ = {2,1,31277} -- ôÕ×Ó
tZZMat = {
    {item = {2,1,31273,1}, content = "L¸ gãi b¸nh"},
    {item = {2,1,31275,5}, content = "G¹o NÕp Ngon"},
    {item = {2,1,31274,5}, content = "ThÞt Heo Ngon"},
    {item = {2,1,31276,5}, content = "§Ëu Xanh Ngon"},
}

tMonsterName2Info = {
--               »ñµÃ¸ÅÂÊÍò·Öµã, ÄÜ»ñµÃµÄÎïÆ·Id(¹ØÁªtZZMat,nÑ¡1), »ñµÃµÄÊýÁ¿
    ["TÇm B¶o Nh©n"] = {500, {2, 3, 4}, 1},
    ["Sa M¹c Hµnh Nh©n"] = {500, {2, 3, 4}, 1},
    ["NhÊt PhÈm §­êng ¸m S¸y Sø"] = {500, {2, 3, 4}, 1},
    ["KÎ ®µo mé"] = {500, {2, 3, 4}, 1},
}

function main()--FS2019_OnTalk2Fushen()
    local szTitle = format("<color=green>%s<color>: T¹ch! §× ®ïng! §× ®ïng!......", GetTargetNpcName())
    local tbSay = {}
    tinsert(tbSay,"NhËn phÇn th­ëng n¨m míi/FS2019_Award")
    tinsert(tbSay,format("Mua ®¹o cô [Xu©n L«i]: %s/FS2019_FireWork1"," (Mçi lÇn 100 Vµng)"))
    tinsert(tbSay,format("Mua ®¹o cô [M·n Hång]: %s/FS2019_FireWork2"," (Mçi lÇn 100 Vµng)"))
    tinsert(tbSay,"Gãi B¸nh/ZZ2019_ZZ")
    tinsert(tbSay,"C¬m §Çu N¨m/NYF2019")
    if sf2019_check_qrj_date() == 1 then
        tinsert(tbSay,"Event lÔ t×nh nh©n/QRJ2019")
    end
    tinsert(tbSay,"§Õn chóc mõng n¨m míi/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ZZ2019_ZZ()
    if sf2019_check_main_date() ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: C¶ nhµ cïng ngåi gãi b¸nh, nÊu b¸nh, ®ã lµ ký øc ®Çm Êm ®· kh¾c s©u trong t©m trÝ mçi ng­êi. §èi víi nh÷ng ng­êi con ®i xa, h­¬ng vÞ ngµy tÕt, chÝnh lµ quª nhµ.\n", GetTargetNpcName())
    szTitle = szTitle .. format("      Trong ho¹t ®éng, v­ît ¶i Th¸i NhÊt Th¸p, KiÕm §·ng YÕn V©n, %s ®é khã bÊt kú, ®­îc nhËn <color=yellow>%s<color>\n", "<color=green>100%<color>", format("L¸ Dong x%d", tZZMat[1].item[4]))
    szTitle = szTitle .. format("      Trong ho¹t ®éng, ®¸nh b¹i NPC ë c¸c khu vùc sau cã %s c¬ héi nhËn ®­îc 1 lo¹i nguyªn liÖu: <color=yellow>%s<color>\n", "<color=green>1%<color>", "G¹o NÕp,ThÞt Heo,§Ëu Xanh")
    szTitle = szTitle .. format("      §Þa ®iÓm: %s     Môc tiªu: %s/%s\n", "Mª cung sa m¹c", "TÇm B¶o Nh©n", "Sa M¹c Hµnh Nh©n")
    szTitle = szTitle .. format("      §Þa ®iÓm: %s     Môc tiªu: %s/%s\n", "TÇn L¨ng", "NhÊt PhÈm §­êng ¸m S¸y Sø", "KÎ ®µo mé")
    szTitle = szTitle .. format("     L¸ Dong <color=green>x%d<color> + G¹o NÕp <color=green>x%d<color> + ThÞt Heo <color=green>x%d<color> + §Ëu Xanh <color=green>x%d<color> + Vµng <color=green>x%d<color> = B¸nh Ngon",
                                    1,5,5,5,10
                                )
    local tbSay = {}
    tinsert(tbSay, "Gãi B¸nh/ZZ2019_MakeZZ")
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ZZ2019_MakeZZ()
    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    local minNum = 999999999
    for i = 1, getn(tZZMat) do
        local mat = tZZMat[i].item
        local has = GetItemCount(mat[1],mat[2],mat[3])
        local need = mat[4]
        minNum = min(minNum, floor(has/need))
    end
    local nCash = GetCash()
    minNum = min(minNum, floor(nCash / (10 * 10000) ))
    if minNum <= 0 then 
        Talk(1,"",format("<color=green>%s<color>: Trªn ng­êi kh«ng ®ñ nguyªn liÖu hoÆc Vµng, kh«ng thÓ lµm b¸nh.\n", GetTargetNpcName()))
        return
    end
    AskClientForNumber("ZZ2019_MakeZZConfirm", 1, minNum, "Muèn gãi bao nhiªu c¸i??")
end

function ZZ2019_MakeZZConfirm(nNum)
    if nNum <= 0 then
        return
    end

    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    local minNum = 999999999
    for i = 1, getn(tZZMat) do
        local mat = tZZMat[i].item
        local has = GetItemCount(mat[1],mat[2],mat[3])
        local need = mat[4]
        minNum = min(minNum, floor(has/need))
    end
    local nCash = GetCash()
    minNum = min(minNum, floor(nCash / (10 * 10000) ))
    if minNum < nNum then 
        Talk(1,"",format("<color=green>%s<color>: Trªn ng­êi kh«ng ®ñ nguyªn liÖu hoÆc Vµng, kh«ng thÓ lµm b¸nh.\n", GetTargetNpcName()))
        return
    end
    for i = 1, getn(tZZMat) do
        local mat = tZZMat[i].item
        if DelItem(mat[1],mat[2],mat[3],mat[4] * nNum) ~= 1 then
            Talk(1,"","<color=red>Gãi b¸nh thÊt b¹i!<color>")
            return
        end
    end 
    Pay(nNum*10*10000)
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    local ret, itemId = gf_AddItemEx2({tZZ[1], tZZ[2], tZZ[3], nNum}, "B¸nh Ngon", SF_LOG_KEY_WORD, "Gãi B¸nh", resTime)
end

function ZZ2019_OnUseZZ(nItemIdx)
    if sf2019_check_main_date() ~= 1 then
        DelItemByIndex(nItemIdx, 1)
        Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông!")
        return 
    end
    local szAward = "chunjie_zongzi"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","Sö dông thÊt b¹i")
        return 0
    end
    local used = GetTask(2825)
    if used >= ZZ2019_MaxUseZZ then
        Talk(1,"","Sè lÇn sö dông ®· ®¹t giíi h¹n")
        return
    end
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        Talk(1,"","Sö dông thÊt b¹i")
        return
    end
    SetTask(2825, used + 1)
    CustomAwardGiveGroup(szAward, 0)
end

function ZZ2019_OnKillMonster(para)
    local tInfo = tMonsterName2Info[para[2][1]]
    local rnd = random(1,10000)
    if rnd <= tInfo[1] then
        if gf_Judge_Room_Weight(1, 10, nil) ~= 1 then
            Msg2Player("Hµnh trang kh«ng ®ñ chç, kh«ng thÓ nhËn vËt phÈm ho¹t ®éng")
            return 0;
        end
        local id = random(1,getn(tInfo[2]))
        local tItem = tZZMat[tInfo[2][id]]
        local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
        local ret,itemId = gf_AddItemEx2({tItem.item[1],tItem.item[2],tItem.item[3],1}, tItem.content, SF_LOG_KEY_WORD, "GiÕt qu¸i", resTime)
    end
end

function ZZ2019_OnMissionCompleted(param)
    local matId = param[4][1]
    local rate = param[4][2]
    local rnd = random(1,10000)
    if rnd <= rate then
        if gf_Judge_Room_Weight(1, 10, nil) ~= 1 then
            Msg2Player("Hµnh trang kh«ng ®ñ chç, kh«ng thÓ nhËn vËt phÈm ho¹t ®éng")
            return 0;
        end
        local tItem = tZZMat[matId]
        local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
        local ret,itemId = gf_AddItemEx2({tItem.item[1],tItem.item[2],tItem.item[3],1}, tItem.content, SF_LOG_KEY_WORD, "Th­ëng V­ît Phã B¶n", resTime)
    end
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

function FS2019_Award()
    if sf2019_check_main_date() ~= 1 then return end
    
    if get_trans_level() < 59 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("CÊp %d trë lªn, ®· häc 1 bé kü n¨ng cÊp 55 míi ®­îc tham gia ho¹t ®éng.", 59))
		return 0;
	end
    local szTitle = format("<color=green>%s<color>: Trong ho¹t ®éng, mçi ngµy cã thÓ ®Õn chç ta nhËn th­ëng. Khi nhËn ®ñ 10 lÇn, ®­îc nhËn thªm 1 phÇn <color=yellow>%s<color>.",
        GetTargetNpcName(),
        "Quµ Ngäc Kim (§Çu)"
    )
    local awardCnt = GetTask(2826)
    

    if GetTask(2824) == 1 then
        szTitle = szTitle..format("\n      §· nhËn <color=green>%d<color> lÇn.", awardCnt)
        szTitle = szTitle.."\n      <color=red>H«m nay ®· nhËn råi, mai h·y quay l¹i!<color>"
        Talk(1,"main",szTitle)
        return 
    end
    if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
        szTitle = szTitle..format("\n      §· nhËn <color=green>%d<color> lÇn.", awardCnt)
        szTitle = szTitle.."\n      <color=red>Hµnh trang kh«ng ®ñ chç, cÇn cã Ýt nhÊt 2 « trèng.<color>"
        Talk(1,"main",szTitle)
		return 0;
    end

    SetTask(2824, 1)
    SetTask(2826, awardCnt+1)
    szTitle = szTitle..format("\n      §· nhËn <color=green>%d<color> lÇn.", awardCnt+1)
    if awardCnt+1 == 10 then
        szTitle = szTitle..format("\n      <color=yellow>§· nhËn ®ñ 10 lÇn, nhËn ®­îc %s<color>","Quµ Ngäc Kim (§Çu)")
        gf_AddItemEx({2,1,31511,1,4}, "Quµ Ngäc Kim (§Çu)")
    end
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    local ret,itemId = gf_AddItemEx2({2,1,31288,1}, "VÐ Sè N¨m Míi", SF_LOG_KEY_WORD, "NhËn Th­ëng Ngµy", resTime)
    Talk(1,"main",szTitle)
end

function FS2019_FireWork1()
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    AskClientForNumber("FS2019_FireWork1Confirm", 1, 99, "Muèn mua bao nhiªu phÇn??")
end

function FS2019_FireWork2()
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    AskClientForNumber("FS2019_FireWork2Confirm", 1, 99, "Muèn mua bao nhiªu phÇn??")
end

function FS2019_FireWork1Confirm(nNum)
    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local cash = GetCash()
    if cash < nNum * 100 * 10000 then
        Talk(1, "", "Kh«ng ®ñ Vµng")
        return
    end
    Pay(nNum * 100 * 10000)
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    gf_AddItemEx2({2,3,31272,nNum}, "Xu©n L«i", SF_LOG_KEY_WORD, "Mua Xu©n L«i", resTime)
end

function FS2019_FireWork2Confirm(nNum)
    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local cash = GetCash()
    if cash < nNum * 100 * 10000 then
        Talk(1, "", "Kh«ng ®ñ Vµng")
        return
    end
    Pay(nNum * 100 * 10000)
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    gf_AddItemEx2({2,3,31287,nNum}, "M·n Hång", SF_LOG_KEY_WORD, "Mua M·n Hång", resTime)
end

function FS2019_OnSeverStart()
    for i = 1, getn(%tFushenPos) do
        local tPos = %tFushenPos[i]
        local idx = CreateNpc(tFushen[1],tFushen[2],tPos[1],tPos[2],tPos[3])
        SetNpcScript(idx,tFushen[3])
    end
end

tNYFMissions = {
    -- ["guildname"] = dynamicMapId,
    -- id is nil means dungeon has never been opened
    -- id == 0 means dungeon was opened and closed
}

function NYF2019_Open()
    if SF2019_DEBUG ~= 1 then
        if sf2019_check_main_date() ~= 1 then return end
        if sf2019_check_nyf_date() ~= 1 then return end
    end

    local tongName = GetTongName()
    if tongName == "" then
        Talk(1,"",format("<color=green>%s<color>: Vµo bang míi ®­îc tham gia ho¹t ®éng nµy......", GetTargetNpcName()))
		return 0
    end
    local nMapId = tNYFMissions[tongName]
    if nMapId ~= nil then -- ÒÑ¾­ÓÐÁË¸±±¾
        if nMapId == 0 then
            Talk(1,"",format("<color=green>%s<color>: Mçi bang chØ ®­îc më ho¹t ®éng C¬m §Çu N¨m 1 lÇn.", GetTargetNpcName()))
            return 0
        end
        tbMission:TeamEnter(nMapId, 1); -- ÒÑ¾­ÓÐÁË¸±±¾, Ö±½Ó½øÈë
        return
    end

    local nDuty = GetTongDuty();
	if nDuty < 1 or nDuty > 2 then
		Talk(1,"",format("<color=green>%s<color>: ChØ bang chñ vµ phã bang ®­îc më ho¹t ®éng nµy", GetTargetNpcName()))
		return 0
    end
    nMapId = tbMission:Create();
    tNYFMissions[tongName] = nMapId
    tbMission:TeamEnter(nMapId, 1);
end

function NYF2019_Close()
    local tongName = GetTongName()
    tNYFMissions[tongName] = 0
end

function NYF2019()
    local szTitle = format("<color=green>%s<color>: Trong c¶ ngµy %d-%d-%d, thµnh viªn bang héi cïng tÒ tùu mõng n¨m míi. Ngµy TÕt Nguyªn Tiªu, qu¶n lý bang cã thÓ ®Õn chç ta hÑn ®Æt C¬m §Çu N¨m.......",
        GetTargetNpcName(),
        tonumber(strsub(NYF2019_DATE,1,4)) or 0, 
        tonumber(strsub(NYF2019_DATE,5,6)) or 0, 
        tonumber(strsub(NYF2019_DATE,7,8)) or 0)
    szTitle = szTitle .. "\n    <color=green>Sau khi më, sÏ cã 10 phót chê ®îi c¸c thµnh viªn bang ®Õn ¨n C¬m §Çu N¨m<color>\n"
    szTitle = szTitle .. "    <color=green>Sau khi më, C¬m §Çu N¨m kÐo dµi 15 phót<color>\n"
    szTitle = szTitle .. "    <color=green>Mçi bang chØ ®­îc më C¬m §Çu N¨m 1 lÇn<color>\n"
    szTitle = szTitle .. "    <color=yellow>Ho¹t ®éng C¬m §Çu sÏ cã nhiÒu phÇn quµ sÏ ®­îc dµnh cho mäi ng­êi<color>\n"
    local tbSay = {}
    local tongName = GetTongName()

    if SF2019_DEBUG == 1 then tinsert(tbSay, "[DEBUG] Tham dù ho¹t ®éng C¬m §Çu N¨m/NYF2019_Open") end
    
    if tongName ~= "" and NYF2019_DATE == tonumber(date("%Y%m%d")) then
        local nMapId = tNYFMissions[tongName]
        if nMapId ~= nil then 
            tinsert(tbSay, "Tham dù ho¹t ®éng C¬m §Çu N¨m/NYF2019_Open")
        else
            tinsert(tbSay, "Më C¬m §Çu N¨m/NYF2019_Open")
        end
    end
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)

end

function SP2019_OnUseAwardTicket(nItemIdx)
    local dateCheck = sf2019_check_ticket_award_date()
    if dateCheck < 1 then
        Talk(1,"","Ch­a ®Õn thêi gian sö dông")
        return 
    end
    if dateCheck > 1 then
        DelItemByIndex(nItemIdx, 1)
        Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông!")
        return 
    end
    local szAward = "xinchunchoujiangquan"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","Sö dông thÊt b¹i")
        return 0
    end
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        Talk(1,"","Sö dông thÊt b¹i")
        return
    end
    Msg2Player(format("B¹n ®· sö dông %s","VÐ Sè N¨m Míi"))
    CustomAwardGiveGroup(szAward, 0)
end

function QRJ2019()
    if sf2019_check_qrj_date() ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: Trong ngµy LÔ T×nh Nh©n <color=red>%d- %d-%d<color>, ®Õn D­¬ng Ch©u gÆp X¶o N÷ ®Ó hoµn thµnh nhiÖm vô LÔ T×nh Nh©n. Sau ®ã tæ ®éi víi mét nh©n vËt kh¸c giíi, ®em ®¹o cô nhËn ®­îc tõ nhiÖm vô ®Õn chç ta, sÏ ®­îc nhËn quµ LÔ T×nh Nh©n..", 
        GetTargetNpcName(), 
        tonumber(strsub(QRJ2019_DATE,1,4)) or 0, 
        tonumber(strsub(QRJ2019_DATE,5,6)) or 0, 
        tonumber(strsub(QRJ2019_DATE,7,8)) or 0)
    local tbSay = {}
    tinsert(tbSay, "Tham gia/QRJ2019_StartAct")
    tinsert(tbSay, "§æi quµ/QRJ2019_Exchange")
    tinsert(tbSay, "trë l¹i/main")
    Say(szTitle, getn(tbSay), tbSay)
end

function QRJ2019_StartAct()
    if sf2019_check_qrj_date() ~= 1 then return end

    local sex = GetSex()
    local sex2taskID = QRJ_GTASKID_TABLE or nil;
    local sex2Name = {
        "ThiÕu hiÖp","N÷ hiÖp "
    }
    if not sex2taskID or  not sex2taskID[sex] then
        return
    end

    if gf_GetTaskBit(2828,2) ~= 1 then
        gf_SetTaskBit(2828,2,1)
        for i=1, getn(sex2taskID) do
            for j=1,getn(sex2taskID[i]) do
                --tGtTask:CloseTask(sex2taskID[i][j])
                ClearGTask(sex2taskID[i][j])
            end
        end
    end
    
    if tGtTask:check_task_isfinish(sex2taskID[sex][1]) == 0 and tGtTask:check_cur_task(sex2taskID[sex][1]) == 0 then
        --tGtTask:set_task(1,sex2taskID[sex][1])
        OpenGTask(sex2taskID[sex][1])
        Talk(1,"",format("<color=green>%s<color>: Xu©n ®· vÒ, D­¬ng Ch©u trµn ngËp s¾c xu©n! %s cã muèn ®i d¹o D­¬ng Ch©u kh«ng? <color=red>(NhiÖm vô chØ cã hiÖu lùc trong ngµy h«m nay)<color>", GetTargetNpcName(), sex2Name[sex]))
        Msg2Player("§Õn D­¬ng Ch©u, nãi chuyÖn víi X¶o N÷")
    else
        Talk(1,"",format("<color=green>%s<color>: C¸c h¹ ®· nhËn nhiÖm vô nµy råi.", GetTargetNpcName()))
    end
end

function QRJ2019_Exchange()
    if sf2019_check_qrj_date() ~= 1 then return end
    local szNpcName = GetTargetNpcName()
    local sex2Item = {
        [1] = {2,1,31292, "B¶n Th¶o Xoa §Çu Ph­îng (Th­îng)"},
        [2] = {2,1,31293, "B¶n Th¶o Xoa §Çu Ph­îng (H¹)"},
    }
    local teamSize = GetTeamSize()
    if teamSize ~= 2 then
        Talk(1,"",format("<color=green>%s<color>: ChØ khi tæ ®éi 1 nam 1 n÷ ®Õn ®©y, míi ®­îc nhËn quµ ho¹t ®éng nµy.", szNpcName))
        return
    end
    if PlayerIndex ~= GetTeamMember(1) then
        Talk(1,"",format("<color=green>%s<color>: C¸c h¹ kh«ng ph¶i ®éi tr­ëng! H·y mêi ®éi tr­ëng nãi chuyÖn víi ta!.", szNpcName))
        return
    end
    local oldPlayer = PlayerIndex
    local tErrorMsg = {}
    for i = 1, teamSize do
        PlayerIndex = GetTeamMember(i)
        local item = sex2Item[GetSex()]
        if GetItemCount(item[1],item[2],item[3]) < 1 then 
            tinsert(tErrorMsg, format("\n\n    <color=red>%s thiÕu [%s].<color>", GetName(), item[4]))
        end
        if gf_GetTaskBit(2828, 1) > 0 then
            tinsert(tErrorMsg, format("\n\n    <color=red>%s ®· nhËn th­ëng lÔ t×nh nh©n råi.<color>", GetName()))
        end
        if gf_Judge_Room_Weight(2, 10) ~= 1 then
            tinsert(tErrorMsg, format("\n\n    <color=red>Hµnh trang cña %s ®· ®Çy.<color>", GetName()))
        end
    end
    PlayerIndex = oldPlayer
    if getn(tErrorMsg) > 0 then
        local szTalk= format("<color=green>%s<color>: Ch­a ®¹t ®iÒu kiÖn nhËn th­ëng.:", szNpcName)
        for i = 1, getn(tErrorMsg) do
            szTalk = szTalk .. tErrorMsg[i]
        end
        Talk(1,"", szTalk)
        return
    end
    local oldPlayer = PlayerIndex
    for i = 1, teamSize do
        PlayerIndex = GetTeamMember(i)
        local item = sex2Item[GetSex()]
        gf_SetTaskBit(2828, 1, 1)
        if DelItem(item[1],item[2],item[3],1) == 1 then
            gf_AddItemEx({2,1,31286,1,4},"Quµ VÊn T×nh Trang")
            gf_AddItemEx({2,1,31279,1,4},"B¶n Th¶o Xoa §Çu Ph­îng")
        end
    end
    PlayerIndex = oldPlayer
end