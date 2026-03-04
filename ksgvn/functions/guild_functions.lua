Import("\\script\\ksgvn\\lib.lua")

function guild_ShowCreateDialog()
    if IsTongMember() ~= 0 then
        return KsgNpc:Talk("Ng­¬i ®· cã bang héi!")
    end
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    if GetItemCount(2, 0, 555) < 1 then
        AddItem(2, 0, 555, 1)
    end
    if GetItemCount(2, 0, 125) < 1 then
        AddItem(2, 0, 125, 1)
    end
    if GetReputation() < 2000 then
        ModifyReputation(2000 - GetReputation(), 0)
    end
    if GetCash() < 5000000 then
        Earn(5000000 - GetCash())
    end
    CreateTongDialog()
end

function guild_LevelUp()
    if GetTongLevel() < 5 then
        AddTongLevel()
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    else
        KsgNpc:Talk("CÊp bang héi ®· ®¹t ®Õn tèi ®a, kh«ng thÓ th¨ng cÊp thªm.")
    end
end

function guild_AddGxd()
    if IsTongMember() == 0 and 1 == 2 then
        return KsgNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!")
    end
    add_tong_gxd(10000)
    KsgPlayer:Msg("NhËn ®­îc 10.000 ®iÓm cèng hiÕn bang!")
end

function guild_ShowAddTitle()
    if IsTongMember() == 0 then
        return KsgNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!")
    end
    local tSay = {
        "NhËn hiÖu bang",
    }

    for i = 1, 10 do
        if i > get_tong_title_max_lv() then
            tinsert(tSay, i + 1, format("NhËn hiÖu bang cÊp %s/#guild_AddTitle(%d)", i, i))
        else
            tinsert(tSay, i + 1, format("NhËn hiÖu bang cÊp %s (®· nhËn)/no", i))
        end
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function guild_ShowAddGangToken()
    if IsTongMember() == 0 then
        return KsgNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!")
    end
    local tSay = {
        "NhËn tİn vËt bang héi: ",
    }

    for i = 1, 20 do
        tinsert(tSay, i + 1, format("NhËn tİn vËt cÊp %s/#guild_AddGangToken(%d)", i, i))
    end

    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function guild_AddGangToken(nLevel)
    nLevel = tonumber(nLevel)
    if nLevel < 1 or nLevel > 20 then
        return
    end
    if KsgItem:CountAll(0, 155, nLevel) == 0 then
        AddItem(0, 155, nLevel, 1)
        KsgNpc:Talk(format("NhËn thµnh c«ng tİn vËt bang cÊp %d", nLevel))
    else
        KsgNpc:Talk(format("C¸c h¹ ®· cã tİn vËt bang cÊp %d råi, kh«ng thÓ nhËn thªm!", nLevel))
    end
end

function guild_AddTitle(nLevel)
    nLevel = tonumber(nLevel)
    if get_tong_title_max_lv() < nLevel then
        set_tong_title_lv(nLevel)
        set_tong_title_max_lv(nLevel)
        for i = 1, 10 do
            RemoveTitle(72, i)
        end
        AddTitle(72, nLevel)
        SetCurTitle(72, nLevel)
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
        KsgNpc:Talk(format("NhËn thµnh c«ng hiÖu bang cÊp %d", nLevel))
    end
end