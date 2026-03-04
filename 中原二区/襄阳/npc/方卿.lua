function main()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","<color=green>方卿<color>：我是奉父母之命，特地来与表妹完婚的。")
	elseif i == 2 then  
		Talk(1,"","<color=green>方卿<color>：江南美如画，大漠多风沙，不知表妹以后到了凤翔能不能习惯?");
	else
		Talk(1,"","<color=green>方卿<color>：我和表妹是指腹为婚，长这么大，彼此都还没见过面，不求她美若天仙，但求知书达理就好了。")
	end
end
