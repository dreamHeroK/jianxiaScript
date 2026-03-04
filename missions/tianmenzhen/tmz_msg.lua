function main()
	local w = tonumber(date("%w"));
	local h = tonumber(date("%H"));
	if w == 6 or w == 0 then
		if h == 13 or h == 14 then
			Msg2Global("请在14小时后返回骠骑手将军郭君鹏处，报道天门阵演武的表现！");
		end
	end
end