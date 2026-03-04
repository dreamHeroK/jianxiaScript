Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\gm.lua")
g_szTitle = "<color=green>ThÎ tr¶i nghiÖm: <color>"

function OnUse(nItemIndex)
    local nCurDate = KsgDate:Today()
    if KsgLib:GetSrvCfg("bOpenTestCard") ~= 1 and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Sù kiÖn tr¶i nghiÖm tÝnh n¨ng ®· kÕt thóc!")
    end
    if nCurDate > KsgLib:GetSrvCfg("tbTimeTest").nEndDate and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Sù kiÖn tr¶i nghiÖm tÝnh n¨ng ®· kÕt thóc!")
    end
    local tSay = { g_szTitle .. format("Chµo mõng ®Õn víi <color=fire> Vâ L©m TruyÒn Kú 2<color> .<color=yellow> HiÖn lµ ngµy tr¶i nghiÖm thø %d, thêi gian tr¶i nghiÖm tÝnh n¨ng cßn: %d ngµy<color>, chóc c¸c b¹n ch¬i game vui vÎ! <enter>H·y lùa chän tÝnh n¨ng:", KsgDate:CurrentTestDay(), KsgDate:TestRemainingDays()) }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "Gia nhËp m«n ph¸i/kgm_ChangeRoute")
    else
        tinsert(tSay, "NhËn trang bÞ/kgm_ShowMenuEquip")
        tinsert(tSay, "NhËn mËt tÞch/kgm_ShowMenuBook")
        tinsert(tSay, "NhËn ngo¹i trang & thó c­ìi/kgm_ShowMenuHorseAndCoat")
        tinsert(tSay, "ChuyÓn sinh/kgm_ShowMenuReborn")
        tinsert(tSay, "Hãa c¶nh/kgm_ShowMenuFair")
        tinsert(tSay, "T¨ng kinh m¹ch/kgm_ShowMenuMeridian")
        tinsert(tSay, "Th­¬ng h¶i di ch©u/kgm_ShowMenuPear")
        tinsert(tSay, "Chøc n¨ng Bang héi/kgm_ShowMenuBang")
        tinsert(tSay, "NhËn thó c­ng/kgm_ShowMenuPet")
        tinsert(tSay, "NhËn c¸c hç trî kh¸c/kgm_ShowMenuSupport")
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "NhËn ¸m KhÝ vµ C¬ Quan/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "NhËn X¸ Lîi Kim §¬n/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "NhËn ChiÕn M·/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "NhËn ChiÕn M· vµ Tô TiÔn/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "NhËn Phong Thi Phï/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "NhËn Cæ/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "NhËn §iªu/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "NhËn Linh KiÕm/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "Thanh lý tói/kgm_ClearBagItems")
    tinsert(tSay, "\nKÕt thóc ®èi tho¹i/no")
    KsgNpc:SayDialog(tSay)
end
