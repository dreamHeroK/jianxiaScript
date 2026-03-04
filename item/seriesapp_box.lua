
function OnUse(nItemIdx)
	local selTab = {};
	local szTitle = ""
	local szTitle = format("<color=green>五行天仪匣<color>：开启<color=green>五行天仪匣<color>可以获得随机属性<color=yellow>五行天仪<color>一个。你确定开启吗？")
	tinsert(selTab,"我要开启/change_tianyi");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end


function change_tianyi()
	local nItemNum = GetItemCount(2,97,213);
	if nItemNum < 1 then
	 	Talk(1,"", "你身上没有五行天仪匣。")
		return
	end
	if DelItem(2,97,213,1) == 1 then
--		AddItem(0,154,11,1,4,-1,-1,-1,-1,-1,-1);
		AddItem(0,154,random(1,2),1,1,-1,-1,-1,-1,-1,-1);	
		Msg2Player("您获得了[五行天仪]×1");
	else
		WriteLog("Change Taiyi Error:\t"..GetName().." got 失败！");
		Talk(1,"OnUse","开启五行天仪匣失败。")
		return
	end
end