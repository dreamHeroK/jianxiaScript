Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardPopur2 = SimpleType:new("nPopur2")
AwardPopur2.pFun = function(nPoint)
    KsgPlayer:ModifyPopur2(nPoint)
end
