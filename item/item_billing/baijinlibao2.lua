-- 剑侠大礼包

Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	local selTab = {
				format("是的/#use_yes(%d)",nItemIdx),
				"取消/nothing",
				}
	Say("你要打开你的剑侠大礼包吗？",getn(selTab),selTab);
end;

function use_yes(nItemIdx)
	if gf_JudgeRoomWeight(20,300) == 0 then
		Talk(1,"","你的背包空间或负重不足，不能打开礼包！");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		gf_AddItemEx({2,0,597,10})
		ModifyReputation(300,0);
		gf_AddItemEx({2,1,481,1,4})
		gf_AddItemEx({2,1,483,1,4})
		gf_AddItemEx({0,110,89+nBody-1,1,4})
		local nRand = random(1,100);
		if nRand <= 50 then
			gf_AddItemEx({0,109,277+nBody-1,1,4})
		end;
		nRand = random(1,10000);
		if nRand <= 7000 then
			gf_AddItemEx({2,1,270,10,4})
		elseif nRand <= 9000 then
			gf_AddItemEx({2,1,1007,10,4})
		elseif nRand <= 9990 then
			gf_AddItemEx({2,1,1049,1,4})
		elseif nRand <= 9995 then
			gf_AddItemEx({2,1,1003,1,4})
		else
			gf_AddItemEx({2,1,1002,1,4})
		end;
		WriteLog("[剑侠大礼包]:"..GetName().."打开1个剑侠大礼包")
	end;
end;

function nothing()

end;