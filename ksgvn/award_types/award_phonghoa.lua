Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardPhongHoa = SimpleType:new("nPhongHoa")
AwardPhongHoa.pFun = function (nPoint)
    KsgPlayer:ModifyPhongHoaPoint(nPoint)
end
