-- 黄金大红包（空）
function OnUse(nItemIdx)
	local selTab = {
			"确定/#confirm("..nItemIdx..")",
			"再考虑一下/nothing",
			}
	Say("你要把<color=yellow>999金<color>装到黄金大红包里面吗？",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if Pay(9990000) ~= 1 then
		Talk(1,"","你身上的钱不够！");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		nRetCode = AddItem(2,1,539,1)
		if nRetCode ~= 0 then
			Msg2Player("你成功把999金装到黄金大红包里面了！");
			AddRuntimeStat(14, 3, 0, 1)
			WriteLog(GetName().."装999金".."黄金大红包");
		else
			WriteLog("[黄金大红包]:"..GetName().."删除黄金大红包（空） AddItem 黄金大红包:"..nRetCode);
		end;
	end;
end;

function nothing()

end;