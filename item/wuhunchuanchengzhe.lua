--武魂传承者礼盒脚本
--by 
--2020/04/06

function OnUse(idx)
	local nItemIndex = tonumber(idx)

	local selTab = {};
	local szTitle = "使用可以获得<color=yellow>武魂传承者<color>称号，武魂传承者长期有效，隐藏有效，可以在通过一些关卡时获得斗魄点数，计入每周获得上限。<color=red>已有此称号可获得1亿经验。<color>"
	if IsTitleExist(2,30) <= 0 then
		tinsert(selTab,"没有武魂传承者称号，领取称号/#_UseWuHunChuanCheng("..nItemIndex..", 1)");
	else
		tinsert(selTab,"已有武魂传承者称号，领取经验/#_UseWuHunChuanCheng("..nItemIndex..", 2)");
	end
	tinsert(selTab,"离开/cancel_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function _UseWuHunChuanCheng(nItemIndex, nType)
	if nType == 1 then
		if DelItemByIndex(nItemIndex,1) == 1 then
			AddTitle(2,30)
			Msg2Player("您获得了[武魂传承者]称号")
		end
	elseif nType == 2 then
		if GetPlayerRebornParam(0) < 1 then
			if  100000000 > (2000000000 - GetExp()) then					
				Msg2Player("你当前已经获得20亿经验，不可在获得了")
				return
			end
		end
		if DelItemByIndex(nItemIndex,1) == 1 then
			ModifyExp(100000000)
			Msg2Player("您获得了1亿经验")
		end
	end
end

function cancel_dialog()
end
