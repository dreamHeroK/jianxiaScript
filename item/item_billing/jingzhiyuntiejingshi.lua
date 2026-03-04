Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\itemfunctions.lua")

tAllAward = {
	[1] = { --陨铁精石随机开启（ok）
		maxRand = 10000,
		subclauses = {
			{{"陨铁精石", {2,1,1009,150}, }, 2500},
			{{"陨铁精石", {2,1,1009,160}, }, 2500},
			{{"陨铁精石", {2,1,1009,170}, }, 2000},
			{{"陨铁精石", {2,1,1009,180}, }, 1500},
			{{"陨铁精石", {2,1,1009,190}, }, 1000},
			{{"陨铁精石", {2,1,1009,200}, "恭喜[$n]在开启<灵石宝箱>奖励时，获得$i"}, 500},
		},
		giveClause = ClauseRandom.giveClause,
	},
};

--陨铁精石随机开启(ok)
function gl_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	tAllAward[1]:giveClause();
	return 1
end

function OnUse(nItem)
	local g,d,p	= getItemGDP(nItem);
	if DelItem(g,d,p, 1) == 1 then
		gl_aw_giveAward_1()
	end
end
