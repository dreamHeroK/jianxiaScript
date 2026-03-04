------------------------------------------------------------
-- 麒麟丸的脚本 qilinwan.lua
--
-- comment: 使用后直接到达15000声望
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1003
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("您确定要使用<color=yellow>麒麟丸<color>直接到达15000点声望吗？",
		2,
		"确定/use_qilin_wan",
		"稍后再说/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_qilin_wan()
	local nCurRepu = GetReputation()
	if (nCurRepu >= 15000) then
		Say("您的声望已经达到<color=yellow>15000<color>点，不能使用麒麟丸！", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 31) then
		Say("您的等级还不到<color=yellow>31<color>级，不能使用麒麟丸！", 0)
		return
	end
	
	if (DelItem(2, 1, 1003, 1) == 1) then
		ModifyReputation(15000 - nCurRepu, 0)
		Say("您的声望已到达<color=yellow>15000<color>点！", 0)
		Msg2Player("您的声望已到达15000点")
	end
end;

