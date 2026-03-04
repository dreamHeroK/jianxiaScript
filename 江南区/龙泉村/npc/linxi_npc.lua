--琳汐，传送人，传送至遥仙洞

g_szInfoHeader = "<color=green>琳汐<color>：";

function main()
	Say(g_szInfoHeader.."请问你找我有什么事情吗？",2,"我要去遥仙洞/go_to_yaoxiandong","没什么事/nothing");
end;

function go_to_yaoxiandong()
	local nLevel = GetLevel();
	if nLevel < 85 then
		Talk(1,"",g_szInfoHeader.."等级小于<color=yellow>85<color>级不可以进入遥仙洞。");
		return 0;
	end;
	NewWorld(118,1616,3211);
end;

function nothing()

end;