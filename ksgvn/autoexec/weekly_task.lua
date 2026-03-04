Import("\\script\\ksgvn\\lib.lua")

function _ksgOnWeeklyClear()
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT, 0)
end
