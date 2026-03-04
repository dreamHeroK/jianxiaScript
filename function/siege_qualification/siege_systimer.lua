--定时开启攻城资格赛

function main()
	local wDay = tonumber(date("%w"));
	if wDay == 5 then		
		Msg2Global("战报：攻城区已经可以进入");
	end
end