Include("\\script\\lib\\globalfunctions.lua");
function OnUse()
	local selTab = {
				"是的，打开/use",
				"好吧，等一下/nothing",
				}
	Say("礼品袋里面有很多物品，请确认行李有足够的空间和力量，要不要打开?",getn(selTab),selTab);
end;

function use()
	if gf_JudgeRoomWeight(6,300) ~= 1 then
		Talk(1,"","你没有足够的空间，或者你没有足够的负重，请重新安排，在打开礼品袋。")
		return 0;
	end;
	if DelItem(2,1,966,1) == 1 then
		local nRand = random(1,100);
		if nRand <= 25 then
			if AddItem(2,1,390,100) == 1 then
				Msg2Player("你获得了[咸蛋粽子] x 100");
			end;
		elseif nRand <= 50 then
			if AddItem(2,1,388,50) == 1 then
				Msg2Player("你获得了[烧肉粽子] x 50");
			end;
		elseif nRand <= 70 then
			if AddItem(2,1,391,50) == 1 then
				Msg2Player("你获得了[什锦粽子] x 50");
			end;
		elseif nRand <= 90 then
			if AddItem(2,1,389,50) == 1 then
				Msg2Player("你获得了[蜜饯粽子] x 50");
			end;
		else
			if AddItem(2,1,392,5) == 1 then
				Msg2Player("你获得了[嘉兴粽子] x 5");
			end;
		end;
	end;
end;

function nothing()

end;