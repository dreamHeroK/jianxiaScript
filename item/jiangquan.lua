--奖券:使用有几率获得100、500、1000、2000、5000、8000、1W、2W、5W、50W经验值。

function OnUse()
	local nNum = random(1,286505);
	local bIsExist = 0;
	bIsExist = DelItem(2,0,225,1,1);
	if bIsExist ~= 1 then
		return
	end

	if nNum <= 5 then
		ModifyExp(500000);
		Talk(1,"","恭喜您获得<color=yellow>500000<color>经验值");
		Msg2Player("恭喜您获得500000经验值");
		AddGlobalCountNews("恭喜玩家"..GetName().."通过抽取奖券获得500000经验值！",2);
	end;
	
	if nNum > 5 and nNum <= 505 then
		ModifyExp(50000);
		Msg2Player("恭喜您获得50000经验值");	
	end;
	
	if nNum > 505 and nNum <= 2505 then
		ModifyExp(20000);
		Msg2Player("恭喜您获得20000经验值");
	end;
	
	if nNum > 2505 and nNum <= 8505 then
		ModifyExp(10000);
		Msg2Player("恭喜您获得10000经验值");
	end;
	
	if nNum > 8505 and nNum <= 16505 then
		ModifyExp(8000);
		Msg2Player("恭喜您获得8000经验值");
	end;
	
	if nNum > 16505 and nNum <= 26505 then
		ModifyExp(5000);
		Msg2Player("恭喜您获得5000经验值");
	end;
	
	if nNum > 26505 and nNum <= 46505 then
		ModifyExp(2000);
		Msg2Player("恭喜您获得2000经验值");
	end;
	
	if nNum > 46505 and nNum <= 96505 then
		ModifyExp(1000);
		Msg2Player("恭喜您获得1000经验值");
	end;
	
	if nNum > 96505 and nNum <= 186505 then
		ModifyExp(500);
		Msg2Player("恭喜您获得500经验值");
	end;
	
	if nNum > 186505 then
		ModifyExp(100);
		Msg2Player("恭喜您获得100经验值");
	end;

end;
