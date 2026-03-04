Include("\\script\\online\\item_buchang\\ibc_head.lua")

--使用共聚江湖礼盒
function OnUse(nItem)
	local tSay = {
		format("确定/#_GetBcAward(%d)", nItem),
		"取消/nothing",
	}
	Say("<color=green>共聚江湖礼盒<color>： 中秋国庆，普天同庆！归来服特别制作的礼盒，祝各位侠士节日愉快！开启礼盒获得“共聚江湖”称号（亮出称号每分钟都可获得经验奖励）并且每日都可领取一次珍贵的礼物。少侠确定要开启吗？", getn(tSay), tSay);
end

function _GetBcAward(nItem)
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
--	if DelItemByIndex(tonumber(nItem), 1) ~= 1 then
--		return 0;
--	end
	if ibc_IsOpen() ~= 1 then
		Talk(1,"",format("<color=green>共聚江湖礼盒<color>： 双节活动已结束，无法领取奖励了。"));
		return 0;
	end
	
	if IBC_TASK_MANAGE:GetDailyTask(IBC_TASK_MANAGE.AwardTag) >= 1 then
		Talk(1,"",format("<color=green>共聚江湖礼盒<color>： 少侠今日已领取[共聚江湖礼盒]的奖励，活动期间每日只能领取一次。"));
		return
	end

	DoFireworks(832, 3);

	local nDate = tonumber(date("%Y%m%d"));
	if IsTitleExist(3,8) <= 0 then
		gf_AddTitle(3, 8, 2, 20201008)
		SetTask(TSK_YEARS_BEGIN_DATE,nDate);
		local nEndDate = tf_GetResultDate(GetTask(TSK_YEARS_BEGIN_DATE),g_nYearsDays-1);
		SetTask(TSK_YEARS_END_DATE,nEndDate);	
	end	

	local tYHAward = {
        	{1, 3000, "蓝幕欢庆焰火", {2,95,730,1, 4}, 7 * 24 * 3600},
        	{1, 2000, "赤幕欢庆焰火", {2,95,731,1, 4}, 7 * 24 * 3600},
        	{1, 1000, "橙幕欢庆焰火", {2,95,732,1, 4}, 7 * 24 * 3600},
        	{1, 200, "橙色欢庆烟花", {2,95,728,1, 4}, 7 * 24 * 3600},
        	{1, 500, "蓝色欢庆烟花", {2,95,729,1, 4}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tYHAward, gf_SumRandBase(tYHAward), 1, "开启班长的礼品箱获得烟火", "班长的礼品箱");

	local tAward = {
		{1, 4000, "般若树种", {2,0,398,5}, 0},
		{1, 4000, "大人参果", {2, 0, 552, 5}, 0},
		{1, 4000, "修真要诀", {2, 0, 554, 5}, 0},
        	{1, 2000, "1级血滴石", {2,22,101,3}, 0},
        	{1, 600, "2级血滴石", {2,22,102,3}, 0},
        	{1, 2000, "1级月白石", {2,22,201,3}, 0},
        	{1, 600, "2级月白石", {2,22,202,3}, 0},
        	{1, 2000, "1级琥珀石", {2,22,301,3}, 0},
        	{1, 600, "2级琥珀石", {2,22,302,3}, 0},
        	{1, 2000, "1级黑曜石", {2,22,401,3}, 0},
        	{1, 600, "2级黑曜石", {2,22,402,3}, 0},
        	{1, 300, "紫霞秘籍", {0,107,65,1}, 1},
        	{1, 100, "天霞秘籍", {0,107,64,1}, 1},
        	{1, 50, "耀阳装备箱", {2,95,5443,1}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2(tAward[nIndex][4], tAward[nIndex][3], "共聚江湖礼盒", "开启共聚江湖礼盒奖励", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2SubWorld(format("[%s]开启共聚江湖礼盒获得了%d个%s", GetName(), tonumber(tAward[nIndex][4][4]), tAward[nIndex][3]))
	end
	IBC_TASK_MANAGE:AddDailyTask(IBC_TASK_MANAGE.AwardTag, 1);
end