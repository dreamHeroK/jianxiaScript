Import("\\script\\lib\\globalfunctions.lua");

function main()
	local szTitle = format("<color=gold>%s<color>: NÕu t«i nãi luyÖn ®¬n thuËt cña cña t«i xÕp hµng thø hai thi kh«ng cã ng­êi gi¸m xÕp hµng thø nhÊt ®Êy. T«i cã thÓ gióp b¹n luyÖn thÇn ®¬n, t¨ng cÊp tu vŞ.",GetTargetNpcName())
    local tbSay = {}
    tinsert(tbSay,"Mêi b¹n gióp m×nh!/Exp2Item")
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end
function Exp2Item()
    local nRebornLv  = gf_GetPlayerRebornCount()
    local nLv        = GetLevel()
    local nTotalLv   = nRebornLv * 100 + nLv;
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
    if nTotalLv < 1080 then
        Talk(1,"",format("<color=gold>%s<color>: sau khi ®¹i hiÖp ®¹t 10 chuyÓn 80 cÊp l¹i ®Õn ®©y nhĞ.",GetTargetNpcName()))
        return
    end
    local szTitle = format("<color=gold>%s<color>: sau khi ®¹i hiÖp ®¹t 10 chuyÓn 80 cÊp , muèn n©ng c¸o n¨ng lùc cña b¶n th©n tiÕp th× cÇn ®Õn lùc l­îng lín lo. Nh­ng mµ trong §¬n §iÒn cña ng­êi chØ cã thÓ dù tr÷ n¨ng l­îng cã h¹n. NÕu chuyÓn hãa n¨ng l­îng tİch lòy hµng ngµy luyÖn thµnh ®¬n d­îc, vµ sö dông khi ®ét ph¸ giíi h¹n b¶n th©n m×nh th× l¸ c¸ch kh¸c phôc tèt nhÊt. LuyÖn hãa mét <color=red>Linh Ph¸ch §¬n<color> cÇn <color=red>10 tû<color> kinh nghiÖm. B¹n muèn luyÖn hãa kh«ng?",GetTargetNpcName())
    local tbSay = {}
    tinsert(tbSay,"§óng/Exp2ItemConfirm")
    tinsert(tbSay,"Sai/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end
function Exp2ItemConfirm()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
    local m,_,_ = GetWorldPos()
    if m ~= 6300 then
        return
    end
    if CanModifyLargeExp(-10000000000) ~= 1 then
        Talk(1,"",format("<color=gold>%s<color>: Kinh nghiÖm cña ®¹i hiÖp kh«ng ®ñ, mêi ®i lŞch luyÖn thªm l¹i ®Õn ®©y.",GetTargetNpcName()))
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
        Talk(1,"",format("<color=gold>%s<color>: Hµnh trang cña b¹n kh«ng ®ñ châ.",GetTargetNpcName()))
        return
	end
	if GetCash() < 1000000 then
		Talk(1,"",format("<color=gold>%s<color>: LuyÖn ®¬n cÇn 100 vµng, mêi b¹n chuÈn bŞ ®ñ vµng trªn ng­êi.",GetTargetNpcName()))
        return
	end
    if GetTask(3472) < 6 then
        Talk(1,"",format("<color=gold>%s<color>: LuyÖn ®¬n cÇn 6 ®iÓm tİch cùc bang héi c¸ nh©n.",GetTargetNpcName()))
        return
    end
    for i = 1,5 do
        if ModifyExp(-2000000000) == 0 then
            return
        end
    end
	SetTask(3472,GetTask(3472)-6)
    Pay(1000000)
    
    gf_AddItemEx({2,1,31239,1}, "Linh Ph¸ch §¬n");
    FireEvent("event_gain_item", 2, 1, 31239, 1)
end