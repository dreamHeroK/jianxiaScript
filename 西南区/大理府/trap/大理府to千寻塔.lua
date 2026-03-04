--大理府to千寻塔

function main(sel)
	if GetLevel() < 70 then
		Msg2Player("前面非常危险，少侠暂时不能进入千寻塔！");
		TaskTip("前面非常危险，少侠暂时不能进入千寻塔！");
		return
	end
	NewWorld(409,1550,3247)
	SetFightState(1);
end;