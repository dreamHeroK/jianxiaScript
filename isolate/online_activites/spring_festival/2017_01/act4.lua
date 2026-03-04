Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function sf2017_killnpc()
    if sf2017_indate(SF2017_DATE_ACT4_1) ~= 1 then return end 
    local nRnd = random(1,100)
    if nRnd <= 4 then
        local tItem = SF2017_FIRE.normal
        AddItemWithJudge(tItem[1],tItem[2],tItem[3],1,4,tItem[4])
    end
end

function sf2017_mission()
    if sf2017_indate(SF2017_DATE_ACT4_2) ~= 1 then return end 
    local szTitle = format("<color=green>%s<color>: Mçi ngµy mçi ng­êi ph¶i tèn 2 Thiªn Kiªu LÖnh ®Ó më nhiÖm vô thu phÝ, mçi ngµy ®­îc nhËn 20 lÇn nhiÖm vô.",SF2017_HDDS.szName)
    local tbSay  = {}
    
    local nRand = random(1,100)
    local nType = 1 
    if nRand >=1 and nRand <= 60 then nType = 1
    elseif nRand >=61 and nRand <= 90 then nType = 2
    elseif nRand >=91 and nRand <= 100 then nType = 3
    end
    tinsert(tbSay,format("NhËn nhiÖm vô /#sf2017_mission_choose(%d)",nType))
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_mission_check()
    for i = 1, getn(SF2017_MISSION.low) do 
        local nTaskId = SF2017_MISSION.low[i]
        if tGtTask:check_cur_task(nTaskId) == 1 then return nTaskId end
    end
    for i = 1, getn(SF2017_MISSION.mid) do 
        local nTaskId = SF2017_MISSION.mid[i]
        if tGtTask:check_cur_task(nTaskId) == 1 then return nTaskId end
    end
    for i = 1, getn(SF2017_MISSION.high) do 
        local nTaskId = SF2017_MISSION.high[i]
        if tGtTask:check_cur_task(nTaskId) == 1 then return nTaskId end
    end
    return 0
end 

function sf2017_mission_choose(nType)
    if sf2017_indate(SF2017_DATE_ACT4_2) ~= 1 then return end 
    if sf2017_mission_check() ~= 0 then
        Talk(1,"",format("<color=green>%s<color>: B¹n ®· nhËn 1 nhiÖm vô, h·y hoµn thµnh nhiÖm vô ®ã ®·.",SF2017_HDDS.szName))
        return 
    end
    local nFlag = get_task("id_mission")
    if nFlag >= SF2017_MISSION.limit then
        Talk(1,"",format("<color=green>%s<color>: Mçi ngµy nhËn tèi ®a %d nhiÖm vô, sè nhiÖm vô b¹n nhËn h«m nay ®· ®¹t tèi ®a.",SF2017_HDDS.szName,SF2017_MISSION.limit))
        return 
    end
    if gf_Judge_Room_Weight(1, 500) ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
        return
    end
    if get_task("id_mission") == 0 then 
        local nTJL = GetItemCount(SF2017_TJL[1],SF2017_TJL[2],SF2017_TJL[3])
        if nTJL < SF2017_MISSION.nTJL then
            Talk(1,"",format("<color=green>%s<color>: Mçi ngµy më nhiÖm vô cÇn %d Thiªn Kiªu LÖnh, Thiªn Kiªu LÖnh trªn ng­êi kh«ng ®ñ.",SF2017_HDDS.szName,SF2017_MISSION.nTJL))
            return
        end
        if DelItem(SF2017_TJL[1],SF2017_TJL[2],SF2017_TJL[3],SF2017_MISSION.nTJL) ~= 1 then return end
    end
    local tMission = {}
    if nType == 1 then tMission = SF2017_MISSION.low
    elseif nType == 2 then tMission = SF2017_MISSION.mid
    elseif nType == 3 then tMission = SF2017_MISSION.high
    end
    local nRand = random(1,getn(tMission))
    if OpenGTask(tMission[nRand]) == 1 then
        Msg2Player("B¹n ®· nhËn nhiÖm vô thµnh c«ng")
        set_task("id_mission",nFlag+1)
    end
end

function sf2017_complete(nType)
    local nRand = random(1,100)
    if nType == 2 then
        if nRand <= 20 then
           local _,nIndex = AddItemWithJudge(2,200,69,1,0,"M¶nh Thiªn Tinh Th¹ch")
			SetItemExpireTime(nIndex,30*24*3600)
        end
    elseif nType == 3 then
        if nRand <= 10 then
           local _,nIndex = AddItemWithJudge(2,200,70,1,0,"M¶nh H¾c B¹ch Kú")
			SetItemExpireTime(nIndex,30*24*3600)
        end
    end
end

function sf2017_finish_mission()
    local tskid = sf2017_mission_check()
    local id = tskid - 487 -- Ëã³öÔÚ±íÖÐµÄË÷Òý
    local szNpcName = GetNpcName(GetTargetNpc())
    local szSex = "§¹i hiÖp"
    if id <= 0 then
        if szNpcName ~= SF2017_HDDS.szName then Talk(1,"","B¹n ch­a nhËn nhiÖm vô, h·y ®Õn gÆp §¹i Sø Ho¹t §éng Xu©n Míi ®Ó nhËn.") end
        return 0 
    end
    if GetSex() == 2 then szSex = "N÷ hiÖp " end
    if SF2017_FINISH_TASK[id][2] ~= szNpcName then
        if szNpcName ~= SF2017_HDDS.szName then Talk(1,"",format("NhiÖm vô nµy kh«ng liªn quan ®Õn t«i, cã ph¶i %s ®· t×m nhÇm ng­êi kh«ng?",szSex)) end
        return 0 
    end -- ²»ÊÇÕâ¸öNPC
    if FinishGTask(tskid) == 1 then
        Talk(1,"","NhiÖm vô hoµn thµnh!")
        Msg2Player("NhiÖm vô hoµn thµnh!")
        return 1
    else
        Msg2Player("VÉn ch­a hoµn thµnh nhiÖm vô!")
    end
    return 0
end

function sf2017_mission_description()
    Talk(1,"",format("<color=green>%s<color>: Xu©n míi s¾p ®Õn råi, hoµn thµnh nhiÖm vô thu thËp Háa D­îc cña §¹i Sø Ho¹t §éng Xu©n Míi sÏ nhËn ®­îc Háa D­îc Tinh ChÕ. DiÖt §«ng H¶i H¶i T©n 1, §«ng H¶i H¶i T©n 2 vµ qu¸i trong §µo Hoa §¶o sÏ cã x¸c suÊt nhËn ®­îc Háa D­îc S¬ ChÕ. Trong thêi gian TÕt, cã thÓ ®em Háa D­îc ®Õn chç §¹i Sø Xu©n Míi ghÐp thµnh Ph¸o ®Ó ®uæi Niªn Thó.",SF2017_HDDS.szName))
end