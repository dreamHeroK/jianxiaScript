Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("打开/#open(%d)",nItemIdx),
			"下次再说/nothing",
			}
	Say("正在举办的婚礼，您是主婚人吗？打开可以获得主婚人礼服。",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","您的背包空间或者负重不足！");
		return 0;
	end;
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,109,241+nBody-1,1)
		Msg2Player("您获得了主婚人礼服");
		WriteLog("[婚礼]:"..GetName().."开了主婚人礼服箱");
	end;
end;