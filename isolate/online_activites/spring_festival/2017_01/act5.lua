-- Çý¸ÏÄêÊÞ
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\function\\ornament\\ornament.lua")
function sf2017_make_normalfirecrackers()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local nFire = GetItemCount(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < 1 then Talk(1,"",szNpcName.."Háa D­îc S¬ ChÕ trªn ng­êi kh«ng ®ñ.") return end
    if nCash < 20000 then Talk(1,"",szNpcName.."Vµng trªn ng­êi kh«ng ®ñ.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh«ng gian hµnh trang kh«ng dñ") return end
    local nMax = min(nFire,99)
    AskClientForNumber("sf2017_make_normalfirecrackersCB", 0, nMax, "Muèn chÕ bao nhiªu c¸i?");
end

function sf2017_make_normalfirecrackersCB(nNum)
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if nNum == 0 then return end
    local nFire = GetItemCount(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < nNum then Talk(1,"",szNpcName.."Háa D­îc S¬ ChÕ trªn ng­êi kh«ng ®ñ.") return end
    if nCash < 20000*nNum then Talk(1,"",szNpcName.."Vµng trªn ng­êi kh«ng ®ñ.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh«ng gian hµnh trang kh«ng dñ") return end
    if DelItem(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3],nNum) ~= 1 then return end
    Pay(20000*nNum)
    local tItem = SF2017_FIRECRACKERS.normal
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],nNum,4,tItem[4])
end

function sf2017_make_delicatefirecrackers()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local nFire = GetItemCount(SF2017_FIRE.delicate[1],SF2017_FIRE.delicate[2],SF2017_FIRE.delicate[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < 1 then Talk(1,"",szNpcName.."Háa D­îc Tinh ChÕ trªn ng­êi kh«ng ®ñ.") return end
    if nCash < 50000 then Talk(1,"",szNpcName.."Vµng trªn ng­êi kh«ng ®ñ.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh«ng gian hµnh trang kh«ng dñ") return end
    local nMax = min(nFire,99)
    AskClientForNumber("sf2017_make_delicatefirecrackersCB", 0, nMax, "Muèn chÕ bao nhiªu c¸i?");
end
function sf2017_make_delicatefirecrackersCB(nNum)
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if nNum == 0 then return end
    local nFire = GetItemCount(SF2017_FIRE.delicate[1],SF2017_FIRE.delicate[2],SF2017_FIRE.delicate[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < nNum then Talk(1,"",szNpcName.."Háa D­îc Tinh ChÕ trªn ng­êi kh«ng ®ñ.") return end
    if nCash < 50000*nNum then Talk(1,"",szNpcName.."Vµng trªn ng­êi kh«ng ®ñ.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh«ng gian hµnh trang kh«ng dñ") return end
    if DelItem(SF2017_FIRE.delicate[1],SF2017_FIRE.delicate[2],SF2017_FIRE.delicate[3],nNum) ~= 1 then return end
    Pay(50000*nNum)
    local tItem = SF2017_FIRECRACKERS.delicate
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],nNum,4,tItem[4])
end

function sf2017_use_firecrackers(nIndex)
    local g,d,p = GetItemInfoByIndex(nIndex)
    local m,x,y = GetWorldPos()
    local nUseNormal = get_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.firecrackers)
    if p == SF2017_FIRECRACKERS.normal[3] then
        if nUseNormal >= SF2017_FIRECRACKERS.nUselimit then
            Talk(1,"","Ph¸o S¬ chÕ ®­îc sö dông tèi ®a 25 c¸i mçi ngµy, h«m nay b¹n ®· sö dông ®¹t sè l­îng tèi ®a.")
            return
        end
    end
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then
        Talk(1,"","ChØ trong thêi gian ho¹t ®éng (<color=red>2017/1/26 - 2017/2/1<color>) míi ®­îc sö dông Ph¸o.")
        return 
    end
    if sf2017_intime(SF2017_MONSTER.ActTime[1]) ~= 1 and sf2017_intime(SF2017_MONSTER.ActTime[2]) ~= 1 then
        Talk(1,"","ChØ trong thêi gian ho¹t ®éng (mçi ngµy lóc <color=red>12:00-14:00<color> vµ <color=red>19:00-24:00<color>) míi ®­îc sö dông Ph¸o.")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return 0
    end
    if SF2017_MONSTER.isLife == 0 then Talk(1,"","Niªn Thó ®· bÞ däa sî bá ch¹y råi, h·y chê Niªn Thó xuÊt hiÖn l¹i råi sö dông.") return end
    local posx = SF2017_MONSTER.tPos[2];
    local posy = SF2017_MONSTER.tPos[3];
    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if m ~= SF2017_MONSTER.tPos[1] or k >20 then
        Talk(1,"","Ph¸o chØ ®­îc sö dông ë gÇn Niªn Thó.")
        return
    end
    if DelItemByIndex(nIndex,1) ~= 1 then return end
    if p == SF2017_FIRECRACKERS.normal[3] then
        local nRand = random(1,100)
        local nHurt = 1
        if nRand <= 10 then
            nHurt = 2
        end
        SF2017_MONSTER:BeAttacked(nHurt,1)
        set_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.firecrackers,nUseNormal+1)
    elseif p == SF2017_FIRECRACKERS.delicate[3] then
        SF2017_MONSTER:BeAttacked(2,2)
    end
end
function sf2017_talk2xcbox()
    local tItem = SF2017_BOX.tItem
    local nIdx = GetTargetNpc()
    local nTime = GetTime()
    local nLastTime = get_task("id_get_box")
    local nGot = get_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.box)
    if nGot >= SF2017_BOX.nMaxLimit then
        Talk(1,"","Trong 1 ngµy chØ ®­îc nhÆt 3 lÇn R­¬ng Xu©n Míi.")
        return
    end
    if nLastTime + SF2017_BOX.nColdTime > nTime then
        Talk(1,"","Trong 1 phót chØ ®­îc nhÆt 1 lÇn th«i!")
        return
    end
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],1,4,tItem[4])
    if SF2017_DEBUG == 1 then
        print("\naddItem",tItem[1],tItem[2],tItem[3],1,4,tItem[4])
    end
    SetNpcLifeTime(nIdx,0)
    set_task("id_get_box",nTime)
    set_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.box,nGot+1)
end

function sf2017_get_box_fromDS()
    local m,_,_ = GetWorldPos()
    if m ~= 100 then
        Talk(1,"","H·y ®Õn chç §¹i Sø Ho¹t §éng TuyÒn Ch©u nhËn th­ëng.")
        return
    end
    local nMax = SF2017_MONSTER.DeadCnt;
    if nMax == 0 then
        Talk(1,"",format("<color=green>%s<color>: HiÖn vÉn ch­a ®uæi Niªn Thót hµnh c«ng.",SF2017_HDDS.szName))
        return  
    end
    local nGot = get_task("id_get_box_fromDS")
    if nGot >= nMax then
        Talk(1,"",format("<color=green>%s<color>: B¹n ®· nhËn th­ëng ®uæi Niªn Thó tr­íc råi, nÕu muèn nhËn l¹i, h·y cè g¾ng ®uæi Niªn Thó tiÕp theo!",SF2017_HDDS.szName))
        return
    end
    local tItem = SF2017_BOX.tItem
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],5,4,tItem[4])
    set_task("id_get_box_fromDS",nGot+1)
end

function sf2017_monster_description()
    local szTitle = format("<color=green>%s<color>: Chóc mõng xu©n míi!",SF2017_HDDS.szName)
    local tbSay  = {}
    tinsert(tbSay,"Giíi thiÖu ho¹t ®éng Ng¾m Hoa §µo/#sf2017_Actdescription(1)")
    tinsert(tbSay,"Giíi thiÖu ho¹t ®éng T×m Phóc ThÇn/#sf2017_Actdescription(2)")
    tinsert(tbSay,"Giíi thiÖu ho¹t ®éng §uæi Niªn Thó/#sf2017_Actdescription(3)")
    tinsert(tbSay,"Giíi thiÖu ho¹t ®éng Hång Phóc Trêi Ban/#sf2017_Actdescription(4)")
    tinsert(tbSay,"Giíi thiÖu cöa hµng Xu©n Míi/#sf2017_Actdescription(5)")
    tinsert(tbSay,"trë l¹i/#sf2017_talk2hdds()")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_Actdescription(nType)
    local nSex = GetSex()
    local szSex = "§¹i hiÖp"
    if nSex == 2 then szSex = "N÷ hiÖp " end
    if nType == 1 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong thêi gian ho¹t ®éng, %s cã thÓ ®Õn TuyÒn Ch©u, Thµnh §«, BiÖn Kinh, T­¬ng D­¬ng ®èi tho¹i víi C©y §µo vµ h¸i Hoa §µo. Mçi ng­êi mçi ngµy ®­îc h¸i 10 lÇn, mçi lÇn h¸i c¸ch nhau 6s. NhÊn chuét ph¶i sö dông Hoa §µo h¸i ®­îc ®Ó nhËn th­ëng.",SF2017_HDDS.szName,szSex))
    elseif nType == 2 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong thêi gian ho¹t ®éng, mçi ngµy lóc 12h, 14h, 16h, 18h, 20h, 21h, 22h vµ 23h, Phóc ThÇn sÏ xuÊt hiÖn ë mét trong 3 thµnh BiÖn Kinh, Thµnh §« vµ TuyÒn Ch©u. T×m ®­îc Phóc ThÇn, tiÕn hµnh ®èi tho¹i sÏ nhËn ®­îc phÇn th­ëng. Mçi Phóc ThÇn chØ tÆng 100 phÇn th­ëng, mçi ng­êi ch¬i chØ ®­îc nhËn 1 lÇn phÇn th­ëng tõ 1 Phóc ThÇn. Mçi Phóc ThÇn tån t¹i 30 phót.",SF2017_HDDS.szName))
    elseif nType == 3 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong thêi gian ho¹t ®éng, mçi ngµy ng­êi ch¬i cã thÓ ®èi tho¹i víi §¹i Sø Ho¹t §éng Xu©n Míi, sö dông Háa D­îc S¬ ChÕ vµ 2 Vµng sÏ chÕ ®­îc Ph¸o S¬ ChÕ. Sö dông 1 Háa D­îc Tinh ChÕ vµ 5 Vµng sÏ chÕ ®­îc Ph¸o Tinh ChÕ. Sö dông Ph¸o S¬ ChÕ víi Niªn Thó sÏ t¨ng 1 ®iÓm sî h·i cho Niªn Thó vµ nhËn ®­îc 1 ThiÖp B¹c Xu©n Míi. Sö dông Ph¸o Tinh ChÕ víi Niªn Thó sÏ t¨ng 2 ®iÓm sî h·i cho Niªn Thó vµ nhËn ®­îc 1 ThiÖp Vµng Xu©n Míi. ThiÖp B¹c Xu©n Míi vµ ThiÖp Vµng Xu©n Míi dïng ®Ó ®æi vËt phÈm ë cöa hµng Xu©n Míi.",SF2017_HDDS.szName))
    elseif nType == 4 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong thêi gian 2017-1-28 ®Õn 2-1, ®¨ng nhËp trß ch¬i vµ ®èi tho¹i víi §¹i Sø Ho¹t §éng Xu©n Míi sÏ nhËn ®­îc 1 bé ngo¹i trang XÝch Viªn Léng H¹c (7 ngµy) phï hîp víi thÓ h×nh b¶n th©n. Sö dông 1 ngo¹i trang XÝch Viªn Léng H¹c cã thêi h¹n, 40 Thiªn Kiªu LÖnh vµ 500 Vµng ®æi lÊy 1 ngo¹i trang XÝch Viªn Léng H¹c vÜnh viÔn.",SF2017_HDDS.szName))
    else 
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Thêi gian më cöa hµng Xu©n Míi gåm 2 giai ®o¹n, giai ®o¹n 1: 2017-1-26 5:00 ®Õn 2-1 24:00, giai ®o¹n 2: 2017-2-2 5:00 ®Õn 2-8 24:00. ™ mçi giai ®o¹n, cöa hµng sÏ b¸n c¸c lo¹i vËt phÈm kh¸c nhau.",SF2017_HDDS.szName))
    end
end

function sf2017_exc_wushi()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: Muèn ®æi [L©n S­] cã thêi h¹n thµnh [L©n S­] vÜnh viÔn, cÇn <color=red>1 Thiªn Cang LÖnh<color>, <color=red>1 Thiªn M«n Kim LÖnh<color> vµ <color=red>3600 ®iÓm Phong Hoa<color>. Muèn ®æi?",SF2017_HDDS.szName)
    local tbSay  = {}
    tinsert(tbSay,"§­îc/sf2017_exc_wushi_confirm")
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_exc_wushi_confirm()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local bGot = get_task("id_wushi")
    if bGot == 1 then Talk(1,"","B¹n ®· ®æi thó c­ìi vÜnh viÔn nµy råi, kh«ng thÓ ®æi thªm.") return end
    local nWushi = GetItemCount(SF2017_WUSHI[1],SF2017_WUSHI[2],SF2017_WUSHI[3]) if nWushi < 1 then Talk(1,"","H·y ®Æt [L©n S­] cã thêi h¹n vµo tói.")return end
    local nTGL   = GetItemCount(SF2017_TGL[1],SF2017_TGL[2],SF2017_TGL[3]) if nTGL < 1 then Talk(1,"","Thiªn Cang LÖnh kh«ng ®ñ.")return end
    local nTMJL  = GetItemCount(SF2017_TMJL[1],SF2017_TMJL[2],SF2017_TMJL[3]) if nTMJL < 1 then Talk(1,"","Thiªn M«n Kim LÖnh kh«ng ®ñ.")return end
    local nFenghua = ornament_get_score() if nFenghua < 3600 then Talk(1,"","§iÓm Phong Hoa kh«ng ®ñ.")return end
    if DelItem(SF2017_WUSHI[1],SF2017_WUSHI[2],SF2017_WUSHI[3],1) ~= 1 then return end
    if DelItem(SF2017_TGL[1],SF2017_TGL[2],SF2017_TGL[3],1) ~= 1 then return end
    if DelItem(SF2017_TMJL[1],SF2017_TMJL[2],SF2017_TMJL[3],1) ~= 1 then return end
    ornament_add_score(-3600)
    Msg2Player(format("B¹n ®· mÊt 3600 ®iÓm Phong Hoa, ®iÓm cßn l¹i lµ %s",ornament_get_score()))
    gf_AddItemEx({SF2017_WUSHI[1],SF2017_WUSHI[2],SF2017_WUSHI[3],1,4,-1,-1,-1,-1,-1,-1},SF2017_WUSHI[4])
    set_task("id_wushi",1)
end

function sf2017_ask_number()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then
        Talk(1,"","ChØ trong thêi gian ho¹t ®éng (<color=red>2017/1/26 - 2017/2/1<color>) míi ®­îc sö dông Ph¸o.")
        return 
    end
    if sf2017_intime(SF2017_MONSTER.ActTime[1]) ~= 1 and sf2017_intime(SF2017_MONSTER.ActTime[2]) ~= 1 then
        Talk(1,"","ChØ trong thêi gian ho¹t ®éng (mçi ngµy lóc <color=red>12:00-14:00<color> vµ <color=red>19:00-24:00<color>) míi ®­îc sö dông Ph¸o.")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return 0
    end
    if SF2017_MONSTER.isLife == 0 then Talk(1,"","Niªn Thó ®· bÞ däa sî bá ch¹y råi, h·y chê Niªn Thó xuÊt hiÖn l¹i råi sö dông.") return end
    local m,x,y = GetWorldPos()
    local posx = SF2017_MONSTER.tPos[2];
    local posy = SF2017_MONSTER.tPos[3];
    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if m ~= SF2017_MONSTER.tPos[1] or k >20 then
        Talk(1,"","Ph¸o chØ ®­îc sö dông ë gÇn Niªn Thó.")
        return
    end
    local tItem = SF2017_FIRECRACKERS.delicate;
    local nItem = GetItemCount(tItem[1],tItem[2],tItem[3])
    local nMax = min(100,nItem)
    AskClientForNumber("sf2017_use_delicate", 1, nMax, "Sö dông bao nhiªu?");
end
function sf2017_use_delicate(nNum) 
    local nUsed = nNum
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then
        Talk(1,"","ChØ trong thêi gian ho¹t ®éng (<color=red>2017/1/26 - 2017/2/1<color>) míi ®­îc sö dông Ph¸o.")
        return 
    end
    if sf2017_intime(SF2017_MONSTER.ActTime[1]) ~= 1 and sf2017_intime(SF2017_MONSTER.ActTime[2]) ~= 1 then
        Talk(1,"","ChØ trong thêi gian ho¹t ®éng (mçi ngµy lóc <color=red>12:00-14:00<color> vµ <color=red>19:00-24:00<color>) míi ®­îc sö dông Ph¸o.")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return 0
    end
    if SF2017_MONSTER.isLife == 0 then Talk(1,"","Niªn Thó ®· bÞ däa sî bá ch¹y råi, h·y chê Niªn Thó xuÊt hiÖn l¹i råi sö dông.") return end
    if SF2017_MONSTER.nHp < nNum * 2 then 
        nUsed = floor((SF2017_MONSTER.nHp+1)/2);
    end
    local tItem = SF2017_FIRECRACKERS.delicate;
    if DelItem(tItem[1],tItem[2],tItem[3],nUsed) ~= 1 then return end
    SF2017_MONSTER:BeAttacked(nUsed*2,2,nUsed)
    if SF2017_MONSTER.nHp+1 < nNum * 2 then 
        Msg2Player(format("Do sinh lùc cña Niªn Thó kh«ng ®ñ, b¹n chØ sö dông thµnh c«ng % Ph¸o Tinh ChÕ!",nUsed))
    end
end
