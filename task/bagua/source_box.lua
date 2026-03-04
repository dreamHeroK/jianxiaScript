Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\itemfunctions.lua")

tAllAward = {
	[1] = { --灵石宝箱随机开启（ok）
		maxRand = 10000,
		subclauses = {
			{{"1级灵石原石", {2,95,553,1}, }, 500},
			{{"2级灵石原石", {2,95,554,1}, }, 500},
			{{"3级灵石原石", {2,95,555,1}, }, 1950},
			{{"4级灵石原石", {2,95,556,1}, }, 2500},
			{{"5级灵石原石", {2,95,557,1}, }, 3000},
			{{"6级灵石原石", {2,95,558,1}, }, 1500},
			{{"7级灵石原石", {2,95,559,1}, "恭喜[$n]在开启<灵石宝箱>奖励时，获得$i"}, 50},
		},
		giveClause = ClauseRandom.giveClause,
	},
};

--灵石宝箱随机开启(ok)
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

function nothing()
end

