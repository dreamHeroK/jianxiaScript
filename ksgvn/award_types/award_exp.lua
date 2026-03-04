Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardExp = SimpleType:new("nExp")
AwardExp.pFun = function(nAmount)
    if GetPlayerRebornParam(0) == 0 then
        local nExpCanAdd = MAX_EXP - GetExp()
        if nAmount > nExpCanAdd then
            nAmount = nExpCanAdd
            if nAmount > 0 then
                KsgPlayer:Msg("§iÓm kinh nghiÖm ®· ®¹t giíi h¹n tèi ®a nªn c¸c h¹ kh«ng thÓ nhËn ®ñ sè kinh nghiÖm th­ëng!")
            else
                KsgPlayer:Msg("§iÓm kinh nghiÖm ®· ®¹t giíi h¹n tèi ®a!")
                return -- only return here
            end
        end
    end
    KsgPlayer:BigAddExp(nAmount)
end
