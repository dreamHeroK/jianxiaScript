--一些事件处理函数
Import("\\script\\lib\\globalfunctions.lua")

--     functions lib      --
function AddItemWithJudge(g,d,p,nCount,state,szName)
    if not PlayerIndex then error("PlayerIndex is error") return 0 end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        return 0
    end
    local bOk,nIdx = gf_AddItemEx({g,d,p,nCount,state},szName)
    return bOk,nIdx;
end
function sf2017_indate(tdate)
    local nDate = tonumber( date("%Y%m%d") );
    local nBegin = tdate[1];
    local nEnd   = tdate[2];
    if nDate >= nBegin and nDate <= nEnd then
        return 1;
    end
    return 0;
end
function sf2017_intime(ttime)
    local nTime = tonumber( date("%H%M") );
    local nBegin = ttime[1];
    local nEnd   = ttime[2];
    if nTime >= nBegin and nTime <= nEnd then
        return 1;
    end
    return 0;
end