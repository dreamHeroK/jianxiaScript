-- 比武大会回调相关脚本

function OnArrive(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRank(szKey, nKey1, nKey2, 1)
	else
		BuildBWRank(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function OnArriveInfo(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRankInfo(szKey, nKey1, nKey2, 1)
	else
		BuildBWRankInfo(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function SyncZgPoint(nPoint)
	local nBodyPoint = GetTask(662)
	local nDiff = nPoint - nBodyPoint
	if nDiff > 0 then
		SetTask(662, nPoint, 21)
		Msg2Player("您当前资格分数增加"..nDiff.."点，当前资格分数"..nPoint.."分")
	end
	WriteLog("[比武大会]  event=资格分数更新 name="..GetName().." "..nBodyPoint.." "..nPoint)
end