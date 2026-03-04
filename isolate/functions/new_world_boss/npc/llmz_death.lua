Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.llmz[1]
    local ntime = nwb_bossaward.llmz[2]
    local maxrate = nwb_bossaward.llmz[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("B¾c Lôc L©m Minh Chñ")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "B¾c Lôc L©m Minh Chñ")
    nwb_CreateBox("Tói cña B¾c Lôc L©m Minh Chñ",m,x,y,30)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end