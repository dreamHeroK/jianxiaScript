Include("\\script\\online\\item_buchang\\ibc_head.lua")

function main()
	local npcIndex = GetTargetNpc();
	if GetLevel() < 70 and gf_CheckPlayerRoute() == 0 then
		Talk(1,"",format("少侠等级不足%d或者没加入门派，无法开启烟花小礼盒。", 70));
		return 0;
	end
	if GetTime() - IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.SmallBoxTime) < 10 then
		Talk(1,"","你刚刚开启了烟花小礼盒，等待10秒后才能再次打开。");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.SmallBoxTime, GetTime());
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	gf_ModifyExp(500000);
	local tAward = {
        	{2, 2000, 400000, 1},
        	{2, 1000, 1000000, 1},
        	{3, 1000, 10000, 1},
        	{3, 400, 100000, 1},
		{1, 5000, "小人参果", {2,0,552, 1, 4}, 0 },
		{1, 4000, "大人参果", {2,0,553, 1, 4}, 0 },
		{1, 4000, "军功章", {2,1,9999, 1, 4}, 0 },
		{1, 5000, "皓月碎片", {2,95,740, 10, 4}, 0 },
        	{1, 2000, "神器", {2,95,55,1, 4}, 0},
        	{1, 1000, "1级血滴石", {2,22,101,1}, 0},
        	{1, 1000, "1级月白石", {2,22,201,1}, 0},
        	{1, 1000, "1级琥珀石", {2,22,301,1}, 0},
        	{1, 1000, "1级黑曜石", {2,22,401,1}, 0},
		{31, 1000, "vaf_GiveFactionBook45()", ""},
		{1, 500, "耀阳碎片", {2,95,741, 10, 4}, 0 },
		{31, 100, "vaf_GiveFactionBook70()", ""},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "开启烟花小礼盒", "烟花小礼盒");
	SetNpcLifeTime(npcIndex, 0);
end