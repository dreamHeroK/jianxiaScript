--永结同心包
Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(17,30) == 0 then
		Talk(1,"","你的背包空间不足，请整理后在重新打开永结同心包。");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local task_date = GetTask(TASK_WEDDING_DATE)
		local task_para = GetTask(TASK_WEDDING_FIELD)
		add_invitation(10,task_date,task_para);
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],3);
		Msg2Player("你获得了3个婚庆礼花");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],8);
		Msg2Player("你获得了8个喜糖");
		AddItem(2,3,214,6);
		Msg2Player("你获得了6个鞭炮")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],1);
		Msg2Player("你获得了1个漫天彩屑")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("你获得了1份场地说明手卷.");
		WriteLog("[结婚]:"..GetName().."打开永结同心包");
	end
end;