Include("\\script\\missions\\tong_melee\\tm_head.lua")

function main()
	if IsTongMeleeSystemOpen() ~= 1 then
		return
	end
	local today = Date();
	local wday = today:week();
	if wday ~= 0 then
		return 0;
	end
	Msg2Global("[8v8]帮派会战即将开始，大侠们请赶赴成都，找帮会大使进行报名！");
	AddLocalCountNews("[8v8]帮派会战即将开始，大侠们请赶赴成都，找帮会大使进行报名！", 2);
end