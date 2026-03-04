Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardFactionPoint = SimpleType:new("nFactionPoint")
AwardFactionPoint.pFun = function(nPoint)
    KsgPlayer:ModifyFactionPoint(nPoint)
end
