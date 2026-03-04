--铜宝箱1
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function main()
	local tAward = {
		{50, {"辉星碎片", {2,95,769,50}}},
		{30, {"6级灵石原石", {2,95,558,1}}},
		{45, {"金钱袋",{2,95,662,1}}},
		{45, {"小人参果", {2,0,552,1}}},
		{30, {"神器", {2,95,55,10}}},
		{30, {"天使镇魂玉", {2,103,153,1}}},

	}
	local tItem = gf_RandRate(tAward)[2];
	gf_ThrowDice(tItem[2], nil, nil, nil, 2000, GetTargetNpc());           --2000为箱子存活时间
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");	
	gf_TeamOperateEX(vaf_award_api, "tTYTTongBox")
end
