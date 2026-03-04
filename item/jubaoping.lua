--聚灵鼎脚本
--by vivi
--09/14/2007
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua")
Include("\\script\\lib\\lingshi_info.lua")
Include("\\script\\lib\\lingshipeifang_info.lua")
Include("\\script\\class\\ktabfile.lua")

lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
--临时变量
TT_LINGSHI_LV = 120; --记录玩家选择取出灵石的等级
TT_LINGSHI_PF_LV = 121; --记录玩家选择取出灵石配方的等级
TT_LINGSHI_CHANGE_LV = 123; --记录玩家选择兑换高级灵石时的消耗的灵石等级
TT_LSPF_CHANGE_LV = 124; --记录玩家选择兑换高级灵石配方时的消耗的灵石配方等级

--任务变量
TASK_LINGSHI_QINGLING = 2335; --对灵石负数清0处理，执行一次
TASK_PF_QINGLING = 2336; --对灵石配方负数清0处理，执行一次

--消耗随机次数权值表
tRandNum ={--属性名	id	位置	最低等级	是否随机	消耗随机次数	等级1-7权值
{"武器磨损概率降低",9,2,1,0,1,1,1,1,1,2,2,2},
{"负重上限增加",110,2,1,0,1,1,1,1,1,2,2,2},
{"负重上限增加",110,0,1,0,1,1,1,1,1,2,2,2},
{"负重上限增加",110,1,1,0,1,1,1,1,1,2,2,2},
{"负重上限增加",110,3,1,0,1,1,1,1,1,2,2,2},
{"生命上限增加",11,0,1,0,3,1,1,1,1,2,2,2},
{"生命上限增加",11,1,1,0,3,1,1,1,1,2,2,2},
{"生命上限增加",11,3,1,0,3,1,1,1,1,2,2,2},
{"杀死敌人生命回复" ,333,2,1,0,2,1,1,1,1,2,2,2},
{"600秒武器耐久回复",43,2,1,1,2,1,1,1,1,2,2,2},
{"600秒上衣耐久回复",112,1,1,1,2,1,1,1,1,2,2,2},
{"600秒帽子耐久回复",113,0,1,1,2,1,1,1,1,2,2,2},
{"600秒下衣耐久回复",114,3,1,1,2,1,1,1,1,2,2,2},
{"装备需求等级减少",334,0,6,1,3,1,1,1,1,2,2,2},
{"装备需求等级减少"	,334,1,6,1,3,1,1,1,1,2,2,2},
{"装备需求等级减少"	,334,3,6,1,3,1,1,1,1,2,2,2},
{"范围攻击概率",335,2,1,0,3,1,1,1,1,2,2,2},
{"武器外攻上限增加",65,2,1,0,3,1,1,1,1,2,2,2},
{"武器外攻下限增加"	,66,2,1,0,3,1,1,1,1,2,2,2},
{"武器内攻上限增加"	,67,2,1,0,3,1,1,1,1,2,2,2},
{"武器内攻下限增加"	,68,2,1,0,3,1,1,1,1,2,2,2},
{"药效时间延长",39,0,1,0,2,1,1,2,2,3,3,4},
{"体力上限提高",336,1,1,0,4,1,1,2,2,3,3,4},
{"攻速提高",77,2,1,1,3,1,1,2,2,3,3,4},
{"命中值增加",337,2,1,0,4,1,1,2,2,3,3,4},
{"闪避值增加",338,3,1,0,5,1,1,2,2,3,3,4},
{"反弹伤害",339,1,1,0,5,1,1,2,2,3,3,4},
{"每10秒内力回复",340,0,5,1,5,1,1,2,2,3,3,4},
{"每10秒内力回复",340,1,5,1,5,1,1,2,2,3,3,4},
{"每10秒内力回复",340,3,5,1,5,1,1,2,2,3,3,4},
{"每10秒生命回复",341,0,5,1,5,1,1,2,2,3,3,4},
{"每10秒生命回复",341,1,5,1,5,1,1,2,2,3,3,4},
{"每10秒生命回复",341,3,5,1,5,1,1,2,2,3,3,4},
{"会心概率提高",342,2,1,0,4,1,1,2,2,3,3,4},
{"内功防御增加",343,0,1,0,4,1,1,2,2,3,3,4},
{"内功防御增加",343,1,1,0,4,1,1,2,2,3,3,4},
{"内功防御增加",343,3,1,0,4,1,1,2,2,3,3,4},
{"外功防御增加",344,0,1,0,4,1,1,2,2,3,3,4},
{"外功防御增加",344,1,1,0,4,1,1,2,2,3,3,4},
{"外功防御增加",344,3,1,0,4,1,1,2,2,3,3,4},
{"武功耗内降低",345,0,1,0,5,1,1,2,2,3,3,4},
{"发挥最大攻击概率",346,2,1,0,5,1,1,2,2,3,3,4},
{"一定概率使敌人气血受损",53,2,4,0,5,1,1,2,2,3,3,4},
{"一定概率使敌人真元受损",54,2,4,0,5,1,1,2,2,3,3,4},
{"毒伤害减少",347,0,1,0,4,1,1,2,2,3,3,4},
{"毒伤害减少",347,1,1,0,4,1,1,2,2,3,3,4},
{"毒伤害减少",347,3,1,0,4,1,1,2,2,3,3,4},
{"攻击使敌人力量减少",348,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人根骨减少",349,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人内功减少",350,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人洞察减少",351,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人身法减少",352,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人外防减少",353,2,1,0,5,1,1,2,2,3,3,4}, 
{"攻击使敌人内防减少",354,2,1,0,5,1,1,2,2,3,3,4},
{"受伤动作时间缩短",355,1,1,0,5,1,1,2,2,3,3,4},
{"武功打断概率降低",356,1,3,0,6,1,1,2,2,3,3,4},
{"根骨增加",357,2,1,0,5,1,1,2,2,3,3,4},
{"根骨增加",357,0,1,0,5,1,1,2,2,3,3,4},
{"根骨增加",357,1,1,0,5,1,1,2,2,3,3,4},
{"根骨增加",357,3,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,2,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,0,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,1,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,3,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,2,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,0,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,1,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,3,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,2,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,0,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,1,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,3,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,2,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,0,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,1,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,3,1,0,5,1,1,2,2,3,3,4},
{"抗中毒概率",100,0,1,0,6,1,1,2,2,3,3,4},
{"抗中毒概率",100,1,1,0,6,1,1,2,2,3,3,4},
{"抗中毒概率",100,3,1,0,6,1,1,2,2,3,3,4},
{"受伤转化内力",46,0,5,1,6,1,1,2,2,3,3,4},
{"受伤转化内力",46,1,5,1,6,1,1,2,2,3,3,4},
{"攻击损耗敌人内力",49,2,5,0,6,1,2,2,3,3,4,5},
{"破防攻击概率",362,2,5,0,7,1,2,2,3,3,4,5},
{"攻击附带毒伤害",363,2,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,2,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,0,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,1,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,3,1,0,7,1,2,2,3,3,4,5},
{"内力上限提高-%",80,2,1,0,6,1,2,2,3,3,4,5},
{"内力上限提高-%",80,0,1,0,6,1,2,2,3,3,4,5},
{"内力上限提高-%",80,1,1,0,6,1,2,2,3,3,4,5},
{"内力上限提高-%",80,3,1,0,6,1,2,2,3,3,4,5},
{"必闪",364,1,3,0,6,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,0,1,0,7,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,2,1,0,7,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,1,1,0,7,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,3,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,0,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,2,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,1,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,3,1,0,7,1,2,2,3,3,4,5},
{"攻击使敌人外防削减",382,2,1,0,7,1,2,2,3,3,4,5},
{"攻击使敌人内防削减",383,2,1,0,7,1,2,2,3,3,4,5},
{"承受伤害减半概率",365,0,5,0,7,1,2,2,3,3,4,5},
{"承受伤害减半概率",365,1,5,0,7,1,2,2,3,3,4,5},
{"承受伤害减半概率",365,3,5,0,7,1,2,2,3,3,4,5},
{"经验获得提高",366,2,5,1,5,2,2,3,3,3,4,5},
{"经验获得提高",366,0,5,1,5,2,2,3,3,3,4,5},
{"经验获得提高",366,1,5,1,5,2,2,3,3,3,4,5},
{"经验获得提高",366,3,5,1,5,2,2,3,3,3,4,5},
{"减速回避概率",373,3,4,0,8,2,2,3,3,3,4,5},
{"迟缓回避概率",374,3,4,0,8,2,2,3,3,3,4,5},
{"击退回避概率",375,3,4,0,8,2,2,3,3,3,4,5},
{"击倒回避概率",376,3,4,0,8,2,2,3,3,3,4,5},
{"麻痹回避概率",377,0,4,0,8,2,2,3,3,3,4,5},
{"眩晕回避概率",378,0,4,0,8,2,2,3,3,3,4,5},
{"定身回避概率",379,0,4,0,8,2,2,3,3,3,4,5},
{"混乱回避概率",380,1,4,0,8,2,2,3,3,3,4,5},
{"睡眠回避概率",381,1,4,0,8,2,2,3,3,3,4,5},
{"外防降低",18,1,1,0,8,2,2,3,3,3,4,5},
{"内防降低",19,1,1,0,8,2,2,3,3,3,4,5},
{"增加伤害",372,2,3,0,7,2,2,3,3,3,4,5},
{"所有属性增加",367,2,3,0,8,2,2,3,3,3,4,5},
{"所有属性增加",367,0,3,0,8,2,2,3,3,3,4,5},
{"所有属性增加",367,1,3,0,8,2,2,3,3,3,4,5},
{"所有属性增加",367,3,3,0,8,2,2,3,3,3,4,5},
{"外攻提高",368,2,3,0,8,2,2,3,3,3,4,5},
{"内攻提高",369,2,3,0,8,2,2,3,3,3,4,5},
{"武功发招概率提高",370,2,4,0,8,2,2,3,3,3,4,5},
{"武功施展速度提高",371,0,3,0,8,2,2,3,3,4,5,6},
----属性名	        id	  位置  最低等级   是否随机	消耗随机次数	等级1-7权值
--{"外防降低"                ,4865,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"内防降低"                ,4866,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"所有属性增加"            ,4867,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"所有属性增加"            ,4867,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"所有属性增加"            ,4867,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"所有属性增加"            ,4867,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"外攻提高"                ,4868,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"内攻提高"                ,4869,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"武功施展速度提高"        ,4870,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"增加伤害"                ,4870,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"攻击使敌人外防削减"      ,4874,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"攻击使敌人内防削减"      ,4875,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"承受伤害减半概率"        ,4876,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"承受伤害减半概率"        ,4876,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"承受伤害减半概率"        ,4876,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"根骨增加"                ,4877,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"根骨增加"                ,4877,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"根骨增加"                ,4877,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"根骨增加"                ,4877,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"力量增加"                ,4878,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"力量增加"                ,4878,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"力量增加"                ,4878,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"力量增加"                ,4878,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"身法增加"                ,4879,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"身法增加"                ,4879,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"身法增加"                ,4879,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"身法增加"                ,4879,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"洞察增加"                ,4880,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"洞察增加"                ,4880,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"洞察增加"                ,4880,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"洞察增加"                ,4880,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"内功增加"                ,4881,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"内功增加"                ,4881,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"内功增加"                ,4881,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"内功增加"                ,4881,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"减速回避概率"            ,4882,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"迟缓回避概率"            ,4883,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"击退回避概率"            ,4884,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"击倒回避概率"            ,4885,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"麻痹回避概率"            ,4886,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"眩晕回避概率"            ,4887,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"定身回避概率"            ,4888,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"混乱回避概率"            ,4889,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"睡眠回避概率"            ,4890,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"受伤动作时间缩短"        ,4891,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"生命上限提高-%"          ,4892,  0,      5,       0,      8,             2,2,3,3,4,5,6},
--{"生命上限提高-%"          ,4892,  1,      5,       0,      8,             2,2,3,3,4,5,6},
--{"生命上限提高-%"          ,4892,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"生命上限提高-%"          ,4892,  3,      5,       0,      8,             2,2,3,3,4,5,6},
--{"破防攻击概率"            ,4893,  2,      5,       0,      8,             2,2,3,3,4,5,6},
--{"武功打断概率降低"        ,4894,  1,      5,       0,      8,             2,2,3,3,4,5,6}


}

function OnUse()
	local selTab = {};
	local szTitle = format("<color=green>聚灵鼎<color>：此乃可容纳世间灵气的仙境之物，你想要知道什么？")
	tinsert(selTab,"我有那些灵石/which_lingshi");
--	tinsert(selTab,"我有哪些灵石配方/which_lingshi_pf");
--	tinsert(selTab,"指定灵石和灵石配方兑换/zhiding_main");
	tinsert(selTab,"我要消耗一定次数获得指定灵石/zhiding_lingshi");
	tinsert(selTab,"我要把低级灵石的随机次数兑换成高级的/zhiding_lingshi_gaoji");
	tinsert(selTab,"如何兑换/how_change");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function which_lingshi()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","请先解锁储物箱");
		return 0;
	end;
	local strtab = {};
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	if GetTask(TASK_LINGSHI_QINGLING) == 0 then
		for j=1,getn(tLingshiTask) do
			if GetTask(tLingshiTask[j]) < 0 then
				SetTask(tLingshiTask[j],0);
			end
		end
		SetTask(TASK_LINGSHI_QINGLING,1);
	end
	for i=1,getn(tLingshiTask) do
		if GetTask(tLingshiTask[i]) > 0 then
			tinsert(strtab,i.."级灵石（"..GetTask(tLingshiTask[i]).."颗）/#quchu_lingshi("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>聚灵鼎<color>：你目前没有灵石放在我这里哦。");
	else
		tinsert(strtab,"返回/OnUse")
		Say("<color=green>聚灵鼎<color>：请选择你要取出哪些灵石？",
			getn(strtab),
			strtab)
	end
end

function quchu_lingshi(nLv)	
	Say("<color=green>聚灵鼎<color>：你确认要取出"..nLv.."级灵石吗?",
		2,
		"是的，我要取出/#lingshi_num("..nLv..")",
		"不是，我选错了/which_lingshi")
end

function lingshi_num(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	local nNum = GetTask(tLingshiTask[nLv]);
	SetTaskTemp(TT_LINGSHI_LV,nLv);
	AskClientForNumber("confirm_give_lingshi", 1, tonumber(nNum), "取出多少颗"..nLv.."灵石");
end

function confirm_give_lingshi(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_LV);
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	if nCount > GetTask(tLingshiTask[nLv]) then
		return
	else
		for i=1,nCount do
			ls_AddRandomLingShi(SYS_TB_LINGSHI_MINLEVEL,nLv,nLv);
		end
		Msg2Player("您取出了"..nLv.."级灵石"..nCount.."颗");
		if nLv >= 6 then
			WriteLog("聚灵鼎："..GetName().."取出了"..nLv.."级灵石"..nCount.."颗");
		end
		SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_LV,0);
	end		
end

function which_lingshi_pf()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","请先解锁储物箱");
		return 0;
	end;
	local strtab = {};
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(TASK_PF_QINGLING) == 0 then
		for i=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[i]) == -1 then
				SetTask(tPeifangTask[i],1);
				WriteLog("聚灵鼎："..GetName().."的"..i.."级的灵石配方写入TASK 1")
			end
		end		
		for j=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[j]) < 0 then
				SetTask(tPeifangTask[j],0);
			end
		end
		SetTask(TASK_PF_QINGLING,1);
	end 
	for i=1,getn(tPeifangTask) do
		if GetTask(tPeifangTask[i]) > 0 then
			tinsert(strtab,i.."级灵石配方（"..GetTask(tPeifangTask[i]).."个）/#quchu_peifang("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>聚灵鼎<color>：你目前没有灵石配方放在我这里哦。");
	else
		tinsert(strtab,"返回/OnUse")
		Say("<color=green>聚灵鼎<color>：请选择你要取出哪些灵石配方？",
			getn(strtab),
			strtab)
	end
end

function quchu_peifang(nLv)
	Say("<color=green>聚灵鼎<color>：你确认要取出"..nLv.."级灵石配方吗?",
		2,
		"是的，我要取出/#peifang_num("..nLv..")",
		"不是，我选错了/which_lingshi_pf")	
end

function peifang_num(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local nNum = GetTask(tPeifangTask[nLv]);
	SetTaskTemp(TT_LINGSHI_PF_LV,nLv);
	AskClientForNumber("confirm_give_peifang", 1, tonumber(nNum), "取出多少个"..nLv.."灵石配方");												
end

function confirm_give_peifang(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_PF_LV);
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if nCount > GetTask(tPeifangTask[nLv]) then
		return
	else
		for i=1,nCount do
			lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLv,nLv);
		end
		Msg2Player("您取出了"..nLv.."级灵石配方"..nCount.."本");
		if nLv >= 6 then
			WriteLog("聚灵鼎："..GetName().."取出了"..nLv.."级灵石配方"..nCount.."本");
		end		
		SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_PF_LV,0);															
	end
end
function zhiding_main()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","请先解锁储物箱");
		return 0;
	end;
	local strtab = {
		"我要消耗一定次数获得指定灵石/zhiding_lingshi",
--		"我要消耗随机次数获得指定灵石配方/zhiding_peifang",
--		"我要消耗随机次数获得珍稀物品（月华等物品）/zhiding_yuehua",
--		"我要把低级灵石和配方的随机次数兑换成高级/zhiding_gaoji",
		"返回/OnUse",
		"暂时不进行兑换/nothing"
		}
	Say("<color=green>聚灵鼎<color>：你可以将多次获得灵石的机会消耗掉来获得指定灵石和灵石配方，以及一些其它的珍稀物品。",
		getn(strtab),
		strtab)
end

function zhiding_lingshi()
	local strtab = {};
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	local tLingshiLv = {1,2,3,4,5,6,7}
	local tNum = {1,2,3,5,10,15,20};
	for i=1,getn(tLingshiTask) do
		if GetTask(tLingshiTask[i]) > 0 then
			tinsert(strtab,"我想消耗"..tNum[i].."次["..i.."级灵石]随机次数来指定特定属性/#lingshi_zhiding_lv("..tLingshiLv[i]..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>聚灵鼎<color>：你目前没有灵石放在这里，也就无法指定了。");
	else
		tinsert(strtab,"返回/OnUse")
		Say("<color=green>聚灵鼎<color>：请选择你要指定的灵石等级。",
			getn(strtab),
			strtab)
	end
end

function lingshi_zhiding_lv(nLv)
	local strtab = {
		"帽子/#lingshi_zhiding_wz("..nLv..",0,0)",
		"衣服/#lingshi_zhiding_wz("..nLv..",1,0)",
		"武器/#lingshi_zhiding_wz("..nLv..",2,0)",
		"裤子/#lingshi_zhiding_wz("..nLv..",3,0)",
		"返回/zhiding_lingshi",
		"暂时不兑换了/nothing"
		}
	Say("<color=green>聚灵鼎<color>：请选择你要指定灵石的镶嵌位置。",
		getn(strtab),
		strtab)
end

function lingshi_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --对应tRandNum表的索引
	for i = 1,getn(tRandNum) do
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lingshi_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"返回/#lingshi_zhiding_lv("..nLv..")");
	tinsert(strtab,"暂时不兑换了/nothing");
	Say("<color=green>聚灵鼎<color>：请选择你想要兑换的灵石属性。",
		getn(strtab),
		strtab);	
end

function confirm_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"帽子","衣服","武器","裤子"};
	local tNum = {1,2,3,5,10,15,20};
	Say("<color=green>聚灵鼎<color>：你将消耗<color=yellow>"..tNum[nLv].."<color>次[<color=yellow>"..nLv.."级<color>]灵石随机次数兑换灵石属性为(<color=yellow>"..tRandNum[nIdx][1].."<color>)，镶嵌位置为(<color=yellow> "..tWz[nWz+1].."<color>) 的["..nLv.."级]灵石1颗，你确定吗？",
		2,
		"是的，我要兑换/#give_lingshi_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"暂时不兑换了/nothing")
end

function give_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local tNum = {1,2,3,5,10,15,20};
	local nNum = tNum[nLv];
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的石头。");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
--	AddLingShi(nId,nWz,nLv);
	Msg2Player("您获得"..nLv.."级灵石10颗");
	if nLv >= 6 then
		WriteLog("聚灵鼎："..GetName().."获得"..nNum.."颗 "..nLv.."级灵石");
	end
end

function zhiding_peifang()
	local strtab = {
		"指定1级特定属性的灵石配方/#lspf_zhiding_lv(1)",
		"指定2级特定属性的灵石配方/#lspf_zhiding_lv(2)",
		"指定3级特定属性的灵石配方/#lspf_zhiding_lv(3)",
		"指定4级特定属性的灵石配方/#lspf_zhiding_lv(4)",
		"指定5级特定属性的灵石配方/#lspf_zhiding_lv(5)",
		"指定6级特定属性的灵石配方/#lspf_zhiding_lv(6)",
		"返回/zhiding_main"
		}
	Say("<color=green>聚灵鼎<color>：请选择你要指定的灵石配方属性等级。",
		getn(strtab),
		strtab)		
end

function lspf_zhiding_lv(nLv)
	local strtab = {
		"帽子/#lspf_zhiding_wz("..nLv..",0,0)",
		"衣服/#lspf_zhiding_wz("..nLv..",1,0)",
		"武器/#lspf_zhiding_wz("..nLv..",2,0)",
		"裤子/#lspf_zhiding_wz("..nLv..",3,0)",
		"返回/zhiding_peifang",
		"暂时不兑换了/nothing"
		}
	Say("<color=green>聚灵鼎<color>：请选择你要指定灵石配方的镶嵌位置。",
		getn(strtab),
		strtab)	
end

function lspf_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --对应tRandNum表的索引
	for i = 22,getn(tRandNum) do --注意这里！tRandNum表的前21项属性是没有配方的！
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lspf_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"返回/#lspf_zhiding_lv("..nLv..")");
	tinsert(strtab,"暂时不兑换了/nothing");
	Say("<color=green>聚灵鼎<color>：请选择你想要兑换的灵石配方属性。",
		getn(strtab),
		strtab);	
end

function confirm_lspf_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"帽子","衣服","武器","裤子"};
	Say("<color=green>聚灵鼎<color>：你将消耗<color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color>次"..nLv.."级灵石配方随机次数兑换属性为<color=yellow>1"..tRandNum[nIdx][1].."<color>，镶嵌位置为 <color=yellow> "..tWz[nWz+1].."<color>的"..nLv.."级灵石配方1本，你确定吗？",
		2,
		"是的，我确定兑换/#give_lspf_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"暂时不兑换了/nothing")	
end

function give_lspf_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的石头配方。");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nPfid1,nPfid2,nPfid3 = 0,0,0;		
	for i=2,lingshi_pf:getRow() do
		if tonumber(lingshi_pf:getCell(i,44)) == nId and tonumber(lingshi_pf:getCell(i,45)) == nWz and tonumber(lingshi_pf:getCell(i,46)) == nLv then
			if lingshi_pf:getCell(i,43) ~= "" then
				nPfid1 = tonumber(lingshi_pf:getCell(i,41));
				nPfid2 = tonumber(lingshi_pf:getCell(i,42));
				nPfid3 = tonumber(lingshi_pf:getCell(i,43));
				break
			end
		end
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	if AddItem(nPfid1,nPfid2,nPfid3,1) == 1 then
		Msg2Player("您获得"..nLv.."级灵石配方1本");
		if nLv >= 6 then
			WriteLog("聚灵鼎："..GetName().."获得"..nNum.."本"..nLv.."级灵石配方");
		end
	else
		WriteLog("聚灵鼎："..GetName().."兑换"..nNum.."本"..nLv.."级灵石配方失败")
	end
end

function zhiding_gaoji()
	local strtab = {
		"我要把低级灵石的随机次数兑换成高级的/zhiding_lingshi_gaoji",
		"我要把低级灵石配方的随机次数兑换成高级的/zhiding_lspf_gaoji",
		"返回/zhiding_main",
		"暂时不兑换了/nothing"
		}
	Say("<color=green>聚灵鼎<color>：你要兑换灵石还是灵石配方呢？",
		getn(strtab),
		strtab)	
end

function zhiding_lingshi_gaoji()
	local tNum = {3,3,5,10,20};
	local strtab = {
		"我要消耗"..tNum[1].."个[1级灵石]随即次数兑换2级灵石/#ls_change_high(1)",
		"我要消耗"..tNum[2].."个[2级灵石]随即次数兑换3级灵石/#ls_change_high(2)",
		"我要消耗"..tNum[3].."个[3级灵石]随即次数兑换4级灵石/#ls_change_high(3)",
		"我要消耗"..tNum[4].."个[4级灵石]随即次数兑换5级灵石/#ls_change_high(4)",
--		"我要消耗"..tNum[5].."个[5级灵石]随即次数兑换6级灵石/#ls_change_high(5)",
		"返回/OnUse",
		"暂时不兑换了/nothing"
		}
	Say("<color=green>聚灵鼎<color>：选择你想要兑换的灵石等级。",
		getn(strtab),
		strtab)		
end

function ls_change_high(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	local tNum = {3,3,5,10,20};
	if GetTask(tLingshiTask[nLv]) < tNum[nLv] then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的灵石。");
		return
	end	
	local nCount = floor(GetTask(tLingshiTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LINGSHI_CHANGE_LV,nLv);
	AskClientForNumber("confirm_ls_change_high", 1, tonumber(nCount), "兑换多少颗"..(nLv+1).."级灵石");
end

function confirm_ls_change_high(nCount)
	local nLv = GetTaskTemp(TT_LINGSHI_CHANGE_LV);
	local tNum = {3,3,5,10,20};
	local nNum = tNum[nLv]*nCount;
	Say("<color=green>聚灵鼎<color>：你确定消耗"..nNum.."次"..nLv.."灵石随机次数兑换"..nCount.."颗"..(nLv+1).."级灵石吗？",
		3,
		"确定/#give_ls_change_high("..nLv..","..nNum..","..nCount..")",
		"我选错了，返回/zhiding_lingshi_gaoji",
		"暂时不兑换了/nothing")
end

function give_ls_change_high(nLv,nNum,nCount)  --消耗的等级  消耗的等级次数 兑换的等级个数
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的灵石。");
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	SetTask(tLingshiTask[nLv+1],GetTask(tLingshiTask[nLv+1])+nCount);
	Msg2Player("您获得"..(nLv+1).."级灵石"..nCount.."颗，你可以通过聚灵鼎取出它。 ");	
end

function zhiding_lspf_gaoji()
	local strtab = {
		"我要消耗1级灵石配方随机次数兑换2级灵石配方/#lspf_change_high(1)",
		"我要消耗2级灵石配方随机次数兑换3级灵石配方/#lspf_change_high(2)",
		"我要消耗3级灵石配方随机次数兑换4级灵石配方/#lspf_change_high(3)",
		"我要消耗4级灵石配方随机次数兑换5级灵石配方/#lspf_change_high(4)",
		"我要消耗5级灵石配方随机次数兑换6级灵石配方/#lspf_change_high(5)",
		"返回/zhiding_gaoji",
		"暂时不兑换了/nothing"
		}
	Say("<color=green>聚灵鼎<color>：选择你想要兑换的灵石配方等级。（兑换数量将在下一步确认）",
		getn(strtab),
		strtab)		
end

function lspf_change_high(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local tNum = {3,3,5,5,5};
	if GetTask(tPeifangTask[nLv]) < tNum[nLv] then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的灵石配方。");
		return
	end
	local nCount = floor(GetTask(tPeifangTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LSPF_CHANGE_LV,nLv);
	AskClientForNumber("confirm_lspf_change_high", 1, tonumber(nCount), "兑换多少本"..(nLv+1).."级灵石配方");
end

function confirm_lspf_change_high(nCount)
	local nLv = GetTaskTemp(TT_LSPF_CHANGE_LV);
	local tNum = {3,3,5,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("<color=green>聚灵鼎<color>：你确定消耗"..nNum.."次"..nLv.."灵石配方随机次数兑换"..nCount.."本"..(nLv+1).."级灵石配方吗？",
		3,
		"确定/#give_lspf_change_high("..nLv..","..nNum..","..nCount..")",
		"我选错了，返回/zhiding_lspf_gaoji",
		"暂时不兑换了/nothing")
end

function give_lspf_change_high(nLv,nNum,nCount)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的灵石配方。");
		return
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	SetTask(tPeifangTask[nLv+1],GetTask(tPeifangTask[nLv+1])+nCount);
	Msg2Player("您获得"..(nLv+1).."级灵石配方"..nCount.."本，你可以通过聚灵鼎取出它。 ");
end

function zhiding_yuehua()
	local strtab = {
		"我要消耗5次5级灵石随机次数兑换1个月华/lingshi_change_yuehua",
		"我要消耗5次5级灵石配方随机次数兑换1个天地玄黄石/lspf_change_stone",
		"返回/zhiding_main",
		"暂时不兑换了/nothing"
		}
	Say("<color=green>聚灵鼎<color>：请选择你要兑换的物品。",
		getn(strtab),
		strtab)	
end

function lingshi_change_yuehua()
	Say("<color=green>聚灵鼎<color>：你确定消耗5次5级灵石随机次数兑换1个月华吗？",
		3,
		"确定/confirm_lingshi_yuehua",
		"返回/zhiding_yuehua",
		"暂时不兑换了/nothing")
end

function confirm_lingshi_yuehua()
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[5]) < 5 then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的灵石。");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[5],GetTask(tLingshiTask[5])-5);
	if AddItem(2,1,2002,1) == 1 then
		Msg2Player("你获得月华1个");
	end		
end

function lspf_change_stone()
	Say("<color=green>聚灵鼎<color>：你确定消耗5次5级灵石配方随机次数兑换1个天地玄黄石吗？",
		3,
		"确定/confirm_lspf_stone",
		"返回/zhiding_yuehua",
		"暂时不兑换了/nothing")
end

function confirm_lspf_stone()
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[5]) < 5 then
		Talk(1,"","<color=green>聚灵鼎<color>：你没有足够的随机次数来兑换你所需要的灵石配方。");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tPeifangTask[5],GetTask(tPeifangTask[5])-5);
	if AddItem(2,1,1151,1) == 1 then
		Msg2Player("你获得天地玄黄石1个");
	end		
end

function how_change()
	Talk(1,"how_change2","<color=green>聚灵鼎<color>：聚灵鼎中储存的灵石是没有确定属性的，直接取出可能会随机到任何一种属性。您可以通过消耗在聚灵鼎中某一等级一定数量的灵石，来指定获得同等级的某一属性灵石，这样获得的灵石属性不会随机，一定是你指定的属性。同样的，指定配方也是如此。")
end

function how_change2()
	Talk(1,"how_change3","<color=green>聚灵鼎<color>：您也可以将低级的聚灵鼎中的低级灵石转化为高级灵石，比如您聚灵鼎中存放了10颗4级灵石，您可以通过转化把它们在聚灵鼎中转化为2颗5级灵石，不同等级转化所要消耗的灵石数量也是不同的。")
end

function how_change3()
	Talk(1,"OnUse","<color=green>聚灵鼎<color>：灵石和灵石配方在聚灵鼎中除了可以取出和转化外，也可以将它们转化为月华和天地玄黄石，这些具有独特效果的物品。")
end

function nothing()

end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","你的背包空间不足！")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","你的背包负重不足！")
			return 0
		else 
			return 1
		end
end