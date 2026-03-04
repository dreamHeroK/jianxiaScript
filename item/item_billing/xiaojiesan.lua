------------------------------------------------------------
-- 消劫散的脚本 xiaojiesan.lua
-- comment: 洗1点PK值
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update by 
-- 2020/04/02 PM 18:32
-- Item ID: 2,0,141
------------------------------------------------------------
CHANGE_PK_VALUE = -1

-- 脚本被程序默认调用的入口函数
function OnUse()
	local nCurPKValue = GetPKValue()
	if (nCurPKValue <= 0) then
		Talk(1, "", "您的<color=yellow>PK值<color>已经是0了。不需要使用消劫散！")
		return
	end
	Say("使用一个<color=yellow>消劫散<color>可以洗1点PK值，您确实要使用吗？",
		2,
		"是的/decrease_1_PK_points",
		"我再想想/cancel_dialog")
end;

-- 确认减少一点PK值
function decrease_1_PK_points()
	if (DelItem(2, 0, 141, 1) == 1) then
		AddPKValue(CHANGE_PK_VALUE)
		Msg2Player("你成功洗了1点PK值！")
	else
		Talk(1,"","未知错误，不能使用<color=green>消劫散<color>洗PK值")
	end
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;