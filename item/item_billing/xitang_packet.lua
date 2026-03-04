Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("是的/#open(%d)",nItemIdx),
			"我再想想/nothing",
			}
	Say("打开后可以获得<color=yellow>20<color>个喜糖，确定开启吗？",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(2,30) == 0 then
		Talk(1,"","你的背包空间不足，不能打开喜糖包。");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],20)
		Msg2Player("获得了 20 个喜糖");
		WriteLog("[喜糖包]:"..GetName().."打开1个喜糖包");
	end;
end;