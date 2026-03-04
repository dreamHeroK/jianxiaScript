Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("是的/#open(%d)",nItemIdx),
			"现在不开启/nothing",
			}
	Say("打开后可以获得<color=yellow>5<color>个礼花，现在要打开吗？",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","你的背包空间不足！");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],5)
		Msg2Player("您获得了5个礼花");
		WriteLog("[婚庆]:"..GetName().."使用1个");
	end;
end;