-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 一等杀手包裹脚本                  
-- Edited by Starry                                 
-- 2005/12/5 PM 14:09                                    
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\clause3.lua");                                                        
-- ======================================================
function OnUse()
if	DelItem(2,1,205,1) == 1 then
tAllAward[1]:giveClause();
end;
end;


tAllAward = {
	[1] = {--杀手任务完成奖励(ok)
		maxRand = 10000,
		subclauses = {
		{{"辉煌军功章", {2,1,9977,1},}, 100},
		{{"大军功章", {2,1,9978,1},}, 500},		
		{{"军功章", {2,1,9999,1,1},}, 1500},		
		{{"消劫散", {2,0,141,1},}, 2000},		
		{{"九转回魂丹", {1,0,32,1,1},}, 2000},	
		{{"陨铁", {2,2,8,1,1},}, 2000},	
		{{"技能石碎片", {2,1,10011,10},}, 1000},		

		},
		giveClause = ClauseRandom.giveClause,
	},
};
