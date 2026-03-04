

function main()

	Talk(1,"","<color=green>汴京马贩<color>：最近一群马贼把马路断了，实在没有宝马供应，大使你还是去御街看看吧，那里可能有你想要的马匹。");

--	local strSay = {
--		"<color=green>汴京马贩<color>：这位大侠，我这里有大量的千里良驹，保证没有疯牛病和禽流感，您要看看有没有满意的吗？",
--		"我要看看/Buy",
--		"我要喂马/Feed",
--		"我要离开/Leave",
--	}
--	Say(strSay[1], 3, strSay[2], strSay[3], strSay[4])
end

function Buy()
	Sale(54)
	Talk(1,"","<color=green>汴京马贩<color>：都是千里马，你选一个！")
end

function Leave()
end
