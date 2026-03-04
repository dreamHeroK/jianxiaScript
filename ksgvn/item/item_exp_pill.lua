Import("\\script\\ksgvn\\lib.lua")

function OnUse(nItemIdx)
    local tSay = {
        "Sö dông <color=green>Kinh NghiÖm T¹o Hãa §an<color> sÏ <color=yellow>trùc tiÕp t¨ng 1 cÊp<color> ®¹i hiÖp x¸c ®Þnh muèn sö dông sao?<enter><color=gray>NÕu ®· ®¹t chuyÓn sinh 10 cÊp 99 th× sÏ t¨ng 1 cÊp Hãa C¶nh<color>",
        format("§óng vËy/#_ConfirmUse(%d)", nItemIdx),
        "T¹m thêi ch­a muèn dïng/no"
    }
    KsgNpc:SayDialog(tSay)
end

function _ConfirmUse(nItemIdx)
    if KsgPlayer:GetBigLevel() == 1099 then
        return KsgNpc:Talk("§· ®¹t ®¼ng cÊp tèi ®a, kh«ng thÓ sö dông vËt phÈm nµy.")
    end
    if 1 == KsgItem:DeleteByIndex(nItemIdx) then
        AddLevelUp(1)
        Msg2Player("Th¨ng cÊp thµnh c«ng!")
        PlaySound("\\sound\\sound_i016.wav")
    end
end
