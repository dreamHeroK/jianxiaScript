Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("是的/#open(%d)",nItemIdx),
			"现在不开启/nothing",
			}
	Say("打开后可以获得<color=yellow>6<color>组不同的焰火，现在要打开吗？",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(6,18) == 0 then
		Talk(1,"","你的背包空间不足！");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=189,194 do
			AddItem(2,1,i,3)
		end;
		Msg2Player("您获得了3个橙色烟花")
		Msg2Player("您获得了3个蓝色烟花")
		Msg2Player("您获得了3个赤幕焰火")
		Msg2Player("您获得了3个蓝幕焰火")
		Msg2Player("您获得了3个橙幕焰火")
		Msg2Player("您获得了3个神秘烟花")
	end;
end;