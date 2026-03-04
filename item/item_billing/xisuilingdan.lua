------------------------------------------------------------
-- 洗髓灵丹的脚本 xisuilingdan.lua
-- comment: 洗任意全部的一种潜能点（只留一点）。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID: 2,0,137
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("使用一个<color=yellow>洗髓灵丹<color>可以重新分配任意一种潜能点，选择要重新分配的属性。?",
		6,
		"力量/change_strength_all_points",
		"内功/change_energy_all_points",
		"根骨/change_vitality_all_points",
		"身法/change_dexterity_all_points",
		"洞察/change_observe_all_points",
		"我再想想--取消/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 更改所有力量
function change_strength_all_points()
	Say("你确定要重新分配所有<color=yellow>力量<color>的潜能点吗？",
		2,
		"是的/confirm_strength_all",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改所有力量
function confirm_strength_all()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("你的力量不足1点，不能使用洗髓灵丹！", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetStrength(1 - nCurStrength)
		Say("成功洗掉所有的<color=yellow>力量<color>潜能点！", 0)
		Msg2Player("成功洗掉所有的力量潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓灵丹<color>！", 0)
	end
end;


-- 更改所有根骨
function change_vitality_all_points()
	Say("你确定要重新分配所有<color=yellow>根骨<color>的潜能点吗？",
		2,
		"是的/confirm_vitality_all",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改所有根骨
function confirm_vitality_all()

	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("你的根骨不足1点，不能使用洗髓灵丹！", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetVitality(1 - nCurVitality)
		Say("成功洗掉所有的<color=yellow>根骨<color>潜能点！", 0)
		Msg2Player("成功洗掉所有的根骨潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓灵丹<color>！", 0)
	end
end;


-- 更改所有身法
function change_dexterity_all_points()
	Say("你确定要重新分配所有<color=yellow>身法<color>的潜能点吗？",
		2,
		"是的/confirm_dexterity_all",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改所有身法
function confirm_dexterity_all()

	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("你的身法不足1点，不能使用洗髓灵丹！", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetDexterity(1 - nCurDexterity)
		Say("成功洗掉所有的<color=yellow>身法<color>潜能点！", 0)
		Msg2Player("成功洗掉所有的身法潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓灵丹<color>！", 0)
	end
end;


-- 更改所有内功
function change_energy_all_points()
	Say("你确定要重新分配所有<color=yellow>内功<color>的潜能点吗？",
		2,
		"是的/confirm_energy_all",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改所有内功
function confirm_energy_all()

	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("你的内功不足1点，不能使用洗髓灵丹！", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetEnergy(1 - nCurEnergy)
		Say("成功洗掉所有的<color=yellow>内功<color>潜能点！", 0)
		Msg2Player("成功洗掉所有的内功潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓灵丹<color>！", 0)
	end
end;

-- 更改所有洞察
function change_observe_all_points()
	Say("你确定要重新分配所有<color=yellow>洞察<color>的潜能点吗？",
		2,
		"是的/confirm_observe_all",
		"我再想想--取消/cancel_dialog")
end;

-- 确认更改所有洞察
function confirm_observe_all()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("你的洞察不足1点，不能使用洗髓灵丹！", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetObserve(1 - nCurObserve)
		Say("成功洗掉所有的<color=yellow>洞察<color>潜能点！", 0)
		Msg2Player("成功洗掉所有的洞察潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>洗髓灵丹<color>！", 0)
	end
end;

