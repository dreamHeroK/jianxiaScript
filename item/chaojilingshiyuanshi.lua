--高级灵石原石物品脚本
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\itemfunctions.lua")
Include("\\script\\lib\\lingshi_head.lua")
function OnUse(nItemIndex)

	if DelItemByIndex(nItemIndex,1) == 1 then
    AddgaojiLingShi();
	end

end


function AddgaojiLingShi()

tAllAward[1]:giveClause();
end

tAllAward = {
	[1] = { --灵石随机奖励（ok）
		maxRand = 10000,
		subclauses = {	
		               {{"7级致敌定身/t秒";giveClause =function() gl_aw_addLingShi(8300,2,7) end}, 2000},
		               {{"7级周围所有友方/2%概率回避混乱、睡眠、击倒";giveClause =function() gl_aw_addLingShi(8301,1,7) end}, 2000},
		               {{"7级周围所有友方/2%概率回避定身、眩晕、击退";giveClause =function() gl_aw_addLingShi(8302,3,7) end}, 2000},
		               {{"7级所有负面状态回避概率/1%";giveClause =function() gl_aw_addLingShi(8303,0,7) end}, 2000},
		               {{"7级致敌睡眠/t秒";giveClause =function() gl_aw_addLingShi(8304,2,7) end}, 2000},







		
		},
		giveClause = ClauseRandom.giveClause,
	},
};



--给灵石
function gl_aw_addLingShi(nId,nWz,nLv)
AddLingShi(nId,nWz,nLv);
end;
