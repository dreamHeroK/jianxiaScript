--安全强化

function OnUse()
	Say("使用安全强化功能，装备强化不会失败。<color=red>（11级及以上可以继续增强安全性）<color>",2,"开始/StartEnhance","不需要/do_nothing")
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