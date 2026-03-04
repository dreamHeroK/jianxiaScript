Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua")
Import("\\script\\lib\\globalfunctions.lua")
function main()
    local szTitle = format("Tiªu hao 50 Vµng, mêi thµnh viªn trong bang uèng r­îu")
    local tbSay = {}
    tinsert(tbSay, "§ång ý/confirm")
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

tWord = {
    "Nh©n dÞp TÕt Nguyªn §¸n, mäi ng­êi häp mÆt. [%s] chóc mäi ng­êi n¨m míi vui vÎ, v¹n sù nh­ ý!",
    "N¨m míi ®· ®Õn, [%s] chóc mäi ng­êi may m¾n, m·i m·i vui vÎ!",
    "N¨m míi vui vÎ! [%s] chóc mäi ng­êi ph¸t tµi, gia ®×nh h¹nh phóc!",
}

function player_jingjiu_award()
    local awardTimes = GetTask(2830) 
    if awardTimes >= 20 then
        Msg2Player("§· uèng tho¶i m¸i, kh«ng thÓ nhËn thªm phÇn th­ëng mêi r­îu!")
        return
    end
    SetTask(2830, awardTimes + 1)
    local nExp = 300000
	local nPopur = 10
	Msg2Player("Ng­¬i ®· nhËn ®­îc phÇn th­ëng mêi r­îu:")
	gf_Modify("Exp", nExp);
	gf_Modify("Popur2", nPopur)
end

function confirm()
    if GetTask(2829) > 0 then
        Talk(1,"","Ng­¬i ®· kh«ng uèng ®­îc n÷a, kh«ng thÓ mêi r­îu mäi ng­êi.")
        return
    end
    if Pay(500000) == 1 then
        SetTask(2829, 1)
        this.msCamp:turnPlayer(0, player_jingjiu_award);
        Msg2SubWorld(format(tWord[random(1,getn(tWord))],GetName()))
    else
        Talk(1,"","Vµng trªn ng­êi kh«ng ®ñ")
        return
    end
end