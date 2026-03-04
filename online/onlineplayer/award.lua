--奖励
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\itemfunctions.lua")


--回调路径
CallBack_Script = "\\script\\online\\onlineplayer\\award.lua";

--给经验
function gl_aw_addExp(nArg)
	local nLv = GetLevel();
	local nExp = floor(nLv*nLv*nArg);
	gf_Modify("Exp",nExp);
end

--给金钱
function gl_aw_addMoney(nArg)
	local nMoney = floor(nArg*10000);
	gf_Modify("Money",nMoney);
end

tAllAward = {
	[1] = {--整点在线福袋(ok)
		maxRand = 10000,
		subclauses = {
			{{"金钱";giveClause =function() gl_aw_addMoney(3) end}, 1500},
			{{"万物归元丹", {1,0,11,3}, }, 500},
			{{"黑玉断续膏", {1,0,6,3}, }, 500},
			{{"生生造化散", {1,0,16,3}, }, 500},
			{{"九转回魂丹", {1,0,32,1}, }, 500},
			{{"降龙令", {2,95,5433,1}, }, 2000},
			{{"陨铁碎片", {2,2,7,1,1}, }, 500},
			{{"陨铁", {2,2,8,1,1}, }, 500},
			{{"陨铁精石", {2,1,1009,1,1}, }, 200},
			{{"灵石宝箱", {2,95,5435,1}, }, 1400},
			{{"修真要诀", {2,0,554,1}, }, 300},
			{{"千变梵星券", {2,95,246,1,1}, }, 300},
			{{"金钱袋", {2,95,662,1,1}, }, 800},
			{{"师门真卷残页", {2,96,176,1,1}, }, 300},
			{{"星辰碎片", {2,201,1,1,4}, }, 200},
			{{"强化精石（9级）", {2,101,10,1,4}, "恭喜[$n]在开启<在线福袋>奖励时，获得$i"}, 60},
			{{"强化精石（11级）", {2,101,12,1,4}, "恭喜[$n]在开启<在线福袋>奖励时，获得$i"}, 30},
			{{"强化精石（12级）", {2,101,13,1,4}, "恭喜[$n]在开启<在线福袋>奖励时，获得$i"}, 5},
			{{"月华水精", {2,201,7,1,4}, "恭喜[$n]在开启<在线福袋>奖励时，获得$i"}, 5},
		},
		giveClause = ClauseRandom.giveClause,
	},
};

--在线礼包奖励有虎卡(ok)
function ol_aw_giveAward_1()
	if gf_Judge_Room_Weight(6,30,"") ~= 1 then
		return 0;
	end
	gl_aw_addExp(500)
	gf_AddItemEx({2,95,52,2,4},"藏宝箱钥匙");
	gf_AddItemEx({2,94,10,2,4},"盛世铜宝箱");
	gf_AddItemEx({2,95,55,1,4},"神器");
	gf_AddItemEx({2,95,662,2,4},"金钱袋");
	gf_AddItemEx({2,0,398,1,4},"般若树种");
	tAllAward[1]:giveClause();
	return 1
end

--在线礼包奖励未虎卡(ok)
function ol_aw_giveAward_2()
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	gl_aw_addExp(300)
	gf_AddItemEx({2,95,52,1,4},"藏宝箱钥匙");
	gf_AddItemEx({2,94,10,1,4},"盛世铜宝箱");
	gf_AddItemEx({2,95,662,2,4},"金钱袋");
	gf_AddItemEx({2,0,398,1,4},"般若树种");
	return 1
end

