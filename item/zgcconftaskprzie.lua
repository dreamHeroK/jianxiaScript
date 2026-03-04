--奖励装备属性配置
--注意：此处填写尽量只新增不修改，因为玩家可能已经存在了该属性的装备。
--说明，1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4-9（1-3的魔法属性和等级）10：五行（），11：名字
Include("\\script\\lib\\writelog.lua")
Include("\\script\\class\\clause3.lua")



tAllAward = {
	[1] = {--杀手任务完成奖励(ok)
		maxRand = 10000,
		subclauses = {		
        {{"陨铁", {2,2,8,5}, }, 4920},					
        {{"陨铁碎片", {2,2,7,5}, }, 4920},			
		{{"贵宾虎纹卡（未激活）", {2,95,3451,1,1},}, 60},			
		},
		giveClause = ClauseRandom.giveClause,
	},
	[2] = {--杀手任务完成奖励(ok)
		maxRand = 10000,
		subclauses = {	
        {{"陨铁", {2,2,8,10}, }, 4890},					
        {{"陨铁碎片", {2,2,7,10}, }, 4890},			
		{{"贵宾虎纹卡（未激活）", {2,95,3451,1,1},}, 120},			
		},
		giveClause = ClauseRandom.giveClause,
	},	
};


msg = "恭喜$n开启步非烟百宝箱获得$i";

function OnUse(nItemIdx)
	szBookName = GetItemName(nItemIdx) -- 取名称
	if szBookName == "昆仑奴留下的箱子" then
		tAllAward[1]:giveClause();
		AddItem(2,1,1009,3,1)
		AddItem(2,95,5435,6)		
		DelItem(2,1,526,1)
	end	
	
	if szBookName == "裴航留下的箱子" then
		tAllAward[1]:giveClause();
				AddItem(2,1,1009,3,1)
		AddItem(2,95,5435,6)	
		DelItem(2,1,527,1)
	end		
	
	if szBookName == "柳毅留下的箱子" then
		tAllAward[1]:giveClause();
				AddItem(2,1,1009,3,1)
		AddItem(2,95,5435,6)	
		DelItem(2,1,528,1)
	end			
	
	if szBookName == "红线留下的箱子" then
		tAllAward[1]:giveClause();
				AddItem(2,1,1009,3,1)
		AddItem(2,95,5435,6)	
		DelItem(2,1,529,1)
	end		

	if szBookName == "贺景胜的铁箱子" then
		tAllAward[1]:giveClause();
				AddItem(2,1,1009,3,1)
		AddItem(2,95,5435,6)	
		DelItem(2,1,530,1)
	end		

	if szBookName == "聂大锤的铁箱子" then
		tAllAward[1]:giveClause();
				AddItem(2,1,1009,3,1)
		AddItem(2,95,5435,6)	
		DelItem(2,1,531,1)
	end		

	if szBookName == "步非烟的百宝箱" then
		tAllAward[2]:giveClause();
				AddItem(2,1,1009,6,1)
		AddItem(2,95,5435,12)	
		DelItem(2,1,532,1)
	end	
	
	
	
end

