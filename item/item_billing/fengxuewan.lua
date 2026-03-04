------------------------------------------------------------
-- 凤血丸的脚本 fengxuewan.lua
--
-- comment: 使用后直接到达15000师门声望
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1004
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("您确定使用<color=yellow>凤血丸<color>直接达到15000点师门声望吗？",
		2,
		"确定/use_fengxue_wan",
		"稍后再说/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_fengxue_wan()
	local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
	local nRoute = GetPlayerRoute();
	local nRouteFlag = 0
	if nRoute > 0 then
		for _, ckRoute in tbRouteTable do
			if ckRoute == nRoute then
				nRouteFlag		= 1;	-- Route标识
			end
		end
	end
	if nRouteFlag ~= 1 then
		Say("您尚未加入任何门派，不能使用凤血丸！", 0)
		return
	end;
	local nCurFactionRepu = GetTask(336)
	if (nCurFactionRepu >= 15000) then
		Say("您的师门贡献度已经达到<color=yellow>15000<color>，不能使用凤血丸！", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 72) then
		Say("您的等级还不到<color=yellow>72<color>级，不能使用凤血丸！", 0)
		return
	end
	
	if (DelItem(2, 1, 1004, 1) == 1) then
		SetTask(336, 15000)
		Say("您的师门贡献度已经到达<color=yellow>15000<color>点！", 0)
		Msg2Player("您的师门贡献度已经到达15000点")
	end
end;

