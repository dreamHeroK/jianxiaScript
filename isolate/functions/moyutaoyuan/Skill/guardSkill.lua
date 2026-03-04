
Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")

function OnSkill(nNpcIndex, nSkillID, nSkillLV)
    local m,x,y = GetNpcWorldPos(nNpcIndex)
    local mapIdx = TaoYuan_MapId2Info[m]
    local tPosList = TaoYuan_BanishPos[mapIdx]
    local pos = random(1,getn(tPosList))
    SetNpcPos(nNpcIndex, tPosList[pos][1], tPosList[pos][2])
end