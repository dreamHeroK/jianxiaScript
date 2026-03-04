------------------------------------------------------------
-- 凤血丸的脚本 shimenmiyao.lua
-- comment: 使用后直接到达4000师门声望
-- Item ID:  2, 95, 5040
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
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
		Say("您尚未加入任何门派，不能使用师门秘药！", 0)
		return
	end;
	local nCurFactionRepu = GetTask(336)
	if (nCurFactionRepu >= 4000) then
		Say("您的师门贡献度已经达到<color=yellow>4000<color>，不能使用师门秘药！", 0)
		return
	end
	if (DelItem(2, 95, 5040, 1) == 1) then
		SetTask(336, 4000)
		Msg2Player("您获得了师门贡献度4000点")
	end
end;

