KsgLog = KsgLog or {}

function KsgLog:Print(msg, bTalk)
    if KsgPlayer:IsAdmin() then
        KsgPlayer:Msg(msg)
        if bTalk then
            KsgNpc:Talk(msg)
        end
    end
end