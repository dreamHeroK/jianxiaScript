Import("\\script\\ksgvn\\lib.lua")

function _ksgOnDailyClear()
    KsgTask:Set(TASKID_LIMIT_VKT, 0)
    KsgTask:Set(TASKID_LIMIT_DHC, 0)
    KsgTask:Set(TASKID_LIMIT_LSB, 0)

    if KsgLib:GetSrvCfg('bOpenTop') == 1 then
        -- Reset ®iÓm cèng hiÕn ngµy
        KsgTask:SetPosValue(TASKID_TOP_BANG, 0, 1, 4)
    end
    KsgTask:Set(TASKID_TUIQUA_VOLAM_NUM, 0)
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT, 0)
    local nDate = KsgDate:Today()
    if nDate >= 20200823 and nDate <= 20200825 then
        KsgTask:Set(2739, 0)
    end
end
