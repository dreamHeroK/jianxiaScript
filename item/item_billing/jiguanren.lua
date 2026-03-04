-- 机关人， 开启批量制造功能

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	Say("您确定要使用机关人吗？它可以帮助您开启1小时的批量制造功能。", 2, "是的，我要开启/#yes_use("..nItemIndex..")", "我再看看/no_say")
end

function yes_use(nItemIndex)
	if GetTask(2509) > 0 then
		Say("您已经使用了机关人。", 0)
	else
		if DelItem(2,1,1011,1) == 1 then
			SetTask(2509, 3600 * 18)
			Msg2Player("您开启了1个小时的批量制造功能")
		end
	end
end

function no_say()
end