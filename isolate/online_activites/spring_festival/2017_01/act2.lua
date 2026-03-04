-- £¨¶þ£©	Ñ°ÕÒ¸£Éñ
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")

function sf2017_talk2fushen()
    if sf2017_indate(SF2017_DATE_ACT2) ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: Xu©n míi vui vÎ!",SF2017_FUSHEN.szName)
    local tbSay  = {}
    if SF2017_FUSHEN.nCnt < SF2017_FUSHEN.lim then 
        tinsert(tbSay,"NhËn lÊy phÇn th­ëng./sf2017_on_fushen")
    else
        szTitle = szTitle.."LÇn nµy t«i ®· tÆng hÕt phÇn th­ëng råi, lÇn sau h·y t×m ®Õn t«i nhanh h¬n nhÐ."
    end
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_on_fushen()
    if sf2017_indate(SF2017_DATE_ACT2) ~= 1 then return end
    local szPlayerName = GetName()
    local szNpcName = format("<color=green>%s<color>:",SF2017_FUSHEN.szName)
    if SF2017_FUSHEN.nCnt >= SF2017_FUSHEN.lim then
        Talk(1,"",szNpcName.."LÇn nµy t«i ®· tÆng hÕt phÇn th­ëng råi, lÇn sau h·y t×m ®Õn t«i nhanh h¬n nhÐ.")
        return
    end
    if get_task("id_last_fushen",nHash) == SF2017_FUSHEN.nHash then
        Talk(1,"",szNpcName.."B¹n ®· nhËn th­ëng ë chç t«i råi, mçi ng­êi chØ ®­îc nhËn 1 lÇn th«i!")
        return
    end
    if sf2017_give_fushen_award() == 1 then
        set_task("id_last_fushen",SF2017_FUSHEN.nHash)
        SF2017_FUSHEN.nCnt = SF2017_FUSHEN.nCnt + 1;
    end
end
