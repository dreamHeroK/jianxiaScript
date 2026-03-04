Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardReborn = SimpleType:new("nReborn")
AwardReborn.pFun = function(nBigLevel)
    KsgReborn:PlayerRebornWithNews(nBigLevel, random(1,4))
end
AwardReborn.isValid = function(nBigLevel)
    return KsgPlayer:GetBigLevel() < nBigLevel
end