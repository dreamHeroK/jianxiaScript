--文定吉祥包
Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(8,250) == 0 then
		Talk(1,"","你的背包空间不足，请整理后在重新打开文定吉祥包。");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(2);
		Msg2Player("你获得了2个请帖包");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],18);
		Msg2Player("你获得了18个婚庆礼花");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],81);
		Msg2Player("你获得了81个喜糖");
		AddItem(2,3,214,81);
		Msg2Player("你获得了81个鞭炮")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],18);
		Msg2Player("你获得了18个漫天彩屑")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("你获得了1份场地说明手卷.");
		WriteLog("[结婚]:"..GetName().."打开文定吉祥包");
	end
end;