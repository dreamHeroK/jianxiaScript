--安全强化

function OnUse()
	Say("使用安全强化精石，在强化时提升强化概率并在失败时保持强化度不变。<color=red>（10级以上可以继续提升安全性）<color>",2,"开始强化/StartEnhance","不需要/do_nothing")
end

function StartEnhance()
	if GetFightState() ~= 0 then
		Talk(1,"","非战斗状态才能使用安全强化道具");
		return 0;
	end
	EnhanceItem(3);
	return 1;
end

function do_nothing()
	--do nothing
end