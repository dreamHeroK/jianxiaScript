Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.rwx[1]
    local ntime = nwb_bossaward.rwx[2]
    local maxrate = nwb_bossaward.rwx[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("NhËm Ng· Hµnh")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "NhËm Ng· Hµnh")
    nwb_CreateBox("Tói Cña NhËm Ng· Hµnh",m,x,y,50)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end