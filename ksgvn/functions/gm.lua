Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\functions\\guild_functions.lua")
Include("\\script\\ksgvn\\functions\\meridian_functions.lua")
Include("\\script\\ksgvn\\functions\\book_functions.lua")
Include("\\script\\ksgvn\\functions\\battle_functions.lua")
Include("\\script\\ksgvn\\functions\\pet_functions.lua")
Include("\\script\\ksgvn\\functions\\faction_support_functions.lua")
Include("\\script\\ksgvn\\functions\\weapon_effect_functions.lua")
Include("\\script\\ksgvn\\functions\\fair_functions.lua")
Include("\\script\\ksgvn\\functions\\phutu_functions.lua")

function kgm_ShowMenuEquip()
    local tSay = {
        "Chän lo¹i trang bÞ muèn nhËn:",
        "Trang bÞ chÝnh/kgm_ShowMenuNewItem",
        "Trang bÞ n©ng cÊp/kgm_ShowMenuUpgradableItem",
        "Trang bÞ chiÕn tr­êng/kgm_ShowMenuBattleItem",
        "Trang bÞ Kim Xµ/kgm_ShowMenuKimXaItem",
        "Trang bÞ V¨n Søc/kgm_ShowMenuVanSucItem",
        "Trang bÞ gi¶i ®Êu/kgm_ShowMenuVipItem",
    }
    --if KsgPlayer:IsGM() then
    --    local tSayGM = {
    --        "Trang bÞ gi¶i ®Êu/kgm_ShowMenuVipItem",
    --    }
    --    tSay = gf_MergeTable(tSay, tSayGM)
    --end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuHorse()
    local tSay = { "Chän mét lo¹i thó c­ìi yªu thÝch:" }
    for i = 30100, 30203 do
        tinsert(tSay, format("Ta muèn nhËn %s/#kgm_AddHorse(%d)", KsgItem:GetName(0, 105, i), i))
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:PageSay(tSay, 2, 10)
end

function kgm_ShowMenuSupport()
    local tSay = {
        "Chän hç trî:",
        "Thay ®æi qu©n hµm/battle_ChangeTitle",
        "NhËn 100 tû kinh nghiÖm/#KsgPlayer:BigAddExp(100e9)",
        "NhËn 100.000 vµng/#KsgPlayer:AddGold(100000)",
        "NhËn nguyªn liÖu c­êng hãa vµ ma ®ao th¹ch/kgm_AddNLCuongHoa",
        "NhËn ®¸ quý/kgm_AddGem",
        "\nNhËn nguyªn liÖu nu«i Kim Xµ/kgm_AddKimXaFeed",
        "NhËn ®¸ tÈy thuéc tÝnh Kim Xµ/kgm_AddKimXaGem",
        "NhËn ®¸ khãa thuéc tÝnh Kim Xµ/kgm_AddLockKimXaGem",
        "\nNhËn Håi Tiªn §¬n vµ Linh Ph¸ch §¬n/kgm_AddLinhDon",
        "\nNhËn Tinh Hån vµ NguyÖt Ph¸ch/#kgm_AddLinhDon(1)"
    }
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuPet()
    local tSay = {
        "Thao t¸c thó nu«i/®ång hµnh",
        "NhËn ®iÓm linh lùc/pet_AddLinhLuc",
        "Häc Gi¸ng Linh ThuËt/#pet_Active(8)",
    }
    for i = 1, 8 do
        tinsert(tSay, "\n")
        tinsert(tSay, format("NhËn Pet cÊp %d/#pet_AddRandom(%d)", i, i))
        tinsert(tSay, format("NhËn s¸ch kü n¨ng cÊp %d\n/#pet_AddBookByNum(%d, 10)", i, i))
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_AddGem()
    local nMax = 8
    if not KsgLib:HasEnoughBagRoom(nMax * 4) then
        return
    end
    for i = 1, nMax do
        KsgAward:ReceiveGem(i, 100)
    end
end

function kgm_AddHorse(nId)
    if not KsgLib:HasEnoughBagRoom(1) then
        return
    end
    local tbAward = {
        { tbProp = { 0, 105, nId }, nStatus = 4 },
    }
    KsgAward:Give(tbAward, 'NhËn Thó c­ìi')
end

function kgm_AddKimXaFeed()
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 30612 }, nStack = 500 },
    }
    KsgAward:Give(tbAward, 'NhËn ThiÕt Tinh 4')
end

function kgm_AddKimXaGem()
    if not KsgLib:HasEnoughBagRoom(15) then
        return
    end
    local tbAward = {}
    for i = 1, 12 do
        tinsert(tbAward, { tbProp = { 2, 1, 30520 + i }, nStack = 100 }) -- TÈy t©m luyÖn l« th¹ch
    end
    tinsert(tbAward, { tbProp = { 2, 1, 31401 }, nStack = 50 }) -- TÈy t©m luyÖn l« th¹ch 7
    tinsert(tbAward, { tbProp = { 2, 1, 31402 }, nStack = 50 }) -- TÈy t©m luyÖn l« th¹ch 7
    tinsert(tbAward, { tbProp = { 2, 1, 31614 }, nStack = 50 }) -- TÈy t©m luyÖn l« th¹ch 8
    tinsert(tbAward, { tbProp = { 2, 1, 31615 }, nStack = 50 }) -- TÈy t©m luyÖn l« th¹ch 8
    KsgAward:Give(tbAward, "NhËn §¸ TÈy KX")
end

function kgm_AddLockKimXaGem()
    if not KsgLib:HasEnoughBagRoom(18) then
        return
    end
    local tbAward = {}
    for i = 30904, 30909 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 100 }) -- §¸ khãa kim xµ 5
    end
    for i = 31249, 31254 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 100 }) -- §¸ khãa kim xµ 6
    end
    for i = 31391, 31396 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 50 }) -- §¸ khãa kim xµ 7
    end  
    for i = 31604, 31609 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 50 }) -- §¸ khãa kim xµ 8
    end
    KsgAward:Give(tbAward, "NhËn §¸ Khãa KX")
end

function kgm_AddLinhDon(bNewItem)
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 30847 }, nStack = 500 },
        { tbProp = { 2, 1, 31239 }, nStack = 500 },
    }
    if bNewItem then
        tbAward = {
            { tbProp = { 2, 95, 3855 }, nStack = 500 },
            { tbProp = { 2, 102, 232 }, nStack = 500 },
        }
    end
    KsgAward:Give(tbAward, 'NhËn Linh §¬n')
end

function kgm_AddNLCuongHoa()
    if not KsgLib:HasEnoughBagRoom(10, 100) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 1067 } }, --  §Þnh hån th¹ch cÊp 7
        { tbProp = { 2, 1, 1113 } }, --  §Þnh hån th¹ch cÊp 10
        { tbProp = { 2, 1, 1068 } }, -- Thiªn Th¹ch linh th¹ch + 7
        { tbProp = { 2, 1, 1009 }, nStack = 100 }, -- Thiªn th¹ch tinh th¹ch
        { tbProp = { 2, 1, 30424 }, nStack = 50 },
        { tbProp = { 2, 1, 30425 }, nStack = 50 },
        { tbProp = { 2, 1, 30426 }, nStack = 50 },
        { tbProp = { 2, 1, 30427 }, nStack = 50 },
        { tbProp = { 2, 1, 30428 }, nStack = 20 },
        { tbProp = { 2, 1, 30429 }, nStack = 20 },
        { tbProp = { 2, 1, 30430 }, nStack = 20 },
    }
    KsgAward:Give(tbAward, "NhËn NL C­êng Hãa")
end

function kgm_ShowMenuHorseAndCoat()
    EarnCollectionCoin(100000)
    if BigGetItemCount(2, 1, 30494) <= 0 then
        AddItem(2, 1, 30494, 1, 4)
        KsgNpc:Talk("C¸c h¹ nhËn ®­îc Tñ ¸o Thiªn BiÕn TiÕu")
    end
    if GetPlayerCollectionData(2, 1) == 0 then
        SetPlayerCollectionData(2, 1, 1)
        SetPlayerCollectionData(2, 2, 1)
        SetPlayerCollectionData(2, 3, 1)
    end
    if KsgPlayer:GetPhongHoa() < 1e6 then
        KsgPlayer:ModifyPhongHoaPoint(300000)
    end
    local tbAward = {
        { tbProp = { 2, 1, 50265 }, nStack = 10 },
        { tbProp = { 2, 1, 50266 }, nStack = 10 },
        { tbProp = { 2, 1, 50267 }, nStack = 10 },
    }
    KsgAward:Give(tbAward, "NhËn phiÕu vµ vÐ ®æi ngo¹i trang")
end

function kgm_ShowMenuBook()
    local tSay = {
        "NhËn mËt tÞch vµ yÕu quyÕt:",
        "NhËn mËt tÞch S¬ cÊp/#book_AddBookByType(2,1)",
        "NhËn mËt tÞch Trung cÊp/#book_AddBookByType(2,2)",
        "NhËn mËt tÞch Cao cÊp/#book_AddBookByType(2,3)",
        "NhËn mËt tÞch Cap cÊp 15%/#book_AddBookByType(2,4)",
        "NhËn mËt tÞch Siªu cÊp/#book_AddBookByType(2,5)",
        "NhËn mËt tÞch BÝ ®iÓn/#book_AddBookByType(2,6)",
        "NhËn mËt tÞch TrÊn Ph¸i/book_AddMasterBook",
        "NhËn YÕu QuyÕt/book_AddYeuQuyet",
        "NhËn Cæ Phæ/book_AddCoPho",
        "NhËn m¶nh c¬ quan mÆc gia/book_AddManhCoQuan",
        "\nNhËn mËt tÞch th«ng dông/book_ShowCommonMenu",
        "\nNhËn L¨ng Ba Vi Bé/book_AddLangBa",
        "NhËn MËt TÞch Tiªu Dao/book_AddTieuDao",
        "\nNhËn ®iÓm luyÖn vµ lÞch luyÖn/book_AddPopur",
        "\nLuyÖn nhanh mËt tÞch/book_FastPractice",
    }
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuMeridian()
    local tSay = {
        "Thao t¸c kinh m¹ch:",
        "NhËn ch©n khÝ/meridian_AddChanKhi",
        "NhËn Kinh M¹ch §ång Nh©n/#meridian_AddKinhMachDongNhan(25)",
        "NhËn Kinh M¹ch Ng©n Nh©n/#meridian_AddKinhMachNganNhan(25)",
        "TÈy ®iÓm kinh m¹ch/meridian_ResetPoint",
    }
    local nMax = 6
    for i = 1, nMax do
        if i > MeridianGetLevel() then
            tinsert(tSay, i + 1, format("Th¨ng cÊp c¶nh giíi %s/#meridian_LevelUp(%d)", KsgPlayer:GetMeridianName(i), i))
        else
            tinsert(tSay, i + 1, format("Th¨ng cÊp c¶nh giíi %s (®· kÝch ho¹t)/no", KsgPlayer:GetMeridianName(i)))
        end
    end

    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuFair()
    local tSay = {
        "Thao t¸c hãa c¶nh:",
        --"Më hãa c¶nh/#KsgPlayer:OpenFair()",
        "T¨ng 1 cÊp hãa c¶nh/#kgm_UpFair(1)",
        "T¨ng 10 cÊp hãa c¶nh/#kgm_UpFair(10)",
        "Th¨ng cÊp ®Õn 10 tÇng hãa c¶nh/#KsgPlayer:LevelUpFair(10)",
        "Th¨ng cÊp ®Õn 25 tÇng hãa c¶nh/#KsgPlayer:LevelUpFair(25)",
        "Th¨ng cÊp ®Õn 50 tÇng hãa c¶nh/#KsgPlayer:LevelUpFair(50)",
        "Th¨ng cÊp ®Õn 75 tÇng hãa c¶nh/#KsgPlayer:LevelUpFair(75)",
        "Th¨ng cÊp ®Õn 100 tÇng hãa c¶nh/#KsgPlayer:LevelUpFair(100)",
    }
    if KsgPlayer:IsAdmin() then
        tinsert(tSay, "Th¨ng cÊp ®Õn 200 tÇng hãa c¶nh/#KsgPlayer:LevelUpFair(200)")
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_UpFair(nLevel)
    nLevel = nLevel or 1
    for _ = 1, nLevel do
        KsgPlayer:LevelUpFair()
    end
end

function kgm_ShowMenuUpgradableItem()
    local tSay = {
        "Chän lo¹i trang bÞ muèn nhËn:",
        "NhËn bé DiÖu D­¬ng /#KsgAward:SetDieuDuong(15)",
        "NhËn bé ChiÕn Cuång /#KsgAward:SetChienCuong(15)",
        "NhËn bé Hµo HiÖp /kgm_SetHaoHiep",
        "NhËn bé Hµo HiÖp V« H¹ /kgm_SetHaoHiepVoHa",
        "NhËn bé Èm HuyÕt /kgm_SetAmHuyet",
        "NhËn bé S¸t Tinh /kgm_SetSatTinh",
        "NhËn bé Ph¸ Hån/kgm_SetPhaHon",
    }
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuNewItem()
    local tSay = {
        "Chän lo¹i trang bÞ muèn nhËn:",
        "NhËn bé Tµng KiÕm /kgm_SetTangKiem",
        "NhËn bé Thiªn Chi Tµng KiÕm /kgm_SetThienChiTangKiem",
        "NhËn bé Viªm §Õ /#KsgItem:AddSuitByBody(8001, 15)",
        "NhËn bé Thiªn Chi Viªm §Õ  /#KsgItem:AddSuitByBody(8055, 15)",
        "NhËn bé B¹ch Kim Viªm §Õ   /#KsgItem:AddSuitByBody(30013, 15)",
    }
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuBang()
    local tSay = {
        "Chän thao t¸c bang héi",
        "Ta muèn lËp bang héi/guild_ShowCreateDialog",
        "Ta muèn th¨ng cÊp bang héi/guild_LevelUp",
        "NhËn danh hiÖu bang héi/guild_ShowAddTitle",
        "NhËn tÝn vËt bang héi/guild_ShowAddGangToken",
        "NhËn ®iÓm cèng hiÕn bang/guild_AddGxd",
    }
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuVipItem()
    local tSay = {
        "Chän lo¹i trang bÞ muèn nhËn:",
        "NhËn bé V« Song ChiÕn ThÇn /#KsgItem:AddSuitByBody(30651, 15)",
        "NhËn bé Thiªn H¹ V« Song /#KsgItem:AddSuitByBody(30207, 15)",
        "NhËn bé V« Cùc Minh Tinh/#KsgItem:AddJewelry(31130, 2)",
    }
    if KsgPlayer:IsGM() then
        local tSayGM = {
            "NhËn bé H¾c B¹ch V« Song /#KsgItem:AddSuitByBody(50006, 15)",
        }
        tSay = gf_MergeTable(tSay, tSayGM)
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuKimXaItem()
    local tSay = {
        "Chän lo¹i trang bÞ muèn nhËn:",
    }
    for i = 1, 8 do
        tinsert(tSay, format("NhËn Kim Xµ cÊp %d /#kgm_NhanKimXa(%d, 15)", i, i))
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuReborn()
    local tSay = {
        "Thao t¸c chuyÓn sinh:",
    }
    for i = 1, MAX_REBORN_LEVEL do
        local nBigLevel = tonumber(i .. 90)
        if i > KsgPlayer:GetRebornCount() then
            tinsert(tSay, format("Th¨ng cÊp ®Õn chuyÓn sinh %d/#KsgPlayer:Reborn(%d)", i, nBigLevel))
        end
    end
    tinsert(tSay, "\nNhËn Ên vµ ngo¹i trang chuyÓn sinh /#KsgReborn:ReceiveCoatAndSeal()")
    tinsert(tSay, "§æi h­íng chuyÓn sinh/kgm_ShowMenuChangeRebornRoute")
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuChangeRebornRoute()
    local tSay = {
        "Chän h­íng chuyÓn sinh míi:",
    }
    for nRoute, szRouteName in KsgPlayer:GetRebornRouteName() do
        tinsert(tSay, format("ChuyÓn sinh theo h­íng %s/#KsgReborn:ChangeRoute(%d)", szRouteName, nRoute))
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuPear()
    local tSay = {
        "Chän cÊp Th­¬ng H¶i Ch©u muèn nhËn:",
    }
    local nMax = 7
    for i = 1, nMax do
        tinsert(tSay, format("NhËn 200 Th­¬ng H¶i Ch©u cÊp %d (ChØ ®­îc nhËn 1 lÇn)/#kgm_ThuongHaiChau(%d)", i, i))
    end
    tinsert(tSay, "NhËn bét Tr©n Ch©u/kgm_AddBotTranChau")
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuVanSucItem()
    local tSay = {
        "Chän lo¹i v¨n søc muèn nhËn:",
    }
    for i = 1, 4 do
        tinsert(tSay, format("NhËn V¨n søc cÊp %d /#KsgAward:SetVanSuc(%d)", i, i))
    end

    tinsert(tSay, "\nNhËn nguyªn liÖu c­êng hãa V¨n Søc/kgm_NhanNLVanSuc")
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuBattleItem()
    local tSay = {
        g_szTitle .. "NhËn trang bÞ Cao cÊp",
        "\nNhËn bé Thiªn Chi T­íng Qu©n/#KsgItem:AddBattleSuit_ThienChi_Tuong(15)",
        "\nNhËn bé Ngù Long T­íng Qu©n/#KsgItem:AddBattleSuit_NguLong_Tuong(15)",
        "NhËn bé Th­¬ng ¦ng T­íng Qu©n/#KsgItem:AddBattleSuit_ThuongUng_Tuong(15)",
        "NhËn bé L«i Hæ T­íng Qu©n/#KsgItem:AddBattleSuit_LoiHo_Tuong(15)",
        "NhËn bé Háa Phông T­íng/#KsgItem:AddBattleSuit_HoaPhung_Tuong(15)",
        "NhËn bé Thanh Long T­íng/#KsgItem:AddBattleSuit_ThanhLong_Tuong(15)",
        "NhËn bé Uy Hæ T­íng/#KsgItem:AddBattleSuit_UyHo_Tuong(15)",
        "NhËn bé Chu T­íc T­íng/#KsgItem:AddBattleSuit_ChuTuoc_Tuong(15)",
    }
    if KsgPlayer:IsGM() then
        local tSayGM = {
            "NhËn nguyªn liÖu n©ng cÊp trang bÞ T­íng So¸i/kgm_nhanNLTuongSoai",
            "NhËn bé Th­¬ng ¦ng Nguyªn So¸i/#KsgItem:AddBattleSuit_ThuongUng_Soai(15)",
            "NhËn bé L«i Hæ Nguyªn So¸i/#KsgItem:AddBattleSuit_LoiHo_Soai(15)",
            "NhËn bé Háa Phông So¸i/#KsgItem:AddBattleSuit_HoaPhung_Soai(15)",
            "NhËn bé Thanh Long So¸i/#KsgItem:AddBattleSuit_ThanhLong_Soai(15)",
            "NhËn bé Uy Hæ So¸i/#KsgItem:AddBattleSuit_UyHo_Soai(15)",
            "NhËn bé Chu T­íc So¸i/#KsgItem:AddBattleSuit_ChuTuoc_Soai(15)",
        }
        tSay = gf_MergeTable(tSay, tSayGM)
    end
    tinsert(tSay, "\nRêi khái/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_NhanKimXa(nLevel, nUpgradeLevel)
    nUpgradeLevel = nUpgradeLevel or 8
    if nLevel > 3 then
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_KHANGTATCA)
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_NOICONG)
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_NGOAICONG)
    else
        KsgAward:AddKimXa(nLevel, nUpgradeLevel)
    end
end

function kgm_NhanNLVanSuc()
    local tbAward = {
        { tbProp = { 2, 1, 31096 }, nStack = 100 }, -- L­u Kim
        { tbProp = { 2, 201, 13 }, nStack = 100 }, -- Thiªn V¨n Th¹ch
        { tbProp = { 2, 201, 14 }, nStack = 5 }, --  Cæ Kim Th¹ch
        { tbProp = { 2, 201, 16 }, nStack = 5 }, --  §iÓm Tinh Ngäc-Nhá
    }
    KsgAward:Give(tbAward, "NhËn NL C­êng Hãa V¨n Søc")
end

function kgm_AddBotTranChau()
    local tbAward = {
        { tbProp = { 2, 102, 215 }, nStack = 1000 }, -- Thiªn V¨n Th¹ch
    }
    KsgAward:Give(tbAward, "NhËn NL Bét Tr©n Ch©u")
end

function kgm_SetHaoHiep(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuit(30568)
    KsgItem:AddJewelry(31126, 2, 'NhËn Trang Søc HH')
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32162,
        [ROUTE_CONLON_KIEMTON] = 32190,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'NhËn Vò KhÝ HH')
    end
    KsgItem:AddWeaponByRouteIndex(30724, 4, nLevel, 'NhËn Vò KhÝ HH')
end

function kgm_ThuongHaiChau(nLevel)
    if KsgTask:GetBit(TASKID_LIMIT_SERVER_TEST, TASKID_LIMIT_SERVER_TEST_BIT_THDC) == 1 and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Mçi nh©n vËt ë m¸y chñ thö nghiÖm chØ ®­îc nhËn Th­¬ng H¶i Ch©u 1 lÇn, c¸c h¹ ®· nhËn råi.")
    end
    KsgAward:ThuongHaiChau(nLevel, 200)
    KsgTask:SetBit(TASKID_LIMIT_SERVER_TEST, TASKID_LIMIT_SERVER_TEST_BIT_THDC, 1)
end

function kgm_SetLietVu(nLevel)
    nLevel = nLevel or 0
    local nRouteIndex = KsgPlayer:GetRouteIndex()
    KsgItem:AddSuitByRouteOffset(22270, nLevel, "NhËn bé LiÖt Vò")
    KsgItem:AddJewelry(8092 + nRouteIndex * 2 - 2, 2, 'NhËn Trang Søc LiÖt Vò')
    KsgItem:AddWeaponByRouteOffset(22270, nLevel, 'NhËn Vò khÝ LiÖt Vò')
end

function kgm_SetHaoHiepVoHa()
    local tbAward = {
        { tbProp = { 2, 1, 30944 } },
        { tbProp = { 2, 1, 30945 } },
        { tbProp = { 2, 1, 30946 } },
        { tbProp = { 2, 1, 30973 } },
        { tbProp = { 2, 1, 30974 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'NhËn bé HHVH')
end

function kgm_SetSatTinh()
    local tbAward = {
        { tbProp = { 2, 1, 31313 } },
        { tbProp = { 2, 1, 31314 } },
        { tbProp = { 2, 1, 31315 } },
        { tbProp = { 2, 1, 31316 } },
        { tbProp = { 2, 1, 31317 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'NhËn bé S¸t Tinh')
end

function kgm_SetPhaHon()
    local tbAward = {
        { tbProp = { 2, 1, 31529 } },
        { tbProp = { 2, 1, 31530 } },
        { tbProp = { 2, 1, 31531 } },
        { tbProp = { 2, 1, 31532 } },
        { tbProp = { 2, 1, 31533 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'NhËn bé Ph¸ Hån')
end

function kgm_SetAmHuyet(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuit(30610)
    KsgItem:AddJewelry(31272, 2, 'NhËn Trang Søc AH')
    KsgItem:AddJewelry(31414, 2, 'NhËn Trang Søc AH')
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32164,
        [ROUTE_CONLON_KIEMTON] = 32192,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'NhËn Vò KhÝ Èm HuyÕt')
    end
    KsgItem:AddWeaponByRouteIndex(30884, 4, nLevel, 'NhËn Vò KhÝ Èm HuyÕt')
end

function kgm_SetTangKiem(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuitByBody(95, nLevel, 'NhËn Bé Tµng KiÕm')
    KsgItem:AddJewelry(36, 5, 'NhËn Bé Tµng KiÕm_Trang Søc')
end

function kgm_SetThienChiTangKiem(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuitByBody(30001, nLevel, 'NhËn Bé Thiªn Chi Tµng KiÕm')
    KsgItem:AddJewelry(30001, 3, 'NhËn Bé Thiªn Chi Tµng KiÕm_Trang Søc')
end

function kgm_nhanNLTuongSoai()
    local tbAward = {
        { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 100 },
        { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 100 },
        { tbProp = { 2, 1, 31194 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31195 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31294 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31295 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31241 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30769 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30770 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31122 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30687 }, nStack = 2000, nStatus = 1 },
    }
    KsgAward:Give(tbAward)
end

function kgm_ChangeRoute()
    if KsgPlayer:IsJoinedRoute() and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Ng­¬i ®· gia nhËp m«n ph¸i råi, ta kh«ng thÓ gióp ®­îc g×.")
    end
    local tSay = {
        "Ng­¬i muèn gia nhËp ph¸i nµo?",
    }
    for _, nFactionRoute in g_tbFactionRoutes do
        tinsert(tSay, format("Ta muèn gia nhËp %s/#kgm_JoinRoute(%d)", KsgPlayer:GetRouteName(nFactionRoute), nFactionRoute))
    end
    tinsert(tSay, "Rêi khái/no")
    KsgNpc:PageSay(tSay, 2, 8)
end

function kgm_JoinRoute(nRoute)
    local nSex = GetSex()
    if KsgPlayer:IsJoinedRoute() and not KsgPlayer:IsAdmin() then
        return KsgNpc:Talk("Ng­¬i ®· gia nhËp m«n ph¸i råi, ta kh«ng thÓ gióp ®­îc g×.")
    end
    kgm_RemoveCurrentRouteSkill()
    if g_tbFactionRoute_Gender[nRoute] ~= 0 then
        if g_tbFactionRoute_Gender[nRoute] ~= nSex then
            local tbSexName = {
                [1] = "Nam",
                [2] = "N÷",
            }
            return KsgNpc:Talk(format("Ph¸i %s kh«ng nhËn ®Ö tö %s", KsgPlayer:GetRouteName(nRoute), tbSexName[nSex]))
        end
    end
    SetPlayerRoute(nRoute)
    kgm_FixFactionTask()
    SetTask(336, 10000)
    ModifyReputation(10000, 0)
    kgm_LearnRouteSkill(nRoute)
    -- §Æt chiªu mÆt ®Þnh thµnh skill ®¸nh qu¸i
    SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 0)
    SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 1)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    if KsgPlayer:GetBigLevel() < 55 then
        AddLevelUp(55 - GetLevel())
    end
    if KsgItem:Count(2, 1, 50264) == 0 then
        KsgAward:Give({ tbProp = { 2, 1, 50264 }, nStack = 1, nStatus = 4 }, "NhËn Tói Quµ T©n Thñ")
    end
end

function kgm_FixFactionTask()
    if KsgPlayer:GetFaction() == ROUTE_DUONGMON and GetTask(1005) < 8 then
        -- fix nv so nhap duong mon
        SetTask(1005, 8)
    end
end

function kgm_RemoveCurrentRouteSkill()
    local nRoute = KsgPlayer:GetRoute()
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    RemoveSkill(20)
    RemoveSkill(tbSkillCfg.nTranPhai) -- TrÊn Ph¸i
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C¸c skill c¬ b¶n
        RemoveSkill(i)
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ®¸nh th­êng
        RemoveSkill(nSkillId)
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ®¸nh qu¸i
        RemoveSkill(nSkillId)
    end
end

function kgm_LearnRouteSkill(nRoute)
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]

    LearnSkill(20) -- Khinh c«ng
    LearnSkill(tbSkillCfg.nTranPhai) -- TrÊn Ph¸i

    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C¸c skill c¬ b¶n
        LearnSkill(i)
        while LevelUpSkill(i) == 1 do
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ®¸nh th­êng
        LearnSkill(nSkillId)
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ®¸nh qu¸i
        LearnSkill(nSkillId)
    end
end

function kgm_ClearBagItems(nConfirm)
    if not nConfirm or tonumber(nConfirm) ~= 1 then
        KsgNpc:SayDialog({
            g_szTitle .. "X¸c nhËn xãa toµn bé vËt phÈm trong hµnh trang?",
            "§ång ý/#kgm_ClearBagItems(1)",
            "Huû/no",
        })
        return
    end
    ClearItemInPos()
    for _, cfg in g_tbLoginCfg do
        local nHaveItemCount = KsgItem:CountAll(cfg.tbProp)
        local bOtherRule = 1
        if cfg.szRequireRule == 'admin' then
            bOtherRule = KsgPlayer:IsAdmin()
        end
        if cfg.szRequireRule == 'gm' then
            bOtherRule = KsgPlayer:IsGM()
        end
        if KsgLib:GetSrvCfg(cfg.bCondition) == 1 and bOtherRule == 1 then
            if nHaveItemCount < 1 and GetFreeItemRoom() > 0 then
                KsgAward:Give({ { tbProp = cfg.tbProp } }, "onKsgPlayerLogin received card, type = " .. cfg.szRequireRule)
                if type(cfg.szMsg) == "string" then
                    KsgNpc:Talk(cfg.szMsg)
                end
            end
        else
            -- Admin kh«ng bÞ xãa item
            if nHaveItemCount > 0 and not KsgPlayer:IsAdmin() then
                KsgItem:DeleteAll(cfg.tbProp)
                KsgNpc:Talk(format("BÞ mÊt %s do hÕt h¹n hoÆc bÞ cÊm sö dông!", KsgItem:GetName(cfg.tbProp)))
            end
        end
    end
end
