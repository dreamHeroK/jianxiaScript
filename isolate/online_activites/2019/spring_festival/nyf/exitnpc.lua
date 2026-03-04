Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua")

function main()
    local szTitle = format("<color=green>%s<color>: Chóc mäi ng­êi n¨m míi vui vÎ!.","Qu¶n gia Bang héi")
    local tbSay = {}
    tinsert(tbSay , "Rêi tiÖc/Exit")
    tinsert(tbSay , "Mõng §ãn Xu©n T­¬i/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function Exit()
    OnLeave(PlayerIndex)
end