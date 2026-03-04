-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 菩提转生丹脚本
-- 文件名：putizhuanshengdan.lua
-- Edited by moocrun
-- 2021/04/16 AM 03:51
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nLevel = GetLevel();
	local nReborn = gf_GetPlayerRebornCount()
	local nRouteFlag = gf_IsPlayerRoute();

	if nRouteFlag ~= 1 then
		Talk(1,"","<color=green>菩提转生丹<color>：侠士还没加入任何流派，不能用<color=yellow>菩提转生丹<color>。");
		return
	end;

	if nReborn >= 1 then -- 转生
		Talk(1,"","<color=green>菩提转生丹<color>：未转生的侠士才可使用，你已经用不着这个了。");
		return
	end;

	if nLevel < 99 then
		Talk(1,"","<color=green>菩提转生丹<color>：请历练到<color=yellow>99<color>级再来打开!");
		return
	end;

	if DelItemByIndex(nItemIndex,1) == 1 then
		gf_SetTaskByte(1538, 1, 1);				-- 1转
		SetLevel(1, 0);				-- 设置等级
		ModifyExp(-GetExp())    
		ResetProperty()
		local selTab = {
			"退出客户端/#ExitGame()",
			"下次再说/nothing",
		}
		Say("<color=green>菩提转生丹<color>：你已成功使用[菩提转生丹]，获得1转并提升等级至1转1级，需要退出客户端再次进入才能有效，你确定要退出码？",getn(selTab),selTab);
		local nowday = tonumber(date("%y%m%d"))
		WriteLog("[菩提转生丹]："..nowday.." Acc:"..GetAccount().."Role:"..GetName().." 使用菩提转生丹成功! Level From 1转 "..GetLevel())
	end
	return 0
end



