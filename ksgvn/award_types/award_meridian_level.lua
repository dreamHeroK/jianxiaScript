Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardMeridianLevel = SimpleType:new("nMeridianLevel")
AwardMeridianLevel.pFun = function(nLevel)
    KsgPlayer:MeridianLevelUp(nLevel)
end
