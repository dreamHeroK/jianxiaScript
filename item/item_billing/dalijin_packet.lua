Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("打开/#open(%d)",nItemIdx),
			"下次再说/nothing",
			}
	Say("打开大礼金箱您可以获得<color=yellow>500<color>礼金",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","您的背包空间或者负重不足！");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = AddItem(ITEM_COIN[1],ITEM_COIN[2],ITEM_COIN[3],500)
		if nRetCode == 1 then
			Msg2Player("您获得了500礼金");
			WriteLog("[婚礼]:"..GetName().."打开大礼金箱");
		else
			WriteLog("[婚礼礼金箱]:"..GetName().."打开大礼金箱, AddItem 礼金"..nRetCode);
		end;
	end;
end;