-- 攻城战捕快
-- lizhi
-- 2007-5-9 9:29

Include("\\script\\gongcheng\\prison\\prison_head.lua")

tCityWarPrison = {730,731,732,733,734}

function main()
	local selTab =
	{
		"我有个朋友在里面，我来探监/visit_a_prisoner",
		"没事/nothing",
	}
	Say("<color=green>捕快<color>：此处是牢房重地，闲人勿靠近，你有什么事吗？",getn(selTab),selTab)
end;

function visit_a_prisoner()
	Say("<color=green>捕快<color>：你要到哪个城市牢房探监？",
		6,
		"城市牢房一/#visit_yes(1)",
		"城市牢房二/#visit_yes(2)",
		"城市牢房三/#visit_yes(3)",
		"城市牢房四/#visit_yes(4)",
		"城市牢房五/#visit_yes(5)",
		"离开/nothing"
		)

end

function visit_yes(nIndex)
	local selTab = 
	{
		"答应/#enter_jail("..nIndex..")",
		"取消/nothing",
	}
	if GetTrigger(CITYWAR_ENTER_PRISON) == 0 then
		Say("<color=green>捕快<color>：本大爷最近手头比较紧，拿 <color=yellow>1金<color>来花花吧。",getn(selTab),selTab)
	else
		Say("<color=green>捕快<color>：你确定还要继续探监吗？",2,"确定/#enter_jail("..nIndex..")","离开/nothing")
	end
end

function enter_jail(nIndex)
	CleanInteractive()
	if GetTrigger(CITYWAR_ENTER_PRISON) == 0 then
		if Pay(10000) == 1 then
			CreateTrigger(2, 1805 + nIndex, CITYWAR_ENTER_PRISON)
			NewWorld(tCityWarPrison[nIndex], tCityWarPrisonPos[1], tCityWarPrisonPos[2])
		else
			Talk(1,"","<color=green>捕快<color>：你个穷叫花子找老子消遣是吧？这年头没钱还想进牢房？美得你！")
		end
	else
		NewWorld(tCityWarPrison[nIndex], tCityWarPrisonPos[1], tCityWarPrisonPos[2])
	end
end
