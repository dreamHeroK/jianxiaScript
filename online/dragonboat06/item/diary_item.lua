function OnUse(nItemIndex)
	local nLevel = GetLevel()
	local nNeedExp = floor((nLevel^2*100000)/(80^2))
	local selTab = {
			"同意/#confirm("..nItemIndex..")",
			"取消/nothing",
			}
	Say("可以兑换 <color=yellow>"..nNeedExp.."<color> 点经验。你想用不。",
		getn(selTab),
		selTab)
end;

function confirm(nItemIndex)
	if GetTask(559) > GetTask(1714)*4 then
		Talk(1,"","你的精神已经到了极限");
		return 0;
	end;
	if DelItemByIndex(nItemIndex,1) ~= 0 then
		local nLevel = GetLevel()
		local nNeedExp = floor((nLevel^2*100000)/(80^2))
		ModifyExp(nNeedExp)
		Msg2Player("你获得了 "..nNeedExp.." 点经验")
		SetTask(559,GetTask(559)+1);
	end;
end;

function nothing()

end;