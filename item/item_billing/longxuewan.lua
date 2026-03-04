------------------------------------------------------------
-- 龙血丸的脚本 longxuewan.lua
--by 
--2020/04/06

Include("\\script\\lib\\globalfunctions.lua")

-- 脚本被程序默认调用的入口函数
function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local UseLongXue = {
		"<color=yellow>龙血丸<color>乃药王谷药王穷数十年精力炼制而成，可以直接打通任督二脉。<color=Gold>(低于72级者直接升至72级并额外给予500万经验)<color>，您确定要使用吗？(限制使用1个)",
		"\n<color=yellow>72级以上使用时可直接获得2500万经验。<color>",
		"使用龙血丸/#use_longxue_wan("..nItemIndex..")",
		"我再想想/cancel_dialog"
	}
	Say(UseLongXue[1]..UseLongXue[2],2,UseLongXue[3],UseLongXue[4])
end;

function use_longxue_wan(nItemIndex)
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute();
	local nTalkValue = GetTask(1245)
	if nTalkValue >= 1 then
		Talk(1,"","侠士已经使用了1个<color=yellow>龙血丸<color>，已经不能使用了。");
		return
	end;
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>龙血丸<color>。");
		return
	end;
	if GetLevel() < 75 then
		if DelItemByIndex(nItemIndex,1) == 1 then
			ResetProperty()
			SetLevel(75, 0)				--设置等级
			Msg2Player("您使用了一个龙血丸等级提升到75级")
			local nNewValue = nTalkValue + 1
			SetTask(1245, nNewValue);
		end
	else
		if GetPlayerRebornParam(0) < 1 then
			if  100000000 > (2000000000 - GetExp()) then					
				Msg2Player("你当前已经获得20亿经验，不可在获得了")
				return
			end
		end
		if DelItemByIndex(nItemIndex,1) == 1 then
			ModifyExp(25000000)
			Msg2Player("您获得了2500万经验")
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
			local nNewValue = nTalkValue + 1
			SetTask(1245, nNewValue);
		end
	end
end

function cancel_dialog()
end
