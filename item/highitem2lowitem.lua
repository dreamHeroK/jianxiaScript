--高级徽章换低级脚本
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{2,0,448,"普贤舍利", {{2,0,447,"文殊舍利"},}},
	{2,0,449,"大明王舍利",{{2,0,447,"文殊舍利"},{2,0,448,"普贤舍利"},}},
	{2,0,469,"天玑木",{{2,0,468,"天璇木"},}},
	{2,0,470,"天枢木",{{2,0,468,"天璇木"},{2,0,469,"天玑木"},}},
	{2,0,457,"金莲花",{{2,0,456,"莲花"},}},
	{2,0,461,"净瓶仙柳",{{2,0,456,"莲花"},{2,0,457,"金莲花"},}},
	{2,0,466,"紫金钵",{{2,0,463,"龙头袋"},}},
	{2,0,467,"绿玉杖",{{2,0,463,"龙头袋"},{2,0,466,"紫金钵"},}},
	{2,0,454,"秘毒方",{{2,0,453,"白火石"},}},
	{2,0,455,"机关秘录",{{2,0,453,"白火石"},{2,0,454,"秘毒方"},}},
	{2,0,477,"精皮箭袋",{{2,0,476,"马镫"},}},
	{2,0,478,"金刚盾",{{2,0,476,"马镫"},{2,0,477,"精皮箭袋"},}},
	{2,0,484,"蜈蚣毒",{{2,0,483,"蜘蛛毒"},}},
	{2,0,485,"尸毒",{{2,0,483,"蜘蛛毒"},{2,0,484,"蜈蚣毒"},}},
	{2,0,495,"驱魔香",{{2,0,493,"天罡符"},}},
	{2,0,496,"镇妖铃",{{2,0,493,"天罡符"},{2,0,495,"驱魔香"},}},
	{2,0,499,"圣火令",{{2,0,498,"赤火令"},}},
	{2,0,500,"五行旗",{{2,0,498,"赤火令"},{2,0,499,"圣火令"},}},
	{2,0,491,"玫瑰露",{{2,0,490,"牡丹露"},}},
	{2,0,487,"九彩花瓣",{{2,0,490,"牡丹露"},{2,0,491,"玫瑰露"},}},
}

--各流派所对应的徽章的信息
TB_TOTEM_INFO = 
{	--{{徽章1信息},{徽章2信息},{徽章3信息}}
	[1] = {{2,0,447,"文殊舍利"},{2,0,448,"普贤舍利"},{2,0,449,"大明王舍利"}},	--少林
	[2] = {{2,0,468,"天璇木"},{2,0,469,"天玑木"},{2,0,470,"天枢木"}},	--武当
	[3] = {{2,0,456,"莲花"},{2,0,457,"金莲花"},{2,0,461,"净瓶仙柳"}},	--峨嵋
	[4] = {{2,0,463,"龙头袋"},{2,0,466,"紫金钵"},{2,0,467,"绿玉杖"}},	--丐帮
	[5] = {{2,0,453,"白火石"},{2,0,454,"秘毒方"},{2,0,455,"机关秘录"}}, 	--唐门	
	[6] = {{2,0,476,"马镫"},{2,0,477,"精皮箭袋"},{2,0,478,"金刚盾"}},	--杨门
	[7] = {{2,0,483,"蜘蛛毒"},{2,0,484,"蜈蚣毒"},{2,0,485,"尸毒"}},	--五毒
	[8] = {{2,0,493,"天罡符"},{2,0,495,"驱魔香"},{2,0,496,"镇妖铃"}},	--昆仑
	[9] = {{2,0,498,"赤火令"},{2,0,499,"圣火令"},{2,0,500,"五行旗"}},	--明教
	[10] = {{2,0,490,"牡丹露"},{2,0,491,"玫瑰露"},{2,0,487,"九彩花瓣"}},	--翠烟
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end

	SetTaskTemp(25, nTabIndex)
	local selTab = {};
	local szTitle = ""
	local szTitle = format("%s：可以按照1:1的比例转化为同门派更低级的徽章", tTab[nTabIndex][4])
	for i=1, getn(tTab[nTabIndex][5]) do
		local nIndex = tTab[nTabIndex][5][i][3]
		local szName = tTab[nTabIndex][5][i][4]
		tinsert(selTab,"我要转化为"..szName.."/#change_to_item("..nIndex..")");
	end
	tinsert(selTab,"暂不转化/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function change_to_item(nIndex)
	local nTabIndex = GetTaskTemp(25)
	local nItemNum = GetItemCount(tTab[nTabIndex][1],tTab[nTabIndex][2],tTab[nTabIndex][3]);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上的[%s]不够", tTab[nTabIndex][4], tTab[nTabIndex][4]))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	SetTaskTemp(199, nIndex)
	if nItemNum == 1 then
		do_change_to_item(1)
	else
		AskClientForNumber("do_change_to_item",1,nItemNum,"请输入转化次数");
	end
end;

function do_change_to_item(nCount)
	local nTabIndex = GetTaskTemp(25)
	local nIndex = GetTaskTemp(199)
	if DelItem(tTab[nTabIndex][1],tTab[nTabIndex][2],tTab[nTabIndex][3],nCount) == 1 then
		AddItem(2,0,nIndex,nCount, 1);
		Msg2Player("您获得了["..tTab[nTabIndex][4].."]×"..nCount);
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"change_to_item","转化"..tTab[nTabIndex][4].."失败。")
		return
	end
end;

function nothing()
end
