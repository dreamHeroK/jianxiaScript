------------------------------------------------------------
-- 八宝洗髓仙丹的脚本 babaoxisuixiandan.lua
-- comment: 洗全部能力（所有能力属性扣到1点）。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID: 2,0,138
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("使用一个<color=yellow>八宝洗髓仙丹<color>可重新分配所有的潜能点，您确实要使用八宝洗髓仙丹吗？",
		2,
		"是的/change_all_points",
		"我再想想--取消/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 确认要重造全部能力
function change_all_points()
	Say("再次确认你要使用<color=yellow>八宝洗髓仙丹<color>重新分配你所有的潜能点吗？",
		2,
		"是的/confirm_change_all_points",
		"我再想想--取消/cancel_dialog")
end;

-- 最后确认要重造全部能力
function confirm_change_all_points()
	local nCurStrength = GetStrength()
	local nCurVitality = GetVitality()
	local nCurDexterity = GetDexterity()
	local nCurEnergy = GetEnergy()
	local nCurObserve = GetObserve()
	
	if ((nCurStrength <= 1) and 
		(nCurVitality <= 1) and 
		(nCurDexterity <= 1) and 
		(nCurEnergy <= 1) and 
		(nCurObserve <= 1)) then
		Say("你有能力属性不足1点，不能使用八宝洗髓仙丹！", 0)
		return
	end

	if (DelItem(2, 0, 138, 1) == 1) then
		SetStrength(1 - nCurStrength)
		SetVitality(1 - nCurVitality)
		SetDexterity(1 - nCurDexterity)
		SetEnergy(1 - nCurEnergy)
		SetObserve(1 - nCurObserve)
		
		Say("你已成功重新分配你所有的<color=yellow>潜能点<color>！", 0)
		Msg2Player("你已成功重新分配你所有的潜能点！")
	else
		Say("未知错误，不能使用<color=yellow>八宝洗髓仙丹<color>！", 0)
	end
end;

