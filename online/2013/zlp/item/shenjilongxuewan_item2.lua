--龙血仙丹包脚本
--by 
--2021/04/23
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local UseLongXue = {
		"<color=yellow>龙血仙丹<color>秒82级 赠送3个1级技能石，您确定要使用吗？",
		"<color=red>（高于82级角色不可食用）。<color>",
		"使用龙血仙丹/#UseLongXueXianDan("..nItemIndex..")",
		"我再想想/cancel_dialog"
	}
	Say(UseLongXue[1]..UseLongXue[2],2,UseLongXue[3],UseLongXue[4])
end

function UseLongXueXianDan(nItemIndex)
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute()
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>龙血仙丹<color>。");
		return
	end;
	if GetLevel() < 82 then
		if DelItemByIndex(nItemIndex,1) == 1 then
			SetLevel(82, 0);					--设置等级	
			Msg2Player("您使用了一个龙血仙丹等级提升到80级")
			gf_AddItemEx({2,22,1,3,4},"1级技能石");
		end



	end
end

function cancel_dialog()
end
