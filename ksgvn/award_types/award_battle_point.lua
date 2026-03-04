Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardBattlePoint = SimpleType:new("nBattlePoint")
AwardBattlePoint.pFun = function(nPoint)
    KsgPlayer:ModifyBattlePoint(nPoint)
end
