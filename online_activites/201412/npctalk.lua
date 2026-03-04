Include("\\script\\lib\\globalfunctions.lua")

function main()
	local g_szItemName = "<color=green>圣诞雪人<color>："
	local selTab = {};
	local szTitle = format("%s圣诞快乐！", g_szItemName)
--	tinsert(selTab, format("领取圣诞树种/do_daily_christmas_tree"));
	tinsert(selTab, format("领取圣诞快乐包/do_daily_christmas_box"));
	tinsert(selTab,"我来看看/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function nothing()
end

function do_daily_christmas_tree()
	if gf_CheckBaseCondition(72) ~= 1 then
		return 0;
	end
	local n_daily_time = GetBit(GetTask(1313), 6);
	if n_daily_time == 1 then
	 	Talk(1,"", "<color=green>圣诞雪人<color>：您已经领取了今天的树种，明天再来吧。")
		return
	end
	gf_AddItemEx({2, 95, 5519, 1, 4},"圣诞树种");
	SetTask(1313, SetBit(GetTask(1313), 6, 1));
end

function do_daily_christmas_box()
	if gf_CheckBaseCondition(72) ~= 1 then
		return 0;
	end
	local n_daily_time = GetBit(GetTask(1314), 13);
	if n_daily_time == 1 then
	 	Talk(1,"", "<color=green>圣诞雪人<color>：您已经领取了圣诞快乐包，不能再领取哦。")
		return
	end
	gf_AddItemEx2({2, 95, 1954, 1, 4}, "圣诞快乐礼盒", "圣诞快乐", "圣诞快乐礼盒", 7 * 24 * 3600, 1);
	SetTask(1314, SetBit(GetTask(1314), 13, 1));
end
