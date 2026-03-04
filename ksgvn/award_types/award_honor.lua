Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardHonor = SimpleType:new("nHonor")
AwardHonor.pFun = function(nAmount)
    KsgPlayer:ModifyHonor(nAmount)
end
