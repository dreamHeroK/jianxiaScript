--世界任务
--地点：襄阳  任务：收集枪头和刀鞘
--策划：樊万松  2004.01.27

function main()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","<color=green>张影<color>：无论他明门正派、还是邪魔歪道，有了不能确定的事情，都得来找我，哈哈！")
	elseif i == 2 then  
		Talk(1,"","<color=green>张影<color>：没错，我就是天下第一风媒。少林、武当、峨媚，江湖十大门派、四大世家、帮盟会派，到处都有我的眼线。只有我不感兴趣的，没有我不知道的。")
	else
		Talk(1,"","<color=green>张影<color>：知道的太多，有时候并不是一种幸福。")
	end
end;
