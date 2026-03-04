Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nian_monster.lua")
Import("\\script\\lib\\npccmdhead.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\head.lua")
local tMonsterInfo = {
    [6300] = {
        waypoint = {{1304,3389}, {1294, 3420}, {1274, 3410}, {1281,3373}},
        mapName = "ThÊt L¹c Nhai",
        taskbit = 1,
    },
    [302] = {
        waypoint = {{1449,2932}, {1472, 2945}, {1467, 2979}, {1446,2962}},
        mapName = "Thanh Thµnh s¬n",
        taskbit = 2,
    },
    [406] = {
        waypoint = {{1397,3085}, {1418, 3077}, {1416,3126}, {1392,3129}},
        mapName = "Vò L¨ng s¬n",
        taskbit = 3,
    },
    [151] = {
        waypoint = {{1529,2809}, {1536, 2863}, {1498,2843}, {1508,2810}},
        mapName = "V©n Méng Tr¹ch",
        taskbit = 4,
    },
}


function OnHitMonster(nNpcIndex)
    local sNpcName = GetNpcName(nNpcIndex);
    if sNpcName ~= NM2019_tBigMonster[2] then
		return 0;
    end
    local npcMapId, npcX, npcY = GetNpcWorldPos(nNpcIndex);
    local tInfo = %tMonsterInfo[npcMapId]
    if tInfo == nil then
        return 0;
    end

    local used = gf_GetTaskBit(2823, tInfo.taskbit)
    if used == 1 then
        Talk(1,"","<color=yellow>Niªn Thó l¾c l­ c¸i ®Çu to, trè m¾t nh×n ng­¬i!<color>")
        return 0;
    end
    local szAward = "chunjie_danianshou"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Msg2Player(1,"","NhËn th­ëng thÊt b¹i, h·y kiÓm tra chç trèng trong tói.")
        return 0
    end

    gf_SetTaskBit(2823, tInfo.taskbit, 1)
    local tWayPoint = {}
    local randP = random(1, getn(tInfo.waypoint))
    tWayPoint = tInfo.waypoint[randP]
    g_NpcAI:setWayPoint(nNpcIndex, {tWayPoint});
    local szTalk = {
        "¸! §õng ®¸nh ta!",
        "Lµm ta hÕt hån!",
        "Ha ha! Nhét qu¸!",
        "C¸i g× vËy??",
        "Grµo! Hu hu hu!!"
    }
    Msg2Player(format("§¹i Niªn Thó ë %s sî h·i, r¬i ra %s.", tInfo.mapName, "Mét t B¸u VËt"))
    NpcChat(nNpcIndex, szTalk[random(1,getn(szTalk))])
    SetCurrentNpcSFX(nNpcIndex, 936, 0, 0, 3*18);
    CustomAwardGiveGroup(szAward, 0)
end

function DoFirework(nNpcIndex)
    local nSubWorldTmpId = GetMapTemplate(SubWorld)
    if nSubWorldTmpId ~= tbMission.realMapID then
        Msg2Player("Kü n¨ng chØ cã hiÖu lùc trong phã b¶n C¬m §Çu N¨m.")
        return 0;
    end
    local used = GetTask(2827)
    if used >= 10 then
        Msg2Player("§· dïng hÕt l­ît.")
        return
    end
    SetTask(2827, used + 1)
    local szAward = "chunjie_kainianfan"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","Sö dông thÊt b¹i")
        return 0
    end
    CustomAwardGiveGroup(szAward, 0)
    SetCurrentNpcSFX(nNpcIndex, 936, 0, 0, 3*18);
end

function OnSkill(nNpcIndex, nSkillID, nSkillLV)
    if sf2019_check_main_date() ~= 1 then
        Talk(1,"",format("<color=yellow>%s<color> ®· qu¸ h¹n, kh«ng thÓ dïng kü n¨ng nµy n÷a.", SF2019_ACT_NAME))
        return
    end

    if nSkillID == 2737 then
        OnHitMonster(nNpcIndex)
        return
    end
    if nSkillID == 2738 then
        DoFirework(nNpcIndex)
    end

end