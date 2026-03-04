Include("\\script\\ksgvn\\autoexec\\autoexec_head.lua")
Import("\\script\\ksgvn\\lib.lua")

function OnFairRankStart()
    SendScript2VM("\\script\\misc\\fair\\fair.lua", "Fair_OnSvrStart()")
end


AutoFunctions:Add(OnFairRankStart)
