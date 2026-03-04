-- 紫金大红包（空）

function OnUse(nItemIdx)
	local selTab = {
			"确定/#confirm("..nItemIdx..")",
			"再考虑一下/nothing",
			}
	Say("你要把<color=yellow>360金<color>装到紫金大红包里面吗？",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if Pay(3600000) ~= 1 then
		Talk(1,"","你身上的钱不够！");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		nRetCode = AddItem(2,1,537,1)
		if nRetCode ~= 0 then
			Msg2Player("你成功把360金装到紫金大红包里面了！");
		else
			WriteLog("[紫金大红包]:"..GetName().."删除紫金大红包（空） AddItem 紫金大红包:"..nRetCode);
		end;
	end;
end;

function nothing()

end;