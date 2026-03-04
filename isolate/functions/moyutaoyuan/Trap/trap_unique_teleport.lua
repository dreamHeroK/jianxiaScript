Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")

function main()
    local rand = random(1,2)
    if rand == 1 then -- go forward
        NewWorld(8901,3968,11221)
    else
        NewWorld(8903,1127,2927)
    end
end