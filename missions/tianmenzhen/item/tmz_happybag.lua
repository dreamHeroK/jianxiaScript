--天门阵欢乐包

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua")

g_sMsg = "$n 打开天门阵欢乐包, 获得 $i!";

tClause = {
	subclauses = {
	{{"500点耕种值";giveClause = function() gf_Modify("Popur",500) end}, 3000},
	{{"5金";giveClause = function() gf_Modify("Money",50000) end}, 3000},
	{{"20万点经验值";giveClause = function() gf_Modify("Exp",200000) end}, 2350},
	{{"白驹丸", {2,1,270,1},}, 1000},
	{{"驯鹿棒", {2,95,172,1},g_sMsg}, 50},
	{{"天门英雄券", {2,95,691,1},g_sMsg}, 100},
	{{"般若树种", {2,0,398,1},}, 500},
	},			
	giveClause = ClauseRandom.giveClause,
};

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("很高兴");
		Clause2.giveClause(tClause);
		gf_SetLogCaption("")
	end		
end