--龙血仙丹包脚本
--by 
--2021/04/23
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local UseLongXue = {
		"<color=yellow>龙血仙丹<color>是经过提炼龙血丸精华而制成的神级龙血丸，80级以下角色使用后可以将等级直接提升至80级，您确定要使用吗？",
		"<color=red>80级以上角色使用将可获得1亿经验，每个角色只能使用五次。<color>",
		"使用龙血仙丹/#UseLongXueXianDan("..nItemIndex..")",
		"我再想想/cancel_dialog"
	}
	Say(UseLongXue[1]..UseLongXue[2],2,UseLongXue[3],UseLongXue[4])
end

function UseLongXueXianDan(nItemIndex)
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute()
	if GetTask(1417) >= 5 then
		Talk(1,"","侠士已经使用了五次，不能再用<color=yellow>龙血仙丹<color>。");
		return
	end;
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>龙血仙丹<color>。");
		return
	end;
	if GetLevel() < 80 then
		if DelItemByIndex(nItemIndex,1) == 1 then
			SetLevel(80, 0);					--设置等级	
			Msg2Player("您使用了一个龙血仙丹等级提升到80级")
			SetTask(1417, GetTask(1417) + 1)
		end
	else
		if GetPlayerRebornParam(0) < 1 then
			if  100000000 > (2000000000 - GetExp()) then					
				Msg2Player("你当前已经获得20亿经验，不可在获得了")
				return
			end
		end
		if DelItemByIndex(nItemIndex,1) == 1 then
			ModifyExp(100000000)
			Msg2Player("您获得了1亿经验")
			SetTask(1417, GetTask(1417) + 1)
		end
	end
end

function cancel_dialog()
end
