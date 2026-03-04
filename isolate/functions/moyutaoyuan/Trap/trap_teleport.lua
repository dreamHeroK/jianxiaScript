Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")

function main()
    local tPos = TaoYuan_MapInfo[3].teleport_pos
    local rand = random(1,getn(tPos))
    SetPos(tPos[rand][1],tPos[rand][2])
    Msg2Player("Ng≠¨i Æ∑ k›ch hoπt 1 B…y, bﬁ chuy”n Æ’n n¨i kh∏c trong khu v˘c.")
end