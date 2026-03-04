--甑子丹
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\weekend\\task_main.lua");
Include("\\script\\task\\weekend\\task_head.lua");

function main()
	if CheckTime(6) == 1 or CheckTime(0) == 1 then		--星期六和星期天才允许运送物资
		local nOffer = QueryPoint();
		local szSay = {
			"<color=green>周末活动大使<color>：最近北方战事不断，倭寇趁机也来入侵沿海一带。大宋苦于国力渐弱，兵力不足一直没有能将倭寇驱逐出境！我特在此招募有志的江湖儿女一起上阵杀敌，驱除倭寇，还我河山。大侠目前的功勋值为：<color=yellow>"..nOffer.."<color>。",
			"上交军用物资/supply_armament",
			"上阵杀敌/kill_enemy",
			"帮大宋运送物资/deliver_goods",
			"兑换奖励/exchange_reward",
			"学习制造军用物资/Learn_life_skill",
			"了解周末活动/introduce_detail",
			"结束对话/end_say"
		};
		SelectSay(szSay);
	elseif CheckTime(5) == 1 then	--周末的时候才有活动
		local nOffer = QueryPoint();
		local szSay = {
			"<color=green>周末活动大使<color>：最近北方战事不断，倭寇趁机也来入侵沿海一带。大宋苦于国力渐弱，兵力不足一直没有能将倭寇驱逐出境！我特在此招募有志的江湖儿女一起上阵杀敌，驱除倭寇，还我河山。大侠目前的功勋值为：<color=yellow>"..nOffer.."<color>。",
			"上交军用物资/supply_armament",
			"上阵杀敌/kill_enemy",
			"兑换奖励/exchange_reward",
			"学习制造军用物资/Learn_life_skill",
			"了解周末活动/introduce_detail",
			"结束对话/end_say"
		};
		SelectSay(szSay);
	else
		local szSay = {
			"<color=green>周末活动大使<color>：最近北方战事不断，倭寇趁机也来入侵沿海一带。大宋苦于国力渐弱，兵力不足一直没有能将倭寇驱逐出境！我特在此招募有志的江湖儿女一起上阵杀敌，驱除倭寇，还我河山。",
			"了解周末活动/introduce_detail",
			"学习制造军用物资/Learn_life_skill",
			"结束对话/end_say"
		};
		SelectSay(szSay);
	end;
end;
