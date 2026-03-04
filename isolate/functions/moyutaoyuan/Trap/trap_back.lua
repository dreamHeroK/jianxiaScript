Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")

function main()
    local m,_,_ = GetWorldPos()
    local TaoYuanIdx = TaoYuan_MapId2Info[m]
    if TaoYuanIdx <= 1 then
        print("\n[error] MapId["..m.."] don't have a prepositive map!\n")
        return
    end
    local Target = TaoYuan_MapInfo[TaoYuanIdx - 1]
    NewWorld(Target.mapid,Target.backpos[1],Target.backpos[2])
end