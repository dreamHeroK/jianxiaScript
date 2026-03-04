Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")

function main()
    local m,_,_ = GetWorldPos()
    local TaoYuanIdx = TaoYuan_MapId2Info[m]
    if TaoYuanIdx >= 4 then
        print("\n[error] MapId["..m.."] don't have a next map!\n")
        return
    end
    local Target = TaoYuan_MapInfo[TaoYuanIdx + 1]
    NewWorld(Target.mapid,Target.enterpos[1],Target.enterpos[2])
end