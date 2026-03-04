--琴瑟和鸣包
Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(6,50) == 0 then
		Talk(1,"","你的背包空间不足，请整理后在重新打开琴瑟和鸣包。");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(1);
		Msg2Player("你获得了1个请帖包");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],6);
		Msg2Player("你获得了6个婚庆礼花");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],18);
		Msg2Player("你获得了18个喜糖");
		AddItem(2,3,214,18);
		Msg2Player("你获得了18个鞭炮");
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],3);
		Msg2Player("你获得了3个漫天彩屑")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("你获得了1份场地说明手卷.");
		WriteLog("[结婚]:"..GetName().."打开琴瑟和鸣包");
	end
end;