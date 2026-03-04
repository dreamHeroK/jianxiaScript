Import("\\script\\ksgvn\\lib.lua")

function meridian_AddChanKhi()
    AwardGenuineQi(888888)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_AddKinhMachDongNhan(nCount)
    AddItem(2, 1, 30730, nCount)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_AddKinhMachNganNhan(nCount)
    AddItem(2, 1, 30731, nCount)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_ResetPoint(nConfirm)
    if not nConfirm or tonumber(nConfirm) ~= 1 then
        return KsgNpc:SayDialog({
            "C¸c h¹ x¸c nhËn muèn tÈy l¹i ®iÓm kinh m¹ch?",
            "§ång ý/#meridian_ResetPoint(1)",
            "Ta suy nghÜ l¹i mét chót/no",
        })
    end
    MeridianRestore(-1)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_LevelUp(nLevel)
    KsgPlayer:MeridianLevelUp(nLevel)
end