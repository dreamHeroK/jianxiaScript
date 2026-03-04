--师门圣物物品脚本
Include("\\script\\lib\\awardtemplet.lua");

--各流派所对应的徽章的信息
TB_TOTEM_INFO = 
{	--{{徽章1信息},{徽章2信息},{徽章3信息}}
	[0] = {},
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

function OnUse()
	Say("[师门圣物]：使用后可获得对应流派<color=yellow>10个师门二级物品<color>或<color=yellow>5个师门三级物品<color>。",3,"我要兑换 10个师门二级物品/UseShiMenShengWu1","我要兑换 5个师门三级物品/UseShiMenShengWu2","\n先不兑换了/do_nothing")
end

function UseShiMenShengWu1()
	local nItemNum = GetItemCount(2,95,205)
	if nItemNum < 1 then
		Talk(1,"","你当前没有师门圣物！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_Do_UseShiMenShengWu1(1)
	else
		AskClientForNumber("Do_UseShiMenShengWu1",1,nItemNum,"需要兑换多少个？");
	end
end

function UseShiMenShengWu2()
	local nItemNum = GetItemCount(2,95,205)
	if nItemNum < 1 then
		Talk(1,"","你当前没有师门圣物！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		Do_UseShiMenShengWu2(1)
	else
		AskClientForNumber("Do_UseShiMenShengWu2",1,nItemNum,"需要兑换多少个？");
	end
end

function Do_UseShiMenShengWu1(nCount)
	Say("[师门圣物]：你确定要兑换<color=yellow>"..nCount.."次10个师门二级物品<color>么？",2,"\n我确定兑换/#_Do_UseShiMenShengWu1("..nCount..")", "\n先不兑换了/do_nothing")
end

function _Do_UseShiMenShengWu1(nCount)
	local nFaction = GetPlayerFaction()
	if DelItem(2,95,205,nCount) == 1 then
		local nCurCount = nCount*10;
		AddItem(TB_TOTEM_INFO[nFaction][2][1],TB_TOTEM_INFO[nFaction][2][2],TB_TOTEM_INFO[nFaction][2][3],nCurCount);
		Msg2Player("您获得了["..TB_TOTEM_INFO[nFaction][2][4].."]×"..nCurCount);
	else
		WriteLog("GiveItem Error:\t"..GetName().." got "..nCurCount.."失败！");
		Talk(1,"OnUse","使用师门圣物兑换失败。")
		return
	end
end

function Do_UseShiMenShengWu2(nCount)
	Say("[师门圣物]：你确定要兑换<color=yellow>"..nCount.."次5个师门三级物品<color>么？",2,"\n我确定兑换/#_Do_UseShiMenShengWu2("..nCount..")", "\n先不兑换了/do_nothing")
end

function _Do_UseShiMenShengWu2(nCount)
	local nFaction = GetPlayerFaction();
	if DelItem(2,95,205,nCount) == 1 then
		local nCurCount = nCount*5;
		AddItem(TB_TOTEM_INFO[nFaction][3][1],TB_TOTEM_INFO[nFaction][3][2],TB_TOTEM_INFO[nFaction][3][3],nCurCount);
		Msg2Player("您获得了["..TB_TOTEM_INFO[nFaction][3][4].."]×"..nCurCount);
	else
		WriteLog("GiveItem Error:\t"..GetName().." got "..nCurCount.."失败！");
		Talk(1,"OnUse","使用师门圣物兑换失败。")
		return
	end
end

function do_nothing()

end