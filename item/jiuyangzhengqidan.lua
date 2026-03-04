-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 九阳正气丹脚本
-- 文件名：jiuyangzhengqidan.lua
-- Edited by 
-- 2021/04/16 AM 03:33
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")

TSK_USE_JIUYANG_TIME = 2396;	 -- 记录使用九阳正气丹时间

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nLevel = GetLevel();
	local nReborn = gf_GetPlayerRebornCount()
	local nRouteFlag = gf_IsPlayerRoute();

	if nRouteFlag ~= 1 then
		Talk(1,"","<color=green>九阳正气丹<color>：侠士还没加入任何流派，不能用<color=yellow>九阳正气丹<color>。");
		return
	end;

	if nLevel < 85 then
		Talk(1,"","<color=green>九阳正气丹<color>：请历练到<color=yellow>85<color>级再来打开!");
		return
	end;

--	if nReborn >= 1 then -- 转生
--		Talk(1,"","<color=green>九阳正气丹<color>：未转生的侠士才可使用，你已经用不着这个了。");
--		return
--	end;

	local nLastUseTime = GetTask(TSK_USE_JIUYANG_TIME);
	local nCurTime = tonumber(GetTime());
	
	if ((nLastUseTime + 2592000) > nCurTime) then
		local leftday = ceil((nLastUseTime + 2592000 -  nCurTime)/(24*60*60))
		Talk(1, "", format("使用九阳正气丹时间间隔必须大于一个月(30天)。你在<color=green>%d<color>天后方可服用下一颗。", leftday));
		return
	end

	if nLevel < 96 then
		if DelItemByIndex(nItemIndex,1) == 1 then
			ResetProperty()
			SetLevel(96, 0)				--设置等级
			Msg2Player("您使用了一个九阳正气丹等级提升到73级")
			SetTask(TSK_USE_JIUYANG_TIME, nCurTime);
		end
	else
		local nGetExp = 2000000000 - GetExp();
		if nReborn >= 1 then -- 转生
			if DelItemByIndex(nItemIndex,1) == 1 then
				ModifyExp(2000000000)
				Msg2Player("您获得了"..nGetExp.."亿经验")
				SetTask(TSK_USE_JIUYANG_TIME, nCurTime);
			end
		else
			if  1000000000 > nGetExp then		
				Talk(1,"","<color=green>九阳正气丹<color>：你当前已获得经验大于20亿，等提升等级后再开启吧。");	
				return
			end
			if DelItemByIndex(nItemIndex,1) == 1 then
				ModifyExp(1000000000)
				Msg2Player("您获得了10亿经验")
				SetTask(TSK_USE_JIUYANG_TIME, nCurTime);
			end
		end
	end
	local nowday = tonumber(date("%y%m%d"))
	WriteLog("[100级元神丹]："..nowday.." Acc:"..GetAccount().."Role:"..GetName().." 使用九阳正气丹成功! Level From "..GetLevel())
	return 0
end


