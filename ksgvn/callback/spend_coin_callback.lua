Import("\\script\\ksgvn\\lib.lua")

function _ksg_SpendCoinCallback(nCost)
    local nToday = KsgDate:Today()
    if nToday >= EVENT_SPEND_COIN_START_DATE  and nToday <=  EVENT_SPEND_COIN_END_DATE then
        KsgTask:Modify(TASKID_EVENT_SPEND_COIN, nCost)
        KsgPlayer:Msg(format("NhËn ®­îc %d ®iÓm tÝch lòy tiªu phÝ Ngù C¸c", nCost))
    else
        KsgTask:Set(TASKID_EVENT_SPEND_COIN, 0)
    end
end