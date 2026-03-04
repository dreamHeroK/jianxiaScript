function OnUse()
	if DelItem(2,1,394,1) == 1 then
		local nLevel = GetLevel();
		local nNeedExp = floor((nLevel^2*125000)/(80^2))
		ModifyExp(nNeedExp)
		Msg2Player("你获得了 "..nNeedExp.." 点经验");
		ModifyReputation(5,0);
		Msg2Player("你获得了 5 点声望");
	end;
end;