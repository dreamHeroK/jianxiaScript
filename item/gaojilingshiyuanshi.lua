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
			{{"1级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,1) end}, 89},
			{{"2级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,2) end}, 89},
		               {{"3级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,3) end}, 89},
			{{"4级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,4) end}, 89},
			{{"5级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,5) end}, 40},
		               {{"6级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,6) end}, 20},
		               {{"7级头武功施展速度提高/1%<enter>内外攻提高/2%";giveClause =function() gl_aw_addLingShi(4870,0,7) end}, 10},
		               {{"1级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,1) end}, 89},
		               {{"2级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,2) end}, 89},
		               {{"3级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,3) end}, 89},
		               {{"4级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,4) end}, 89},
		               {{"5级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,5) end}, 40},
		               {{"6级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,6) end}, 20},
		               {{"7级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(4876,0,7) end}, 10},
		               {{"1级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,1) end}, 89},
		               {{"2级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,2) end}, 89},
		               {{"3级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,3) end}, 89},
		               {{"4级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,4) end}, 89},
		               {{"5级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,5) end}, 40},
		               {{"6级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,6) end}, 20},
		               {{"7级所有属性增加/1<enter>生命上限提高/2%<enter>600秒帽子耐久回复/3";giveClause =function() gl_aw_addLingShi(8002,0,7) end}, 10},
		               {{"1级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,1) end}, 89},
		               {{"2级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,2) end}, 89},
		               {{"3级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,3) end}, 89},
		               {{"4级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,4) end}, 89},
		               {{"5级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,5) end}, 40},
		               {{"6级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,6) end}, 20},
		               {{"7级内防降低/1%;内攻提高/2%<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8003,1,7) end}, 10},
		               {{"1级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,1) end}, 89},
		               {{"2级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,2) end}, 89},
		               {{"3级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,3) end}, 89},
		               {{"4级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,4) end}, 89},
		               {{"5级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,5) end}, 40},
		               {{"6级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,6) end}, 20},
		               {{"7级外防降低/1%;外攻提高/2%<enter>力量增加/3";giveClause =function() gl_aw_addLingShi(8004,1,7) end}, 10},
		               {{"1级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,1) end}, 60},
		               {{"2级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,2) end}, 60},
		               {{"3级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,3) end}, 60},
		               {{"4级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,4) end}, 60},
		               {{"5级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,5) end}, 60},
		               {{"6级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,6) end}, 60},
		               {{"7级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8005,1,7) end}, 60},
		               {{"1级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,1) end}, 89},
		               {{"2级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,2) end}, 89},
		               {{"3级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,3) end}, 89},
		               {{"4级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,4) end}, 89},
		               {{"5级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,5) end}, 40},
		               {{"6级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,6) end}, 20},
		               {{"7级受伤动作时间缩短/1%<enter>生命上限提高/2%<enter>攻击有概率提高伤害100点持续5秒";giveClause =function() gl_aw_addLingShi(8006,1,7) end}, 10},
		               {{"1级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,1) end}, 60},
		               {{"2级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,2) end}, 60},
		               {{"3级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,3) end}, 60},
		               {{"4级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,4) end}, 60},
		               {{"5级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,5) end}, 60},
		               {{"6级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,6) end}, 60},
		               {{"7级所有属性增加/1<enter>生命上限提高/2%<enter>600秒上衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8007,1,7) end}, 60},
		               {{"1级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,1) end}, 60},
		               {{"2级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,2) end}, 60},
		               {{"3级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,3) end}, 60},
		               {{"4级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,4) end}, 60},
		               {{"5级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,5) end}, 60},
		               {{"6级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,6) end}, 60},
		               {{"7级所有属性增加/1<enter>生命上限提高/2%<enter>600秒下衣耐久回复/3";giveClause =function() gl_aw_addLingShi(8008,3,7) end}, 60},
		               {{"1级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,1) end}, 89},
		               {{"2级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,2) end}, 89},
		               {{"3级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,3) end}, 89},
		               {{"4级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,4) end}, 89},
		               {{"5级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,5) end}, 40},
		               {{"6级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,6) end}, 20},
		               {{"7级承受伤害减半概率/1%<enter>生命上限提高/2%<enter>跑动速度/3%";giveClause =function() gl_aw_addLingShi(8009,3,7) end}, 10},
		               {{"1级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,1) end}, 60},
		               {{"2级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,2) end}, 60},
		               {{"3级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,3) end}, 60},
		               {{"4级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,4) end}, 60},
		               {{"5级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,5) end}, 60},
		               {{"6级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,6) end}, 60},
		               {{"7级生命上限增加/1<enter>内功点数防御增加/2<enter>外功点数防御增加/3";giveClause =function() gl_aw_addLingShi(8010,3,7) end}, 60},
		               {{"1级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,1) end}, 89},
		               {{"2级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,2) end}, 89},
		               {{"3级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,3) end}, 89},
		               {{"4级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,4) end}, 89},
		               {{"5级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,5) end}, 40},
		               {{"6级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,6) end}, 20},
		               {{"7级受伤转化内力/1%<enter>内力上限提高/2%<enter>武功耗内降低/3%";giveClause =function() gl_aw_addLingShi(8011,3,7) end}, 10},
		               {{"1级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,1) end}, 60},
		               {{"2级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,2) end}, 60},
		               {{"3级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,3) end}, 60},
		               {{"4级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,4) end}, 60},
		               {{"5级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,5) end}, 60},
		               {{"6级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,6) end}, 60},
		               {{"7级武功打断概率降低/1%<enter>力量增加/2<enter>内功增加/3";giveClause =function() gl_aw_addLingShi(8012,3,7) end}, 60},
		               {{"1级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,1) end}, 89},
		               {{"2级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,2) end}, 89},
		               {{"3级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,3) end}, 89},
		               {{"4级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,4) end}, 89},
		               {{"5级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,5) end}, 40},
		               {{"6级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,6) end}, 20},
		               {{"7级内攻提高/1%<enter>内功增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8013,2,7) end}, 10},
		               {{"1级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,1) end}, 70},
		               {{"2级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,2) end}, 70},
		               {{"3级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,3) end}, 70},
		               {{"4级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,4) end}, 70},
		               {{"5级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,5) end}, 40},
		               {{"6级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,6) end}, 20},
		               {{"7级外攻提高/1%<enter>力量增加/2<enter>发挥最大攻击概率/3%";giveClause =function() gl_aw_addLingShi(8014,2,7) end}, 10},
		               {{"1级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,1) end}, 89},
		               {{"2级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,2) end}, 89},
		               {{"3级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,3) end}, 89},
		               {{"4级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,4) end}, 89},
		               {{"5级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,5) end}, 40},
		               {{"6级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,6) end}, 20},
		               {{"7级攻击使敌人外防削减/1%<enter>攻击使敌人外防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8015,2,7) end}, 10},
		               {{"1级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,1) end}, 70},
		               {{"2级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,2) end}, 70},
		               {{"3级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,3) end}, 70},
		               {{"4级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,4) end}, 70},
		               {{"5级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,5) end}, 40},
		               {{"6级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,6) end}, 20},
		               {{"7级攻击使敌人内防削减/1%<enter>攻击使敌人内防减少/2<enter>攻击使敌人根骨减少/3";giveClause =function() gl_aw_addLingShi(8016,2,7) end}, 10},
		               {{"1级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,1) end}, 70},
		               {{"2级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,2) end}, 70},
		               {{"3级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,3) end}, 70},
		               {{"4级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,4) end}, 70},
		               {{"5级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,5) end}, 40},
		               {{"6级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,6) end}, 20},
		               {{"7级破防攻击概率/1%<enter>命中值增加/2<enter>增加伤害/3";giveClause =function() gl_aw_addLingShi(8017,2,7) end}, 10},
		               {{"1级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,1) end}, 70},
		               {{"2级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,2) end}, 70},
		               {{"3级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,3) end}, 70},
		               {{"4级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,4) end}, 70},
		               {{"5级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,5) end}, 40},
		               {{"6级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,6) end}, 20},
		               {{"7级武功发招概率提高/1%<enter>会心概率提高/2%<enter>洞察增加/3";giveClause =function() gl_aw_addLingShi(8018,2,7) end}, 10},
		               {{"1级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,1) end}, 60},
		               {{"2级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,2) end}, 60},
		               {{"3级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,3) end}, 60},
		               {{"4级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,4) end}, 60},
		               {{"5级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,5) end}, 60},
		               {{"6级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,6) end}, 60},
		               {{"7级所有属性增加/1<enter>生命上限提高/2%<enter>600秒武器耐久回复/3";giveClause =function() gl_aw_addLingShi(8019,2,7) end}, 60},
		               {{"7级金钟罩持续时间永久<enter>无双金刚般若功间隔缩短5秒";giveClause =function() gl_aw_addLingShi(8020,2,7) end}, 20},
		               {{"7级金刚不坏持续时间永久<enter>无双无尘菩提功持续时间延长20%";giveClause =function() gl_aw_addLingShi(8021,2,7) end}, 20},
		               {{"7级慧眼咒持续时间永久<enter>无双潜龙寂灭功持续时间延长20%";giveClause =function() gl_aw_addLingShi(8022,2,7) end}, 20},
		               {{"7级心眼，秋毫明察持续时间永久<enter>无双天罗连珠网施展速度提高30%";giveClause =function() gl_aw_addLingShi(8023,2,7) end}, 20},
		               {{"7级流水诀持续时间永久<enter>莲华心经间隔清0";giveClause =function() gl_aw_addLingShi(8024,2,7) end}, 20},
		               {{"7级覆水心法间隔缩短2秒<enter>无双碧海绝音曲间隔缩短4秒";giveClause =function() gl_aw_addLingShi(8025,2,7) end}, 20},
		               {{"7级醉蝶，通臂拳持续时间永久<enter>无双混沌镇岳掌伤害提高20%";giveClause =function() gl_aw_addLingShi(8026,2,7) end}, 20},
		               {{"7级泥鳅功持续时间永久<enter>无双揆天游龙棍间隔缩短3秒";giveClause =function() gl_aw_addLingShi(8027,2,7) end}, 20},
		               {{"7级无我心法持续时间永久<enter>无双幻影迷踪剑间隔缩短5秒%";giveClause =function() gl_aw_addLingShi(8028,2,7) end}, 20},
		               {{"7级太乙逍遥功持续时间永久<enter>无双君子截风诀间隔缩短3秒";giveClause =function() gl_aw_addLingShi(8029,2,7) end}, 20},
		               {{"7级杨家战定诀持续时间永久<enter>无双镇军飞龙枪持续时间延长20%";giveClause =function() gl_aw_addLingShi(8030,2,7) end}, 20},
		               {{"7级杨家幻神诀持续时间永久<enter>无双穿云落虹箭间隔缩短6秒";giveClause =function() gl_aw_addLingShi(8031,2,7) end}, 20},
		               {{"7级邪毒功，催尸邪气持续时间永久<enter>无双幽冥封魔心法分摊伤害增加5%";giveClause =function() gl_aw_addLingShi(8032,2,7) end}, 20},
		               {{"7级香蛊持续时间永久<enter>无双幻灵蛊持续时间延长50%";giveClause =function() gl_aw_addLingShi(8033,2,7) end}, 20},
		               {{"7级仙风流散诀持续时间永久<enter>无双九天风雷诀间隔缩短5秒";giveClause =function() gl_aw_addLingShi(8034,2,7) end}, 20},
		               {{"7级金炉护体持续时间永久<enter>无双回锋斩日功持续时间延长50%";giveClause =function() gl_aw_addLingShi(8035,2,7) end}, 20},
		               {{"7级光明笔法持续时间永久<enter>无双负旗行阵令间隔缩短3秒";giveClause =function() gl_aw_addLingShi(8036,2,7) end}, 20},
		               {{"7级追魂印间隔缩短5秒<enter>无双凝血封魂印持续时间延长30%%";giveClause =function() gl_aw_addLingShi(8037,2,7) end}, 20},
		               {{"7级百花心经间隔缩短2秒<enter>无双风花千叶间隔缩短3秒";giveClause =function() gl_aw_addLingShi(8038,2,7) end}, 20},
		               {{"7级杀意持续时间永久<enter>无双迷踪侠影步间隔缩短3秒";giveClause =function() gl_aw_addLingShi(8039,2,7) end}, 20},
		               {{"7级天火艳阳  出招概率增加15%持续时间永久";giveClause =function() gl_aw_addLingShi(8040,2,7) end}, 20},

















		
		},
		giveClause = ClauseRandom.giveClause,
	},
};



--给灵石
function gl_aw_addLingShi(nId,nWz,nLv)
AddLingShi(nId,nWz,nLv);
end;
