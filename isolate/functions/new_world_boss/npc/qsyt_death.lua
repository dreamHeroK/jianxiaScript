Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.yt[1]
    local ntime = nwb_bossaward.yt[2]
    local maxrate = nwb_bossaward.yt[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("Th­¬ng ThÇn Doanh Thiªn")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "Th­¬ng ThÇn Doanh Thiªn")
    nwb_CreateBox("Tói cña Th­¬ng ThÇn Doanh Thiªn",m,x,y,30)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end