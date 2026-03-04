------------------------------------------------------------
-- 洗髓丹的脚本 xisuidan.lua
-- comment: 洗任意5点潜能点。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID: 2,0,136
------------------------------------------------------------

CHANGE_POINTS = -5

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("使用一个<color=yellow>洗髓丹<color>可以重新分配任意5点潜能点，选择要重新分配的属性。",
		6,
		"力量/change_strength_5_points",
		"内功/change_energy_5_points",
		"根骨/change_vitality_5_points",
		"身法/change_dexterity_5_points",
		"洞察/change_observe_5_points",
		"我再想想--取消/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 更改5点力量
function change_strength_5_points()
	Say("你确定要重新分配5点<color=yellow>力量<color>的潜能点吗？",
		2,
		"是的/confirm_strength_5",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改5点力量
function confirm_strength_5()
	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("你的力量不足5点，不能使用洗髓丹！", 0)
		return
	end
	if (DelItem(2, 0, 136, 1) == 1) then
		SetStrength(CHANGE_POINTS)
		Say("成功洗掉5点<color=yellow>力量<color>潜能点！", 0)
		Msg2Player("成功洗掉5点力量潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓丹<color>！")
	end
end;

-- 更改5点根骨
function change_vitality_5_points()
	Say("你确定要重新分配5点<color=yellow>根骨<color>的潜能点吗？",
		2,
		"是的/confirm_vitality_5",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改5点根骨
function confirm_vitality_5()
	
	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("你的根骨不足5点，不能使用洗髓丹！", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetVitality(CHANGE_POINTS)
		Say("成功洗掉5点<color=yellow>根骨<color>潜能点！", 0)
		Msg2Player("成功洗掉5点根骨潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓丹<color>！")
	end
end;


-- 更改5点身法
function change_dexterity_5_points()
	Say("你确定要重新分配5点<color=yellow>身法<color>的潜能点吗？",
		2,
		"是的/confirm_dexterity_5",
		"我再想想--取消/cancel_dialog")
end;
-- 确认更改5点身法
function confirm_dexterity_5()
	
	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("你的身法不足5点，不能使用洗髓丹！", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetDexterity(CHANGE_POINTS)
		Say("成功洗掉5点<color=yellow>身法<color>潜能点！", 0)
		Msg2Player("成功洗掉5点身法潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓丹<color>！")
	end
end;


-- 更改5点内功
function change_energy_5_points()
	Say("你确定要重新分配5点<color=yellow>内功<color>的潜能点吗？",
		2,
		"是的/confirm_energy_5",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改5点内功
function confirm_energy_5()
	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("你的内功不足5点，不能使用洗髓丹！", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetEnergy(CHANGE_POINTS)
		Say("成功洗掉5点<color=yellow>内功<color>潜能点！", 0)
		Msg2Player("成功洗掉5点内功潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓丹<color>！")
	end
end;


-- 更改5点洞察
function change_observe_5_points()
	Say("你确定要重新分配5点<color=yellow>洞察<color>的潜能点吗？",
		2,
		"是的/confirm_observe_5",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改5点洞察
function confirm_observe_5()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("你的洞察不足5点，不能使用洗髓丹！", 0)
		return
	end
	
	if (DelItem(2, 0, 136, 1) == 1) then
		SetObserve(CHANGE_POINTS)
		Say("成功洗掉5点<color=yellow>洞察<color>潜能点！", 0)
		Msg2Player("成功洗掉5点洞察潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓丹<color>！")
	end
end;

