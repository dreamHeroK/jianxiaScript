--乾坤解绑符物品脚本2;95;611

function OnUse(nItemIdx)
	local tbSay = {}
	local szTitle = format("<color=green>%s<color>：可以解绑一些绑定的装备。",GetItemName(nItemIdx))
	szTitle = format("%s%s",szTitle, "<color=red>提示：解绑后的装备变成装备未绑定，穿戴后就会变成绑定状态；当前仅支持轩辕首饰解绑<color>")
	tinsert(tbSay, format("解绑装备/#_OnUse_confirm(%d)", nItemIdx))
	tinsert(tbSay, format("了解一下/#_view_detail(%d)", nItemIdx))
	tinsert(tbSay, "取消/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _view_detail(nItemIdx)
	local tbSay = {}
	local szTitle = format("<color=green>%s<color>：不同的装备需要消耗不同数量的乾坤解绑符和金钱。\n轩辕首饰需要消耗1个乾坤解绑符\n当前仅支持轩辕首饰解绑",GetItemName(nItemIdx))
	tinsert(tbSay, format("返回/#OnUse(%d)", nItemIdx))
	tinsert(tbSay, "取消/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OnUse_confirm(nItemIdx)
	SendScript2Client("Open([[CommonEnhanceItem]], 2);");
end

function no()
end