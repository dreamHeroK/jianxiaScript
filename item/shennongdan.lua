TASKVAL_SHENNONGDAN	= 2502		-- 该任务变量保存神农丹的剩余时间（分钟）
SHENNONGDAN_TIME	= 8 * 60	-- 一个神农丹的时间是8个小时（单位是分钟）

function OnUse()
	local val = GetTask(TASKVAL_SHENNONGDAN)
	local UseShennong = {
		"使用一个神农丹可以获得<color=yellow>8小时<color>采集时间，",
		"您现在还剩余<color=yellow>".. val .."<color>时间，您确实要使用神农丹吗？",
		"使用神农丹/ask_number",
		"我再想想/no"
	}
	Say(UseShennong[1]..UseShennong[2],2,UseShennong[3],UseShennong[4])
end

function ask_number()
	local nItemNum = GetItemCount(2,1,343);
	if nItemNum < 1 then
		Talk(1,"", "您目前没有足够的神农丹！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	AskClientForNumber("UseShennongdan",1,nItemNum,"使用多少个神农丹");
end

function UseShennongdan(nCount)
	if GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount > 200000000 then--超过2亿上限
		Talk(1,"", "已经超过了时间限制！")
		return
	end
	if DelItem(2,1,343,nCount) == 1 then
		local value = GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount
		SetTask(TASKVAL_SHENNONGDAN, value)
		Say("你的神农丹时间为<color=yellow>"..value.."<color>分钟！", 0)
	end
end

function no()
end
