--鉴定服相关设定全部在这里修改
Include("\\script\\lib\\date.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\clause3.lua");  
JIANDING_SWITCH = 0--1为鉴定服 开启改为1


function jiandingtrigger_drop(szNpcName)
	local today = Date();
	local wday = today:week();
	if  JIANDING_SWITCH  ~= 1 then
		return
	end
	if GetTeamSize() ~= 0 then
	--	Talk(1,"","请离开队伍");
		return 
	end	
--	if wday ~= 5 and wday ~= 6 and wday ~= 0 then
--	return 
--	end	
	
	if szNpcName == "剑仙子"  then
	nRand = random(1,100)
	if wday   == 6 and wday == 0 then
    CastState("state_inc_exp_gain", 100, 10 * 60 * 18, 1, 229997)
	if nRand <= 40 then
	tAllAward[1]:giveClause();
	end	
	else
	if nRand <= 40 then
	tAllAward[1]:giveClause();
	end	
	end
	end	
	
	if szNpcName == "笛仙子"  then
	nRand = random(1,100)
	if wday   == 6 and wday == 0 then
    CastState("state_inc_exp_gain", 100, 10 * 60 * 18, 1, 229997)
	if nRand <= 40 then
	tAllAward[1]:giveClause();
	end	
	else
	if nRand <= 40 then
	tAllAward[1]:giveClause();
	end	
	end
	end	


end


msg = "恭喜$n,在指定野外地图击杀怪物获得$i";
tAllAward = {
	[1] = {--杀手任务完成奖励(ok)
		maxRand = 10000,
		subclauses = {
		{{"灵石宝箱", {2,95,5435,1},msg}, 200},
		{{"灵石宝箱", {2,95,5435,3},msg}, 50},	
		{{"金钱袋", {2,95,662,1},msg}, 50},		
		{{"技能石碎片", {2,1,10011,1},msg}, 100},	
        {{"灵笛", {2,1,187,1},},8000},		
		{{"经验";giveClause =function() gl_aw_addExp() end}, 1600},			

		},
		giveClause = ClauseRandom.giveClause,
	},
};

function gl_aw_addExp()
--空得概率
end


